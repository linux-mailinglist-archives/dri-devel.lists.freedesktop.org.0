Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE5BC6B2F
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 23:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5B10E8E3;
	Wed,  8 Oct 2025 21:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBU8802L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDB610E8E3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 21:40:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IoN002413
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 21:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8PqFyFEB6Vdzy/Ws3S18XYPm
 NAlesFbDUqjTCNEtSp0=; b=kBU8802L1DozH4D73b8pf6uGldSd8MEH2QJC1a2V
 P3O/fKC4BRyXuEP5ValpF1U/7JxeTqKqKB7weVRLgvh9G9YxgHkqc7HcB2WeHw8o
 d0qPYjzt3hFDP2HcfKsTtnfVmJs2jP7Wild93IWUCPnnrSKWAXA8XxYwVsBn7sVw
 IEehhVKSfKup3yw9P8/e+4UCgYMwbsou+LOjELiLZq0UrJjsgvVC9+eiSMUkqXY9
 r72oXfDaAXUh4v0ZFSE5CdK44KKVJvCFx1vpnufc2Rtjb+41XOk6RpRqx4j7w2Re
 mH5ZwH0N5BUdm2MirDTzxr4KnkT7DZHRvOjrw9KXrzUidg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m0pes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 21:40:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d77ae03937so10233901cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 14:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759959608; x=1760564408;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PqFyFEB6Vdzy/Ws3S18XYPmNAlesFbDUqjTCNEtSp0=;
 b=FpLvYmYneHW7rxRsLsPdDGsXquLJ7VH4fcg9OL1lSo98ljSMct9QrMP49zq1dCs2wr
 gEQOo9hFTRL48RJn65auWI98Hk4ERQ+duAbpsqraStlq0BaPNfxBcYsFU0AulmqRHJxG
 UvmsquE76gm34RjveqlVgHTL62TjiOuXULzPgRCCUmmClVpoZb43tbSYJwLfcxeegyjf
 ddgx5E9asatuPVFf3tDQGJIGGOC5OXMxCvM/nyKxmLiCz0wL1pT0abEmDNMKpzylL9Tf
 wDVCK3y177daJBFP5n7Z1p4/htj4+rzfxJWuX+GR56Hbrbeuum6SgJatw8BgdD/dSQ6h
 64oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWitgKzZVVnMTis6ide1ZdVlaZfkxam4k5ccniG0Y0N5nf3/FpR+vYymgGGFhCugN1H5Jc5egTO0GQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnMFr54l2IpV/gl2aJgmb5hZoATbScs/3MQGUvpPvHsUEQM7lY
 xLARs8VLQDHiGNrigTY5qQ4PocVdPW0ixETbV/Zie6gyJ5BTFP/y4mopeO49+/dUpxFVIEnKk4Q
 uKjpYux/RJ1bmQrLglx93Uftq0owbayDiDsR/rP8oLSiQtyz8AMPZKqnmRY09e6qnx9hqbio=
X-Gm-Gg: ASbGncuNduXoUqSbXU+xw9RqBhq1ILE3jPalj7zFasU9TBXU+DmfHJ2YDKhM6XPD48A
 1bf6/pU5zo0MupBNN0/e3ASJU4idAgnJuejvFebHxlfQVtHTbwnGIUna4h0Ij04QC0C7+JfJJu6
 uXzbH4OIF02PI0GYTAHDua+TkIqhIYA8+9vcZFiE33Guy5vN/QWs/7fbAj4eQFIygHSzW1IpYp7
 xBvN5FuibNESY9fXWhHE+iRl5LALDUMzxiOZGD5XVfTDITSDmsJRgdCcQFICcVIs/PwlhM6EoC1
 xEI1nRcqQEyrVvRJzmLyJvWka8l3BRIgT/d/pRnRk+ym0Z5xmeje4duRyypHzEzFAD1XfcG0DiI
 gWlw/0lBYDr4DDMJ/yOlgcXS5o4uMb7bVBK5tR6J6RVkTwj7MARkZw7gjRg==
X-Received: by 2002:ac8:5751:0:b0:4de:74f8:b2a4 with SMTP id
 d75a77b69052e-4e6ead7789cmr70880261cf.53.1759959608108; 
 Wed, 08 Oct 2025 14:40:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtsj8agBcjTN5kFH9CtNM0OzQ1jTxuKqFj+4DXfwj0ka8iE7f9si9r17U108+0JLIV8tG54w==
X-Received: by 2002:ac8:5751:0:b0:4de:74f8:b2a4 with SMTP id
 d75a77b69052e-4e6ead7789cmr70879791cf.53.1759959607556; 
 Wed, 08 Oct 2025 14:40:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907adb2512sm375052e87.94.2025.10.08.14.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:40:05 -0700 (PDT)
Date: Thu, 9 Oct 2025 00:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 drm-dp 1/4] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <w54im5c6zbeoik44jrzvwnfrcxpbf3pzke74a7r4kcgq6balvh@d33v6xpmua6s>
References: <20250926011500.2545817-1-shiyongbang@huawei.com>
 <20250926011500.2545817-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926011500.2545817-2-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3MLpHc/ZA/6s
 4mWZSVPZU+af4qeYvqi4kBAcbnzAV9GrwyvPs5xHjSf1vPoFnjjvjKcJlnEt7jg/SEKNu/66Rrg
 4xnFpw/LmZHcn7FucO64sxr9hPvnfAqCD+7Mnvy3Xh+JkaFjrSWU9Rq9VsnUdTS2xLq8PDwzMFS
 VRTkWPmk9tiKc9LzIQ7zOcuQmFZqe7xQmubcAYbxlfar8zOCuDoGlDBQ8TazsXt3OmTWP6mnfzm
 hlxqcCba3z1srvphe7zn2IR/Z6NKaU8sO+Qr5BvpiUbFehEUkNgW89gwnvuwCFSMCftiiQMXTws
 CcPwhxV77TsFtvG1A+pAri1Yzc1K5wQ4MMNrQ6YC7lqjV9PZqIqUOOCFu/8R1hq9yxySgy8kyqi
 I6M+OvvJn2fjjkQ2QCXGdbYSODHJcA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6da3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i0EeH86SAAAA:8
 a=EUspDBNiAAAA:8 a=QVYvikxniASighArfegA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: d49U6QMhfYvuePaciF-QnYrjeJHRrJ9I
X-Proofpoint-ORIG-GUID: d49U6QMhfYvuePaciF-QnYrjeJHRrJ9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Fri, Sep 26, 2025 at 09:14:57AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The issue is that drm_connector_helper_detect_from_ddc() returns wrong
> status when plugging or unplugging the monitor. Use HPD pin status in
> DP's detect_ctx() for real physcal monitor in/out, and implementation
> a complete DP detection including read DPCD, check if it's a branch
> device and its sink count for different situations.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v7 -> v8:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202509241625.o4mNleVb-lkp@intel.com/
> v6 -> v7:
>   - add the check about branch devices, suggested by Dmitry Baryshkov.
> v5 -> v6:
>   - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
> v4 -> v5:
>   - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 12 +++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 48 ++++++++++++++++++-
>  5 files changed, 71 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
