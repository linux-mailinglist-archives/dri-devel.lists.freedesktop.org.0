Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB88BBF966
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 23:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93A10E5C2;
	Mon,  6 Oct 2025 21:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="COTKvEt5";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="sldXbi6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5110E622
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 21:39:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-vtmz.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759786755; 
 b=cKJn3ocM6H2ueNTzo97Z/Kr41VbaPT0W/h2OyMgaEAyys1W3fosyLaH29oP57nkLBl+40hXaYe
 nDaJAHke0R1fwXSjJs1/97rXDn4X340hknJwc8UGGkF0EDYKna/CbIye6Ys4zZ48EAujpSMf4L
 7ANweliEBKgFQLd+8Q+mEGZtti+ueWNttisiKcigxP37vFWUJayKCFMsRn0xs2xZNvyqP1ipfz
 pAJDAMpf3zluLelWsZekvJvVGFXrUTido8YZYEPqezAGRIvU9uyMuCk6capIotX9Fv5FvqG7YK
 GJ4i9BFmXQCZs9Yp/7bRRD/TgTqfMeN9+XPG8vef0n2pmA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-vtmz.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-vtmz.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759786755; 
 bh=XhrALn6AwmqC48kyNP42LuQeYtcpkiuuaVWHS05VQrA=;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
 b=Z+pTUHWk+/XVs82quXwqPKIogqiS3+/Rz74mLfdvdMeUiW86Zn4RtdnmlZOIwoK9aoIlzaFTSi
 tR8Cu3oH37gf7LlcaPhbSVRJTrLJhg+xZRKpkzNqutH+fxpBmeDR5G7ZyPJlMX0V8kaOkAFiLX
 g2Ic92qnIEc2Fmim5fBC1iFzfE2QO4FYPz4zJrERhtt9yll/J0+Nr6V0zzBj0TYI6u0puUMSrB
 43kKU4iON0MBFH3WARuai1TjH9Cm3vE3vVkEl1w6WB+ph9wWv893wqByLM3AedT3Ib4Yf98weH
 s1SCQsbp9QTViSjc65cRRw+lO5oebiwyArDpcWgi6SYcgA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Reply-To:List-Unsubscribe;
 bh=a9wOeHQ4Zw5QzXxBPYZnpfS9fOrFf4Gmv/aSZxidpZI=; b=COTKvEt5i/FiP2belZXeDLM+iD
 GKF7zRi03Qzhy2ZOd/ugTj70CfMpa2oWQ3NRoHlZ9s1wltvcIkC4137FOq7aXqs2BT5LlcGbtScbq
 Gj6dpExOl43WNmOba5LAY549oF32UwXUpillOTn8s2kM2ozqAlProaOMXWA95UDh0CZo=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-vtmz.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v5svG-00000008DDo-0WWS
 for dri-devel@lists.freedesktop.org; Mon, 06 Oct 2025 21:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=a9wOeHQ4Zw5QzXxBPYZnpfS9fOrFf4Gmv/aSZxidpZI=; b=sldXbi6FfeiI0WohjK6gQzMjAB
 YznkPBpu/WnBECEvv8r+aS4aejXZB/dmMYGYAjaRqwOQqo/EiXUFI5zvtH7D5PQNRD+dhcn7lqtLs
 XZbK7TEvK8WAEoBDA75U5pOakP6He0m4UTXktb5tQpil88vcDwi7E+Jp7A8tny/LxXX4=;
