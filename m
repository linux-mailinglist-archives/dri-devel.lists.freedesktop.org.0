Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB39272CC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A3A10EA54;
	Thu,  4 Jul 2024 09:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Df1TmBx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D610EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:18:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-367990aaef3so297276f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720084707; x=1720689507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1siA8LLoevKDKKIOxF172G452ajSvMRpJAHFo7rSfQ=;
 b=Df1TmBx+4pLzBER26BdcANJi1hiURg3PYHgDLOnAQyzHteedxp9aNMKOcJbZ/NtlOO
 qe1B08FZgkrSMfq2IpT9fD5z7/23TAIdwKlO86qk8zA8LodAs1i5ewWO2G881gx2s0Wo
 DCha45k9qzcfoCvVQL2VxJojqEEmEdhnh1sTknf6EWDBiyhPPBpqfu1yIAWTEidI6xhJ
 Q3GNvWknGYiAxmzOdCaMOrUH7IbCvoVcPV3DMNs0p3SFGCGyboljhTGVEgDaadgl7m7x
 9tUqPG2KDwbDpFuZzRtDSj1KvfYjcvzuDfrQWU8TweuwixlUJ4iV9llzLr4vI9ihHTfw
 IIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720084707; x=1720689507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1siA8LLoevKDKKIOxF172G452ajSvMRpJAHFo7rSfQ=;
 b=gKrc9RuCP9jHIvb0iQT7wSduJIQmCf47LRS0/mqG5/rcgy75nWcj3W9SwVATaUb4cd
 1AeIWHb8aOVb0KTFffMfSCZym5J4g+EkffD0u5349LAJpp6t6h9UwPLdVc8iJATz8tvd
 XW1Z97qlnq6vFVCC0/W3yB7pqJ4gngVAuQUUvuzrewbhsAIy62IDkjgvE/BDmyO76Vl+
 3YgsHB3d3E2qwut9lUNWU6OP9f3siBpafFqjFtT+i0bF7+4nrmH967Cs48kS3+XcRwm5
 QHwqWcU9da5urY/J3wrW+GFSIeICGG+RAkEPXtFkkeg75t6Bm2p1QwwUaATLn27jbURu
 SSjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPduPVBBbJ9Jn2Z70xfoAEK66xil0QtNz6m5k07UYu91iWmc+RnzvsL29VSeYOJQ5+pQi3OHsZyy593tBjPTFiSSjK+GmjGKITz9/e2Jtg
X-Gm-Message-State: AOJu0YyRROFHfPBLcOURojP8QOcwPeh442mziWaURpZH9E/l7G5MCeCS
 Kn0+Jt8u0jxM3ov+MMiyDq7lB2EkUn8zHxCell/mUExELgw3Au/rA3ZIdJsS9gD1m3t9cWW6BAh
 IRlInfPMVSu3IVi4VYY1gGNWwpxWdsErOuEaL
X-Google-Smtp-Source: AGHT+IFDgMZlhl3+7CRvoFM3LiPflhjLDBkW54oSybDEdceJuKcTIyZ3CTjKPpH4LrPW254W2NPoHOZL4/rZiAuJOxY=
X-Received: by 2002:adf:f888:0:b0:362:2111:4816 with SMTP id
 ffacd0b85a97d-3679dd67eb8mr836362f8f.55.1720084706628; Thu, 04 Jul 2024
 02:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154309.426867-1-jfalempe@redhat.com>
In-Reply-To: <20240703154309.426867-1-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:18:14 +0200
Message-ID: <CAH5fLgiMJZYhSiBVc7r3HP0VTCNVG=FuD68v-ni4=54t5vVPwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
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

On Wed, Jul 3, 2024 at 5:44=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:
>
> This series adds a new panic screen, with the kmsg data embedded in a QR-=
code.
>
> The main advantage of QR-code, is that you can copy/paste the debug data =
to a bug report.
>
> The QR-code encoder is written in rust, and is very specific to drm_panic=
.
> The reason is that it is called in a panic handler, and thus can't alloca=
te memory, or use locking.
> The rust code uses a few rust core API, and provides only two C entry poi=
nts.
> There is no particular reason to do it in rust, I just wanted to learn ru=
st, and see if it can work in the kernel.
>
> If you want to see what it looks like, I've put a few screenshots here:
> https://github.com/kdj0c/panic_report/issues/1
>
> --
>
> Jocelyn
>
>
> Jocelyn Falempe (4):
>   drm/panic: Add integer scaling to blit()
>   drm/rect: add drm_rect_overlap()
>   drm/panic: simplify logo handling
>   drm/panic: Add a qr_code panic screen
>
>  drivers/gpu/drm/Kconfig         |  29 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/drm_drv.c       |   3 +
>  drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
>  drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
>  include/drm/drm_panic.h         |   4 +
>  include/drm/drm_rect.h          |  15 +
>  7 files changed, 1340 insertions(+), 39 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>
>
> base-commit: 3f5ea7ed705e8effe9cfabf912e769ccb6b7d389

I tried to apply this patch, but I can't find this commit, nor could I
find any tag that it applies on.

Alice
