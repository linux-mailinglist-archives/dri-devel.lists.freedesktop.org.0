Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0D652262
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 15:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCE410E063;
	Tue, 20 Dec 2022 14:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8B10E063
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 14:22:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id co23so11897692wrb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sillzNbFUp3TlkNgn1hCOAKm/4oR+MbRzCGrhZwSouY=;
 b=jASlWc40SsDc3drNCcUHy28W2YALv8m94NbdhIvzcpPR/M4X6TOQxvtre8KTNzf5Eq
 ygmPttYzx0TqNd6bJnE9/Ch9npsG7awepY4WIncySR7WMpKSvCG8hLd/z8RyKk3ukzxy
 t15wQDWJaR9K06uiFjefnVY0a0Vfq111/vWSbQphBMeu2Jd8jUV5BnTMf8kXlFK+Bbuo
 PLZ6tuLWEfEq70f/nxJXl0U6/hq7VqTUzO+5TKX0OJW2jcCsCBGfhjOS4PeMnEG6qIH6
 1JYFf6YnIv8GR0xKFioZyA57Pu2oL3wT1cYKyE9tAlN5BzuxliYDNCrztn/klFs9Bnb8
 khiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sillzNbFUp3TlkNgn1hCOAKm/4oR+MbRzCGrhZwSouY=;
 b=FIA6bms4uGxV3fTQfnyjje8gKqSs6N/YFKvhy4sypFTyU0fkQ6a1FnSkCxzxFOO2Ap
 HGk3hT0nlfgHYd75m8ZpiN6FN+jR6yU39mk3O30+6dDLDwYOOKINV+H2GIm5n56ZxS9L
 C0Cp5C1cuOK1uKMPcgL3yUOEWmeyZ7fitulTyBAI+0s+2+n/elZ9Q+NIynAyDdJvPjoi
 8P937olqdPHpJx1omSOmlfLGR/DcUleBuU7K8aBMIHKYFJtowtxFvBRj0m0ozz15o9U0
 X/H+ZBuP2rj5Bad+pCLo0fuUinOibEwgIY0frpLMWj/l3L00nKuVjFhDz4SuzFoTIh+T
 bJSA==
X-Gm-Message-State: ANoB5plsohrgzEcNjZcgCb0hf7HX2zBBPZuhow0rIm/7fo/0rOxenB8E
 n68/omt1KVPuNtdjAlHgUIOamiW4zEg8JtApChg=
X-Google-Smtp-Source: AA0mqf4U0Wkm5WJo2V92RF7rzbAw584JVef5DGxOhRJt+iUgd5oA6ienwxxfKRDrQzYrYN3QZGlMgTe1iFa5O+O65uw=
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id
 h13-20020a5d504d000000b00242246c2f89mr25275828wrt.108.1671546139302; Tue, 20
 Dec 2022 06:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20221220120108.481554-1-cbranchereau@gmail.com>
 <20221220120108.481554-3-cbranchereau@gmail.com>
 <167154529027.200950.10451078081499230843.robh@kernel.org>
In-Reply-To: <167154529027.200950.10451078081499230843.robh@kernel.org>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Tue, 20 Dec 2022 15:22:08 +0100
Message-ID: <CAFsFa84Bxf4+Zc=px8GJyP8fP=BX5BtKFjwkus4X9gxHoBt6-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: display/panel: Add AUO A030JTN01
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000dbe1e805f0432907"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dbe1e805f0432907
Content-Type: text/plain; charset="UTF-8"

It's missing the spi node, will do v4 once panel driver is reviewed.

On Tue, Dec 20, 2022, 15:10 Rob Herring <robh@kernel.org> wrote:

>
> On Tue, 20 Dec 2022 13:01:08 +0100, Christophe Branchereau wrote:
> > From: Paul Cercueil <paul@crapouillou.net>
> >
> > Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> > 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> > interface.
> >
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/display/panel/auo,a030jtn01.yaml | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dts:22.11-21:
> Warning (reg_format): /example-0/panel@0:reg: property has invalid length
> (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb:
> panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was
> unexpected)
>         From schema:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
>
> doc reference errors (make refcheckdocs):
>
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221220120108.481554-3-cbranchereau@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.
>
>

