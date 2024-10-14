Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F199C329
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0778F10E3C7;
	Mon, 14 Oct 2024 08:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DiPckcFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C155410E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:28:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so2589649f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728894504; x=1729499304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCeu5RGfQHD/7fNcARcJl4VtMP3O2J4piVgLgvXsU9c=;
 b=DiPckcFVcO2450ryboUpHWPIr5thFfG3NujHW8IpWwGI2gA1rRH4nCtCYWNA2Qrao+
 SKuiq6if1F4eE9oES64hO4tFRVKHzc6UCGsLGe8jXYQ+7IQ8NmXrpEB81HJmZYV3BYtY
 Hk2hexr324qmCDdjg6WUN7NbvZTtJzy8uVGpt+NeCxFUgTgNJcjlvpYhmhi7yUkp+dfP
 xJc+kxTVlSufBUC5g4Wfeiszo4tAvoK7L/f1dUEGsGNsp6bJc5VvcEdbzo/Rw2KaP4L8
 1w3K/WLeMIuiZ/tNqtSfDMv1Uhydc+1y3ZYZkVol3AyxMTbfOFzI5/yU2Eh1MEEoJLc8
 BEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728894504; x=1729499304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCeu5RGfQHD/7fNcARcJl4VtMP3O2J4piVgLgvXsU9c=;
 b=VyXUD/RMayS4yMNDmPT460o8lykX0jWkAle+iH7+xqzDS2+ukWom4wnY5H8rt1NMkb
 jX7wRUe2bT3puZZJjQ0frgMI72cqf126iHPHnfxDORlMQRkki8LoyfSBalsOX4TVKAx6
 PjlXHi3rTyfYyavoN51GhtdgTbT3xou2Q8SVFG5Q6oe1c267PSuXBcHeVxLu3nKIArtt
 a2ZRKjUho9hr3POC6blc/sfIjRxWn1lhcc6+RBVIE7aZya4pMheChDzn1UIX0v5wffnY
 QrEgi2i7TfPcs7fBwNbWgMSV3jWAFrAHE1fHWoa0D00X8Bxx6Uoo9Uoe031WWFXzo9I+
 sunA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0M3V9fBpwub6Opfn4gKsI/A0WeBvEE/6fUUh69m6PFMezzW6wXxmpHHlc0+jg2r/cR2M5Be8WmF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNL8/2+6iJtm8RidachksMvbbMrpN9ieTIbzx3R9iL5TxUf/C3
 Cikd66hicdb2QPOfLsDLtWXlxazFwCS5C/rjz7t4DBF8TNCfusyAr/tatZanNhDU/5AeFM9mlR1
 tjwHD2wgl7GPRm0vr5vZ4rfcP9ZZHLhDg9iEe
X-Google-Smtp-Source: AGHT+IH/x/JFM80zXRfmFjrcoV8VAzGeOzIVfGAemlXaYAsnGiLYKVvSO5aPsLFdNUh4pRe7OfNdBBVD2cxfPVqv4pg=
X-Received: by 2002:adf:ea49:0:b0:37d:5282:1339 with SMTP id
 ffacd0b85a97d-37d551d39b3mr6997806f8f.22.1728894503943; Mon, 14 Oct 2024
 01:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 10:28:10 +0200
Message-ID: <CAH5fLghusTK7M4om9X=_R6tXC_Ytc1TG=NfDXMsQkmfQ5SWUEw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, Oct 12, 2024 at 9:53=E2=80=AFAM Thomas B=C3=B6hler <witcher@wiredsp=
ace.de> wrote:
>
> Clippy complains about a non-minimal boolean expression with
> `nonminimal_bool`:
>
>     error: this boolean expression can be simplified
>        --> drivers/gpu/drm/drm_panic_qr.rs:722:9
>         |
>     722 |         (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D en=
d && y < 8)
>         |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#nonminimal_bool
>         =3D note: `-D clippy::nonminimal-bool` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::nonminim=
al_bool)]`
>     help: try
>         |
>     722 |         !(x >=3D 8 || y >=3D 8 && y < end) || (x >=3D end && y =
< 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     722 |         (y >=3D end || y < 8) && x < 8 || (x >=3D end && y < 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> While this can be useful in a lot of cases, it isn't here because the
> line expresses clearly what the intention is. Simplifying the expression
> means losing clarity, so opt-out of this lint for the offending line.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas B=C3=B6hler <witcher@wiredspace.de>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index 58c46f366f76..226107c02679 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
>
>      fn is_finder(&self, x: u8, y: u8) -> bool {
>          let end =3D self.width - 8;
> -        (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end && y < =
8)
> +        #[allow(clippy::nonminimal_bool)]
> +        return (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end =
&& y < 8);

This should be #[expect(...)] instead of #[allow(...)].

Alice
