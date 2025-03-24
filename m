Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81103A6E50C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3BC10E321;
	Mon, 24 Mar 2025 21:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTdK2wi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B15B10E321
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 21:07:24 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so1356518a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742850444; x=1743455244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0f4oMKaqWF/1RYznP9bKhltlGtX64Ox9tuugsDhbh/I=;
 b=fTdK2wi9b9aJF6tEYRSpjKPYjwazyq8DkNZesyXSNgF3XFY73pKQxTRc0JlEzvXtdq
 h50XybA8AaBnIlhGJdibkjdJ9P+EEn04Xse2IGvxo34ufZFLniU/GCcdkEpbQIf054Bm
 Vxn8yjBCrk3n0uwqcXf2kBO9ArrKBpsW60p6kyuWK42f+7eYbZTIz1I04dokqpxviar2
 5HdhXJM5QHQB+0r9j9iHF6h2geFVdUufAATHrFLLw8unWWNRYoUAXCC1LC8Rf53OhHYJ
 S0uHRshod1I4P3EDEfwYn9OUv5JB9yqNX/w5jVIwaavntMyYDvIm+Kt03NBA2iU+og8u
 NBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742850444; x=1743455244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0f4oMKaqWF/1RYznP9bKhltlGtX64Ox9tuugsDhbh/I=;
 b=GgepWJQGKGjrM1bKnPKoLkpQmH/O0DiLoInvWhy8aq48dj2AhXF25ZDU6HJaDYCtYx
 AhdYR7D+of+3WLAq2QQqWadDPW1yPyHxFJm3n0B2uuhb9HfWYuyK2gzZz5RUcNnvTkVb
 0oTICHZtMSsKlKZ9xyEbtNykyyYro4B813MN6eG4hFGMei61nv9qYRe7yAmYAXaYJdUD
 TKmhPL9Bf3nr+v39qLwR7AOlRNWneAdG4ieJ+MxhP3XbCm1mx39VEEugOueABvDgF7qc
 YDW0f8rT9cAEL20vRb8Q3xNylW07RBZJibUEqFjcXTJ380Ja8kksUJySoCOBFSnpGkZI
 5FpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhCdNgkGab+ENeg+hOub7bx9AXIPCbMafy2dxtJQpRrF9ySqu9fP6MMOY9fbM1lJD2mffknX29570=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz/FwHcUYqSTbAgsUTZ0ZaecwzsnuhNdPnHD3SMx4DRONeN9v0
 QMwaGZhwDsOaPOtYJ48iHfGRT8u5C3+YCJl44mTzOpeP8mXyacFNP0ObtViYVcREd+YGtDMB2/u
 2fJVJoDDRlH1VHrsU1XaXf4uqX8E=
X-Gm-Gg: ASbGncu2qYeYl8Uotiwd93+NzoTSupxt2YA7CI9amdregWnvWmF3z1Ep4dUpcP9I9Gn
 JDGdTww5K0FYRP6WPG8eJmrVoGppLUvf6Wf3PYaknrYhBy+Zz3vh2UvuLEclQV0D9GClX55LM6j
 ioZTZ5EmMOqBYzBbVwT1kU51IIAQ==
X-Google-Smtp-Source: AGHT+IFFjtafG0wMuZOrq5yJdlInKcUlyDtdZ577YwhsNZ3Yq5ctbw5CS07D7387Hjb2bVPr/RDfiCq2gCBAQwtQGQk=
X-Received: by 2002:a17:90b:2250:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-3030fd37008mr8714903a91.0.1742850443707; Mon, 24 Mar 2025
 14:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
 <CANiq72mQ3zuYmsq1PD-49kKLNji8OJwuvxK5QWkNaBMuC-PHQg@mail.gmail.com>
 <509EADD7-607B-4DED-ADAC-152D7338EB50@collabora.com>
 <CANiq72=aVRMvOaU48DBLL=p+VoG3RvHK+K48XQhvHw3ARc0BNg@mail.gmail.com>
In-Reply-To: <CANiq72=aVRMvOaU48DBLL=p+VoG3RvHK+K48XQhvHw3ARc0BNg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 22:07:10 +0100
X-Gm-Features: AQ5f1JpZ2zvfI8VoAwy2TeonYlCMJU7HVQ7vBEitKnbxHHICGiRlv1x9aYjaYgE
Message-ID: <CANiq72=4+ubh0F5y2QMobFoyQPs4Aj7bOL8n4y9LzHxrb9Z2sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: drm: Add GPUVM abstraction
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

On Mon, Mar 24, 2025 at 8:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, I asked upstream if we could have something that at least
> detects what could have been intra-doc links, because that should not
> have too many false positives since it is a subset:
>
>     https://github.com/rust-lang/rust/issues/131510
>
> It is still tricky, because e.g. `Some` or `None` would need to be
> excluded, even if you require the exact same case. So it probably
> still requires extra heuristics.
>
> Then there is:
>
>     https://rust-lang.github.io/rust-clippy/master/index.html#doc_markdow=
n
>
> which is closer to your idea. It has a few false positives (e.g.
> KUnit) from a quick try, so probably we cannot enable it for
> everything, unless we commit to maintain a list of terms in the
> config. It spots a handful of things we should fix, though -- I can
> send a few patches or create good first issues.

I went ahead and sent a quick series for the latter:

    https://lore.kernel.org/rust-for-linux/20250324210359.1199574-1-ojeda@k=
ernel.org/

Cheers,
Miguel
