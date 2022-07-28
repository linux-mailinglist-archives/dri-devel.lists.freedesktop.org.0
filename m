Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643B5836A4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AAF10E153;
	Thu, 28 Jul 2022 02:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4610E153
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 02:04:28 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t22so873372lfg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSfuGobo36quNHWVipU/P1j+8s0MOGIFxkTWPlVuisg=;
 b=kVrA+CxmAhYaAyt2XbjfpNQhbXEJDxTm344h3jdITmfQZaozQia1vNlq+KfhEG+CIm
 wxOXiUA3JXNFPuo7JR0uZ5YRALUrbcHzv/QadH29YU/CsUVGZ9XnwlRhLlEuV0plA2Ub
 FuIg/vlgE8kr1x7nxK8F0DVb6o9dBkTyVSSSlGWB5FBhapYTH2zQKwUN99AhXS00GyK0
 s4tcQuN0qhnb2JKD6onV66e0vMMDZGx7TciEDAUjVoHJwrSNsiAqntM1sapEQ+jJJg1R
 I9FsiP5C/a4CvmC0LfQrnCN8733lP0Nc0Q2RwhUFmxCNg+It2wnqPwoLiBVycel7RMBB
 t4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSfuGobo36quNHWVipU/P1j+8s0MOGIFxkTWPlVuisg=;
 b=I6xfuxRqzvAEiUidZslt6Cm6wyiaivqYNQanu+F9f940vQVVNGQEF+BYwgoNdHsQiE
 JUj/B01tL2+6foVNLM0l6jglc8kJucAYKFPuEH41/Nj492ct5P0a8uvnnTyotJIM0cRO
 jXjdyoL6I9Sxqif5/fs0NOOEX7llVE4js0flxhBE2yGX9KW8SOFyHNZavVxlvBKPjuYz
 FjNbqMQ+PJ5lX00Da9Mcj196oQOrx6lNnsHYxA7rfU+dGsM7IYGJ8NqXtyXlV7jVeOu+
 BaIHDrky+7nyRm7xQg+LENTBdLM/A/ZLaTRik5nxvrilOC9FoKUM+h15UvMxtbG8c2d+
 4EMw==
X-Gm-Message-State: AJIora+H7DQhXk6V+qoiH8Y5Tk3vST8Ny7NiEBuymDKyM6wQCpRvzJa5
 pvcGuyr+gNNqbfc/Y6e68pgTQXcGBQsLATCGbUY=
X-Google-Smtp-Source: AGRyM1sXsKkEuQYa2xUqWXJTZ0dYadBV58iuh9/OXFdD7dfr5MGre6hSXIeMyedKRD6ZDi647biJttfPLhS5srGsn50=
X-Received: by 2002:ac2:5550:0:b0:48a:b15f:223f with SMTP id
 l16-20020ac25550000000b0048ab15f223fmr2435705lfk.181.1658973865994; Wed, 27
 Jul 2022 19:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220726101513.66988-1-mollysophia379@gmail.com>
 <20220726101513.66988-2-mollysophia379@gmail.com>
 <809e9c7d-7634-f690-675d-9eccac8c8de8@linaro.org>
In-Reply-To: <809e9c7d-7634-f690-675d-9eccac8c8de8@linaro.org>
From: Molly Sophia <mollysophia379@gmail.com>
Date: Thu, 28 Jul 2022 10:04:14 +0800
Message-ID: <CAK0UmJBkMBfGN8q-ap-zWAJWeD9-WsXErMWPtpvcDmNWiHSSvQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks! I'll handle that and send the new patches later.

Best regards,
Molly

On Wed, Jul 27, 2022 at 6:24 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/07/2022 12:15, Molly Sophia wrote:
> > Add documentation for "novatek,nt35596s" panel.
> >
> > Changes in v3:
> > - Embed the documentation into existing one (novatek,nt36672a).
> >
> > Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> > ---
> >  .../display/panel/novatek,nt36672a.yaml       | 20 ++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> > index 563766d283f6..560fb66d0e5a 100644
> > --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> > @@ -20,14 +20,20 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - tianma,fhd-video
> > -      - const: novatek,nt36672a
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - tianma,fhd-video
> > +          - const: novatek,nt36672a
> > +
> > +      - items:
> > +          - enum:
> > +              - jdi,fhd-nt35596s
> > +          - const: novatek,nt35596s
>
> This entire entry should be rather before nt36672a judging by numbers:
>
> +    oneOf:
> +      - items:
> +          - enum:
> +              - jdi,fhd-nt35596s
> +          - const: novatek,nt35596s
> +
> +      - items:
> +          - enum:
> +              - tianma,fhd-video
> +          - const: novatek,nt36672a
>
>
> Best regards,
> Krzysztof
