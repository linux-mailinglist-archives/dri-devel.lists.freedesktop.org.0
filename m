Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B7B0EFAB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D0410E7A0;
	Wed, 23 Jul 2025 10:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSbZ/oLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA76410E7A0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9EOdW032283
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=; b=dSbZ/oLyUawVCApG
 U9s1cCPf1xaU5ffr1QouCSCReiTXpsSdXT7yImzX80Ko4E33y+KWyJl5y7B9zmS5
 D2U2UwBB8crRwf3p/3/G//AUWbfC/MJa/EU5dDSNahH0XM6MGursDaTOnoT41VX3
 ocl/Y16OYNQ4+WFYSx/gSyzZIKXHpeXcQs5uQB271ERjdxN9/O1rNtjPHXFw6z0n
 4UzOtDr4+5w7tSTHVyINko/jOvcoEB2IihBvFnWmlWvjwYT5s/B3LblCndbDvFLh
 LXymxsVGKKRdd6tKAMLHV5BmUU5Xv3YP7Vx+u6BWr5Y4jeKNNlzNPAclWLc0rl+L
 ivewTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1c3hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb030f541bso15667346d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266181; x=1753870981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=;
 b=CH9aQdzbziwLdkPabxbcipgAMrAlfy5xIOixhBj98t9g817Quhh3i9ZpnmOedRfkha
 sqbYodyLwAwrp0xmuHbJdpRA+OPduFc2wweQp7gJXDy7AgbWj9L6rgpkc0f9P6/oGSov
 K+oESkz5y5QL4fo5de5gl2IMVN7+tJsPZbPy3pBEuT4hWBjI72jheL19BVMObHIXHKYp
 pX5/i2f1AN49koTj+Z+f3YrGdiQJHY0DVgLzEpY4hM6YKOd51tcGlmB9pnBbO0QCZQ40
 mMEzHullzz7RYZc1YlZ3hIkhO1Nodo5uST8I3GFtakQ5/xrkrZ1c4O2FIRoT65iZxjz2
 SXNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHYZjJuuLvYUv4jGnBor6aw5WSXMO/nLaQxj8R/SgqxoerjIeklA7FFsr5vDtO4GvG/GAOeWJfk9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwYvtzV00kGwJ/jHm3MGRckXudOlAVbJ7cCriXtnyv9Sa1bx22
 QsFX2wEkI/R4dfGdir4Lu5ZDCAjn/6agx664xHwhsTVyCLHVj0l62EpbneD6T+fhPzfsPlZHZES
 b+IWdLJeSGvZiqgMV08JryPIQQjHAN4VD6xvvYtKawGpIYsPqH+AU7NFmRy6YOoUV5fnAss4=
X-Gm-Gg: ASbGnctCUC0JwyZbLBSd3xfq1C7fvVGbjj6xq1C9CY6hSRO2jtE00kNu6R7J2oopEpn
 bhjly0Q+9Vfs/p7st7+0hlF6SFt80N8qgRSwxw+jS9Eo2Z+APe1h//hY5PTjkyRnp0Dsv0D8ZAq
 IxqAC5ht8qHIfRaoPpJNIfghiQkdxy82PYmxqpQOEb99wYiwsOmeaUwBv+bWKFHvMFZky+1xTqw
 Q4hd57bRTPow8l02liple5nQHv4y0BgBzralGS7QBACCncEpUkB4wqSw2LHNDCmNnQugVEpDvH3
 BcpvTy/6RYUx7WgJC44VXGQvvuyzkg/3yR1KJV3ZVCx2Ts+/QXS6LdojnrreqOtydJp6A401rPj
 KJgoRPDYpMsXDeBFbFg==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id
 af79cd13be357-7e62a1af38emr109302285a.11.1753266180902; 
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbdAr1cLYfzXD8fo0X4Lr4Ip40OFyltSfV9KEUBwzI9EI09L7HNQRYzee7xRd+UpVLCkm7uQ==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id
 af79cd13be357-7e62a1af38emr109300185a.11.1753266180496; 
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6caf9ad7sm1021436966b.164.2025.07.23.03.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Message-ID: <ffc28d89-ba45-480a-b664-9e4ffc50a3bc@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oOun4I2hweYxqAqhdFWUeuILb9gfCPh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NyBTYWx0ZWRfX8RxMlI7ll0dv
 k1f9IzvqstZeZ9rjONAYhUJlXneLhw2XUFGmwDFPGTaksFHO4E7pd/RQ0NZb7mjRHma0BgKpmyk
 mG6Q9vopCdLnwhYE1c7q9vXbPupgksuSrrB4KHSU1+cFFoanhTawtA3Gj2PeEjc4B8FwWeN4Qyj
 lR3qQcNFMdJwLGQ3fM7YIiKjUQfiWVtomOMokTzdNXgmToS9YQ1LxbZAqDkVm10DAFA1Oxff55+
 +YtNju60mm9kpPXv+HFagJ8sWz/DoGQRu7Jpifh2MzdnwT9hQH34hBx3tR8H2nQcI0QZH/wrXr0
 +AjstYapipk/RvETf6g/TaFOmqe1Ow8mQdUuD+4MKSn2uGyJxWZOa7cDtmFVO5vdvdV2mwtNAW2
 99ffajhDPh0yADoXPVtdImv56LYGF7VaaAbju5zra0zNJCfSA3QRU4S/pgOZCVjnsQi62j5s
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880b805 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mXZsdZnO6U5RsJfdWwEA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: oOun4I2hweYxqAqhdFWUeuILb9gfCPh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230087
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
> for a gpu. Based on this flag send the feature ctrl hfi message to
> GMU to enable IFPC support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +{
> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
> +		return 0;
> +
> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
> +}

If this function is not used anywhere else, you may want to inline it,
checking for the opposite condition

Konrad
