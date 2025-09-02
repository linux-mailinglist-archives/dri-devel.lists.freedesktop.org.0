Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257AB3F6D6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D410E233;
	Tue,  2 Sep 2025 07:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpUoSuu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813D010E39A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:43:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5Yh025153
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 07:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fnjTF+IaCjsvagtTVWlYOHKpZG1AVIayRYMdSpwzC9U=; b=GpUoSuu7mKd8Hyro
 /q/p0CkBzAU7HRLqZm4RO77++CCtkoxWiTOPqKHeAPZwRkf3nfZQ/nGGN1e43L1h
 sgGacleD8tpHlRpV1c/mqbwi3QkRvMkb6DRQQtFYytniJATyn6q0ZcM70J+2X3lL
 qeWF9hXYn9z5ZzmLmhSOluSoKl+9zmiqvUqIjsI61LYJwCT56cq/cfoRkZSgLWdO
 86AMe3sbpaxf9DEP3pmAozt979kkE08scF2tWo5YrSK7cFI4k9kMid6FrhnG7pv3
 ojF007vIh5VZVmK0r8iApiz5JXbqdNVorX/Gpk3Obkhm2PVtX0GdirrZxrOlVTbv
 e6LYyA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuy0e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 07:43:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724688833bso2513195b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 00:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756798983; x=1757403783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fnjTF+IaCjsvagtTVWlYOHKpZG1AVIayRYMdSpwzC9U=;
 b=CHmCU1+N7fthYivSv07T9AOUcOsGblQaup/bInCelK1J0qQqAYzkjY50eOi4iuw/hB
 Xzdhv+Kv26LO/c+cFbForreiCS8KeETMoPRGHpMCVrky1POjzXK43goQy+WEYDiR61t6
 HUZhff3hhr1cw7Pq5Shc+IFDb4a64tjileY3baMjax3wuKjVbS2z3KRdPHpgXL1vY1hB
 rNIOhGmGZyVXBKGiIFqJBz1/SXB2fHJwjWAO6vUAXoYz+wYEHhh8Y4urG3v6O+h6I61N
 /F9fS3Pe6Bbd7VEJOINYQq2K4WiT0Uk631VGqw+7hVwVcG14cSWfl38aB0ZXWElm2kLD
 ngwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDt7Za0FImm7Ucxc/DFKIhFz0ycBTZ8op4jsW00THk+enkHIwko6QT1e1FEPnsOb2g9VWc8XnWK9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzdxvkk5GVG/ZERpmqMp+EsFTDbkW0FsGTi/Dh/m/ZJRMUMsK3o
 7JowqRmIfWHtSgGx1wnHST8usEDQzlDlBLbgR/kF8aWJyFknuegul4Of/0EVuQxCtnJunBd10a0
 UYLjMYr0PO6V3OHkohHbYSNK/c99LQS+hm/5dnoYcqP0SsdMB5pqQSqwLlC5m7417aJspAvg=
X-Gm-Gg: ASbGnctXaLNjzCRVUD91ph6HY1tJ7YOq6D766AYmJukkSmsUAZkKipeYVJkQqkUKy7W
 SY68MZAoOYzfEEZF53BhsGs14/KskYGomzezoNXU4CJUj13La3bKZXx33Zqw7ToLhWOO7PVqZE5
 8xTrqO5sb60vCU/UeskO5TTFy82bTLmMm9IymSN2PSYM0vk77Icf2bEud5ALxYV4TPvfw8XrJwr
 mnXb4T6AfMrzXYrquFsBE5xqxsnVp1O1rjXmZz/Xy5UdGUoeetck09qh6+lls+xjmctAtISHfL6
 W/0GO/MZNyTJd1oLYDZPf5A9Abqtd18T5tWrQDqugnJ/57mFOAeryKqRA9+UuKsGfA6aBlBWUtU
 ZHz7GNF109cvxOGVFKjvna/W3zPnMwQ==
X-Received: by 2002:a05:6a00:92a0:b0:771:fc48:7c1a with SMTP id
 d2e1a72fcca58-7723e396d7cmr13352196b3a.27.1756798983203; 
 Tue, 02 Sep 2025 00:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0cW22l8sm4wVKSWuN7QJXzlTLBwumx+hGhHMDLGo3x0YH0EYLjibSDkyAAzWcl6azzB/umQ==
X-Received: by 2002:a05:6a00:92a0:b0:771:fc48:7c1a with SMTP id
 d2e1a72fcca58-7723e396d7cmr13352160b3a.27.1756798982704; 
 Tue, 02 Sep 2025 00:43:02 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7725d5b90fasm4602173b3a.100.2025.09.02.00.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 00:43:02 -0700 (PDT)
Message-ID: <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 15:42:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <20250902-speedy-overjoyed-dove-edf2ee@kuoka>
 <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX9A10Vffy0Vgo
 fGekJ/O2LNy68d6NX3dH1V3tm6+M5B9vEbkKiD1cGjLIrFR7bOqzsWdO9N7Kn7SRPvqtgvFVVf7
 tIyuwZF1vHaZRveiBCy1KV7O/j/tcip0VWsiE531gKPxqx0M+bE9a5tMwxTCXiAp8b/No78gy0m
 etCEQcCraEa1Y3aIjxEemBqqd6k4qhaU9EGCDfq4CXG6N7vu/GBHyiXhHRMe1IFbtERRwIYVLr0
 Eie/+QvUvfo9eRivRb/AURwjoZ9TR2Im7vXYlhCPqj6wmz1k8CwWLj/FlrOjgpHodvsu5JnNSHG
 Oa4lE8Z0HVnbRN+dxszCX97uP7PVTFnP/4K2mXS3pgZRp+tPMeIp2skuwldQ+FeDnnf9snXLTLc
 vOUCBokw
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6a008 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MLVnLUUmlBKzLzVVyHoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: K9pHgMrNG7xrt_qfcNPnw03i3wZsWVEr
X-Proofpoint-GUID: K9pHgMrNG7xrt_qfcNPnw03i3wZsWVEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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



On 9/2/2025 2:41 PM, Krzysztof Kozlowski wrote:
> On 02/09/2025 08:38, Krzysztof Kozlowski wrote:
>> On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              # QCS8300 only has one DP controller that supports 4
>>> +              # streams MST.
>>> +              - qcom,qcs8300-dp
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 9
>>> +          maxItems: 9
>>> +        clocks:
>>> +          minItems: 8
>>> +          maxItems: 8
>>
>> Clocks have only five items, reg has 5. At least in my next from few
>> days ago.
>>
>> Nothing explains any patchset dependencies, so this makes reviewing more
>> difficult than it should be.
> OK, I found the dependency in cover letter (I was looking at wrong cover
> letter), but the dependency does not have relevant clock changes, so
> this is still wrong.
> 
Hi, 
https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com/ 
dp-controller.yaml descriptions for regs and clks have been added. 
Compare with SA8775P, QCS8300 don't have DP1 controller which supports 2 
streams MST, so its minItems and maxItems clocks is 8. > I suggest to 
slow down with this patchset. It's v10 already with
> simultaneous other changes and two (!!!) dependencies.
> Sorry for that, will wait until the dependencies become stable before 
updating the patch.> I don't know how I am supposed to review this.
> 
> Best regards,
> Krzysztof

