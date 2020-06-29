Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0220EF73
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF39889CBA;
	Tue, 30 Jun 2020 07:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45889CF3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 13:50:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593438615; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7RTKsK1vkgMcrQEAHJsfsvSNG30HIOc0GMqPzPCA89A=;
 b=azEs+rKgsd7aobL6i112PsqLbkrXGnpNB3whpp2FIycGSLmaoyeQpDNZQaWW+vtfH9h4+eMY
 0xzTQmJG2SJ5nn9XIv8kRWtl9UfMGAkQxE8FeCepj1P2tGMR6TOLGtmUSYf3+/ycu9G5fF5V
 AzcvxvJAf1aHqPGoSMMK0wk3x1c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5ef9f1920206ad41d167eb9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 13:50:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9DF84C433CA; Mon, 29 Jun 2020 13:50:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: harigovi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1502AC433C8;
 Mon, 29 Jun 2020 13:50:09 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Jun 2020 19:20:09 +0530
From: harigovi@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [v3] arm64: dts: sc7180: add nodes for idp display
In-Reply-To: <159304723830.62212.5069780400830519255@swboyd.mtv.corp.google.com>
References: <20200217085842.28333-1-harigovi@codeaurora.org>
 <159304723830.62212.5069780400830519255@swboyd.mtv.corp.google.com>
Message-ID: <5c2265e82af8f755d649c0c36a462f19@codeaurora.org>
X-Sender: harigovi@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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

On 2020-06-25 06:37, Stephen Boyd wrote:
> Quoting Harigovindan P (2020-02-17 00:58:42)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 388f50ad4fde..349db8fe78a5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -232,6 +233,57 @@ vreg_bob: bob {
>>         };
>>  };
>> 
>> +&dsi0 {
>> +       status = "okay";
>> +
>> +       vdda-supply = <&vreg_l3c_1p2>;
>> +
>> +       panel@0 {
>> +               compatible = "visionox,rm69299-1080p-display";
>> +               reg = <0>;
>> +
>> +               vdda-supply = <&vreg_l8c_1p8>;
>> +               vdd3p3-supply = <&vreg_l18a_2p8>;
>> +
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&disp_pins>;
>> +
>> +               reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
>> +
>> +               ports {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       port@0 {
>> +                               reg = <0>;
>> +                               panel0_in: endpoint {
>> +                                       remote-endpoint = <&dsi0_out>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       ports {
>> +               port@1 {
>> +                       endpoint {
>> +                               remote-endpoint = <&panel0_in>;
>> +                               data-lanes = <0 1 2 3>;
> 
> Is this property needed? If it's the default assumption it would be 
> nice
> to omit it so that we don't have to think about it.
> This property is needed during panel probe. If this is not mentioned 
> here,
mipi_dsi_attach() will fail during panel probe. In dsi_host.c, 
dsi_host_attach()
fails since dsi lanes are greater than msm_host lanes. msm_host lanes 
are updated
as part of dsi_host_parse_dt. If we dont provide data-lanes in dt, it'll 
have default
value and fail in dsi_host_attach().
>> +                       };
>> +               };
>> +       };
>> +};
>> +
>> +&dsi_phy {
>> +       status = "okay";
>> +};
>> +
>> +&mdp {
>> +       status = "okay";
>> +};
>> +
>> +&mdss {
>> +       status = "okay";
>> +};
>> +
>>  &qspi {
>>         status = "okay";
>>         pinctrl-names = "default";
>> @@ -289,6 +341,17 @@ &usb_1_qmpphy {
>> 
>>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>> 
>> +&pm6150l_gpio {
>> +       disp_pins: disp-pins {
> 
> Curious how this works. It looks like PMIC GPIOS are expecting the node
> to look like:
> 
> 	disp_pins: disp-pins {
> 		pinconf {
> 			pins = "gpio3";
> 			function = PMIC_GPIO_FUNC_FUNC1;
> 			qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
> 			power-source = <PM6150_GPIO_VPH>;
> 			bias-disable;
> 			output-low;
> 		};
> 
> but this doesn't use the macros or the subnode for pinconf. Why? Also,
> the PM6150_GPIO_VPH macro doesn't exist.
We are discussing with PMIC team to have that macro in the header file.
Will add other macros as part of next version.
> 
>> +               pins = "gpio3";
>> +               function = "func1";
>> +               qcom,drive-strength = <2>;
>> +               power-source = <0>;
>> +               bias-disable;
>> +               output-low;
>> +       };
>> +};
>> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
