Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8A94F5EC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 19:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1D110E1B6;
	Mon, 12 Aug 2024 17:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gr2IQ7If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6C510E19F;
 Mon, 12 Aug 2024 17:38:50 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2cdadce1a57so3576766a91.2; 
 Mon, 12 Aug 2024 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723484330; x=1724089130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCcUv37+5u+4JJZrsFb/7pw4tBFELLMTnMEqEoQVdH4=;
 b=gr2IQ7IfCf5Lp2BXhMSJtyf3SHELnYnBzppjmM5L34nMsvc74NTmhUCBPO41TIIr/B
 PfIQPE9iddXq5V/km9xGj9kWTAxWEeFfeMl/qsXbLSHm0IDjKSn9Uno3rybYF2rJA1kw
 kSt98AcI3DxtEO5jMFFlOwOq4kszhBkl7w1GqzcoP4ACRSzBi59+51I1WTevv7+rEQMq
 L00xAnFXCNuBEn0UglKVDI0JRU4GnrEcmXN+N0Ik2UWAMDabp+P+NMu71DnrPNeT1fW9
 XJiCBK+aUMvGmJyq8YllGrgJKDxu41LQi7LfvjvqArix7nbg8gm87YTcsJZp83em4R+A
 16lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723484330; x=1724089130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCcUv37+5u+4JJZrsFb/7pw4tBFELLMTnMEqEoQVdH4=;
 b=lFAHPohTLMtix8OfI130bdLiY7dIAxzitLdi4GQW2BFHXO5z+TPbFE+MvYdMyF7u0F
 3Sqm2FAqx2Fa2p5/jsFEw2n1EqwO4HWiKYJ9CAG3w6pAV3NG24+C6aacR4gryNFCcsej
 ejuE0o7Zed/VJ8G2GiiBsNBuOkvn9kXHu5DjcmbE3V2oSA5MpYU7nF33oT2Rpdk/kkV2
 YM/E6t+sCic7szNAyn4kLxxdBCkGgqx2nkapucCVU60HSo29o6P9Ss3pTKXyeLGvzc4O
 R2XLenQblvwK3iBsaL+LHkbwOw1VnD4K8uz6OC/mKIC+0zFsWbu6Kzlo6YnIvXVAWqZl
 LJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVkcFN+gIHPMwfO4TXD0OycQZP3c/4szgAETNeZNSH5vrPGH0/tK3tr0U3qaZCjfOZgpJqHgpCGQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw25t0SScnbtGd2ZPgfpAyd63fFdYCRC3eZzZlbDrlc53iMhXiw
 jOVXI2bm/2JhRv9wxoUTkNyMb1wlo502kjB5nY0PH1d3tGXnmcbVJ6EQtM0X/IyqmNapzOgbLNh
 hwJZWPlioc3yZdoFWhJZfwVc1dk0=
X-Google-Smtp-Source: AGHT+IEETFkUFMiB+Heqo+VnA9kEyVCdmT5SYzP1RMkK/lQejNf3TtG0pnwU6umMb5g1gdhmWhPw4mAGOdVf0T4Okj4=
X-Received: by 2002:a17:90a:d794:b0:2c7:ab00:f605 with SMTP id
 98e67ed59e1d1-2d39254ebe9mr1008725a91.20.1723484330316; Mon, 12 Aug 2024
 10:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2024 13:38:38 -0400
Message-ID: <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, David Airlie <airlied@linux.ie>,
 Oded Gabbay <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, James Zhu <James.Zhu@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

Are there any objections to this series?  We have been running into
this limit as a problem for a while now on big servers.

Alex

On Mon, Jul 24, 2023 at 5:15=E2=80=AFPM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> 64 DRM device nodes is not enough for everyone.
> Upgrade it to ~512K (which definitely is more than enough).
>
> To allow testing userspace support for >64 devices, add additional DRM
> modparam (force_extended_minors) which causes DRM to skip allocating mino=
rs
> in 0-192 range.
> Additionally - convert minors to use XArray instead of IDR to simplify th=
e
> locking.
>
> v1 -> v2:
> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>
> v2 -> v3:
> Don't use legacy scheme for >=3D192 minor range (Dave Airlie)
> Add modparam for testing (Dave Airlie)
> Add lockdep annotation for IDR (Daniel Vetter)
>
> v3 -> v4:
> Convert from IDR to XArray (Matthew Wilcox)
>
> v4 -> v5:
> Fixup IDR to XArray conversion (Matthew Wilcox)
>
> v5 -> v6:
> Also convert Accel to XArray
> Rename skip_legacy_minors to force_extended_minors
>
> Micha=C5=82 Winiarski (4):
>   drm: Use XArray instead of IDR for minors
>   accel: Use XArray instead of IDR for minors
>   drm: Expand max DRM device number to full MINORBITS
>   drm: Introduce force_extended_minors modparam
>
>  drivers/accel/drm_accel.c      | 110 +++------------------------------
>  drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
>  drivers/gpu/drm/drm_file.c     |   2 +-
>  drivers/gpu/drm/drm_internal.h |   4 --
>  include/drm/drm_accel.h        |  18 +-----
>  include/drm/drm_file.h         |   5 ++
>  6 files changed, 69 insertions(+), 175 deletions(-)
>
> --
> 2.41.0
>
