Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DE242F3F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 21:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293A26E130;
	Wed, 12 Aug 2020 19:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217496E03A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 19:30:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597260626; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4+/wN/ZFlubPC8f06kWYCcnSStIOeSWNXCfdlUIBb6Q=;
 b=pm1U6Q2I8M8hItidCnxho4pwucBFeNwT0R2kMX7gZSDtI8XEQpDzC+qXCO4vzd5zr2pBn8eQ
 xXcfd1SG22FjOJcW8VEHjpWifer5pvsBhNVONp7EZKlRfQBm3Nkll/xaXkUoUtfQhAuelreb
 n8mlbxJYnPmIUe8QlAltJ9rEsns=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f3443512f4952907de04f3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 19:30:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BBAEBC43395; Wed, 12 Aug 2020 19:30:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DC4C6C433C9;
 Wed, 12 Aug 2020 19:30:23 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 12 Aug 2020 12:30:23 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5] arm64: dts: qcom: sc7180: Add Display Port dt node
In-Reply-To: <159717422853.1360974.2200109790995932014@swboyd.mtv.corp.google.com>
References: <20200811021553.25023-1-tanmay@codeaurora.org>
 <159717422853.1360974.2200109790995932014@swboyd.mtv.corp.google.com>
Message-ID: <70d8a4f073abf7a038c9830ec6586709@codeaurora.org>
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
Cc: devicetree@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-11 12:30, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-08-10 19:15:53)
>> @@ -2440,6 +2447,71 @@ dsi_phy: dsi-phy@ae94400 {
>> 
>>                                 status = "disabled";
>>                         };
>> +
>> +                       msm_dp: displayport-controller@ae90000 {
>> +                               status = "disabled";
>> +                               compatible = "qcom,sc7180-dp";
>> +
>> +                               reg = <0 0x0ae90000 0 0x1400>;
>> +
>> +                               interrupt-parent = <&mdss>;
>> +                               interrupts = <12 IRQ_TYPE_NONE>;
> 
> Please drop the flags. It's not required per the binding. It should 
> just
> be a single number, i.e. <12>.
> 

Sure. I will change DP-bindings accordingly as well.

>> +
>> +                               clocks = <&dispcc 
>> DISP_CC_MDSS_AHB_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_AUX_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_LINK_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                                        <&dispcc
> DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +                               clock-names = "core_iface", 
>> "core_aux",
> "ctrl_link",
>> +                                             "ctrl_link_iface",
> "stream_pixel";
>> +                               #clock-cells = <1>;
>> +                               assigned-clocks = <&dispcc
> DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +                                                 <&dispcc
> DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +                               assigned-clock-parents = <&msm_dp 0>,
> <&msm_dp 1>;
>> +
>> +                               operating-points-v2 = <&dp_opp_table>;
>> +                               power-domains = <&rpmhpd SC7180_CX>;
> 
> Can you send another patch to add the hpd pinctrl binding for the hpd
> function? It would be useful to have that in the SoC level in case any
> board wants to use the hpd pin on this SoC without having to implement
> it themselves. It could be assigned here too as the pinctrl but I'm not
> sure if that is correct. Probably better to just have it in the SoC 
> file
> and then let boards pick to use it.
> 

We have tlmm node in sc7180.dtsi. We can define pinctrl definition for 
"dp_hot" funtionality there.

>> +
>> +                               ports {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       port@0 {
>> +                                               reg = <0>;
>> +                                               dp_in: endpoint {
>> +                                                       
>> remote-endpoint
> = <&dpu_intf0_out>;
>> +                                               };
>> +                                       };
>> +
>> +                                       port@1 {
>> +                                               reg = <1>;
>> +                                               dp_out: endpoint { };
>> +                                       };
>> +                               };
>> +
>> +                               dp_opp_table: dp-opp-table {
> 
> Can this be called opp-table? I don't see the need to make it more
> specific given that it doesn't share the namespace at this level with
> anything else that is an opp table.
> 

DSI and MDP's OPP table names were posted here:
https://lore.kernel.org/dri-devel/1594292674-15632-4-git-send-email-rnayak@codeaurora.org/

So, It makes sense to keep naming conventions similar to dsi and mdp's 
opp table.

>> +                                       compatible =
> "operating-points-v2";
>> +
>> +                                       opp-160000000 {
>> +                                               opp-hz = /bits/ 64
> <160000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_low_svs>;
>> +                                       };
>> +
>> +                                       opp-270000000 {
>> +                                               opp-hz = /bits/ 64
> <270000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_svs>;
>> +                                       };
>> +
>> +                                       opp-540000000 {
>> +                                               opp-hz = /bits/ 64
> <540000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_svs_l1>;
>> +                                       };
>> +
>> +                                       opp-810000000 {
>> +                                               opp-hz = /bits/ 64
> <810000000>;
>> +                                               required-opps =
> <&rpmhpd_opp_nom>;
>> +                                       };
>> +                               };
>> +                       };
>>                 };
>> 
>>                 dispcc: clock-controller@af00000 {
>> @@ -2449,8 +2521,8 @@ dispcc: clock-controller@af00000 {
>>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>>                                  <&dsi_phy 0>,
>>                                  <&dsi_phy 1>,
>> -                                <0>,
>> -                                <0>;
>> +                                <&msm_dp 0>,
>> +                                <&msm_dp 1>;
> 
> This bit will have to change when the DP phy is split off into the qmp
> driver.
> 

Yes. It will be <&dp_phy 0> and <&dp_phy 1> assuming dp_phy is DP PHY 
dts node name.

>>                         clock-names = "bi_tcxo",
>>                                       "gcc_disp_gpll0_clk_src",
>>                                       "dsi0_phy_pll_out_byteclk",
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
