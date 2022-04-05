Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1414F2916
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA8910F1E7;
	Tue,  5 Apr 2022 08:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F810F1E7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:36:39 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id n6so11086251ejc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=mJA2lhSAjBvIdBD6ROp3kAhgwFUlfyK4RHs6V3CcZqc=;
 b=CoDDZytP68BFexlTIPRQI8kK37R3nkDSnUvaKkmrkNmy4gvuhmA1JNDkNuSgkZWq1B
 SPVXZnfmJ1KZ2BcMTxTfOn8NWJRZBSQFcRh33LIG1mXQk1fprvTxxxWhJlo1JRRTupfp
 NYRI5YI0Mx8QJ9eR4E1LndjI8q21tuCQaKLHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=mJA2lhSAjBvIdBD6ROp3kAhgwFUlfyK4RHs6V3CcZqc=;
 b=bn2jluHB20i1UUr2KzohpXyI3WdebvVQXalvyDADzrhLMSgrgJeKFBhAdSbs406kCo
 tMIAbrUlmtymBdNdKhsmbi1R1lRGOiVPLB9zSWDChmutpeFhJFEVFuAi/xi2ynKGekt/
 4zl3evBMre1Brx+RgG+e8sFM/pIlHQrGDVV+6qxQv4ALUEUM4IU+/Dxgz3sejhIc6y3K
 BmOIMdfQ1GC2fajnq8vhmmmTUMF89qZgbz1w4Whey4TRSjvQ2hiRFwmfODGBX3Ak4eiT
 +Nq9SjhiETEHIRXgY6/+WAVLaxFJlTYHRszYEP8wZS/qyQ9v3OK9iSRl4sVkowmn9RDM
 2hlw==
X-Gm-Message-State: AOAM532q/JG0nSBJ6w7l1KBeISXbFAyrUMi29BgSfPOxZDemYS+gNsjq
 u/Jf8a43qQrTEEj0Q/39LK11jg==
X-Google-Smtp-Source: ABdhPJx4CvLt4qnid/daWeAwD8jdaiFdmc1pOY90sZa/ptwTWKFAv9S6pqBc7QGu5+ZIghApbsrfYw==
X-Received: by 2002:a17:907:c309:b0:6e8:4e5:6504 with SMTP id
 tl9-20020a170907c30900b006e804e56504mr2322280ejc.706.1649147797582; 
 Tue, 05 Apr 2022 01:36:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm6220634edz.29.2022.04.05.01.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 01:36:37 -0700 (PDT)
Date: Tue, 5 Apr 2022 10:36:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
Message-ID: <Ykv/k/WoVemoCJJA@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Peter Jones <pjones@redhat.com>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 01:19:26AM +0100, Javier Martinez Canillas wrote:
> On 2/8/22 22:08, Daniel Vetter wrote:
> > This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.
> > 
> > With
> > 
> > commit 27599aacbaefcbf2af7b06b0029459bbf682000d
> > Author: Thomas Zimmermann <tzimmermann@suse.de>
> > Date:   Tue Jan 25 10:12:18 2022 +0100
> > 
> >     fbdev: Hot-unplug firmware fb devices on forced removal
> > 
> > this should be fixed properly and we can remove this somewhat hackish
> > check here (e.g. this won't catch drm drivers if fbdev emulation isn't
> > enabled).
> >
> 
> Unfortunately this hack can't be reverted yet. Thomas' patch solves the issue
> of platform devices matched with fbdev drivers to be properly unregistered if
> a DRM driver attempts to remove all the conflicting framebuffers.
> 
> But the problem that fb561bf9abde ("fbdev: Prevent probing generic drivers if
> a FB is already registered") worked around is different. It happens when the
> DRM driver is probed before the {efi,simple}fb and other fbdev drivers, the
> kicking out of conflicting framebuffers already happened and these drivers
> will be allowed to probe even when a DRM driver is already present.
> 
> We need a clearer way to prevent it, but can't revert fb561bf9abde until that.

Yeah that entire area is a mess still, ideally we'd have something else
creating the platform devices, and efifb/offb and all these would just
bind against them.

Hm one idea that just crossed my mind: Could we have a flag in fb_info for
fw drivers, and check this in framebuffer_register? Then at least all the
logic would be in the fbdev core.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
