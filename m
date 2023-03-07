Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57D6AF83D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D904810E2E5;
	Tue,  7 Mar 2023 22:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B984B10E2A0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:08:35 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id i6so12896198ybu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678226915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5B0MmPME28SdP1PdSjzrjlZM3Hm3np7uTNu3SS6fZI=;
 b=YIQZikOs96Wd+1xgLw8hFORV8tgf2wAGM7MW+UM+MQFiF7HRCNbSmDeZ/7saBZu2Zf
 hzm0+fL26o0ene4Qm+0QNOSCHAwMZML33t96CvykWIlYYNinDO20yM+9tfX6Pw8T9NPW
 LL6kW+LpZWftlZLXX3AT/zH7sAn5AiBPGOjY148PtYom1qu8T4CCmNZM2phbidJEeoFL
 cpiZ/vb/kb34+j58omNq87Hr/nsUsqQfrPa530SiV+KBphCggwIF636dMbVxW/dr4LPb
 QjR5Qj8ZF20Rhn0vGWfdGeo5RnNhhJrmeCCzFpEsP8VaIBRVIjVg5YS+i9x5wzXvky6/
 4iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678226915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5B0MmPME28SdP1PdSjzrjlZM3Hm3np7uTNu3SS6fZI=;
 b=KwgDDC7WZACiWUD2PtrTsZOWjVrz30QEmiYauuPIo2cBOOSMDb5UEVjA4vSyUQzPBE
 pPy1okV9zciOUl6GtI6bJbF+n7eQuJKoEi/ldUTJdi1+nLmwNENGDomoZWp1Wrc7a6bc
 JxPiIulsd9QICr5o1fbZBzeDCkp0IptC+FTrGh5W7T/NHEH09l1eGiUWkPegnsz5vEWQ
 4waUI0esTGv4YCW6c5ELw4mtbcSjUecWb0/3jueEyFW39gMNVz29tMcmOJHO+cXC8/jp
 nmIWy5+2dYC3v1QFd0qeclV+5J1PixKPV9inOwqLdXy7q9Xgj7mjL1ATgiZoerln/1uu
 vZqw==
X-Gm-Message-State: AO0yUKUSJomfD4f0rOFNynRXXHi46fxZ046Wi0LBhY3LEEpAPxAv5cen
 uFn7OS7cWrP2PVjsutjY6hq/YtabgTCz0W4pYYQUjA==
X-Google-Smtp-Source: AK7set/hdo6UK9mqvdv+ZB8TkXJyJW5Wn2J2KXdw2ntKBxmHkPpUGjET39Z+tHZ7rBU8S2+bIu/pdJyQoqb6WygVF6Q=
X-Received: by 2002:a5b:38a:0:b0:ac9:cb97:bd0e with SMTP id
 k10-20020a5b038a000000b00ac9cb97bd0emr7568099ybp.5.1678226914852; Tue, 07 Mar
 2023 14:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
 <20230217-topic-lenovo-panel-v2-1-2e2c64729330@linaro.org>
In-Reply-To: <20230217-topic-lenovo-panel-v2-1-2e2c64729330@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 23:08:23 +0100
Message-ID: <CACRpkda7=Y4ZRBDOhxE974qV-yXuFyZZs7m_aBwtF9qivV5WQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display/panel: Add Lenovo NT36523W
 BOE panel
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 2:26=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:

> Add bindings for the 2000x1200px IPS panel found on Lenovo Tab P11/
> XiaoXin Pad devices.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

(...)
> +$id: http://devicetree.org/schemas/display/panel/lenovo,nt36523w-boe-j60=
6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NT36523W BOE panel found on Lenovo J606 devices

It's a Novatek NT36523 display controller-based device isn't it?

I would reflect that in the title or at least the description.

> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lenovo,nt36523w-boe-j606
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  vddio-supply: true
> +  reset-gpios: true
> +  rotation: true
> +  port: true

This is clearly (as can be seen from the magic in the driver) a
Novatek NT36523 display controller, just configured differently.
https://lore.kernel.org/lkml/20230220121258.10727-1-lujianhua000@gmail.com/=
T/

Why can't you just modify the existing nt36523 binding from
Jianhua Lu by e.g. making these two non-required:

 - vddpos-supply
 - vddneg-supply

It would not be helpful for driver writers to have two different bindings
for similar hardware hand having to write code to handle different
properties depending on which binding is used, so please unify into
one binding by cooperating with Jianhua.

Would it help if we merged Jianhua's binding so you can build on top?

Yours,
Linus Walleij
