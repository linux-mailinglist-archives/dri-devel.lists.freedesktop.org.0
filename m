Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B4D03336
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C371B10E73A;
	Thu,  8 Jan 2026 13:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mjk35Zhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3402510E73A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:58:11 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2b04a1f495fso58743eec.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 05:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767880690; cv=none;
 d=google.com; s=arc-20240605;
 b=bn58CGOZ7PbrOFv3ZBRuYx7ydedpaYtOtw+5dz4xxELS37kgIHhgkX+SUzka1dRddA
 WGxKu8qPMqR4Es37WnmUNg/MggSmYJOw39lliE/vsRCsFKMnJ0tOtwx6oifRj2QLGJpm
 xQYKniadv8uXxvGSF/Px4C0lTlA2ocTo9ucsomYIDuECmM77JITeFG1tSxejdMmb/Q4j
 1ybQjXpUF6+om4D+xZ0skEYz8NFq5HxHFxp5ShQRt9ocNciwKdSj4gygmlhT+eMOSl8y
 2sJFZM2gZ5uE9hEtxi0EQUfijdkJOHALTrI0w8Ol3kk4jvYuDBm2c59+xpGGvmwKag9Y
 sO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
 fh=KZ9SPaSBc4VqkyLVh3etJ1Nrvw5nvkXgZB73smzCfGE=;
 b=hl0t6gBI+8tgesjDtxfxUU5ly+bSQJtKQjQYb5LCecx7UBC/+3bMEuW27+GlPMRs4V
 aGYrOmjsv2uRJi4h/8IsQYD7fulFMq0ZuD0qEYm1VYMnT/Sz/WZrNXMwmoMkteeGiE2J
 oU+u3pvRvcYIdA96rVjv2BUgxDXxhEY6WfO4vzk/3t/8AwXT8XGmE/0Y3ewlr5/dB/pi
 Y2WLdLKtchYhhxXqTMVse2nppDmX2ydw982YDJQoX4z7d7xD4+Xhuy4fY3muieapSkxP
 MICQ2Vze1HD12QjXxrInsYB7b9uWDq8PhmT06EalQigjh8nwRxY+nPEbpOOtuBw5SOMQ
 sMkw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767880690; x=1768485490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
 b=mjk35ZhhnzFDI44xzWTZ6erTTqIV4AV+4DP0AEmLYSMygzpb8lPFzZhwbv9MqotlUe
 iuI2sUxhx9/WD72IhL6ZJs8mU0geOMttg+REmN0/ixsWGFT9sJPiMmPB1v9gTmxY5ouM
 r0lyH2DyBU/7T/Hu0mOIQ0OZGhEhfBSkzomjHpgrTOMJUw49yhzE65MC9Sp3MhcHbmBx
 5TVy3KC2WgG3tXYYWu9LyF8WzHRKj9XR63zwpe6OyyMLSTDUqyhOGKgvz/ScemN/KJ1e
 VwcasAfilLU7Tys2Kulnlew+1gF8jn60mPn9HJCP/nkeQnRwUumIjGQujID5AR8gVnrx
 dr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767880690; x=1768485490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
 b=rUJD+UsMllBITHJiIBCcHnXTg+AK2tqjBPfsD/qt12aCpruj8lr6Qr+K/8/OtYrdX1
 5nlPcM3zdpOLqZfP5Dltsi9nHS9VaRsPqPkj8TLF0jIWBc4nhKaJxc+xKNh5eIeIFa1q
 VrnPCfy88FiTFWKhxeo0fUUsiuaOS/pXWiofy6NclVOng80DLlCudhhlTb+qEp27OkOe
 RFnPKOEU97Xp1ZvGLOJL5v2cUYO75YUIu7DWcqkSVJ9QUU2t6R5Y9do5ASUtXYXifYbC
 typxyWHk8vvG2BlvcS3acqmf0EeUtaNY3nRociBcbO4+IzyK7bbx8OAts+V3+0NcD4yT
 LMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrLmQXRSFNh9bPBteH11MwgvO4DS+p+qlPL4X+myrCQgPCl6uLLUrw6VcvCFkCngD2U4ftvEQ/xKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeTGWTR/fLm0anpq7fhFN9+miZrTS3WTTUeFjPZ9ojvse9BWi0
 Uzb41vppYi5QI6xZo/fKMG5mCswGXSe4TfNAvarTb2Iaqrmv9osMi0I9SwcRiSo9aTs/VUN6XgJ
 QuAWyxh/+/rb7NGVF1L9kGhoYlcm++R8=
X-Gm-Gg: AY/fxX4ercQZ6toHIfg+cAs3ZqGJubqwi/R9ZZl+St8ZYE9sw7Xb7Lqkga16XOiXYd/
 di9ahpd6gvlqEgFdH8wJuPRePfU2HFqzqkr38BwYl9zt+I1coZrUo6w/lFif8OOhpEIJp/Gcn1s
 2HYzrwZnrPYxRbo23ZSs2sZmF5s1dVf5IY9RJhyjMilJxJhS3awhckNyzzpRNgQzyAkgPmY8zNG
 bEf4PWnmdtEIHJQarqrddxto8k5Hlr2fWMzsC9ReHtslEzslcye3+Xlfy9SdI8zkusrDGdSAA6q
 vdfCEUYXQyBoPY0WsYNTcx/1V/IB0/QewUBPhhtoV+s/atrfC09IYYgj3wmQiArg/owRgQIsoSW
 dTTbPCscdKmlovtuy4ctswro=
X-Google-Smtp-Source: AGHT+IHlnNhSjE3fiGAFdHKCvng7Zuc8n9ttJNcOcaKfOXOHrvEYhA907pjuVU71kxGKClIXln7ajb5XI4DP4iSFO60=
X-Received: by 2002:a05:7301:10c4:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b17d2b80c6mr2509787eec.5.1767880690160; Thu, 08 Jan 2026
 05:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:57:56 +0100
X-Gm-Features: AQt7F2rtmhmzWGc_DLT6cTXt2EVzqLjQhI34cDZ6wkg42nM_UD7cfFl6t1r9_zk
Message-ID: <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Thu, Jan 8, 2026 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> AFAIU, encoding the state of the clock into the Clk type (and thus
> forcing the structure that holds it) prevents that mutation. If not, we
> should make it clearer (by expanding the doc maybe?) how such a pattern
> can be supported.

One possibility to consider in cases like this is whether supporting
both cases differently makes sense, i.e. one for that covers
easily/safely/... the usual "80%" of cases, and another "advanced" one
(possibly unsafe etc.) for the rest.

While it may be a bit more to maintain, it may pay itself off by
making it easier to review the easy ones if the majority only need
that etc.

Cheers,
Miguel
