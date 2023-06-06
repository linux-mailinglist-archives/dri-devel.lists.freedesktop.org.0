Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BA723E69
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0134C10E31A;
	Tue,  6 Jun 2023 09:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F9810E31A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 09:53:32 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6af81142b6dso5428702a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686045211; x=1688637211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lOpu32PhwAH+y2CsyaGvCkA26cD8OM8Rml/LSqtjsoE=;
 b=fP3Ilf16oLu5WijsBUtNq4TB3B9goiU87PJ+PeiN9EzUpEA30yMjEWtf4JF7RbtUhP
 bz3769Jc7xiKO3Nu7COn48wLaoBCzZV9b1AeSDEsWM6JBdjfhVlRg0NAxVr+znHVLsOy
 D1nyszBQg88zFIW/grMMkhzOuHs/1bkmxgOoZaYfWjj3E+aA1eKnp6FXADZge2jPbhXO
 lfwpXQKuy9lahyUCDguHDjqnv4BzzwkzUgTUX7/M95Ojm/uFWhPGAv4cJvmIihUzVCVx
 4E52DrDa1+BeINt01k3wdl2F32J7iFOMcIi9dcYeXYCZuFnmW4UAD16v3RKBi8zCw2sz
 C7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686045211; x=1688637211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lOpu32PhwAH+y2CsyaGvCkA26cD8OM8Rml/LSqtjsoE=;
 b=Fhqb1+wrxo87rHklMAE3Csv0ZSyRmvRt+XOH0NuX3Gd+px4l8VysoeExovB4OS0e2o
 FO61Btflj0IirrwxJaqSglbRCGOkaNSt0vmaB3Szar+OYSCv2E4H59Pytmq02wiixb+j
 oGxJuMIeiamUPe12aGNJqZFpULvpCEGsTfsSIxWCbhS8X2PLGV8yW4kXucwBjVpebaTj
 jfwMqBPwIK64VvNu/2oKZZZdYKuRPYpB28f05iRhi8WwIeUONPyLaYbJh8MBtLgVZyDm
 lkT/hJDFgdaenvoer7BXid/LyZRdV7U/jcVOWiQsm4iS+fq4TNA9Ec69+LgpLUNW953U
 egNw==
X-Gm-Message-State: AC+VfDzMrGZeDA9XxQK2bsmQgyM6dCd+qRwfCrBMoH28xN3q4HpaOm6k
 efddIuf8+XKQcPIsZGGg4/QTcp1UIr1LC/T5MOY=
X-Google-Smtp-Source: ACHHUZ6fJ+lm5zUsJk5S2R0UpmRMZl7c/I44n44LLk5rtB9JXQgf91+EjrQY12voSkxdgWm9stQ4SMDSrEq6J6aCBto=
X-Received: by 2002:a05:6358:bb8f:b0:129:8c5e:84c1 with SMTP id
 df15-20020a056358bb8f00b001298c5e84c1mr2067090rwb.32.1686045211341; Tue, 06
 Jun 2023 02:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-3-pavacic.p@gmail.com>
 <7255ff65-9dac-3cce-fb74-09a8984775f2@linaro.org>
In-Reply-To: <7255ff65-9dac-3cce-fb74-09a8984775f2@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Tue, 6 Jun 2023 11:53:20 +0200
Message-ID: <CAO9szn2WbTqCmj=eSZ_GzYP9anBoBkv7ESD_Jga-EBEqr1rxoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add fannal,c3004
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

uto, 6. lip 2023. u 09:10 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisao je:
>
> On 05/06/2023 17:35, Paulo Pavacic wrote:
> > Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> > Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> > DCS initialization sequences with certain delays between certain
> > commands.
>
>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel@0 {
> > +            compatible = "fannal,c3004";
> > +            reg = <0>;
> > +            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
> > +            pinctrl-names = "default";
> > +            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> > +            vdd-supply = <&reg1>;
> > +            vddio-supply = <&reg2>;
> > +            width-mm = <93>;
> > +            height-mm = <56>;
> > +            panel-timing {
> > +                clock-frequency = <27000000>;
> > +                hactive = <480>;
> > +                vactive = <800>;
> > +                hfront-porch = <30>;
> > +                hback-porch = <30>;
> > +                hsync-len = <8>;
> > +                vback-porch = <30>;
> > +                vfront-porch = <30>;
> > +                vsync-len = <8>;
> > +            };
> > +        };
> > +    };
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5c22c828ab46..62374c8424b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6427,6 +6427,12 @@ T:     git git://anongit.freedesktop.org/drm/drm-misc
> >  F:   Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
> >  F:   drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> >
> > +DRM DRIVER FOR FANNAL C3004373132019A
> > +M:   Paulo Pavacic <pavacic.p@gmail.com>
> > +S:   Maintained
> > +C:   matrix:r/mipi-dsi-bringup:matrix.org
>
> I don't think we have chat channels for individual, small drivers. Add a
> channel for entire subsystem.
Okay I will add matrix:r/linux-drm:matrix.org
>
> Best regards,
> Krzysztof
>

Best regards,
Paulo
