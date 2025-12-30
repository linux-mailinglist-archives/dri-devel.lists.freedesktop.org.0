Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC423CE882D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 02:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382010E7B1;
	Tue, 30 Dec 2025 01:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IVfzR89D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6510E7B1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 01:54:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0078A423C9;
 Tue, 30 Dec 2025 01:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999E4C4CEF7;
 Tue, 30 Dec 2025 01:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767059640;
 bh=CKjr67pNdP9FP3s3q4y0uZntOZ/ZSmOWBaQJXLaNoPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVfzR89D1zKINnkmG/fYk2anvWdfmN2BA8pncIm/7gVXoeGfHuQo5qCS/MSkW0GaR
 5eA+bAgfrW2lab/PLgH7O5ceCwBB3+5bqlz4F5tM5zjWxU3yjNpebjAcvhP0ZNkLU9
 /9sR6vwPJp7frxPmQVLI6b2i1Z91y3kfGTEcPFW+HoVhyKcgzZwttFNdh4Ilvl5ocQ
 U4T4e+2JO5VBdL111rBhVbxFbc83kGqcWbYVnQ/gGEFyvxdm6Xw4tK8Ib60vUtX43g
 ObBwHQhC+/44/5Gta63AJTjuck6ZM//GzU0KtBN5EBgRjLf9h0T4yylOwNzN+dYM4R
 ZKsT2cO2S6A3w==
Date: Mon, 29 Dec 2025 19:53:59 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <20251230015359.GB3066456-robh@kernel.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
 <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
 <f72fed1c-968e-4570-8cde-841bf109bf5d@kernel.org>
 <aVGvtJ0NekR1ch-k@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVGvtJ0NekR1ch-k@SoMainline.org>
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

On Sun, Dec 28, 2025 at 11:49:13PM +0100, Marijn Suijten wrote:
> On 2025-12-22 09:36:23, Krzysztof Kozlowski wrote:
> > On 22/12/2025 09:33, Krzysztof Kozlowski wrote:
> > >> +  - |
> > >> +    #include <dt-bindings/gpio/gpio.h>
> > >> +
> > >> +    dsi {
> > >> +        #address-cells = <1>;
> > >> +        #size-cells = <0>;
> > >> +        panel@0 {
> > >> +            compatible = "samsung,sofef03-m-amb609vp01";
> > >> +            reg = <0>;
> > >> +
> > >> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> > >> +
> > >> +            vci-supply = <&vreg_l11c_3p0>;
> > >> +            vddio-supply = <&vreg_l14a_1p8>;
> > >> +
> > >> +            port {
> > > 
> > > Not tested :/
> > 
> > Ah no, this one is correct. It's the other patch with similar compatible
> > which was not tested.
> 
> I think you mean:
> 
> 	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
> 	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'port' is a required property
> 		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
> 
> Which looks to be fixed by including panel-common-dual.yaml and changing `port`
> to `ports` in the properties and required table?  At least the errors are gone,
> just asking if that is acceptable.

Considering it's a dual interface panel, yes, that's the right change.

Rob
