Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8F9272C3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D63310EA53;
	Thu,  4 Jul 2024 09:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ut6I1W6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF9110EA53
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:15:24 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-36733f09305so257368f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720084523; x=1720689323;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEcu3TbmNikaAxXTCEPk6N6lySiOq4MWvGXvQXKI8Us=;
 b=ut6I1W6KlB4kv+1XT9sK7ZMoL2ATFyToQ/0T+wzBTyjDn44pabt/JQtU474ie1k9wP
 r2ZM4Az+T1D8PrK3g4vXx8rr4dQ4lX7HIdQq2J8Ztr9fOZ7mSnwS3sitEI0FTJ6DXiAo
 1tLEyeUh8/VX3bd3gEnTfptX8FITQH3usVidAIo3gnj66p0Ci7tPdCwnE2MxWMpqemt7
 lqrLfSEFupt5qyPjiInodF2kLYCZCLJ+Uz+QZ1SRK2I1R8bOhcM1i7EGCnLQgBL7Dsol
 YqP65NGy/52mx/e/3U+4mWb2gR9FjkDynGOBht3cDPjAQ4x4dU7H3ts01NumR7lWcmB1
 K5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720084523; x=1720689323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEcu3TbmNikaAxXTCEPk6N6lySiOq4MWvGXvQXKI8Us=;
 b=AV5FRtp70fSC4S/cvqzSSimfPT4NsuCYmLPqC1Gp6ynLvx8O6uUj2IvdmKtaQDNDpY
 RDiUoDFq+D1C48+1uAR2crQUxKqDiIuFWhCbGHM1VQxjDa3lfb8DXI7xU787BMFKnuE5
 BLNvcc70ToJ4ZtSHp96G5E28O3vuruv7axU7edhsgcuDNIe3djJrgffauV+MRAfLPwBg
 1E5Khj0r4xoKWU3BijtdaXl9JzDXawwggrNzA8nwcuu00bZHrqhLUtIUOSja+klgo6Aq
 wFKvrn3fCEDx8eH879Kzvv9tFa5BF/wAKgqz4vMrY4Ce8MnKyFg8hAGqZgkpc0eN89nH
 zW1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV1Rl5m+8GvHIm2/eGjeMvmasOiV/2KU8vfordRU2gq9Usrgu47ccNPHTPddTkck+a58WlfQMLx1+9i1GkqKLgJfXkd0/88+JFebTG3hz1
X-Gm-Message-State: AOJu0YxnIbAVXW3wBQTuotREjTaVSlTwaWE6HEPTCXregEsQSu4cVCLr
 5fZSDe1L3oWZGuQXAMm4Hkr8JHvcfs0dgVLZk9RDpnO+jvJFxDo8ZoS7lHr403LlKeNskxP4t90
 M5DfFOajirmom/n4385/lCbrVoJma7r6N9Z5Y
X-Google-Smtp-Source: AGHT+IE/247r/RY0UrlCo6aEEA7oWQssQzwGwJkUeqjFdh0tQShwvHV1WozYijQBpev7QJs4+kVGYg1txqGiSZWkMaM=
X-Received: by 2002:adf:f3cc:0:b0:367:947a:a491 with SMTP id
 ffacd0b85a97d-3679dd443a0mr835906f8f.26.1720084522530; Thu, 04 Jul 2024
 02:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <2024070417-husked-edgy-f527@gregkh>
In-Reply-To: <2024070417-husked-edgy-f527@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:15:10 +0200
Message-ID: <CAH5fLgip4foLGkjzUT4vOCR1m3OgHuOq8u7=Zh+o2Zk2V45FKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@redhat.com>
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

On Thu, Jul 4, 2024 at 7:03=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 03, 2024 at 05:33:57PM +0200, Jocelyn Falempe wrote:
> > Jocelyn Falempe (4):
> >   drm/panic: Add integer scaling to blit()
> >   drm/rect: add drm_rect_overlap()
> >   drm/panic: simplify logo handling
> >   drm/panic: Add a qr_code panic screen
> >
> >  drivers/gpu/drm/Kconfig         |  29 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/drm_drv.c       |   3 +
> >  drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
> >  drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
>
> Wait, we can put .rs files in any directory now?  I didn't think that
> worked properly yet.

Yes, but Rust code outside of rust/ cannot expose a Rust API that Rust
code elsewhere can use. Only C apis can be exposed.

Alice
