Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BA1BB1D8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 01:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D516E129;
	Mon, 27 Apr 2020 23:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37A56E129
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 23:09:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588028963; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oMxZb5I+GDPuJhllgcs2iwGmqgsZIZTUBZ0afvMS0fU=;
 b=siYBhbDNMTeX8kvQy1lrwq3cqLl2BOUICa7jbGlbaAaeZ/nmKEHWAT56en6HlJfd6ecQlk6Z
 h2rM+uv/CboSVzPGIXGeVXg0WX1zyR2XYQFWvkGCkSbMyLSmy/0A9bQKFTuwmZIul32XNkqw
 8uzM2DR+r+Nax3su1xe2nG4zg7Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea76613.7fa3db461650-smtp-out-n05;
 Mon, 27 Apr 2020 23:09:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0961FC433F2; Mon, 27 Apr 2020 23:09:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6377CC433CB;
 Mon, 27 Apr 2020 23:09:06 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Apr 2020 16:09:06 -0700
From: tanmay@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO
 bindings
In-Reply-To: <20200415152439.GA9882@bogus>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
 <20200415152439.GA9882@bogus>
Message-ID: <7fb3a6c19c244c4a37bded7cd249a1f8@codeaurora.org>
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
 dri-devel <dri-devel-bounces@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org, varar@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Rob for reviews.

We are using Display Port Controller block to detect hot plug.
So we won't be using that pin as GPIO.

I found now that we don't need any bindings for that pin in such case.
So I am abandoning this patch series and upload new patch.

Thanks.

On 2020-04-15 08:24, Rob Herring wrote:
> On Tue, Apr 07, 2020 at 03:48:28PM -0700, Tanmay Shah wrote:
>> Add Display Port HPD GPIO description in bindings
>> 
>> This Patch depends on:
>> 	https://patchwork.kernel.org/patch/11468505/
> 
> This belongs below the '---' and probably means you should send all 
> this
> as one series.
> 
>> 
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7
> +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git
> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> index 761a01d..003f5f7 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> @@ -155,6 +155,11 @@ properties:
>>       data-lanes:
>>         description: Maximum number of lanes that can be used for
> Display port.
>> 
>> +     dp-hpd-gpio:
> 
> We already have a standard property for this. Use it.
> 
> It belongs in the connector node as HPD is part of the connector.
> 
>> +       maxItems: 1
>> +       description: Specifies HPD gpio for DP connector without
>> +                    USB PHY or AUX switch.
>> +
>>       usbplug-cc-gpio:
> 
> Note that this too should be in a connector node.
> 
>>         maxItems: 1
>>         description: Specifies the usbplug orientation gpio.
>> @@ -282,6 +287,8 @@ examples:
>>          aux-sel-gpio = <&msmgpio 110 1>;
>>          usbplug-cc-gpio = <&msmgpio 90 1>;
>> 
>> +        dp-hpd-gpio = <&msmgpio 117 0>;
>> +
>>          ports {
>>              #address-cells = <1>;
>>              #size-cells = <0>;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
>> a Linux Foundation Collaborative Project
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
