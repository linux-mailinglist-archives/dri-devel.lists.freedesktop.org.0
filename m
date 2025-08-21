Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FCB2F57B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA92010E921;
	Thu, 21 Aug 2025 10:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOwsiioD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D67610E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b9pD006311
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=r914EYN2oHqG39oPT8nQaNOs
 AXvKl/bytIkZsYAvQVY=; b=DOwsiioDOlsSL104WqMxnj2XV3DqmzE7CeRShTyE
 wDqeftQd3Vz+ACmdeVP4+HwfkhmMH0U9ORUHKNVFrnko+HNulb7/LJpiWofgCspD
 lSgjAqB1LNfXPRLwx1MSKoWCshW+ZDYJ2oNc77x7fuLc7vrK5ZxMUl34yy6zjOqD
 kQscF2TreHZ3msQmxZQJYfThzTCw9H/7BK2r2E6VSp2aUT6dcQPhl70t/gxygUgd
 WWLoDKfB1tbQl3VyEetdumST3BYf4+aPMQsdKkuRmYLh3dIM5BAYuh2Yk42DUBfq
 WGz5lhraaGeHq/FTlarD9ZFn9vXeAfdRfRBWkVk4iPzMPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52954f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109ab1e1dso36893681cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755772688; x=1756377488;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r914EYN2oHqG39oPT8nQaNOsAXvKl/bytIkZsYAvQVY=;
 b=AHAE47SFGS3VNVYHK/wRRGpAMdV9vkGd2fY94QplamK1ixe9qkQUtKHRNZjGPNcpid
 cpOVlk4ZMOTDFH2L+drYALYF9j5LkNQiLQ378iauC2dGC339waurKRLaTt6CnpBvwk9m
 tc6GwgfI5126eVtPKv/+EoVl2pLIMxppT90QkJ4cBHlaeonzxqqWhaoT/E5zCE8apHtk
 Oz0OkFGNOGCXN0+HgedfelDAcMRMzOiaK/XNX6TIYBMPTuX/i12d77SFpMqPgm+lfMn6
 PJEV6fyYG7xx+nwLPFimHtZkIF+Opr/MSLlZJlc7oy+DX6AKl3YgGvHZTuw/Jei1mrQA
 276w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/N2dLxAt9vM4DQJ+HzMT+yXjOEKzC3jOTmDONgCsRGIr1n7rISb0DT/wHLVnktrDDmOdZBugDeio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/vO35nIQ3f+GsqXZMwkpsrJQh3u4j8+Wpd82AOMqxLpfrZei3
 5wonPyUIbZtx06YpnDpQLck1dRJK8am95Dzvr2MNlgklGMHD/97MbjRfCubJqgUYBPcmHDe6RIz
 9p85A+jfji/A8+g/Va1M3YMOvwplYYZqEHb73ecNDqTWhzt2ysoUUJLu7plqfMOfaGPgUVD4=
X-Gm-Gg: ASbGncuEUILSxM7Svxq5dtGjaodcIPmsrRzM5IOoreAo0lGMgZjpePLuADU2crROV2L
 zAA/CuYqwTJAdSyNE01fgUog5d+MgaBLZc6AVhB0A30exgBOn24NV/KZbVskETGQbEu5P+Eiup1
 HqzVWq3GFJD4WftNVhyCVt2HnIYgbfPpcb2i2YyXZqXTgfNE15KqWipnsUskxS/vJ9SpSHAgzJQ
 IlMs3SWvg/Oftcwtx3qVsMBptJCPBMSkGW2j4HFtGYMYCyTLP70h+KGZI46SL0efIjNowjHQ4tF
 EuvBCkOImNFbbhjfqkkob2ZDagWP3eCrwJ1TF/1ZaSKlbCtAd8bsL+pGRkTiXVi4jXfKFkPEyfw
 NC6goO2RdG69hz/4385oV60VltYNRQ9gLerc/dhPfgT1qJhhIvfFZ
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id
 6a1803df08f44-70d88e3741emr15983736d6.4.1755772688285; 
 Thu, 21 Aug 2025 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEa7hNzXAx5DgTP1u13ijsgfOsTyYMteNBIqzj5N6IcVZ3PMpHJWc/EQSHJlepAFEYsq9ykw==
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id
 6a1803df08f44-70d88e3741emr15983356d6.4.1755772687617; 
 Thu, 21 Aug 2025 03:38:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef368d34sm2973505e87.58.2025.08.21.03.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:38:06 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <freedreno@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/mdp4: remove the use of dev_err_probe()
Message-ID: <kefrdoyd5dr4rjvz4lmtznxw552wzuspk3pdse63zm2kmtnpvi@wzzddue2acrm>
References: <20250820131300.499727-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820131300.499727-1-liaoyuanhong@vivo.com>
X-Proofpoint-GUID: qHevVp9FV8YpevlwieDQcGZy115kSVlb
X-Proofpoint-ORIG-GUID: qHevVp9FV8YpevlwieDQcGZy115kSVlb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3fuWdK9tKplg
 erv8tf+r54IIevYptj1Klj3gB3F3BmU24BPBlrMERrj9jE/dZ8ek87Nehfri1zKzL4Pk8GCaXSD
 seNTMv0QNv9gaTCU07v4ttmHjtQWwvF3hUb29kOCG0Ad/FxvUteF9OZwQO1zhk2jzpSmbhrASxl
 qaxaiSmY04T+r18HxANC/uY8ru8voSq9bEEy7i2fvGNkgOnmMdt3imxZxGGTwzCS/JZdSm28TjB
 g4yHDXSeeWkKGtjmeBCT5UVVvB6bgCPYMXTSLnKmh8fL6LfUAWMHuS4f6ZqAgnIMNMBtAx3vqPG
 jLG/k8agejUGq21A14+2bCYij+f4U4NVWxDVOrwpZgPv+cha+WmvX5BWGJ8KWnjG3fuIWd2bwRv
 7r104bef6bh8Cr08lFyANR9plEo4Gg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a6f711 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8
 a=i0mAgyhDueMVXABGR-YA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 09:12:56PM +0800, Liao Yuanhong wrote:
> Logging messages that show some type of "out of memory" error are generally
> unnecessary as there is a generic message and a stack dump done by the
> memory subsystem. These messages generally increase kernel size without
> much added value[1].
> 
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value
> instead.
> 
> [1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
