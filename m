Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A73A6E297
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 19:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF210E439;
	Mon, 24 Mar 2025 18:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QBRaFFQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDD010E439
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 18:43:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so1463391a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742841835; x=1743446635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDhZCTYQpfVjqWAeaYWpsSp1wpfRNQxkv4etm8lhI/M=;
 b=QBRaFFQcdm01+QnJ6NLzUH38VBf94T/kdH0kLNFfIq9wRsxKch1Xn7zTYQOXJw3H4h
 w80cvhy2rICAUkSi5oA6MO02IrtBf8vdBpUtonaiegYKFlBDlzFX9eUsHZi13vlxmcVh
 q+AwGe345VZ71hiNUTgGAI27MB3JlgNDiPi4WAQEr//ZF/2CGLD69iDXJHdFtk29s2+w
 Z577bz4GWI0+M0WmDXBCxguvJTsaFT9/Vcwbx1gMAlD4zn2uUuW/qSrC0Uj3jZ81FnvI
 MmrfyUSFY1i2RxdCSYZNeYlKxzwkBvZ+VU5QzswYtm9Ylb9UeB64oPIfEU4vH47R+5zH
 9Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742841836; x=1743446636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDhZCTYQpfVjqWAeaYWpsSp1wpfRNQxkv4etm8lhI/M=;
 b=J/q7F5F5lCHmH7+J+anJ+pm6C1A6d55lh4D9zUQDT3zChXxhxGGe7Q39rl+H91tFA0
 CezjkvJ9Lij7S5v6rlck016M7rVvLHWRQVhxROOXmPLJA814XmmiDlcvQU0N8GroyNHC
 GgV7OdkEy26eXFZJTq4bj1g9mEnkS8kODdW64MJTA9JP1osfS8PtaAFnS4qPHeYDm2N9
 qbKWCBo/iPMphvwMmqmSBNHBr1baTsnMDp3s98XmoCc8lZqeEfSOeoRDiHxLRvYDvJDw
 DGM4UykqdPtIs8xbDp6itCeFkJ6vTPIifKKEuaHDC3RQiD5NJQFEFIRLe2VImieXe3CY
 +iqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzU/UUTa7xyNmAfUt9iK9DVrjxoUXH043EuRpXRitXQEu/t0mlSY1aYlLpfXCuHOkIvUrAySkeXfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmD0BKd5VkVSw3syUlbq2P60P1zoImjLqqGm5WNIBOPLQHAj6Z
 PUjogGFimT5jytesFsTbt0+bN045e34v1pEP8ONevtdnCyE563urxR2zK6NdFpa6TElbdwRJNjr
 Y3xMDY3xvkYZuAMQxZD2+TGUwhD0=
X-Gm-Gg: ASbGncsGBrULzxAV4wFspp9pdvvq621U/9ddinjFuwmS4Uzhtdoqu9h/NbxNrUHwuKT
 47wLtajwq53VnHep5jNbn5/VGUvymAD4zsspmez35CoSukOLYJ1ZC/bcVPjIUTJsCSuzLrV6Tlh
 6RkT6ZJJeLhh3oMuQwZAp+AFSsWAqYyACOCgU8
X-Google-Smtp-Source: AGHT+IGyNAuquWNXQ8BnCGJq15TIHzIgTVg6j416k3z+H33/HqAmOnr+27+fP2eK6DCAaVfDoLUn/2gDZU94hXSuIYU=
X-Received: by 2002:a17:90b:380d:b0:2ff:6bcf:540a with SMTP id
 98e67ed59e1d1-3036b4b348amr9879a91.6.1742841835419; Mon, 24 Mar 2025 11:43:55
 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-1-7f8213eebb56@collabora.com>
In-Reply-To: <20250324-gpuvm-v1-1-7f8213eebb56@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 19:43:42 +0100
X-Gm-Features: AQ5f1Jo5s1OdGZqVubb6Tq-h2U2YrkskT9NsblmlA-2DdQThwVXaEW7IQM4bz4E
Message-ID: <CANiq72nLRe1TXqj5fjgknatwgR=RqUA9WmmwY9fs44fYS9yu5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: helpers: Add bindings/wrappers for dma_resv
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Asahi Lina <lina@asahilina.net>
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

On Mon, Mar 24, 2025 at 4:14=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> -const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT_=
ROTATIONAL;
> +const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D
> +       BLK_FEAT_ROTATIONAL;

Spurious change?

Ah, this is probably the result of applying `clang-format`, which is
something that perhaps we should consider, but separately... :)

Cheers,
Miguel
