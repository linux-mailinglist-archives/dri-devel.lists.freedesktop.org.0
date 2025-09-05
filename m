Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC0B45460
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D8910E089;
	Fri,  5 Sep 2025 10:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDWdCbR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118510E089
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:20:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58575D7j003771
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 10:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=; b=iDWdCbR5bU2UWlLU
 y4vO0uzK/G082CYybYH9KBDzkgIiLLuDfn9q4i8gWqER57Y7OtZW00rEBUuV6zl6
 Om4lUxRVewiEAxwZcqBC/hI6b6LtQgKMb416nUV1GcdIVpDXhAYBjI92I0IsjrEH
 ZBqtY176u1be2bt5W7cnnS40jG5Fh4SAJgBtc7bu/7TtEwiOVF6JHtASmiEXYg/j
 3ECvhkR55a5XHDPKKs7zB2jpTRjsUpNn5sl1hKCctVkD5/KuWPT9bIcKyZGj/zXG
 R9N/qQJ5yquVKJBOwkqppq+Cpdw1sCokN8AaSlwshVaOJa+bZaseMXoRtfbgV9g+
 FWlV6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8savh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 10:20:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b3037bd983so9488441cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 03:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757067621; x=1757672421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kTOVAGfJmHAMbslcDUKw3QbQxdL6mIKaKsV42CZz9as=;
 b=GuSGiyQcUfKnqy9NHMaiX7DtLTW9vpFQTcOikbcs/u4lUcDeHE5mgOby0cgK5hvtX3
 LODIXBEB9EHmwm8KPhgveZP7o8EcRDgYM78SQk7wWZ3mUQsauua6Ug+73LQIc7Sv7Kil
 iZLM/W61FcElfo9Tv07CBDuROot5P2X5+1rDwsCT7XI0mtvudKxDxVx07CqLE7dz1Csc
 HwXR6nMsq9CRoT39JMBiqbl4vGxVp14lXfok+rGGarFnvfZTRalRLeXuhy5zTII/x4+t
 sstD3Hl6TCGni69v7jSbuIkTGQZX/O4fuH6C8J8faJ+ihmbPD67Wm/3ZLkDurGdMHsm+
 Ydtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXegmcibXp74B8rgxg4fj/LTbcR2qJg3yLfWUgiMGpTOZkbbKcvEc52IkA6kS21g+i1Hg+Jr14bqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaDwKpbj2qCCNC3uIq8jIgVeUTBfdOsQ+JlYhnFbYP558Kng7U
 6hFqjMQ2HFEL2KOrwR9Xz0TSOD0wZNzIg8geh2jzS5FqfaXmkvCZadtYWvMOuyyLn7D7Sm0mW6i
 2NQ4ubvyRA+b1kj5k9exB6tfw5Dm7L+vjtQIdYKrAJ7wvobzaxHnFVADAiH1D78uoAzAqOpk=
X-Gm-Gg: ASbGncuampQE4DZMKTsgL0c7Ikgq/SLm/9fTHc94GJtFIOh1tqXmrlqG40V4dEZjrmm
 VFIm+pbDE6W2m6AulPhoCECxWsLHtJ37GJ7Z3VJ77PqxPlPP5zIdhkjFLgcY1NnHPQVmdYYE7ZM
 70y+OhGxc9tRpcA1E9AsN+uHyo+/wxavQBIgD3aHVBPJs1UbCkbbTBy+4Yuo58fNNN/onzpjNm+
 U8IQXAd096POfYTa2C3zgU+iGgjsLG13+y1miLUwNpPFvHDRFHtzrzzPL8vVGpHASb5pWpIXNsG
 S+2lwRq0bSvTAaMzwcegr9as51gEZJ3K2tTxy184rNW557NuIxQiAI1t3BHpy7W4vMHW3JxQQa0
 7h+1Cap3PVZaiiLIDtT5DNA==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id
 d75a77b69052e-4b48e4d6f04mr83378761cf.13.1757067620971; 
 Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO6Dw5E5OGVqQHPhLnTT6piTScFBZOcK2M8RO2gr8kQRnOFlQeerKrV8G2BH+P30VO7Bu8Lg==
X-Received: by 2002:a05:622a:1483:b0:4b4:8e4d:6671 with SMTP id
 d75a77b69052e-4b48e4d6f04mr83378341cf.13.1757067620108; 
 Fri, 05 Sep 2025 03:20:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047373b000sm497098966b.68.2025.09.05.03.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:20:19 -0700 (PDT)
Message-ID: <e480ab16-bf98-4a3e-a7e1-67776a598201@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-1-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXwKb+6+NF6iGX
 lMNnlo+jtmGv/q2YEsDQ6PDtP1rnnLazqPEYHLDgZmhJIHnnfgYi2yw6tfT9riBjsaCQjlMLgqU
 IwZKiJp62sxaXaeXGXX7piSClwrh1XrxoZrMeEYjGsh8Y7mkkop9LeKW1nwkR4DoD1pFs4rKdIG
 4HDOBVq01Yh+eBMTEpcPBJPBWm14d+sXWVLAusG/LdTuowRRK/nbWq6FbJ2PsWN+/sez+akEDO5
 O5R7jBycZO6eNzpM/uHdYaHf7p8UQlvRKjk4uU8+QCFIkvkc6b4//G1iqxO0nI8VXD9sJ+b+B+n
 hikARPQh9CrI8k1exJHwcS1+S0sbmdRfe9a4Z4n3XHQCe7J4JvITqb/QADpb9v2wJ3RxRl57zDO
 ljOZ2wOf
X-Proofpoint-GUID: J5G68QtWCEKPRAgKuT7nL7ZHDwMsp8Dj
X-Proofpoint-ORIG-GUID: J5G68QtWCEKPRAgKuT7nL7ZHDwMsp8Dj
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68bab966 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=2ng2SV8iM2HKWhXzYmMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      camera@36 {
> +        compatible = "ovti,ov02c10";
> +        reg = <0x36>;
> +
> +        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&cam_rgb_default>;
> +
> +        led-names = "privacy-led";
> +        leds = <&privacy_led>;

property
property-names

is a common pattern

I know this is just an example, but people will copypaste it

Konrad
