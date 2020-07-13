Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFE21DB98
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439C6E2C4;
	Mon, 13 Jul 2020 16:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE0F6E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:22:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g10so339562wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=078asBrUdAzX6V4HRPDBswsi0+2eriabHhVz3ArnjDc=;
 b=aTKEK4S4PUIHVkAv6JErkNzh79Z888tYpNCRggfGNw1cGGVXzogegCneDgnPlBG92U
 /N7YfWn1mzKs/he6l8dclI1/IBckZPQ23xCWTgMDT0uYnAbgm15utkRoHL2Al5aa86Cy
 DPSlkDzEIEh/pyhVNKrn61LCgjEE+1+qvpkj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=078asBrUdAzX6V4HRPDBswsi0+2eriabHhVz3ArnjDc=;
 b=rIj/GMPI87gvBeLrzRb54Cjfii/ErHzKpsbA94NQZoCifZfSTXkvoyf6w7sR2AvEIM
 lP+Z4joLWQM1yBVQMgMC+ogQs0swKYvLLURxGSaLbfFdxIJzJZDbADZD2sRfXfuXl/Op
 7G0/pwbpXCKzHbaiuyga1nt2YXe/Pm2QchTcoEbJwcTnuGfdX54PjcHHPwme05eQ00yD
 UIM5sXKMhydQgiUJilYHse8fcx2VUEQHO0/dPsCErqI3U5rCQTSQPmJxomXRfuWi9Z6N
 cAcHPXLyD6+DDe8Y4CTEE/rGhnx9v5w8o21gBX6f6jj2lz3//qDIIK8wApU83DbLt54c
 BH2Q==
X-Gm-Message-State: AOAM533AKQJmRy+qGZoOFmBpMAcPLSJRnU3npXZN784lPuYzYmwiGZqF
 BZJUNp7GIk3by3a8kf8qwK4RzQ==
X-Google-Smtp-Source: ABdhPJwKF+xm8MFfAd0R5CoC3HwdOVssXV+RtQHlZXNvp4a2iUOVusv5GEmhSnWhuWC0Zddy4pgeFQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr159705wmh.108.1594657322307; 
 Mon, 13 Jul 2020 09:22:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u8sm24532517wrt.28.2020.07.13.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:22:01 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:21:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Message-ID: <20200713162159.GR3278063@phenom.ffwll.local>
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
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

On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> > Mark reported that sparc64 would panic while booting using qemu.
> > Mark bisected this to a patch that introduced generic fbdev emulation to
> > the bochs DRM driver.
> > Mark pointed out that a similar bug was fixed before where
> > the sys helpers was replaced by cfb helpers.
> > =

> > The culprint here is that the framebuffer reside in IO memory which
> > requires SPARC ASI_PHYS (physical) loads and stores.
> > =

> > The current bohcs DRM driver uses a shadow buffer.
> > So all copying to the framebuffer happens in
> > drm_fb_helper_dirty_blit_real().
> > =

> > The fix is to replace the memcpy with memcpy_toio() from io.h.
> > =

> > memcpy_toio() uses writeb() where the original fbdev code
> > used sbus_memcpy_toio(). The latter uses sbus_writeb().
> > =

> > The difference between writeb() and sbus_memcpy_toio() is
> > that writeb() writes bytes in little-endian, where sbus_writeb() writes
> > bytes in big-endian. As endian does not matter for byte writes they are
> > the same. So we can safely use memcpy_toio() here.
> > =

> > For many architectures memcpy_toio() is a simple memcpy().
> > One sideeffect that is unknow is if this has any impact on other
> > architectures.
> > So far the analysis tells that this change is OK for other arch's.
> > but testing would be good.
> > =

> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: sparclinux@vger.kernel.org
> =

> So this actually is a problem in practice. Do you know how userspace
> handles this?
> =

> For this patch
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> but I'd like to have someone with more architecture expertise ack this
> as well.
> =

> Best regards
> Thomas
> =

> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index 5609e164805f..4d05b0ab1592 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct dr=
m_fb_helper *fb_helper,
> >  	unsigned int y;
> >  =

> >  	for (y =3D clip->y1; y < clip->y2; y++) {
> > -		memcpy(dst, src, len);
> > +		memcpy_toio(dst, src, len);

I don't think we can do this unconditionally, there's fbdev-helper drivers
using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
to fix this properly I think.

What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
version, for which we don't have any drivers really. But I do think we
need to differentiate between memcpy and memcpy_tio. That's what this
entire annoying _cfb_ vs _sys_ business is all about, and also what gem
vram helpers have to deal with.
-Daniel

> >  		src +=3D fb->pitches[0];
> >  		dst +=3D fb->pitches[0];
> >  	}
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





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
