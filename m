Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11265201D59
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 23:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350ED6EB6B;
	Fri, 19 Jun 2020 21:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C23C6EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 21:55:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592603713; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wam1wyE1W3Of+tegUUPP3NeNpIntvTygPj4lrZBjm+o=;
 b=l37D54Lvb9I6/dh+ec9lhSko6K/W20mx5d78XIJ9a1umbbOtkIdtKUzYszXDw3iWtYWBitL/
 EWS4vMtHAraKGBY7reLdXWBpo9+r/TDIJbbXezZC6ZWZoTDRVtTBPOsnyLd2VkPP+ds+xyAL
 jsZj3WYz6CjH07mVw5OSdaxnHbw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5eed343dad153efa34c33807 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 21:55:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59C22C4339C; Fri, 19 Jun 2020 21:55:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C819C433CA;
 Fri, 19 Jun 2020 21:55:08 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Jun 2020 14:55:08 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
In-Reply-To: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
 <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
Message-ID: <c110cd89a3144a20b21ec392f50eee68@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, agross@kernel.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Stephen for reviews.
I will post new change addressing your all comments.

On 2020-06-18 18:12, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-06-18 16:21:13)
>> Enable DP driver for sc7180.
> 
> Add DP device node on sc7180? This isn't a driver.
> 
Done.
>> 
>> This change depends-on following series:
>> https://patchwork.freedesktop.org/series/78583/
>> and https://patchwork.freedesktop.org/patch/351990/
>> 
>> Changes in v2:
>> 
>> - Add assigned-clocks and assigned-clock-parents
>> - Remove cell-index and pixel_rcg
>> - Change compatible to qcom,sc7180-dp
>> 
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 
>> ++++++++++++++++++++++++++--
>>  1 file changed, 53 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 916401f7e87c..26fe623e3b0f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2216,10 +2216,19 @@ ports {
>>                                         #address-cells = <1>;
>>                                         #size-cells = <0>;
>> 
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +                                               dpu_intf1_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dsi0_in>;
>> +                                               };
>> +                                       };
>> +
>>                                         port@0 {
>>                                                 reg = <0>;
>> -                                               dpu_intf1_out: 
>> endpoint {
>> -                                                       
>> remote-endpoint = <&dsi0_in>;
>> +                                               dpu_intf0_out: 
>> endpoint {
>> +                                                       
>> remote-endpoint =
>> +                                                                
>> <&dp_in>;
>>                                                 };
>>                                         };
>>                                 };
> 
> I thought this wasn't supposed to change? At least according to the
> binding it shouldn't be needed.
> 
Thanks. Yes it should be port@2 as per new dpu-sc7180.yaml bindings in 
below patch.
https://patchwork.freedesktop.org/patch/371087/?series=78583&rev=1

>> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>>                         };
>>                 };
>> 
>> +               msm_dp: displayport-controller@ae90000{
>> +                       status = "ok";
> 
> Please use status = "disabled";
> 
Ok got it. Board's DT will enable it.

>> +                       compatible = "qcom,sc7180-dp";
>> +
>> +                       reg = <0 0xae90000 0 0x1400>;
>> +                       reg-names = "dp_controller";
>> +
>> +                       interrupt-parent = <&mdss>;
> 
> Any reason why this isn't under the mdss node like the other display
> device nodes?
> 
Done. Moved msm_dp node under mdss.
>> +                       interrupts = <12 0>;
>> +
>> +                       clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +                                <&dispcc 
>> DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +                       clock-names = "core_aux", "ctrl_link",
>> +                                     "ctrl_link_iface", 
>> "stream_pixel";
>> +                       #clock-cells = <1>;
>> +                       assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +                       assigned-clock-parents = <&msm_dp 1>;
>> +
>> +                       data-lanes = <0 1>;
> 
> This can and should be left to the board files. At the SoC level my
> understanding is that there are four lanes possible, so no need to
> artificially limit it here.
> 
Removed from here. Driver changes I will be posting accordingly.
>> +
>> +                       ports {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               port@0 {
>> +                                       reg = <0>;
>> +                                       dp_in: endpoint {
>> +                                               remote-endpoint =
>> +                                                        
>> <&dpu_intf0_out>;
> 
> I'd prefer these were on one line, regardless of the 80 character line
> limit/suggestion.
> 
ok done.
>> +                                       };
>> +                               };
>> +
>> +                               port@1 {
>> +                                       reg = <1>;
>> +                                       dp_out: endpoint { };
>> +                               };
>> +                       };
>> +               };
>> +
>>                 dispcc: clock-controller@af00000 {
>>                         compatible = "qcom,sc7180-dispcc";
>>                         reg = <0 0x0af00000 0 0x200000>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
