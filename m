Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C8A4B8AA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC06C10E0F3;
	Mon,  3 Mar 2025 08:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DdEDcw+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D6D10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:05:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4398ec2abc2so36815415e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740989103; x=1741593903;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
 b=DdEDcw+mkPy+mr1dnXCCzzkIZEVZ9HZy9ARFsvo6yU0M8Un5t9s/EqCdFyQ4ZtWDjJ
 TGJZ6GINDHobJQXyq+IbT9K1fG1KvfVkNoNm8jDDmTDU+2dnatk8jVanceji3oLlm+jY
 ZfulAXIdZOCf2S9FNbWXXZ118UheIwVmh8yfpaqpql0a6FMT94Czb3sKlBiMjVr2Me4Q
 /VHTxaFX3NYWmSM2i6JXUscMPqZfB67cQrpcGgg1h47oIHhkiWsj/3HLFvP5He9RMOfH
 odWygml5GGJd+NoUYCertQ43Vc970qA+7BlrAcBqlwLYGbMz+VcblnfSG731K8BWng7f
 t92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740989103; x=1741593903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
 b=Ovdj38X9QJMXsIHG74ZUxOUqpT9HdDrDdMD/kB03RYSorljsZ6soqC+Egms+YA2QVN
 aYqYXGshVESyO6nxzgIDET7brhplY9JksmxaSWyPu7qxakQyHfBZXpi4w4yojuoh9kuW
 WkOB3WeEE3ScbG5GALL1578qyk9BLRTTPWYyHdMg5MJzt5fgOzRIkSRxOwWV4+o02AYE
 JKIjdrXCh0N7xMJ6ky5k9tY4SnUzklbRBOAmfEal/lt0YwqndvyOo2tR7G7UksyqC8+J
 M+Zz4vvZxKCxAP2UU9XGOzWDRLSaJiUGsXr30aKWJd2IcIrMQJMYnHRzx1V0HHtxMKkp
 OcRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/kGgphbuUosUTaziWkghkCdaBctEZz2BHs+g1WegF/MspFEt8nuMDpFHhHdQOHU51ZMlK2wtnfdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVcjg92p9fRNB6oCXZBlnk95pABJBt1J7RiOMNkQaWfilSKmTN
 hxxLeukZsRWgyH2zQ3km9eqh0NE58jJSQ0t7/NKexiZOoxQJMnRzpJqHCA88ItKMoId3fQ4T5Su
 DMWnLzQpcFDkvCw77iT0dw+PI1OM/hvirhzGe
X-Gm-Gg: ASbGncuBa4IRwZXzMnBv46zI8H680LdCdiIJvxPEmOmpKJcMKIVxxW05b5Un9y1My00
 81pXdoa2AXxWLgIULJ9iVy7K7q8QJdvF7FHhahBKicgqPkjpDT2/TzdILjbQnBQ7B7GDLkIrjiq
 1975vM7+VyGsmRF0bqghZYVpS8JoHySYA8kiIu90QNlUBnqYbNTSLcu+sc
X-Google-Smtp-Source: AGHT+IGpdxgjf0gkSNOiBqhKXbQc9hRhwlo2W/nTX9MqGqqFdt/JgT25MM6r5uWJ1chlgrzzP+QlZYMm6vZ2gmLXFNk=
X-Received: by 2002:a05:600c:3b24:b0:439:9496:17df with SMTP id
 5b1f17b1804b1-43ba66fee15mr102753595e9.13.1740989102617; Mon, 03 Mar 2025
 00:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
 <20250301231602.917580-2-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:04:50 +0100
X-Gm-Features: AQ5f1Jo80hSF1L-_KjqVRtXigJWOzdDSnpQhkOp567xZ9U8afL5p9lZs6wbyFLU
Message-ID: <CAH5fLggKXw-SCtR_vAOAU8KJaAvmNP20egmtV8KmX0xV0DA0dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in
 documentation
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

On Sun, Mar 2, 2025 at 12:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
>
>     error: doc list item overindented
>        --> drivers/gpu/drm/drm_panic_qr.rs:914:5
>         |
>     914 | ///    will be encoded as binary segment, otherwise it will be =
encoded
>         |     ^^^ help: try using `  ` (2 spaces)
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#doc_overindented_list_items
>
> The overindentation is slightly hard to notice, since all the items
> start with a backquote that makes it look OK, but it is there.
>
> Thus fix it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
