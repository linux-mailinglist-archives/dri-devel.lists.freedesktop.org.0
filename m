Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF987AECE06
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295C10E34D;
	Sun, 29 Jun 2025 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECh7iqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0C510E356
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCISX5032657
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U75yw7BMC/S6igk0SQ7PlAp8
 c+8TFboIWS9Vq7PTNB4=; b=oECh7iqWHwXVcfgXCPhAZwgrgIRSNp1O4g18tRPQ
 G+cquXTpg7+KbIZ4Bcle76waU/2UcVfVOpAYetxIiGcxg05xJoJptjI1n8+qfQkO
 crMlx/koLGQ6Nzsym5ASCe4ikNAhAp6YQkjnBAR6rvHGoSGnHqRWrn8jh202q/vK
 VVF+5OFC1mgxwRNBjQKH0uEeGPRnaQRZRrkhPDkQypXmPSNIFl7A1j6deZbC5Bek
 ydDRgJ2sYEmcY4gx8V1u57Ea0OKUOJMsM0kiLN2KmtwwXejR81YXUr6f1ayfHRG4
 Wz/h/Y91x3I/O1pDMB+1+VDZpjeDnanG/84dJY3teCxCog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm29uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d22790afd2so188936585a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208319; x=1751813119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U75yw7BMC/S6igk0SQ7PlAp8c+8TFboIWS9Vq7PTNB4=;
 b=XVTSOLu1JmJHgDVVRbeTZ2fJy55PGGHJNqrbfI3K26wGId67qg5pSwusfsJ3Ylh7Q1
 8pca6rntAlyFRll+y8LYpMnvSm5rc6N0ZrHVr0+O0t4gqAq+gBiqK2k1pTAoJQOS43uo
 dnhFzm0uaEW35HsXUCbFamolrqCB/MY5kp4CrKz/3ywOlQz+j5Hy4mxA/nrDLblX3+Gv
 bXOWdLSoISqf50Te8VDlIaF2HJXS5pK0LqniiE40QKgq8LwIlTblFX1dZCxpqVWxFpOo
 z2UT7+uUwQeg1fXt54zx+GLJsRgB1I6REhwSxkoRfvqwQ8mA69oTMNG4Oiyv0Y1p9j7r
 +x8Q==
X-Gm-Message-State: AOJu0Yyt1tsaYEu93XxfL4YeN0Ahj8rqlTEfksdmOx/hfD8TM5vco4jH
 jsWtIncT1dTZpik+WPxYsnrbZp8cGZnMecTxQgS0UIul+479HIJZf9eRjGS+SpNSJ9QY3dtbCuo
 fCVmE/6keoGhIyUhDnAFvPLbl2EJ1GiXagJSidAqBDRloV7AQS2oEmIZOMlb5lD5cqfa3Rm0=
X-Gm-Gg: ASbGncvRTH+vTdzDwB9IN/uTKBykSc01JnLRUhD2xVvd4gYZneDOUOIe+j2Uz+LG3Tc
 ScsjEHF5BQCfUf/NaK8ZP3az2/1YgZcqAlbI5ktCmQsj2ai0L2bk0ORrtIgr/T5Sh99iIvYnCZA
 Is0gw849tzyZIPExksAYjSfGvGs71junwazu2sj/XH70WztHCK2thY53dYdn7whvwMJn0VDQWmH
 f0MU1n9Fr1giKteuN8DVodx5mZIbmR8IqyqpkLAXA/ePom1n+eVZpMKvluV6sTzkFY+jfA7OcRg
 v9dVAEetCQnMnd34ODi2XBaPwR2WhZbBUIuv3gWJpcCv+nSadzXxaHEGz7K5np6kdqqPZ9vePO+
 HMt1zlLcuBMU2nt9DJJDyNqfToTMjrN7/wW0=
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d4439b9679mr1537818885a.53.1751208318663; 
 Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYpAnwJ1rYQ1S233FYjwYu4oJCVh/e3dqa7Xz6LlKsV9YCedkRP+JE+l1W66OWbNHR1zgWw==
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d4439b9679mr1537812885a.53.1751208318157; 
 Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cd99esm1137184e87.158.2025.06.29.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:45:17 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:45:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
Message-ID: <nij26lzoinzr3cbfmvwzigtxpsjibaudect3i772swbnmyuz5w@2jny5ie3oqw3>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6861517f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zVdBlVQdkfp4bBuhmU0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: N7i-wEd-NLJ3o2G2joxnQco6ZAkRD_5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNCBTYWx0ZWRfX26O68ahof+d7
 KK4VuQNEtOpRwuIps6QrxxWtGPPtQG6RYPOIo0fnH/9UHZNjZX4cj3ejZjfkRzvaSZmDqRe//o8
 Ra4nDKnCUfObTL8FZsCiSiGJjCfGNViOa5U/PJ3+ara+2y2Ab2FqU2hgCAeCXYUxiJQRT68v12F
 kDcyFCiVN66dU+JzWl2t2MtdD77dGO1yDh8RPe1c0ugqB7s2VHLH0+rHBbaKAlKrCi0VGo2JEO0
 d9JAxb+3nSZp3g7O04ny2QIDtXky2UoUAzmFfnvaFQeYZoFLfae/tWFuas4FUZsWjBIADjiLiNx
 /GA88GDlC0gUOlDB5LTEnGhni/st3ePhujYT14usiRRqXyhOaWapUEaA3jaRdlPBAGMHI/W7Xf0
 /EBvGpW+G+6109lD/FW+8lkCJBv8e66nf+MmyPj+Ux49Ml7UoL4TKerZ4HIR/AyLgSKZZTBx
X-Proofpoint-GUID: N7i-wEd-NLJ3o2G2joxnQco6ZAkRD_5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=898
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290124
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

On Sun, Jun 29, 2025 at 06:58:41AM -0700, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/build.sh                   |  17 -
>  drivers/gpu/drm/ci/test.yml                   |  14 -
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  29 --
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 139 -------
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 350 ------------------
>  5 files changed, 549 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
