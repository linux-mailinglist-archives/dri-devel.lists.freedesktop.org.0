Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F756A89878
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B810E6AE;
	Tue, 15 Apr 2025 09:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2dK16yQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178910E6B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tDGI019556
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=; b=V2dK16yQl6pylqWS
 R1E95Tw4nkew+6moyHTARiLlnzpU7er5QnXJOU6ovmVvOv7CvgFE+WH6F3WS/uWH
 2037Xy7QYlyzwmIzWlRgwVJcYpGY2vKoGDzFnX/B6t3f/dekJxM3g1v0Ue8tvzdI
 4K/8BvTKNaPDcQit495aEP72xKPw0DGcQFntRIgUrXwTaOve0qWcJupVBbl+e2V3
 wjkvTYEiU8UELOL/r7isTbpTdiFRkxhqYQmwyzGgOzd0NIf7KLgmuIwZo9L/Xhdw
 TQ5MQ25y14hj0RqNACX/BCiGgErdDIPNv7/02OUrxS3t4YT8kK4g3GK9hCiJhhEs
 g5FIQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcyeex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4766654b0c3so12197311cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744710284; x=1745315084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=;
 b=sx2znQEKgu4Zef9fkMK9f8ZkdIalH1RQcdIdXKXGnHU8GsnIFXuwDefusvSUxgCVdj
 r9uzof3BAsrOgeuZPbJ3z9NO98zZZ4kBPNdwKOvweQHbWkckWBw80pz5Op7KmqbREuCZ
 gJgTVnSzr8RmFMVWDjA8uZUCcxzcabUrTvSJSFd7lo/8qIcITiycBv3Gds/3IiKgLPFw
 JpVkOjqWxmJHCOFblUBk7U6oN4mWloXpQCxnNDRf3S1ScLuyjHD7pOu0q75ab7dzjKns
 EObq8s3R3Q+xU9x8l5AdPShCPssO25jTkZa3RiFe4iSmrPRQmc4U0XufRyl6hM0c4DH6
 o59w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX232pYJCq2Ab+gXH8ENF5qp+Rp7qC3oRGaa9+O746Zn0TuMIVTU93bgUw/7LtMfEH+zQz2dCz7j4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza2tfqBn+8sCZbHgv6ZFl518CJAWT9Ohgm5Mj2+w8N3r3pgYtR
 +/BJrTukAtV6eIqa0ihfZ5qiQ5/z4m6AaWEeExgv5A6c8q/UmPHwGP9KkAQZSIGvt7czZHOu/OT
 uOddDS7zUAf8/wAjOiHJIrdvQZfs9qCB7F0wI90n3PYDnGDg86XRUO+37sjpNmVk3BPU=
X-Gm-Gg: ASbGncu2N2cVF3VDCbprh+9vRG4v0fgpJ7qdoj+ZLAoBj4AtR2R+frdUv8y0nNzqnmu
 369OErECaQ59puWumaP57KW0yUrw/FLo79BJji7nkpJdF0MK+wiWKsJCeVa/gcmzFQZT05pOF6w
 CwA1Uda61ONuxKe+r/U0J+8vYLwYtLbIYC4+9THOI0kmDg/cFNuzUv4cPruCu+APhjO2h24xO8r
 6Zt4a0fVNp0bMtIwDSL/5pelhvoXN9Rzz1vbbV5k7ZRFlLyoI3qKNG9X6b5a9OkxHvlbwgfvzvA
 qogDGmg0lKZ9ane6utXRKIxRGQFCzGVoVWVHhhf0EPSe1zknOOLytVKnjKUO/+yZsDs=
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id
 d75a77b69052e-479773fae77mr86594391cf.0.1744710283886; 
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtDVLNzgvpQI0Lhz9q3H+Gl7nwNw80XyxluXGruUxEXUTIGiDUoi+aDVsGLS4X9fWsR8kNoQ==
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id
 d75a77b69052e-479773fae77mr86594041cf.0.1744710283561; 
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36ef61911sm6334674a12.32.2025.04.15.02.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Message-ID: <aa67f077-98dd-4561-b431-9db276ea29ba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe2a8d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TMI2DeuJ6cRHfy_QMqYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sybn6cGMzhNScLjVRMYIJCufQaU08FdF
X-Proofpoint-ORIG-GUID: sybn6cGMzhNScLjVRMYIJCufQaU08FdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=695 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
