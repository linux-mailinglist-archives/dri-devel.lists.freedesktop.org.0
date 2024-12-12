Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA19EE3C2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53710ED2E;
	Thu, 12 Dec 2024 10:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bvAs8EXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD52310ED2E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:07:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so199225f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 02:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733998056; x=1734602856; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HEw5QvGI1WEIxHNEr9vU1a+TILusw+KpjvW/CzlXblE=;
 b=bvAs8EXnoLhXYfw0THi49op5eEhtLnb7b+Ccd7xAE8LP0wYXedvwhBjSYOjKoWI6JT
 ES4pRvVniJjTzHF9vTUWzEKUpu+KddCbt8ILnmMozK+DSd7RE6c4JacNmhr73+6vjMOQ
 UeLx1OLRyWYzWosM0ivhEHjN62lTEnCEODC1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733998056; x=1734602856;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HEw5QvGI1WEIxHNEr9vU1a+TILusw+KpjvW/CzlXblE=;
 b=hkEgYkFeqvo4IREEUWijDEI0If0I9L4kEh7A1qdGweFJdLdJXkp3+W/XpoHG8boHwc
 /WdlDcoHfBd3GJ4NvG59hWFR2kgV9mvOLpQJJOVGBRHSmJDCSgFoqBq9gcgyaXwDDiJ6
 atLm2HnOkATFra+Y0UWnCa/wC3FJnUrkousiU4JOiaiK7de3tAHT27XtqNE/RQbbhvrG
 BTtgmcr5Bfr8AIB5s4fsLr2yYEk+d1zIMyIJ1PNx1KSeyj2cSmlyVUx4dMSoZPi2emGf
 CfEVJxXzE4feNL5DnYq6cDkhvmO1RQipyRIBFA9gBnzkYCgNKGx3h9DcB1pzrZW4JrYT
 aVSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgGWuDm578tvZwGE/O2IEPDfWV+S7EwczCWaM8YrCHYupkTT1iWmEm8x/270HpFoj3q8TtBIGatUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2oTYjKVxYHclekmsyW+OQQZG4/Mp7vxH6nGYi45Ay9Z6XynAa
 6ovIP8cBvYKuAG7gepgmevHDEBYiQ1+z2aZoZtHcrlcMKIgq5ZJk7obvFoiJRSc=
X-Gm-Gg: ASbGncsx3s1B7Y5NDTQvyuqG0I63cro784J24bN7PIM9f6EX6xOjfKHNPfHQ/IS6OIn
 gADYu+hCjsTApUt+o0vGuAP+VH2UZoFbVnvqY9c+3CWaXWeClyEEv6eh7htmG3DMBNuTxOKRiw7
 5jIUrziWOO/mGPZAwVeBEKwa9JdsmL3s3nzrnzMXxufNHxACpU7WTcg0Jw//lzdxwF1+RLfbLRQ
 2HVKiYgVyT3U6t+Qe36kBvIDX+lx/E/jx9plXvvgmMU7GOdb5gUxq66omwUP81PqLOi
X-Google-Smtp-Source: AGHT+IFhrUafHSoCPipxJ+pOGdcv3zgRkpLxSi7qx/4D/LIpqG52Ti0k2fRfVEDYPkq41Q+d7tvSMA==
X-Received: by 2002:a5d:5887:0:b0:382:5010:c8de with SMTP id
 ffacd0b85a97d-3864cec5ba6mr3875098f8f.46.1733998055984; 
 Thu, 12 Dec 2024 02:07:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824bd634sm3614976f8f.45.2024.12.12.02.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:07:35 -0800 (PST)
Date: Thu, 12 Dec 2024 11:07:33 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <Z1q15aOiTTozQMmE@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <20241204160014.1171469-3-jfalempe@redhat.com>
 <816f862e-762d-4880-9285-5a803e657e66@stanley.mountain>
 <88abb273-13e3-4969-96c3-c7d677a082d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88abb273-13e3-4969-96c3-c7d677a082d4@redhat.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Thu, Dec 12, 2024 at 09:49:19AM +0100, Jocelyn Falempe wrote:
> On 12/12/2024 08:41, Dan Carpenter wrote:
> > This patch breaks "make oldconfig" for me.  It just gets into an endless
> > loop of:
> > 
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    ...
> > 
> > I don't have to type anything, it just spams that forever.  It's weird
> > that it's 1-0 instead of 0-1.  Does that means something?  I don't know
> > much about Kconfig.
> 
> I can reproduce it with your provided config.
> 
> It looks like it happens if DRM_CLIENT_SELECTION is enabled, but none of the
> client is.
> The attached patch should fix it, can you try it ?
> 
> I will submit that shortly.
> 
> Thanks for reporting it.
> 
> Best regards,
> 
> -- 
> 
> Jocelyn
> 
> 
> > 
> > I'm using this arm64 randconfig as a base.  I type "make oldconfig" and
> > press enter until it gets to "Default DRM Client" and then it starts
> > scrolling endlessly.
> > https://download.01.org/0day-ci/archive/20241212/202412121555.Fp663tyH-lkp@intel.com/config
> > 
> > regards,
> > dan carpenter
> > 

> From e4d197debd2c199c9f2d8e35e41e36c2836926b9 Mon Sep 17 00:00:00 2001
> From: Jocelyn Falempe <jfalempe@redhat.com>
> Date: Thu, 12 Dec 2024 09:43:50 +0100
> Subject: [PATCH] Fix endless Kconfig loop
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Since I haven't seen the patch anywhere else I'll drop my ack here.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Please push directly to drm-misc-next so the breakage doesn't linger.
-Sima
> ---
>  drivers/gpu/drm/clients/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> index c18decc90200..82a7d4e584dd 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -87,6 +87,7 @@ config DRM_CLIENT_LOG
>  choice
>  	prompt "Default DRM Client"
>  	depends on DRM_CLIENT_SELECTION
> +	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG
>  	default DRM_CLIENT_DEFAULT_FBDEV
>  	help
>  	  Selects the default drm client.
> -- 
> 2.47.1
> 


-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
