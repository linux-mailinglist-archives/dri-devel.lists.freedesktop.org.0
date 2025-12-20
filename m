Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7ACD33B0
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7F10E280;
	Sat, 20 Dec 2025 16:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrpgZ8FN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buKjl5Sx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4CA10E241
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKDl5xt3682798
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9n4MYAE58jkDIiJiN49z6oJ0
 IHzYogV+Pz5cPxaJhpQ=; b=OrpgZ8FNSTQKfVhsbwrDr9g8J4MU7ld6Suv+Kaj4
 DmN8TWD9oHerAIpIn/Eta3HEA/b4UHFuO4ZChwQ3bY8GYE4jBAwxr5oq/63jcHWM
 FEbWCZSvmJrlTKymzesKUrqfGGehFU5drNzTENHPQe/LHk18x7VBZnfCu4ZRBzzr
 H+Ae1VM5EaMxy5ckkftjeYUKf1SBASBW6IH6q96w4clDft3QpsHzCjCrQoFyqlZ7
 /Sy/dTOV7OuPBi18wq5dvFDM7ckAr5AxaZ0gBvSy4b6bZZGdjLrpOxAx3hMYuZgk
 Iutbvq3P39RduCnVk9Nb1Tae3RhZBotEiVG9+qpIP1VqBg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqgygh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2cc5b548so87423226d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766248892; x=1766853692;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
 b=buKjl5SxHjSrq8aNwIKH/sAln9NAUzdH6sxqWPvy8Co7k1X1636WZluf45+HDHJPhe
 KVM752oO+7bRpKL05e/N7NRjXYlsHJpdSMvRVxnQPsSfwuZe6S0uCumcLhtNQLJdi4zs
 MBKg9t2u4+P8AX9HMFhnG3x1xTKbtdIXkBUyX19cFgtlbdnM4Krfx6Os/VRDqQs55e4i
 j2yxrAbSvYrofmlHhESXwy2zruvJXP9ZWVOlTk4/6fIJPNXV7WmuP3rLBv7uDNYfP7Tk
 +gqRT9j/vGKIrVh6PV7H9/yiqesoRLH7pEEk3i7xadHGDSUgJYL6cUlcZelu9BL4MBOi
 n6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766248892; x=1766853692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
 b=NHzyl6hiqHceBKsWVsl6oCH4CFe+ObtoSGw0I+Rt6Dw4Mv6U3BhxSrVN1qSqQQifJr
 thlF4snoae1WLmo8hzgN5SHOcKBYyH8DE1E8jhVwGtsaAK6OFaEJ2XPce2XXDd3Ay574
 4VPMNTQDAfOD3yBKYdia+J9ziv0TkUWTTCZXFhiLbEvK3c0c6CcUg5TrYJrVd7p6sGPg
 uCATecZ3+MVxqqEdsHg6E28BG/NgHHzyaeTt3YFDw5xwb5NZxSBWCIJzy1YOc6Zf95Xh
 65Scgrfs9TrcegsB9QK60L1BcTNvwdT86oLVHIROClKgdfhHQB0di06/mPaxzTKu1QYS
 xxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa4U7vRRnCLJHrRYMm4E+5ENSO7oGVNWIVUVg0T5EDZ6qQ2vbrMQrgzKWYv97b1A4MVWYyUc8hXEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfb/thBgxKt9CeyULUjaKW0PsqaaOHp0LXVMfS6z120aLX3dKy
 pdpCYFeUJH3rzWu6pFrNiqbTAbnVmmH/LhxkLgx3095gTG+ei8EdF/60HPbLY5f3Wx1KPPv9x2w
 EQT7uE4cphUnnhEiowbxeNCOXDj1xYXnPBRBSYqWqOBiYywGZNNR4EmrQuVGxQk+iVH3HjX5Q0S
 fIcpo=
X-Gm-Gg: AY/fxX5iCclSHFyq3X6MFqFHtSk5XqdvMtx0b6t2tliPq7MJiDcqOq9g69L7I8xMMeC
 BGeM2abOKfnAjKd84of2TperTizCyifIx9G6LFJvA8+5b0Bo55hA0qL3QO+FgqvmS0lna+L7mdo
 xP7ioEUC7EKf8Ax8Gewg/ZZr4c309J7S3+VdKTkc6v9MTB0G5m9XaoBTZR1nZcV0KTmLWsoQdZl
 4s4P3hWs5bSeHZ1bFLX4UrOUZrBKFOzL1eFLXEVdLRLBVPVdQvSDux/qH5IoTDFs8h9LXlKk78s
 8gwQ98cTUilNMwueX7r1MLuE/ARGOay3uXMMs/VxGDcmbqRAV7A50zcwUrmnyyl5KY8HbwJhahb
 yrFDZXmhRzy0MjblKAPME29udtWUDDERjxlfBxalls8P89Q+7y/tGpY0M9nqMW1Ic9eR+Xl0L8J
 ZdUKUblyoXtoCJS/NesfKcQz4=
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id
 6a1803df08f44-88d833b774cmr98960496d6.20.1766248892257; 
 Sat, 20 Dec 2025 08:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8fHZBsjJX9dWWuG2BVH9tdn1x3HOl6k2NkGdzZQzHpPUWR4K5EYQP8CT6D7PsfaPoZq05Q==
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id
 6a1803df08f44-88d833b774cmr98960176d6.20.1766248891777; 
 Sat, 20 Dec 2025 08:41:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b391sm12373081fa.29.2025.12.20.08.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:41:29 -0800 (PST)
Date: Sat, 20 Dec 2025 18:41:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
Message-ID: <6w2a6bgcsrmy3nvawuvy2qgnhrnhcvi5zdnbsxrkmmmf57wbhq@nft4wqtqwgyf>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
X-Proofpoint-GUID: mKaMFnGB50vzzNTdS6a0iQTLlYUuEtAs
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6946d1bd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=RvzFWoYtHU1D__pwiD8A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: mKaMFnGB50vzzNTdS6a0iQTLlYUuEtAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfXz6b5hRuBmFkI
 nDAPkskj0/Om+j1I0cd+1ECOUUCZtPQsqnPAEdfAGmntycbUnWyv5h+3Dffow3u571YqkB8VKIk
 cTTW/Vot64JeU6NLm7hZnPlh9p7julnI36djqdp9glIPsUyZ/A5mHPyIjJWXuJN9Dl0JfHmWQhi
 JkamhZnxxoHsOPn2xEPj34DgSVA5pGqa4ntzQkwcJkO3FsDObfIMuc1M23Xaf7b2t7Vt3LKeYRR
 LF9MFLnA/y1N6XbVT6CYvt948My69bMCiOVUULG1bXdFE+ozv1A4Pg+JjJx9a8Yj+DTH22w+U+Z
 c0LKuCjhxJ3nBUK50wH2D//AdLEE1ddUd5S3bT/ichkG4ssJPB9oFJ709yoBpdDFsK/3/GWOUAR
 ZHY3f4fFvFLOBtVypZ2ifcbLWnoyopZbSqS8krqUnpj2bBRcBQsx/TnTDfNbhCHVItfgQnwGOGW
 5gDBEe30dW8FLQ3LYlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145
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

On Fri, Dec 19, 2025 at 12:39:02PM +0200, Abel Vesa wrote:
> This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.
> 
> The dual-DSI dual-DSC scenario seems to be broken by this commit.
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 33 insertions(+), 35 deletions(-)

Fixes: d7ec9366b15c ("drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
