Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC243745D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 11:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDC16E90B;
	Fri, 22 Oct 2021 09:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182B6E914
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 09:09:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id v127so2166144wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CSvjVZ0e6L/69HFDijEqx7UYA5Hhk1PF7U/kuB2r/g8=;
 b=frHMQ9F31jCSFY4HZSHvx46pIAXd5fLRQ/JN2GzCJoD4aJ6VmivPS6qlk2tdwWLvDx
 yIdm0lM6WlLEG+MR9Sqry4LW0PcuvotJ15keEYPfrxFRmLGZucD4KE+NkPpQ/4huyT/9
 OSm1Srs8QBQWCLTH7F/IF4jReQ0pgeb1IYRls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CSvjVZ0e6L/69HFDijEqx7UYA5Hhk1PF7U/kuB2r/g8=;
 b=sPdTEEmBmWcLyCAgoricIhyNqwVe3iJn7JG818gNM8CTVKStUlSvaop6dzHHQe113K
 MJxfccy1av+U/ypol94Jgz+zEB7I/otREggxse4iSm+YZIZbbDkPgACcVCt1CleUro4E
 XNudiS0Um2Us/ygLImpT+K6RP162KkCDl99DmvA+f/nzu7jQCs3K6EeEGgK4CaS+lF9R
 7WNdYkrABekU/9G9UMZvl8pZ7/4X8u2oAo4cLE7xLlbKLJtTnelCyOR9nluvsOIRDexB
 hoIMZA7kCktUDvPAMKDc2TrCq2DWHM8o1s5kwAHSIxOCfV1bV5D+w8e2WSHUGAUxomqY
 6U1g==
X-Gm-Message-State: AOAM533U3TZv1Pjuk13va5j0y8JajiIF5fXq+iDeGFZ+mFPluA8Ao/y1
 WbuB0lhtsg3aLpp/F9jVpjfw4CzV8dPPcg==
X-Google-Smtp-Source: ABdhPJw7ZVrMVuO+WLUr5qF9wTmu2oNyYNIp2mJzHtmj1cyDK3U1rQAq4UXCHFDBZJL75yxYOg/q8Q==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr12916551wma.106.1634893755307; 
 Fri, 22 Oct 2021 02:09:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t1sm9004835wre.32.2021.10.22.02.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:09:14 -0700 (PDT)
Date: Fri, 22 Oct 2021 11:09:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/i915/selftests: Properly reset mock object propers
 for each test
Message-ID: <YXJ/uCmXBcc2u3z/@phenom.ffwll.local>
References: <20211021202048.2638668-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021202048.2638668-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Oct 21, 2021 at 10:20:48PM +0200, Daniel Vetter wrote:
> I forgot to do this properly in
> 
> commit 6f11f37459d8f9f74ff1c299c0bedd50b458057a
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Jul 23 10:34:55 2021 +0200
> 
>     drm/plane: remove drm_helper_get_plane_damage_clips
> 
> intel-gfx CI didn't spot this because we run each selftest in each own
> invocations, which means reloading i915.ko. But if you just run all
> the selftests in one go at boot-up, then it falls apart and eventually
> we cross over the hardcoded limited of how many properties can be
> attached to a single object.
> 
> Fix this by resetting the property count. Nothing else to clean up
> since it's all static storage anyway.
> 
> Reported-and-tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: 6f11f37459d8 ("drm/plane: remove drm_helper_get_plane_damage_clips")
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Merged to drm-misc-fixes with Thomas' irc ack. Will unfortunately miss
this -rc since the drm pull train left the station already, but it'll be
there in a week.
-Daniel

> ---
>  drivers/gpu/drm/selftests/test-drm_damage_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> index 1c19a5d3eefb..8d8d8e214c28 100644
> --- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> @@ -30,6 +30,7 @@ static void mock_setup(struct drm_plane_state *state)
>  	mock_device.driver = &mock_driver;
>  	mock_device.mode_config.prop_fb_damage_clips = &mock_prop;
>  	mock_plane.dev = &mock_device;
> +	mock_obj_props.count = 0;
>  	mock_plane.base.properties = &mock_obj_props;
>  	mock_prop.base.id = 1; /* 0 is an invalid id */
>  	mock_prop.dev = &mock_device;
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
