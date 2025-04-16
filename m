Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412AA90F73
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F97310E9E0;
	Wed, 16 Apr 2025 23:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="isKcqbjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0810E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKrJV5020815
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lPOdN2D2GxjUoOAn8DxazkVb
 UBcosChdPZCm0x/++yg=; b=isKcqbjPdj1B+U3d6/lwTNFGP7pNtzyZPMsbGmcD
 yBUwTkJY7ki5BxgIZMYogs7OG/XJIcAXu8EBRzPqbUaHpOzImMSDYDjE/vtbb7IJ
 emRBE+5c6emYTv34rLrqyUT50ihPKHl46Fs9/abXlvON6gIvspjeKZvSXyHV+1vl
 DN8DHfx3Fp+wyDmBFMkDD7XitKXHtejAmRPHQMsT0rEue5Bt0XvkWdrG2GpMoaDC
 Py17yvSHsFrEbw89ItXmgixhgVGA6ZjJweqac7Nwkx/mulIUNW5QA5sZ4UqpydGs
 6V4lDRYocK9z4l0/DV7ADFDUM/NOFfSZxNz60aacfdOx3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wn1pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:19:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e9083404b7so3975106d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845553; x=1745450353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPOdN2D2GxjUoOAn8DxazkVbUBcosChdPZCm0x/++yg=;
 b=VMzc4x/D6dl8LgO1T1WGGU5rS7+N5PeYGxor1KJyZvAGXoAd4bPRM3hWaxpzXHcBnj
 /tnrACSPkj3zDYb1LCuwH8OYZ3ax5B6Y3mYgok811aANA63727lk17DJhqyNnVLJMHtf
 vNyWzEauJ98Ozkp3cWwoG8wEFksmL8hZOSnmFwB3lHeyybQWlAd68+zmMLiXOY727hB8
 +TL+9tExFEIM0WIOPr8EbQHvEysKkrIO6J7UIPKKP1eZHJBxW0A/2N+zDKV7lTtgtllc
 AAZWflKLOwceL0ZhN0nNlQXj2GZDdQVAi8Rs0SYOQTMdMZKzppxyRX7M6r1MfonrU/rK
 QSzw==
X-Gm-Message-State: AOJu0YyXpkho1LF5qx1WsMPexVoxDzhcMj6yI7/IMcEbPDUBGKKPSqzp
 bwIYNpw8JSiAsz5aijap3vav/E0PvpURfW5CZRQRaUOJPTZLTyzLDiaGgHmfNWREWGx3hNpZzll
 fUHIQVCrLhDemIfY2vk4cZO5FPvcY9hC3BvFMgDuyLBHwXnhzDKzEUyE4jCsQGo7dP1k0j+HbfY
 E=
X-Gm-Gg: ASbGncugNjrF2P5hnK4TGYkoYz87e/y9G7fjf0WxALXEI6696B86nBrrrLYbEQkVjhK
 gkJqFrZVRyMvwEroILU8AvTX+xngEEcnG08xxLFXh6m/tQE3Vp6BWwfDmqw70XvroxdJriWBJzX
 tkFeAMfQM9SgrH8wJos/IiCbcZ4UZ53fv57zF/iJ0gqePT7FjWS0YmjvQjA3stzvh+r8tebo18d
 /CQS9HVuzRbLiQ4JwQMmwvGfgFGXwM8qD6Z81Cz1i8/JX8EdiRi/rE93C1V2/2FA0Nk1B3Ngd1o
 x3BIGI53r3r+OK0qMoKMwFrZQZunu3xAkassB39fP9vv7m1H6ogNIQzam9Io72ZGTIWYH99XYNY
 =
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6f2b305af6dmr55384116d6.39.1744845553035; 
 Wed, 16 Apr 2025 16:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUGj8KXJI5k/hfuMcwByep+3dU/C//eMqavaVyCZMY9db41fx7/QT3SCEfUNFYr5xIkDR6KQ==
X-Received: by 2002:a05:6214:cc8:b0:6e8:eabf:fd55 with SMTP id
 6a1803df08f44-6f2b305af6dmr55383796d6.39.1744845552643; 
 Wed, 16 Apr 2025 16:19:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31080864bb2sm2487691fa.71.2025.04.16.16.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:19:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:19:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Message-ID: <3co4r3aj6rhydqzg23dxnh3e5asrny5zrkzchjg2dov22tzpho@qptuyivzqv4n>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-7-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68003af2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Xk0_UyW-TLBMhFL3eOIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: r4BXBs71XmGTZ6qCYBfAQcIphJFFREnF
X-Proofpoint-GUID: r4BXBs71XmGTZ6qCYBfAQcIphJFFREnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=754 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

On Wed, Mar 19, 2025 at 07:52:18AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just some tidying up.

Probably there is nothing more to say.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
