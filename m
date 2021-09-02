Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB33FEF67
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D316E55C;
	Thu,  2 Sep 2021 14:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1326E55C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:24:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1490073wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QoNN22ajOMvRQNcLC8uwpltb5flTtT9IbnLxzI9BxdY=;
 b=Bzc0xHlRgq5HN46k3ndj1r++Uunhck7RT4C0lVheskae2nkF7c0K/npYDOV2YuJAyV
 ri56v+jm06evSm1ysPhNBoSQsN35iL8d4GcukFwbm7jFLESsp2AJPzwXIyMSioGZLFJi
 o2n53Ey00Mc+IJ8zMfMgyfNN0sS4Kw/md2DM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QoNN22ajOMvRQNcLC8uwpltb5flTtT9IbnLxzI9BxdY=;
 b=FzKD7OBVzDw/IWPkztNPNpVg6BveLpP+C9EXCzUlv6dx4EBM/xKZMWqVXB+3OGVACC
 poIGgEQS15hMtZyb4N02OSnmLU/Dtj2OtnMJILQoRzobjZlR8YJlmsPTDgldE135dHe9
 j7w7Rh6iuRSmN3w5zyTh2qIIlJdTlB3ywx+V8sPxbQssegWChPgbwvgbNZtXHdreRcig
 kb6Y3kqvQAcmqI6EMui0+HOQvBIy2ID8h5Fgm8FnFej2SxU52NCWZg7NpfwpPRfRuC/P
 SFwoP4sQsF/r2e/BawljmsgmefqpraQSXaQxSJX6QAd3Xtg8vvChopPehshvHinew3gA
 YW8A==
X-Gm-Message-State: AOAM531TFqUWvSaEC+pQIC0GoKGGkzN/XUfk4W4l4c+yXLPHJwG3CYeh
 5tVdm7TowGVqtTpw8ii0BFOmNw==
X-Google-Smtp-Source: ABdhPJwdnzgZMjVBZEN/GLVu5W+FxZHfU5gQU2GBrBsDPKj60MWxgaKkT7toQzSIT7KPlYwkpHX73g==
X-Received: by 2002:a05:600c:259:: with SMTP id
 25mr3456950wmj.82.1630592651809; 
 Thu, 02 Sep 2021 07:24:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y1sm1869832wmq.43.2021.09.02.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:24:11 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:24:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 peter@stuge.se, linus.walleij@linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
Message-ID: <YTDeibTXOvMzRV0P@phenom.ffwll.local>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-3-noralf@tronnes.org>
 <YRu/+nEX4A5i4sfl@phenom.ffwll.local>
 <d72f5ef1-f701-3549-c459-236716674fd6@tronnes.org>
 <YS4fTzPUbwMvK5NK@phenom.ffwll.local>
 <848f5d65-8bad-0d69-18dd-ae81549283b4@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <848f5d65-8bad-0d69-18dd-ae81549283b4@tronnes.org>
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

On Thu, Sep 02, 2021 at 04:08:14PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 31.08.2021 14.23, skrev Daniel Vetter:
> > On Mon, Aug 30, 2021 at 02:08:14PM +0200, Noralf Trønnes wrote:
> >>
> >>
> >> Den 17.08.2021 15.56, skrev Daniel Vetter:
> >>> On Tue, Aug 17, 2021 at 02:29:12PM +0200, Noralf Trønnes wrote:
> >>>> Add XRGB8888 emulation support for devices that can only do RGB332.
> >>>>
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> >>>> ---
> >>>>  drivers/gpu/drm/drm_format_helper.c | 47 +++++++++++++++++++++++++++++
> >>>>  include/drm/drm_format_helper.h     |  2 ++
> >>>>  2 files changed, 49 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> >>>> index 5231104b1498..53b426da7467 100644
> >>>> --- a/drivers/gpu/drm/drm_format_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_format_helper.c
> >>>> @@ -135,6 +135,53 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> >>>>  }
> >>>>  EXPORT_SYMBOL(drm_fb_swab);
> >>>>  
> >>>> +static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, u32 *sbuf, unsigned int pixels)
> >>>> +{
> >>>> +	unsigned int x;
> >>>> +
> >>>> +	for (x = 0; x < pixels; x++)
> >>>> +		dbuf[x] = ((sbuf[x] & 0x00e00000) >> 16) |
> >>>
> >>> I think for 2/3 bits correct rounding would be useful, not just masking.
> >>> i.e. before you shift add 0x00100000 here, and similar below.
> >>>
> >>
> >> Math isn't my strongest side and my brain failed to turn this into code.
> > 
> > Essentially add half of the lowest bit before you mask, so
> > 
> > ((sbuf[x] + 0x10) & 0xe0 )
> > 
> 
> But what if the value is 0xff, it overflows:

Your math is better than mine ...

> ((0xff + 0x10) & 0xe0 ) == 0x00
> 
> Should it be OR?
> 
> ((0xff | 0x10) & 0xe0 ) == 0xe0

Probably need a max on top to limit the overflow:

max(sbuf[x] + 0x10, 0xe)

But also maybe really not worth the head-scratching :-)
-Daniel

