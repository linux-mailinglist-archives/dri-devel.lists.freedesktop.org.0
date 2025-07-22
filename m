Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F517B0D615
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 11:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7291010E0CC;
	Tue, 22 Jul 2025 09:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Opxcb8ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874D10E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:39:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7H97b020149
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0X7mSZFr4n9kIrvMvdwIufpEltafXbdIueSaAC9+zUs=; b=Opxcb8lnO+OHyYKw
 mKisAnKlEieMkvCV1KmS3sb+j40YB1jFd0xVbgNTNxJE3ea+w7MGqzjeuiBp8Bm5
 ZMQYzsHiFUFGJeu9YXwDg+6dO9VAhXOwYhyRRQk4gxo13NVmvp2WaXm+Jr4dKUF9
 TCQVzB82HcYF9aQOT9JHfyCs9XX78EDiJRSB1fv6etQD6GXCp53XQsFYpjewHnmD
 wtNhNOCdHJU5PGTC3HtyWYvLTOHNSqZeAb8mtxjH8yzt9zCTcx0Oc+/uSH3CAf7i
 lADDMuUk2aP+vamD51ur0AZrRl/kplc7OzlKh8SyWNfZlNQYmANmRiNsrMtYi/+o
 Ff3IiQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9yacm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:39:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748f569321eso214209b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 02:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753177154; x=1753781954;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0X7mSZFr4n9kIrvMvdwIufpEltafXbdIueSaAC9+zUs=;
 b=X/nKCi0A+QpJt2551+tOxaNVBXrdnj4pLGDe3d0Rw1Yeh1iU+zwXv+60/0kxeptv89
 EcCUJxSMK2bgqI2tsLB8wngoLhxbQMhma3LqAIoTJRSjcTyHuYn7MOmVyQ+6GWJkkfEG
 m4vla6iDDQ9V3mseE1JYmZL4nGlxImdT4oIx3OTe7o9knSfMYo5kp2GoM+qFEhTGPhS2
 /hiYFmav/krlUphLgm8U5CUnOjguqFpvKhdqPB/W4N9JbpWzYe8hjHFMI/CivsUCDr/L
 a9TWSOc1AUOJXDcMsZp5QLVK+h/RGvTanyLAGGmtQtHXDobQ4PSNpqYO/aYIljlzEHjR
 J/FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvE3d6PuOfhYmibg9N54xnDLyujfrAAls9/MTYhfeoVbtjFfool9NidpbMs+V7sJQXo2viZItiyXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb9EEs3nRA35hHsJCeKUAxXJ7vh2hFajmCUIoLcw148Bw4gcbb
 rjrvA9wdM+cQOJ6efqf6/0v3iI3ONhHsFYQz+6x7qVaMvG8ggjb1mlrGkn3EZtye1OnSB0nIKQ3
 j8SIe/H1nDGQVTKIb/i9WxXD5LmdaCZxFAxPoTXxFj//qnV9S07xNe4/YInYQWWLIvmVb2Mw=
X-Gm-Gg: ASbGncsfj/Bg3AkBSS6NyjSJxmhqZayZqKUrMoeny+wP/vIBfr/H/QpQb7qysesCmnw
 THqvQaAeXJlJoe8JgAUJHLQ4wmey1Mi+roq0aZ8oWYPL7uVjbTvaCa73eASyzGFUpusAcsOv6vo
 VwXenpd+xpno92OG4/ltYZRy/zyhfV45vfexAieCKHsG4jnzCIBATDPet3S2l6imSI8eBcit4qo
 ix1rL7Fpat9svurXqhsGCHZ41R3NYurL0Ouo+rSKOuwMiAiwU78i81p7xdHS/2lO1PJLtVvN7Qf
 Xnee3iKke6TVw+gsJY75HNSI48/lldttrCZ6zEbl6hqy6KgDFuWZ0w4XAjzhRe3YJRpD9JSF0JJ
 v20RBitJhVv81PONZ8O/daSg4yldL
