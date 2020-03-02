Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC817654F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 21:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F8C6E83E;
	Mon,  2 Mar 2020 20:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A766E83E;
 Mon,  2 Mar 2020 20:49:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 408528051F;
 Mon,  2 Mar 2020 21:49:08 +0100 (CET)
Date: Mon, 2 Mar 2020 21:49:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: msm: Convert GMU bindings
 to YAML
Message-ID: <20200302204906.GA32123@ravnborg.org>
References: <1583173424-21832-1-git-send-email-jcrouse@codeaurora.org>
 <1583173424-21832-2-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583173424-21832-2-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
 a=7gkXJVJtAAAA:8 a=QUSSlG8YkhR_fViXtTAA:9 a=3EO_jEHvlgRDqEOL:21
 a=b2m7j8IoA-gO4Aiz:21 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan.

On Mon, Mar 02, 2020 at 11:23:43AM -0700, Jordan Crouse wrote:
> Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> text bindings.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  .../devicetree/bindings/display/msm/gmu.txt        | 116 -------------------
> -
> -Required properties:
> -- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
> -    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
> -  Note that you need to list the less specific "qcom,adreno-gmu"
> -  for generic matches and the more specific identifier to identify
> -  the specific device.
> -- reg: Physical base address and length of the GMU registers.
> -- reg-names: Matching names for the register regions
> -  * "gmu"
> -  * "gmu_pdc"
> -  * "gmu_pdc_seg"
> -- interrupts: The interrupt signals from the GMU.
> -- interrupt-names: Matching names for the interrupts
> -  * "hfi"
> -  * "gmu"
> -- clocks: phandles to the device clocks
> -- clock-names: Matching names for the clocks
> -   * "gmu"
> -   * "cxo"
> -   * "axi"
> -   * "mnoc"
The new binding - and arch/arm64/boot/dts/qcom/sdm845.dtsi agrees that
"mnoc" is wrong.

> -- power-domains: should be:
> -	<&clock_gpucc GPU_CX_GDSC>
> -	<&clock_gpucc GPU_GX_GDSC>
> -- power-domain-names: Matching names for the power domains
> -- iommus: phandle to the adreno iommu
> -- operating-points-v2: phandle to the OPP operating points
> -
> -Optional properties:
> -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
This property is not included in the new binding.

Everything else looked fine to me.
With sram added - or expalined in commit why it is dropped:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
