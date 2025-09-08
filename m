Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BFB488EF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7E910E4BC;
	Mon,  8 Sep 2025 09:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPTyTe8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDEE10E4BF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:46:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889PcL3022793
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 09:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=; b=ZPTyTe8JDjkGsm8R
 qG7L0NMJauUOwQ/EbeNfLsXeLv66semrXDvJCoOKmTvzTZt9jlYBGGWdmV/57CKp
 UdCc48t54mAVqMHGUuQG79m0Hn9ru6N0x8RDuFW9drNecY/O9G4zLqrm2RtD2MKf
 /4eHqxibxhGgZEeb2S4Osa+p0b8hcQtgCA++5s3+z8ZSDo93/JtZ5eip2k+DaWmn
 X64VXaSutZqbVjuNcJaoCcSlPdz4YFYbvbWh05k8Y67j/WATUTqjfkboPeALyilT
 odAno1gs4Bq0ZE4pZ+t0/mCxXleguFimcxHiwTN/jzVJ9Q7/hwzTwA5dm/34wSkR
 70pQnQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8v6eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:46:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7722ef6c864so3957876b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324784; x=1757929584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=;
 b=bAqbHFDhpF/kZA3+tTkhodNCAGpdxpw3NZOH1jE7dqdXf2reTYxWWRubS7nRkBNNyq
 8FEMHxaz2yes/Fx2So+i4+UszS7KNX6J2dOIdpnRZh8SpIfovBc/JJB5X25O8mDphxjW
 0gZhY7qlHwbVPwR9fHrlUFdWoMDcI+GnjN5vTH/Z2foUeLHIJg/3fLanXzLLKJeJZF6H
 eFrbcZJC8ykvUEqRO0o/tnuBf705t7xADuZx9UEdIAFU0mVSw9anF9hrluMBqYdQCDKu
 vX5dQyat1hH/expCs8e0e7rA/IOLaduUHSI1yUDFJ8Ys2wjkjohYUVurmu9A5h9MxE+X
 3fBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzfJcGL4xP2qO9bgUtuZbIlwcT3xEt2kjJc+VYPRilKBDrUW6wkjWZSwyboMCot8K0inywS6hqNuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNXJ5Uysv/XQAJaLIF+4MDz8BGaQO+pfN5B5U/LRy3BYsjmJMD
 JdA56Ent/XLJ8mSEcJnyjD9fNZvJNLgjepIVTNgfj4dYvQ3+HQn9owee60haA75UVvjJnkc+2s3
 XGJyQtXcW1MU/RwZ5I/VxHH8owvzhOKLHFL+SqLunqbByDIl3Yxm33dpTH+h2vBINlCeEYdE=
X-Gm-Gg: ASbGncvqi+txUuMKUyA6/v3RRoGuCbQP/i/8ok3DgE5TB2aY8iABh7Y0V75eh1Gn1fY
 +E4yHv5llpnQJUdhLlQ7lkW2/KPaN7VQEhRpVxUA1kxqFV6J9UVo+FFFmgnNzIPv5gM7lo8/8GS
 Bh/Ec6kE+n40XVAG1mG8mgzif9/WRwxZt3MP4T8IJHy1qG9gC8lMHCZ1SRRxi6Y3AUCVyaycbWp
 wTza/6YTtj7uviqeNCI2f5uzRvybo+Rnmd0Gbk2vYZlMCauV7w6hK7hJ0Ba+doIjzYsnIr8fZsB
 AMyZWEBpRyLg/qtCZH6Yuy6Cz0J8EkMH2cNv0fO3dGRr7+QKQKl3RpqdYJVi05xZXrRBS91EKwi
 c2k0sCwXlrZaQOj6+9bi89Ai/NdBTVVc=
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id
 d2e1a72fcca58-7742de9bd71mr7192771b3a.27.1757324783916; 
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFev82Yp9Kr5wVOJJhoMHp/yvgqYrcjDrrgXkQ6IJGt4YT9zimh23alxUGwv5gPyVFAtpkruw==
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id
 d2e1a72fcca58-7742de9bd71mr7192730b3a.27.1757324783398; 
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b65a2sm29336054b3a.34.2025.09.08.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Message-ID: <4a475efc-7da6-4456-ba6a-ef3320fea3d2@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:46:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bea5f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6QMyuPo7PgMWPuL3cUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: E2zQnjKilf-t8eiv5HSLasdqVVHRw_dV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzyF+3ATqD91X
 VxgqtMhdHvDkooxs8MV0ZVdIycPEJeOAutEjiQtX6KLDA+0G9GHYiJmrNrSajW8XL1+GvNdgEGp
 tvl0cBH52E2PPIwt6BU4ATtd2DCFsAFFYO2wMd/05xlsXBVSQPsF60IVpYs6Umd3552CQ2eF8hB
 0VNq0PWK6pK7nIs9itIBksIytbUH4RbUYj2ATAvMhjexFPNLrmUiuAQvbZWAKWNx5OPv5Zsj2bW
 rIpSvjhtLpAnn/KmwN0IwY8IDdzXRJJ+OzRJNXoxbfRgslHBGkQzeUh+f8O2LNp5KuOojrbQo1l
 orfX6GUXKCeoccgrWvmMKHUeyMYB/TYByF/UqwRnawWQxfYhn9z6aFE7202F/c1YjI53HZkiJSO
 4o+9Bs9h
X-Proofpoint-ORIG-GUID: E2zQnjKilf-t8eiv5HSLasdqVVHRw_dV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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



On 9/5/2025 4:25 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> that supports 4 MST streams.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>
>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>> new one?
>>>
>> I think we can not use fallback to sa8775p, since we don't have DP1
>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>> really used). So in the hardware, i think it is different with SA8775P and
>> we need a new one.>>             - qcom,sa8775p-dp
> 
> I don't understand how this rationale explains what Dmitry asked.
> 
> Why number of IP blocks (and this is DPx, right?) matter? Are you sure
> you understand what compatibility means? Please read the slides from
> OSSE25 or just read writing bindings.
> 
> Best regards,
> Krzysztof
> 
Sure.. I’ll discuss this further here to make sure I fully understand 
these comments.
