Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1A9B2BF1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1D110E447;
	Mon, 28 Oct 2024 09:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bqMzkzhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9102010E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D544740005;
 Mon, 28 Oct 2024 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78K+iLIzfiylCTrYyfF1jUhg5Pq48Ff6e2WXFMZxP6k=;
 b=bqMzkzhcf1yhJtGuCyLSQWwWohHxCC/yiVm1RLAtptYKFNEOOZBf1Sn6tWb3bGIY22fJsk
 AlFtJVLbdCRfZYDSU/AnlNODAmJ4yM7+p8OwOkiK0C4ri264mD4bk/BaB1BqwejdV8GbLf
 HUS3vdbfneTyDOCiEYUIA40OcSVdr62F96xZu8+F5tBgM4bRCxQlA30RggB5JhyxooyP+t
 IJ+w6jW01iJbdDrIoAMF2ELzUDb7AmYEhBqqBr+pfzxoXaQS1MuxSrDuUluJSQ9/pv1EWw
 hn7gS9/ltbBACzCchjFffoer1MeCTNwsy0KOFjqtfcShJRg6G6fvjNvBSrsFqQ==
Date: Mon, 28 Oct 2024 10:50:36 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v2 2/3] drm/vkms: Add a macro for write_line functions
Message-ID: <Zx9ebKnJF6_vL4i9@fedora>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com
References: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
 <20240814-writeback_line_by_line-v2-2-36541c717569@bootlin.com>
 <2af1f9b4-0bc8-4585-ba13-d3b97e25845f@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2af1f9b4-0bc8-4585-ba13-d3b97e25845f@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 26/10/24 - 12:08, Maíra Canal wrote:
> Hi Louis,
> 
> On 14/08/24 05:42, Louis Chauvet wrote:
> > As stated in [2], the write_line functions are very similar and force code
> 
> Where is [2]?
> 
> > duplication. This patch add a macro to avoid code repetition.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_formats.c | 107 ++++++++++--------------------------
> >   1 file changed, 30 insertions(+), 77 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index d1309f6d307f..a25cdf656d8a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -654,6 +654,31 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
> >   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
> >   }
> > +/**
> > + * WRITE_LINE() - Generic generator for write_line functions
> > + *
> > + * This generator can only be used for format with only one plane and block_w == block_h == 1
> > + *
> > + * @function_name: Name to use for the generated function
> > + * @conversion_function: Fonction to use for the conversion from argb_u16 to the required format.
> 
> s/Fonction/Function
> 
> > + */
> > +#define WRITE_LINE(function_name, conversion_function)					\
> > +static void function_name(struct vkms_writeback_job *wb,				\
> > +			  struct pixel_argb_u16 *src_pixels, int count, int x_start,	\
> > +			  int y_start)							\
> > +{											\
> > +	u8 *dst_pixels;									\
> > +											\
> > +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);	\
> > +											\
> > +	while (count) {									\
> > +		(conversion_function)(dst_pixels, src_pixels);				\
> > +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];		\
> > +		src_pixels += 1;							\
> > +		count--;								\
> 
> Just a nit: What do you think about this loop?
> 
> for (; count > 0; src_pixels++, count--)
> 
> It doesn't really matter what option you pick.

I take this version, a bit shorter and not less explicit, thanks!

Thanks,
Louis Chauvet
 
> Best Regards,
> - Maíra
> 
> > +	}										\
> > +}
> > +
> >   /*
> >    * The following functions are write_line function for each pixel format supported by VKMS.
> >    *
> > @@ -667,85 +692,13 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
> >    * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
> >    */
> > -static void ARGB8888_write_line(struct vkms_writeback_job *wb,
> > -				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> > -				int y_start)
> > -{
> > -	u8 *dst_pixels;
> > +WRITE_LINE(ARGB8888_write_line, argb_u16_to_ARGB8888)
> > +WRITE_LINE(XRGB8888_write_line, argb_u16_to_XRGB8888)
> > -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> > +WRITE_LINE(ARGB16161616_write_line, argb_u16_to_ARGB16161616)
> > +WRITE_LINE(XRGB16161616_write_line, argb_u16_to_XRGB16161616)
> > -	while (count) {
> > -		argb_u16_to_ARGB8888(dst_pixels, src_pixels);
> > -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> > -		src_pixels += 1;
> > -		count--;
> > -	}
> > -}
> > -
> > -static void XRGB8888_write_line(struct vkms_writeback_job *wb,
> > -				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> > -				int y_start)
> > -{
> > -	u8 *dst_pixels;
> > -
> > -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> > -
> > -	while (count) {
> > -		argb_u16_to_XRGB8888(dst_pixels, src_pixels);
> > -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> > -		src_pixels += 1;
> > -		count--;
> > -	}
> > -}
> > -
> > -static void ARGB16161616_write_line(struct vkms_writeback_job *wb,
> > -				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> > -				    int y_start)
> > -{
> > -	u8 *dst_pixels;
> > -
> > -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> > -
> > -	while (count) {
> > -		argb_u16_to_ARGB16161616(dst_pixels, src_pixels);
> > -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> > -		src_pixels += 1;
> > -		count--;
> > -	}
> > -}
> > -
> > -static void XRGB16161616_write_line(struct vkms_writeback_job *wb,
> > -				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> > -				    int y_start)
> > -{
> > -	u8 *dst_pixels;
> > -
> > -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> > -
> > -	while (count) {
> > -		argb_u16_to_XRGB16161616(dst_pixels, src_pixels);
> > -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> > -		src_pixels += 1;
> > -		count--;
> > -	}
> > -}
> > -
> > -static void RGB565_write_line(struct vkms_writeback_job *wb,
> > -			      struct pixel_argb_u16 *src_pixels, int count, int x_start,
> > -			      int y_start)
> > -{
> > -	u8 *dst_pixels;
> > -
> > -	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> > -
> > -	while (count) {
> > -		argb_u16_to_RGB565(dst_pixels, src_pixels);
> > -		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> > -		src_pixels += 1;
> > -		count--;
> > -	}
> > -}
> > +WRITE_LINE(RGB565_write_line, argb_u16_to_RGB565)
> >   /**
> >    * get_pixel_read_function() - Retrieve the correct read_line function for a specific
> > 
