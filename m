Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A012A4A9E7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A52D10E157;
	Sat,  1 Mar 2025 09:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7fgroTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775D010E157
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:12:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e50d491f69so753651a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740820328; x=1741425128; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62M00yAg51rrJZ04g8zC95EvNZ84F8x3AjdAvJoHunw=;
 b=d7fgroToaPcOmXa39pg5f71exwNwId7D+ucfbKqECe2I+sxfayF42bZLg51KRYXnlj
 p4BexCEzLHONi5AsFXaKT5lnOMpap3hQ0Sd5qraA0/+0B0SCE2uX/Rd5Qspkz8QSjkQS
 66ctl9CBpI0s4vzJzfpm1q/xPzEyDzlGrY4WoGd2Hoi5dhtvURkLkI2Jo6LDsX5Ba4lH
 f1MpYSByAUPnaYOR6DSVXfuggzIV/a/RUwvz8wQMy1NxF7LpA/jP29wSuZ0x8WWvlrkg
 ubA4JV5h6ID18sKcCaGBVhPO4mV8xLHD4dlhF1EpDPSokeQe3Bv6VKj6PUp1a/rNGhoW
 sNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740820328; x=1741425128;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62M00yAg51rrJZ04g8zC95EvNZ84F8x3AjdAvJoHunw=;
 b=jhxENE6lsS0iIYOfb1W+XuHHmRe74HxJg0vwqMl6RcXQON7PHf87xV9TDG2ktHa59v
 diLL2LY8lxPG5r90xTqCbjiKUIeG7fDrUQ/xC0E82D46Iuz8QvUgiFVy4qN+3Usu1qO/
 5Hil6aUSflkbs3encuLwTY5+kHmd+QsJCVZOY3Qg7UpkYmL9Y+aD/EBX/X057Qp4SdyQ
 RHUP2LCpEZKxOXCJnNS+uj3XQ5aJnEhvIW/JWBGbh9O0wg6IcTVsISQte2nLfkZ7Ma2n
 kuViUdEoThOb8A/c++V0jfhm9D57iFhCsvD5+t9t6+r/NHsffu2YcIqGht/opLHgFe4z
 msag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ5d9/cuCdbxo63sdlHuyTXCUGuauZQ7qxk8MXLBSRQboj5EevnOdX5qmA0P1RQL1xQ4wyGnVyRsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWZzac//rvo+HjlsHfq3BGrCygNfDEvW8nm1xxk1t8V0dcYPxV
 1+MTffYxZuDGZb586UsFqmvpwfX/CSH/ayolsHIqrXRKe8ldXk+z
X-Gm-Gg: ASbGnctlczT1XnluXzL/7LOjyXN+36SP3sp8a4agwhKin7ipe6LX/NnsCG1Mzi9A9Qe
 YZ/gm+BIsCpBgZntp2LStqsZFmU3fuXgZUr1OwENgtNgmfQ4EiTTN3I+NtMYtW3voC71lnv8wW6
 JKeh5WGJydj0OkTuhUhgrDOffdIsDxUEeDckqrIZf6v8agMDSjI8EXU/nYoaQ2UM83qi+pmR7ox
 WlyFjr3FTKjXj66nkClFN1sMZkMEVdGn43uefR3TAUzvCLKaQIk24Rh6BxgZXrKx/Q2SAXN6do/
 dhnmPCtZUXbb+rdvOpCgvzw1ZymQ79C8Znk4H6EAdihUu5rh9xyxHQSW5BQUKrY/1e8dSrovDNW
 zJWmlRA4el4LlgqD3X0LJDSgOHg==
X-Google-Smtp-Source: AGHT+IEV8xcpINPWUe49yXpBYPm3MtVspqPFUx6SBprxmJEllwjfLWfeeFh1xeuz1VE+t2lFH6t06w==
X-Received: by 2002:a17:907:7288:b0:abf:5922:b7a8 with SMTP id
 a640c23a62f3a-abf5922dccamr135545766b.41.1740820327515; 
 Sat, 01 Mar 2025 01:12:07 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0b98b5sm436358366b.3.2025.03.01.01.12.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Mar 2025 01:12:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <3337030.aeNJFYEL58@trenzalore>
Date: Sat, 1 Mar 2025 10:11:54 +0100
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A30138B-183E-4816-80FF-AACDCFE3B3A6@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
 <8734g2sg4t.wl-kuninori.morimoto.gx@renesas.com>
 <3337030.aeNJFYEL58@trenzalore>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 25 lut 2025, o godz. 15:58:
>=20
> =46rom what I see, the error is not present anymore on linux 6.14-rc4. =
I tried=20
> reverting your patch "ASoC: simple-card-utils.c: add missing =
dlc->of_node"=20
> (dabbd325b25edb5cdd99c94391817202dd54b651) and the error reappears.

Guys,

Just FYI:

On 6.14-rc4 without =
0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch - i =
still have oops like this: =
https://gist.github.com/warpme/ed75c05d3b68f995d429dbd9097005ba
They are happening not every boot - but still happening.

However applying =
0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch (with =
some adaptations as it not applies cleanly on 6.140rc4) - dmesg becomes =
clean (10 boots; all ok)





