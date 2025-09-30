Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CEBABC77
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5A10E107;
	Tue, 30 Sep 2025 07:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L2iRuh2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EAD10E107
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:15:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b550db23c9eso670038a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759216542; x=1759821342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
 b=L2iRuh2szn5zMF7qWJeJQTZL/TuiDvkrdK6Yhn0IRxVIOWAAUVW9Z3wtSG6dxpa7BJ
 KKnTkTFIdtpuVnsOD/CtmiX5bp+P19VgkGO36fO966ihzm9c1buMqfH6POMeH45yiH7P
 TTuaAWMdm9+nuVewUC0B5gqZvcfEMoHtnMc0rQmX1Q8gVs1TtZO4I5qIC/gmivMpINlj
 faR+mPg2F2ekctZc+hH3CkgXF+HeJwlcJrteIMQDnYFjQU2kyjDhUBqEy8xqf+7jIR/q
 lppfoS0AVm+74wmkLHTzT2K3whnk45T1CMw6Da3TmsygWg8+tAkPrlHRJHSc2gumWGo3
 9eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216542; x=1759821342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYKtjmuSp8WHPKGo1stRMHk4Zp8bG7Oz5IVoChYgOsc=;
 b=RQiB5MlB4Fd8E/oI0xXJCHu9HzEG6saV6uB+RJbflqlEAWrgF4xUu4diqkFENV4eJO
 ekfpguY00ZvIpHghZI7wmXzmbLFEs9lnxi/XCnb/bjaob3SxT4uQk71DWVeVDOJkNQ9m
 wf9Ukh4ZGuS+W0fdeqV1t8EUUVUrv3BlW5TYPgUYv2leh5ZX1Att8osq8CNQ1ZZtAb4Q
 AAWo8FFtnPzRfKuviB+q6iqVFoaGARzwG3i2q8tlZM2PuvR2c/j2KEC8xoOrfy54F/zs
 CKJPrFGO5NCxKmGlIL0UZFbSDkV1z0ulArL4LFw57B2qxG8o0iJn1FozOzchiZk6w+Ix
 L5NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRw+bPnIzUm/NJAsd5JcIi15VHFtEYksbkra0apA3Fl2dhbBKIFsWuIKbsYPGi8AAbUsJmjaoKUTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDC0fqx1/N5ij7BRY64ooMJeQWbNIbpW9J3DuDE3uS3xtuoGBP
 9b3siCV5q6Lg7ZA918k8qom2hTpaJmfDQoNP2/5qCASt5pogwIDnTmKwDeTt2/WUHX8FwtrArjQ
 vsdfFIAdTrQle3aQ8byFeNoeGTFPKRL4=
X-Gm-Gg: ASbGncuWuGvi2c7ZDQYJwXXmqqSKUC8bJYbtAK/5hdivEoTN63UdwwGJhhtJpbDLQXn
 36BvFipSPh/GPf5yVwTgOZQIKsJdiUmp2N9T46LPpYY27Qe8tgb8iLtZXJOrLlgTA7C7B8foZtj
 DMZZtA9I5FFilg1GI32DxFpIduvDQWRVE4JsGqXlWyTGXO/ajW9b8S7Pp6tgjPBggCZw0Oqc6qr
 AHeDNwc5jTIYU5GhmxJIDTpcQ023GDAn39vk4DW5Mezpw3BCe4s5iFgENnzTisfp6nNoJQ8NOaL
 7Ve3eJC74hFzDUzreL97xWiOmn9XbJ+TyZH3lF/EzWooBWoPHLVqxSVpjlVw
X-Google-Smtp-Source: AGHT+IFP7t5MzVLMeqCeEzPgWwzMMlQ35L2NiKbBPcqBGD7XWZx+ZpB9ob6tpl2FHQgys9W1N33lBcgRC3EHBmH+gvM=
X-Received: by 2002:a17:902:ec85:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-27ed44d5f06mr135508985ad.0.1759216542032; Tue, 30 Sep 2025
 00:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
In-Reply-To: <20250930-nova-tryfrom-v1-1-0cc1bb507047@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 09:15:28 +0200
X-Gm-Features: AS18NWBXJDrDh3CHU3MG4Bnt1-ohuc72B_SoqOSakBKgfBdQNMLxKs7VmYo9yF8
Message-ID: <CANiq72n_pG8u7N7=jS4LfNjz+cP8xi1nVOxaGH=XXfr1+nea7w@mail.gmail.com>
Subject: Re: [PATCH RFC] gpu: nova-core: use the TryFrom/Into derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Sep 30, 2025 at 6:55=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> As requested on [1], this is how these macros are used in Nova-core.

Thanks!

Cheers,
Miguel
