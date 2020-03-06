Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8617B496
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 03:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA406EC52;
	Fri,  6 Mar 2020 02:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042006EC52
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 02:43:47 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t12so586310vso.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 18:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9J7QUZ3c6oiJJHOCislF9UdZETLylotw3HiKvwmAMXw=;
 b=E+5Hc2RoJaRGHZP8HBhUfdRXIeqRGN8m1mX+ZoYWKE5rFmO3rqVE3tD2ahZFs+pdHi
 /4HyvgWRRhRjVfxlEvKX9ZPO9o/jWmDyGVazqEkLQNal6+cTur8SCs2MkknKUJJlpzN5
 DZe43h++B4igVoAiSlhNUnAYvsmvti3qQYbV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9J7QUZ3c6oiJJHOCislF9UdZETLylotw3HiKvwmAMXw=;
 b=BgqWSZKrurrjPOGLpBFb8gqmK086AJKgzqa+DABuxroploWskS/hmb+mhWKM7DFIBd
 AzoM6SzexZQyf9lavOTOiihzzY1YEnTAn2YBDnBJWLmU39+9kSW9CrliIKSo1Gtv8dC1
 mj4HkWaZ226Eu93LWfus9a//AMPbldxdBPJLGzZAObdboQlwv/sU3fKdqFDcawiaEhGG
 4qZ1ObUiO1GOEOON2F+Yr8cxrT4ehG0ex4GixlMTmiYj5It7y/iD1LtCIP6y2mmToXK3
 U+AbK8+iXNtMVQwQvWzO0RaVb8jalfcOT/CgtzPYZq0RMtH+xAjCc+I3An+rE8BcccOK
 GI2A==
X-Gm-Message-State: ANhLgQ1fjJ85rs0HZBy+wai+36S1bDCpj3J7h9WQ7UQgVIP5u/+qJb0z
 Aow7uIkKaCtXnICdIsDOBKS1ZzMrKOsutMLpGxMa+Q==
X-Google-Smtp-Source: ADFU+vv6/yy6QpFMc26UByJ8foEiCd0tx3UtqsQqGWflBPyiIzZovmd5yFBvcuNwqosvDrUuX+XkrYPkCEaxbPFJbJY=
X-Received: by 2002:a67:d81b:: with SMTP id e27mr927920vsj.79.1583462626960;
 Thu, 05 Mar 2020 18:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org> <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
In-Reply-To: <1583462055.4947.6.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Mar 2020 10:43:35 +0800
Message-ID: <CANMq1KCi1ee87zz6cEWaB04=vEhkTdtW7C+UKW5EFn+1j6Cf3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Nick Fan <nick.fan@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 10:34 AM Nick Fan <nick.fan@mediatek.com> wrote:
>
> Sorry for my late reply.
> I have checked internally.
> The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> domain.
>
> If the naming too confusing, we can change this name to
> MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.

Thanks! I think I'll keep MT8183_POWER_DOMAIN_MFG_2D (that's fine if
that's the domain name you use internally in your HW design), but I'll
modify power-domain-names to core0/1/2 in the binding.

> Thanks
>
> Nick Fan
>
> On Wed, 2020-02-26 at 08:55 +0800, Nicolas Boichat wrote:
>
> > +Nick Fan +Sj Huang @ MTK
> >
> > On Wed, Feb 26, 2020 at 1:16 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Feb 07, 2020 at 01:26:21PM +0800, Nicolas Boichat wrote:
> > > > Define a compatible string for the Mali Bifrost GPU found in
> > > > Mediatek's MT8183 SoCs.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > > > ---
> > > >
> > > > v4:
> > > >  - Add power-domain-names description
> > > >    (kept Alyssa's reviewed-by as the change is minor)
> > > > v3:
> > > >  - No change
> > > >
> > > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > index 4ea6a8789699709..0d93b3981445977 100644
> > > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > > @@ -17,6 +17,7 @@ properties:
> > > >      items:
> > > >        - enum:
> > > >            - amlogic,meson-g12a-mali
> > > > +          - mediatek,mt8183-mali
> > > >            - realtek,rtd1619-mali
> > > >            - rockchip,px30-mali
> > > >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > > > @@ -62,6 +63,30 @@ allOf:
> > > >            minItems: 2
> > > >        required:
> > > >          - resets
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: mediatek,mt8183-mali
> > > > +    then:
> > > > +      properties:
> > > > +        sram-supply: true
> > > > +        power-domains:
> > > > +          description:
> > > > +            List of phandle and PM domain specifier as documented in
> > > > +            Documentation/devicetree/bindings/power/power_domain.txt
> > > > +          minItems: 3
> > > > +          maxItems: 3
> > > > +        power-domain-names:
> > > > +          items:
> > > > +            - const: core0
> > > > +            - const: core1
> > > > +            - const: 2d
> > >
> > > AFAIK, there's no '2d' block in bifrost GPUs. A power domain for each
> > > core group is correct though.
> >
> > Good question... Hopefully Nick/SJ@MTK can comment, the non-upstream DTS has:
> > gpu: mali@13040000 {
> > compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>;
> > ...
> > }
> >
> > gpu_core1: mali_gpu_core1 {
> > compatible = "mediatek,gpu_core1";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>;
> > };
> >
> > gpu_core2: mali_gpu_core2 {
> > compatible = "mediatek,gpu_core2";
> > power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> > };
> >
> > So I picked core0/core1/2d as names, but looking at this, it's likely
> > core2 is more appropriate (and MT8183_POWER_DOMAIN_MFG_2D might just
> > be a internal/legacy name, if there is no real 2d domain).
> >
> > Thanks.
> >
> > > Rob
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
