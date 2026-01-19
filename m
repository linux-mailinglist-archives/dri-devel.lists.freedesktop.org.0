Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DAD3A3D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368510E1E5;
	Mon, 19 Jan 2026 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4EBeaFl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0WTzPyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C9810E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:49 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J9mtX72965047
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=; b=l4EBeaFlup0HfBh9
 aSoOiJ4C3/kuxhOtr45EEaeI83OptusrtXNq43ue2AlRmPhZhk3sHsWoqu98bFKh
 jrCCj7RzrvU2/aGGoVjQrOM42ruaAwYSFZDtfh7cPwRMgHrw9qILsIugG4WqmCcR
 aDwYmwPTNg9ffZJKS9NKxGazpNwABRy8qiATcPyFSMsoMqt6xn0dPMjul9I7rKIf
 zSwLMjLxvBFxiHjI2ZIWx3lJE/5fxoP3gzwdsHgWmiqWqog8nXox+zV++xzf1Myd
 xD0vyEi8uJ+gi6hGpi4PmJ2JTt6HRmJPIIX0e51+kzU0IPMv4QEdI8jrly35giO0
 c/cCrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa80sx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:56:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52de12a65so114203485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768816608; x=1769421408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
 b=C0WTzPyqLwHUtlRZcHrdykPA+z4N8ZEpUeaLam7KPU5WpNs7YWXTGoi3eF1J58067H
 ScCvIYp27tDiWayROPL5OBy5T+F/EX/UDSsBpk0epPcGCran1mlq9UTrDVZ4CBOQA4rS
 DkEYMYNxdhehGSWfJ4nYi/h6uO7xv1g9SVPIW6yO7pa/61B32xvwQW1FAJcKTgkOlBKs
 1Kig+c9+n5G6Ycch/f04CiEGnHaqCI/FKdAVKuApyQBy5QxDfoyqNPF44/uWwe6ulE2y
 S2ZYXrtIep6wVRPZH1eSFqNRer3m8PKopUiICUYMf6/Ff2B4OPoAWPxA2VWuNwFiRosq
 pPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768816608; x=1769421408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPUHwA4CPYYZRQC2X+cPW02NNRxDvZ+UBUW8PIpWzmk=;
 b=XF4vMcROWlVp8aJXMAJd/kVsiPIi/ZkWmbkq9+y/HVCGbx5khATJLuV6/Y7+RWJCv/
 HjHMlGDuZQMTgtuHBjhV4GZ53AMgIH2VUFdeU6HjNXmYmrPfAEM5c80Dep4JDCq2cI7G
 kMz0SnzglentefiKk6QKn/TIQCjx71lfj2LWGyCb4krs9wHVdvTHI2t7RDoHouPBVGex
 aSnX3pPcEz0k6W4+BxRLcnXT/qye/fDI/j6Qq0g2AznsWkK6rEEi1tUhPX31y3DSOXlg
 Tc06P9Z47/cY3l68mlNwp9CJ/nU9V89Mqv8qPBagBqeZmR3b6WJ+gCNTXTsiR+OsHvys
 E58A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqHWqwD3oNzYhc8wrzr6Xbp41fga2u0S8/5jADf2+WcLUQlHbZJrxiXvX6BxIM5z9A1BTFMfFnDWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvHcp6VhvIP47eqlkkiPVuCClID+GEzJrytvzr72lP4VYEh94g
 k3UoOXoohI1Yth2Zd+7pY0HuH5GXxb5Nv9U4/hOSPDVxGoTgQvuycY7rHk4UW3hlSsO5tFlIbbe
 mr2xWoMnVvqDwKtvYQR7gVpmHulpy021XTutN7hVunq0DX83gMmquyXrg0xaSyHSCmIgQF0M=
X-Gm-Gg: AY/fxX63l/RHdIxng1wxUtwopAOngeG9kyDxNlfLWShjCLrTcXbF7Srcna107jlCwLU
 BTb4yZJN2CHOsQwSDQalT+fqosBDPKEdMyxj7aB5RwTknLJVJiovPczZEU2MIG6n4VLDSWwOMfM
 euIepLDTSf27NHDUXnWuctm/70A0gDy1nzwZtCxiWTFYy4/BHlMhPxxrqMZ0aXiNqhLPLRGChMA
 nXemaq6QIi6uUwzxc3hUjOzyH5cXJnRX7TiXeOcNGm0i1Lo5fcKUIMGJsWOs2S/eKRH8MLr65Kp
 OiXbAkbzLdivQgJmOfyj4491+M7wfEjrg0LPTEjqK4iJERMU7T8v6w3KnpGUgZUjNGbG+Wdbhvr
 RFpCknYJsv7UydLv0I3NuEgvtgvaWVYQ5SlngDo7HhVEMMn7WvIU1uA+9ihQNCwxDVXs=
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c6a66f26a9mr1202366985a.2.1768816608381; 
 Mon, 19 Jan 2026 01:56:48 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8c6:2539:dcda with SMTP id
 af79cd13be357-8c6a66f26a9mr1202364585a.2.1768816607918; 
 Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959ca4casm1040662466b.34.2026.01.19.01.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 01:56:47 -0800 (PST)
Message-ID: <faa3cb6a-8cc4-42f2-a883-23f7d9b0816c@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-1-e0c8c630fdd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX21B/9+gD5MJj
 ri9Wq3xnjhYpaO3LVn/FtMCg0ZtIEzebTvnxhO3SWz9dcK09z+5Dt3yrDkiRnte02hKKNzAdyBz
 5bsn346AeF83F67VASHWUBJ6T4l9n4MtV9lZILgIJulu/tQDOkw0dwUyrhh/wm6k0g/bmcTw9qL
 k4fwMkofhEk3srECvbgBLbSoT1qAckXXD4k1agNWDug56B7Ft51HMbOWcWxovKxZ7sUM9u5fL3k
 /K9z1B8yI0cmfNBy59OtHpuK7qvPT8Jno8mWYg7UgEy+JJBi4smYUXDUXnkIInGjoIgAHhQP6w5
 oI7ZtEF9imBiFGDr1sYtbA+JYYM7N2kNdsc35H5+zrXQ5xrTlmSrLi8pCIvX1QJjCe0egoU0JNP
 T/8aD2AV/r6GUDMZQW1uapCula9HNMR+jU0MFkI4+LNSgldjdS0Sr/AY06L1VhqZUDvRQv0VIHR
 yjqjpukhVQyP/QmVvGg==
X-Proofpoint-ORIG-GUID: w0IIZQhvbCq-O9pNYUoTOAQvX4srC_Pw
X-Proofpoint-GUID: w0IIZQhvbCq-O9pNYUoTOAQvX4srC_Pw
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696dffe1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aLeZyDyw9DXj8ur7rQ8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079
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

On 1/19/26 9:14 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

