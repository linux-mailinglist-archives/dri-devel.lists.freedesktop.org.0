Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA33FC701
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D2B89A1A;
	Tue, 31 Aug 2021 12:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDCA89A1A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:23:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b6so27334288wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qDKZ0kqH/2t/tNU+fJrZZYxmviLCQ5lBwKlVdM4I9M0=;
 b=DUJDQeiwh9xxwXABgk3CxVCKHgsr4WAmQLnA85o0TVtyB7X8ocZN6bcRteYHTD7uL+
 0BBKg/yJTtoeACGIfLmju/oaAVQ3LS0cPdn05Gz3t4svsHO1Mv5w4jjCNic/3Y54ZCUC
 fxxLi0Ffp3R/pnB3YyRkYfFzc9kXOdGdayGps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qDKZ0kqH/2t/tNU+fJrZZYxmviLCQ5lBwKlVdM4I9M0=;
 b=awD6Gqn1kQgD0KY545UgRcf7kDlDMBw8GAhQAWoVTv8LirCi680o2q7msf7PxPy8W/
 QFDBfryfrKwGDOK73BYLK3evONPA6do+UyKT3p5EajSb400Kdv9BlXTQWprQ4poYIkjF
 Y4fF02s8ED2e24ZkmLjNnsJWNiy6onwrn5XfRUjih1+Erdwdq24E8B21q2Krs5/UCLvM
 eH1ushrE0M7+Gejw/JbGKuHNvKD0YYKwVVznIcU3OYFuhtrhHylQPyLbhqkwyCPSM/TD
 hcJdQN/ZhEVB3p/gl4cIJseX4sdmrrj+17jbTNeK+C9baE+jIqRCYBTZPlxIA9aNvV/l
 tdrw==
X-Gm-Message-State: AOAM531m0paji4HXVAx78izlweRM4RTP1N94OnK4DJ9mF40A1UB5iuzq
 HRT+Emw7xQewXsjIpn4HlVApMA==
X-Google-Smtp-Source: ABdhPJxR/HReKdNweKfm6US/5YJeQICZLhGEQEp+2os/1XYwHJ5Q+w/rCxniBCKFt76RnLC7pMCgrA==
X-Received: by 2002:a5d:69c6:: with SMTP id s6mr31813581wrw.157.1630412625750; 
 Tue, 31 Aug 2021 05:23:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm2347747wmj.29.2021.08.31.05.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:23:45 -0700 (PDT)
Date: Tue, 31 Aug 2021 14:23:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 peter@stuge.se, linus.walleij@linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
Message-ID: <YS4fTzPUbwMvK5NK@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-3-noralf@tronnes.org>
 <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
 <d72f5ef1-f701-3549-c459-236716674fd6@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d72f5ef1-f701-3549-c459-236716674fd6@tronnes.org>
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

On Mon, Aug 30, 2021 at 02:08:14PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 17.08.2021 15.56, skrev Daniel Vetter:
> > On Tue, Aug 17, 2021 at 02:29:12PM +0200, Noralf Trønnes wrote:
> >> Add XRGB8888 emulation support for devices that can only do RGB332.
> >>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> >> ---
> >>  drivers/gpu/drm/drm_format_helper.c | 47 +++++++++++++++++++++++++++++
> >>  include/drm/drm_format_helper.h     |  2 ++
> >>  2 files changed, 49 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> >> index 5231104b1498..53b426da7467 100644
> >> --- a/drivers/gpu/drm/drm_format_helper.c
> >> +++ b/drivers/gpu/drm/drm_format_helper.c
> >> @@ -135,6 +135,53 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> >>  }
> >>  EXPORT_SYMBOL(drm_fb_swab);
> >>  
> >> +static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, u32 *sbuf, unsigned int pixels)
> >> +{
> >> +	unsigned int x;
> >> +
> >> +	for (x = 0; x < pixels; x++)
> >> +		dbuf[x] = ((sbuf[x] & 0x00e00000) >> 16) |
> > 
> > I think for 2/3 bits correct rounding would be useful, not just masking.
> > i.e. before you shift add 0x00100000 here, and similar below.
> > 
> 
> Math isn't my strongest side and my brain failed to turn this into code.

Essentially add half of the lowest bit before you mask, so

((sbuf[x] + 0x10) & 0xe0 )

I dropped the shift to make it clear what's going on. If you're mask is
0xc0, then you simply add 0x20 before masking.

> > Also I just realized we've totally ignored endianess on these, which is
> > not great, because strictly speaking all the drm_fourcc codes should be
> > little endian. But I'm also not sure that's worth fixing ...
> > 
> 
> Is it as simple as using le32_to_cpu()?

I think so.

Plus on any format that has u16 output we'd need a cpu_to_le16 wrapped
around the entire thing.
-Daniel

> static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf,
> unsigned int pixels)
> {
> 	unsigned int x;
> 	u32 pix;
> 
> 	for (x = 0; x < pixels; x++) {
> 		pix = le32_to_cpu(sbuf[x]);
> 		dbuf[x] = ((pix & 0x00e00000) >> 16) |
> 			  ((pix & 0x0000e000) >> 11) |
> 			  ((pix & 0x000000c0) >> 6);
> 	}
> }
> 
> Noralf.
> 
> > Either way, lgtm:
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> >> +			  ((sbuf[x] & 0x0000e000) >> 11) |
> >> +			  ((sbuf[x] & 0x000000c0) >> 6);
> >> +}
> >> +
> >> +/**
> >> + * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
> >> + * @dst: RGB332 destination buffer
> >> + * @src: XRGB8888 source buffer
> >> + * @fb: DRM framebuffer
> >> + * @clip: Clip rectangle area to copy
> >> + *
> >> + * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
> >> + *
> >> + * This function does not apply clipping on dst, i.e. the destination is a small buffer
> >> + * containing the clip rect only.
> >> + */
> >> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
> >> +			       struct drm_rect *clip)
> >> +{
> >> +	size_t width = drm_rect_width(clip);
> >> +	size_t src_len = width * sizeof(u32);
> >> +	unsigned int y;
> >> +	void *sbuf;
> >> +
> >> +	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
> >> +	sbuf = kmalloc(src_len, GFP_KERNEL);
> >> +	if (!sbuf)
> >> +		return;
> >> +
> >> +	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
> >> +	for (y = 0; y < drm_rect_height(clip); y++) {
> >> +		memcpy(sbuf, src, src_len);
> >> +		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
> >> +		src += fb->pitches[0];
> >> +		dst += width;
> >> +	}
> >> +
> >> +	kfree(sbuf);
> >> +}
> >> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
> >> +
> >>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
> >>  					   unsigned int pixels,
> >>  					   bool swab)
> >> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> >> index 4e0258a61311..d0809aff5cf8 100644
> >> --- a/include/drm/drm_format_helper.h
> >> +++ b/include/drm/drm_format_helper.h
> >> @@ -16,6 +16,8 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vadd
> >>  			   struct drm_rect *clip);
> >>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> >>  		 struct drm_rect *clip, bool cached);
> >> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
> >> +			       struct drm_rect *clip);
> >>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
> >>  			       struct drm_framebuffer *fb,
> >>  			       struct drm_rect *clip, bool swab);
> >> -- 
> >> 2.32.0
> >>
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
