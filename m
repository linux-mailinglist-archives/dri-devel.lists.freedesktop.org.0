Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117106E07B7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09E10EA41;
	Thu, 13 Apr 2023 07:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E99810EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:29:47 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id i20so18071555ybg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681370986; x=1683962986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qog+LiocKiPKdyAnYQ2BSo/zSvKs7npCbBpUanq/IZw=;
 b=iuuIA6m3bCmAllwm3XftWpajWOqZNHJEPSWlBfJ2sdPCtXWI7gtpe2zXumSUbZlBld
 6LkiVg2kEhTa0KuwsU8SRy61aG5/to+Zt2Z5HoFbldLevHp+sBYVawKtnp0zkRY6n3mL
 R7sL0pBm932ajvo+YaXQXXM8o/Q/O8l6feLaYvTAUB0BGdX9g0bzevToV1EnM7aj+oRl
 DD0plKoDbdZE5XUFwS0VuARCXWv/M4012lv6BgzNJ5KKQ1eAApGJ8mqXjqL+/ASih/4L
 5EkkogghhrnRGGP+OY0G6jNYEbwQYXcgPgHuFt7Qcv+MZP2c3gip4NBloydJ64CLRSkV
 mgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681370986; x=1683962986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qog+LiocKiPKdyAnYQ2BSo/zSvKs7npCbBpUanq/IZw=;
 b=ft2zR/eAs643PtuZ4CctEQ+W/2Y7gLGeZ6FxNM3/qUuMaVDCihpc5ZzGDlqbydpEL2
 3qXA335nhaEGIkm0uQhXYIdoQ22WgD7UfmdlSABBUqVe8HDahU5sH4DatX2GWYYg42YN
 8ZbTA4AfANvVbnSR6H1qao7cDTg7dJ0I0eeL1RhWOiO+e5Iz8NqyT9EAU0eRlaIbE6gJ
 aBLlunkGKbpPMobMqP1Kdf8WjnINrHlgBYhhGWyvhmFhtISib/eNvLfN3ECPh3cuWq5+
 cKmxPBVCnqyWooLiFnK7KUCZ5exAO+l243SnA+Znc7V6S0D6sUP9RnimQNr0m8vm3o2C
 LnpQ==
X-Gm-Message-State: AAQBX9fpNohJmVpVhtrf9Gk+ATHfULLUwCKa7UAmXB/DiK6n27J9129B
 Wn4xgzLNTsnfbooAEJ1OxgOOq4utlwLSOsBfc3O7wKFssAHtF+mr
X-Google-Smtp-Source: AKy350brsOjzRiYbs7W8IQbvcWfHiyVMKQm5KPMw0UnDGLQucS24yLdTwAtQAnuWJQKvu2CFaoKj0I2bMm1G2ObmRzo=
X-Received: by 2002:a25:cfce:0:b0:b75:8ac3:d5da with SMTP id
 f197-20020a25cfce000000b00b758ac3d5damr684123ybg.4.1681370986751; Thu, 13 Apr
 2023 00:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
 <20230412-topic-lenovopanel-v1-3-00b25df46824@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v1-3-00b25df46824@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Apr 2023 09:29:35 +0200
Message-ID: <CACRpkdZXAw4ZYTRhO1xnZ+ycaC2OPQqAUHfNm34MaQygM5sQQA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: nt36523: Add DCS backlight support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 9:46=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:

> This chip supports controlling the backlight via DCS commands, on at
> least some panels. Add support for doing so.
>
> Note this may only concern the NT36523*W* variant. Nobody knows, really,
> there's no docs.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
