Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947DBD933D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A9510E5D2;
	Tue, 14 Oct 2025 12:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZRDw6qKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812710E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:03:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-579d7104c37so6346301e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760443425; x=1761048225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
 b=ZRDw6qKK7C7VlwC9Q7TTYfRy7BX0BDtzTxB6abVpBf4QSp8jg3y2WFdeSmc9YF/5cX
 SGnrC4Zms9dRWHsmSvlmDkqsedimYjEW9JZv+HaWt0D/FvChMfe9lKCbvmf4jiX1TeuQ
 2uMNte1kszNfmx8Y5TDfEmmRRDsxkdshV31CmBclCXiYO93ePnWWYI76n2+PXuNE24gO
 7jBCUvjvAtDzJ5I9R292TpmnkBedYBfufysJiFOMQ5/9ZbeZpHFo/sZiHhwnXKuOv9eg
 9djXneGjOhClf3BK2yhzH1Vy4QZIE0fyDtdyw56Dqht6m8GGVZQngf/ltbwwQWDF83YK
 gwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760443425; x=1761048225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
 b=hnA/jC+6ODPjypNLCGlreiMyVpEngESjr4FaXRNUmh7A42YjFxoM7McAdoCA7Gj4YQ
 oaJGjykL6yJAHbfHplrT4x+tySAvzMY73jtNqr/gzDtwSAjt8/bVzbrAA9SYPgaRC3jY
 d4TZdXlI7sVFctPOCyrN5LRS6XJq78gD8PUP9hTSafnV70WoPCsFvMNNqjlB9s1Vjo4n
 OV3KqMrrvx7/PpSy0sWcPSI1BV4wfTB2aWipM+o1TdUkEdu1yQ1DO42U9/rkSjVOtj6r
 3PKnhz2gZLlQ473iKgGqjx2vmvlrCNW2uE31fu/nAsyPA7ovlwjFdI33ljhmLZX3qm9W
 DXIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbBao0AdW/A7xflpg06A0aepd8UXKPPHjK9gw/Bu6/81QG0Y1jlb0dLnyG7LdJrvhkO9XHRtpmdEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzopZ5wUbJTxs9DhzuK91CXfYC9LheWqbZPU5B6qgVWCgk7pZ/C
 G1N/UtEVmfCU1P4VjgtH2wp0vXy2dsbi73aGs/1vvz6gt52fuPsyUwz2PtobuHO+DwHGqJAAkh8
 j+q1GTIfVABtbS/WwWEfwiBJBsU//VxC9Fwu+Y2sW3g==
X-Gm-Gg: ASbGncuAK90Zy/Vad4304q7FVmQJIrNx6DkiXSQ4ecjHpQ0BLy0Ll+sSsBwNDm5OcGe
 XiaUO320JuhpO211FodpsL+hoCUEQswKW9zOVYJgzfgGWnMXSs/wMkqultNsi420NyWrR78w4nB
 +mnYPOr2hgNSId/SdrZ1se+qfQj+ZDMlEY7nXA3Z/Wnbz3yxpcmcbQPBr2/DiAHL6e64f+Prgp6
 ZwZqmlP+aS+wajqM/9X0kASG8kZ0lv2hm51BbgC
X-Google-Smtp-Source: AGHT+IFD0BB7RH2Ep9aDetjvf52TraFr1nZFUAFZVtaRLq2brbGFG6VPJ0RQdb2vqcIUZBE6o0FGikD6X+TXoiS5UhI=
X-Received: by 2002:a05:6512:3d10:b0:58b:26:11da with SMTP id
 2adb3069b0e04-5906d8ef684mr6189769e87.29.1760443425099; Tue, 14 Oct 2025
 05:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:03:32 +0200
X-Gm-Features: AS18NWCj_bKF0VIZCo40xgE2nZcym7DwrLVXQ08YjlTg5hV9lzx6rx-fa2x4Vss
Message-ID: <CACRpkdb74fh_eFCd0MM4RK1_KtNRugLPp2yMA20FrpHq+-o6YA@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch 1/24 applied to the pinctrl tree!

Yours,
Linus Walleij
