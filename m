Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A5B0D597
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 11:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA45D10E63A;
	Tue, 22 Jul 2025 09:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfCiDfZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEE610E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9AehY012844
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=; b=hfCiDfZvIX5K1oa8
 ZKGwkG+iLpv25X/t+UGqea2KZQr1b1s+QNuuYavYNmOzcUWtA0ldyS+kVEo+JzVC
 uODsV03E18gS7vRZV2+Dl1QFWP8S8czhRHiyattAwdYqpDvFIgtIjdPaW2tSOso3
 ZVoDUNOTvWvRxIFC31Koif+uPiwSgBGVfa2b1aYY71OVnxEBa21lygIS2xH2n3R+
 xIrkwmTUh+Rneaae0QBuP49qwsEAKXUQ3QMCYBIzeD0SW5dlJ1dYVhl8xN7Jhl/j
 my6GdB3BuL5q/Xkjiw5bC9c4S01ykE6k2LPajI8P3xM/V/jCaQuYx5jIi91On/r5
 BWTC4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6k671-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e33af599bcso828524185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753175772; x=1753780572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=;
 b=n2xGvlOEelTa+f0+dqOmX5KUvrxJAL1ejxQcKUp+HgVPx5LaDtwjD47lFbA/Z9AuIx
 +2thvLkZuNzXMvZWuZwS+oh0B4YT5Fc8C7j94+VN0ch9t2O+hiLa0zo5A+8y9xzgT3Dh
 6kkzrGvpFQWmzR3h5kClW620axWrdIERJ0NqZSejHFUXJxHssR8qFcHVcWe/45hK5YOB
 kGKB1eVGuNjMHABlDuhaUijEOYnHbBL41peRsJLL5zGE2WnE27atqjBg9Xit9uRqydWJ
 X4oQv7FUyqjxI1AeC7GgL5dIs0gHl1sg8gEoa/QcHddvGAdLFQ6XiQKQWLzXTGVJTfwD
 2bfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR4mcyUsZNVHc1LOvhMpqtBJr93nOWgEkHELv2NEqH73mnrzwjS1QO03Hygj2bmwK3vDDFzTqBVlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCju1xrzu7NnCWbO3qEHVH38CazSbQx/+uQu9/fnIazr6nZgsk
 I0uDoEn13Tg19bXyhX7TuQq7S4D6mPNMdNsxab+QSwioze4QzwGZCfhzuQRn8pIE37IRAEUwrm7
 q+PsYzxqpKS9ZFmtNqUn3m7ZaEY7seMrIClNaBlQPTO9n5NGMKQKQ2kBzmMwS2Lu4HeUgm0M=
X-Gm-Gg: ASbGncs3xU4lIzHxMGSmMG7cZgiIma4selzpb4DCJLDXFTY3Z5xFdF6mf1HdQNZOyLy
 P7FFjVaLwejxFr6Fx8tNbRsTvy3jNu4xUwwjius/jEhG74EmgIUeih3spnNA4nGARBMcWzg6on7
 zfCN6JVwZT3c5ZOSJIW3lwo/3dO9PLCWkv1gmGu8gwyyivPXlvTBUjBuqAHWaOzUuKFxvFl1+lF
 2j8p/wiZpkkokJS9c+0Xn2EgP4fs8Z2rc8uWvS0DTCYK1p5vJIbOu6GDORZhbjNkfyrcUIqWbIE
 yngP/iUGV8NOY7fKvDOopdHfcWnV94o0HHWKsQQNMN5M6SD0YqjL3wHdQHwRX/KuA+QnbAhj1xn
 AeRc5ui2ltcNPTT8YFGc6h+0tpabQYjl3iflmcBxGZqo=
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr2927133685a.3.1753175771920; 
 Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSkMXJjSdY+QbXyPowudZre6Wg+1jtRGLZBt4d77vKPTpJ93H01at3Dm6Ol/RmdyOnjJl5Ew==
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr2927127885a.3.1753175771347; 
 Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f?
 (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d91034sm1867648e87.144.2025.07.22.02.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 02:16:10 -0700 (PDT)
Message-ID: <5ec480ac-ee60-473d-83e6-c2f25d3d30d8@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:16:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
 <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f56dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=730OvTMgWo7gkawVqJEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZuEuo8vP-8Rp8eS5PNXWc0WsLfnYBbsJ
X-Proofpoint-GUID: ZuEuo8vP-8Rp8eS5PNXWc0WsLfnYBbsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3NiBTYWx0ZWRfXwK8ACHISeuax
 MXFmHSpO3TlLOb2VjZNjX8SlKZIzbw96/aPjE/08c5p+byNYBGrN0pkRVmMJOyTcLCvi2rQrMIJ
 ofODrg1w9v9d6dJw46C6I5NfA58lzl8UJG+HeLPmiTXJgwGTHwkLZsS6fVj6XyGv29Msd8RIDJi
 haIM143W9NEgEEUsf5uiFw2b521Eyj692H8JoGOTCTgaTU1eKRv+OLM7wmJwDgZSqbyloO5rcTq
 c2gt7OvtQFp8hQ3CiL2yZVK6ilgEsYkwVUbNm1KdQD4SmULxs+vyVKVuMva/RhG10NFSgpnJiRY
 naiMN1SBAENlJ0jkkP7YDIQDQcXsB8kR3sd5bMiuE7N+kW0lvQWQsl/plxUf6x87JeMGOXVAdUF
 jjEm5HQqHD5TleOsc0Qp6hN52ob2cEs/7oXm+BCIbfp/U/7Jc+hAGTaK7Z++ewo/ICyF+46z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220076
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

On 22/07/2025 12:13, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
>> shared with SM6150, the compatible string qcom,sm6150-dp is used to
>> represent the DP controller on QCS615.
> 
> 
> No, you cannot use other SoC compatible for different one. Look at
> qcs615.dtsi and board DTS - there is nothing saying that this is the
> same die.

Please take another look, we even have renamed qcs615.dtsi to sm6150.dtsi

-- 
With best wishes
Dmitry
