Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894A97CAEC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 16:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEF110E711;
	Thu, 19 Sep 2024 14:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kUsHHg/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D40810E711
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 14:28:30 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5e1bf327af8so468932eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726756109; x=1727360909; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lv99Rd2xF1eeQ1uPXvtn6uzDKVYNGbOgwen3TkJJj/k=;
 b=kUsHHg/RSrpa3ZRP+Hsw16WehYvYqiXCWWe9u6OJBQBitr8QgXe4P0KM8Aj/cC5obs
 jNom7RcjjRaK860ZTDAw9U6YSOWsA0OAX9jYipikEY84zQnDUWVqbLma3q712nLU13sW
 vuHfXNWge6/8ZiNISL6zELeqFV9CmkO+G5USJQ6z/dRow+WwkZDeIHW1gsPhuxQNkqRe
 7rhQNGOBOpbEJ8t8FpltloKHUGMQqXBF+oMhY+PlZUtOnzYIvacNeDkru2VkcX92EMGM
 KenKNFo6UvO8itaKy5DenkW8ej7WUWLL02+gNcubWrCfQxv3Cch6bv4rfkHIukd6V0Z/
 I6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726756109; x=1727360909;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lv99Rd2xF1eeQ1uPXvtn6uzDKVYNGbOgwen3TkJJj/k=;
 b=obQfqSSRPs4LF6us8p0dQunRsl6ANUCPzuRFcsFzkauaibhCXs88cPPRLoovJrDbhG
 cAMdoKH7j92w50CIdgDjFBmbUFuZIUJlnm53lATvBhWwnJdobJdAUMvW6Wt6cHXkwuPt
 ooXoNuRkBJoNY349KqEYiREQRv3D6/gHk+Uc2E1rNz0z5yBY4yq7l2Mxn9oAcbSoAkIU
 q5Cg6lZnQEBFcOdM/YpjZpby0qTJpOzOHvW1ORnqYuAEjWE9DdE34K5yGvgBTiIe8syU
 4wZSxJXM0n1KzTfYISy8un32N1tPEmp/NtXrXpjbLl0GSL+RGxOXXBtsjFGaxPOgy/ZF
 3BuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/zpLUSyME2jOs3Du81+KpyRursOHq/mddcWqwi9PRONGj0sL+TBDZiGwo2+5vfX4BWrELSWQIgYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpKTo0xygeOJbGPcmw5VWQC0qf3WCsOV7/BYxaON5L8Sa6JJfG
 Ekq97puLRQj6pbLgLXLEt1R5qwqwYxB0SrLQIBvOo/xAh3C7RYaB6aCZ/cEZbdX+lZNAvAFZFRO
 PGSshYO4ufWgtforM3EhQ8i6S3XQ=
X-Google-Smtp-Source: AGHT+IGwBKKGWJh9wIKK61DdnRwd23qorQxP1cJCpH4kAY5YZpY1WQqWwNfbOqxU7M8iB6BuEvF3r+xT5muishtD3hk=
X-Received: by 2002:a05:6358:7e8c:b0:19f:4967:4e8f with SMTP id
 e5c5f4694b2df-1bb23dd5df8mr730499455d.22.1726756109157; Thu, 19 Sep 2024
 07:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-15-2d2efd5c5877@gmail.com>
 <35liocltjuxv3gjueuvpaytx44crebbc4c63atztakuq5dfpax@bquve7tkrvtx>
In-Reply-To: <35liocltjuxv3gjueuvpaytx44crebbc4c63atztakuq5dfpax@bquve7tkrvtx>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 19 Sep 2024 17:28:17 +0300
Message-ID: <CABTCjFCNuMKTeF8YyqCHGQ2CCQ76C1djL_3rja7itLfBM5vogQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/27] regulator: add s2dos05 regulator support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
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

> > diff --git a/include/linux/regulator/s2dos05.h b/include/linux/regulator/s2dos05.h
> > new file mode 100644
> > index 000000000000..2e89fcbce769
> > --- /dev/null
> > +++ b/include/linux/regulator/s2dos05.h
> > @@ -0,0 +1,73 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
>
> Are you sure that here (and other places) you want any newer GPL? This
> is quite odd. Does original code (from which you took 2016 copyrights)
> have this as well?
>
Original code permits redistribution under 2+ license [1].
Is 2+ preferable over 2 only?

[1]: https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/android-8.0/include/linux/regulator/s2dos05.h#L9
