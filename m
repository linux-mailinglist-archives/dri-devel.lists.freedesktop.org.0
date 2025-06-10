Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C2AD3AE0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B2510E569;
	Tue, 10 Jun 2025 14:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RA8T3w5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBD310E569
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:14:28 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-32ac52f78c1so55855161fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749564867; x=1750169667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuMEGKtcKU7mmxYrWQc80Di8yLcBsgrY66zcTsKw9jA=;
 b=RA8T3w5yiA+yCvRmQ2GYLwl3IC8tSNfe4k2D0pvAJBxD1wZepvMXbGLzBqVpfXwCP9
 NeSzWoHffeCaNL90+ilYutJvOOu1f6ilis/EO6hf5eo2DLKAa+KWCxYBi1Rx+WsIvVJ9
 0AAuBRcQl/MtOCYEkwQ8oJ8Ly+KNg66ENUMc50k+TROAOFVt1hDRi46/vwGYN1oq0t4/
 wn9jqjD6wufiaXDJejobUYhrq6OR9L42SSEKxXkmOw2pQU481lonq/80LASC3xqJZN+j
 4OkVUV1cQVHI25SsLkFdZ0Kavn+jpjUOp/gzqRv8MjQiXc1Uf1T+jQI2OQfBaYrhjB73
 0fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564867; x=1750169667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuMEGKtcKU7mmxYrWQc80Di8yLcBsgrY66zcTsKw9jA=;
 b=hvvbGi+1SnZx463zDZAUIUzbgc+OxAszk3Ma58fGjNya1k913ZOz0cqEUx2ODez9WF
 kXuEQdcZcjK6MG9lPW0IMAqVUTU7FuI5NAX045y+gYPFNaDtgcGo4mZJp+mqD43i+A+U
 wBn8qeljC2OFi/Kcnctv4nOlbuf9B3TyGc3u8ZfenfKVxUWoL99PRhNXFDgiZRJ3J3Xq
 zKrHSC4nv+sXE0fS0D0igNKrsimYoW7FRim3++Tja4swzSEH7fVPRSn86jFfJH2QCfPG
 uExN5LX/SZ6ODEF2rIGvVcHrdVv0DozE1dtIl+krOxZs5ni7ab4ejKyGQMpxJQI97s8T
 74mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUMWuM0mNYztQWmnb7IADyiQsaLUrmdjBq7h+01ySZDnFBvyurfB7h0Zc4By60hxEryVtzFr9Vnxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyILNqHiaSubMFH+E3kq+DTv0jkkwLmezNE0icVtEaliw/Vy6EX
 GjYRv3l/chKB1mAC0jupUa0xutBQt+3nQ8Dx2y7cVeJzy/twBbIzUusz8EPkxRhUpcLlAoo4F7/
 lbQsg4scgipzf9WLzMoYVXb3wtTgaDHI=
X-Gm-Gg: ASbGnctYHUTzTzHHF27JSxyzkcfv+nTOpalDHsABFjp8toiRlvc1h3kkc29NHDl6hjd
 /feOQMRRapbsZu9Qq/3K1fyGZvUndnBQeX9ZptFywa4Z5f0MnJb/rc57mARG5R4cr1WBEDrCyzZ
 01ISzqaGxQkXy/dSmrlsLqD+tv4ctF2hgkldAXugI/jc8/DG4NLRhiyBbEPxg=
X-Google-Smtp-Source: AGHT+IFs+FOaKv26OTPjKCXkGEVIsKYLeIeoc9L5o7yKIFbtvD9PHVbw58XaSCpX4CNs2yC2qsatn7XHITlBY36o8SI=
X-Received: by 2002:a05:651c:19a2:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-32adfe1dbf3mr46462091fa.35.1749564866581; Tue, 10 Jun 2025
 07:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
 <CANiq72kWtEsXDuoXpbTNRLiZ=c==Ne=v4igxCWMwWFj0LOC-Yw@mail.gmail.com>
In-Reply-To: <CANiq72kWtEsXDuoXpbTNRLiZ=c==Ne=v4igxCWMwWFj0LOC-Yw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 10 Jun 2025 10:13:50 -0400
X-Gm-Features: AX0GCFuew5JuDEc_jx48ZSACU5BVvcLvpbd6GdnUaVlDV59_UtgyTusAE2HFbXQ
Message-ID: <CAJ-ks9ny_VNvKM-w04kkk4Yw=UpYEt82TyFZZuXEFK=DxfwcgQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] rust: enable `clippy::as_underscore` lint
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Sun, Jun 8, 2025 at 5:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Apr 18, 2025 at 5:37=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > -            bindings::BLK_STS_OK as _
> > +            bindings::BLK_STS_OK as u8
>
> > -        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::B=
LK_STS_OK as _) };
> > +        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::B=
LK_STS_OK as u8) };
>
> For these two: `BLK_STS_OK` was discussed in a previous version, but
> why are we not using `blk_status_t` type instead?
>
> We are even already using it in the first case, and in the second it
> is the parameter's type.
>
> > -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io=
::{Io, IoRaw}};
> > +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ff=
i::c_void, io::{Io, IoRaw}};
>
> For v11 this can be removed since it is now in the prelude. There may
> others that can be removed too (I would not add an import just to use
> it in these patches, but if the prelude is already imported, then we
> should use it).
>
> > -        result.minor =3D bindings::MISC_DYNAMIC_MINOR as _;
> > +        result.minor =3D bindings::MISC_DYNAMIC_MINOR as i32;
>
> Similarly here, shouldn't we use `c_int`?
>
> i.e. it is the one in the C side, not the "resolved" `i32` that the
> compiler suggests.
>
> > -                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
> > +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as i32,
>
> Similarly, this should probably be `c_int` since that is the
> parameter's type, right?

Yeah, I think these are good calls - I'll fix it in v11. When would
you like me to send it?
