Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC49F4833
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7329810E8F1;
	Tue, 17 Dec 2024 10:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LaAJueVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2736 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 10:00:02 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7810E8DD;
 Tue, 17 Dec 2024 10:00:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YCC3M1tpWz9skF;
 Tue, 17 Dec 2024 10:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1734429599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCr3X9r00OTxTHC+yOJMvT6QCQy9u9XxzrPt9Y/x1Rg=;
 b=LaAJueVTUF+0C6O7B2Y4AUHzsK2ERC//+KK/yG+BAjjRzIQeALL4s3ViKfiMS+A9jpyzEA
 ZN24PhyBh2RDKcy3Zlg3FCmyCy2LsY4sbcl5IQq4oQ4jdxArPtfup7VbY0ZXTEpEC48Ulo
 uPS55HjjqIsEh9jdLYBy9YH6y9+4mQyo0g/+GvJyBSp7fiAxYGKc2DU2ISoPsSyBRVmEP+
 VHzpoVdiFYTBnP7tJvyIf6SLAcXENCyUm3voFDQpPZxr2A5/UK4fEB9hi/kvR8Vt6LOWSd
 83wOR4PxPCRj1mrdsMQIKWK7Q+a8GApvvygiY3dpmKLur+h1VkPHA0vVjMQHTw==
Message-ID: <9e6c68d7-abb6-4cf1-b1f5-56260a6f0417@mailbox.org>
Date: Tue, 17 Dec 2024 10:59:56 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
 <CAAxE2A6WVzkfeG-yU8QzM=V4qrWWKw7N1i2Ado=iNQMn5v4gGQ@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <CAAxE2A6WVzkfeG-yU8QzM=V4qrWWKw7N1i2Ado=iNQMn5v4gGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3a814d31abc28a42f50
X-MBO-RS-META: 4ffd399di87zubwjq848br1nqbkadd3j
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

On 2024-12-16 22:54, Marek Olšák wrote:
> On Mon, Dec 16, 2024 at 5:46 AM Lucas Stach <l.stach@pengutronix.de <mailto:l.stach@pengutronix.de>> wrote:
> 
>     Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel Dänzer:
>     > On 2024-12-15 21:53, Marek Olšák wrote:
>     > > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>     > >    
>     > > Signed-off-by: Marek Olšák <marek.olsak@amd.com <mailto:marek.olsak@amd.com> <mailto:marek.olsak@amd.com <mailto:marek.olsak@amd.com>>>
>     > >
>     > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>     > > index 78abd819fd62e..8ec4163429014 100644
>     > > --- a/include/uapi/drm/drm_fourcc.h
>     > > +++ b/include/uapi/drm/drm_fourcc.h
>     > > @@ -484,9 +484,27 @@ extern "C" {
>     > >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),
>     > >   * which tells the driver to also take driver-internal information into account
>     > >   * and so might actually result in a tiled framebuffer.
>     > > + *
>     > > + * WARNING:
>     > > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
>     > > + * support a certain pitch alignment and can't import images with this modifier
>     > > + * if the pitch alignment isn't exactly the one supported. They can however
>     > > + * allocate images with this modifier and other drivers can import them only
>     > > + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
>     > > + * fundamentically incompatible across devices and is the only modifier that
>     > > + * has a chance of not working. The PITCH_ALIGN modifiers should be used
>     > > + * instead.
>     > >   */
>     > >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>     > >  
>     > > +/* Linear layout modifiers with an explicit pitch alignment in bytes.
>     > > + * Exposing this modifier requires that the pitch alignment is exactly
>     > > + * the number in the definition.
>     > > + */
>     > > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
>     >
>     > It's not clear what you mean by "requires that the pitch alignment is exactly
>     > the number in the definition", since a pitch which is aligned to 256 bytes is
>     > also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly the width
>     > rounded up to the next / smallest possible multiple of the specified number of bytes?
> 
>     I guess that's the intention here, as some AMD GPUs apparently have
>     this limitation that they need an exact aligned pitch.
> 
>     If we open the can of worms to overhaul the linear modifier, I think it
>     would make sense to also add modifiers for the more common restriction,
>     where the pitch needs to be aligned to a specific granule, but the
>     engine doesn't care if things get overaligned to a multiple of the
>     granule. Having both sets would probably make it easier for the reader
>     to see the difference to the exact pitch modifiers proposed in this
>     patch.
> 
> 
> That's a good point.
> 
> It could be:
> - LINEAR_PITCH_ALIGN_EXACT_#B
> - LINEAR_PITCH_ALIGN_MULTIPLE_#B
ALIGN seems fundamentally confusing to me, since any multiple of #B is "aligned to #B".

Maybe something like:

LINEAR_PITCH_MIN_MULTIPLE_#B
LINEAR_PITCH_ANY_MULTIPLE_#B

"minimal multiple of #B" vs "any multiple of #B"


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
