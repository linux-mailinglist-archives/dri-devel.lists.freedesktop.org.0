Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5943A5CC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 23:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADADF6E217;
	Mon, 25 Oct 2021 21:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AB46E217
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 21:25:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635197131; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/n7Afg/qFLw5fN0zCsoQaRdymI6ejx5XZCvCB+/h3VE=;
 b=UJ+QQzgjKbXXY6eIppI/395on6hXFo6bovm3d9mfJMnS4RFCYD42fB4tul/Hn3bVNHSoEHAF
 Y26ZS0Ok6D9iyNT+qn8VMuviTJUfeLKC+8qSeQusoZJeTYB7LxZU94dYR3Li1YOJEVVcf6nw
 m2N4CLeV42vw27dIHtjTf5DOd04=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617720c3b03398c06ca5bc15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 21:25:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E28FC43618; Mon, 25 Oct 2021 21:25:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EBE9C43460;
 Mon, 25 Oct 2021 21:25:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Oct 2021 14:25:21 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Krishna Manikandan <quic_mkrishn@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sankeerth Billakanti
 <quic_sbillaka@quicinc.com>, kalyan_t@codeaurora.org,
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 bjorn.andersson@linaro.org, rajeevny@codeaurora.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
In-Reply-To: <CAE-0n53NtSwin8RavHqF44d2adv9-_HMwDC+RzyzgQq8Z4t_yA@mail.gmail.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
 <1634738333-3916-4-git-send-email-quic_mkrishn@quicinc.com>
 <CAE-0n53NtSwin8RavHqF44d2adv9-_HMwDC+RzyzgQq8Z4t_yA@mail.gmail.com>
Message-ID: <f8364fd67770659f99e067827afb99af@codeaurora.org>
X-Sender: khsieh@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-21 11:44, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-10-20 06:58:53)
>> From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> 
>> Add edp controller and phy DT nodes for sc7280.
>> 
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>> 
> 
> Some comments below
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> 
>> Changes in v2:
>>     - Move regulator definitions to board file (Matthias Kaehlcke)
>>     - Move the gpio definitions to board file (Matthias Kaehlcke)
>>     - Move the pinconf to board file (Matthias Kaehlcke)
>>     - Move status property (Stephen Boyd)
>>     - Drop flags from interrupts (Stephen Boyd)
>>     - Add clock names one per line for readability (Stephen Boyd)
>>     - Rename edp-opp-table (Stephen Boyd)
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 107 
>> ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 106 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index dd35882..4450277 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2575,7 +2575,7 @@
>>                         reg = <0 0xaf00000 0 0x20000>;
>>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> -                                <0>, <0>, <0>, <0>, <0>, <0>;
>> +                                <0>, <0>, <0>, <0>, <&edp_phy 0>, 
>> <&edp_phy 1>;
> 
> I can already tell this is going to be a merge mess! Can this also be
> one cell per line?
> 
  where are dsi phy? (<&dsi_phy 0>, <&dsi_phy 1>)

>>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>>                                       "dsi0_phy_pll_out_byteclk",
>>                                       "dsi0_phy_pll_out_dsiclk",
>> @@ -2777,6 +2784,103 @@
>> 
>>                                 status = "disabled";
>>                         };
>> +
>> +                       msm_edp: edp@aea0000 {
>> +                               compatible = "qcom,sc7280-edp";
>> +
>> +                               reg = <0 0xaea0000 0 0x200>,
>> +                                     <0 0xaea0200 0 0x200>,
>> +                                     <0 0xaea0400 0 0xc00>,
>> +                                     <0 0xaea1000 0 0x400>;
>> +
>> +                               interrupt-parent = <&mdss>;
>> +                               interrupts = <14>;
>> +
>> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +                                        <&gcc GCC_EDP_CLKREF_EN>,
>> +                                        <&dispcc 
>> DISP_CC_MDSS_AHB_CLK>,
>> +                                        <&dispcc 
>> DISP_CC_MDSS_EDP_AUX_CLK>,
>> +                                        <&dispcc 
>> DISP_CC_MDSS_EDP_LINK_CLK>,
>> +                                        <&dispcc 
>> DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
>> +                                        <&dispcc 
>> DISP_CC_MDSS_EDP_PIXEL_CLK>;
>> +                               clock-names = "core_xo",
>> +                                             "core_ref",
>> +                                             "core_iface",
>> +                                             "core_aux",
>> +                                             "ctrl_link",
>> +                                             "ctrl_link_iface",
>> +                                             "stream_pixel";
>> +                               #clock-cells = <1>;
>> +                               assigned-clocks = <&dispcc 
>> DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
>> +                                                 <&dispcc 
>> DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
>> +                               assigned-clock-parents = <&edp_phy 0>, 
>> <&edp_phy 1>;
>> +
>> +                               phys = <&edp_phy>;
>> +                               phy-names = "dp";
>> +
>> +                               operating-points-v2 = 
>> <&edp_opp_table>;
>> +                               power-domains = <&rpmhpd SC7280_CX>;
>> +
>> +
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +
>> +                               status = "disabled";
>> +
>> +                               ports {
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +                                       port@0 {
>> +                                               reg = <0>;
>> +                                               edp_in: endpoint {
>> +                                                       
>> remote-endpoint = <&dpu_intf5_out>;
>> +                                               };
>> +                                       };
>> +                               };
>> +
>> +                               edp_opp_table: opp-table {
>> +                                       compatible = 
>> "operating-points-v2";
>> +
>> +                                       opp-160000000 {
>> +                                               opp-hz = /bits/ 64 
>> <160000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                       };
>> +
>> +                                       opp-270000000 {
>> +                                               opp-hz = /bits/ 64 
>> <270000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_svs>;
>> +                                       };
>> +
>> +                                       opp-540000000 {
>> +                                               opp-hz = /bits/ 64 
>> <540000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       };
>> +
>> +                                       opp-810000000 {
>> +                                               opp-hz = /bits/ 64 
>> <810000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       };
>> +                               };
>> +                       };
>> +
>> +                       edp_phy: phy@aec2000 {
> 
> unit address needs to match first reg property. This should be
> 
> 			edp_phy: phy@aec2a00
> 
>> +                               compatible = "qcom,sc7280-edp-phy";
>> +
>> +                               reg = <0 0xaec2a00 0 0x19c>,
>> +                                     <0 0xaec2200 0 0xa0>,
>> +                                     <0 0xaec2600 0 0xa0>,
>> +                                     <0 0xaec2000 0 0x1c0>;
>> +
>> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +                                        <&gcc GCC_EDP_CLKREF_EN>;
>> +                               clock-names = "aux",
>> +                                             "cfg_ahb";
>> +
>> +                               #clock-cells = <1>;
>> +                               #phy-cells = <0>;
>> +
>> +                               status = "disabled";
>> +                       };
>>                 };
>> 
>>                 pdc: interrupt-controller@b220000 {
>> @@ -3932,6 +4036,7 @@
>>                                                          <&CPU3 
>> THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>                                 };
>>                         };
>> +
> 
> Drop this?
