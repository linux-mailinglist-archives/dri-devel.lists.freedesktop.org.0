Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB0B4327C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E4910E977;
	Thu,  4 Sep 2025 06:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUBraTIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D5C10E977
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 06:35:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58411BV6022743
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 06:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=; b=UUBraTIiFcKJ6O5N
 918tFPm4wsDxLklKZtmyxTos6whJ1M2uIltlFrYEOlQKn9p+tYRzNJ4Qy5LKIYUQ
 OOwaMHJIH2+ZEqTVRJtydZy8ifR/h+dRWXcIZ2bW8dshnckSC2gf6aAfvoRfpZnZ
 OLkVucATNaBNeSRfan/+aY8UUJSSWabrf6WOtHoxqAWYMSkzhobJ+E7lv+uXKih3
 Y6GGHc2l6bGbDwT7PhNO6ribX19Nq3teOnAhwWK/ilIdYiC0P8XeJqK9veAPeOcl
 eKfr6HcHe0DAGxARIgmhYFahTMTkiIGU8pDQtLoeHkQC2TizaCZNfHl4RM7TzKny
 9tjN5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fpau4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 06:35:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-324e41e946eso1089953a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 23:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756967758; x=1757572558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWQHe8aTqvkPbjKWyJC9RECFwkQ22fnfERhVPTlFZgY=;
 b=IsoSezMiiFRKjF2Hi8csqKUsQdxdVTMWKbwaCI07XGvzbQdrkEOqhj4jEXSqdry6RF
 XZmK/xgaLd+iZ7LmLVy3RyB1tE//5qDqnOQwV1tjGAX5GeE2faZF0rxOhwJONqTKiipw
 S5TrZTU9jXpkNuVJSDrmlhxk8hzFw1Qvao62qZuTfPCS8NEetg0y6FhyaOopwoMON3+I
 u7DtCHOtRrbRH2dLcySL+8uzSPo5GB++QQTKzfLiPVrlSCvKRII0IUhM0ABIckhONJcT
 KcXxKagitHBLDR5+QJNiYbLBLCXAIqLnPuVK0XiIMuuXu6143ZF5zA0NQjhcHL2Jho43
 CLug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/p7a3ZxrDut/h3HZXN9kNhjG7xZU0+J6+YnZiOGaat6fbqQRAMUB69e7ZCQ9StbrWUbeOhZ1Pbe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSREfzoff1sCCbjxPGIhHeKgYNmJ+uxicdLPIKWDt+Ch3X3A6z
 ZqZECeSXAHoBNAAl8I4+tq+Tiye53Ux9wzSNhiYASkDYglkzHEKQ82OoX+LoN4sfeb7dSSf3WJi
 rmpmC/R9SMQ9DnABxS4ppfZd9KEJK6MKH7/MON+VZH3wpJzYLhx2j1HRrfN+pKzXB2LAU8qY=
X-Gm-Gg: ASbGncv5fTR2xvf+9caEJD66EIk7ZRzJ8JD8+v0MlLlErQaFPCIs3Bz91Wk9dei8me3
 2WY1gs4QmEi9ryOHGhKkBxdHNgfBBLTisK91rEt2sHE+tMEr/t792ghTiixTPUtlgScNhdtIZkQ
 LiG4J5UomT4O/i4OZeWcTVtMxQqWDRnxcIvhH9P1+MFS8zQMLQCNmeDbLxeVsqP/iJLtifKK+H+
 LNQHlFQseealGWrMUMy5eUpqoueb56c6JOG41QAbL2BpoRsMLIAl6hqlW/Zil9h0I00OQIQTySR
 Eppx1uQkxFMhNdcJxTRiEzC64tR3OFV0+j80j55JZVavNeoFEMMoLgxlRNf4k20ovHk7Rc2+Dcj
 psOtN693QBXjoE+yAVo1tjwKSNMRPhw==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id
 98e67ed59e1d1-32b90a5f1f2mr2536799a91.20.1756967757705; 
 Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0AZclcAiAIE/RLioDWTNitUCYKwiFoqEf+Fx+HDf/RA/CibTj/rrt4B/KuNcWo8T1gpG/rw==
X-Received: by 2002:a17:90b:2245:b0:32b:90a5:ed2c with SMTP id
 98e67ed59e1d1-32b90a5f1f2mr2536773a91.20.1756967757183; 
 Wed, 03 Sep 2025 23:35:57 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4fa1f21415sm4007673a12.18.2025.09.03.23.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 23:35:56 -0700 (PDT)
Message-ID: <25379ac1-4559-4803-b03c-bd24355d3b4a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <j7whxaqfeyz6fqwg54h2mivobbvo3plvxxzor7whmwjkhavndw@ulqfidkwwn6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXz8/kqP4JE29n
 iQOJO0sj0nXDluCLcw+T6trIJ2zyrmICiFbxYuo0ARkb9oJjHCRN0WT7vBlxoW+Ib5TTxSbLZfl
 2ABsEVLbjl2L0tX18oMcRF/YWT2naAD/APVPhdng/erx7a2BKo9NaIfP0oGg+YFbb61AODzyFWW
 /Wh1GvzQHxiYYTiZLYYddmmDVd/OaURGaFkhr6/fR1BxQh52riCs/EbfIPMyxYc9FVh5COxCH/l
 /ixkBHw1SI595TG55U9puZaOT+62bm2kS9vMFEGWBE3jj1gve0VN96ggKiA4HSlPpFB3ovIdkMU
 QnafDjZ8uWet3TGqNKeu8cq/QszaIsdOvpkfKUVmIcimY6FhpmAhKVTSy0fRq52QMUt4hlgDqTH
 gmPID6yC
X-Proofpoint-ORIG-GUID: kCowt-OuMYXx-M0F5-uzcjJQ_sSAwk7X
X-Proofpoint-GUID: kCowt-OuMYXx-M0F5-uzcjJQ_sSAwk7X
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b9334e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ik-895_utKsnK2WA_CQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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



On 9/4/2025 7:45 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> that supports 4 MST streams.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
> 
> I've picked up the last version of the DP MST patchset. Could you please
> rebase this patchset on top of it, hopefully making it finally
> mergeable.
> 
> 
Sure. will update it.

