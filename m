Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA889B45470
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 12:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F5310EB6A;
	Fri,  5 Sep 2025 10:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhf1vyfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C6410EB6A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 10:21:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856fZ5v032388
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=; b=hhf1vyfzR3s0A5fM
 DAhvWijlnL9vn8hTAJrsAS/QJdRIOzhUHe4DNHvnBAM8c6AlYh6iIUH7pJtEFPQ8
 0W8Qs4oByESPGxBuOwNPJhtOEGmpRK2+H5KNJf/n+NNGQBqGnz6ex49pvHYybjXH
 kxSnv/O2nXS8q3iEocuDlNoyLETuVmh7SPehXjajgThSuYwgnk8O61mLDSz7CqQm
 hkI71xkbjw9EObY1O7inRyc3U/U9yYF6yfqqFgu2yUATzP3N0/ZgjkdL8xOc8vOZ
 c6D3WLQXrPYKgFRfHQ79XI5Pnt3JOGEOoFrLASo8OVKMl1/74j9dkudyDdA8hRzz
 0pa5ew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpjwcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 10:21:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-71690f61ac1so2574746d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 03:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757067696; x=1757672496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=;
 b=CCD/q0Sk+TNt0X0n/8g07rmZsBPSIAcVJ3CmtNY5MeIq+KwX0+W54jklaCtj7hVvkQ
 wkjbyp2jGSizFV/+0QpmXABqBgXZCCZjdp1ylaHfqelCHWbEq/S6WbsPx4HLlGNspIlD
 LwtRYvjT01OytSk0mByN6QsCrIyPgmn2oVBwMAKR2L5+sOoRAHqIIlBPTEXjYR/hHMHY
 eYjWdT4tfu06TbptMHsCFFS4VVPP0Hv0+9bSaC8uF2iHDJPPK94SKAiuYPaE22WgGjEJ
 2CEd/rRJVT8Rh0ySW69p3lzD+Movo2kooikAxKqZgYr8T2t2OMnaW8MmquujVzH05MC/
 JVvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWCNsuk3Tqg8mOyR3xrGV0lMgc/E3P9UtPjJkfGAZWGE8jtTXR6VfcdcOFN+DuqiBzu7JU43hwESw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjxMc/1tA7Kh3QbT2EAM3BHNE2V6tpmkDT7MZZzvTLBdjuGOgK
 nH8L4ZIjHyyZiOOvHqx/KNkV9wrlni83XcAAkuOoatVhfq3LaaCTGoXies2ZmPvTMkrY0BZy/89
 X+SYY7WL8B/bCbgqdua+FMQOgFMT1mb58eg7HjDwH1p1OaHMScXUaVtGLpp7UM5BFDtiF8wk=
X-Gm-Gg: ASbGncskrpLBSYiNeYN+fWqAWvxazxWCMzE+TaWsZDXiWo/NlMaPb0LUHXn2rH3idc1
 Y34c0nNC63kmM7Q53OcbedeHtdKO1lQRw2qZs904SqygFKLZdIQt61NDi99I/IUVXX9MgP2E6Q7
 Hn2gT5DehYRHq6ehjAYNbqu/ffsnONx+yD9aabxJ2y8bbrTwZqTcJmAq3ByqmzZoIZK/kFY6sGe
 D3jc5Vo9xfqMwBQMqrGlc+3qS1AQRBNXcZBRiBD6vQ/waaOzT0W4MXTlVLyY78J8Ft4g6kgT4w2
 fu9GPhDWaykpYl1agp21ZQdkpOQ59RB6Omn8Ahek7svlsKEOg7tWiDLKmhtkzmIzhYqlpp+Thnv
 gD3p0EswY5gFbAx5Wwrqqqg==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id
 d75a77b69052e-4b495d11860mr62588831cf.1.1757067696158; 
 Fri, 05 Sep 2025 03:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsI15M5gOFq5piSlzss18AHTX4GYCxGcCIZkv13DSKshZ+1CACZN6exOPR+BcJ3u0qTjcFRQ==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id
 d75a77b69052e-4b495d11860mr62588541cf.1.1757067695509; 
 Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm1249620566b.21.2025.09.05.03.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Message-ID: <2408b467-f1b2-491f-a701-4e45e1a1e823@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
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
 <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SOsIfRqMDd5kTIP2XCeTWQN6h9oAkwzA
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bab9b1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=QE2y9RwVZUYpaLmqgykA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: SOsIfRqMDd5kTIP2XCeTWQN6h9oAkwzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX1vM5IBou/E3J
 FFTXDh1XbLQny8N/7Q48FZUSdI0t288i67Fh0Hy959g+gUTK+DfY1GglG1c9HGAR0THuxUSfYDm
 R1C9sJuPODqJZW6w2ZXa5u5jYE0ofU3pFl56xxveX8JaEYSQzoHIAihSmZt2hue2lDrcr3egI4D
 Pl9QI0VyJfHQ7q8ThKb7CrSM87jj/UDEc4mnqItQC3/6iPTZ8VxWKj9BuM965cAJbzFuP0pXa4h
 ysTvb4yaYYaHWx89WUO4tgudW6WV4aX0HuAyMUTrW4PDJtEzzebQJ7Gf7ITy5zUx6vJQdfopc/P
 9rB0qjUl41EbtwwiHfhOOQZdHH5KfoijhgC6MA0hHi9ZwnQHrwr/QWnig+gTYKuPkcyavMB9ylX
 5cgBVz7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..03801b174713cb9962c10072a73e9516abc45930 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,15 +83,11 @@ leds {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam_indicator_en>;
>  
> -		led-camera-indicator {
> -			label = "white:camera-indicator";
> +		privacy_led: privacy-led {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_WHITE>;
>  			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "none";
>  			default-state = "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
> -			panic-indicator;

I think panic-indicator may stay, as it's useful and mostly mutually
exclusive (bar some multi-OS use cases) with the camera being on,
with the comment above it obviously being removed as you did

Konrad
