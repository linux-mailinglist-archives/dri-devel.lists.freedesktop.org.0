Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9D198D1C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A35C6E595;
	Tue, 31 Mar 2020 07:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168F56E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 14:28:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585578529; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Z6pGLvcJiDN7TQIxiTcGrUrMaVtIipeZQGdjkSCnW+Y=;
 b=DC5P/tFosDXk0lHmfbDHPHpmkxs9CfhBgQMVosvNkyaX5zFQ6bjGOsM+h5tl+raBhiJztKSb
 FZ886XPbzTSbNd6JLmdlLXkUW4NswXJN59BsD25pviN566XeT3xFaWLcuZChErGcPOMRFWot
 fpmKWbnDPBWqESGKCWT/Ceypwes=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e820212.7f94c2193180-smtp-out-n05;
 Mon, 30 Mar 2020 14:28:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 38064C44791; Mon, 30 Mar 2020 14:28:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 146FAC43636;
 Mon, 30 Mar 2020 14:28:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 30 Mar 2020 19:58:33 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
In-Reply-To: <20200325153716.tcx3t4bd6p3gr2x6@holly.lan>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
 <20200325153716.tcx3t4bd6p3gr2x6@holly.lan>
Message-ID: <469430df70c9e3e12bfce7b654d7ce0e@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-25 21:07, Daniel Thompson wrote:
> On Mon, Mar 23, 2020 at 11:16:57PM +0530, Kiran Gunda wrote:
>> Add WLED5 specific bindings.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 39 
>> ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index 8a388bf..159115f 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -20,6 +20,7 @@ properties:
>>         - qcom,pm8941-wled
>>         - qcom,pmi8998-wled
>>         - qcom,pm660l-wled
>> +       - qcom,pm8150l-wled
>> 
>>    reg:
>>      maxItems: 1
>> @@ -28,10 +29,23 @@ properties:
>>      maxItems: 1
>>      description:
>>        brightness value on boot, value from 0-4095.
>> +      For pm8150l this value vary from 0-4095 or 0-32767
>> +      depending on the brightness control mode. If CABC is
>> +      enabled 0-4095 range is used.
> 
> I rather dislike some of the property descriptions using PMIC version
> numbers to distinguish between peripheral versions and others using
> WLEDx version numbers.
> 
> Could the property description be rephrased to use WLED3/4/5 
> terminology
> instead?
> 
Sure. I will modify in the next post.
> 
>>      allOf:
>>        - $ref: /schemas/types.yaml#/definitions/uint32
>>          default: 2048
>> 
>> +  max-brightness:
>> +    maxItems: 1
>> +    description:
>> +      Maximum brightness level. Allowed values are,
>> +      for pmi8998 it is  0-4095.
>> +      For pm8150l, this can be either 4095 or 32767.
>> +      If CABC is enabled, this is capped to 4095.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
> 
> Similar thing here, is PMI8998 simply a synonym for WLED4 or there
> something special about the PMIC versioning that requires it to be 
> used?
> 
> 
> Daniel.
> 
Sure. It is synonym for WLED4. I will modify in the next post.
> 
>>    label:
>>      maxItems: 1
>>      description:
>> @@ -124,6 +138,31 @@ properties:
>>        value for PM8941 from 1 to 3. Default 2
>>        For PMI8998 from 1 to 4.
>> 
>> +  qcom,modulator-sel:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Selects the modulator used for brightness modulation.
>> +      Allowed values are,
>> +               0 - Modulator A
>> +               1 - Modulator B
>> +      If not specified, then modulator A will be used by default.
>> +      This property is applicable only to WLED5 peripheral.
>> +
>> +  qcom,cabc-sel:
>> +    maxItems: 1
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Selects the CABC pin signal used for brightness modulation.
>> +      Allowed values are,
>> +              0 - CABC disabled
>> +              1 - CABC 1
>> +              2 - CABC 2
>> +              3 - External signal (e.g. LPG) is used for dimming
>> +      This property is applicable only to WLED5 peripheral.
>> +
>>    interrupts:
>>      maxItems: 2
>>      description:
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
