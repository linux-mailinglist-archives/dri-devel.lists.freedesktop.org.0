Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83FC97883A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 20:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82D910ED73;
	Fri, 13 Sep 2024 18:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gHKns8Jb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6AD10ED73
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 18:56:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF48D5C59F6;
 Fri, 13 Sep 2024 18:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9A2C4CEC0;
 Fri, 13 Sep 2024 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726253797;
 bh=Qt3WqlAXhsTUdih86ZFXxBiSxdezTR3T196e9DV/Wm4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gHKns8JbosAIuTvrSqxeK2aq6CJw+YKHLSJAw8ToPw0RI5oeXhWx01XrVWHNuHV0/
 qZ1ruZGOhb3RTM1oZItA8CK03eHeb3qZqdyA7V/ljn0FmyNICrxUUvk4sA46JJctWF
 nccYiWeJi177FfcEbuNJN7UmtvuTsThUuhb/qOBEFZu0CXHd60jDAsJLvBQdb/iq8C
 KRNtyEUvMmmA8z5F2Kto23wXj0wYCScwM2n+YeSl14xWfifuqrdrSP02yk/4kzO5/g
 wKqFf27d+SLaHTkGv8hmhBVVP+SQUBeXN/6RZBW0ONInU5z6nUm+Nyp17l3VMSZw0U
 XyAc4ofiJw3UQ==
Message-ID: <eced45837d63618e5383f5324adfc5c3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-2-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-2-2d2efd5c5877@gmail.com>
Subject: Re: [PATCH v4 02/27] clk: qcom: clk-rcg2: name refactoring
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Dzmitry Sankouski <dsankouski@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	cros-qcom-dts-wat@freedesktop.org, chers@chromium.org
Date: Fri, 13 Sep 2024 11:56:34 -0700
User-Agent: alot/0.10
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

Quoting Dzmitry Sankouski (2024-09-13 08:07:45)
> clk-rcg2.c uses 2 variable names for pre divisor register value:
> pre_div and hid_div.
>=20
> Replace hid_div with pre_div. Update calc_rate docs to reflect, that
> pre_div is not pure divisor, but a register value, and requires conversio=
n.
>=20
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Nak

hid stands for "half-integer divider" from what I recall. Feel free to
document that, but don't rename it.
