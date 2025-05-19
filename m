Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885EABC3C9
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356010E38D;
	Mon, 19 May 2025 16:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6ILHzI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7101A10E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:06:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9irfh022829
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pCInV1QBCyzl4b6q6TN30j8i
 Ig3ET3mzjESHX804HKM=; b=G6ILHzI/FXwbRN4wESyPXLnJftX77rHjbEO/llOq
 6tzTNktXbKIRbmyhExsSWNa1kCDmQLitrNK2bwNOhPhxYtrqdBeQViGonsL1vipp
 ZmwOxHeOk2IZa5pmkCpOf3bduSfB2uwCAsmP6VapJQV78jKcFBHmwxvYDRLZ2rvP
 Y4oUMhbD8rtzyJMlVp4PmwZeZeSbcKHLnOkhchfRMSFGTisemiBIxLTKGGLhFmz+
 ze5sNB9LnTJJw+vlW9UCJBW2DjWi6DqizyYg/CQNORc95BOni5p2NW7fkW+2TuZV
 d3ysm/dRaFVXCfLRV7v8J9EV3Y+eXvoNCsKsd++ztA7R6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d122r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:06:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c793d573b2so857799685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670794; x=1748275594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCInV1QBCyzl4b6q6TN30j8iIg3ET3mzjESHX804HKM=;
 b=Od8XVQ1wHpzxSQkkjgEugf0XJ9h1sNPL/YQdDdeIC/teCJRR7/wKS5sUgbW0GREFt3
 DCYK9NCh5VqZqKom50VP3Q/mSsRNQnHHA18EYgkGU0KLUjIoPcPRiPq0o/BM/nVKctIY
 sPJ69rDsh3IhrGYimwxnE/1ARn0B9dyXQPC2awzxNirKFPzUAgVQIoHiiILSUydkV4Xk
 S9UxmQ0ts6UwvX5lrbneryTb77eLAQsqqe0tSHTGPKaREekO66d+TH+q4klQGE2Bu7Sh
 i8/djuQCqojJw5xItrb2RRsc+PUDw8f4ZEFaT2YULQM2X1FjI+LjSkJAQWs6qz0wu5DY
 rhGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZe5GNYcRsNrlXTGlmHOPmPozeZIf2ifUb5FdLP5CilUq5NY6jj6csZnyRAbB7pHgRVDiuZqtgdZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhui/bqe47dJsySSCKYEFC+epSzoqU8rlQpGZ9gCafeZ9zAB8b
 uC2cQZwsdK5ggEDQy4U2/6IGZXtmOag9Hl9NfX7yLUk0SN/01EERUFMoJzFcB7tvPjpf8+60hUa
 AwIkj1Q35wIA5BbThtvhc93OVfUR2Acq2iBfAVF5YTy6Bo3jOhso0WOEjTApaA4ztqbDbihI=
X-Gm-Gg: ASbGnctl9OjiQ5WMsMlGMQQH83QKDycJm408JRM/VZngt52yknFhOPBA/NYUTQNx7j5
 I11JSDVyYytvmhZ3C/MDZV4MCxxZv8W7IEaw+N0dxGU4cNGNK7auJvdOkzBA56WG5ZFED7xwBa3
 c1Dli6WqEB1/3rE1o+3WUUWuUCCjPBybrdWaBx8iOB+fOCFISjqIYPI8/brk98QQFv1AASwEy1A
 Ch4eHqDEm0G3ROIn1IccMtMvyKG26fPfb4+KZt0y+7Kcx4dzKLquZoKKmcuc6HCup3I4LmYsL0Z
 wGHqxTsTue9TqdqJaWc8Z5G6y5A7y/R6F+FMMBNfh01X202wc0EkWUTS9RPlmQF2tidilMRncyQ
 =
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id
 af79cd13be357-7cd50903498mr1489184785a.50.1747670794614; 
 Mon, 19 May 2025 09:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFw5Roez60YZW75hF5ZwRt982I58W/G/fp9+fvjelzz4QBS+enmm/pZaPsaXJOzOWO1lQFA==
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id
 af79cd13be357-7cd50903498mr1489180385a.50.1747670794160; 
 Mon, 19 May 2025 09:06:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085ce31dsm19233651fa.105.2025.05.19.09.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:06:33 -0700 (PDT)
Date: Mon, 19 May 2025 19:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <t5jk3gmv6gxy7fhr7nbj6wwnutylsgenhepae7im6xqn5udys6@65ysrfzjakhv>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
 <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXx8SJZAVDh798
 VoWmKOYR4eLTNDmI45M3joICyN3F4u1DuzeUxpHvCV7zY60rY1n6gOyDu+vIhzKFXdyogLzGNu7
 /eqLUNHC9ZjiqmEDRMHk5B5SrnYRsY9ID0KuSkRml7gT/7W2En1GzObstjF8YW2AYbrcG1IB97H
 RTo8PH9AFGssAwSkfsmbVlHcrdPd4I/AWyc9uopjd1BpfJhgUedfjHMsJQMaQuLrtUtbNqjCBWi
 QALhWDfPFDjqWqGuvy3DbxXhc2Pti9hdAfYX7JFKRa+HYik3JreYaykBpTG/49xqrsM8KyYqJWy
 BbCRZfZ4KFGePaYlDjm39Kxe+WqPAksVxGSqgsgCpPjgiwNPJQc9PnO/L+O7X5NFa8GtIdeb4Iv
 fELbK2iimeuLWKKeEI/9qHRhymhvi+qKgGyRxcu/IEEcLumADpRrV3DpYhX4ca/+uJd6CPKl
X-Proofpoint-GUID: _r-JfvXjBGGwdKziQo5dmt9TaDceu6m2
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b570b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3Gb_2g71upWOQPDw1swA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _r-JfvXjBGGwdKziQo5dmt9TaDceu6m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=737 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

On Thu, May 08, 2025 at 09:49:20PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
