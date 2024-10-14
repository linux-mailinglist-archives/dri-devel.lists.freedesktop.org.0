Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5499C321
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92A710E3C2;
	Mon, 14 Oct 2024 08:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GwxeeJI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8E10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:28:04 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso2515861f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728894483; x=1729499283;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M24dNzd553xNHb5Y8IIcUeoG1f4DjGolZJ5waiH250E=;
 b=GwxeeJI1ltybjrI/ny7yxbGPXkdcSzgYAFygHmZpQRUKNhZMH86WaDnO2ejb6Goj+c
 0NnDUf+Mml3MDUJIcStth9ZhcL0m8V7niy9tvM+ZYAhIRW/eGrZBMrPWX4CLXGj91bTF
 wGkwJ0pjUUN+CeO9PQBGU180gpB7TxGgnJV5ZQVgEI9PQfJAuK7Hn2dH9zTsr1LQaurB
 5X3722v2vdCoQ/VW3TF4PeBjt7zFdsiVqRicgHFzw9+W52a/PnHFkwZIRJDr2CCshxZH
 IwODcaS4P5IHEJDSLjw5OwTFMfh3CXmM5bbMJ8bRb/jC0N6ckM3UwPLmWVNxsg61UzUE
 oIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728894483; x=1729499283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M24dNzd553xNHb5Y8IIcUeoG1f4DjGolZJ5waiH250E=;
 b=iB9HQIwXfQF76bJ+YQeYLEtpufoZbcS5aj+TurvCB3WtUE+yJoQTE8sC19Wo5XIKua
 zUzmJ+EA/tKzCTzl4+EJaUeSvCrJXXzg08pDdRjxeURPuVj+tx7YpkLgr/XBKlO+yb+0
 63BiK1TCWbYymxufKwfzc5yToIPuNJiMtwEKz3v5u2/iZdgP3ZnqenW2AhvrxfQl6WNw
 dRQfqBXfh0okFi/GOsxVEcJI9JUFyx36jkoKTaKQmZ/CbT+XK82KrrcHKsVeh1oRAzQV
 EXKxNjJCxeFDBRD6TeKJuy79dcxY2FnOuV5x1+lH8nTuW2biBYZlB2BJ6uE0sqUViEK0
 HBGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT1tMVku2yJqlQNl7TVeFuGygGLGFtg6fy5LYa1MD/XFBLtqZK7xlKFpfqbxRY3pphlKcq3hrw83U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNM3bf+eTBdcrxCldo/d8rJUFYwcZov/qGKAHGtxVB6vqc7GcF
 Lf2i3u28HdZWU6PasU+IgoCjjpMYwT4OmbpoObEfZ+FeNjXOtQxACf5w5KMpLIolj0Cx4obWre4
 oGMLcOK7y8hsJ/OZ8BrNZHz/EFgvqApSdqlS1
X-Google-Smtp-Source: AGHT+IFB8FFfnlqFKW+nSLnk8WRApZWwjOS9gnyongi0gtF4ICZpB2dBUY9HOCSQhExNJfIuKbhQl4ZLD9UDKKJLEjY=
X-Received: by 2002:adf:a1d7:0:b0:37d:4833:38fa with SMTP id
 ffacd0b85a97d-37d5ff2c01cmr4561294f8f.21.1728894482691; Mon, 14 Oct 2024
 01:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 10:27:49 +0200
Message-ID: <CAH5fLgjU3bvDrOsvyxBcCuGOsmbuekrh0Ccy+La_MgHrMEncvQ@mail.gmail.com>
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

Surely introducing a return statement causes another clippy error?

You can do this:

#[allow(clippy::nonminimal_bool)]
{
    (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end && y < 8)
}

or just put the allow on the function.

Alice
