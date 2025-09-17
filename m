Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D06B8081E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8980810E61E;
	Wed, 17 Sep 2025 15:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmYGJNOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3698110E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XqBm020437
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=; b=AmYGJNOg7ZI9mNqf
 ohNuYKzbBoNUXLEe1XfqGDT4QPC1lDgzm60HYvILfn8U4Nb2JNLHsmA5N4FM/Gob
 ve1MgvnBFB/mDsoUTMlag1zyMHHND41OJ4NYgFi8UOty8+wxv8JXM1Do4h40WBAv
 gSu5FehDq+UXNv7Ek9dbdUO/rGo/9PBhhIl5qxCIhOMUFTKxV8xKZJnZRtmGDKOZ
 9qOki9ZUjt6ML7mu4WCIiaepLLxHqltbO2n8xiA29SU/hzHmGwcaDd5Pk/Qxa/8z
 GzQT676WCBNS2ho43eiSvKFqtoylv1Tg+uzRd/98I9Nj2fWNvBVZVym7us9PczmG
 eCNGtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1twam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2665df2e24aso63782315ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122704; x=1758727504;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=;
 b=a4BCAgJeE1bVfdIrIZoih2tN5r7R8LuTopmTVmt7II7Nr1uw97l+y/fTFZ4VghQi1B
 pYQLl+PNbT3uIaTsb6gs7Zh4/8LQcWQrQC2NwRB5lLxsBNc2sUw7tMhNUofdeLTDv/kJ
 6D15b82XpLPYSYHhr770FG9jN/U+sbcyj0PbZmlUp/O6h/NQb5IXzGs+MLFTngUXIOKO
 EJJlSchL9j2kt6rmniwhlpb+nl1gWbcLkFr5/qsAIei3SOYBy6aFjYSaOo961KTQfqE7
 8ZJ0taGmliLNGPfzySVzwetp9wiyi8YMEJu7JjFN+3OKI1ShGTJ5uIz+uHz4vPjVpxYB
 1/hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEy4kdS782wapzJhOg4nIbAbbU7WFCe5+t9sAa7Ude6qoxuQMSgFgd6j52vs3UHHLqnquVIEO2a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfSLHbwEjAE+AmlP1ui17GJIW0UncW2J7kokJBoG8hm26mBblK
 cgYz3xJJZPqPJSwZBC1DQVxtxIUsM0haT1xmZJSshToFsGO/+KxgDW6e2+Q5wYFBDqlk6xt0bRV
 YDKBIgzKcomxzNZuh9jwtVx3trS25czAqI53YZapKBdyekTBIQ0V2z2OyzV7g9ceKectrJGw=
X-Gm-Gg: ASbGnctdQIbjpNlqNBdunRyO1rBqaPH3MngPsyPLDZkWo1rLVFlCyHgaZapmxJ+TFWs
 VwlvRi+AG5ComRx50As0Dv/qhX9XDS8bj2LvWerMbTxUvChdTPM1Ks1ZG0ZzgJEkQPwz5qKwLQN
 Cyf88BX8+fL3u+gwdbZaLijh1tBAqdiM/Rwotk/eao9owsWYw/Dvxo8rb1uKCWArQFjbHZVW7US
 TGdza983nyeeqrboj1BDGvioiD6RYIVw1UDW3dJKsM2MsJKB6EVYyKsWzE23Qrm0AXZPE8i5uF+
 RteLJJm9Stw/QYQ7lkfLkWgmZnA6ZD369sAXCBGqF+rjJgNjht2ns9eccCdSwA==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id
 d9443c01a7336-26811ba45b9mr26940345ad.13.1758122703757; 
 Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmORI6sNcePUHDL1ea7LBwUjWJDxDDKVUaaJcRzC/M+TlpMhiORpT2SoIF305qk9daBSB9Zw==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id
 d9443c01a7336-26811ba45b9mr26940035ad.13.1758122703239; 
 Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84a80asm193499715ad.90.2025.09.17.08.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 08:25:02 -0700 (PDT)
Message-ID: <16701111-9e8c-42d6-8fac-2f4b9a5e5e5d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 20:54:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/registers: Sync GPU registers from mesa
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: adlMQqq16_jL68dxMlOvJcWu7c9DxUTI
X-Proofpoint-ORIG-GUID: adlMQqq16_jL68dxMlOvJcWu7c9DxUTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1JBm5k50j62Z
 5lgBFqOeLLXxMuzvb0bDKGrybeFxOyxS9MNfh9KFjbryLAndIPUQLkwRo9YjYHqLWdpN4AsSIdg
 vbwcYfDvDOcefxm3XLhz0HgOrm7sgcRx9UhZfyIa68ZWOi9LO0pP6Z/vY5Ziuv0PX9ZCJfKHpBS
 XxEjAmUx2t10jVseBthufeP7xJNU89gGK5mM6kMvim1VEacfy0xV1fpiL5Qlm75HnMO4pcJOI7P
 BoiqJVLKDBseim5lV/BOMLa0gyfY0F4nkPHBPxbmLVaSeJ2F5pBIBaorkffB0VeGe31g5I3CoZH
 7PGUsFhMea/UXI2Z/iOG/Cq1q2M6tgGKqrb4nhjP6ge6H52e6e9cu6wNPopAqoy35uy01YRfi4v
 7Y4VOdb2
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cad2d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=wfxb_XhhgxZQwQkhXVMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
> In particular bring in `CP_ALWAYS_ON_CONTEXT`
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> index 9459b603821711a1a7ed44f0f1a567cf989b749b..6ea5479670970cc610ca25e71aa41af5f328f560 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -254,6 +254,7 @@ by a particular renderpass/blit.
>  		<bitfield name="CONTEXT" low="4" high="5"/>
>  	</bitset>
>  	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
> +	<reg64 offset="0x0982" name="CP_ALWAYS_ON_CONTEXT"/>
>  	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>
> 

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

