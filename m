Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58650B3B7FF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 12:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9B10E204;
	Fri, 29 Aug 2025 10:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uk5F46ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF33C10E204;
 Fri, 29 Aug 2025 10:01:20 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-32326e6fa7dso172890a91.3; 
 Fri, 29 Aug 2025 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756461680; x=1757066480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRH8f0w1otAreNEGbebgngaGLPIDb4bCYEPCriBHAFA=;
 b=Uk5F46nyTt0YGsYdinnXIvrNPDv6cwq68KR3jfjsMlCNYgR3SzL8qoD2kHUImIVQkE
 BnvwuV9HawQm1XTOdPDtiaXPR6GDynN2z3aYB6mo42j/raQrw335sTU1w6HxMhjtmjsu
 JEQlVzyECCzoloIK6gefn8I8kmRUsBlDaJ28Q1tgCCakkDYLykNMA45/Jmp2um3PSiK3
 SvaZzQZFkKXQ45HFydYwX7xyMTEpSGIm7wdsG9bD6K8yhdd0ChfJt1LVhAWGrh0qt7Fk
 9XHAhoyEoMQ/4fD5KYO3M8IUz47n+XGi8pflfpBmlFCmVZKw5hCqCD2K6cffxJzrU23K
 jcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756461680; x=1757066480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRH8f0w1otAreNEGbebgngaGLPIDb4bCYEPCriBHAFA=;
 b=C6fiVNzVzs8d0fOt1rXchTgX2ltbVtot/HgiuMfL9AA3jMI5V5xlz1yVDVBIh7emGH
 c7MQv64yQZtQb1ltardCDcYjviy8MCY4Y/fjneKXWylgocgAeUOYg4q0o3LYRvtZWST+
 1emu5aJ+DkrDfPaNtz4Nb3XAnQqwGt6GqYtMmWD0zKIeIB3msROZb1Y6AWBRmCewFC7p
 pICNhQ8jKEBBBvhDeJHwhqlZZJ2W8Gj5jy+TWkOn/kBynXgI0Uu0qAqTDwpSxIBPL3r5
 vt4yqhGjSTFaVg2BIqi7u9M6Of0+nhnbBYPhUZ+ZgrRvcaLbI1WERdMLyjzpgGbYGOeX
 7/Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXkiM3AJbrcnz1BtTo4BywDPFKktnl634ihbp9f++gGk9Vj8ihmkbgUVf10T8wp3qQfXsiiq3EGMA=@lists.freedesktop.org,
 AJvYcCX1hQm3GqGLeRR+n0P8VqqNHr7E/BWmjQO+W7ukx0T0/qaK/Xklz7eHp4oeC7UQnD+GRKRE1ugYRw==@lists.freedesktop.org,
 AJvYcCXLbct3XsPZp3z6tCw753Vg+GbLqHlkW0COxMSf4Zp2OFFz2sxM7jdE2a1jlYL4Bt0nF9THgyN+q3kvUlqgR5Yx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuYBk/mHIMxvXCnNnG1Hpcwl5gZYpKxwp1Sq33gZOwUitCPHKH
 21p3NZDyP26T27ZqYWmarrcHUPqwtr4IJHEzwOZ1Ff44aHFiN9dTyWo+6JqAj6NFPkpS6DuGaof
 qmKRvKag8eqmOU95QHgkQLLHh1gmwIlU=
X-Gm-Gg: ASbGncu40Lkbj4gcCDvZg3fu5ra4PrWXM1BgRBfTtCdpT7XPVNJPQPPHLxnKVFq+OvG
 ZW3MW1VZhV67JEEoKEYXDfzbeu1RadwJ3//JA+Q6Qg52mbm1ymTDaXff0JHXllFVxe1Dn1TZ/U2
 HqfQBFWqQqVB0Z2daD1L2PxGRk5yJAN2K0rq6g0OLTh2fYjwApbjoT9UlaLvfVVNy4pe+ikvL6z
 6Uy/QXhRYLfDjJWo2QEQWtvCawRlyUjLiM73htnz9/73fOWCF7hOPPqi3Bfl8A8ox+m/YUhX8Do
 euj/QeY3Mr8uhVd3O+qedUt2pH0v1khhXNgb
X-Google-Smtp-Source: AGHT+IGJ2lYXuFya1m4Ramq705Evx78C2MmKVqkr3itmOClvIB24UWN1rI/gpubgLX/l8W3IhjN7k4QwxP207019zQA=
X-Received: by 2002:a17:90b:4a90:b0:325:cce7:f661 with SMTP id
 98e67ed59e1d1-327f5b1c87dmr666852a91.1.1756461679909; Fri, 29 Aug 2025
 03:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250828083737.22214-1-ojeda@kernel.org>
 <DCEKTF8CP2GF.ED9G9ECQMBHM@nvidia.com>
 <6f32c400-1f8c-4367-8be9-f7082ea87626@kernel.org>
In-Reply-To: <6f32c400-1f8c-4367-8be9-f7082ea87626@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 12:01:07 +0200
X-Gm-Features: Ac12FXznrXiVcLbGyYEw1vb2wal1r3wZH6fiCopGfQPJ8S6r4KIMuLcfzgZ6bWs
Message-ID: <CANiq72n5N3yHU_vxjiHk=TeJ0ouW1+xLDw43hcOVv6qSPFa=sg@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpu: nova-core: Boot GSP to RISC-V active
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 apopple@nvidia.com, 
 a.hindborg@kernel.org, airlied@gmail.com, alex.gaynor@gmail.com, 
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
 dri-devel@lists.freedesktop.org, gary@garyguo.net, jhubbard@nvidia.com, 
 joelagnelf@nvidia.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 nouveau@lists.freedesktop.org, simona@ffwll.ch, tmgross@umich.edu, 
 ttabi@nvidia.com, tzimmermann@suse.de, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Fri, Aug 29, 2025 at 9:40=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I'm happy about every potential additional reviewer for Nova, but I'm not=
 sure
> it scales very well for the rust-for-linux if we get more drivers. :)

Yeah, it is an informal rule I/we added back then so that people
interested in Rust in the early days can follow everything in that
list.

The expectation was that eventually it would go away organically as
time passed if Rust grew -- I mentioned it here since I saw people
mentioned explicitly otherwise.

@Alexandre As for your `MAINTAINERS` suggestion, up to all of you --
other entries do that currently, but it is not a requirement, and you
are big enough already (have several people looking at patches etc.).

Thanks!

Cheers,
Miguel
