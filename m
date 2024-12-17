Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06209F4702
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DBA10E45A;
	Tue, 17 Dec 2024 09:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v3Ld4ue/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00910E0FE;
 Tue, 17 Dec 2024 09:14:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YCB2l2964z9stj;
 Tue, 17 Dec 2024 10:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734426863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksNkl0DtHPa2EbcU5GeG5cHLr/UJn4PPo/rTI4kbE8U=;
 b=v3Ld4ue/jeEeN/my9nerI9uNHEwRRLFF+cBQuVDpStaEA/wEX4JtyJUQhoEcd2KHg2PKy7
 9ASsd4qW1GFpeM8VBfiF/Bjv+0MevcXtcXlvew6jFbMrp9sbVxTPYE717rjgsHTyrMTrkp
 K3wOD3G0RYZ60dQSKE2ZcqHpj8Q/NIJNKszg7id/Zr9Ymnrtf+TGKfk9wJnvsWA/eDt4Xu
 S1gscDGmODUki3xYx2csfql/3mGE50YumRGKkQlp6kPHmgINs1Fzt3q8d1KxYjieWV9Duv
 t3jN+C2C0alv7ED5QfpF03J/bAk1Mhm0IpEAS2soR/QgIZleAoR3h7/7s3nHQg==
Message-ID: <0f15e4b9-f867-4cf0-9c97-a4736dde29b1@mailbox.org>
Date: Tue, 17 Dec 2024 10:14:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <CAAxE2A4+6fMd+Ly_5UgAnLxWP3NTYyc=boCK_H7-_qsrgsE2eA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <CAAxE2A4+6fMd+Ly_5UgAnLxWP3NTYyc=boCK_H7-_qsrgsE2eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a2450feaa1ec58d42a0
X-MBO-RS-META: hu1g5ifknxys33nmcoj5ciraarh484bp
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

On 2024-12-16 22:29, Marek Olšák wrote:
> On Mon, Dec 16, 2024 at 4:27 AM Michel Dänzer <michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>> wrote:
> 
>     On 2024-12-15 21:53, Marek Olšák wrote:
>     > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>     >    
>     > Signed-off-by: Marek Olšák <marek.olsak@amd.com <mailto:marek.olsak@amd.com> <mailto:marek.olsak@amd.com <mailto:marek.olsak@amd.com>>>
>     >
>     > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>     > index 78abd819fd62e..8ec4163429014 100644
>     > --- a/include/uapi/drm/drm_fourcc.h
>     > +++ b/include/uapi/drm/drm_fourcc.h
>     > @@ -484,9 +484,27 @@ extern "C" {
>     >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),
>     >   * which tells the driver to also take driver-internal information into account
>     >   * and so might actually result in a tiled framebuffer.
>     > + *
>     > + * WARNING:
>     > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
>     > + * support a certain pitch alignment and can't import images with this modifier
>     > + * if the pitch alignment isn't exactly the one supported. They can however
>     > + * allocate images with this modifier and other drivers can import them only
>     > + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
>     > + * fundamentically incompatible across devices and is the only modifier that
>     > + * has a chance of not working. The PITCH_ALIGN modifiers should be used
>     > + * instead.
>     >   */
>     >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>     >  
>     > +/* Linear layout modifiers with an explicit pitch alignment in bytes.
>     > + * Exposing this modifier requires that the pitch alignment is exactly
>     > + * the number in the definition.
>     > + */
>     > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
> 
>     It's not clear what you mean by "requires that the pitch alignment is exactly the number in the definition", since a pitch which is aligned to 256 bytes is also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly the width rounded up to the next / smallest possible multiple of the specified number of bytes?
> 
> 
> The pitch must be width*Bpp aligned to the number of bytes in the definition.

The comment above the modifier define should spell that out unambiguously.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
