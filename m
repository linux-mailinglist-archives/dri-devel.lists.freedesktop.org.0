Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E02ED4F7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6EC6E4B0;
	Thu,  7 Jan 2021 17:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271E6E4B0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:03:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c124so5749221wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+lEZ7oIvKm2BBIytBd5KhhxEP920NiQD+2lcPsM6TpM=;
 b=aXGyCa495ZG85l0b9GcSnWCF+vWITZULQ1jgeIWz30mtovFXithyYA7NDdkUYSsaiA
 2q64Udru2WyZIrndsVRfcTalMAbqLk3mrYzPGFtzY3P70nTf0CQzMKxAGSzwONuw7eCo
 9j0clCA/wW0uujhaNReSTPsTzxojlJT6wQfuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+lEZ7oIvKm2BBIytBd5KhhxEP920NiQD+2lcPsM6TpM=;
 b=QZMT/KL6+2NXGz4FKH2G5twkSYfKgCtzRxP/SE+Bcg7g8HRNlujjweN7/T75ZnO3Yj
 bsZAM9LFVPViIONUe9GVBERNFgA5Mjx0FlR6IWDQ0Kgg7yYGRwT8SqmCvwwlrxdWhftl
 2aCCKCQF2IBH75bur0vrqhHFWm5YtoECR0+A7QRCQL0gYJP+AlmUueReJBCY0XZsqcup
 XiCY0rHVf1oxXG8KT/OVoiW10AnQL54VcGbGBKNrrBITkd0FiY0blSs2g9hkjteFdRSs
 isDsXtVGS9GBgrHJxH3UtV5iOmSJyN+Th+IWUuvm6CEOzfu0Agd6RrhY3ijp36qq2+OV
 +bqQ==
X-Gm-Message-State: AOAM531QvUMLJ5K3PZwNVIrBv+db9etolGaoIOv7NBhyswQFh5qdKSfO
 Na/2JO4nbZIECcaE7xRkbiPaQQ==
X-Google-Smtp-Source: ABdhPJyZFJXjWI6KjgND1aIwwBqaBBETfIkkhLqYzm4hEc6WVovvc8CMhcP9MW9VeHf95jD4+hqFVA==
X-Received: by 2002:a1c:8085:: with SMTP id b127mr8623554wmd.16.1610039030885; 
 Thu, 07 Jan 2021 09:03:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n11sm10279071wra.9.2021.01.07.09.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:03:50 -0800 (PST)
Date: Thu, 7 Jan 2021 18:03:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/qxl: Use managed mode-config init
Message-ID: <X/c+9Nm2DvLXkBtM@phenom.ffwll.local>
References: <1609153481-9909-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609153481-9909-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, airlied@redhat.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 07:04:41PM +0800, Tian Tao wrote:
> Using drmm_mode_config_init() sets up managed release of modesetting
> resources.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

This changes the order of the cleanup actions, so most likely will break
really badly. You can only move a cleanup action safely over to drmm_ if
it is the last thing (at the time the patch is applied) done before
cleanup is finished. There's a _lot_ of code that's run after
qxl_modeset_fini.
-Daniel

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 012bce0..38d6b59 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1195,7 +1195,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  	int i;
>  	int ret;
>  
> -	drm_mode_config_init(&qdev->ddev);
> +	ret = drmm_mode_config_init(&qdev->ddev);
> +	if (ret)
> +		return ret;
>  
>  	ret = qxl_create_monitors_object(qdev);
>  	if (ret)
> @@ -1228,5 +1230,4 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  void qxl_modeset_fini(struct qxl_device *qdev)
>  {
>  	qxl_destroy_monitors_object(qdev);
> -	drm_mode_config_cleanup(&qdev->ddev);
>  }
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
