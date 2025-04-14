Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E34A88AD2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 20:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3EA10E220;
	Mon, 14 Apr 2025 18:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YIghORUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9B710E220
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 18:14:17 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so809781a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744654456; x=1745259256; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
 b=YIghORUntWvAuVfk2/DXXScK5EGBjWb8XMGRJnME1d2wqFGKtyZ48Uvv68nbdPnp93
 terGBtmKl2yRzmDUufrTd38rFaaG7b3tTVLJQsO34c593DhfmTqK4K+xfAgw96P76ZGi
 ixyMcM7uiXNv8JjLkikJv59wugHCXD+dxOTLIRT0ABEV79sbLsv+9K8C8y4ZCgb+naUP
 PlDR2FSL//5fPADNNZFPJU1+L+TE+4Xlyipk/AXeH+tgkE6RdWJr+cPToa1WWctWMm0v
 O6bw9b2JrKpqMAaILn+RU+yv1kUb08OM8VWFu7HkUgUA/pVvhMs18LYiKdaarJ7/V5ft
 +yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744654456; x=1745259256;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
 b=VneVnT5KNjSqq6q3J79AKT62uvCieZj5rOJ9rg5+qZplhiocGg0cl4BK3WCngMxpMo
 qDRLn3/VOuSBHLzE2HSvq3l8PzOAdFwusn24rt5FQE7LZzS3o/fAjEupDOMXJ8ribTmG
 e/wZQza1UwjaUm6X5ZJGF6vK2IfeXf1eM3AWKf98+iZX8WBio/45ogQi51PobQSFcwyu
 iC+IuM9dnfYG3wWALgR7hMaW2WspyB9dN4ZIRasaFp7+3kSD+XX8KcPeQbqSBwJfaQ1r
 j2iiU8fa2yf/DKqpW37f7RwkITOvnyWuIlP9h+0trw2CWvWB74qEoHJJr9uA/SQAwR/L
 uuFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX63Li/zY5zDJFDf+m0QGunQqlwRAJimZ1wVklttxSRpuckmVQEOdXmjCv5BBdWFuYLQMPiGT1LiCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys78eCLEg1O6ZZImG0wRzaH57Po3p7qUZRfWton3ZLssNAU2eS
 mhnVWrrQeak6jMF/EEU0tj/nWWABY50oG3epJyOBcnw7CLWaeXSz24CmNAFhIVFWJ5tWp2Uxhl6
 bfIFsHQOnT1nEJ4v1+ZuYCnDxJu8=
X-Gm-Gg: ASbGncvR4qBwwmXD0xGqa2Co80YgrwIQDrk6jJidNRh2eqehSx8Xr1FZUXKr6fxBrLW
 G2UUTrldvLsSQaoPJjc8Ipyz3g16ksedfmWvUrRfvlKl1hecsfgBNkj3srLWPiLCsJ4UchcZei+
 JMiM4yZ7H+sR3rS8E92ZGJ5Q==
X-Google-Smtp-Source: AGHT+IEkXTvk5+VQsfOHU41Nt1ayqw8E86sP2+R4MnwHDGO5t2/updHhtIrmagcb2TLk839XbaUBZCLWooev7OOZdng=
X-Received: by 2002:a17:90b:4c4b:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-3084e777d31mr460558a91.7.1744654456437; Mon, 14 Apr 2025
 11:14:16 -0700 (PDT)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 20:14:04 +0200
X-Gm-Features: ATxdqUEQM3cWjHtvsETO9v7OduJ-ylsXDY8NGs7BGU0wFttRYdVgU1MA1pnQNM4
Message-ID: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Subject: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Jocelyn, Christian,

I started build-testing arm 32-bit within my other usual routine
tests, and I hit:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a

which comes from both these `u64` by `u64`:

    let out = (self.carry / pow) as u16;
    self.carry = self.carry % pow;

Christian: I guess we can offer a set of `div64` functions using the C
ones, at least for the time being, and eventually wire the actual
operator with some support from upstream Rust. Or do you have
something else in mind? (i.e. I think you have been discussing
intrinsics lately)

Thanks!

Cheers,
Miguel
