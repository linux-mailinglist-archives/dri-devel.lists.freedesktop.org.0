Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07E9B2D0C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4B810E46B;
	Mon, 28 Oct 2024 10:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EHvTo01w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2C710E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59083240003;
 Mon, 28 Oct 2024 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730111998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPDwwNAUYrFyDbDchKGTEAK7o97xBTv4CihEk+m0Cdw=;
 b=EHvTo01wp1vvvkqSAmZqYFEXN/3d0ip6sbZxcXGkWMhEhi9ccaxufDf/8djnfrj3PFjCOz
 oymQJg7o31yWwDO/xMc5WcI9XCCW/Jh+r+6nGAYGafFj8GCVNF/xRgI3qx9WAdfoJYulYN
 WEn/VABn35f0Tm+oVCDu4M2WCRyz7dpLAz10aJPxAqmy8nvWOD4yGKoC6bCjGZPJbH8EN1
 EtwooqZsNFcNZROyPTcWXzX7mg+4Hw3te3+XyhtCzJTpuQHqASr4/ryuZDjVEycs0v8EqG
 8915j+S4kT346lgHioL18hppQOtrBwg0nB1SPcg4dshsN6eGxJHdrQaK2Fe2Gg==
Date: Mon, 28 Oct 2024 11:39:51 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
Subject: Re: [PATCH RESEND v2 2/8] drm/vkms: Add support for ARGB8888 formats
Message-ID: <Zx9p96AbSIB7xYTl@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-2-d47da50d4674@bootlin.com>
 <40c85513-6c57-4b9c-87f6-2ca56c556462@riseup.net>
 <Zx9eateq0ylJGvS_@fedora>
 <3b497dee-9371-4d21-a4a6-e75a6e61e364@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b497dee-9371-4d21-a4a6-e75a6e61e364@riseup.net>
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

On 28/10/24 - 07:20, Maíra Canal wrote:
> Hi Louis,
> 
> On 28/10/24 06:50, Louis Chauvet wrote:
> > On 26/10/24 - 11:11, Maíra Canal wrote:
> > > Hi Louis,
> > > 
> > > On 07/10/24 13:46, Louis Chauvet wrote:
> > > > The formats XRGB8888 and ARGB8888 were already supported.
> > > > Add the support for:
> > > > - XBGR8888
> > > > - RGBX8888
> > > > - BGRX8888
> > > > - ABGR8888
> > > > - RGBA8888
> > > > - BGRA8888
> > > > 
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > ---
> > > >    drivers/gpu/drm/vkms/vkms_formats.c | 18 ++++++++++++++++++
> > > >    drivers/gpu/drm/vkms/vkms_plane.c   |  6 ++++++
> > > >    2 files changed, 24 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > index 8f1bcca38148..b5a38f70c62b 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > > @@ -432,8 +432,14 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
> > > >    READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
> > > > +READ_LINE_ARGB8888(XBGR8888_read_line, px, 255, px[0], px[1], px[2]) > +READ_LINE_ARGB8888(RGBX8888_read_line, px, 255, px[3], px[2], px[1])
> > > 
> > > I'm not expert in colors, but is this correct? From what I understand,
> > > it should be:
> > 
> > Yes, this is correct, READ_LINE_ARGB8888 take the parameters as A, R, G,
> > B, so here 0xFF, px[2], px[1], px[0]
> 
> Now I wonder if
> 
> READ_LINE_ARGB8888(XRGB8888_read_line, px, 255, px[2], px[1], px[0])
> 
> is correct.

Why? 

It creates the function `XRGB8888_read_line`, that reads the pixel line, 4 
bytes by 4 bytes, ignore the alpha value, uses px[2] as R, px[1] 
as G, px[0] as B.

I just tested with kms_plane (igt version 1.27.1-NO-GIT, fedora), and he 
seems happy on all the supported formats, including XRGB8888 (XR24):

