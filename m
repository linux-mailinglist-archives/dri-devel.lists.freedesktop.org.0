Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B4B2CCB6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 21:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1D10E20A;
	Tue, 19 Aug 2025 19:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNOTwsmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE2410E652
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHFl0R018054
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eSDc9BAB3b8+b7b3/+MDQM9E
 BEAEmQchCpTlVTVH4Ro=; b=nNOTwsmKxmiAAPv1CaIr7jcGE7rJUarSvvDl0fFw
 2vOcYRSEyqJ6z0bw1sI/tw5eGGR2SMmqV48HP2AXM7SOqjQH5mTNXLfpY9zNn/4Y
 /r79/dDwqOgYdW1wjwD1b1hyR91ItzIuYKdS/bKtYclVd5ROt6sVSfDrOLHerYck
 3ja5ntGtPKSXflcnhIvDPduVrodYB7tiGbDWh3nMjpnpY5p8r+Y25hNIX4BOV1t2
 iN3SxuUmFL4Wk2xc+6GOPUJ2jn5TH51q0IaVL5AVyHpg2/o3KYfFkggjy6tjC+yF
 cqBJP/DHJy6JXqoMjHQM0og9CLI+w/Z2iIZDuviGHNvDSA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah1m0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 19:01:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70bc9937844so27731216d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755630068; x=1756234868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSDc9BAB3b8+b7b3/+MDQM9EBEAEmQchCpTlVTVH4Ro=;
 b=pVKQ4PZfYqVlSXTuc7wegt79MDDh3TvGK5tLNDrFZ7JoSdLJPX+GJGxVl1KL6sBLX3
 W+sELrU2rEjWubnBvXes2rlOvL/WDZSwxvLyM4adctNTroZgj52St8fZikVVneFPvIqO
 7EnpkBC+48omULu7cr7KvBT/JI55M3fp5jJ42Mpjf9pb9ttBEvwy2sV80jdJgRadItg2
 rDOT+Qmpprrscsm0OO7Iy9n6U/1cYk9nAXQwLweXNa01l3MWTV88EO6bgYuJmCk4AvTX
 RobjsnG7vC262FgR9vcBdERp70g+j0KDP45Z2KXUYiLsCGKx6DPNc57dxkV+kuUXUpYb
 xWrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUkTH2Psehti/yRkVKMO7RnFNdS7ej7Wub4tUGqu9SZX5rRsZM34sS4qm+r+PK0X+5wc6eYJFy9Tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7AkeP3Fyl1NYxnRFjnVVXYKAQ/fFLOGAeYsNFfaAthBYXToQa
 sJ/Z3Siya9dhb0gE4g2iHyTzpudKyCbGThjLlkGrRkVPok3D18ee1LMIqDbke0QrQapwbpy+KTq
 F/tVPdWEWCcxNg9KA2wI4Kv77WdhH2Rk95IPdnvzheWdw4NzDH4x4ds4UQcVYiFzghD6KZ1c=
X-Gm-Gg: ASbGncvXWOrhe7JJlZNSVAwunv5LVhy6MZjrX1hFbVA5aUXFv01YtH9+siulkdgwz3S
 6gfCCBDbrW3Oh9eIPvrE84rKHJs2Sl6eNJevENBAw4gRvfMCQb4eTylpQPhLdQaUzQXpF7r4n/R
 APzLgoMkUAgxJmjDrqEl1fha4Fay2e0lMRuZ1JV86LLmwZUgvJW/AxQ5RTVjElL302MdBPXERWs
 3cZxNDJ0Rp8O4gKEv0AH4LoL2r0uIjslINYPS/hcdDaairUW2vOWNFH/32twFzJ8eK7zXhTtUyq
 NhOv/b2lmv7Jra5EK27YWceVUo3fTQmid9nPAZhucOqNJYZOQSdyCtdHz+ebCSbiqDj56+xaqUG
 9KRBT09HKHvqbKNCiYsU6q7HKlzTpSUdGZaVDJiFehZ793MToYc8K
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr1090216d6.21.1755630067739; 
 Tue, 19 Aug 2025 12:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzyh25IcZixT1XrdjSA5oTENrZfRkUdENPuOBeZx3C/0fuWIV+BjW3wFDLEBMFAfYSgCcXQ==
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr1088806d6.21.1755630066382; 
 Tue, 19 Aug 2025 12:01:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a4758bfsm25257681fa.32.2025.08.19.12.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 12:01:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 11/13] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <hrcp5pcjkqotexrnenm7dxojcmmzx2fl6ybxxofbtcot6q2hxu@3w4vyod2n74r>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a4c9f4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nT20EUERFaLimiOwrcQA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: POf4L_whXYKHjBoCTI4pl6FXlLx4PdAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXwU9EC95G5fep
 qg5h29LjVgCrOQ3kabvi4Mi+18aEcQt4CX9XZKnFO/HTpTalp0yD+DVPxOqgJLXMULHLtYKg3d2
 YFs1eUUjxG0tNpeZ0z09qq4N/o2dANdsNyL6jVnBcZqKYSDeHmUZjzCluOBINB4mVwx73MONNte
 WfFsDzjqoQQhbW06U/ydSKsQVOlvYETfD1crvuoJcSEy07/uB4j1piAmpbX8HE6BhAAgYp8FTf6
 AwbWwOSmOxVB4K+npBD+0WXeXLcp+dBmmNL7RwWqLcT/GKyhvRP0KRWOJbizB/nqTXWvnWZVdY9
 ySLSQhhlKjbBUBB3AKVIG2jb3UZ3p/WD4WCqaOix8qxe2IppA5kLqrmLFxcKGATziGxkWSED/eC
 Xr48tdKt
X-Proofpoint-GUID: POf4L_whXYKHjBoCTI4pl6FXlLx4PdAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On Tue, Aug 19, 2025 at 09:31:05AM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
>  1 file changed, 89 insertions(+), 61 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
