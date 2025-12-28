Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DBFCE583F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 23:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386BA10F53D;
	Sun, 28 Dec 2025 22:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D877610F53D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 22:49:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B77B71F8D7;
 Sun, 28 Dec 2025 23:49:14 +0100 (CET)
Date: Sun, 28 Dec 2025 23:49:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <aVGvtJ0NekR1ch-k@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
 <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
 <f72fed1c-968e-4570-8cde-841bf109bf5d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f72fed1c-968e-4570-8cde-841bf109bf5d@kernel.org>
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

On 2025-12-22 09:36:23, Krzysztof Kozlowski wrote:
> On 22/12/2025 09:33, Krzysztof Kozlowski wrote:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +
> >> +    dsi {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +        panel@0 {
> >> +            compatible = "samsung,sofef03-m-amb609vp01";
> >> +            reg = <0>;
> >> +
> >> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> >> +
> >> +            vci-supply = <&vreg_l11c_3p0>;
> >> +            vddio-supply = <&vreg_l14a_1p8>;
> >> +
> >> +            port {
> > 
> > Not tested :/
> 
> Ah no, this one is correct. It's the other patch with similar compatible
> which was not tested.

I think you mean:

	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'port' is a required property
		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml

Which looks to be fixed by including panel-common-dual.yaml and changing `port`
to `ports` in the properties and required table?  At least the errors are gone,
just asking if that is acceptable.

Then:

	.output/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
		from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml

Which I do not immediately understand how to resolve.  I'd believe there's a
problem with the conditional inclusion of this vci-supply property based on the
compatible name, but do not see where the problem lies as other dt-bindings seem
to write it this way as well.  Can you point this out to me?

Alternatively I'll drop the example with vci-supply, but this'll return when
said panel is committed to DTS.

Lastly checkpatch complains that the "lgd" prefix isn't a valid vendor.  Should
I add "LG Display" to the list or rename it to "lg,"?

> Actually two others were not tested. We are not a testing service - it
> is your task.

That is not very kind; sometimes things might slip through and it's nice if CI
catches them at a last resort.

- Marijn
