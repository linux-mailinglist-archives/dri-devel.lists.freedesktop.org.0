Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C396D00B6D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 03:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA510E30B;
	Thu,  8 Jan 2026 02:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="FyYQRWjU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qJJrC6Bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7C410E30B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 02:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767840161; bh=2lSfWiQqDeO7HMs59Rd2an6
 RkPZ8CLhIM6e2qCA8PNc=; b=FyYQRWjUPUJl+YHpvA9ndH9UaO/P+F3yqmDcTfkaaSJiJWV8Fo
 tU+GYbNJvEsPhXvdF9KBX5JwMU6vaZyTM0tcMAqhNtyLdq/EeJCNKtmGH9mMwVs/G7rwOu3r8YW
 BQlM3KGZdmgRFnojSr8puYhLnTaMjjTcyrK8kdpOEKhXD20VAdksfGD0erIki1lDtVxWYBYK6yh
 LgzA7ptyXdZMRoR1AH/ntfk02qlCnxuROLmoEbrJlroR/PeMaduFy6wE1ssxxiAt75UbOPMTdhm
 U2OB3Rc4FouIVhIPAjvsRhSmXYie3d8NViMgZIYTjTG4KGtMUDFGL9T2itTAHthM3Uw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767840161; bh=2lSfWiQqDeO7HMs59Rd2an6
 RkPZ8CLhIM6e2qCA8PNc=; b=qJJrC6Bu+IUBZXn4NkYSSLnaYTABUCMbcM5YNh3hL09bLNZ3Cz
 IgjF1CZuWptRPdkr/6dx8gl0cTpit8LFUTCA==;
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 03:42:41 +0100
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
Subject: Re: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
In-Reply-To: <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
 <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
Message-ID: <95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org>
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

On 2026-01-07 15:03, Konrad Dybcio wrote:
> On 1/7/26 2:31 PM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8950.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml           | 20 
>> ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index a8490781011d..306fb6642617 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -98,8 +98,6 @@ properties:
>>      description: |
>>        Over-voltage protection limit. This property is for WLED4 only.
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [ 18100, 19600, 29600, 31100 ]
>> -    default: 29600
>> 
>>    qcom,num-strings:
>>      description: |
>> @@ -239,6 +237,24 @@ allOf:
>>            minimum: 0
>>            maximum: 4095
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,pmi8950-wled
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
> 
> Out of the supported ones:
> 
> { .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
> { .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
> { .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
> { .compatible = "qcom,pm660l-wled", .data = (void *)4 },
> 
> I can confirm both allowed and default values for PMI8950/98/PM660L
> 
> I could not find any data for PMI8994 (or PMI8996, the essentially
> PMI8994-revbump), but it's very probable that 8950 is an oddball,
This commits add support for pmi8998 and documentation is telling which 
PMIC supports which values:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/commit/7a1b6d0276828f270180db40935bb034a3470865
TLDR:
- qcom,ovp-mv		: Over voltage protection threshold in mV. Default is
			  29500. Supported values are:
			  - 31000, 29500, 19400, 17800 for pmi8994/8952/8996. (As far as i 
know 8952=8950)
			  - 31100, 29600, 19600, 18100 for pmicobalt/pm2falcon 
(pmi8998/pm660l)

> so:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
