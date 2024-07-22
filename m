Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD0938BB0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9D10E47B;
	Mon, 22 Jul 2024 09:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="z3Eqm3mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1960310E47C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:02:24 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso29179785e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721638942; x=1722243742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qy3prohTdKukbZeeTIm9GnFzCUR4CLmWXZ94N/+yPNg=;
 b=z3Eqm3mZMC3jjGqOA58RskHrdDlpUeYvf92mG3KJu5HdsYRThYN90RmIRhfipcJBc6
 uHo3UM86wPTm1j0CH4WRd7CZZyjs1ZQyfE9abqmhGLf9iihwWv21D9eMcP3VIDqjG/dV
 ozJvdiD3GrNbOZ/qKCY2MRDd9I0SREwnrfbjagunvS/9ESponqlVmfeMNJwl0XWb41YT
 bwSvKhq7fns0P1zi/97F+P4i7xAbgjocXpSfW5IT2iAfyWJ4FOslKLM6oJYZRL9zKNwd
 hG7W7iZS3kFr3j5hYQyiUCsYC/fepi67pr+4rbmTK1nC9vRtLeFAQp6IMXUzA81hfs5b
 Ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721638942; x=1722243742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qy3prohTdKukbZeeTIm9GnFzCUR4CLmWXZ94N/+yPNg=;
 b=rvOl9luz7dnAzpD/6zBwZyd3gWauZAGgUX7UW9HtuL/TXwRT9utGGI89jT4ZIsi2kA
 L/7DZBvFermg+ROgTWLie+2z0glhWFDlQKaK7co6H7pfWNWnV+8djw47mZ6HVKdfl5UD
 JqCpQAA55GN0KolM09Au3UzHvp+iWWQu+tnh503OxUCTySYtjhDVe92f/fN9amqEsVJj
 eDnt8NE57R8vLL8EDoCyPcz3oEOLQnr5u5pf4tS4g05JDbg3QT1K2WftN2FzBklwE5sf
 5aXWDblKMdl/0Iv0w13e+kPNfiJH3q73mVgMFTRH8/8IAGecM+KULDG5P2Bx8Qr6cTJp
 DRwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWfLDKVTbdBHWFd/z4GdwBZANb8YtnSHL7sgE8ZQltUtPBfblZk+8GLcsWh9SO5jMwZOQqse97pj5Xwjmj2gBnIeMTGbfFyFnujEUsYDHN
X-Gm-Message-State: AOJu0Ywrduk+JGfvOTpOy9prYyWlZDnY7RCoE8VFdYFdEpMMVoT0i2PE
 OkDAgUhxJE95heXY9lZZPfk+Gb9PqQohg8NeK1PUKiptbnL2fd3GSnt8l0TzAto+sV1YvCSmXa/
 PV1MAbbveUvpHNxHiiskeVx4Tja/L2eEEFkdw
X-Google-Smtp-Source: AGHT+IEsd5dvn5A2mqFen80qMtQ/JIIOvc7TZZUXavWiZyTt87ua1ZrxMMfyPbkZftrRqdx1QVfeZSkwq8qIrzDoYMM=
X-Received: by 2002:adf:a382:0:b0:368:3f61:b955 with SMTP id
 ffacd0b85a97d-369bae6b08cmr3273430f8f.38.1721638942107; Mon, 22 Jul 2024
 02:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240717142644.1106060-1-jfalempe@redhat.com>
 <20240717142644.1106060-5-jfalempe@redhat.com>
In-Reply-To: <20240717142644.1106060-5-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Jul 2024 11:02:09 +0200
Message-ID: <CAH5fLgj2v-7Fx8pwrnQCkHXZeR6m7kOBRzBDS94hjh9BsT+vtw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/panic: Add a QR code panic screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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

On Wed, Jul 17, 2024 at 4:27=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> This patch adds a new panic screen, with a QR code and the kmsg data
> embedded.
> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
> compressed with zlib and encoded as a numerical segment, and appended
> to the URL as a URL parameter. This allows to save space, and put
> about ~7500 bytes of kmsg data, in a V40 QR code.
> Linux distributions can customize the URL, and put a web frontend to
> directly open a bug report with the kmsg data.
>
> Otherwise the kmsg data will be encoded as a binary segment (ie raw
> ascii) and only a maximum of 2953 bytes of kmsg data will be
> available in the QR code.
>
> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

> v2:
>  * Rewrite the rust comments with Markdown (Alice Ryhl)
>  * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>  * Use CStr directly, and remove the call to as_str_unchecked()
>    (Alice Ryhl)
>  * Add a check for data_len <=3D data_size (Greg KH)
>
> v3:
>  * Fix all rust comments (typo, punctuation) (Miguel Ojeda)
>  * Change the wording of safety comments (Alice Ryhl)
>  * Add a link to the javascript decoder in the Kconfig (Greg KH)
>  * Fix data_size and tmp_size check in drm_panic_qr_generate()
>
> v4:
>  * Fix the logic to find next line and skip the '\n' (Alic Ryhl)
>  * Remove __LOG_PREFIX as it's not used (Alice Ryhl)
