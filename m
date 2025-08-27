Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A2B383C1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F49B10E81A;
	Wed, 27 Aug 2025 13:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fMZbe/SJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CC110E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:36:02 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3c854b6459fso2519976f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756301761; x=1756906561;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGOmUMQiFrZLOh8vf9B0X5R9r/nRdm1RYB7hggPhOyQ=;
 b=fMZbe/SJZYOmQonqjtY5UYZa/PhEfeJiUtFBYwP3tOouVPxEonao5mDKsZ2xY0LNaP
 xaG3GieunHCld1/u+SrM6DTICXKrzywQuQZP5rwXNh5TZEy6YFZJmb8OmfVyETXoPcr9
 CniPST4pUGw2C0xfAJUgTmaKU+df2w2HYOL99uvDP3BixMUzvQBHihkPNHbwjZtW56Yo
 UITsB0+hxm3Ygi6deeAmF6ECsgEJbMqpKwSd3/dRHbKbkCMXrBTLbz3oB2iucGik80OC
 74+2OceHhAnRJZkr97hpzD7SfB1NleyeHGfBTpEvwCGMK5dyPfZAUgKQztxCf4NSer2X
 YXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301761; x=1756906561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGOmUMQiFrZLOh8vf9B0X5R9r/nRdm1RYB7hggPhOyQ=;
 b=wRhUHuZqVHmc2fyXo3gY3SZg8zQ/LDBK1fnJvUKJrNnu2CpXJMiNSWwLVN7snBMDmf
 rSff3iXiTnu2sxHt86WuOIU8jvT2J8j4TwRHKfBFptI+e4hXMP6/5mlahwi4mNrLMLOu
 k0c41epx5dWbol785FJhwMkvN2oX28DDZXevcuFxXhwlrqNL+a2sKEhfk9omwAumnBZC
 BNgnObq3yJXqPlb7Y8Hb+pbJXWev8PMASSrm7Z6hMCpRGsOOkZxGBq+uzL9t1zy2BA6K
 P1MmtVj825MbDxd2tqB0lW2c3dep93+Jdn7cA/c9nKWc0PFvWMUMf4APZWJIs3e7mSWC
 lVAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm9eP2P64UVVR5cu0UNCfXSqXV7w0KkPO37DjqFWkQChoDAVtBdXFJdUBS/Uy7/yKde0jGxlhvc3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZr+XwjIOCd5fpojsrgxG2vMhHE+ob2lGaLwxAD/rwjbuVzXaE
 qw2i5DqtLJAkLe9m+//6Hx4tMnWTp/g6z8JE12VLQgNvfhLKXHG8fsTKPc8HN7YYeBRgFMmZFJY
 6tyy+SfUNM9Q7kThRUEgub9gZUygNU6Lbt8Rmmsog
X-Gm-Gg: ASbGnctFo2SDCkeZ74kp72MXMUqr6aLlApp4E+MigjakueJTzW+mZT5FhYfekF1LxXv
 CGpcTCSYHmM3u/XMhzUhChlcqmDUR3PI2g0uUixjQaEkD1s/pXnmckEPeFe1utHP8JXOA8kJe5C
 TYehnrSuT9MBGzTtzGUwfpq7EOgoTGtkjtfbPYl0Lvu3BI2X1CVgQPb6TmZYxb6YeBV2KAoeSGJ
 Oh7xXZlUUjqj/Vtdt5o6LSYDmKhyxvwi2LAbhtZq2qIKCM=
X-Google-Smtp-Source: AGHT+IHjHJmGD5DH9knJOvdRvJjpphE0DRT+0QgA7e0zgvj/m6tmppysdXDHMexnnD+ApseovkD6UD97qJ9iYad+xmk=
X-Received: by 2002:a5d:5f8d:0:b0:3c8:89e9:6ab3 with SMTP id
 ffacd0b85a97d-3c889e96d40mr10372677f8f.46.1756301761013; Wed, 27 Aug 2025
 06:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-3-c41a10d1d3b9@google.com>
 <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
In-Reply-To: <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Aug 2025 15:35:48 +0200
X-Gm-Features: Ac12FXxAkj8iFKvJ5DYueBHinszRbjebva-Cfx5kFVxyDxjx17skWDdJUMDf4aA
Message-ID: <CAH5fLghHYguGp=0OkL11u27x_K7x+xhd1QhQZoub-dQ1QbZpfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpuvm: remove gem.gpuva.lock_dep_map
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 22, 2025 at 12:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri Aug 22, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 4a22b9d848f7b3d5710ca554f5b01556abf95985..598ba376b9430cdd4ab7bac=
dc15de031a887cf71 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -196,10 +196,20 @@ enum drm_gpuvm_flags {
> >        */
> >       DRM_GPUVM_RESV_PROTECTED =3D BIT(0),
> >
> > +     /**
> > +      * @DRM_GPUVM_IMMEDIATE_MODE: use the locking scheme that makes i=
t safe
> > +      * to modify the GPUVM during the fence signalling path
>
> I think this isn't entirely true yet or at least can be ambiguous for now=
,
> because it doesn't prevent users from having DRM_GPUVM_RESV_PROTECTED set=
, which
> requires the DMA resv lock to destroy a struct drm_gpuvm_bo, which may ha=
ppen
> from drm_gpuva_unlink().
>
> So, for now, until we have the deferred drop idea in place, it also
> requires DRM_GPUVM_RESV_PROTECTED to not be set.
>
> (Eventually, we of course want both to be represented as a single flag, s=
uch
> that it becomes an either or.)

I'm going to introduce "designed for" in the wording to address this.
I don't think we need to say that you are required to only pick one of
DRM_GPUVM_RESV_PROTECTED or this flag, since you can use both if you
manually postpone vm_bo cleanup. Let's just not elaborate on that
here.

> I also wouldn't say "makes it safe to", but rather "makes it possible to
> safely". We have no control over what the users do with the mutex. :)
>
> NIT: missing period

I didn't put a period for consistency. Nothing else has a period in
the summary sentence at the top of the doc-comment.

Alice
