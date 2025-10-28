Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49606C17264
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6253910E688;
	Tue, 28 Oct 2025 22:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ki0Mq75I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGM7SB9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0110E688
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlUWD2554380
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1me6Y331o4LK9HXk4HeTnXtF
 sN7EPXvCiOq7Qn53yrY=; b=Ki0Mq75I+m1RfqsuDmfGYFvJ8srrwhheO6+un7HK
 cuY2kmSa0krklte3J82ZZiXXye7kaOKJZ09p+IbaPELIN7tuyVoIHyzxFCv4eLNC
 gLcBMxQn5lUgtVDF7kJrQB1pZCBxo8vb1PGXj3lQsJV3l164rmc/NO39XbmBAAYc
 f7uVj7XZc371eLRejWKFjwLXBBWcw7MI234VfLkGFdSTa+niEuQ7SSEsafg/UaU3
 +NxgAIwH68Pc++9FT/Dr7Icw+U3Ioo/1LecGv5uiSMifNPkRSgVCuYiuhJyfMo7s
 kbBTLrdJd3kozhZpgzsVZsrLz6ncNgxINORIzBZtitCw4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10bae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:14:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eba10ad6e1so63322891cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761689654; x=1762294454;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
 b=EGM7SB9i4942S4QUVzJYzg0C8cPGGenCKeApan8T1sJEqhV0IN4ie5j953sxk1KvS1
 fra4jEEQVUXEUSkZeUVt+NmFpLCl4Cq6TwBcL2OgFXovFcrkqosMGN9avIv4L61uZ3fQ
 PXOAfYL2uxsadxVE55ruYOL2xjMvX60FwHwYC3iJA4L0aUuyNYCdWYa/ME4bLNPvJ//4
 AZwz87LFFFKCpFtMPeFe63eEV+2tWFxsnh9+8icw6qUkRW8l3KQPiAD33BnkxNHtixB2
 kAcHP0JkfJaTxJcqppxAltIHl9VUbVcn/UASzCmpwxiuItvi1pspPOXO/8IaDC8Ku533
 KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761689654; x=1762294454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
 b=gbLdOKE2JF09iYLa3mrDJtzr6SYs6twyhLj358lLwKiAyQ+NyHgygcOknfQrS3EMgx
 /7qN/kF21JFf+nb4S234jbSxSbSU/oaO0TWHYURMBkFwrqRMSDebSPVy7kzsWQrzNB0b
 DnM74dx8r5iMX0HN0XYPpreE6gr5JNKxHKQDpSXWHuJtKbH0Y1SCsUQ5BpCW8ZawAu2Z
 nW/hu15xUht+zaQcGwBcRUdE7ukrowCy342/t1m0T0VA2JoYGTjy33hQK4BuNVs1N7qW
 x3TSXDdHyldFxg/wmh2QkrWwYfV6XTeX0KTZNRHEG3NVT4bdVHiKxuTgO59U8/WCih8L
 Y/vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFUfsI6W4jbBuoVq5s7n58IFqeGncUHo+7n7zml/6VJvV9H7C2a78MUa+7WuJcN7N8e+k8TBBRrZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOrmZ4mrcrpTv3MiNlHVZOfhiHXahO1bswblxP7WlWEDvx/ADc
 6lnpUzuMFP+mb3UsVP1S0NCVxO6LdaRQrVYrXqLSwitT2Pit+/j+5YWysHh0B/d2VWRWIhf+p9R
 JGhPqcvuQda71UHyUXRrW1xS8KL0ArO7Trso+gdDkwZvx+cm141wZDegqin3cM8EuhY1LjBg=
X-Gm-Gg: ASbGncsFitWRU7d4xipJk7w7Uf4OvR8si4NshnoO3PvmXyzvq3wNZ1MaXLcA7bmbfcs
 Fz/XH27+W1vajw4dELoNpB3MCrvIgVtxZJDrL6mygs1xr7cKLbrrI0t9zsd1Mhcm7cmlFVYtlON
 F3hufEGy3XYLqKBdS3eK4GWVGhp6MgETFp9fgGmRldR4wHqyUrmmvhcyqqwephSqw9qb0RuHGx9
 3CqhkE5h6SWGAoVTg63lCcV8ImTO+wSUfshIo0Dj7esQfmymKhal212ujZ4mmTVLTK28spPkW5i
 N69rUsgsC5yAIFhVHKBmZzq4zl8xguclvsMepzTKCnIBBvpGRrtVSQ0RcbbeGaECK8PVAGb7ka0
 6djKfKKNnzVvKr7actDxU8hFBPUG8wMEtTLTRDptUuTJ0SK27lfABUQMWWmp6slNebIdXdnX9EV
 iQcI/8sFCNq6Fa
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id
 d75a77b69052e-4ed15c765b8mr13810291cf.83.1761689654135; 
 Tue, 28 Oct 2025 15:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEaAR+XeAuLNAUIx0RF3XIOtIX1rvFmAxnu86IueWYjWEDGa8UW2uPoQg5lQeuV8zGvL1PoQ==
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id
 d75a77b69052e-4ed15c765b8mr13809811cf.83.1761689653577; 
 Tue, 28 Oct 2025 15:14:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bfesm3335363e87.14.2025.10.28.15.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 15:14:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 00:14:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <uoavlz3rejw4ntnyq5kwf3fy7zjtbnrldqvwj5tqtahee6kxne@nhx5wgo4zizv>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4NyBTYWx0ZWRfX6fL0VZybK/jS
 YSgT6KiSVjAaysLmUku48YvdPKmFZ45IwXNJB1OBni7Rq+1dqKkM8Y0vFYUwnk7zTPqUe73i2ID
 dWrx2jxpb3ul1yOYUdSLDs+TJNY+eMzHfdz4rP8ugfOXfZbsIZa6TtoH4uIjxMOE+8DxGeqAEnA
 SFDZpcWWUw5RTTayEs/QITP/rwAWqiaxbLdxHJHl/YF9nILihOGX4nycj+0zpU4o5w4c0imwBXr
 MnUHsdpCKk1Rul/tIz7msRCjVXEBamfpvlZ7DpM+iwzf1MPyULZQCxBrn/mb3omKnRbWBcnC2m/
 RgKKY2sJmywEfWzaAuhqtDtoWsClqF4LmIsBfchXmN2jIaqSzyWy55EjPqQ3mzzVKpszUMgDsol
 reEzIwGlcAgSnz2QbLVz2E40rzNnVQ==
X-Proofpoint-ORIG-GUID: xKYr9PLnmX1F-TUbcusBcg4LGKlRHuMj
X-Authority-Analysis: v=2.4 cv=EKULElZC c=1 sm=1 tr=0 ts=69014037 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xKYr9PLnmX1F-TUbcusBcg4LGKlRHuMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280187
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

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