> 
> Noralf.
> 
> > I dropped the shift to make it clear what's going on. If you're mask is
> > 0xc0, then you simply add 0x20 before masking.
> > 
> >>> Also I just realized we've totally ignored endianess on these, which is
> >>> not great, because strictly speaking all the drm_fourcc codes should be
> >>> little endian. But I'm also not sure that's worth fixing ...
> >>>
> >>
> >> Is it as simple as using le32_to_cpu()?
> > 
> > I think so.
> > 
> > Plus on any format that has u16 output we'd need a cpu_to_le16 wrapped
> > around the entire thing.
> > -Daniel
> > 
> >> static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, __le32 *sbuf,
> >> unsigned int pixels)
> >> {
> >> 	unsigned int x;
> >> 	u32 pix;
> >>
> >> 	for (x = 0; x < pixels; x++) {
> >> 		pix = le32_to_cpu(sbuf[x]);
> >> 		dbuf[x] = ((pix & 0x00e00000) >> 16) |
> >> 			  ((pix & 0x0000e000) >> 11) |
> >> 			  ((pix & 0x000000c0) >> 6);
> >> 	}
> >> }
> >>
> >> Noralf.
> >>
> >>> Either way, lgtm:
> >>>
> >>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>
> >>>> +			  ((sbuf[x] & 0x0000e000) >> 11) |
> >>>> +			  ((sbuf[x] & 0x000000c0) >> 6);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
> >>>> + * @dst: RGB332 destination buffer
> >>>> + * @src: XRGB8888 source buffer
> >>>> + * @fb: DRM framebuffer
> >>>> + * @clip: Clip rectangle area to copy
> >>>> + *
> >>>> + * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
> >>>> + *
> >>>> + * This function does not apply clipping on dst, i.e. the destination is a small buffer
> >>>> + * containing the clip rect only.
> >>>> + */
> >>>> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *src, struct drm_framebuffer *fb,
> >>>> +			       struct drm_rect *clip)
> >>>> +{
> >>>> +	size_t width = drm_rect_width(clip);
> >>>> +	size_t src_len = width * sizeof(u32);
> >>>> +	unsigned int y;
> >>>> +	void *sbuf;
> >>>> +
> >>>> +	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
> >>>> +	sbuf = kmalloc(src_len, GFP_KERNEL);
> >>>> +	if (!sbuf)
> >>>> +		return;
> >>>> +
> >>>> +	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
> >>>> +	for (y = 0; y < drm_rect_height(clip); y++) {
> >>>> +		memcpy(sbuf, src, src_len);
> >>>> +		drm_fb_xrgb8888_to_rgb332_line(dst, sbuf, width);
> >>>> +		src += fb->pitches[0];
> >>>> +		dst += width;
> >>>> +	}
> >>>> +
> >>>> +	kfree(sbuf);
> >>>> +}
> >>>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
> >>>> +
> >>>>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
> >>>>  					   unsigned int pixels,
> >>>>  					   bool swab)
> >>>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> >>>> index 4e0258a61311..d0809aff5cf8 100644
> >>>> --- a/include/drm/drm_format_helper.h
> >>>> +++ b/include/drm/drm_format_helper.h
> >>>> @@ -16,6 +16,8 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vadd
> >>>>  			   struct drm_rect *clip);
> >>>>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> >>>>  		 struct drm_rect *clip, bool cached);
> >>>> +void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
> >>>> +			       struct drm_rect *clip);
> >>>>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
> >>>>  			       struct drm_framebuffer *fb,
> >>>>  			       struct drm_rect *clip, bool swab);
> >>>> -- 
> >>>> 2.32.0
> >>>>
> >>>
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
