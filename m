Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D038C484A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 22:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA0A10E970;
	Mon, 13 May 2024 20:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XdCSNthx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D8210E970
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 20:36:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcc71031680so5088085276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715632586; x=1716237386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SA4bW/xLJg6YuBcd2QES1hRhoe/jYuqsZNcpNb5KJNY=;
 b=XdCSNthx8FCL9P0aBTAdUU2iXNuWKTY2khaQIjb8wP60kEjhOGZZ3NLn61HpoSRHvV
 LhyxWcnXC5U5pQr3xwGW6k2FJaCRhYlCi3BGcIdK49JE0qFCW5kQ7ricJMKm4tgM0D2c
 P8QcwSWhoIxUKUnZg7f5BetMNYDPN5Sv/zcy3Jf32vwrlDE7vXka/rYA5oAskxJquXwS
 3W6NWiVcJ55jxkMqpXrohqjuEej+58fvwO1hH2xRClWjnrilCxZik9PA7yCo2CzVYc7w
 iOGXDDhDP+KoBZVfobfhvxWAFaR9kWlx1F2AiYunb9GkGTLkaErcCZfLoPEg6zdoVoq6
 LDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715632586; x=1716237386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SA4bW/xLJg6YuBcd2QES1hRhoe/jYuqsZNcpNb5KJNY=;
 b=LKC6U3PO7NemeMZ0BvKbAD7JrR6JMx0UKyr3kuX7NuMJxJEnLteETU+N7YMY+bcto0
 O4FVtTrWh7S5HaW3I0oFZwmifEX8wkNvCqNN+lss0ER2+eDZEU7QiIdjCI6fTU/6C389
 SM3Z2g8E84kbjiDd6CoHOeXiWlVWaseMrgd2tEQCLOB+/1nR1CuP5w57ziqlNVFFLv5K
 zQWW7PrEHEZWzPdQ3+b9uoUIUyIT3XAUmHzQ5EDg00A8yUU3iLQ4vXVgBt9SGU6tEbGK
 gwKB4EXON/ejn11c6MXTPHJJgog8XNaJRGJy6WU1bgHJMfZv/V2rrUJALmo7JWUmdzHE
 ZuSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyxnauSIQBqmmA+n5S8TJAHI7Gi4rvCywHr8bGJKVUHViGtQtRbmwnbZ3Hs6d+hEO6jKALwH4QGj5ZpcxTqT0eIT/GQcXjujvDmNlxzbbA
X-Gm-Message-State: AOJu0Yw60se8xWNPNSSNOLvHketSjmOGGwz5yj0uoNA+L/Vr9HsKCBFz
 Iy79HoBsrNbuv4j3hPmtyo140GCGpLQ89hngWVDIwzLDWRFIArVh7ISq02XXGrUzX+/4NwC6jhF
 kyZCUVibOmj/m+5KtQHxZ8vUl++pYHDpq1GrfFw==
X-Google-Smtp-Source: AGHT+IGLloi3lhRWV20W7xA9r5SsU5g+2Owk/UejzB1t2DecP+EHOQs1IPoWLpxgX7GwAk9KqeJ7Ka+d0dhqsAlSfWU=
X-Received: by 2002:a25:bc3:0:b0:dcc:8f97:9744 with SMTP id
 3f1490d57ef6-dee4f3a9f25mr9748339276.43.1715632585931; Mon, 13 May 2024
 13:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240509-dt-bindings-dsi-panel-reg-v1-2-8b2443705be0@linaro.org>
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-2-8b2443705be0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:36:15 +0200
Message-ID: <CACRpkdaeXcy4uYTD1Ub-BRG9RCDKaY0wCbe4xoUpLwZWuy+KuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: constrain 'reg' in SPI
 panels
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, May 9, 2024 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> SPI-attached devices could have more than one chip-select, thus their
> bindings are supposed to constrain the 'reg' property to match hardware.
> Add missing 'reg' constrain for SPI-attached display panels.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
