Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F349B8465
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28310E928;
	Thu, 31 Oct 2024 20:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITwb8X6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A01B10E114
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:31:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VARA3n012524
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9k2M3b0n7oscrFwRKfsA6u45GGCm173u3WDMqWDo1xk=; b=ITwb8X6PDbIvjmfl
 ELr7FmINRqIoyn79Hh+7Rit+kINT5dybgp31/iqDOJ9lOWLZKSMPNnlqsL/D2vhj
 mkqDcvPqMY4TPYea773VS9TSu4IbnWZ6h2AXjvkitfFVMPViLJNVJCalQktZAb5h
 VfueIQ8W718wYtbf5Q1d9Bjr4o5w05ws3rcPlZt25L7EKLx41WnwvzkCeItalpk6
 H5omKuXR3O6pQ4oaiFv5fOxlIDEE9/EOtBbKhGTGaXCN10IaAID1hgBfUbt622pT
 j2uNWFqhJGWEgUYh5Rhe6BXp2M5mWi52WljNxFKOENUQZVAVzmtOFIjJ/0if82lz
 x4SyCA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6rb2wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-84fc8975e12so56171241.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730406658; x=1731011458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9k2M3b0n7oscrFwRKfsA6u45GGCm173u3WDMqWDo1xk=;
 b=ViW2PTV3IZXrURkNODvHCmF3JTFxECWWmrMxHRBMUT/GGbfmq3owZohk34NDIAyzYD
 ebmWMSCdDPdMMtCTuloYq1ZwXCycse4Torxq8KdrInaU5sUlhs8YlNxUuSJ4iu0nEY1o
 FmHAudeCXquwOFXWHz2X5k+Vj/OUlR28FZLmqgMiiX8+h9kxSBBXQFiEmtCLyJEXG6AI
 BdczEiGleZ3aw+TS6DYoYK1CvT+/NI3R/Mjbcqb4pz9VfayOlB62kt/zT8z5lFH2Oi7R
 SuIlba/DtfEnr3znwWeEGZa/NlNOJRNBJxNcb8IxHHjE/Q0K5Qd5pmDtICdSYDnnBjTU
 Y0Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+jYsRyGgK30MBRNLB9uRp+sq4E80OeAo8+c8+oAIWX3vAOYtge+jLCvNbjYIv/PFj3Qbu+omD/cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT049ZvwleF9rdMej0Ejyi5oqUGDm/q+b/u3gGymnFPFZXZoEB
 Wm/9BwfFHraxzaoWzcEJPy2bO8PQbc2QuONJX/tRIz/2zZdE0B/asANaMN1GKDWmhcW0TCtWfhA
 aDlZ+BYKO+WzO+RO0u1Bl6GxoCSP6z004jdvJ407Rw/hiXpjOYkgqRVGYQrR2F7XDfrE=
X-Received: by 2002:a05:6122:84:b0:50d:4874:6c3d with SMTP id
 71dfb90a1353d-51014ff78b5mr5809025e0c.1.1730406658428; 
 Thu, 31 Oct 2024 13:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq7JvNQxAihqkufmrhlP1Kc1i6aseFNdHcqNo96oE6qeQc+5u9i2EYOcAH7guDp1OzQvnpxw==
X-Received: by 2002:a05:6122:84:b0:50d:4874:6c3d with SMTP id
 71dfb90a1353d-51014ff78b5mr5809000e0c.1.1730406658112; 
 Thu, 31 Oct 2024 13:30:58 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac7e93c1sm862582a12.81.2024.10.31.13.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 13:30:56 -0700 (PDT)
Message-ID: <fb0b1d8d-e47b-4357-b35a-6acd14507653@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5rcyS_-7wqGSg0hk2hq4mqaNBjKFYDBg
X-Proofpoint-ORIG-GUID: 5rcyS_-7wqGSg0hk2hq4mqaNBjKFYDBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=725 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155
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

On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Enable GPU for sa8775p-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
