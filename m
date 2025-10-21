Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFEBBF5797
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D8D10E1C1;
	Tue, 21 Oct 2025 09:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPEXYGax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8200610E1C1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Djhc010829
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gtYgfBJiMiBp1ITu/OF7uYQwL1eNKdtPSXCX6k15khQ=; b=PPEXYGaxg6HgnYS4
 pID3Cvgf1vrHAo6whXQSqPz5HEYgczqmuNMybSojMbxt+dkucqgzJoodUEPOlL3s
 l4xoc7KNPWDo3VYnt+31ekIiDgoDWSiYvzgLo5P63VXkqC1l5fMPvlkgl4MxDBxi
 cNvZlhoDSaSWZowEbSlJMTLWXqf/gRmCz3amorDn1Vf/06fg1kPx+7SCP8CoZymH
 cs1QYfWEXUxbLPvpJju5LR62nXAhiAmvVsbcLZbhNoi2j665vhQUu9nQys4RA30E
 5nXrPO/7LLmt7dn8PXH/YivfNAJ8GnphdP9FyLr8u8LQfdUJlh82wWyRuwUDdUwV
 eJDRKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgetcvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:21:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-883618130f5so262547385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761038514; x=1761643314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gtYgfBJiMiBp1ITu/OF7uYQwL1eNKdtPSXCX6k15khQ=;
 b=J+vh5T3V10Ui2aZZQG5PiZHj8XRHFA5H7ePvl0egN4qVBK+3FyRRc8UqOyrp/xm3xC
 olOAlXmmxlE8QgP80pEOy+Od4uaaM9PfXZ5SEAgfCTSFx3mxXJmkLgVoUYk3JWU8DNMO
 7pokJ07WwZUpASbPeDOfAP+lA2rNatPPblAIYDfUl2/W6HDl+WOJE0vKcxPSDqpdtJEv
 knzjgpt0eW/zZyn6J2Wi3TE3YdTsT5hx/CpUxwjDzY9iO+bFhJcdRiVlrdQhr2Y/9Nw5
 t1ORHdm7IR/l8danjbjx3BOlsAbA9vwEoV3CfkwgaenIYUd0vU5qjsILKJDvU1gj2qAu
 QYkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgqDt6wKWckqN4CLF5zArFpI1hbS7EqhNxTsi6LSV/vqZEI1biOPImy7Jo1HUJkdnq+sLgamsvVl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhwrSTbStc4uaUikkJE79HLuOsPBn3xrMzU+Rlb12S1ndx8gGh
 faav1fFpfQRPnu9PvFvih/uMxGepDvRPjERiEmbqxYH1c1gMLr0WpRuL37kwxSdanBWYA/Ryv2U
 QmBk9NmWV9wo9bvFhhpudWZY9BHwgXxC7uHUGdBDfjYmyMUykZMLQmfWlflbce4/jjbwUgW8=
X-Gm-Gg: ASbGncvxmD1IK97iU+x0Iei2YL4p6TMkfZr41GKHaTvNnVdFA3xPrN3HlG7sZfD9MYM
 WLKGuS7CRICnAa+qArpvgoWWP/wEmAAMR09+jrK3ICiuBcdU8MjRSebCTXTbEWp68cJQwKRZX6y
 9cN0bZLTokEO4jcnTmFH7Za1/JGTHq8ttDP2HvipifGVO9eXJ7SFIZN0Xb39K1a8oTHhckLNgTD
 pyS2CIMNU5WfPQkjc3AjPDx8TAOQryHzPxKxSdUPbZwZ+C3iGQuBVL3rjhofWfxW6voWJWVReuq
 7hNKQ2nFiNy3TRp3eyDw1/TFtJXXBuWikuuVj7miP6blxA0xFoSvJanTcudhcFz/avekrk+WD+7
 H1QDFbZxTpZYEwTZW2JvRu5XM7bmI0GLbzUt2HEP4d+r5MVCGjeSw5d7O
X-Received: by 2002:a05:620a:4556:b0:862:bd48:923e with SMTP id
 af79cd13be357-896e1f22803mr204772385a.4.1761038513671; 
 Tue, 21 Oct 2025 02:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyRgyrhR42atC+DLLdSulKMeyUrebbaa2AH53YBYgQ1Ndfz9lEI8czuvc0fAlmCABfGCmvBg==
X-Received: by 2002:a05:620a:4556:b0:862:bd48:923e with SMTP id
 af79cd13be357-896e1f22803mr204770785a.4.1761038513109; 
 Tue, 21 Oct 2025 02:21:53 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8581780sm1010151266b.31.2025.10.21.02.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:21:52 -0700 (PDT)
Message-ID: <7bed8dcb-279d-4bc0-bc9c-706ab598bb2f@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-3-92f0f3bf469f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-3-92f0f3bf469f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BZv9FuZAVF-B7AurrCgDgIsKS4oGTvIJ
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f750b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jvkLkXCew81jr3KDB_IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BZv9FuZAVF-B7AurrCgDgIsKS4oGTvIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX+CcxhZdRa+b2
 Rm+Qq7BpKh5oGo9VHiKz3TVaPC4VLiuDIfxvRf9gf8taEf5a4qQpjbicpi6Ap3KeS2iRu9mOtkN
 S81/4x7IEU5xzN8wRSfoO566e0PobGNUQFiiN/Eb9wBoPCyuApChjkagPVHyX31+sz6GT9OiQ9B
 CppPxtMPxsxRmE/+IAvlzK7fmh8fGxB3oEVyqUqmKOck+aWzREHPqb6yYCtvHIoFPzN19VmyhS9
 dn0wfGs55wsIBFLXLth+pqlD9FTI2vSWniNlEq2I0aYi2zj51UUyHy50uYeE4uSeZ4ZPpmkbdQ9
 oP/7ynNLrEs8gL5gBYMOcaIKWCw6fP7V8UQi+ZFguF+b1jyoIx/1oF1Ed4Ub01wgQGFd6v5ZyyB
 oeBd0j2W4HPhDqxPdReVA+rg8XlXVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154
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

On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include PHY supply settings to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
