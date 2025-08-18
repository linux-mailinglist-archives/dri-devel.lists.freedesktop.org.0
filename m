Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45BB29B6E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD45310E46C;
	Mon, 18 Aug 2025 07:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WouCtwZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E902C10E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:58:42 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32326e20aeeso672817a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755503922; x=1756108722; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKBzBkYjQ1AhCU9AulAtxppsQb1mgr8Yf0r+sRBOG1U=;
 b=WouCtwZ3v3mp2295O233Ge5KfRmxdfiVvl/WyaayBPTKhss9oxvtYO4OWMPh4FkFh3
 4J9aPBUPJ9kmZmRNcFnRNrItWXIm8mIK0bbmMczLAGXt5wC2RC69P+1Cb4SZaAXRPHW5
 0+ViTTO6P4xnCDEsRyFzcb4/iZXzYF10ppmwGGKlRx7hkpWspaUx6Bgy5gncsxwqgydv
 zEqrN0LZptslTeMG0nyRBzI8HMoyu2BWCXuRVK8whhsT4tbkTQ+7+CBWFkERoORfJUuv
 4MTmpbgY0SBfZvKougKWvumLDv/lJAlkxHrM7Oi+lQxbqYZXFeI4nGJi20yqvHuQLxXO
 HSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755503922; x=1756108722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKBzBkYjQ1AhCU9AulAtxppsQb1mgr8Yf0r+sRBOG1U=;
 b=nwSgSRlvsDbsdsLr+He897ZHq2CuSGatCn7qg/iZ+k2a9zUYEeHc5MhtnYHKcX80SL
 07M8cjOSJZEr1BglirKlqqlzECbu9hbVyutdk/pT0sJzFSTQ8xCTgqI/xpDnMxYoSC8f
 PfDYsspif+bDFfiTJZmqdFDWMl+xEoUU75++pvN7pO4AZP/51tDDQWgtWR2EhTqIfW9S
 p/lSs1lWj6dX+gvx2kt0fZB8sBaX0e4mvlL+zILsvvdCeRnh4/nXB6z9Tpw4jO28edhJ
 XWI6Df4VNVnRgRu63s7JSwZpse1rocvC1uNOcNHpghTSfXV/cgEre2kLa2R1j/Ae0Ccf
 ydWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa6dVMlzP+h19u7VUh1FHIId1J+zZ+nIQJX4nEZvbY/0vhKAot25rcC7dvjsJDz6lnPzU3tICi57Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9kbwRg0vU4dEPKRN8IqiyP+nhTEl9Blko174/5USx5VbDVu9M
 4p/c0uWL7ovqVFDIrTDxkCwGFhai0jaDjRtPAo7EKFy0/6RUyEkZxHlr9DS9t2bv7sYOJxfugwm
 97rTCopvvgAnGQh8UbOl04HNTBAKqrAc=
X-Gm-Gg: ASbGncvsyBjbu/j1DO8Hck7tzkLOQT6xMx0ePrHPbuIIIxCgpWHwnUei2Gau8fpwEP9
 i24DVGjD3RqEJwR2mkkATXhJa5QCuwUiDyplP/PreFaeGUJbyXvHnY/pLvnrlhNKU+CLC+zuXUU
 y7XJ8LN5aht6BEiqxb1i8hHdd4Vy3ccO08esoY9ysE8pRdvSNE6TS8UGgnq97kxC9bfIjJ60qSj
 7hiWw+U
X-Google-Smtp-Source: AGHT+IFxsuN8OTpCzaDIPZwNzASJSuMc5/zGYCAhP2DbEUgRVZJGqD55MUjWsyLjDAxtE6b6iZEErjTVe92wUYFy2QM=
X-Received: by 2002:a17:902:db01:b0:240:8717:e393 with SMTP id
 d9443c01a7336-2446d78f982mr63555435ad.5.1755503921944; Mon, 18 Aug 2025
 00:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
 <20250818050251.102399-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-3-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 09:58:29 +0200
X-Gm-Features: Ac12FXxanJRySwES_5HkplIVAqFnzFgozCFj2ZARW4a7Hsql86-4Faz9Qh32TB0
Message-ID: <CANiq72ns_17Z8=T7eTyquPG-x4WEZ8W4wa8nXBpMv04hKqD5oA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] rust: drm: fix C header references in doc comments
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
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

On Mon, Aug 18, 2025 at 7:04=E2=80=AFAM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> The Rust DRM abstractions would incorrectly reference headers using the
> non-existent path include/linux/drm. Correct the path to include/drm.
>
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Fixes: 07c9016085f9 ("rust: drm: add driver abstractions")
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Fixes: a98a73be9ee9 ("rust: drm: file: Add File abstraction")
> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

This is https://lore.kernel.org/rust-for-linux/20250730130716.3278285-3-oje=
da@kernel.org/

Cheers,
Miguel
