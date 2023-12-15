Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5874814413
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0C010E21F;
	Fri, 15 Dec 2023 08:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1078010E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 08:59:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2c5a8150so4219355e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702630751; x=1703235551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
 b=1BDrtipIvRYVUft0uGkAXGMu0ZG7YU5Gnt0Naf4c3LMs9+PizXyEO/MZKfqXFodj/+
 JibBr2xsjPTaLMDHpZNsnIVbGTlk9u6O4kl/ee0nIr6mkU/B8PqtA7tG4tzpeIjORyLF
 V6HtjEuJJKanUltirOe/W3wyGzRyrvnO0nMVilnWz0Cg5A0fG7uIm6vzT/hGdyoHDsqH
 GIROTvcuI5jpXptAXIwjAGA4u+PrvbP0ysYNodZ8XIwDD8ilWbejeAtEWrZYzoCZR16F
 44MIsLgtc71NGEKfA2aJu7EeDRogHqjrKoG4Isy/mtnfNsDZ82qgWRal7nzhnxfzKuSA
 Wxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702630751; x=1703235551;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
 b=ZIqAKWA+e2oMNblHP8QliHXItzvq2Pfnx6g7CHz92VEZOcqoAVtF3gM4a473+imXUL
 KAEvcvHWFEp9sgWnWLYADUcEXYszDEaj5Us4D5P3Di4OPIx7VIyHHf0x1Gtq4W/qZYHB
 r8tWCozA7EvSH+gIC3UPTetnp9bflFd5XVGV0BRZgGoBPSpTyd9JcIC5wXy+uucWNsmh
 zzXD8w6muCrByiGf3uf6UacAA3LBnGDDe6HsOtWSXjSil13BpqBKhAledVpRqj451GWW
 noOa4GzZHGZMJnhnvbA1DLaKkFoLTk639UZnnv9O+jyINRX5FSZlZIfUltElc2OXx2wk
 pxbQ==
X-Gm-Message-State: AOJu0Yz/S7W8+W6TD9xl1NexQGZsgvORl2n45r1GPujR44nWRfzE5PdA
 t6zwosdx4gIFWysBhVdhXtdKIg==
X-Google-Smtp-Source: AGHT+IEboGQxDSRvg+eZ0u566TMxgE1PRMgtXrg9o17xozQrBEwE5qf8IjdFQqOGaJQkmuVK10ixdQ==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id
 f2-20020a7bc8c2000000b0040c279d31a3mr5769544wml.176.1702630751467; 
 Fri, 15 Dec 2023 00:59:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:95b3:332a:9768:b3f2])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040c58e410a3sm10914972wmq.14.2023.12.15.00.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 00:59:11 -0800 (PST)
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Fri, 15 Dec 2023 09:41:59 +0100
In-reply-to: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
Message-ID: <1jedfnq1sx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed 13 Dec 2023 at 08:16, Maxime Ripard <mripard@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> Hi,
>
> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>=20
>> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
>> that and don't check the return value. This series fixes the four users
>> that do error checking on the returned value and then makes function
>> return void.
>>=20
>> Given that the changes to the drivers are simple and so merge conflicts
>> (if any) should be easy to handle, I suggest to merge this complete
>> series via the clk tree.
>
> I don't think it's the right way to go about it.
>
> clk_rate_exclusive_get() should be expected to fail.

Yes, at some point it might. That is why the API returns an error code.
What CCF (or any other framework) should be no concern to the consummer.

Driver not checking the return are taking there chances, and that is up
to them. It is like regmap. Most calls can return an error code but the
vast majority of driver happily ignore that.

> For example if
> there's another user getting an exclusive rate on the same clock.
>
> If we're not checking for it right now, then it should probably be
> fixed, but the callers checking for the error are right to do so if they
> rely on an exclusive rate. It's the ones that don't that should be
> modified.
>

I'm not sure that would be right. For sure, restricting a to single user
was not my intent when I wrote the thing.

The intent was for a consumer to state that it cannot tolerate a rate
change of the clock it is using. It is fine for several consumers to
state that for a single clock, as long as they 'agree' on the rate. Two
instances of the same device could be a good example of that.

Those consumers should use 'clk_set_rate_exclusive()' to set the rate
and protect it atomically. Calling 'clk_exclusive_get()' then
'clk_set_rate()' is racy as both instance could effectively lock the
rate without actually getting the rate they want :/

Admittingly, the API naming is terrible when it comes to this ...

> Maxime
>
> [[End of PGP Signed Part]]


--=20
Jerome
