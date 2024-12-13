Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930C9F1069
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D7810E43E;
	Fri, 13 Dec 2024 15:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLh6j38D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5C310E43E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9pVxO030541
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RUGCbElRfwnoPpxFnu1ETCSpv33WWX1zIEDuWigaaa8=; b=HLh6j38DcQ4ou29Z
 zg6t44nmuDnYNQxPMmaXJBMdzexH+BRyUCloz5+QbUZtcZzjva0PtLWusTMzBBQN
 eMN+rPhRJ8xcH7OhDpMmb7zgQARiGCG4LD+ZnKxer8L27lwrfFFpFqjJaZ9y8iR8
 Kt3IVUxKXrVmqLNvaQTxddrLCdz7n0CS/+4bjbd+3ui/lRYjYvEyTT66ozpNDc8m
 ZrCzSMT1+Ew/vCBPkkCUlV3h38gdNDaxrVRAnTHyfpTCdH/8JqR1IpXy1EeS/g6L
 pJEliXfJMHBl80edHXPefAxe5h6jYn6WlYnpmRtqwfhEGxs4zWXguN3rkDiwQNBu
 jc1fgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgem7xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:09:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-46748e53285so3737091cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734102588; x=1734707388;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUGCbElRfwnoPpxFnu1ETCSpv33WWX1zIEDuWigaaa8=;
 b=FS/JQgPzdo1leipMJMR93IcAED/+BgL8V0PJOqZ3zendC3NoFhb20rg6whdK0ptmaT
 xhK8keLisNYVMtd8e3QycgzE/5FElM/DHW137raCE5mE/9OYzmmfEE4UjMGJs0cndpF/
 TrmToUkk+Y0LxfdtsX9JFpOuON6wkqfpTAqFFF6mgoUa1466b/t8kPgxR0vmag/ymz52
 ms3SfThKj5ctQiGwnlagkUYKFBuR6vGju+DUkQlHA0TceSX2wuYKQdydjckdKPLsGl3X
 O11RDdrfslyLkIQ8vbEWxt/gCtSTD++wij6UDrgPTz+2G1peSA3ANu8ZOsRehPAQr74A
 F7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdmld9YeP2QEhe+WKLufbAknj0g7xe58hKfUlZyHXYg6lTL8EQZxKP7jk2/HPMMji9mP6bbcC10As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ0XyUfyH1f/GgDUQ3eh66MtRwy0y2/3lZg9t7BaSjvmA5H1fG
 wjDGaXBpn40XRgjR5fUURT+8L5mkQcP1q9tVGMKeOC1GFMy/B/TxCEpV4mSoFCH61Edibygs+3L
 +BQlzbYuhcez7JvLE2Xf9y3HoHfVpXC4D74WJCkqk6b4cShqK18LSOGamUUsd6GVlUNk=
X-Gm-Gg: ASbGncvq7HT3IJH2yVlN8kCtU05b0ujgmyr5gsdGOfOFUpAJgilQqfOCwZxr+UtTotK
 a7P7Mxf4JM5igbb/pfdq1oNyHhAUQ4H+yu2ibY7WIi9LsMpClEn4AZK2XxjnlFHvaGa5FI4fDrS
 XT1xlI23fUqtGRjubkdYw0TkVdL6Zg6Qg7FYHHuljK8kaDwmO0fC8ou8qMWA+Zuc7bIc7s2PXT+
 XnrhaJwKNfX8cWS4IkTxgWNbLwcrpjzKl7n+6dkMT+8dobWMeRvPyx4dnRr2c4FI0X7OCE7ch96
 MsRUqHp1dgFNzndV+YKPu0wPvbhATwbkiM3e
X-Received: by 2002:a05:620a:2993:b0:7b6:c3ad:6cc4 with SMTP id
 af79cd13be357-7b6fbed9855mr159797185a.5.1734102587777; 
 Fri, 13 Dec 2024 07:09:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCNOTuH/JeSKj+950krsW+duBDTSos0kfQOVpuA6pb//nTscPC9RvF8gzspY+TD5ARI2Du8w==
X-Received: by 2002:a05:620a:2993:b0:7b6:c3ad:6cc4 with SMTP id
 af79cd13be357-7b6fbed9855mr159795485a.5.1734102587439; 
 Fri, 13 Dec 2024 07:09:47 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68770c481sm708781266b.110.2024.12.13.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 07:09:46 -0800 (PST)
Message-ID: <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eQ7MbO3HjJCfjuuxcFbDNOM7mvFzlWhl
X-Proofpoint-ORIG-GUID: eQ7MbO3HjJCfjuuxcFbDNOM7mvFzlWhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=738 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130107
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

On 13.12.2024 12:31 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
