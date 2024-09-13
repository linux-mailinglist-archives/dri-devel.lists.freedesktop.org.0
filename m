Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391EA9782ED
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BB410E274;
	Fri, 13 Sep 2024 14:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H/PtmWC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CE010E274
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:52:08 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-846cc83c3c4so296593241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726239127; x=1726843927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SC7Qi9CJ/UlqMx5HJFGorczxcYiMNzmkMF/PjtSiNQc=;
 b=H/PtmWC7RJtg6THRl2dqZgUnHc7lPKeo+3m+SQCVkqlNyl5EIgXFZXa8YcEyNjo66X
 IxAosWUHQZhYD5z6WYFN0Pz9oaWXmIOgmCTqf3XC2tb7Wf80/+X67zq2uo2k5VKUr82i
 /3vRrv0bPn2LG14KMxeanofCqkZiRfkUhCHYGaJUUqGJNE4iXEk9NSsG5fx0rFkJFgvw
 nUsxrgHXH+KzB1d8u3i2t0FkoSMHp1igzIhvAcTncTAEtALsO9wnE3uVMFRaoubVXKy9
 tkYVbPYEHzFKdLgtwpm+8/sPVU988vdqAUhLQWfEcUu3WsU+aYgNk1e5fFscX7uswh0q
 Mupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726239127; x=1726843927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SC7Qi9CJ/UlqMx5HJFGorczxcYiMNzmkMF/PjtSiNQc=;
 b=fUUCVRsr6bqmgXWZ8MRM0LK0fGZ936Lb9R84wPHA8aFvgEPfcEjsljX8elaqVz4ram
 Tx1QK0eESfZnlKSG0rn6+oA36kbWS2YZT07zubgZ7sIro7AJ1OEUlUhmltXvimp5hOL/
 3GaHGdxV0JmVnwR4q80+qYj7p9uGp7wzN/XKvsN1p6g+mFdaox4SCgMJ8vemhUCgvHYh
 ujtE14SEyUyy9d3ryyPB1MF6KgkvhzxxmWYCKKtwbFS0wvRGimfMjBdyRI41B1b7cEZ6
 wy8f/N6tw31+PJHHfDbN9UIE999/NbLtHpntK7ZI3sWMIjxTB6tp7oK8QNuDN2ShZZWK
 SlVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7xNIKbfs8zKg7eBusa0jdOJg8S7LRxTVG/q5It2JGISzk8vNqKboBaVfUN0Gxzo329y/T+nE2Wx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu5FMbULnDV1/7v92BP0IqFo2FkvZHY/ztTIDvtS8qbXYrHbN6
 g1lKVDqwbiNF+elcrzHoMdRHtaBsO0Eqi4rFIvKnpyGj90Ye29VLZ3LGE9/pyILyCjVyHT+oNd4
 sHUNfKH5OcrSHU4IWMvc7lhmm2v4=
X-Google-Smtp-Source: AGHT+IFzt77B+UQvTyXWnWYICtP+/AmJJ5rq6JqNXDt5n+hgGmGESoN8kaR8YY1ZG0wjobVeQOsHMwrHDFFr4Mg31HU=
X-Received: by 2002:a05:6102:e14:b0:49c:1bc:1eff with SMTP id
 ada2fe7eead31-49d4f6fafc6mr2074878137.28.1726239127329; Fri, 13 Sep 2024
 07:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-4-e3f6662017ac@gmail.com>
 <13a650f4-7ca7-4c95-b536-9814a22f00ff@kernel.org>
In-Reply-To: <13a650f4-7ca7-4c95-b536-9814a22f00ff@kernel.org>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 17:51:56 +0300
Message-ID: <CABTCjFCOTd5V5WyRbD1OCS9Hatk0mOCtNy5WWfp0KkUBgqXs+A@mail.gmail.com>
Subject: Re: [PATCH v3 04/23] dt-bindings: mfd: add maxim,max77705
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D1=87=D1=82, 20 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 18:46, Krz=
ysztof Kozlowski <krzk@kernel.org>:
>
> On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> > maxim,max77705 is MAX77705 pmic binding part
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/maxim,max77705.yaml    | 112 +++++++++++++=
++++++++
>
> Your patch order is totally messed. Not tested by automation. Only
> limited review follows.
>
Hmm, not sure what was wrong. I sent version 4 to myself with `b4 send
--reflect`, the order looks good.

--=20

Best regards,
Dzmitry
