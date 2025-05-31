Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8681FAC9B50
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 16:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFE210E08D;
	Sat, 31 May 2025 14:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U9vflweR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB1010E03D;
 Sat, 31 May 2025 14:09:42 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-23496600df1so3023345ad.2; 
 Sat, 31 May 2025 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748700582; x=1749305382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUoEx8H/KVzfoUg1ZEZiII0xV0maDmmY5gK2aXzz3UA=;
 b=U9vflweRyRgmaLXAQvgIgG/iSbJPBkQBTaJyt8glN1LaE3CxDg6uZN98GhdTOBzroB
 mqvbHR58Qg/XGxdnOJvAzratdeQdv+fIxmOjkvlv9LwwZLtJZq3v4D4McpC7GrXBROep
 iM3g9kAMj3NQ/74Younrs+iRk+gMRPcriLQxjgtKSPW7vpC6wfuxzrCBJbBZ4bdq4kU5
 fXNQ26/cl+vATOizgk8aSHoNj7zffQIqi22qAndYE208FJTSTw52rfH1HxA322pssM2e
 XoFPoxEC4FEk71njdP2Q4IoEIyyu36C9qGYzZb8C1Igxrs1nNfSeb46WR8dY4DaFMiV5
 5FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748700582; x=1749305382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUoEx8H/KVzfoUg1ZEZiII0xV0maDmmY5gK2aXzz3UA=;
 b=roT6W3i4M997MKz9g/jiQlut1WTs2/qBm5BvmL/7CqgMGa58hpbb2uD9KOUebXDjdC
 Uclc6tNGZbQ9A1sFUC9FSpL+0X2amigW/Rc5+vCw7a1Io/bYUzFm5hvY0yCoJ2S233Fe
 uJ1nxMyIww7pgZoZyxt5/SxLTAYQJvdvh0qXFfyqEZ4hLmWdcYP41TOjpeUPqcJILAjT
 Lls+m5GfS+UsOqkEBoCyHnsy+5b8DOAYuy31sKz48GTI3O/psVgPIusQFEXoLLoEVdB9
 58avxC8jS9zyhsjmcyLDRaRhv9t9V54W46/GuqiPSUgtonQipMLHXPzBcA8/K/tUaqOW
 IFig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAIDaDoMyx+ks23y0jhzHGTI1berXpKfnQjhu3yHpHbjLjz1kzaZr68uK6oknTk1zW+diNINxCLw==@lists.freedesktop.org,
 AJvYcCV2MWXGk5Ly0vbFrzPQih4M3KSSZu0oBKs/TMhRu2FFhlejqW0w/Qnja0DkkIvHHY/GtLu9vLcQ7vE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMLLajoGuwnCpICTb1V13yMPeMsKZlNQ37ykGFFETLMJX1jztq
 NCq9NcsioujEzzll8I2OktmTMntvOrQKt6ShgJdE9yubACgY2uNBm69vj73JM2q4vt5Ou6hi5Bg
 CwTsyCvVsWv5esGFx0a2yvT3NLMFolJk=
X-Gm-Gg: ASbGnct+kO57FTKKQqV+6uM5Tv1YHwG2Fi5PU3/TBjboAWef8nDRioTBGQQawTacz5u
 g6Zwz9mttDozB7HBCNJwWas22G620Ap7KtoVjwLbTcp0Iwjzf3aZMcSYzEdl9/JtjhfKvskkTtL
 Mfoz2Bf32/IhUPN9ONNQUIx+Qn5lKyJhsN
X-Google-Smtp-Source: AGHT+IEspOjKjrSMaDPUZm3os+Lu9UscySkhErkqZ+b2ldXhGBsFlg8mPJC77+6o2Bz6O5zQXWG7deG8XDVluRWv3GM=
X-Received: by 2002:a17:90b:3c85:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-3124db050femr3602044a91.3.1748700582022; Sat, 31 May 2025
 07:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
 <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
In-Reply-To: <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 16:09:29 +0200
X-Gm-Features: AX0GCFswDAyLG96-rV_NBPeq61h0apxRhahuyfPFqf41zfiQeci120cEPxAvoNk
Message-ID: <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
To: Lyude Paul <lyude@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, May 30, 2025 at 11:51=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> JFYI: You can actually just say Result here, since () is the default type=
 for
> the kernel's Result type

+1

> TBH - we should really add some safe bindings for sleeps instead of calli=
ng
> this unsafely, I'd be happy to review them if you do

In case it helps, there is:

    https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.t=
omonori@gmail.com/

I think that is the last one -- we have been going back and forth a
bit on it (e.g. we had `coarse_sleep()` in the old `rust` pre-merge
branch), but, yeah, let's try to get the abstraction(s) in.

Cheers,
Miguel
