Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF38B34EF7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 00:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A2F10E59A;
	Mon, 25 Aug 2025 22:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0VnrkVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D1310E59A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PH0Xbl026177
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fjH+xA5Hhh74IqC0r3nz4iYW
 +qHZrS73elo/5Si+ukM=; b=M0VnrkVEwZb5l/PpJpVjvAG369Z6ozbEsYfLWRWK
 6B6QwwR/BG8/zXlbCj+DMb82ZTPNhdHgJRHn4G2Yic3ns5VUKZzcapGJgongaPCZ
 9EmgKmIma0wZtXMtyfGV0joRsi6cUvE47VUpCWYlVPoMmzP5/lBpauK+qa3OGows
 QGmOZomk5chmEDbCpuOl+Nvi6zLEcoR/E4tjEdBQsSqNssPmKEf5vucfeiQSV8oO
 avkXP8h5eZ6PmLMnEw4IFv7SL0ZHtrS5kLlNj9Xcw1f325BWHid2nWGCxIMHYZgH
 yHoO+TZ/UDFjRCjY8PIKr9vpO8tNPp/uheDRSqBfja8SUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfemft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:23:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b1292b00cfso48718181cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756160606; x=1756765406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjH+xA5Hhh74IqC0r3nz4iYW+qHZrS73elo/5Si+ukM=;
 b=BA15e8I/6jIA+Bqqe7HOvDSUG7nEczA+/8dM+lmgvcSQwe4NLbj1uRx2w9vbcOpOZc
 culCtGPcrTINOZGDxqIt6qDEGfPVNaeZrLowocs6yrQN0Nz1XM8ENebQcjxb++n8J3fI
 NnjAaOMq0aNy6jx9+uisR7DIhwtXKbC/F9TTo1SHo0vHI1oP2ljCDmOWAke91HbN10sr
 tI/rQ1ssJE7lTeBnNeBAU/IVi6XdTVGjaiUqEY77e2dJOLqPyg5NGamJ4mejyw5y10Nd
 mHQeV33zmhkMJ55eGBBqdTEtW0OIF8jl+4jMjsICZ7XX7StWoYCy7DRT14gFcw5tCcuZ
 ScYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJoBlX08yeTD0V+lO6usPUatx56AnqivSvTZUKxgNL/LF5Szc7RUzRssahq1nfX6QgDE1ti+cRlYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyGlzvjx/BFY3uKIjSNG+Ke7F3R56SPBPrgqZ/LabupDA7Tx6o
 Y/Bzsd+Lfe/zp/QgO6vPm8IgfdF/tko8QqgB8yFd0+l3kmcIjccxUSMqmzI0+PF7X72BfCbm7+2
 IF7bh0ZqBq4gMusyNSes919uAQMRdQ0MsyXHgxvVvJiwaJTSRXxZNpvNnWPpVII4Y3e4wt1o=
X-Gm-Gg: ASbGncvqSJvabTVCz2V9i4pwzXG3hzAAurjVO3E3ahBhKTtevoFXCZ2Xyj9ecIuVhYS
 Izk8aXreMsPhbqxG3fb8O4yXZ2WxJC+skhFZWyTFu9tua3acQ6RQjaUbkco8X3Tvt9X5cWaJA58
 bPUKsu6mMmW8V3atR8wVkp19/gktU1SnjeWzStpsyzJV+KkeLu+KijbY0plAj4XOZKh6JSuBAr6
 Wr2pS4x8PtxCezQDYARnPmmtvdRQ7ziKl+ZgRpb4OA77WLHMig7usyI9sbKHH/O37XgVE6jlKB2
 XTKDOcW0/V2soRPh4EWKCImg9nMQcHhE2Ugg3YEDGa+UBzys3ga7wVXJEELx0zcqNB9GDw6y3Vu
 WPmUl9zOikLOIAekY9P6+EV2I6oEZt8eNRt9A4m8agvTqSkWsHx20
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id
 d75a77b69052e-4b2aab65f01mr179201261cf.73.1756160606379; 
 Mon, 25 Aug 2025 15:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gWs5Q3U2MNb4IhmQlYIuCMvPeaLXJdn7Nhfi+5p06NJqrdTdO3fCjgpZVxrr1qDOV5nUzw==
X-Received: by 2002:a05:622a:2443:b0:4b2:8ac4:ef8e with SMTP id
 d75a77b69052e-4b2aab65f01mr179200941cf.73.1756160605874; 
 Mon, 25 Aug 2025 15:23:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8ba2dsm1836524e87.77.2025.08.25.15.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 15:23:23 -0700 (PDT)
Date: Tue, 26 Aug 2025 01:23:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected
 when mst is active
Message-ID: <bgo6yni27nqe4gkhvurrnzvgih4hn47itpwg7afgtctspin52n@mtf7e2jzcukb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9FzAmPmiGi7G
 PLltyveOMZxw76w7aPUvKWfgha6qg3iiEFtX9njOBGxBfFnECS5UJ14mbov8FE9BvkmTjTfyOBv
 h7s6pMUSgnuViGJfTz/fxbP8hCfcLjxpEJbbPoo1Zx8Pp2rsUoW6EJPFM9HECRTRJONLO++hL72
 6GMqcIcgNVYgeC0goLomg1bBXhCcuYE+c/c2y3599dotqcfdojyClATDkixZ8p0+Mf4QVg4AdDT
 CSPPUhJhJhVc21JRrcJvzdv6wuPjpoQyaayyfekgvtMSJQ+hOSFTWwPyuQwrQ1wF8JIP/NsO+0h
 PXkH5YqbD2eA9Jm0pfR4fwjsmfutsHwfbsZirIOoaRv9Yloi7qQpSz1+tXACvvtKf40k8VOCCSA
 MaUV0nKq
X-Proofpoint-GUID: T3jX-9jTwd2p_l1_RKmlcTDs2mOH4v7l
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ace25f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Cr4VjbKX6U7v81t0Q-gA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T3jX-9jTwd2p_l1_RKmlcTDs2mOH4v7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:11PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. This patch skips
> detection for the SST bridge when MST is active.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
