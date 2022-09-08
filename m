Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8E5B2779
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCE10E060;
	Thu,  8 Sep 2022 20:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71A10E060
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 20:12:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t7so23042756wrm.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 13:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NZgMNXmwX6SnvwK87AGk7VHv1cRLy9ojL7C9GfQltcQ=;
 b=YJ4s58i5EeQ/uWSSo5Qua0Tu9JxeF7gHHmv6fGDm9QWyiqerXu4Ilr2+q5WcCokQpd
 s5ar2mQZ4qckmj8UstMJ1D5NmhDBLq/hZCLkj/1jV6CIx4Lotf4dIr8qxuN18hOdbaRK
 I3q+IFxGDa4L94z8INS+n2AlUJaBDKJ5s6GbSvprWURXKAUiyetY4D5W6f4J+dmAwoN/
 zFtoXWrNsEuFGpQTrpFvl9HvTgJTUPCPd4vSDKzcXyzL2ggoLchBpbC2TNy1CAh1tG2d
 uVX/3Wui6ini3rsil9KvPp43yLaUjvrqRUe3OgNIpv/8dX41fBz3KD8yrbz4cYzcavBj
 jOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NZgMNXmwX6SnvwK87AGk7VHv1cRLy9ojL7C9GfQltcQ=;
 b=l3pGUxcwVd5foOhS2SRKMliXwl49RQW6DH67bEgK/ULz0SUsw3wUhWLr0SUfkbV3/P
 G4sUkEESHmhHWGQPJPQGL2mCCKgoE9dwJTfT370QFR93mCQeW6XmXt9rVVBeLSfFdHDS
 slJ8EOLnwaeAsaf6G+NCdHvXy4EQE9YLYWYoXn1jyGtMsNLXJEAHK1xmYXPG8n+L8OBs
 DoKAwoEDYVPqrHdaLbd584mikAE0tcH1bwUebIcOo/3a7S9M7zAq1op7kFXwwDrzbqcR
 X1cY4y9VV1oMwQmJNCqfLSCTGomnI1/6PYazuViaCqNUEAGmUxLGwNAHI/FVLWXRlwXo
 0Fvg==
X-Gm-Message-State: ACgBeo01TEYMViXWKVKllxYmRa5fTT1DyQH0PcIFZTOhtlRT7p9v+hF+
 Uuen9/3HTi4yFjY/O2MFiXY=
X-Google-Smtp-Source: AA6agR7zdskVsvESm8kGX7KqfMmGDv2c4HseHMS5FFGiG85C0bwgWAPGhSMfCb228haUWNp4WODYSw==
X-Received: by 2002:a05:6000:1f9d:b0:228:6446:3d67 with SMTP id
 bw29-20020a0560001f9d00b0022864463d67mr6210529wrb.575.1662667952965; 
 Thu, 08 Sep 2022 13:12:32 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003a3561d4f3fsm4852904wms.43.2022.09.08.13.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 13:12:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 0/5] Allwinner H6 GPU devfreq
Date: Thu, 08 Sep 2022 22:12:31 +0200
Message-ID: <4086439.1IzOArtZ34@kista>
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 06. september 2022 ob 17:30:29 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Hi,
>=20
> This is a refresh of previous patches sent to enable GPU Devfreq on H6
> Beelink GS1 but that wasn't stable at that time[0].
>=20
> With the recent fix on GPU PLL from Roman Stratiienko I have retested
> and everything seems stable and works as expected[1].
>=20
> Regards,
> Clement

All patches except patch 4 pushed to sunxi tree. Thanks!

Best regards,
Jernej

>=20
> 0:
> https://lore.kernel.org/lkml/CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+4=
7h
> tg2bA@mail.gmail.com/ 1:
> https://lore.kernel.org/linux-arm-kernel/2562485.k3LOHGUjKi@kista/T/
>=20
> Changes since v3:
>  - Try to be more explicit for panfrost OPP patch
>  - Fix typo
>=20
> Changes since v2:
>  - Fixes device-tree warnings
>  - Add panfrost fix to enable regulator
>  - Remove always-on regulator from device-tree
>  - Update cooling map from vendor kernel
>=20
>=20
> Cl=E9ment P=E9ron (5):
>   arm64: defconfig: Enable devfreq cooling device
>   arm64: dts: allwinner: h6: Add cooling map for GPU
>   arm64: dts: allwinner: h6: Add GPU OPP table
>   drm/panfrost: devfreq: set opp to the recommended one to configure
>     regulator
>   arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
>=20
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  1 +
>  .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 51 ++++++++++-
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c   | 11 +++
>  5 files changed, 149 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
>=20
> --
> 2.34.1


