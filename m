Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F40A4DEF0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A26310E5B5;
	Tue,  4 Mar 2025 13:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eZZb7XS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6AB10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:13:08 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e4bed34bccso7858075a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 05:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741093986; x=1741698786; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLbCdf5ydhGRwAPCjiKPFxPNXbtTOCnpAyz9+gFbv3Y=;
 b=eZZb7XS2h5T+DHRy2ZodvegOtFXT0EnByzPv/h9JT2iAJST6kd54ucI/rLBdq+Xb6d
 EfrzoTQGx2hud04Z4fOIb3D3YSIorvLMQU5JRnl+q1AZADLhcvbxhY9xd6b/SCbYsQsY
 DKvv8HJop+4Ys1fMZMy4c1W3z9u5a0yP85ZR7oGptbICWP2F+zhtbozA8/dttLjGVysq
 mbfvP+xHiIGVavFaeHmTrkpKijKjN1V6Txj8KxM5sSYrQzI7YFSKKkNw4woZ84uvTAd7
 DJOUirmBAAUn2zGctGeKJ+KQZwZ6oxsZh7WJ5a2jhFVDTDjL6Qog6oD4wuGiK9J8Uhpy
 CPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741093986; x=1741698786;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLbCdf5ydhGRwAPCjiKPFxPNXbtTOCnpAyz9+gFbv3Y=;
 b=vJc5JiTWqQJv7vk/1Wo7jQlYrI6gIJZzApfVTATObvHplxPn4FKQ6j3aAMW8Edqzuc
 qpGvcZbgtJiaw/Fb5qSWBTc4BONRrQ7/KV9KWKvdN91SUXWSu8hd5AJSvtZoPmJGiFSn
 bLDcbIJSZ8LF83u+OboqTeFf+WKgoGVkwtVRvPQMaG8NZ0Uxtt3TM/nZZR1BUVe5jCQY
 6lu1LviaW//dI23x3JOCsF3aALhfT8cKj0KX80dWFJCjAplUl1i1J/1ubXHmjmM67zNq
 E2/4d9qEzNLP1P8CCFFRtufMnsZgAQT29EyPQ3lzMd7z4Uvjp1dqdnpZjmOwPzZ8tz2A
 QYGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2kLCZBcsKog51EmvtC3dW+ISuyXYWJYc/i8o+o5GgFXBG7EbSz1i4kcWDM+P5E7W9bSL24vhxq2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4D9x5mkUwxv8+AbgkyZ/ttxkeC/2SAtccyA6sHMM06lLC6HxS
 GyJr+KN+fTBE+Gbpldzb+fFoYp1dPe0NY/o4Ibpywh5eWad0awD7
X-Gm-Gg: ASbGnctcK9qFkMpBg/JZCuHfetM2UZwdwmUqVAvEja8UflHpF0OyPl0KSDf7h2Na0KK
 PSex1EOcUHd3J5rRQTapCvnaKD5QA3Hs9XXV3DbOqVEBFZzGXXMO1pcxfd2FlOU7SMQq3AaQS3q
 jAB2UFvCJkb2SVP9+odaUWZFOuy8HesrWZl7xg6/9pKjBLuC5NC9MHGcEAcglts2Mg02VrpFqOn
 zYNcuKL9KVoch8YMeE58zoaWE/Kwrd2bmxVVL5JbqXmCWabSP1wjtcfc8PgccIUMBVhjupvbYRy
 +5D2+RIleFpStKhnUB26X7T9abkTtQihNgjBQzG8Zv9Uip0rEYSgjuYcIxiYtv9HWfrC8iYkzDH
 5IyC513nvpbyxXTnZjdvM3k2UEg==
X-Google-Smtp-Source: AGHT+IFoaUg9Nkh97ooIflZaTgzJMVg2UFR+7WPJFlk7BUC+KoSF3yd0IR8of6FOHQwHK0CM0VOg2A==
X-Received: by 2002:a17:906:6a24:b0:ab7:6fa9:b0a9 with SMTP id
 a640c23a62f3a-abf25d94191mr2160998666b.11.1741093985833; 
 Tue, 04 Mar 2025 05:13:05 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c2f408cdsm8118489a12.0.2025.03.04.05.13.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Mar 2025 05:13:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <7b8767fc.3607.19551aa5f74.Coremail.andyshrk@163.com>
Date: Tue, 4 Mar 2025 14:12:50 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <047EECFC-7E55-44EC-896F-13FE04333E4D@gmail.com>
References: <20250223113036.74252-1-andyshrk@163.com>
 <AC3DE87B-64B1-4C34-8E1B-3900E2C53AA3@gmail.com>
 <7b8767fc.3607.19551aa5f74.Coremail.andyshrk@163.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
1 mar 2025, o godz. 13:24:
>=20
>=20
> Hi Piotr,
>=20
>>=20
>> is it worth to play with this or it is too early?
>=20
> I think you could give it a try if it using the Standard DP=EF=BC=88non-=
ALT mode=EF=BC=89 port for output.=20
> Since I don't currently have a development board with DP1 output =
available, I haven't been
> able to test it yet. As for the Type-C Alternate Mode output, some =
patches are still required=20
> I'll  send it with V2 tomorrow or next week.
> Feel free to let me know if If you encounter any issues=E3=80=82
>=20

Andy,
I added dp1 enablement in rock5 itx like this: =
https://gist.github.com/warpme/bddf75912193f57724c49216d5d85d4a
Unfortunately it not works.
For /sys/kernel/debug/dri/0/state - pls see above link=E2=80=A6
I=E2=80=99m not sure: do i missed something in dt or rather issue issue  =
is in dp code...

FYI: schematic: =
https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.pdf