X-Received: by 2002:a05:6a00:4c18:b0:730:8526:5db2 with SMTP id
 d2e1a72fcca58-756e9fe71a8mr12334490b3a.5.1753177153663; 
 Tue, 22 Jul 2025 02:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG309WOl0f0xT5Osz89iIc9rjwEya2Gw7AuRefQ4nhG1+/3l19kPlLrow82m3GRjOtFkvaFmw==
X-Received: by 2002:a05:6a00:4c18:b0:730:8526:5db2 with SMTP id
 d2e1a72fcca58-756e9fe71a8mr12334474b3a.5.1753177153138; 
 Tue, 22 Jul 2025 02:39:13 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb67901csm7313456b3a.100.2025.07.22.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 02:39:12 -0700 (PDT)
Message-ID: <66634041-0e31-4a1d-9f1c-920ba583430e@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 17:39:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <5ec480ac-ee60-473d-83e6-c2f25d3d30d8@oss.qualcomm.com>
 <b810f0d9-b1e8-4182-9551-601b248d572d@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <b810f0d9-b1e8-4182-9551-601b248d572d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yFvYfI7AZk1XtfFlmXLRSofgw1wZmOxh
X-Proofpoint-ORIG-GUID: yFvYfI7AZk1XtfFlmXLRSofgw1wZmOxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3OSBTYWx0ZWRfX7GSOY/7xAopS
 EqeB/Fx27rhEP2na0Uc5KbID4ZZwoAYnwNzJkRaqV6hE8KRk42Tj88RGA7CQUJcBNMqoQDLjmvP
 SrYqyJ8y8haFvt8daE3K2Bfbt4tiOo1YNJPEHX4V+/tK5Xafvqy9sEzuOXEghcYZ7a+iZeZ77FG
 8dslqMKbTHcS8mVanncVVOeqCSRn5WKSAKGc899vKIKxAWJ5caZINmkSrghich58xsZRvmcrtWR
 0ijx6z4riE7rkokWDLc5NmiJUJCi7YuNf/squo3frcerGpAFElTSi9EJv1SrvVeIPkPuCgdewn8
 JHTlYv2mLC2bN5Kj+kPzkWqfgxUixYLMS/jUCCa0NrkRdZKz8kNVy9IvN0VbifRPSYGRgjwcHhz
 FdwPXO+WUoItdshiTMClLlLVfZS+JeUgaK/5ptkzqMRI3YYyTlqyfzJN05D0zssMdtUwXhsX
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687f5c42 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YuxCsFRrSdhSRJBAAjcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220079
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


On 7/22/2025 5:23 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 11:16, Dmitry Baryshkov wrote:
>> On 22/07/2025 12:13, Krzysztof Kozlowski wrote:
>>> On 22/07/2025 09:22, Xiangxu Yin wrote:
>>>> The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
>>>> shared with SM6150, the compatible string qcom,sm6150-dp is used to
>>>> represent the DP controller on QCS615.
>>>
>>> No, you cannot use other SoC compatible for different one. Look at
>>> qcs615.dtsi and board DTS - there is nothing saying that this is the
>>> same die.
>> Please take another look, we even have renamed qcs615.dtsi to sm6150.dtsi
> I checked on recent next, although not latest next-20250716. Commit msg
> should explain that. Any qcs615 feel then inappropriate here.
>
> Subject says clearly "on QCS615". Patch does something completely else!
>
> For gods sake how anyone can understand this?
Sorry，I’ve verified full functionality with the DTSI on the 7/15 linux-next version, and also checked patch conflicts and checkpatch issues against the 7/22 version.

Based on your comments, I noticed that the DTSI rename from qcs615.dtsi to sm6150.dtsi was already merged on 7/16:
https://lore.kernel.org/all/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/

I’ll update all related descriptions for qcs615 and sm6150 in the next patch version, and reverify full functionality with the latest linux-next image.

Thanks again for pointing this out.
> Best regards,
> Krzysztof
