Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA7B51785
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1FA10E91D;
	Wed, 10 Sep 2025 13:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgC4HxJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1010E91D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:01:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgpDU022148
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=; b=LgC4HxJdACiZFbyG
 MBQAE+rnW0NKD3ZlQlnjLhAtpjtWzKyCQKgB16OaR3RarZ+ncbEHTVFvnRLLVKJJ
 R8AbzTAt/vAdmrElde1j/5a//MibhbGMe4jArQtKJhuAUAJ7M+IkQjqTdPGIfyCP
 Gi80tlSOMTtiKgUhmtcu7SyU19FMZQA8Xa9rMkhiX6l0kTkDXU1fv+iWI5O5IPVP
 99L1KLgmulpc6UszGIetpXr2N7UA7bwC5UIyf8Ibdaq1ULK54GB6YGKiyppeGQOr
 MOxCDBaxkf6vUBtQObYlZVhDPWQIffz6RDZJ8KJaDvKiSRwysIqiYIjhHaKkTcSW
 lnWaDQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by93vxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:01:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-74910ab069bso4616356d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 06:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757509260; x=1758114060;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=;
 b=QvYJulywDH+F5gEvKBCSKslleFIarPPWq+YRWNWhODO9If5EvgbyYcSm4KYvaWSma5
 bOX26xP79fG3+VOAane4My+yn7BmBsPIHot6cVdfGfQH5zmJLVm06kzdwlwfLVLrXjSX
 4w8U+T1/3HfuJQEAcvqNCMeD8e00TC0HknrlAxgipRDWFXffJ+F7yYFoXiSEaq7kigDf
 8cMV/XYjwWUJ7pya6hKtjwVdh5ryfxwJgVHpTHG9VgCTklMEMV1ltkiE5u8MaI4Tcy0V
 zUn6/sgeWsiuIYMNHsC13L38+zVhjR0RAh2eCAivzYRPho4z2qz4V428kIEOTifzkQ1G
 JFbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkTP3iAa/T4USrdyyUuTl4wLHj7z0l/aJcWtzw0W3tE3C08ZYphfoLEsuSyCWGL5ugYvDFDaZsY8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBQ22P7zSdv8pLi6ZfbC+lX/TY8nrNDwL3re+LpJSjUIH2bsXP
 hcyTDim9DS6OhVaM9DAk2qkyocOEWGjikzJ4uOpFvVr5fJ+En5UM+st+ipmcFmOEMQq25LRLiZS
 IeOIJQd7IfD7HdAg2L4jVUr/381MsCEdgwsU716X1bJmLV9RUeN1RhalnzMXlx1Sk355Gs1E=
X-Gm-Gg: ASbGncsaYGdCkcz7WB+r1KzOWBSMjN9ZIN935xjkxe0LayjUvivEjIsy6dFE0LcPOO6
 wQ3bUnRCK3vAQWCEjF6WgmzRXLcZRrLcGi98rYtmq8JbqNNBLAG6hKGl4OapTlMOxROfHZIHLQb
 fyt7QWFYPZN1rjiGazPRFp+5o2FkcQDxEkSCP2ffwoZfFjBl5UxCWjVzU9pVFAUsE2h0BFoft4Y
 1N5KTN9AYntLF1jibRgtEXPN+byja5W9k1wp35DRHGEeHY+RVZEWLgwXNkNvLGuR5hU4tafFZLq
 lMyHADGn8qlYiOQXlUYj54/SfF28t8Yor8JKuVl/mrFdEJzYFsrnTWxv0c3xqwBS6RZ6X8t+5Jt
 C0fwVQTi+we067birzsBU/g==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id
 6a1803df08f44-75a9c0b6dc2mr32858066d6.2.1757509259835; 
 Wed, 10 Sep 2025 06:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGyPmSFM50615M6RHwW4JfpvtlFW1/WulsS/UQRD9mfp3W+5WGHHqGDBmhseR7J3icQ11+sA==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id
 6a1803df08f44-75a9c0b6dc2mr32856966d6.2.1757509258861; 
 Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c018f6a7esm3289951a12.42.2025.09.10.06.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Message-ID: <634ae260-3a7b-475d-b40f-47401a70a53b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Daniel Thompson
 <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
 <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c1768d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=I76Qk8w-AAAA:8 a=vFEzn3JI1hsOnF_rj58A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: oVMPxuRQJiuA3XNDWR2gOTQSiPiGFBIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX5cG5uBeBtRso
 WZVbdp1vWh8FGq3DI6SkDyOPZZgLv9ROI/xIYMdJTGK3a2/6JeAxA/9Yrez7S/4EuhQWzniR0kD
 RDlF8Hd93FKmrA4tJ9T7XfFVdgbhoXzf7QIyyfWlBNgVfd8LckkngHaSg/0T6Hkks1kFqTweuDb
 RjBFaG0rFK6LTGVog0kqXxozl/6n5QfXHKDeAwzWlbvBfxOmQe3Ryjl2MbJSy5VpcYZ4oYu/xON
 czBjAFKGgUodlFrAYPgm49XtdQqdaalj+JVbpif+TgXAphbif83xQ4cmSOFcP5S8DLy6AdLI7IY
 IGVLipq15+8SZ52LGro
X-Proofpoint-ORIG-GUID: oVMPxuRQJiuA3XNDWR2gOTQSiPiGFBIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060018
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

On 9/10/25 2:54 PM, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Wednesday, September 10th, 2025 at 14:22, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
>>
>>> From: Hans de Goede hansg@kernel.org
>>>
>>> Add 'name' argument to of_led_get() such that it can lookup LEDs in
>>> devicetree by either name or index.
>>>
>>> And use this modified function to add devicetree support to the generic
>>> (non devicetree specific) [devm_]led_get() function.
>>>
>>> This uses the standard devicetree pattern of adding a -names string array
>>> to map names to the indexes for an array of resources.
>>>
>>> Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
>>> Reviewed-by: Lee Jones lee@kernel.org
>>> Reviewed-by: Linus Walleij linus.walleij@linaro.org
>>> Signed-off-by: Hans de Goede hansg@kernel.org
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>> ---
>>
>>
>> I was thinking, perhaps we should introduce some sort of an exclusive
>> access mechanism, so that the e.g. user (or malware) can't listen to
>> uevents and immediately shut down the LED over sysfs
> 
> It is already done by the original series from Hans (linked in cover),
> which was merged few years back. It is also the reason why this
> approach is used instead of typically used trigger-source - that
> would've indeed allowed anyone with access to sysfs to disable the
> indicator.
> 
> As per Hans [1], v4l2-core would disable sysfs of privacy indicator:
> 
>     sd->privacy_led = led_get(sd->dev, "privacy-led")
>     led_sysfs_disable(sd->privacy_led);
> 
> 
> Of course, this security only holds if one has secure boot enforced,
> kernel, modules, _and_ device-tree blobs are signed.

Great, thank you for this context

Konrad
