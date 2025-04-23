Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB3A98AFA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DAB10E1BE;
	Wed, 23 Apr 2025 13:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8A/Sy+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0C910E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAMcdh003741
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PB3zeJwysZUF/ByBSq+dhGKR
 vdPDfw2nxYgcYIOLE7k=; b=o8A/Sy+JMV06jqoMqAEv5+g+6FDVaLsmlIWxloNE
 eyZ/EllNAnyYMZUJHD7/qcGvvCxNbY1ME4C9kk6kfMRheml5qkIeDP3rVubG4PAA
 UziHFc8yy16AMPfamL5IOvke+Fk+GhleIfMLJBVwlcwZHzXdSsfhfoWXPaFy5HEQ
 pyuys0GQ73qgTa1J3xXaPu9/TPENp+Mfpy7RQyZJOYaSj3pqzGmqJzXeGFGuMxHA
 dsyUxzDaHCrDmKuKy5i8O2VeZX/H/BE7JXFfoFEarVwBhw7chpY7vglyw+ByK0OZ
 Jz7r2tgbdUcT7JMPxrJqh/7p8DaKWSpx7E0BjYzm3AdHLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy287b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:28:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c92425a8b1so169029285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414925; x=1746019725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PB3zeJwysZUF/ByBSq+dhGKRvdPDfw2nxYgcYIOLE7k=;
 b=OBdWsKpfdMj6scdmkM8oPWaEZ7Diqhkn1Y/ohNSMckP06v6v7BnC0wOKGIkDvghGIm
 m1cZPJw/PvXt3T0xcaYzeQTtPKffQUA8I9iHVX8T0yUnXtWLJBEnzDYN2ffiQSvlpPiA
 4sD5AWWRID9wi3qgFVfvUkwLNWFKK6Hv7G/3XWKTmWg+xsRlHlw5L43v4chnkhDbZcaF
 pKShBncwDNA2adDPbV3r411XRgvXsteu6QFq6CPaSAreTVO55sfvbNIf+wpJseW2QG7e
 mj6jtcOxSvWKjNPPrwAwOcueitL1FqcFDnNgt9o7dWIMs457ALmj6L6FODyfdLL/NO3E
 gtwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSCRE3r1b1L8JP/ADXV0/mZ7gedjgTIzG/PDhAAVRtISImlTyy4stTf7tAQuTDDaYVmo/iZE6kHBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygq0/GefuwDYV9TNIhFv6bGDJ+zslFHcROL3zXCWu58IwDZbFl
 ROgpJSf2EJDmz7WebJpFa6l+WCYiG8W3ZyVhZJCsfkh6lv+8YGTGzrj7VdxtRz/85s1Tzzw2OJa
 q0cSTG2AOXnkEa1oAhrYDbPVNwPJgGpTLLfRiNpqOhnABzu1iilAkMky3wm3pCECPp98=
X-Gm-Gg: ASbGncsf/s/cCk1Vq+GQfOj7y7l7y0kK3618g4zcssCUnLehbRzVsYRRNlDMwK5vlx3
 SCTc6xr7fJxbROBAsNc8HSPSEk58KN6RLgGsBdZFwQx/wfeZvwNMVuckoL5/plqN30VwdoUrNnO
 Y+Eq/VyBwMj5oZkq3SZL6pccNY5RnlbqSow/EpwoM7ww9mpxr27jefir/QRJ3YkEjbDdbfj9DKu
 d+jKRDq/bbP+9DKWwFenYAFxwyZzCvQHP/APGhn6FwHpUeQDvTiZKttD/+Z9/48guezVSQAGZJq
 WcWXbyUU4wIL6n1hGf71Bcz14L4APIXhBc6uHcGgdBLjIiWSaVwbe6F0ZmrW9XYW1aJFayFo+5c
 =
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c94d80df6bmr443624385a.5.1745414924636; 
 Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk636fFRRkvuLyPaBe/JMMbB0DmZRi+A72gsKa2vsyQGLytxQjLxNTJxnnRLMfxvaeNdGcxQ==
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c94d80df6bmr443619285a.5.1745414924226; 
 Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5423a2sm1534611e87.101.2025.04.23.06.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:28:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:28:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/7] drm/msm: a6x: Rework qmp_get() error handling
Message-ID: <skrb5hkl66gt6vr6c42tx2ipfn62uuouztd2g37xlhreeq7nqj@r6ohzexpwmy7>
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NCBTYWx0ZWRfXwb4K29jTelwk
 2K4+5BcON/NxU6pWIi7lCvBri946zvo9Ita+kle+gXqN4QgfOJPM0E+g7+ZsTOZRkjQODN6mLmK
 uOMLUY1LtZ+NbWCI5K16dupGW7PW/FpG2m5nqMHhjrIKMd2ROlGRa0oWVW8bAgr8K8FeX3YxM/D
 kruLhTgHWi6J3e9ZZzYo4HVrJwr3q5ftBJJbD9gFah9Dy7o0RC09L83e8foISSwIYvB7ll/3nBm
 OSban22HHNy6rLyJ3rhbTZPScph9GpZUOIk3MnPLDSBnye+dq+7EOm8xFxj9YNvwg3HzzisVloq
 u+cTcVQI/qa7c/w3lqW5PL63+KkjQkqTl9twXaxlpBtvVRerJ+UhAWppO17XlENaoEEZD4Wi1cd
 xXGSufI50A9xzYz5qZbPipk+PDwISVlgNuO1CrvNCT4oYlqBSafftrGfa91EcTAXu+Mf42Tc
X-Proofpoint-GUID: xtRxjmnvOW8YhlkK2nqx6a38aN7waAph
X-Proofpoint-ORIG-GUID: xtRxjmnvOW8YhlkK2nqx6a38aN7waAph
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808eb0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=3mVCJS2yw26y67mb1AsA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230094
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

On Sat, Apr 19, 2025 at 08:21:32PM +0530, Akhil P Oommen wrote:
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

If this a fix for the existing commit, it should come first and have a
proper Fixes: tag. If not, please squash it into the first patch.

> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 6bd6d7c67f98b38cb1d23f926b5e6ccbd7f2ec53..48b4ca8894ba38176481b62b7fd1406472369df1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2043,9 +2043,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto detach_cxpd;
>  	}
>  
> +	/* Other errors are handled during GPU ACD probe */
>  	gmu->qmp = qmp_get(gmu->dev);
> -	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
> -		ret = PTR_ERR(gmu->qmp);
> +	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
> +		ret = -EPROBE_DEFER;
>  		goto detach_gxpd;
>  	}
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
