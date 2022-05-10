Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891B520E5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 09:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE69110F137;
	Tue, 10 May 2022 07:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAEC10F0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 07:29:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y32so27732961lfa.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VSqxzZ29hbc10inJEDBipg5Dn8Q2IgbVBIfcAZuWFlc=;
 b=ZpYGnuztQW0iA1l4+RIZIihgQVuuvVmdcZwAdtEMwooAUiC0fu376dlSygjE8O0mwP
 Un7c+sHOg0wOmMwO9X3VZ5bJImTWXQDt4H+g/6l2K6SyjxdvvVuBcJFuTrTIwRKmNY+w
 +N174UAnqR55Gt87Kf2jwomaCpAia42vtxPOqGYvGSuVo1dmvtQyCLQfnjxlE/eBpFxJ
 e8HycjhiLJtATq/gLyrUAyVeAudl5qOh6Oyj1YhshYUZq8RaTRJu8wKj3izgSiGcD330
 7C+Rqxh5C4QcmK9CIEm7JpQb0LQsQq76viDK4vVSRHLI0CQbOnVbwiIfscZMuMJIn5BQ
 EfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VSqxzZ29hbc10inJEDBipg5Dn8Q2IgbVBIfcAZuWFlc=;
 b=duCr+dZm5XItc9aUJWyMAjjjJWd4Y4bv5cDdTSUz10yUnw/xFhN0tEkC4HJRvx5FQ0
 1ulZsSV6FNE8bgQXo+J/TfjKcI6KFFdhpKHrPheC2I+BqANWlouafXVHTG6h3KmfRC/y
 q2p74QYaysvOMe2XmipGBR9426XverwKqEckgrIWsmARqmQiBiVMF4JCZlzUywg1h1lp
 DacZZNBLEAESIt1fyRykjZcEHEGiQVwJSFmDXaP/Z4YN24YkIRawcY50gML7NcsqWvv3
 KZKFF6xi5EAX8IUNhuAZV0WJwTKzVYStgJCVTJ+L6o/ZoGQtVqxuyS+JCFT6eATPI8IE
 6X0w==
X-Gm-Message-State: AOAM531bo7VSD5rCsiQRDKNWe+/G4rMi0CbMFX2d5r4oI7kEcYdt1bCb
 60ihw+RP5LDL0eRqocTRVYY=
X-Google-Smtp-Source: ABdhPJzuUZxd81Xg7d+yaJFS9q6e43uMHj3m7T3kM3PY0/JUhTO2qkFChHbG5NwyadTcS6MMwjtvHQ==
X-Received: by 2002:a05:6512:1189:b0:473:b9ee:30cf with SMTP id
 g9-20020a056512118900b00473b9ee30cfmr15797805lfr.282.1652167760971; 
 Tue, 10 May 2022 00:29:20 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 r10-20020a19da0a000000b0047255d211c1sm2189757lfg.240.2022.05.10.00.29.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 00:29:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CAMdYzYozewYUbM=Q+iJ2wdM5TrB6dGrjS6zh0qmVgWD4XPVR+Q@mail.gmail.com>
Date: Tue, 10 May 2022 09:29:14 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABC61229-B851-4BB7-8B55-688F8A8D841A@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-21-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <812AC0DB-A6D0-4DA3-BCDC-7743E8F61821@gmail.com>
 <CAMdYzYozewYUbM=Q+iJ2wdM5TrB6dGrjS6zh0qmVgWD4XPVR+Q@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 10.05.2022, o godz. 03:35:
>=20
> Could you grab the clock tree from /sys/kernel/debug/clk/clk_summary
> for the clk_hdmi_cec tree?

Here it is:
                                enable  prepare  protect                 =
               duty  hardware
   clock                          count    count    count        rate   =
accuracy phase  cycle    enable
=
--------------------------------------------------------------------------=
-----------------------------
   clk_rtc32k_frac                   1        1        0       32768     =
     0     0  50000         Y
       clk_rtc_32k                    1        1        0       32768    =
      0     0  50000         Y
          clk_hdmi_cec                1        2        0       32768    =
      0     0  50000         Y=
