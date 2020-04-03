Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08919E4FA
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ED66E1CD;
	Sat,  4 Apr 2020 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F46E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 11:17:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585912627; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iC7DvDz7ZOsg7VR5uWSawihWsFxlESev/pDn/QoPcn0=;
 b=lJSOcP4zzkG+e0HpC9FXa0F/MAHQeNaUnlBRabx0HGYNfqNq67+Kws7XLTxdQ1q0WIiJfY7a
 8NxbBQFmDrU/HbI/iV4JkEWu/AW5egFbs7CruBdf3fKKCjdYsTIOJ5p+33nF5NTCs10SWIJl
 6x2gNRC6/utfEMXwU5mIaJ4r1RA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e871b32.7f70c73f7c38-smtp-out-n03;
 Fri, 03 Apr 2020 11:17:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B4CD5C44788; Fri,  3 Apr 2020 11:17:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CEA5EC433BA;
 Fri,  3 Apr 2020 11:17:04 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 03 Apr 2020 16:47:04 +0530
From: kgunda@codeaurora.org
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 3/4] backlight: qcom-wled: Add WLED5 bindings
In-Reply-To: <20200331175619.GA25466@bogus>
References: <1584985618-25689-1-git-send-email-kgunda@codeaurora.org>
 <1584985618-25689-4-git-send-email-kgunda@codeaurora.org>
 <20200331175619.GA25466@bogus>
Message-ID: <2aae3ad9267b73c25c8f0a7a0788960b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-31 23:26, Rob Herring wrote:
> On Mon, Mar 23, 2020 at 11:16:57PM +0530, Kiran Gunda wrote:
>> Add WLED5 specific bindings.
>> 
> 
> More of the same comments here...
> 
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
> Constraints.
> 
Will address it in next post.
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
> 
> Constraints!
> 
Will address it in next post.
>> +      If CABC is enabled, this is capped to 4095.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> Standard property. Assume it has a type definition.'
> 
Will address it in next post.
>> +
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
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
