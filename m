Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB3A989A4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 14:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ABD10E1D9;
	Wed, 23 Apr 2025 12:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEfdqrJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0F710E1C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB0v9K021363
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=; b=iEfdqrJvitZsTSxv
 xsGCnrcjXPQ2IcWoKVAnGGCLzDRIk4aNsh8+XceLEgtJnBHzppKtkd+PX0XgPy+a
 /OkacEzWoTkABAA44fkCf4sbZ/umnbmaBjr7/E8pFzFzwflwenKcY3iHtwqUFxX/
 yy0NRf1fuFuESEyfU1CJv+pyi8cY2grdbFYwBsVJFg5uFktiiZz27uPCFdI8S4YY
 y7xfEZfaona7VSXAXKXXC85waLtsZlL8PLEC+e08Ort8NOFMbtsJFzywu0Plzmlh
 rZnTjZled51CzoiAENbgJamTBVAMIL7HsfGVDN46I1QOA/BOXBzkQJ5GUysx/yKR
 IFpN8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2239h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5841ae28eso120390485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 05:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745410905; x=1746015705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=;
 b=m3DX0z2bzwJEMC+pHa2gmEJ6k6kMuqbzbBcbkSgRn/nu7T61nVewdXUgU8HOZ3gA0D
 U9Orq//oMXPvOyD0z8JKl8Lktu6RrvRyZ5rOBU7eLl4ijBbySyoi6D3aiiASYbecdWua
 A3yI6IqFMT3eR85MDBEGtJ5LZt/GUJianye+lYuFWuaTwLBhPbIUZvXAH5clDIzGaW+p
 WhggFA3bxXa48K0+DUYLFziYMH9LO0L6YY4zpskpqqKfuFqyxXjlGeDWjjBJZxX1Eg8y
 PgpzLwijw0c5pMf1LVOxBzS0o0HfDx8jD0f2B8WiPQ4Z6LEjtbY9mvX5nEG3UNd2RWEE
 GHkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMZFZFOxD1xJgOxvcu4SOEHbGiJ5C9PdpaFoCgYpVPmk5eGaBq9zn2MSKscmomKxynOVZ9nRLUg00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR0Je3z6rgNy78AvlwWXpifpsr/7drWFitye5sbZVma0pOOamo
 vqJ9rwhqE7LemrdR9xm4G81pjKuCxZibN4Q2iP3/HdymI72pEyeXcseQa5e75PwdbOM52MNaKpQ
 pRMcwNa79mOWYzlBU/c8IzBRRQqORFhMumcu3lWhBgYqqqTEBjSWRnGA9KEHMCtMvyt4=
X-Gm-Gg: ASbGncvvcoTohTeAS5+cqRCMQtJ63oAYquQIKfdcUQ/At2WlXiSilcygxuNmUhVcEXZ
 RMBSQzqudaUEzvbtn8FGqcHBexYZknMpfNfmXCmmWAzgQ91EAclKeS+gsGdc6jjR2ANVQ794voi
 6ijhZRSMNxkStNLBYZDg9SdPRHVh3SP+ErVJEK4Ru8JGtWMK+nfgChUHWBvgI5pvMaQamcj8lSp
 6CkPHoRJxEO3PelXPka8M/m4X4QxvV85amHvAod1IsZcsQwgt9UUWZUnFky0Uy+s/iuMBsbTNVs
 u6uknv4ZVZ2YZCp+3DDU9+HcNdbK0NQN7S/tJR2qHv9o0CF2aGpmALN0xNOWaAtyrTM=
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c927f6f902mr1108009385a.3.1745410904988; 
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXBbDZMwLarl+zI6FrhIiRzh9IB3F9PW0wtQy5FUQ3y8e0F2Y8/CQ5HRXpH8vW397/Zsevcw==
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c927f6f902mr1108007685a.3.1745410904673; 
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec4c622sm786854066b.44.2025.04.23.05.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Message-ID: <ec7b53a4-0321-44bb-938d-0cb955e64397@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808db5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=rNhkmTvpKUHMLWWBcFsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: TuApN8YJF_SdsCST5-_V9PnQpfjnsw7H
X-Proofpoint-ORIG-GUID: TuApN8YJF_SdsCST5-_V9PnQpfjnsw7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NSBTYWx0ZWRfX1ycw8OI9CRbv
 I73P8Ox8Pfb++XSzRHxm/6f92h5EaQe2EIIeGckwh12lXgirnFpNjC5S8lUiNUMYH0ee10RqVMT
 E+mwPchP2i1bPMcpeOkZG7ubkSpfTCe/+JDIy5FbTB8m6X04REECXTPe+EUrlUPA+MK1m7vttHu
 DR+0zsUWNJGULzsGrXT4gnWXpwL4ZcnYUcohyFgb82LCf+sjF8wGlIo8PKCpbnbRrE5PkaIJJ3Z
 QNEfT/Fx70Y5XHME84ecQ7oVofRNgPgEFrZGbwfe453s6xnj7wpFKysE+27plk6lqSmBHDpBF3k
 51hN/NMH2497782kYixB0L2EtgPwKRZElMwF8oIneR+0BgvhuIWX4xzzgLeZ7BD3QfnSTLHH27K
 vxIXIYfVVOGUmHbRHuZ4wnf1iCl2vyv6uRl6lPFJSuNhHBMT+BGJOBqhi8RpGV6ciV/x/+Ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230085
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

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
