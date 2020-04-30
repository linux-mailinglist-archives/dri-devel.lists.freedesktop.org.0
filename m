Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A7C1C0469
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 20:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D916E93E;
	Thu, 30 Apr 2020 18:12:42 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2126E93E
 for <dri-devel@freedesktop.org>; Thu, 30 Apr 2020 18:12:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588270362; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=pPcbnLkLayy2Rm6j200c+uFP70JSkmmB+Gfck54oXYM=;
 b=UA1cn/0Q0PdmOPol0vVSBGhDS42z5+dkr6P5pd8Gn1jZ7ccLsHSfjFHEafZ0oe9QZhUfgiR1
 CcBcD8saRERY+ElaxryGZ60ViaIfxvteC17mHP3GtU4d0RKLYcmIpoH4shDQ3gFN1b3BegJK
 BDmMsoGHOgknnIdKWriuDZQELIQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eab1516.7f3cb6b64730-smtp-out-n05;
 Thu, 30 Apr 2020 18:12:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D5CCC43636; Thu, 30 Apr 2020 18:12:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4822C433D2;
 Thu, 30 Apr 2020 18:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4822C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 30 Apr 2020 12:12:33 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string
 and mem_iface clock
Message-ID: <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 dianders@chromium.org, robh@kernel.org, robin.murphy@arm.com,
 saiprakash.ranjan@codeaurora.org
References: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, mka@chromium.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 09:29:47AM +0530, Sharat Masetty wrote:
> This patch adds a new compatible string for sc7180 and also an
> additional clock listing needed to power the TBUs and the TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> v2: Addressed review comments from Doug
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..ba5dba4 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2
> 
> @@ -113,16 +114,23 @@ properties:
>        present in such cases.
> 
>    clock-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: bus
>        - const: iface
> +      - const: mem_iface

Hi Sharat -

I think there was a bit of confusion due to renaming between downstream and
upstream.  Currently for the sdm845 and friends we have:

  clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
     <&gcc GCC_GPU_CFG_AHB_CLK>;
  clock-names = "bus", "iface";

Confusingly these same clocks downstream are "mem_iface_clk" and "iface_clk"
respectively.

It looks like you are trying to add GCC_DDRSS_GPU_AXI_CLK as "mem_iface" which
was formerly "mem_clk" downstream. I'm not sure if the naming change is
intentional or you were trying to make upstream and downstream match and didn't
realize that they were renamed.

I'm not sure if we need DDRSS_GPU_AXI_CLK or not. Empirically it works without
it for sdm845 (I don't have a sc7180 to test) but we should probably loop back
with either the clock team or the hardware designers to be sure there isn't a
corner case that is missing. I agree with Doug that its always best if we don't
need to add a clock.

Jordan
> 
>    clocks:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description: bus clock required for downstream bus access and for the
>            smmu ptw
>        - description: interface clock required to access smmu's registers
>            through the TCU's programming interface.
> +      - description: clock required for the inner working of SMMU TBUs and the
> +          TCU like the pagetable walks and the TLB flushes.
> 
>    power-domains:
>      maxItems: 1
> --
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
