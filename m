Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D6AE0D2A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 20:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621310E0F2;
	Thu, 19 Jun 2025 18:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RYq/9Nd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0272B10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 18:51:09 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4a44b0ed780so12908241cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750359068; x=1750963868; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKKAk183LON0LaFk62wU7oU2Ma5sbSO4CJebMn0Pu3E=;
 b=RYq/9Nd6Uq+o/v8lR88Bj7X3U6FcWIPBSGi7R7OerkvtcPCKg1UGIiU8utta6lRpAw
 i0NR8ifYPWwkh9warl2XWMW1n1qe1t7s4n/mZx4QL3bf4oSPfIZvrRLku0JYnHZrqwiD
 FNKNPJAkj8QXMSKO9mcJA658m31AISFyA0URplpKMEghtdIeMgLZDxBr9GI1jTB5FQ+F
 caOSuVO3Bba0Dp4gB3Hj9HUAyuj84Z2Od+2IcfkyUlkW7wZ7NduiG3w+WUVHG1JiA5+Y
 5198olRi0LCLiW1etQno24Lr8FXmenA2rE4bRo9X76E+wGidNyFD6bd+8YV7kLiO9uUk
 nYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750359068; x=1750963868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKKAk183LON0LaFk62wU7oU2Ma5sbSO4CJebMn0Pu3E=;
 b=wyh8n0ZjHTUIhcA8mrKRQn7NaTXADdX4AGSlAmMKoJIz6h2AFCYyjHAvoY0GxrV/QB
 imzEzglEvlEic8Rrc5fcKALbUTxaeX9cwPqn8Nql4dzEG8khmgXvf2LqvsPbcw0ocUcf
 lUHxqvwCgbdD1JpK7XjQ9D+AGkWHZYS6eLki/Bd+3c9E4BbuCQLa670+0OwL1XCtR3oh
 VMft+iISsiiXAgHYwqUvl9AaRsLC4o/UZ9pGKxPa1NPtBuiBRTF5BKoNOL+iZP2Gw8su
 pRTu66tX1MaX0Jur4h0oc+Wrjz/pUKYXGfXAor5kHLbYVTz6GYxfw7XVa65PYkS/WcW8
 A6bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdwOvXThF5z34sn+Gc/VZqPN8Alta070ScmIK/oxtfUL/USEAQ36B6u7NY58LcQhVF7rhOuyrhGBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCw17IOmSGO3nyO95KGZxi6g4GaTAP0qlpmGhEtsxkARPqoyZ/
 w/E0SbQO8oN8Y9puUP0pIkNJvINEo/zNYAQKgtFayxKbB4o36X5I3CiE
X-Gm-Gg: ASbGncvLaPGe6D6r9WEkCI9hWa3XvpgiXW/rNWJ4bDAWa3PMzGDqr4iw4wnriYfiKqf
 HlWhQzwBXkySXsjDf85vbMcEaLbig7uT91N/5tB5sT6xGSRyUMLW89ksXG+Wgnze/sImfj6eljz
 Ba+HG901IMpnsYNdmGlxMxPPfsq+V+FVoUQNAmtr89qAP3n51S/QnwZxAKPT1HxrMKcUP1kre9h
 jq+aby4SbM92xdahUHoB42/j7Q8uPvmn6JTLDDPzmZJ804YeUadC0fZgbzbuAKV7z8GO4Q0/TSv
 VdBCGibP2QZGAmuth2m48dp2ITng3O9pFl0sZ6xWavAbgdPDDFSOlv2QFmvNqSWhRAtU6YSVI+o
 VfT7tMRdtdU7LtIQSAx8cOD3oPTcJ2C2CmfCkFLC2rATR9udJD2gz
X-Google-Smtp-Source: AGHT+IEDmzFBjR3SBwALgKUML5XliuafaE6n8mmnU7/RfTa+6/FBfzM8QiP8jGq20AksCvZSjKAR+g==
X-Received: by 2002:a05:622a:408:b0:4a4:3963:1e10 with SMTP id
 d75a77b69052e-4a77a24bca7mr3055671cf.13.1750359068595; 
 Thu, 19 Jun 2025 11:51:08 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a779d6df17sm902981cf.30.2025.06.19.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 11:51:08 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id A07DF1200043;
 Thu, 19 Jun 2025 14:51:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 14:51:07 -0400
