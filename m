Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F58200DC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 18:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A7810E14F;
	Fri, 29 Dec 2023 17:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466C10E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 17:34:36 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dbdd61d80a3so4667340276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 09:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703871275; x=1704476075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/bgoZanEJc0MVxJH2BDSMbBMEAKcJk5zfc5k6GcxfOA=;
 b=PDS0NoKzvBs1NySfLNVwL0kStvDYd9g25JTN6MllDGfttnh0qMsNrKDiF5dego5OIv
 sJLfZIahGNVp5LR0kf6ykiBu8eYxBI11Jqs8E1LFggudzx1iUq1H/DI+KpJzUgx0ROHi
 mYb2R3oNSXIVBOr5xjK7PXh9dtop1uKYZ2IP9pjwS2mohbFp+8catthsKy+mw3sJK9ZY
 zJdm1IFZRp2nAkcM/8WX5g2msSKc9So2H2JGUW1ccBZ/U+12/GExFdTbFrqqfRmw0jgC
 cd/jAvdiKk61cqeQaO1yspIDhzhl4JlHBu5BOYEme+807ipILGzn2fUonwVJdpSXfvch
 Ztmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703871275; x=1704476075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bgoZanEJc0MVxJH2BDSMbBMEAKcJk5zfc5k6GcxfOA=;
 b=mw43MiXE/4A05vwb9FUSQOAZuHjGV7oVJCdFwORFYvyzX9BjKM+3TiWBhgyZGKCmIk
 dlWL5wmHTTFbuqLEfptw8tYhC7jASwHqKbgasT3ybTN62vyEyJcufPEDOPneS4fZUplw
 6IEM0riHC+OJAMtQimVL5VSpKGBtgqvcmbKZdUHS651dNUN3YoxVX08ydbEQ5+kFD0f7
 pnp2XXsOnDp1tbsqqIk243uXBdR+BtRNFtscS526p8CgDdIkFCfTszwDToVDiGDlFpsP
 wTPKsJQwzYTakclvNJvOxpHV/B3zQM37U5kZoKZKkthjSnt/Kzrw7F6XzvQAqrGswDWv
 AYTg==
X-Gm-Message-State: AOJu0YxgMNmRxJTtg0WHg3XITEKU3EePjOzVpJS4vLSNR+u2peqJIJBM
 hj5XciqYWGZegdZFljcwnQQMyLhWvt2VSXFaxcPix1Y/czg8oA==
X-Google-Smtp-Source: AGHT+IFSKk3LElC23rghumLsGQN44wIVKMmgnZ+4F9zE0vmvJUX+M2f//YN6JsyIMAeHJLG0lr44MKU3n7AuX9e1S0k=
X-Received: by 2002:a05:6902:1782:b0:dbd:d003:3c16 with SMTP id
 ca2-20020a056902178200b00dbdd0033c16mr7305225ybb.9.1703871275630; Fri, 29 Dec
 2023 09:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Dec 2023 18:34:24 +0100
Message-ID: <CACRpkdbBBQ96qfdmNHrbOdV9hhFheyTwTkwATFZRPBRiRcN4tw@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

thanks for your patch!

On Fri, Dec 29, 2023 at 2:52=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
> Novatek NT35510-based panel family.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
(...)


> +    oneOf:
> +      items:
> +        - const: hydis,hva40wv1
> +        - const: novatek,nt35510
> +      items:
> +        - const: frida,frd400b25025
> +        - const: novatek,nt35510

You need a dash in from of each "items:" for that to work.

Yours,
Linus Walleij