--000000000000dbe1e805f0432907
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It&#39;s missing the spi node, will do v4 once panel driv=
er is reviewed.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 20, 2022, 15:10 Rob Herring &lt;<a href=3D"mail=
to:robh@kernel.org">robh@kernel.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><br>
On Tue, 20 Dec 2022 13:01:08 +0100, Christophe Branchereau wrote:<br>
&gt; From: Paul Cercueil &lt;<a href=3D"mailto:paul@crapouillou.net" target=
=3D"_blank" rel=3D"noreferrer">paul@crapouillou.net</a>&gt;<br>
&gt; <br>
&gt; Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0&quot; =
4:3<br>
&gt; 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit<br>
&gt; interface.<br>
&gt; <br>
&gt; Signed-off-by: Paul Cercueil &lt;<a href=3D"mailto:paul@crapouillou.ne=
t" target=3D"_blank" rel=3D"noreferrer">paul@crapouillou.net</a>&gt;<br>
&gt; Signed-off-by: Christophe Branchereau &lt;<a href=3D"mailto:cbranchere=
au@gmail.com" target=3D"_blank" rel=3D"noreferrer">cbranchereau@gmail.com</=
a>&gt;<br>
&gt; Reviewed-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlo=
wski@linaro.org" target=3D"_blank" rel=3D"noreferrer">krzysztof.kozlowski@l=
inaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/display/panel/auo,a030jtn01.yaml | 54 +++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 54 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/pan=
el/auo,a030jtn01.yaml<br>
&gt; <br>
<br>
My bot found errors running &#39;make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k&#39;<br>
on your patch (DT_CHECKER_FLAGS is new in v5.13):<br>
<br>
yamllint warnings/errors:<br>
<br>
dtschema/dtc warnings/errors:<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dts:2=
2.11-21: Warning (reg_format): /example-0/panel@0:reg: property has invalid=
 length (4 bytes) (#address-cells =3D=3D 1, #size-cells =3D=3D 1)<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: =
Warning (pci_device_reg): Failed prerequisite &#39;reg_format&#39;<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: =
Warning (pci_device_bus_num): Failed prerequisite &#39;reg_format&#39;<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: =
Warning (simple_bus_reg): Failed prerequisite &#39;reg_format&#39;<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: =
Warning (i2c_bus_reg): Failed prerequisite &#39;reg_format&#39;<br>
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: =
Warning (spi_bus_reg): Failed prerequisite &#39;reg_format&#39;<br>
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dis=
play/panel/auo,a030jtn01.example.dtb: panel@0: Unevaluated properties are n=
ot allowed (&#39;spi-max-frequency&#39; was unexpected)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 From schema: /builds/robherring/dt-review-ci/li=
nux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml<br>
<br>
doc reference errors (make refcheckdocs):<br>
<br>
See <a href=3D"https://patchwork.ozlabs.org/project/devicetree-bindings/pat=
ch/20221220120108.481554-3-cbranchereau@gmail.com" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://patchwork.ozlabs.org/project/devicetree-bin=
dings/patch/20221220120108.481554-3-cbranchereau@gmail.com</a><br>
<br>
The base for the series is generally the latest rc1. A different dependency=
<br>
should be noted in *this* patch.<br>
<br>
If you already ran &#39;make dt_binding_check&#39; and didn&#39;t see the a=
bove<br>
error(s), then make sure &#39;yamllint&#39; is installed and dt-schema is u=
p to<br>
date:<br>
<br>
pip3 install dtschema --upgrade<br>
<br>
Please check and re-submit after running the above command yourself. Note<b=
r>
that DT_SCHEMA_FILES can be set to your schema file to speed up checking<br=
>
your schema. However, it must be unset to test all examples with your schem=
a.<br>
<br>
</blockquote></div>

--000000000000dbe1e805f0432907--
