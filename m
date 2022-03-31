Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26514EDC98
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3406C10E36D;
	Thu, 31 Mar 2022 15:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2D510E36D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:19:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bt26so42097940lfb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=I/zFD1UzYETukb9hPPQb6Vt1PfX3xGeKdTnoCcvEcdM=;
 b=qD1VG8gVzb0EQphdwGkUIE/ZCRoYKB8DLWm5mNbseSwOSW/IIIRQ67VHKNEQ7xStq6
 WUfjNUxp2EHzpmqNAOnHqZ1TNIUaTkl94CgW4p8FKyZ6Q905TMGfMsw9xK2v4yw+Kywv
 BjHcKNQzRaDYkSrW/0P217hlUUW4atYwpA6pAD2/8MsH9wOaiysZi5CuKK/tX7/TtWNO
 NVKN1pZIpbhU+qsCYVQIi90lEv6KqkQMpPrVqauF9kiOTonWkkPEr9u23QxewbShgwOZ
 ALEY10Fk0PXmg56J+MAJ9jUX5yXsU/EQFWBZgws5Hzg3G4aSulqT5lvu9SsSULAAR5ea
 yn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=I/zFD1UzYETukb9hPPQb6Vt1PfX3xGeKdTnoCcvEcdM=;
 b=OxAS8sJSLpKQrhsc31yi1N/jic9LEoCAMjdFkLeGw/DvA3BAri5w0Jruaq4maGW9aC
 UWuWwgYaRsb3GLKUMFomoPTyYiuJznaaW739JwUsqvNkJdE/0f9XB805EljdwKeuPjlR
 4CzsVoReKpbfbLqBAFmSpXH2nM4w7sIULIDjjfSvkZgcDUwXDSB6weUdFbgfocaE9pLv
 9XpzxysR70aLxUkCQ/owhTiU/lg2jyMyLivn5gq5ce9eldKL3MjSYx4zwpZzo4Hxybf0
 8IFZFawvT/Kp9C+cxizIZkc5ClpuaDiMAkckBB/8wTT2TZSqPIYDp5g5A37ducLTpNAu
 4gXQ==
X-Gm-Message-State: AOAM532G+lvSBE51YE3VzfCntD0mTEwjOsMhTZw0cTrML3Mv7gdTm7cI
 SzBcvDX0Abljm3pKuLN4/lU=
X-Google-Smtp-Source: ABdhPJyb/hrz6sQk0Vkca3U6ltTtxT0GjKK1mM9iqrHNcQIkEAcz5q9CA5B5t06ac/PGapOpjw7hpQ==
X-Received: by 2002:a05:6512:3d9f:b0:44a:4960:5b79 with SMTP id
 k31-20020a0565123d9f00b0044a49605b79mr11090759lfv.413.1648739944644; 
 Thu, 31 Mar 2022 08:19:04 -0700 (PDT)
Received: from smtpclient.apple (31-178-191-245.dynamic.chello.pl.
 [31.178.191.245]) by smtp.gmail.com with ESMTPSA id
 u2-20020a197902000000b00448a4a7cfc3sm2695712lfc.136.2022.03.31.08.19.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Mar 2022 08:19:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <3A5C5A71-0CE0-4072-9502-75385C1C43F7@gmail.com>
Date: Thu, 31 Mar 2022 17:19:03 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <C06076CC-DA33-40DC-A443-15254E7F784E@gmail.com>
References: <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
 <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
 <20220331150056.GH4012@pengutronix.de>
 <3A5C5A71-0CE0-4072-9502-75385C1C43F7@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
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
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 31.03.2022, o godz. 17:06:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Sascha Hauer =
<s.hauer@pengutronix.de> w dniu 31.03.2022, o godz. 17:00:
>>=20
>>=20
>> Have you applied the bugfix I shared with you here:
>>=20
>> =
https://lore.kernel.org/linux-arm-kernel/20220330072822.GX12181@pengutroni=
x.de/
>>=20
>=20
> oooops
>=20
> noooooo
> didn't noticed :-(
>=20
> let me try with it!
>=20

ok - i tried.
unfortunately no any difference :-(




