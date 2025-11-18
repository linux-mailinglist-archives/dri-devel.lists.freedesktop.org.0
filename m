Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5AC68B85
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 11:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E010E47B;
	Tue, 18 Nov 2025 10:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSqQmsbI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdmQ7Igk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB3810E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8E1js2194366
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=; b=LSqQmsbILJ6n/45d
 G0PmH/9BOI69YrXMtodKs6YirqaoZ8Gg0l3TzZVzCW7VyWa9cwY9blv3gIih+Tpd
 daIM8z7QH2SlY9PJCt1Kl8GFtG5O5pLqGeAUiVAPLzYtKCW3v8kzgWsnIqc2bIED
 NYzMp/HVm1/uekJyJkPS1pNYPLG776nJpT+r1VUy5RzKUvV9/yuf9JrRqYtq6Fse
 5LhZmd1l6aox+BCReTwv5pDOKpRNiWl5kmfQQm07HbY9W81nWZ1ry1rAorUlGAsL
 BIN3oXSErPUb5nMlS6gLTiESr/eMSv1o6RoGFrd3wo8Gww25hRjum2wbT5VLslk2
 p8xjVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8c6t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 10:10:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee05927208so10198191cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763460658; x=1764065458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
 b=MdmQ7IgkWRZBRrj88G88rdOsDD8dlqjZwD+EJ9BWhLbW8AQ7hPlrl/pk2epcEdRPwC
 HZJgWuN6azANryhvq2SSUlowbrGKwSC3qxPsL6+bDwm2Vd9pB0/cejF+Ms0KQfG7CvQp
 gsuTdzr7XKU8T4DW+m/ZxDAgWsz6EWR3NUw5bFFJK7CvnPphuC295ToTWKeZTiFd1Qvo
 iV7FJtiCMoUS03Pg0mQxn+wdZZ4QAwp5Rcz4G4nA8r1ElhWCH7lU7eWqjnMYp330EVfg
 Oc68MWByPy3oesKj1GWt+aq6qG3G8FRmgHD/Ke5trW3MF3ND1krB1je0KRVE5skkAXVh
 MGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763460658; x=1764065458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
 b=bc2GtqshJAjNv1l/sOW8/pnsmRaJU27jp4RlAq+wezFWIqgxTR0h06+0bGXhmKtenK
 HEMR6287tRnrg9NLin/03eKLHaNElpOal9/bzeQWfj0hiL392kvwHMeuC2xGPP1+Z+E7
 0FqlZGI6DIm4GrMz9dmi9u4wwLbueMnD4kkCBoiCDOymMHXmV6H6qaPQxkKZBRQUUzM1
 ORe2GXkpkZfIVeqXvUj9q0TjtgOe+7/e2OG8qNW0Nb4UhxqFM9Ht+0rYL3XoZMoIOn43
 NI6taxs/WO//q5ccdk8d/Cre6V7yr9DpTULggyuwt9Oqpsxvx9FKDYdNa0XoG0B3sASl
 DToQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLRbv1kuO/3kYZ43GBDcAoolSX36loqbMO887yzipruDyz5mcGRBXc6kO6KhVWnJ/hjqQLgeio0HU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVj9QmVrmghpAbdwdzXDQWfPp5LGV/eBL5JXYb+/DCWH6o287Q
 zfT7/GiNJGA+RR763xtJIrD11liDvVG4ZqjULnDvBBxLJ+uUTeYciD6QXqszSgEFMA3oJKkJXiJ
 VNAnR1lwE2JG2196/o6omUdrZG+iHuWY0FiubSUDzmKKzYKf9sgszsP1Q4rqAYxnDS28wDCI=
X-Gm-Gg: ASbGncsL8/Ng+dvw8iqfp/O7ocpQgTVcuoZ5oyE9xWtp6PWHB6g3uTkvozO4O1UZX88
 6M0fS8dsdGMItSwOM2xyM5cyG6d3y2XHDRUsuEU0XWjeZismFhDm+CJZw8ZcmSeYFML1jdb3utX
 z+NRJzVSYvFlBF+1LWzXDOXU8/XnRA6RwWB+69BLdv0CBhNjZmHFW/O0oabXCPAM7XPYZqAKMPA
 zRjmE+wfVtxvm4Mu69UQZ2N5rFwtvQ/eWYXM7VVos3zQ1zM0QkU2MlsNvf655iT0xlr7F1ME71N
 Jp7hMsFiwdKgCEXcu0h6xLGGxyXqTJcW+j7Dy7VYnIbpKV9JRfzbC0DSmGJhZtLQq3J59W6CsRb
 SeFvceLGsGHs5YS5LjpaVuQW6uI8zVpTbSbLCtV98ds3Sl42Lven0EGj42lXIekQ68dQ=
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ee3182237fmr20160181cf.10.1763460658040; 
 Tue, 18 Nov 2025 02:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz4Ftkem+yYtF3nOBOFFpkdhV6ZE7GbZunxdHTdiyocnrRN9QBCgvxmaVDrzMTewaoOz9MgQ==
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id
 d75a77b69052e-4ee3182237fmr20159971cf.10.1763460657671; 
 Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-644f13ff4d4sm2997956a12.12.2025.11.18.02.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Message-ID: <1c438a94-fc9d-4322-918c-b6ec1a4cc5a0@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX4yDsk5VSom2K
 geyb8FSOUCmg/tPmO7ougE9azhDxaq12oWAiYPg/nxlZAJ5et/zowNJAeOkXpPOUw8Q2PO3V3bh
 U4kb1zOxbRKxOt+gvuJTUkNYEWjoqHcdPud/IYfOhC14IU4lr5oAPrEyp99+QfreC6ZntH2b8Us
 WdQfSWfpYvAnoNKgWanSM1oJYf6fn2cAa3KvjWrw09lCJ2VEZ2WKUIjth0qT8dvar1Aynyadwtr
 rPjc7dsq7hBPYIdgVFa8xxMDAJgsVbqqIrksMXy/SNjwpebdJWHQ2RnxT6TMc/Pgvj88TibZMmu
 wb0D0hzxJbD6i+DP2BzUE/nxwTnVJexp2kwXy6GuRLQ/4H8TEMvrjVEGiMx7/T47k40T3q707nf
 slsQWMNS73wxKz54c41dI1P91wRCeg==
X-Proofpoint-GUID: Xih8CN0X2jJ5JZhRnjFMM34IaZH8EzZQ
X-Proofpoint-ORIG-GUID: Xih8CN0X2jJ5JZhRnjFMM34IaZH8EzZQ
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c4633 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GtNZTxoBlHEkV55hDasA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180081
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
