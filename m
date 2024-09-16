Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE3979DE5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E72610E317;
	Mon, 16 Sep 2024 09:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWEPET8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C528310E317
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 426D4A41B06;
 Mon, 16 Sep 2024 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F3C4CEC4;
 Mon, 16 Sep 2024 09:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726477754;
 bh=6bAu07qqR/oy28Hk63f8SgDGRZgodwoDApVLtXIhnKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jWEPET8GkRDhZlgwScXUjeqyarWO78GNRYSkz/w8ZpRRjHhDg/XQPWVoclsA0hYkW
 43B9rmTeVO5JALDYDUutwRRZlkYiPuHA7uh4MFiDsNjD9rsrkldQS9EQ22TUVhGMcB
 2KYpxXEdqqs/fIUpwTSHAJV0V2lW8QHCBC6VEgnUY58JJJenIgWHYXVdHrS/N9KvNV
 QvZJYvNXyVXO/B/csMhAztgdAD5RW4jz0EjaEB/3de/xQ07rsOqVTVZ/Yl1gAJrR1J
 XyR/AaG/dFz0Wt4jqE+QmPLDXu2sZcqPkoXrEOYRoemvRnBf1B2cJPPU5LWecB+Jrc
 dEjtkixUyXY6w==
Date: Mon, 16 Sep 2024 11:09:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 14/27] mfd: sec-core: add s2dos05 support
Message-ID: <konn3okav5pzval7cjbuhjgesvhhf7a2cmuz3cxsob4nn6sxgq@nz2bc3i3acx6>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-14-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-14-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:07:57PM +0300, Dzmitry Sankouski wrote:
> S2dos05 is a panel/touchscreen PMIC, often found in
> Samsung phones. We define 2 sub-devices for which drivers will
> be added in subsequent patches.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  drivers/mfd/sec-core.c           | 11 +++++++++++
>  include/linux/mfd/samsung/core.h |  1 +
>  2 files changed, 12 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

