Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DFCB3489C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA7410E517;
	Mon, 25 Aug 2025 17:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiMuOHWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805A810E267
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG6Vu8026003
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+ihvTWrm11MUKAQSxwlSq5xe
 EvcCp7RJaL1CqX8wMzA=; b=aiMuOHWns1NJzoywgUneVEmQ2c/6snoKkNz4yiF9
 5t3/lof2GXO/P6yQZiNeI4wducHW/xmhUsLYkn95Ht5OhnXE4rDAEr2Gj65mxHAG
 883yvQRWi3U9gYL7ufyftSLgI1bVGj9iNaQ+3H2ERMaR80Kd8DKOrkj5IRMhICqm
 n1AB7NgSCx84781yh3TIRSTogsmsCLOwJZs6U0FuBJqY0PNofTHBJ+5Pts/WQF1D
 GspDON6x6r2fgaHrf9s0naumx0dyrdiNEIXi3eHKkivPtd9Ws9dCxpH5KIyjho2R
 vRHEMFKY9VrM5N346gkw7RjP+iofVStmRN9oHW+5F+7rrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85xam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:25:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109bd3fa0so46672011cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142753; x=1756747553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ihvTWrm11MUKAQSxwlSq5xeEvcCp7RJaL1CqX8wMzA=;
 b=auXlL6fyGSMBMdXV5LCg6o9NmWH6eT4BdzMZAkikx5majBvkI0aLYBWWZx9iZidfc9
 p6YqaKTVw8b8JxIq9Ily14+vwoGs3U66+8TOP8HwSl8oy7b/qXMpgb31xOtH6kWyVDVS
 98eLqIK4h56+XF+RRKdZAZho4DoL1BjSW/SaPFp7HanliqALyfBzrkUGrD79kadXFy8P
 sF44hKSJxRWBY0dEbreomZVW9a7TkNkHxLugM0z9BhoSqyYQ3Ts33mFrPfwTqyJK6kBV
 C8O6msPPZI18iDBfgstFLVeG9aCc66+Dh0QePKOJZ/7W53C68z6csZHoosj/uA2712x1
 PkdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNtBEcOBEbM6rW7Fcs5UErhqsVPQ8EXg4IBOSmIT9XfR31IpSucCi0a2jUOI+dNiXZJIZpi4GaHus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM6Dw7wTQWrO+bRU6dGaf/LjELzAyHPLuqzLNqZx2eqlSR9W7y
 2bFo/H7kgjAmwOxhS1CACA5mxxs7/OnaM2/WkKPud1bK9PGhnLZnI4NxxT/TwZbuQJ9a7IYLudz
 Eqt6sQqhb51MCAnSV2XVlOLHb6nqIU0WCxq9P1ckcKVivOjTrxmM+IyYBRWHPCMjRG3YMZeE=
X-Gm-Gg: ASbGncuHDhaJFROsgydfWeGjLeXKkkoNANYHTPwoX10cuR0jz2myRS+Fco5g0Qwd9Gn
 rpc5IjZKGgw412semGZfyZTcj0lQjlG0VpOaNyBrumFOZ5ybA7JCxekzcVhOH+s4V6EGXTQZyXl
 fJVRfWwU0w803aveBw3YUV9FZcottwnVvhg3hh84TX3rPO5YrRLE5TJmmKRjD2KeuzU+gyDJbYr
 g1PmBs4I4hbFL+hw1zvdeinRvfYj4ULVNbl0H2dv7Y913J0StUFJqQxKS3KmLoGhpurC3pN1uLv
 fsUFXMBbybcdmig2P3xYoshBw+cZRGSRGFr9uMo2yLjnkYQRkOs92rDEMWQm/v450BlbltfudS7
 84piw4mXmWl+99+H+INxmIyLd1zSp9KPbO+U+vGuY3YNzZobnblPx
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b2aab20a5bmr188355431cf.38.1756142753372; 
 Mon, 25 Aug 2025 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaaJSnlDTCsOVk6vybE2eySYvDUVhffQEmr4Tj8nbzRC3viCjZnGQfkVbLytk3PKPOgFsSyw==
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b2aab20a5bmr188354841cf.38.1756142752721; 
 Mon, 25 Aug 2025 10:25:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca6713sm1738580e87.136.2025.08.25.10.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:25:51 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:25:50 +0300
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
Subject: Re: [PATCH v3 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <gxhf3hexw3acfgfyyiarucrsjdhxqmctpoq4xxve2j2i3frime@ga6eqec3lrd6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: semfezwsqAKgJIiIpQJj9y1w-xj_45Zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXxlvjP3rL441s
 7mG/Ph9pLL5jz+UBpYxYn9sYpGE7A1MBbcNnJ+OVimBZKFojyVVcx8rFsJdvfKhvvV36F5sjlyY
 Fxsf1rwosoKm3JRGQYo2WZ8xg5n14tO+dbkzMjlokhWsEzzmLjLQmY9KrQbJZeXB2xOBxWXdvu6
 m0O72cRyMHCVHksHZqmG03Pm0jMZLbmKPkFFEQJcqJn3FLtOoFS+t1PJn0NtZR698xmgyRM6iIK
 NyiBNLSBw8MQCzvq3CJ4ZNlVAvuN9WSE/wHnuEusjzncKYWxFw9Vqrz1zGIeJdJ7dQ/N4TpWGOv
 6t0XV5PFQuKqhio+V3az7CSgGdhFdJFW/aljwV2imfCFTplRZLz3ySQRtFrKNwa9bcUAVsZ+U0W
 iSCKcE3M
X-Proofpoint-GUID: semfezwsqAKgJIiIpQJj9y1w-xj_45Zd
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac9ca2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QFyoUhfU7BN0Y13r8iUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:15:50PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.

I'm mostly sure that this needs to be reworked by the HPD patchset (or
as a part of this patchset). The DP controller and the AUX channel needs
to be on for as long as there is a DPRX connected to the DP port. The
atomic_enable() / atomic_disable() callbacks should only be handling the
data lanes.

Nevertheless the patch on its own is correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>  3 files changed, 12 insertions(+), 20 deletions(-)
> 

-- 
With best wishes
Dmitry
