Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68F6218F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245A410E4A5;
	Tue,  8 Nov 2022 16:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136F10E4A5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:01:09 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a5so23144687edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Cs/tzdzMNxyrkME08FtkUJHq/5+jxAWtBxJkRKMVSo=;
 b=dHv+YvRHsFfiWO1fcs6ArCsBbZg5HSKFkglygNPjpjWyGiX+AO7rYbXOpflkG3ytj8
 AHXUF7uSRh6oI/nTEJ8wtEj8E8ByMHs2xSQKg2LmxY75hEbuvPhnKqp55Uodr4eWa9NS
 B/j4Q2v082uFC1Z/Db8IXir8xe7g/nG97fdqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Cs/tzdzMNxyrkME08FtkUJHq/5+jxAWtBxJkRKMVSo=;
 b=3kHUo4RTvhFjljTb8UkkKbS7sISgvryeKjonNZ5TQoAbDCPilFxj9rWW9znOc1HnQv
 yaLUedv3zAz4DOjJbdARiGZcc+9ZGGIjWj3FD/kgFlTNwrdxBx6pryYE90403k6bRzpc
 rvBd4+fmSFQVSWDY+KOKK4E8aLxgb8mySTvgdHONdK9F2BQ1vTxMHd6QoUdUy1U5wPPQ
 cPNEIWueuYvb9d5qzRa9UZQSn7XFQtIK/50ywW2ZjoNrdMfpIf++zNojLiHcnDzyA0BM
 +ScnklVbUdVMgxl6yHb3eSvCd/1u2iR2NitJRy5v9sgtlZLMmFI479VFxqTz2bksziBZ
 BMhg==
X-Gm-Message-State: ACrzQf1+tMnil3Lb288gQUpbo/ZyloyMQlWlOTNLKjl3jv6x/IzcBWTY
 acpsK8MpZWEmx68uxTpOGAHfqTYThagG3Q==
X-Google-Smtp-Source: AMsMyM7k84xE0Vp2RnScuP0vAATzQQr6nR48LmO1Cm0kWzxrLiFGrr13BA0xgcGf9RCJ0A2oQf8TEg==
X-Received: by 2002:aa7:cb59:0:b0:461:7378:7be0 with SMTP id
 w25-20020aa7cb59000000b0046173787be0mr56905949edt.60.1667923267738; 
 Tue, 08 Nov 2022 08:01:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709063d2200b0076ff600bf2csm4832601ejf.63.2022.11.08.08.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 08:01:07 -0800 (PST)
Date: Tue, 8 Nov 2022 17:01:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/2] drm/v3d: add missing mutex_destroy
Message-ID: <Y2p9QX2r+0MoY1+C@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 "Juan A . Suarez" <jasuarez@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221107224656.278135-1-mcanal@igalia.com>
 <20221107224656.278135-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224656.278135-3-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 "Juan A . Suarez" <jasuarez@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 07:46:56PM -0300, Maíra Canal wrote:
> v3d_perfmon_open_file() instantiates a mutex for a particular file
> instance, but it never destroys it by calling mutex_destroy() in
> v3d_perfmon_close_file().
> 
> Similarly, v3d_perfmon_create_ioctl() instantiates a mutex for a
> particular perfmon, but it never destroys it by calling mutex_destroy()
> in v3d_perfmon_destroy_ioctl().
> 
> So, add the missing mutex_destroy on both cases.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_perfmon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index 48aaaa972c49..292c73544255 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -113,6 +113,7 @@ void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
>  	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, NULL);
>  	idr_destroy(&v3d_priv->perfmon.idr);
>  	mutex_unlock(&v3d_priv->perfmon.lock);
> +	mutex_destroy(&v3d_priv->perfmon.lock);
>  }
>  
>  int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
> @@ -177,6 +178,7 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (!perfmon)
>  		return -EINVAL;
>  
> +	mutex_destroy(&perfmon->lock);

This one looks wrong, I think this should be put into v3d_perfmon_put.
There is also an error case in v3d_perfmon_create_ioctl() that I think you
missed, right above the kfree(perfmon).

With these two fixes this is Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>  	v3d_perfmon_put(perfmon);
>  
>  	return 0;
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
