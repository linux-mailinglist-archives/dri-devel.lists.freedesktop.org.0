Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B814CB0C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 14:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3603F6F537;
	Wed, 29 Jan 2020 13:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA876F4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:55:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580288126; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=m1aJ2Qp8X5dBwtzaU0ERZTgZJkpnmU03rRacyFrY9dI=;
 b=EKeIdXiRssKjwnUmIcrFxx2QTFH2kBa43PEHOXFvVLAODnff1hjPjnfDxyI7njT3BChWMlHk
 8/d3o5Ww+4xVy09KEYQQmhTUJckzN3TMCYrrRLokur3Cwq5e+e7NmD0Z+E26JpjAQEHPcviH
 1YyZpPvKyv4fWCiHmThkBvnQ5AY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e31487b.7f8880663378-smtp-out-n03;
 Wed, 29 Jan 2020 08:55:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4AF5AC447A1; Wed, 29 Jan 2020 08:55:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 756B2C433CB;
 Wed, 29 Jan 2020 08:55:22 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Jan 2020 14:25:22 +0530
From: harigovi@codeaurora.org
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [v4] arm64: dts: sc7180: add display dt nodes
In-Reply-To: <20200128203222.GD46072@google.com>
References: <1580217884-21932-1-git-send-email-harigovi@codeaurora.org>
 <20200128203222.GD46072@google.com>
Message-ID: <e9b02cfe89db7b8624bdce56c3f9ceef@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 29 Jan 2020 13:03:26 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-29 02:02, Matthias Kaehlcke wrote:
> Hi,
> 
> On Tue, Jan 28, 2020 at 06:54:44PM +0530, Harigovindan P wrote:
>> Add display, DSI hardware DT nodes for sc7180.
>> 
>> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
>> ---
>> 
>> Changes in v1:
>> 	-Added display DT nodes for sc7180
>> Changes in v2:
>> 	-Renamed node names
>> 	-Corrected code alignments
>> 	-Removed extra new line
>> 	-Added DISP AHB clock for register access
>> 	under display_subsystem node for global settings
>> Changes in v3:
>> 	-Modified node names
>> 	-Modified hard coded values
>> 	-Removed mdss reg entry
>> Changes in v4:
>> 	-Reverting mdp node name
>> 	-Setting status to disabled in main SOC dtsi file
>> 	-Replacing _ to - for node names
>> 	-Adding clock dependency patch link
>> 	-Splitting idp dt file to a separate patch
>> 
>> This patch has dependency on the below series
>> https://lkml.org/lkml/2019/12/27/73
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 128 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 128 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 3bc3f64..c3883af 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -1184,6 +1184,134 @@
>>  			#power-domain-cells = <1>;
>>  		};
>> 
>> +		mdss: mdss@ae00000 {
>> +			compatible = "qcom,sc7180-mdss";
>> +			reg = <0 0x0ae00000 0 0x1000>;
>> +			reg-names = "mdss";
>> +
>> +			power-domains = <&dispcc MDSS_GDSC>;
>> +
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +			clock-names = "iface", "gcc_bus", "ahb", "core";
>> +
>> +			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +			assigned-clock-rates = <300000000>;
>> +
>> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +
>> +			iommus = <&apps_smmu 0x800 0x2>;
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			mdss_mdp: mdp@ae01000 {
>> +				compatible = "qcom,sc7180-dpu";
>> +				reg = <0 0x0ae01000 0 0x8f000>,
>> +				      <0 0x0aeb0000 0 0x2008>,
>> +				      <0 0x0af03000 0 0x16>;
>> +				reg-names = "mdp", "vbif", "disp_cc";
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_ROT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				clock-names = "iface", "rot", "lut", "core",
>> +					      "vsync";
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				assigned-clock-rates = <300000000>,
>> +						       <19200000>;
> 
> The clock rate for DISP_CC_MDSS_MDP_CLK is already specified in the
> parent node, do we really want/need to specify it twice?

Hi,

The parent device ( MDSS ) configures global HW settings which needs MDP 
CLK to be turned on with a default rate.
mdp device handles the composition, and it will compute the frequency 
needed as per the layer stack in the composition, hence we can have 
multiple rates on the CLK.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
