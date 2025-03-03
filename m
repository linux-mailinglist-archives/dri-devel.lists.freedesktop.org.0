Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E54A4BADB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3455810E085;
	Mon,  3 Mar 2025 09:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yH+xed73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFC210E085
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:34:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso28299695e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740994442; x=1741599242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXnZ3E5/TKOVFTli8c7ZgXogoCXoZZU7O3qVHvhvQxo=;
 b=yH+xed73K+YgBglBASRWRfWFez2294H3k0+vGkHFTc7uiwmNdJNnYg6QXcQLeiFoim
 SOhArg/xiyriewUeenikEYWJRvq+0TVz/ZwN3JbDECn90bBIBr2c+8658cozCigpJgJo
 ti21YiKoUyGXXXrqS1Tou7BXfoeewUy/Lq7mLfu22t4TEMgNraRrmSlpKJgX1fNJxj8k
 IW2qtlRFuauRGT4C6PDN6IO/RXoIcBL4V63H7WoO6E9/PKRJvlpFqtbAxy3Z7PdOoNKa
 vV8WSJ7mqzZfIdLeTqMpJHn8mB+XvuydT6pVy9vYXIRI21lUg0I/bTBefEjLFuMX2vGJ
 4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994442; x=1741599242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXnZ3E5/TKOVFTli8c7ZgXogoCXoZZU7O3qVHvhvQxo=;
 b=Kbr9kC0H1pkYzohBzRJY5K3R4ewEmnQDgQ8AbypRcngui0PtWDwI/Wkr0lJi7bo9r6
 nGYFb3DlTWjjnJCqaazVd19DXvtgviLK/yvIpbQZTFM3GRtlK3nMkYIH25LCKQNDyiMW
 RywITtjRA7arhWEMOOZfjcxEUS4ax7LvIGmBf2OBz5Sr4y6CdlJbSQqCLyJncS1W1aVI
 PMa+D0zLeaj54Pk0yAQzMVPUVJ3sE47Kq6x50BjmJhgPQQ2Dk3H2TzJHqE3SoJ/WwunK
 X6f2oDYc3fkBUcB2EQPUoHQcNHAmdD12awnoA+1BQTUc1pa0BiSRTLTHJjS7udXyRgm6
 4oBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTLT/LUac78UVg1pqQRyjSKnfUfvUBZX6V2MyFYsW2BtR90O75yO60GgaZSC9aBJ7AjQ3jprlpO7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwqHJ9kHq0w/HmK1CnWKx/4NgQ+RYzPo8ts3aJw3q+30ro/gNu
 cyLyLN5Yiuhyro1tfWu/23TpdPgOqURLqddc1avZFXBonmln+qS4LceH9+7H+XnWPyOudaLEqRu
 SLmZWRc+P8Br5Snk2L36p4pLJesqo3URUD6NG
X-Gm-Gg: ASbGnct3gQQ1AtbC0G7eX27rO2RZ6/mrm1t1vC5Uztjo6Z2vdS9cfFk3/RAJSQEkxtS
 blNMCaFPYiXC+0HOypdAZc3enI0/le+DIC79Wy1W/XFt5qgW70mq2lp2BkJtb/+KVZ8yl73voBP
 OR5JwDenqT8TwYzDynrUqlQRi2XfSNy0w1nVHAVUu29h71wdkeViwowR5i
X-Google-Smtp-Source: AGHT+IF7tkX24sQKlhC4282EiZxY+hctHT5EHwLzLcZo0eYUQP0MVXGgfz4uJEhk1VzgcXR0gnLyV/lIaiDtAcofzqo=
X-Received: by 2002:a05:600c:5106:b0:439:9496:181c with SMTP id
 5b1f17b1804b1-43ba67745d4mr107426315e9.29.1740994442374; Mon, 03 Mar 2025
 01:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20250303093242.1011790-1-ojeda@kernel.org>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 10:33:50 +0100
X-Gm-Features: AQ5f1JpToETt_xPFbUXkjE6L7wUMFuPji7pUB4N-gMgIpy2I89dr701AOdtWuTc
Message-ID: <CAH5fLgg_Ax3x8qLvJCE=0xay7gosaq0w_=xc4zu2dQ7tFV=B5w@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Mon, Mar 3, 2025 at 10:33=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Clippy warns:
>
>     error: manual implementation of an assign operation
>        --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>         |
>     418 |                         self.carry =3D self.carry % pow;
>         |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: rep=
lace it with: `self.carry %=3D pow`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#assign_op_pattern
>
> Thus clean it up.
>
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
