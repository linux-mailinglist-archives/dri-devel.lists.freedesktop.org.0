Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE4A8CCAD1
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 04:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DAF10ECCA;
	Thu, 23 May 2024 02:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YWAg08qW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E727110ECCA;
 Thu, 23 May 2024 02:48:57 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-61af74a010aso17376887b3.0; 
 Wed, 22 May 2024 19:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716432537; x=1717037337; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TJvI5ka+7JgZUuM9P+5dJkLsAfZT/399LMPF7VVV6Qw=;
 b=YWAg08qWoeRdBD/dNzOvuIGdMjjN6X4teY1Z3TPnkyvdiCSWDlt/ux7j7oQ+qIHDCZ
 QE2cd1uao5PqYiE4Lq6mqiNWL77ky0Xtb0B3mTlBM5MtQX+sckp7rMk32z4he5gpmjIU
 cORfvzHBBeboYuFC6VRyCNrC5FKMvNayrckunnDWvOw39S0ZuP77OMK6QhMjc8bqLHHJ
 xyhGaZBnxomRhV9H8JZCcFCb4h2z2R+y9JxZTGh8S17Kk34pVNrBW1/ThQHQcId7M0Ob
 qF2ZkhggTZjoRGsX1cAdgQsjd8cNx17Mi1rMjhjZ/z3o8QCDXMzN+Iol0PoRg/vrDd2c
 DmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716432537; x=1717037337;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TJvI5ka+7JgZUuM9P+5dJkLsAfZT/399LMPF7VVV6Qw=;
 b=CCsZlpsQs9aiEdHl6Rk5JGsn1uhFv6BZan/2Fjc+PC5y9C5l6FFUqAreDxsMlhFZeZ
 GeNKuqRjmhzoGuDyAoNoTog8uDzS1t1I8tsD1XBJ7J8I1frUq1JsRW3sFTju3uv2D08k
 Sk1SeOEYrrnW1MJHGiMU2gcmJgORX9/PU+gTvZ2c8XSF7Kn+SudtiUCN5NTO22PENMRS
 k1H1XfYLPkn8TtNcLTSeCvORdtOGUn4UHMlAvtRt75CZCaKd3vySh6c3stHpcEdsNdCI
 n9nUqXmq4r0qEQ+ioWnEmBk7BAXe7A8v9E/knurSttQgp66Ocyu8T3V9fvSHeAwF1QqR
 0Pyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5ZQLGAtvXfwUkr+kP6U5cOuh4c+aiK6rG1jTPy3sAhL4fXmL4qRHhb0p0jyryGLW0LqspZiIS+xlbQqUDfl4D0pZysfpUKWnGmRkYXn+lUwSAcnsigwPn42BMD2J8t6g2LbFGxyp5xmp0zTg9Pw==
X-Gm-Message-State: AOJu0Yxw1K1WCzUkIo468okM3VcZ/ShWQDFTMOTX6ezL3ygxRQx7ckEm
 NhjYBwmA/cAIjrvj5n8MSAoEzLKgUUB4yYltvoL5hpRsjKFdzDNq
