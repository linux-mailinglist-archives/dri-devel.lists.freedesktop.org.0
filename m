Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D64335DE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C536E895;
	Tue, 19 Oct 2021 12:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CB26E10F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:24:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w19so12096596edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xvkAEbSpUfLjgxEcHIxRjeiYhD20MmbRjqi31aQh8uA=;
 b=UPOz+txq4NDGZglf26mqc/S/nsYh7EvImRxMWn+xdNIXnAXCvublOE5pZofUeNOk/R
 3uvIV0/KSPmD7Ur6tkf+4KDxwM9F03vqYVNoSCH6eiB+YFfRJCq8Gfv5xX07X0j+/rMO
 9cbT8prsfahhXYgj787bbYNoWOQvVei9ojfsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xvkAEbSpUfLjgxEcHIxRjeiYhD20MmbRjqi31aQh8uA=;
 b=G6/US30+tScudSUAMHx99VShnzpozjiTnFRObupc5UYHR5RISaC3d7iRe8LT2uRvgX
 nRJ+4d27MS7yJ4QP7xF0CF2Zbsk+OHC0MvgmCvU9oMNfKfMg5z8alSw262NTAYFuoRi6
 9cg/Q0qnIvlXydJqDMm3mn1WRX0yY2ooBYBgbz1aJbfT3TROmq+8cR1ncM+t6KkLcc1F
 llkfuKXe4gmZxSETfGsjYtdCM74lTbfe6KzRlWUdBb4szE2IvNKa7Y3hTUv7pmQWCJwJ
 w8Q9TFGXBnUZXv2q0L4oNbtOuJUrwgGs5P55vaWsJMxCu9nvIAv/3c4nz0UvhHkg2+ST
 ashw==
X-Gm-Message-State: AOAM5304/VJ+kKE0pTPECIAs/PbNkbUXq6Ki9El7PERQoj/UEbYUIVk3
 82tzrgVwKLJZY52XMPCtxJiWgfi6GmOcaA==
X-Google-Smtp-Source: ABdhPJyMY1FDCZ9p/bTf35VEQDT21Dm0ZI+cb43O+HMaL8NCn9CoDUybNixugZHpZQnLLBGyts38gg==
X-Received: by 2002:a05:6402:348b:: with SMTP id
 v11mr52372674edc.296.1634646272373; 
 Tue, 19 Oct 2021 05:24:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a4sm2275738edk.71.2021.10.19.05.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:24:31 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:24:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH] drm: Increase DRM_OBJECT_MAX_PROPERTY by 18.
Message-ID: <YW64/Y8RgU63BYY2@phenom.ffwll.local>
References: <20211005065151.828922-1-bigeasy@linutronix.de>
 <YWbK8wSxNjVu9OLm@phenom.ffwll.local>
 <20211013123525.5nijgyx5ivnuujes@linutronix.de>
 <YWbXvvTzMF1EZ5c7@phenom.ffwll.local>
 <20211013173548.nldcwheo4t52dgvp@linutronix.de>
 <YWgu0v5iPDFViHXS@phenom.ffwll.local>
 <20211014134731.4a5vgdklj3sjyfks@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014134731.4a5vgdklj3sjyfks@linutronix.de>
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

On Thu, Oct 14, 2021 at 03:47:31PM +0200, Sebastian Andrzej Siewior wrote:
> On 2021-10-14 15:21:22 [+0200], Daniel Vetter wrote:
> > On Wed, Oct 13, 2021 at 07:35:48PM +0200, Sebastian Andrzej Siewior wrote:
> > > c7fcbf2513973 -> does not boot
> > > c7fcbf2513973 + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY
> > > 6f11f37459d8f -> boots, 0 x DRM_OBJECT_MAX_PROPERTY
> > > 6f11f37459d8f + 2f425cf5242a0 -> boots, 18 x DRM_OBJECT_MAX_PROPERTY
> > 
> > Just to check, you've built 6f11f37459d8f, and then you cherry-picked
> > 2f425cf5242a0 on top (not merged), and that already got you the warning
> > flood?
> 
> Correct.
> 
> > I'm probably blind, but I'm really not seeing where this pile of
> > properties is coming from. Can you pls also boot with drm.debug=0xe and
> > attach full dmesg? Plus your .config please.
> 
> attached. dmesg.txt is 6f11f37459d8f and the other is 6f11f37459d8f +
> 2f425cf5242a0.

Ah dmesg help me understand what's going on. Does the below patch help? If
it's this one that would also explain why intel CI hasn't hit it - it's a
leak between tests and we run them all individually instead of once at
boot-up.

Cheers, Daniel

diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
index 1c19a5d3eefb..8d8d8e214c28 100644
--- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
@@ -30,6 +30,7 @@ static void mock_setup(struct drm_plane_state *state)
 	mock_device.driver = &mock_driver;
 	mock_device.mode_config.prop_fb_damage_clips = &mock_prop;
 	mock_plane.dev = &mock_device;
+	mock_obj_props.count = 0;
 	mock_plane.base.properties = &mock_obj_props;
 	mock_prop.base.id = 1; /* 0 is an invalid id */
 	mock_prop.dev = &mock_device;
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