Received: from [87.16.13.60] (port=59816 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v5sv0-000000006H2-1h3j; Mon, 06 Oct 2025 21:38:54 +0000
From: Francesco Valla <francesco@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/draw: add drm_draw_can_convert_from_xrgb8888
Date: Mon, 06 Oct 2025 23:38:53 +0200
Message-ID: <2764907.vuYhMxLoTh@fedora.fritz.box>
In-Reply-To: <a669b2ee89865e9150efd38e181cdc838c2ac522@intel.com>
References: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
 <20251005-drm_draw_conv_check-v1-1-9c814d9362f6@valla.it>
 <a669b2ee89865e9150efd38e181cdc838c2ac522@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c64186ba7e610b7a43bfd9f4c19971a1
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v5svG-00000008DDo-0WWS-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-vtmz.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

On Monday, 6 October 2025 at 08:48:51 Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Sun, 05 Oct 2025, Francesco Valla <francesco@valla.it> wrote:
> > Add drm_draw_can_convert_from_xrgb8888() function that can be used to
> > determine if a XRGB8888 color can be converted to the specified format.
> >
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/gpu/drm/drm_draw.c          | 84 +++++++++++++++++++++++++++----------
> >  drivers/gpu/drm/drm_draw_internal.h |  2 +
> >  2 files changed, 63 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> > index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..2641026a103d3b28cab9f5d378604b0604520fe4 100644
> > --- a/drivers/gpu/drm/drm_draw.c
> > +++ b/drivers/gpu/drm/drm_draw.c
> > @@ -15,45 +15,83 @@
> >  #include "drm_draw_internal.h"
> >  #include "drm_format_internal.h"
> >  
> > -/**
> > - * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> > - * @color: input color, in xrgb8888 format
> > - * @format: output format
> > - *
> > - * Returns:
> > - * Color in the format specified, casted to u32.
> > - * Or 0 if the format is not supported.
> > - */
> > -u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
> > +static int __drm_draw_color_from_xrgb8888(u32 color, u32 format, u32 *out_color)
> 
> Is there any reason to change the return value of this function and
> return the result via out_color? It already returns 0 if the format is
> not supported. If there's a reason, it needs to be in the commit
> message.
> 

Is because 0 might be a valid color (e.g black for RGB888), as Jocelyn
correctly pointed out in another thread. I'll add this detail to the
commit message for the V2.

> >  {
> >  	switch (format) {
> >  	case DRM_FORMAT_RGB565:
> > -		return drm_pixel_xrgb8888_to_rgb565(color);
> > +		*out_color = drm_pixel_xrgb8888_to_rgb565(color);
> > +		break;
> >  	case DRM_FORMAT_RGBA5551:
> > -		return drm_pixel_xrgb8888_to_rgba5551(color);
> > +		*out_color = drm_pixel_xrgb8888_to_rgba5551(color);
> > +		break;
> >  	case DRM_FORMAT_XRGB1555:
> > -		return drm_pixel_xrgb8888_to_xrgb1555(color);
> > +		*out_color = drm_pixel_xrgb8888_to_xrgb1555(color);
> > +		break;
> >  	case DRM_FORMAT_ARGB1555:
> > -		return drm_pixel_xrgb8888_to_argb1555(color);
> > +		*out_color = drm_pixel_xrgb8888_to_argb1555(color);
> > +		break;
> >  	case DRM_FORMAT_RGB888:
> > +		fallthrough;
> 
> That's not necessary for back to back case labels. Please don't add it.
>

Noted.

> >  	case DRM_FORMAT_XRGB8888:
> > -		return color;
> > +		*out_color = color;
> > +		break;
> >  	case DRM_FORMAT_ARGB8888:
> > -		return drm_pixel_xrgb8888_to_argb8888(color);
> > +		*out_color = drm_pixel_xrgb8888_to_argb8888(color);
> > +		break;
> >  	case DRM_FORMAT_XBGR8888:
> > -		return drm_pixel_xrgb8888_to_xbgr8888(color);
> > +		*out_color = drm_pixel_xrgb8888_to_xbgr8888(color);
> > +		break;
> >  	case DRM_FORMAT_ABGR8888:
> > -		return drm_pixel_xrgb8888_to_abgr8888(color);
> > +		*out_color = drm_pixel_xrgb8888_to_abgr8888(color);
> > +		break;
> >  	case DRM_FORMAT_XRGB2101010:
> > -		return drm_pixel_xrgb8888_to_xrgb2101010(color);
> > +		*out_color = drm_pixel_xrgb8888_to_xrgb2101010(color);
> > +		break;
> >  	case DRM_FORMAT_ARGB2101010:
> > -		return drm_pixel_xrgb8888_to_argb2101010(color);
> > +		*out_color = drm_pixel_xrgb8888_to_argb2101010(color);
> > +		break;
> >  	case DRM_FORMAT_ABGR2101010:
> > -		return drm_pixel_xrgb8888_to_abgr2101010(color);
> > +		*out_color = drm_pixel_xrgb8888_to_abgr2101010(color);
> > +		break;
> >  	default:
> > -		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> > -		return 0;
> > +		return -1;
> 
> Please don't use -1 as a generic error code. -1 is -EPERM.
> 

Whops, you're right. I'll return -ENOTSUPP.

> >  	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_draw_can_convert_from_xrgb8888 - check if xrgb8888 can be converted to the desired format
> > + * @format: format
> > + *
> > + * Returns:
> > + * True if XRGB8888 can be converted to the specified format, false otherwise.
> > + */
> > +bool drm_draw_can_convert_from_xrgb8888(u32 format)
> > +{
> > +	u32 out_color;
> > +
> > +	return __drm_draw_color_from_xrgb8888(0, format, &out_color) == 0;
> > +}
> > +EXPORT_SYMBOL(drm_draw_can_convert_from_xrgb8888);
> > +
> > +/**
> > + * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> > + * @color: input color, in xrgb8888 format
> > + * @format: output format
> > + *
> > + * Returns:
> > + * Color in the format specified, casted to u32.
> > + * Or 0 if the format is not supported.
> > + */
> > +u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
> > +{
> > +	u32 out_color = 0;
> > +
> > +	if (__drm_draw_color_from_xrgb8888(color, format, &out_color))
> > +		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> > +
> > +	return out_color;
> >  }
> >  EXPORT_SYMBOL(drm_draw_color_from_xrgb8888);
> >  
> > diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
> > index f121ee7339dc11537f677c833f0ee94fe0e799cd..2ab4cb341df94fc4173dd6f5e7a512bdcfa5e55c 100644
> > --- a/drivers/gpu/drm/drm_draw_internal.h
> > +++ b/drivers/gpu/drm/drm_draw_internal.h
> > @@ -24,6 +24,8 @@ static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
> >  	return font->data + (c * font->height) * font_pitch;
> >  }
> >  
> > +bool drm_draw_can_convert_from_xrgb8888(u32 format);
> > +
> >  u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
> >  
> >  void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,
> 
> 

Thank you.

Best regards,

--

Francesco