X-Google-Smtp-Source: AGHT+IH0dxdXbgmC4rYlR/hwUOO+Wp8dfkUpjfFuvGBklHjUOcOUKupWE7JhBWZ/Fbp+d7zv5g0sWA==
X-Received: by 2002:a05:690c:660c:b0:627:88fc:61e4 with SMTP id
 00721157ae682-627e46c77a6mr47090767b3.1.1716432536685; 
 Wed, 22 May 2024 19:48:56 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com
 (fauth2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ab9335edf3sm486806d6.54.2024.05.22.19.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 19:48:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfauth.nyi.internal (Postfix) with ESMTP id 5D3BB1200043;
 Wed, 22 May 2024 22:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2024 22:48:55 -0400
X-ME-Sender: <xms:l65OZr9JgWgOPevW5yJppccZOOcaKoF1y1Q-zOeEZOswlQ-KqF7COw>
 <xme:l65OZnscWI1OsvTggyuLZVJO_Bncv7ufzMNE5V3hj-DMKkUJf0KNMJLGKWdnpDbTf
 f1Llj0I-VdnK9fASA>
X-ME-Received: <xmr:l65OZpD63joYbDlA02gOpBHu68Z8AqYCVeGfdTJcU5aXuCrkC93E0IM-2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeihedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
 uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
 grthhtvghrnhepveffgedtgfetvdfgudfhgfehgffgveevvdelkefhjeeiudffkefhhfdv
 heeljeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptghhrhguvghvrdhrshdpkh
 gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqie
 elvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdr
 tghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:l65OZnd7sYcwsq4EahySDVP_rcHk5LbPyZCq3gVR9UPROv5R8kxsEA>
 <xmx:l65OZgNAdnvMAm4YjgLWf2ArjzaV4-wkunlqPk7laIC3sP2UbPJumw>
 <xmx:l65OZpmPhuz8l8B2xc5bBebr2iev-w4i7F-whjk-ZadLf6TOxiFOjQ>
 <xmx:l65OZqsr-BuwfODBOdojAbsWIzKP4m-LGWgduDHqXUdk4bT6XG6DYA>
 <xmx:l65OZqsGO3Q7ks2k17BChTc3GSPOdJHTB9Od0O7mkbGZCU-g6zbTQKVf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 22:48:54 -0400 (EDT)
Date: Wed, 22 May 2024 19:48:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: pstanner@redhat.com, dakr@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zk6ulWF72cbp14O3@Boquns-Mac-mini.home>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
 <20240523.081513.81513679981916366.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523.081513.81513679981916366.fujita.tomonori@gmail.com>
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

On Thu, May 23, 2024 at 08:15:13AM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Wed, 22 May 2024 09:37:30 +0200
> Philipp Stanner <pstanner@redhat.com> wrote:
> 
> >> > +/// Abstraction around a C firmware struct.
> >> > +///
> >> > +/// This is a simple abstraction around the C firmware API. Just
> >> > like with the C API, firmware can
> >> > +/// be requested. Once requested the abstraction provides direct
> >> > access to the firmware buffer as
> >> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new
> >> > buffer using `Firmware::copy`. The
> >> > +/// firmware is released once [`Firmware`] is dropped.
> >> > +///
> >> > +/// # Examples
> >> > +///
> >> > +/// ```
> >> > +/// let fw = Firmware::request("path/to/firmware.bin",
> >> > dev.as_ref())?;
> >> > +/// driver_load_firmware(fw.data());
> >> > +/// ```
> >> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> >> 
> >> Wrapping a raw pointer is not the intended use of Qpaque type?
> >> 
> > 
> > What is the intended use?
> > As I see it, all uses wrapp some binding::* – but a rawpointer to a
> > binding shouldn't be wrapped by it?
> 

Thank you Tomo for calling this out!

And yes, using `Opaque` on a pointer is weird. A `Opaque<T>` is
`UnsafeCell<MayUninit<T>>`, `UnsafeCell` means the inner `T` may be
accessed by C code at anytime, and `MayUninit` means that the inner `T`
may not be properly initialized by the C code. So as the doc says:

	This is meant to be used with FFI objects that are never
	interpreted by Rust code.

that is, Rust code should never create a `&T` or `&mut T`, it should
only be accessed with `Opaque::get()` or its friends (i.e. accessing it
via a raw pointer), much like a black box to Rust code in some sense.

Hence putting `Opaque` on a raw pointer is not what you want to do.

> If I understand correctly, it's for embedding C's struct in Rust's
> struct (as all the usage in the tree do). It gives the tricks for
> initialization and a pointer to the embedded object.
> 
> The C's firmware API gives a pointer to an initialized object so no
> reason to use Opaque.
> 
> With such C API, Rust's struct simply uses raw pointers in old rust
> branch. For example,
> 
> https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/chrdev.rs#L28
> 
> struct Cdev(*mut bindings::cdev);
> 
> 
> Another choice that I know is NonNull:
> 
> https://lore.kernel.org/lkml/20240415-alice-mm-v5-4-6f55e4d8ef51@google.com/
> 
> pub struct Page {
>     page: NonNull<bindings::page>,
> }

Both are reasonable for temporary use, although, we could generify the
"wrapping on pointer which owns the underlying object" in the future.

Regards,
Boqun

