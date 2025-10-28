Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18875C1539C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287110E5CD;
	Tue, 28 Oct 2025 14:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="deYdM41s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A2510E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:46:01 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-26816246a0aso10447305ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761662760; x=1762267560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
 b=deYdM41s1t6LJAlhggxCymJ+hBqxL+NHwS49vkHB/rWJMAMo2agpcJGTH+2jvAgSCO
 ygVEz/t/U3d871be/UGJRRE268bgVZiqAf2eAJjeSnMXg/V+Zf699WSdgQQqoGFwfzQN
 9jFERMYpP2FCwarXF7LWV9/YjcbG6AoooiaU+vAKSkJWquD9dHcL+ipB1NLWM6SBOXps
 MDOzo3+5mUnQDFhLCE6mvo2CkAEd3tFt4+YK9XFKrCJVYZniLMMmZzbHkhhSNPfWuK6L
 1Ajgn1N6hcyPrpalz78rcvnxzR+eKdVo6n3e6DjT50O0qIVr/FI8nGa4EMWUlLWEPjpD
 EAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662760; x=1762267560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcaJkvlevrlFiqDWQaxlxV75MgJ3OQA9Phd19FF0hYw=;
 b=qvy1Qiiucc+QVkzLfLSUVJRq17ziTz2/RKZfZ/0qlOzr7D6OyaD7vE+Rueq2afwP3B
 wXnreXWGvp1md1DubBLc3hp2roB8PJvRvmn/9U193QB7uuz5GfTHD4u0+Qe85hR/VvBu
 r2irKmCk8t5zeHqrx3dQRwakTcbQwdxEEoynHUGttkIDjbCJajaxMREZ0gdkaMxHjF63
 WUdA0IDHUl9MRs6S8RPcQ5ZDo61SZkHPl5rmSLgw0MVfQsy2UBmucJLlHgS0E5zq737/
 H6oTOR65wXDkOh2fvf8LmzUscR1eLnAHB76YIdP1ing85vq96PBIR7atAburjjSwk2hV
 8/Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDEzJWQ8gvm1tRnlfDvQC8mSew9FjgHA+DDj9klegbUI89z4Xc/KFE8P4VJI45Kcc1/REI98xZCx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwldiJHxKIp52AIuRQWLthJh/c4eHgneJhYoFcY2eoKwFXbDE8p
 SN2kQ1cq+0DabFOHMEW5bS02IV7oxP+ROELwAoWj7Xnh2b1+RQcNjoDHrY43Iz5hKVMDIydPabR
 q9VqUQE40g8e7UIfFz2h9CIpmHLHumUw=
X-Gm-Gg: ASbGnctHlhiaXOfOOgmVfbtFDcblYmGrK5bFOna2gAxf77GvjVYwL2BfNHpJj3ySf73
 1UPxVmi0a5UtO6M5k7vD4DKBhslH2Z7o6Gm0TZQUYAOOYgfBK/vUKMx+U2wKmzGIbr09zC29l5W
 lfQ9T/hc9V9Hs0Xl82l8isW5DOoLFeURhF4gVkwHOe0pWWOHI0WWI+OSHN3WJ3wK6Lu5PdElGuw
 hkibX1ue2m7o1yrIbpmT7XDFgEIg3dgPN45w4uApbdXFOAmvYJyq/iuJSKGV0O/vFqCsWbYTRCQ
 yhf5jMSBN4W872zQk8EXoid3haCag9uRf4iyVl3YbhsdQDBJX45zFjlwr/8grbBMs2gVXdoJ2tu
 AI2ZmWJsDzG4QQg==
X-Google-Smtp-Source: AGHT+IFfY89QqiTl3UPAk6WKNc6WSfg9maX4CslBrwsb+ya7LyhSlvq0HWbjx5qGqAFL/1tDdaDG4249vNygIfHTzN0=
X-Received: by 2002:a17:903:3c4d:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-294cb3e8bb7mr26098245ad.7.1761662760526; Tue, 28 Oct 2025
 07:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
 <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
 <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
In-Reply-To: <DDT3BTI26XFE.1Z5E9QZZJCPHQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 15:45:47 +0100
X-Gm-Features: AWmQ_bkouzgy_TlroPyjfTyhvmFTe0497ZQoaOPqA8hULwK1yxqY9ku9pkOIYX4
Message-ID: <CANiq72kUDtc+6hrJ_=bbVfAjsWOYzSjVvUiT_GOBKHWQRaLDMA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
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

On Mon, Oct 27, 2025 at 1:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Sounds great, will do!

Thanks!

For reference, the other day I opened a couple issues for this on Clippy:

    https://github.com/rust-lang/rust-clippy/issues/15963
    https://github.com/rust-lang/rust-clippy/issues/15964

and added them to our usual list:

    https://github.com/Rust-for-Linux/linux/issues/349

Cheers,
Miguel
