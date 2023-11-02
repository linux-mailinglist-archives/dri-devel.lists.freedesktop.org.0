Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6C7DF2D0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C91410E878;
	Thu,  2 Nov 2023 12:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE8810E871
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:51:15 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59e88a28b98so8057837b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698929475; x=1699534275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pU8l6Ru1lmyLGco+UhPIPJQZlA30Z+Oa9JgbnH5Dks=;
 b=BBDAnhnyORaI/3lSGdQkVbuMuyo609QggcCqPletzFU7iIXC1uy58gga62voo+bYOi
 jIZt6WXJFctojAJCD6siqVSsnerAf01Da9qBmm/3wKo2rpJqUm4zfey3QbqkJbKbpBd9
 Ykn0kHke9H56le26Xe+hdjL9rCGdLcLY24kiu00tyfh0cMfmT4LU9VB+Wcr1Og8Xf0Go
 Z/VNKN2F2/ZcnAjRWWJV10j3XJJdmjo7N+0wBNUTnB4fAvsfDpSbWtnvIIdIK6ti4vWA
 yMmXwbac0nnuikHSQFUQ46UyTP8SVy0Jb59hQCuzCumIZVPu13nc9+NZ0y2Aki9jBduZ
 1eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698929475; x=1699534275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pU8l6Ru1lmyLGco+UhPIPJQZlA30Z+Oa9JgbnH5Dks=;
 b=U/eL0/c/K88oSP9Sm96TD6EVIogkEXF5yhZjI4pAabjRBy0WVWysCYodpue90Jem1Y
 XnVdpoKJyZtM2AspIWpmNcebNSty9NkbZuSc96hJM10V+8scG+yjTdIjpWnAzIJwMqnx
 WJNSJGACpFEzra5gf4wqguDK0oQlKnYwZccpFBlmAC0zKKb2sPp0B9HZV1FMCB1GfA3A
 ZBHTLhItNGypotLXssq+/GaHiF1a5i0ieGOAdfszkOG1mn/y6RA4P2CaKeH6qZp6eO55
 j7xv+51yy0xpXn052IZm3g4NsanDZMTdQVJdNeUrpQkdXSZy8/yFB1r07X3AUQzEPJkj
 6Gjg==
X-Gm-Message-State: AOJu0Yx70qIEgphI9LIc1MikEqe6HUhtV3fC/pTelbxUiDbw7cN2sXv4
 D8/ifKgzWrbEolm0xGO2YwAoZ40QM+iV2LXnYeLVOg==
X-Google-Smtp-Source: AGHT+IGRkYgLvFHHFjBhSWduql5eL+9bAHhVMQTgHxjzn6sHcDECaO2Lh/+qYRAoq7rT1SgPFNKls6mPJcZrLdU2ueU=
X-Received: by 2002:a81:ac64:0:b0:5af:97b6:9def with SMTP id
 z36-20020a81ac64000000b005af97b69defmr4708633ywj.24.1698929474829; Thu, 02
 Nov 2023 05:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231030072337.2341539-2-contact@jookia.org>
 <20231030072337.2341539-3-contact@jookia.org>
In-Reply-To: <20231030072337.2341539-3-contact@jookia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Nov 2023 13:51:03 +0100
Message-ID: <CACRpkdbm5KYj8KWNQJ20jq7XLbW-_ykX1_t=kse9-otB1FSPSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/7] drm/panel: nv3052c: Document known register
 names
To: John Watts <contact@jookia.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 8:24=E2=80=AFAM John Watts <contact@jookia.org> wro=
te:

> Many of these registers have a known name in the public datasheet.
> Document them as comments for reference.
>
> Signed-off-by: John Watts <contact@jookia.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

This makes things better so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
