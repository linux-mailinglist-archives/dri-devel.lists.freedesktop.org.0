Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D60A6E3AF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 20:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDFA10E4CB;
	Mon, 24 Mar 2025 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U/xhBdGo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57F10E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 19:38:30 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff67f44fcaso1340239a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742845109; x=1743449909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/1WJJoHQRs17pT9/JxCO6Fw+nrbC0tR3gi1sviT9Qg=;
 b=U/xhBdGoOQfbJGfIuCMu/hGYGw7Ey6hhhx1wBl3KBa3SrjiWTQ6TfJlXArU5U96Wfx
 xIvjVBDHsa1FiCO7k4H7sXUpL5Fm3+mTpQwTDnjPSnxn/hN3mODt37vKqOU5rf+ICo+Q
 407TDOk9G6TU5Ua/RuBbiCa3o1QLTibfbtSVapAIO9Yrpk2waBYhC0gkr0AFFvURny9H
 kRzeoG5kV503BTsxD74cXcHwUqnR4zicZbHwHyzrpXMu0H6y6+9uWGJGvsy6N2bfqdZn
 YYUB8j5BoGes7Z3bBb+3mu5I8EUiRfcBaLVe4AE58r7GAboMsMMVwroGoNbbmrTKC3ev
 JJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742845109; x=1743449909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/1WJJoHQRs17pT9/JxCO6Fw+nrbC0tR3gi1sviT9Qg=;
 b=spYq0fRUKcaW/8NHTSEyQI4eF2BQx6ax9KkkemrLihH7WnI5CZc9hAlZ/tuIk/oFna
 N1dwM3dxll8sJckR7BlcRB/E34YXjxJL4oPx6zYDUMGgc1SDCxMIuYu+8SRamm/6Uhzz
 W7V6dRvU3JgENQrC8VJ8UevCQzTLzRJPw505Amf+unKW3Es9oqPEXRLF7pFZvUspfzFF
 yqzbn0IGwsZjt9bHTWUDgnEE+rhuVqUxuPkqyNkhnJ96e4WFxmM76ybJxNAqnDa6Q/RK
 zJ9wjpdZ6eAfpIEFEUc/DRO/Ylc9R8R0eznHbYpHfPfVd0bJ081hoOmF/FDBX9bVr3IJ
 ZWOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViwea98wwN2G6kCCDiPTrl0fZi8aaca9JieH8ty/PkwiaEs5AZDdXxI3Ig1qyPyuRs3a/RKylHOqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXRRRVuWaMNC9h8ZA1jrgN7cAAYnFoyDzFDMiORi8HMldOroJl
 Ha7Vsar4+SB60yVPC/ZWrG1zJxMFMvV+T/X8nAe32zyQE87bE9O1Qg9oDfPNz/yIJun7z0xJtdf
 NrGiTwfqrDQBNnsdJmxx1Fpia2cw=
X-Gm-Gg: ASbGncuTL06fZEp+LfRUui/rYTD8Y2vBPQTfcfDPStvB218lagm9DgZqLQry8K/cckD
 r6CJ6fdMAvnojZbnmYtnD4A5KGWSBGPKuQ9K8DtRBKj/Cy0xgs/1Cl2qJkxYeBYwiQld1GABlpa
 47t+k/2TkIq8h0IRmIzlt1gnbj1g==
X-Google-Smtp-Source: AGHT+IEMUSgfwqdKG7ewoqDLmuTi+jz5Z8D+a7P7lvhW95GrosUyZ6srAtGj1z0Sm9IhoTqBMT68weNwQYnP7YyHjjw=
X-Received: by 2002:a17:90b:1647:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-3030fb1fbc7mr7922237a91.0.1742845109433; Mon, 24 Mar 2025
 12:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
 <CANiq72mQ3zuYmsq1PD-49kKLNji8OJwuvxK5QWkNaBMuC-PHQg@mail.gmail.com>
 <509EADD7-607B-4DED-ADAC-152D7338EB50@collabora.com>
In-Reply-To: <509EADD7-607B-4DED-ADAC-152D7338EB50@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 20:38:17 +0100
X-Gm-Features: AQ5f1Jrk0Og2yGB9k38WW0Nb1tuHdGjlzNVcWtDKGMvkDWjXn2FYepG3LyWjwKs
Message-ID: <CANiq72=aVRMvOaU48DBLL=p+VoG3RvHK+K48XQhvHw3ARc0BNg@mail.gmail.com>
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

On Mon, Mar 24, 2025 at 8:25=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> By the way, maybe we should have a lint for CamelCase in docs? I tried my=
 best to
> cover all of these, but some slip through :/
>
> i.e.: if you write something in CamelCase somewhere in the docs, there's =
a high
> chance that you should actually use Markdown and link as appropriate.
>
> I have no idea whether this would actually work in practice, to be honest=
. It=E2=80=99s just
> a random suggestion (that I'd be willing to help with).

Yeah, I asked upstream if we could have something that at least
detects what could have been intra-doc links, because that should not
have too many false positives since it is a subset:

    https://github.com/rust-lang/rust/issues/131510

It is still tricky, because e.g. `Some` or `None` would need to be
excluded, even if you require the exact same case. So it probably
still requires extra heuristics.

Then there is:

    https://rust-lang.github.io/rust-clippy/master/index.html#doc_markdown

which is closer to your idea. It has a few false positives (e.g.
KUnit) from a quick try, so probably we cannot enable it for
everything, unless we commit to maintain a list of terms in the
config. It spots a handful of things we should fix, though -- I can
send a few patches or create good first issues.

Cheers,
Miguel