Testing format XR24(0x34325258) / modifier linear(0x0) on A.0
Testing format AR24(0x34325241) / modifier linear(0x0) on A.0
Testing format AB24(0x34324241) / modifier linear(0x0) on A.0
Testing format XB24(0x34324258) / modifier linear(0x0) on A.0
Testing format RG24(0x34324752) / modifier linear(0x0) on A.0
Testing format BG24(0x34324742) / modifier linear(0x0) on A.0
Testing format XR48(0x38345258) / modifier linear(0x0) on A.0
Testing format XB48(0x38344258) / modifier linear(0x0) on A.0
Testing format AR48(0x38345241) / modifier linear(0x0) on A.0
Testing format AB48(0x38344241) / modifier linear(0x0) on A.0
Testing format RG16(0x36314752) / modifier linear(0x0) on A.0
Testing format BG16(0x36314742) / modifier linear(0x0) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format NV12(0x3231564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format NV16(0x3631564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format NV21(0x3132564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format NV61(0x3136564e) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format YU12(0x32315559) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format YU16(0x36315559) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format YV12(0x32315659) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format YV16(0x36315659) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format P010(0x30313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format P012(0x32313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr limited range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.601 YCbCr, YCbCr full range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr limited range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.709 YCbCr, YCbCr full range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr limited range) on A.0
Testing format P016(0x36313050) / modifier linear(0x0) (ITU-R BT.2020 YCbCr, YCbCr full range) on A.0


> Best Regards,
> - Maíra
> 
> > > READ_LINE_ARGB8888(RGBX8888_read_line, px, px[2], px[1], px[0], 255)
> > >                                             ^R     ^G     ^B     ^X
> > > 
> > > > +READ_LINE_ARGB8888(BGRX8888_read_line, px, 255, px[1], px[2], px[3])
> > > 
> > > Again, is this correct?
> > > 
> > > Best Regards,
> > > - Maíra
> > > 
> > > >    READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
> > > > +READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
> > > > +READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
> > > > +READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
> > > >    READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
> > > > @@ -637,8 +643,20 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
> > > >    	switch (format) {
> > > >    	case DRM_FORMAT_ARGB8888:
> > > >    		return &ARGB8888_read_line;
> > > > +	case DRM_FORMAT_ABGR8888:
> > > > +		return &ABGR8888_read_line;
> > > > +	case DRM_FORMAT_BGRA8888:
> > > > +		return &BGRA8888_read_line;
> > > > +	case DRM_FORMAT_RGBA8888:
> > > > +		return &RGBA8888_read_line;
> > > >    	case DRM_FORMAT_XRGB8888:
> > > >    		return &XRGB8888_read_line;
> > > > +	case DRM_FORMAT_XBGR8888:
> > > > +		return &XBGR8888_read_line;
> > > > +	case DRM_FORMAT_RGBX8888:
> > > > +		return &RGBX8888_read_line;
> > > > +	case DRM_FORMAT_BGRX8888:
> > > > +		return &BGRX8888_read_line;
> > > >    	case DRM_FORMAT_ARGB16161616:
> > > >    		return &ARGB16161616_read_line;
> > > >    	case DRM_FORMAT_XRGB16161616:
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > index 67f891e7ac58..941a6e92a040 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > @@ -14,7 +14,13 @@
> > > >    static const u32 vkms_formats[] = {
> > > >    	DRM_FORMAT_ARGB8888,
> > > > +	DRM_FORMAT_ABGR8888,
> > > > +	DRM_FORMAT_BGRA8888,
> > > > +	DRM_FORMAT_RGBA8888,
> > > >    	DRM_FORMAT_XRGB8888,
> > > > +	DRM_FORMAT_XBGR8888,
> > > > +	DRM_FORMAT_RGBX8888,
> > > > +	DRM_FORMAT_BGRX8888,
> > > >    	DRM_FORMAT_XRGB16161616,
> > > >    	DRM_FORMAT_ARGB16161616,
> > > >    	DRM_FORMAT_RGB565,
> > > > 
> 
