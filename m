Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE0B54B59
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B310E1B8;
	Fri, 12 Sep 2025 11:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9Md+6Sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730FF10E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOxq023399
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7bZSPwCaveiNyjpoVwp2JaCT2rjVag5Jy+2B65HThZ8=; b=M9Md+6Sbi3Z5o7Sj
 0pPKOLsdok6kNB6liuAecuvU8W3GY9mtrWjlG0q/ItPlQY2xkHSECp2X/TphSiFJ
 +kS8eRpb/hE0pzK7m2Eg7gLamreGUY/ohLmuXby/H5sof+kVeg5tmxrzlNCye+SC
 9WPNPKtRVmYkYJw/gkmim3xTDMaKfi12Cokxf/qZSiHfonaMVD9tNDflDi9kXBHA
 1cyMaeGaccb3lQXqd5SPINvOkvYwLQMmiNbvQHTwWdo4/CPOtHujvuawS+b6MTiE
 HVsaAOcCd9+wp3ydOAsl+7JNPcKyjKu0dJxMnib1ZdKKdtXT/QwR6GVFBvB2/sCN
 eJoEmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2fm7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32df87e42c4so17954a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677583; x=1758282383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7bZSPwCaveiNyjpoVwp2JaCT2rjVag5Jy+2B65HThZ8=;
 b=NsmZR8SMY838VRllQPXLAs3NnsMWxLkYExyyr5g599/KIvpduRo60v93eDA4p07iN3
 lb9ki+aOS7fjlbi9tmzBM+hMM7Dg1kb78EQSs/ckAytDTZYlTK2Tfm8nS4IQR8MtGNG2
 fOeReCaQ12WQdcQYRpY/VkLVMc/d6NCuU/oqunbd2CL7Xzmo/8wPUMviAeP+bkJ/6sj0
 UdsNr0ohxwr/AV9xmQU7wYYcOXL6vvM7jDDuyI/76rv1d/sb3QIsFjVmLXyJ8A/xRaTa
 wY4uEyZkcageV1FFMcue/QrmaWFkLomXyk010Bg/gZ4GnhjmITUkqN61s/lpsBcVKu0G
 hlnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkJimtOedBwsy2C85r01/vyNLZMvszvRTn619M5LbLbYq3d5uvZ/IYHwBOg5FYUev0oh8LZTYn4Z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlBL0C1ElomNIhfR1v8yfNu8NMqp58rEKb8ORI39fASm/UcJmn
 j4cevETrbebvDGqvI6VgTXtEmClVAHXMo2SJeHtTNEIOkopcz2Nl6myvc6eD5WT1MieuhBWLSKW
 dCMO50UkKaEbRG/+zZiXxrxiH/Ei0cAzY9RgocSLpIkbWYIqlQCiDEnLWqqY17DXUvs47IR4=
X-Gm-Gg: ASbGncvPXwNjgvmY4yegipGjkd/FLZRp0Mvp7Ly/nUBTcaya6wmGKEj/YSx6XVlIoIL
 AWkGzZsU9n0l/eStlKuUDHDF/6ZIFgqPU2NrptxqhvSxQIvXsnCRXNzXqc2JdWtTUhUTCtb7zqh
 jDdbTlblf3h3iqyQaK5+yGQzBOuG+fKgw+I0XnOT1hT3CmVjN7u4HuawQajuQSNpSKTsNRVLCYs
 fVl8ukjnVlDpGb0xIH3F6BV5eo5eh7JqX+kEQ5ZnYzgrDcBUq5G3HC5Nn7w8WugNAro11njDGfc
 zkV5FKRS4YNeTtIWZrDhGoDepryeP8K/oX1DX23k7i/vYVJfzcWeFG/SM9ddFJMcY+HtfMIzCqV
 Nsy0LKjthHwqGfp/5P/d8DnzO+uoSKw==
X-Received: by 2002:a17:90b:3b49:b0:32d:ed8d:722b with SMTP id
 98e67ed59e1d1-32ded8d7605mr1011409a91.2.1757677583416; 
 Fri, 12 Sep 2025 04:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOO3x9HBu+6RQUyafNlV1VtHCgdpyhgYvQ2Af2AZB8bDMWIdgsW8DZPmtsiC8C+rNUWBKRqA==
X-Received: by 2002:a17:90b:3b49:b0:32d:ed8d:722b with SMTP id
 98e67ed59e1d1-32ded8d7605mr1011388a91.2.1757677582972; 
 Fri, 12 Sep 2025 04:46:22 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a3aa9234sm4626367a12.54.2025.09.12.04.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:46:22 -0700 (PDT)
Message-ID: <d08bd288-6aa2-4a7b-9424-0e2e220f1c1e@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:46:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
 <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
 <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
 <274b27e6-ef43-4597-a7d6-1f948f2e6c5b@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <274b27e6-ef43-4597-a7d6-1f948f2e6c5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c40810 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1iQPH-MNloaYeFAjbucA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8XC6AbEpXNaVyEN2cwyDd1kl-PlkKimE
X-Proofpoint-GUID: 8XC6AbEpXNaVyEN2cwyDd1kl-PlkKimE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX3qMk7+waOVtA
 eTLJhf5PsJcb4pF5k6wrgXGCDuQ0pSXl8vAAG/72zVK4mWntlG248UlKeQ8ge/zXp1pD8AD2MRt
 m+U1XbiSEOTPCmxRg+PRjLhYkElnSh4Z4sPvLFV2nQ452ZpZqoNBBS2SWFC+6/azJMIt28Goqns
 fchLrvwsySdfZuooKbJDN6sfYWvoJLJbTzy3u2dcFnAvkXPQy7STMB+UnBow+qPw2Ag4HYRo9M1
 6A96rSyoRkzkMLLSt1r3ULQfkKuCgiBGPXEVkzoK2V6cyjuo/LjO9UEEuTQtIfVq0kU2KULEkVm
 Vow9ZabiLiWKI7/SIiVMMkHQZdIR5Vo1ldeje++7U6I4GuWwbPjygsCcBLCzXbUqnaLFf/VJ6O+
 XVtDMyWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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


On 9/12/2025 4:46 PM, Konrad Dybcio wrote:
> On 9/12/25 4:15 AM, Xiangxu Yin wrote:
>> On 9/12/2025 9:24 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
>>>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>>>> including register offsets, initialization tables, voltage swing
>>>> and pre-emphasis settings.
>>>>
>>>> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
>>>> platform with its USB/DP switchable PHY configuration.
>>> This should be the last patch in the series: once you add the compatible
>>> string, it is expected that it works.
>>>
>>> The patch LGTM.
>>
>> In v3[12/14], the compatible string was placed in the last, and you remind me
>> will trigger unused warnings for the earlier-defined qcs615_usb3dp_phy_cfg.
>> So I merged them in v4. 
> The intention is that you can do all the preparing first (which doesn't need
> to include an assignment to e.g. DP tables, since the code operates on a
> pointer if it's non-null), and you can push all the platform additions at the
> end (both tables and compatible in one patch)
>
> Konrad


Ok, then merging 04 and 07 with the compatible in the last patch
looks appropriate, will update in next patch.


>> If move this patch to the end, patch v4[07/13] will hit unused warnings due to
>> missing references. Should I squash patches 04 & 07 and move them to the end?
>> I'm concerned the resulting patch might be too large.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>>>>  1 file changed, 141 insertions(+)
>>>>
