Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3869DED9F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 00:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAA310E0CA;
	Fri, 29 Nov 2024 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PTpZ5VFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBBB10E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 23:40:16 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53df1d1b6e8so2390701e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732923614; x=1733528414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fFIJ15vK6AL0/XEyDOqr8IDuIsuKOFXcC6R5E3c85xc=;
 b=PTpZ5VFfJtQ6nWuKgzh8JHWbI0RrhVA9fFgvKMA+ny6q67xGnHxbBdNoomsFoyeiyD
 8sAEXUhcq4oAoGxfY01udzE71Ng5sbvO3FCSOpv0aTqIPgeJONeF53n7lYtGHPa2z4zj
 dd4+T76WzCzxxf4cmiT0dwg8GEjIENB2oZ/MmhoOhmRCuJGXbK+enBBHRxawEVqOYzZZ
 y2AaIZuKK6SZrYWQY4bMardI5I3xB98ey/ipTzKRB4k3Rs5apNmK5eEfQLfiWiTFFsgZ
 6IDAtW7vfFk4CzyGNvs6mda1v6PYKgKuH1u7uUVFFOVzhTVnmyeojlonqas14nhFMATc
 OwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732923614; x=1733528414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFIJ15vK6AL0/XEyDOqr8IDuIsuKOFXcC6R5E3c85xc=;
 b=E5try6eqq5KY1uokFkOWEbZQD4lYqmAFSSrEHmtrg1m49jgd0wyW9c9lzQAfZ2ONXl
 x1yfdeibOHOj5YyZBv8ah6eUX8Sg4wUa0kyFCZbQ+WHxzw/yQFvaYNNyOFumBBCkXz+D
 O3jjYjVQP5IGFf9lr6aQ+DqP4GoXr+7A1FxC6VyyPaSna99mg+65s5Rg1choiXURK/1M
 qF2X0xx0EqubcBwnqJSy6OkbPDgvmjRg1qX/SjRfvVagkxF8J2hqYlngmaIf5WHttkIy
 kawAv77dAVCY+2py5F1Njj3F8kw1mDLxRoHSY/Cpa3pzukX6mvvUcd7Ly4JN5fF/4nYa
 UKgg==
X-Gm-Message-State: AOJu0Yxq73hDiqSWUMFSDNJXic4NYFCe6/GxQ4r+rIlo+J+dVVxXs7Rc
 ERnubiRFybcAaYUyz8VPIp/xOzmziWLW+uMAX8yl/xlwU3OrfcoVgHcMHkbWcho=
X-Gm-Gg: ASbGnctnCOsBzNCkNHFPfeZCqmcnkvMBR5wiQlPrqWZuYTx4FFM/MNAniOfmR7FZPrR
 tQJ++Wz0tCcUvlQnLsG4cjD2pwXNKuYdHdQ21UPOGtrBu4EgMf0rYJmKAXrV9vW9rXIHKTwWnrY
 H4bD3e3Xk2BoqxYelYysljKnELAMYOLzXTIx+ABKjwk5sknuclDiTFU2Wf0q8LImMwsvgrsqIUr
 WYyMbglXtuwuNsuzuskPJnC6I/OomYVhUuXwMl4W6Fn+DuCcLH3pC1F+laC1uKWEhnSr/+uokl5
 iZs+dhddWuUBm2gwBiVpgY2aSEWaqg==
X-Google-Smtp-Source: AGHT+IGoJh4OTQLh+h82l90O+jeU4ntpLt97DO7nRJ7Y1h//P8N3mwBdDwHYWiRxE9YZq7rc9ZC32A==
X-Received: by 2002:a05:6512:3b27:b0:53d:ec9a:4e6d with SMTP id
 2adb3069b0e04-53df01048ecmr4537499e87.46.1732923614118; 
 Fri, 29 Nov 2024 15:40:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443257sm613282e87.70.2024.11.29.15.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 15:40:12 -0800 (PST)
Date: Sat, 30 Nov 2024 01:40:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Derek Foreman <derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, kernel@collabora.com
Subject: Re: [PATCH] drm/connector: Allow clearing hdr infoframe
Message-ID: <wsiaadwjc3txltrj4ygtshebwscfxcytmdafrhp6uhkwdl3dvf@zy52jv6g6enm>
References: <20241129213801.617864-1-derek.foreman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129213801.617864-1-derek.foreman@collabora.com>
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

On Fri, Nov 29, 2024 at 03:38:01PM -0600, Derek Foreman wrote:
> When a display isn't presenting HDR content, the infoframe shouldn't be
> present at all. Currently if we set the HDR_OUTPUT_METADATA blob, we'll
> set a Dynamic Range and Mastering (DRM) infoframe. If we remove that
> blob later, the DRM infoframe will linger in its previous state, when
> we expect it to clear.
> 
> Disable the infoframe when no output metadata is present to prevent
> this from happening.
> 
> Fixes: f378b77227bc4 ("drm/connector: hdmi: Add Infoframes generation")
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>  1 file changed, 2 insertions(+)

The fix is fine, however please consider extending it to other infoframe
types. Clear infoframe->set in the beginning of the corresponding
function.

> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index feb7a3a75981..1cc4b49b1013 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -398,6 +398,8 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
>  		&infoframe->data.drm;
>  	int ret;
>  
> +	infoframe->set = false;
> +
>  	if (connector->max_bpc < 10)
>  		return 0;
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
