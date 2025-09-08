Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4FB484F6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46AA10E091;
	Mon,  8 Sep 2025 07:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZfEPaaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A734710E091
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:20:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LsCbs013497
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 07:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=; b=IZfEPaaIDN1l1x7T
 TnF1MTF+bRDRHQxbUua0ygSd0wlAkRtC3j1WrZRPaExv+OwbqMdE64KkYmn+QCQs
 RC8rVme6YhJB1Hsy68yssndvDzHpyAbOSHNpkcueZqfCvgAp1TCD6aebERni0Vez
 zWkLr6RkuDPBvmWRSah/ywQzw+d8Q4/IXKDBhwuyan4zzz9L38g1ImRJNbFjJP0R
 JdXCKEHEAxF0011/Igk+GEy0NopfLO5xRLSi+2te9Gk+E5pXGakkpxQVMkYaLuf4
 4jjhtJ4wLrzgfXVQB26W8Ftgje8vJJ3UEpFTKgPRpKudOlUI31Skz60BoDTdUcho
 ll7Dgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0kmpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 07:20:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5eb710c8eso7425431cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 00:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757316005; x=1757920805;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=;
 b=VBR+CUMwSHVDgN80ifesjj3ynBhIHt6ctb7K8tzp8xR4Z5dV5UOl+OHIjKahXL4n8x
 qi50tfqE/TmFELhEy+rt8K2QqYOajvqccgFUtBfJ7Cc+ShyvlhTQX/JRnmmKRGBVullJ
 9WpOGkS03R4jazMq10BHhiSiYsyloVoLqDqIijH/QByMdHCQnPFFIiF+FXEjI+jL0G2Y
 siwWIe6NSujUMLVisFzaSx1l0MkEmgG0HsZ+4begF3E50XUUkBhTBJ+wRN9YAJthht7m
 PkY8thwRO4Yj9uy7fY+pcq5rMoJA0ddGzweUu2llYU3BSrzPHmZl5XWo5I+NgtfCsiW/
 dPaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyWYwkWKe1l9YMyquU9wJg9TS+J0ZFezKgn1F6cprQzKQjN46nPZsTPNn1vkyUE2WuxU9h6HVRrx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB1vOYYDb0LlQkqeRfL1OPDIOEM+VOySnpKhLuVhcbJGR8EDVv
 0liqu8GXPA5lmGHYNUmcYWd2R/POpeIHb8qTR8Cl2EYkIIUAUCI2qgsOx6MUwYY7O4YYLoYTfUz
 y7hUdEi+WhfwKRm/A1Fzt3SeFy+d2g+DUM5ATD1N+HBUEAltIR68JNVvyIu4HTveigGMTZ3g=
X-Gm-Gg: ASbGnctZNi+XquTQ9qNMe1V1pGpFK3pp2Ps016iTKkCx0v+bjxtNQQqJatS21coulwz
 S6mvFEzGAooDLEnFAzw/Qcn8w3OZzBTBCrT/ec3Qy8pkti4ky0D4zYJtUB9hN7v/osKfHRbBq/e
 8mJ4Mjv6AFmaS/4MAvX06jGtIkPjr8u94tDFdO5FpmebZedMIxKRYiPW9P3uFQfpLXy7Tt1Vx1r
 hxXz6UW1k9NvDoqy0CbFc6Zy/NEe5CMpMEcQ6cylUWQ+MVdGdHCvv7gRGO9OU8KAUfVr1yaNEjM
 TvjBtm/fEExhJElDXYdkMPu39dzcSZjJpqzvzBvVMin4enxlBeI5cJec2duEqVAzEBjyMzAoYZl
 8Xy0GT0Ntc9OacyOgYVN73g==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b5f8445af1mr48142071cf.1.1757316004480; 
 Mon, 08 Sep 2025 00:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+QiJyueOpHGD01U7ZGb5pGulY2uWYz7NY7jH/9d6NejQbnMKqPQkDJBKht2O5pECh1Hjng==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b5f8445af1mr48141961cf.1.1757316003978; 
 Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0409bf055esm2172292466b.85.2025.09.08.00.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Message-ID: <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
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
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wlizea1E2p5xiWZCNrqr6FSnUpENi1rG
X-Proofpoint-GUID: wlizea1E2p5xiWZCNrqr6FSnUpENi1rG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/5ID7s004ljT
 E4A2LaJSw393r8qX8H9DnaHLEGIyy2XzCAlDiF41HHvPBAfeM7wOS9wYed9mW/G4eJ7jsYTp3Wj
 74dl1pXWOhU18hNdZuouQnDnmQQGW2TWh6bwAcPzWtNdOwLPltcy7r80jhA2R6muV5e/SQ5mF2o
 sYybH8RAFddQWCg0QObd2A38DJXnw/5ZHMezOdhup3iowjr+aYreS3cI9ZoaqmP/FvuwagDH7wv
 91RCz6fXiaIYfJ1eUpVBzClb36vh3pfjZYMtaTjQMGL1XnVejK59Hk9Zr0zJUTPkam9tK4s56fo
 VxC3vILZpr+YtgHg2yJNDw8bQ+0H0AbuVDuNIVfrQUfHMJFF3vrhhzX12sOL444TEHoxUxfdJbq
 ykYWXjRz
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be83a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=zDPauhyOtcwAXlC7rdQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

>  
> +  leds:
> +    minItems: 1
> +    maxItems: 1

My brain compiler suggests this will throw a warning (minItems should
be redundant in this case)
> +
> +  led-names:
> +    enum:
> +      - privacy-led

Nit: "privacy" makes more sense without the suffix, as we inherently
know this is supposed to be an LED

Konrad