X-ME-Sender: <xms:G1xUaMqpNGlla0O-EQDV2zzANztpPNXDPLtvR5JfsQgJXX44MYdPVw>
 <xme:G1xUaCrjJRYew-Q1H1VJYKOD_rLXPOQuveO-PjSWmJCeh_hOGCiOk4pNhgk2mruIJ
 VAHUNlTqpHPcoI8Jg>
X-ME-Received: <xmr:G1xUaBPNUUbRcfDPffEMTVaYgpmP3F6SFuQGOQeVRXvef3LZwj8sBP5_hfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeivdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
 nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
 hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
 hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
 jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
 hnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphht
 thhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrd
 grlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepuggrkhhrsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopegsvggrthgrrdhmihgthhgrlhhskhgrsegrrh
 hmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
 oheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitg
 gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhu
 ohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtg
 homh
X-ME-Proxy: <xmx:G1xUaD7PejvU0ja62vAPLexQ6evqGyvINo7mBADgQpxse8rnDBexdQ>
 <xmx:G1xUaL6157ab8nVGemTuXg_7n_M0zAYacf_SxYey17I_qmdu5vgWIA>
 <xmx:G1xUaDiy_90fnTtwfmMdq4NgBOYyfnvL6uEHPBD4Fbk393EWrjVhlg>
 <xmx:G1xUaF7DOo4cX9Q4IHbxz0Cr2zEXgfek6Rlv7kl-nEReKCmj6EWt6A>
 <xmx:G1xUaOJv5AHvWJ2VoVXPOaXyNfRd2YDppteE-eEGCcE-8Sk_PfusLJDJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 14:51:07 -0400 (EDT)
Date: Thu, 19 Jun 2025 11:51:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFRcGsS6wfb-HfEg@tardis.local>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
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

On Thu, Jun 19, 2025 at 03:17:31PM +0200, Benno Lossin wrote:
> On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> > Hi Benno,
> >
> >> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
> >> 
> >> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> >>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >>>> index 445639404fb7..12b296131672 100644
> >>>> --- a/rust/kernel/drm/ioctl.rs
> >>>> +++ b/rust/kernel/drm/ioctl.rs
> >>>> @@ -139,7 +139,7 @@ pub mod internal {
> >>>>                             // asserted above matches the size of this type, and all bit patterns of
> >>>>                             // UAPI structs must be valid.
> >>>>                             let data = unsafe {
> >>>> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> >>>> +                                &mut *(raw_data as *mut $crate::uapi::$struct)
> >>> 
> >>> I think we have to document the guarantees we rely on to create this mutable
> >>> reference.
> >> 
> >> If the C side is using pointers to read/write the value concurrently,
> >> this is wrong, it needs to be wrapped in Opaque.
> >> 
> >> ---
> >> Cheers,
> >> Benno
> >
> > How can this happen, exactly? Can you provide an example that corroborates it?
> 
> I don't have the context on this, I only saw a raw pointer being turned
> into a mutable reference and that's only possible if there are no shared
> or other exclusive references for the duration of its existence and no
> raw pointers are being used to access the value.
> 

I think in this case, as Daniel described below, `data` points to a
buffer either on the stack of drm_ioctl() function or allocated from
kmalloc() in drm_ioctl(), and drm_ioctl() copies userspace data into
that buffer, so at the this point, the data should be owned solely by
this function. But of course the safety comments need to be adjusted.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > The general pattern for drivers is to fill an uapi type and then wait on an
> > ioctl. The kernel then copies that using copy_from_user, so we're safe from
> > that perspective (i.e.: from the perspective of concurrent access from
> > userspace).
> >
> > In kernelspace, we usually extract arguments from the uapi types to then
> > dictate further processing inside drivers. In what way are these shared with
> > "the C side" ?
> >
> > If the result of this discussion is that we agree that this Opaque is not
> > needed, then we definitely need this patch, because using Opaque<T> complicates
> > all ioctls implementations by making it harder to get to the inner T in the
> > first place. We would have to needlessly add a lot of unsafe blocks for drivers
> > that wouldn't otherwise be there.
> >
> >
> > -- Daniel
> 
