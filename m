Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE01825999
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB1210E62E;
	Fri,  5 Jan 2024 18:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10510E62E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:02:29 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5eefd0da5c0so18391447b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 10:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704477748; x=1705082548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3KinRLo165j61fa4NsbUi17jBU/PExxRI33z/4AFbs=;
 b=w7IeVQdPoQ20ShtX9s3t16TmRJVFlGTi/ItGOWLGrDQhuxkOLcJYp+ISbVgfGLleXI
 UMVZNV2IAy1eO9Jvp205RjZmHkBTyE+KwR1gmlY+VTKlUa2Okim29Sdkj9t2V7dwn08r
 cjElbWDpC5PJ2ztQH7AOpzDoUdeiXQPiJERl4QEXKuobAHyYv7k0BdaljqqUj6OO1TRR
 W4QcE1DthhUgE153BSIAmqqyq8Bx3QUYLyxQbiJAAc3lBiQzb5Ly5C4yYAgJ8tNuC6Gg
 TCvl/oSQsDkUjQD3aTTKvkQ0QS+s2UbJXH/PpNXrUGzXHU5TljMisYiEqaFvNHqjZNAt
 uxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477748; x=1705082548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3KinRLo165j61fa4NsbUi17jBU/PExxRI33z/4AFbs=;
 b=wBlN1V8isG0sQO5PqzkRPEemfty3bqt7p59NsT55+X8GkmdKnwaMhnDx6YHFL1wVpK
 MRi/0ilW1Z2JsX+5Om9ufLvQKSY1be8tnQ7YQaICU/MGIDwRqdw+z4IK7QaFOu4XCAZb
 yO21dYLTNYH6WiN+yraXTf8j0M0IzTvm+utS51uBTYQvx3/+hI2sdXFrds+rWweKxxWd
 gMwOgSjuPtweSHaAi1l4aAlJCZUDzMkysoj33lwH4X+2pSWKjGWryNm/89JjCHVq0tm3
 844x5vyQI7vAb+rmKGsZ1nj3LivomFw6/NPRFKGXDPrCdfctTeC+vNMo3Z34BXSHIO8t
 tBTQ==
X-Gm-Message-State: AOJu0YwHsOhU2M9GaaEX+vyxiFSbRd5sxQ4RRbbuOTpSGsx+MnPabkRW
 4qSYnpxU/jJlaFUxENlaoROuibqDADjDGWWE4u6GZL6JlXNi7A==
X-Google-Smtp-Source: AGHT+IE2vBxHKyLGiNcmtNrg0CxcHLyYuO06CAWql2Vi8SPqJKnsxistIiKgFoDsYTIgSm/0y7GTNErYq8doY+/T6Pw=
X-Received: by 2002:a81:5fc6:0:b0:5d7:1940:b37b with SMTP id
 t189-20020a815fc6000000b005d71940b37bmr2624844ywb.71.1704477748240; Fri, 05
 Jan 2024 10:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240104084206.721824-6-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jan 2024 19:02:16 +0100
Message-ID: <CACRpkdZ5988n84Z+G8UccQDdwzj=+BXvUkEHomY1fgMrc6=OAA@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] dt-bindings: nt35510: add compatible for FRIDA
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
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 4, 2024 at 9:42=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
> Novatek NT35510-based panel family.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

v4 looks very nice, thanks!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
