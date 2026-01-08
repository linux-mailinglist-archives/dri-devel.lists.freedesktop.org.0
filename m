Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2ED01CAF
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486C10E31B;
	Thu,  8 Jan 2026 09:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="oeHpLZqE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GnPa3SU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD33310E31B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767863831; bh=z4ln/Zq/EvlaymR0blLFOBp
 lOaJOGpOHDKqXZY4y8a4=; b=oeHpLZqEBNDpm7VXEpS3ews8h3auO46UyCzY13lWW+/xujy6j8
 /vBBspN2cDXW91fwUGQ8lyGBSVD8DWm3o5711M4D5RZDXejq7ZrOR2BYWXWQizuZ515ogWBvPW4
 0kSENW6cSdxtf/eam8hyR5OebJjZ2K8sJHXtwHQtwwkAmDAPrS8lnXNMpERZuAXLz1tY5BH45F3
 Ygkfagw78+pGgwHrRtxzcom+buFppUaePa9/LIjUP6hEfUrPUxFeiaprIzNnBRir20b0V7orWPD
 dSWJlFopcno1EAP+a83EzmB34gP4U4lD5pL2b1vML+ZsNf89vbga08zmvRd4c4ApqNw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767863831; bh=z4ln/Zq/EvlaymR0blLFOBp
 lOaJOGpOHDKqXZY4y8a4=; b=GnPa3SU+34/sBH74UPMPOLrHz2qYJEa8uyDGLLFSkFFbf9mXB2
 krHxaMWFzqce+xCL6OaPUB7SJZ630hKKM8Dg==;
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 10:17:10 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Kiran Gunda
 <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, Luca Weiss
 <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla
 <atafalla@dnyon.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
In-Reply-To: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Message-ID: <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2026-01-08 09:54, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8994.
>> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I reviewed a version of this that said PMI8950, which is very much
> not the same..
> 
> Let me try and get some more docs to confirm or deny what you're
> saying..
I have sent it for the previous revision msm-4.4 contains the 
documentation.
https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u
> 
> Konrad
> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 
>> ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index a8490781011d..19166186a1ff 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -98,8 +98,8 @@ properties:
>>      description: |
>>        Over-voltage protection limit. This property is for WLED4 only.
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [ 18100, 19600, 29600, 31100 ]
>> -    default: 29600
>> +    minimum: 17800
>> +    maximum: 31100
>> 
>>    qcom,num-strings:
>>      description: |
>> @@ -239,6 +239,24 @@ allOf:
>>            minimum: 0
>>            maximum: 4095
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,pmi8994-wled
>> +
>> +    then:
>> +      properties:
>> +        qcom,ovp-millivolt:
>> +          enum: [ 17800, 19400, 29500, 31000 ]
>> +          default: 29500
>> +
>> +    else:
>> +      properties:
>> +        qcom,ovp-millivolt:
>> +          enum: [ 18100, 19600, 29600, 31100 ]
>> +          default: 29600
>> +
>>  required:
>>    - compatible
>>    - reg
>> 
