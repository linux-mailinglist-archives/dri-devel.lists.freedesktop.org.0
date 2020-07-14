Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF721EBA0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCB86E1A7;
	Tue, 14 Jul 2020 08:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251326E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:41:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so4068402wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/Jd4c0WBcnRS0cd4fRvCiVdvCcz4Bz7vlXm1iqEjsmU=;
 b=cQnNWiwv1BfjrBjCWhnIMToP/tRQKHBHPUH+ngtQ0uGUG0QlmDfpUSRN9kKM7FBEUq
 iPUdnFcDLQRE04cbLo5Ce1LTvy9/zvEUcNTGg5GeWOReMKJ59SZdnegbgJqYaRwK3dE1
 bKjsb0WZ868lmYmkFUWUTb66BxUN1OrxVTcJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/Jd4c0WBcnRS0cd4fRvCiVdvCcz4Bz7vlXm1iqEjsmU=;
 b=pcAk9IShLPjcyzaQ7FtpUL8mYyaQjWFCvpEDuCvycmXFJFoU3/y5/Z3DuBmzH3JipB
 GwMlRJJeFpCzFB3avY9pHfxjQUgEDcjod88CPYNZZcUuitWmkA3tUdLrjyBILSSrjMEc
 2BRDPuiQZjdtQ0wK6h+03xJk4YsNcm3G4qWxKnM5Or0dXSY24nT+v29lx/ASO0pqIcVh
 ib99XFit2FQtR5iZDjZCaX5K2wU6hAmXY6QuJX4CHGt7wOMfPfuQiTOsP7xvufxu0r2r
 EyPcnP7zPhnAkXRATzva9iz9VIzPouqTi+OszggNqpbL4WtReecFuKLPk15MQKAhZhQU
 eBJQ==
X-Gm-Message-State: AOAM531zo4TTu/x0p5xfKqsHhOlQg2nY3sZvxePTiiWExDm4s3H2blNU
 9GD/OmgF/cwzIFgZFIhxZfPEsw==
X-Google-Smtp-Source: ABdhPJwbUmSG/acKsZeu4cBPlQ7IB8rNeOHEqy3Nuj6uLQs9miLVibvjrd2C7rIqiK7W7MFrPFWJsA==
X-Received: by 2002:a1c:668b:: with SMTP id a133mr3193352wmc.10.1594716103802; 
 Tue, 14 Jul 2020 01:41:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q188sm3502396wma.46.2020.07.14.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 01:41:43 -0700 (PDT)
Date: Tue, 14 Jul 2020 10:41:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200714084141.GW3278063@phenom.ffwll.local>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
 <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ed6bd2a-6f8f-ca69-3244-03402874d5a3@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 08:41:58AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 13.07.20 um 18:21 schrieb Daniel Vetter:
> > On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> >>> Mark reported that sparc64 would panic while booting using qemu.
> >>> Mark bisected this to a patch that introduced generic fbdev emulation=
 to
> >>> the bochs DRM driver.
> >>> Mark pointed out that a similar bug was fixed before where
> >>> the sys helpers was replaced by cfb helpers.
> >>>
> >>> The culprint here is that the framebuffer reside in IO memory which
> >>> requires SPARC ASI_PHYS (physical) loads and stores.
> >>>
> >>> The current bohcs DRM driver uses a shadow buffer.
> >>> So all copying to the framebuffer happens in
> >>> drm_fb_helper_dirty_blit_real().
> >>>
> >>> The fix is to replace the memcpy with memcpy_toio() from io.h.
> >>>
> >>> memcpy_toio() uses writeb() where the original fbdev code
> >>> used sbus_memcpy_toio(). The latter uses sbus_writeb().
> >>>
> >>> The difference between writeb() and sbus_memcpy_toio() is
> >>> that writeb() writes bytes in little-endian, where sbus_writeb() writ=
es
> >>> bytes in big-endian. As endian does not matter for byte writes they a=
re
> >>> the same. So we can safely use memcpy_toio() here.
> >>>
> >>> For many architectures memcpy_toio() is a simple memcpy().
> >>> One sideeffect that is unknow is if this has any impact on other
> >>> architectures.
> >>> So far the analysis tells that this change is OK for other arch's.
> >>> but testing would be good.
> >>>
> >>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >>> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>> Cc: "David S. Miller" <davem@davemloft.net>
> >>> Cc: sparclinux@vger.kernel.org
> >>
> >> So this actually is a problem in practice. Do you know how userspace
> >> handles this?
> >>
> >> For this patch
> >>
> >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> but I'd like to have someone with more architecture expertise ack this
> >> as well.
> >>
> >> Best regards
> >> Thomas
> >>
> >>> ---
> >>>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
> >>> index 5609e164805f..4d05b0ab1592 100644
> >>> --- a/drivers/gpu/drm/drm_fb_helper.c
> >>> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >>> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct =
drm_fb_helper *fb_helper,
> >>>  	unsigned int y;
> >>>  =

> >>>  	for (y =3D clip->y1; y < clip->y2; y++) {
> >>> -		memcpy(dst, src, len);
> >>> +		memcpy_toio(dst, src, len);
> > =

> > I don't think we can do this unconditionally, there's fbdev-helper driv=
ers
> > using shmem helpers, and for shmem memcpy_toio is wrong. We need a swit=
ch
> > to fix this properly I think.
> =

> I once has a patch set for this problem, but it didn't make it. [1]
> =

> Buffers can move between I/O and system memory, so a simple flag would
> not work. I'd propose this
> =

> bool drm_gem_is_iomem(struct drm_gem_object *obj)
> {
> 	if (obj->funcs && obj->funcs->is_iomem)
> 		return obj->funcs->is_iomem(obj);
> 	return false;
> }
> =

> Most GEM implmentations wouldn't bother, but VRAM helpers could set the
> is_iomem function and return the current state. Fbdev helpers can then
> pick the correct memcpy_*() function.

Hm wasn't the (long term at least) idea to add the is_iomem flag to the
vmap functions? is_iomem is kinda only well-defined if there's a vmap of
the buffer around (which also pins it), or in general when the buffer is
pinned. Outside of that an ->is_iomem function doesn't make much sense.
-Daniel

> =

> Best regards
> Thomas
> =

> [1]
> https://lore.kernel.org/dri-devel/20191106093121.21762-1-tzimmermann@suse=
.de/
> =

> > =

> > What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
> > version, for which we don't have any drivers really. But I do think we
> > need to differentiate between memcpy and memcpy_tio. That's what this
> > entire annoying _cfb_ vs _sys_ business is all about, and also what gem
> > vram helpers have to deal with.
> > -Daniel
> > =

> >>>  		src +=3D fb->pitches[0];
> >>>  		dst +=3D fb->pitches[0];
> >>>  	}
> >>>
> >>
> >> -- =

> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> > =

> > =

> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
