Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC23A54531
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA0F10E12A;
	Thu,  6 Mar 2025 08:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcFX3mRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A1C10E12A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 08:42:16 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5e4f88ea298so605661a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741250534; x=1741855334; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WE8HEXPDHlP3/Ze6vBhaSEBaCZ2xj3Huz/M2ft6sExY=;
 b=QcFX3mRqh8QTMwauFOgsOA87i6gbKmFrn+FIvHCV2TSghaQjJf9YwrXcHH2yU1CnWC
 +ZAt9PZaiJUPQM7YfGEpQ8oIDuzNR3ztXC858NHtMf6MCyg+UsVa3tDVzIZFKQ8z2fvX
 6F+FtxkJF0Meu5V6o8ueg4JEhqBGTo4kXi8sNSoixQwUW/ZsWh0WbVO/kUNdDYTaDMWV
 aJEEJKTDJo+PQNakdQgdIRjJF+QKtr6TcH5otEtHr/kOIoJ722iTRSUl8U4psHSoAac9
 KsuVc7ZVN5ZEuTPts/v1EJcOfrND8R5HPB4i0Or60oirVAx/DAAPm7/tjofvOsBAP51l
 JO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741250534; x=1741855334;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WE8HEXPDHlP3/Ze6vBhaSEBaCZ2xj3Huz/M2ft6sExY=;
 b=tQZ27YeXhEe7s49u9ww28OFbyiDZgtqgW8f/BOAtZhbSrapwZpR8aI60Ls4MNSST0N
 WXIewGGQ6ocAzcpCTo8aS7DpKNbWoILWajYC/5So7fHt65ns9fJulnRuzKVxZnlD/CgQ
 c6Nv4hVlwCozPoOxARN4EvwG86qiE4PGP0UNRZaxYA+tpiEXm9M1oX2KzATCGKKRBvI7
 h1jko0Ej8wiOTvArCoidksEAhZ6pPQyYIZ6N9ssenvmqHmVqca/6RX1UwDF1UPOd9P6t
 gleufVkPPnyKrHrXrIKhkzZKuyQk2AM0KOMiMsDKcWHZT3ZFW7JSMfR3bor6CK6phxqF
 EnNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDNv3vCdKE3uV8itkOHFC9XTPOHEFebcU5cu7zuQQymJZ/niOfWbzy62RRBHGLXM5umS54STgFbKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxit9npVFQzLUbM70tTwNLu7hkhvnwx0o7WorVgADXsH3YsInyq
 7mIa6lWEfI0hTMi2Sc6dM5LqeWlRP3e3f5OSM0rHJecDhVyIyedB
X-Gm-Gg: ASbGnctxg9lZDvyUKecq1AaXDBSyWVihzN4aU55HfwZJWm7Lf0xU50TRR2No+/b920K
 VEgE14WKrh2YP0fzWm/YWmQQbegmYxg99VQuTLZTzEIuk9/NN984I9LDHcSPd6404Yx1iZ7l/ZU
 tYXbFzWDLVhHi9DIdnUNcf6EMue6W0RR88A1qkQ5e3bbbNRK5ylYnYrsuD0s37jtH995jCyXwtO
 GHRpIqf+LeXCrR4KiYw5L4Pd4jUWnyk+SPQguKU9UnzFKQbWyN2YJ3zMDvnXFeee6H6JnpyC4mm
 XZzWmXF7f3NyrwfE8Tvj4YihVC0JW/Jd6BeF/Dzg5NfZjrP7Lr+E+IQkBLpgVZrX1cbDqpXxUS5
 xV5eGiLFOz/zKEVJ2VIgKldfDFQ==
X-Google-Smtp-Source: AGHT+IH7rJ0bI5uRIzIqrHdOqVbIP+Y1Jj/C4uRWsNFMJDfrRYE/cGnXxp+rRBuh8BWvmklTgurn9A==
X-Received: by 2002:a05:6402:2157:b0:5e5:b9b1:8117 with SMTP id
 4fb4d7f45d1cf-5e5b9b18547mr3313222a12.18.1741250533408; 
 Thu, 06 Mar 2025 00:42:13 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c766a5f7sm587786a12.58.2025.03.06.00.42.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Mar 2025 00:42:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
Date: Thu, 6 Mar 2025 09:42:00 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
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
6 mar 2025, o godz. 01:59:
>=20
>=20
>=20
>=20
> Both of the two config options should be enabled.
> andy@Pro480:~/WorkSpace/linux-next$ rg DW_DP .config
> 4044:CONFIG_ROCKCHIP_DW_DP=3Dy

here i=E2=80=99m a bit lost=E2=80=A6.
greping on full kernel sources (with applied =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936784)=
 gives me no single appearance of ROCKCHIP_DW_DP=E2=80=A6
Do i miss something?


