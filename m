Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E7D07694
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 07:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817ED10E7EB;
	Fri,  9 Jan 2026 06:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Z3k8rymC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WkmcQYPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD1410E7EB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 06:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767940563; bh=KFBoG2fcIxheggmVM+AQApJ
 yuE3iDl57EzYZzdHaxmg=; b=Z3k8rymCyRPCCIoyqZxbsyayVvG6CGqsrcdjyQLcc/LKkxIegQ
 vPOzZnySkZG2C00gULRdqZb+Lajp/acC0LJkGFAZ4DgeJBloaNsOSvyT5t+ABWqJnJgqHjwckm5
 P7LIszibYJqye37DKObXGq1Ih+0lv+0AZ8y0OYYB8dw0ZqrI6tVphU5bB1KOazs9c/KcUDiAr1O
 DEjiR0PDR2hxgpPzYlL9ufH9LmvCXuqJuDREMPOhJ5RhxFLX45QhCwNAsRnEaSOF132tdVmS4VO
 cE2RxtWUpIWFUZZURRfPCXFMKg9PtUJhpEO692b3YqMiK4ikZ5/6eO3Bm/AZmDKH67Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=Message-ID:Subject:To:From:Date; t=1767940563; bh=KFBoG2fcIxheggmVM+AQApJ
 yuE3iDl57EzYZzdHaxmg=; b=WkmcQYPppQ+K2wEGm8QDA4IprDuJbg1u8P1XyGaIOvv7OO0LBh
 TEfwfdosBtVkxS8JSsxAZ/SmM2HhGojcn4BA==;
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 07:36:03 +0100
From: barnabas.czeman@mainlining.org
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Kiran Gunda <quic_kgunda@quicinc.com>,
 Helge Deller <deller@gmx.de>, Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio
 <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano
 <morf3089@gmail.com>, Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson
 <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
In-Reply-To: <aV-UyhP7wllSBpYj@aspen.lan>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
Message-ID: <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
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

On 2026-01-08 12:28, Daniel Thompson wrote:
> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
>> WLED4 found in PMI8994 supports different ovp values.
>> 
>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 
>> compatible")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 41 
>> +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index a63bb42c8f8b..5decbd39b789 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg 
>> = {
>>  	.size = ARRAY_SIZE(wled4_ovp_values),
>>  };
>> 
>> +static const u32 pmi8994_wled_ovp_values[] = {
>> +	31000, 29500, 19400, 17800,
>> +};
>> +
>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
>> +	.values = pmi8994_wled_ovp_values,
>> +	.size = ARRAY_SIZE(pmi8994_wled_ovp_values),
>> +};
>> +
> 
> Do these *have* to be named after one of the two PMICs that implement
> this OVP range.
> 
> Would something like wled4_alternative_ovp_values[] (and the same
> throughout the patch) be more descriptive?
I don't know. I don't like the PMIC naming either but at least it
descriptive about wich PMIC is needing these values.
I think PMIC naming would be fine if compatibles what representing the
same configurations would be deprecated and used as a fallback 
compatbile
style.
I mean we could kept the first added compatible for a configuration.
Maybe they should be named diferently i don't know if WLEDs have 
subversion.
> 
> 
> Daniel.
