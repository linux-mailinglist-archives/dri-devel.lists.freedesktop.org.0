Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9089B85B1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D06C10E93D;
	Thu, 31 Oct 2024 21:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KLZ7+wPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34E610E93D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:47:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f8490856so1514014e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411272; x=1731016072; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=44veBpIl+GX243f33ENVvs6P/c3vJWxcpTOysMsCe2k=;
 b=KLZ7+wPl7ECU5gTyYoMjvRE49KD/hKR1BDy5kYRwqveH3BWpCI3n24xTPe4bOLxHpT
 FaWtu0N4yE8Pg317P/5U4GmvZHneU1fqjDnvV5DVWq/A+9o6yzK4wp8+VGWxm8OaQy2q
 g/EKvU8kpEraV3xGNx9ELgGgEwOwjTGolVS3KTEwRjZFb8OWOjtO2ypExwubf+OEfZcj
 IMuk0uAYD2j0Qy8DkI1OoFC40wzWv31Jm9J5y/6ORJvr/rNNkjvGxNTCZsM7jbWFmqEr
 6SD/SZH05QCqhhbuI8+xlNYyyZP4hU9n6+/3MZr3y3Bsy6hg4pRma3WSLJiKu0AY8iqF
 ehuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411272; x=1731016072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44veBpIl+GX243f33ENVvs6P/c3vJWxcpTOysMsCe2k=;
 b=vQFevcl7rLPjezfn/bHJFmNmKJOi/wdSp0D5ljwX7/kgGBetkLhmI1Y36cLgRCjJG/
 P+bCqcxxm9nPFjurcStbAYsDzhhCzpZopLeLimuVB16u35wrpQ8lZTTZ6eGAUs4z7hfC
 CFY85jHbm7EMm96fXJh2kKKlY8+Cj+8PFmP6G3My9YQSpYU/A0LzPJjcei8p01vvNwGk
 t0Kt1tRcf2DKee05Oa9brf1rIXeya5i90SCKg6g1zzHm/13/z1kY5jOEYv1aZHM6hqR7
 mU9Wd6xg2Fu9dNcQl7oBNgZPjtcnn4ElK9UjZbHatff71+bGpZnmY/Odt7r+BrmfbFK4
 0Nhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWumhgGMzwC4ahlErJDhStQUPCmffNmSB04YFQfuXLkXX6ASVea4jSZPNF9W5FthuWXKJ6lNJ3TPPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh5M+PSwBRhT5052dWn5qm5YJrCEgbbszSeoo1vkP8aaGKmscT
 ztGvyOFiOdxSgHPDTy0tydpBqirTBtS9CBDiTFTlM22FqbQUBolzNHAs9Q+/9xQ=
X-Google-Smtp-Source: AGHT+IEIapgg5DVnCXQcCKTJDdnsKNNws2VBmTMX5U5wUyPS2yMtmQ7RGuiNTdd+tOoV+nZ18wQmRA==
X-Received: by 2002:a05:6512:23a1:b0:52e:7ef1:7c6e with SMTP id
 2adb3069b0e04-53c79ea57edmr2543415e87.51.1730411271842; 
 Thu, 31 Oct 2024 14:47:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bde0a53sm336086e87.262.2024.10.31.14.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:47:50 -0700 (PDT)
Date: Thu, 31 Oct 2024 23:47:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: ville.syrjala@linux.intel.com, jfalempe@redhat.com, 
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Revert "drm/client: Add drm_client_modeset_check()"
Message-ID: <4ysvn7vcynvmjc53frgj2nwuctf6kd6xdphgfjm3ulgfaxwngm@mod6oqvfmxav>
References: <20241029234706.285087-1-linux@treblig.org>
 <20241029234706.285087-4-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029234706.285087-4-linux@treblig.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2024 at 11:47:05PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_client_modeset_check() was explicitly added in 2020 by
> commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
> but has never been used.
> 
> This reverts commit 64593f2a6fc933bb9a410bc3f8c261f3e57a9601.

Nit: Usually this comes before the commit message.  No need for repost
though.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 35 ++++------------------------
>  include/drm/drm_client.h             |  1 -
>  2 files changed, 4 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index cee5eafbfb81..39201c11eaac 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -995,7 +995,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
>  }
>  EXPORT_SYMBOL(drm_client_rotation);
>  
> -static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
> +static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
>  {
>  	struct drm_device *dev = client->dev;
>  	struct drm_plane *plane;
> @@ -1062,10 +1062,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
>  		}
>  	}
>  
> -	if (check)
> -		ret = drm_atomic_check_only(state);
> -	else
> -		ret = drm_atomic_commit(state);
> +	ret = drm_atomic_commit(state);
>  
>  out_state:
>  	if (ret == -EDEADLK)
> @@ -1126,30 +1123,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>  	return ret;
>  }
>  
> -/**
> - * drm_client_modeset_check() - Check modeset configuration
> - * @client: DRM client
> - *
> - * Check modeset configuration.
> - *
> - * Returns:
> - * Zero on success or negative error code on failure.
> - */
> -int drm_client_modeset_check(struct drm_client_dev *client)
> -{
> -	int ret;
> -
> -	if (!drm_drv_uses_atomic_modeset(client->dev))
> -		return 0;
> -
> -	mutex_lock(&client->modeset_mutex);
> -	ret = drm_client_modeset_commit_atomic(client, true, true);
> -	mutex_unlock(&client->modeset_mutex);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_client_modeset_check);
> -
>  /**
>   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
>   * @client: DRM client
> @@ -1168,7 +1141,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
>  
>  	mutex_lock(&client->modeset_mutex);
>  	if (drm_drv_uses_atomic_modeset(dev))
> -		ret = drm_client_modeset_commit_atomic(client, true, false);
> +		ret = drm_client_modeset_commit_atomic(client, true);
>  	else
>  		ret = drm_client_modeset_commit_legacy(client);
>  	mutex_unlock(&client->modeset_mutex);
> @@ -1246,7 +1219,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  
>  	mutex_lock(&client->modeset_mutex);
>  	if (drm_drv_uses_atomic_modeset(dev))
> -		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
> +		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
>  	else
>  		drm_client_modeset_dpms_legacy(client, mode);
>  	mutex_unlock(&client->modeset_mutex);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bc0e66f9c425..ead3c3526ee3 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -177,7 +177,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
>  void drm_client_modeset_free(struct drm_client_dev *client);
>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
> -int drm_client_modeset_check(struct drm_client_dev *client);
>  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
>  int drm_client_modeset_commit(struct drm_client_dev *client);
>  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
