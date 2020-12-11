Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B32D74F4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F946EDB9;
	Fri, 11 Dec 2020 11:55:40 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D636EDB9
 for <dri-devel@freedesktop.org>; Fri, 11 Dec 2020 11:55:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607687738; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=LbzVKyGNu6jrpSMBFsyu/k8NnfRGSOIzaxBOw2v4+d4=;
 b=a52w434HES/oop8f2PCsitS0yAFQsctTWjcvwS14F5lG4Us3aui/VsDS+gADrY6jFWHL0vew
 GX12KVvkb2MOgGZ6yEc2KnI8usR8/QtUXdUUmpzbCPu/Fy4NZ4P2fdpssTUWzmpw6xs9sLyr
 qh+ycIUFkXq9C8CpICSwf1P0fJE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fd35e3a35a25d1b16b71f37 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 11:55:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C4F81C433CA; Fri, 11 Dec 2020 11:55:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.3] (unknown [117.210.189.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D217C43462;
 Fri, 11 Dec 2020 11:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D217C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v3 2/2] arm: dts: sc7180: Add support for gpu fuse
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
References: <1607337728-11398-1-git-send-email-akhilpo@codeaurora.org>
 <1607337728-11398-2-git-send-email-akhilpo@codeaurora.org>
Message-ID: <ca0f14be-83cd-157c-8773-939fbb63bdf0@codeaurora.org>
Date: Fri, 11 Dec 2020 17:25:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607337728-11398-2-git-send-email-akhilpo@codeaurora.org>
Content-Language: en-US
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
Cc: linux-arm-msm@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/2020 4:12 PM, Akhil P Oommen wrote:
> Add support for gpu fuse to help identify the supported opps.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6678f1e..8cae3eb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -675,6 +675,11 @@
>   				reg = <0x25b 0x1>;
>   				bits = <1 3>;
>   			};
> +
> +			gpu_speed_bin: gpu_speed_bin@1d2 {
> +				reg = <0x1d2 0x2>;
> +				bits = <5 8>;
> +			};
>   		};
>   
>   		sdhc_1: sdhci@7c4000 {
> @@ -1907,52 +1912,69 @@
>   			operating-points-v2 = <&gpu_opp_table>;
>   			qcom,gmu = <&gmu>;
>   
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";
> +
>   			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>   			interconnect-names = "gfx-mem";
>   
>   			gpu_opp_table: opp-table {
>   				compatible = "operating-points-v2";
>   
> +				opp-825000000 {
> +					opp-hz = /bits/ 64 <825000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x04>;
> +				};
> +
>   				opp-800000000 {
>   					opp-hz = /bits/ 64 <800000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>   					opp-peak-kBps = <8532000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-650000000 {
>   					opp-hz = /bits/ 64 <650000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>   					opp-peak-kBps = <7216000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-565000000 {
>   					opp-hz = /bits/ 64 <565000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>   					opp-peak-kBps = <5412000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-430000000 {
>   					opp-hz = /bits/ 64 <430000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>   					opp-peak-kBps = <5412000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-355000000 {
>   					opp-hz = /bits/ 64 <355000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>   					opp-peak-kBps = <3072000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-267000000 {
>   					opp-hz = /bits/ 64 <267000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>   					opp-peak-kBps = <3072000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   
>   				opp-180000000 {
>   					opp-hz = /bits/ 64 <180000000>;
>   					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>   					opp-peak-kBps = <1804000>;
> +					opp-supported-hw = <0x07>;
>   				};
>   			};
>   		};
> 

A gentle ping.

-Akhil.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
