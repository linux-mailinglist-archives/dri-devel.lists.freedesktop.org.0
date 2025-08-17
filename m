Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D453B293DE
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 17:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743F310E161;
	Sun, 17 Aug 2025 15:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ83e8V/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E872E10E161
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:32:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57H9FIXV026266
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tIq0lQ5Y81zCr5DJhpJdXmzG
 cuPpY0NM141yL5+C8T4=; b=AJ83e8V/7t+wwy1QENEzy0Naa40H3CE81mJ6Dgvs
 ikdMnDu/N9FymRgAZzScGUhIb27aP6FQEbGtS+i0spcBb8XuqNj1WSfIrRlKWzgm
 ghvbqfriYF2EK3chvn7VXrY37RPTbORU5MK8zcs0ZJAarVS8wFlTSk0Rk6+RBCcc
 5py84mSDkXkpJ+9b0ipkOXK40+Z+4/ntzjq7cJHpJOCg4XTae70Kv/LAVPcgpgXc
 nhvbpO6Ar/EBp4bLuJZjypGOdaQBI0SarIoaIO5MuuXkpuO9+C1R/1vhYc/QfyCE
 fAKJWRkSSw8N55BKvQZP4DAKbbiU72OjyL4/YMBrmvuyOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99j5s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:32:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88dd04faso126917676d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 08:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755444743; x=1756049543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIq0lQ5Y81zCr5DJhpJdXmzGcuPpY0NM141yL5+C8T4=;
 b=aI5stCCXq8HkkwRIZ1uSB4B+jH6BYfvZpf4es4VANhktyjOcNeKCKUtDn6ljV7EB7s
 bAixJM90fGqrR0Hml9mzorM78kgn3nVdi+sEWQM0uruTTWxGzdd6H7xRxn9mQwC5BFLF
 SXVY7HI17+1dtyXfqoT9o06O7wp+7NnYuoGnyzWiJIxwnC4qdUdHpQVAPrTOjnabkCKH
 5872JSGa5hpJUj23tOTouKwZp/jwDXBQaEyNlI6qipbbCl1C0CIVeJCSmtZEklkJTIvm
 UeZnEgotRf2tCWhJCoUmcPx1O6v5w8l8Y9f8GT3tnd6ZvFV05H+3ZhanTXTU5ntd6p6H
 v+VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBFzR+Q2nJJvxR4g2fj98rIppqPlsrBFv/TKyrcKn2Q4FTrJNK9Wr97pRCpwrHEC02TY7mmibGkRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqJEvGso5p1t+nqvpj/AbuXY7CQc6uLrYSrJZ2aROd31ylsO3h
 Tc3/94LNcL+u+n8CMklyWeJPj0bNNS8rBNRYLk93ZUhai/7JnLuxCKBgSu5ogwY1gkaJ7plvTih
 OJr5dEIjeLzgvmsr4QEFf2Ik2txh2hT4wNQMU9McL7ca2VtB6KZl6+ljZDlBZuj8ZP3o7tjo=
X-Gm-Gg: ASbGnctNkIgfkLIVjhPhcrMPGpCUlTcXZxKpCkCaZFejwkFjwEXUie5ce5Lj6wBGXzA
 ZO6VR4+GbW2d7IjzX83ZZ1aIJWD0wI2Euv1OdAfmCxmmiYLrg3hGZxn+3dOSErDkP9ExYRNu48n
 UHdvrmvZe4LAKvfzoWGKTlE5dDkEs0ZmyEKZBVV3qf+IeS60P8zqOPCqqqKe4EIzYz1yU9TB8/e
 vK2bTtStBPIsQ9bZBTC4f3ubhJipUHBuhC9XcbbV2QCVrp/YKk03v2OQvznzlpRPBLYGb3t9y2T
 hviESSdhKa4JVcB8PG88DLFzj7kZHfBdKMgv+EtAI0Vtqm1E5yXlj9YtbnM+q/OMzrRvo08U5pL
 27lodqzjQCJ9d/qo1gZy1INDsiTFZpbwv3WJtWV4ASJ0MWrqytFed
X-Received: by 2002:a05:6214:130d:b0:702:d7e2:88b7 with SMTP id
 6a1803df08f44-70bb0587ce4mr66254886d6.6.1755444743082; 
 Sun, 17 Aug 2025 08:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg+GmUjL4G8jQ2Ku/XY5att1CCbyiSmu0VNnVdSr+1FVcC6LLBtVeoceSl3rp6RU/5nYzREQ==
X-Received: by 2002:a05:6214:130d:b0:702:d7e2:88b7 with SMTP id
 6a1803df08f44-70bb0587ce4mr66254596d6.6.1755444742703; 
 Sun, 17 Aug 2025 08:32:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a64d34asm13858071fa.73.2025.08.17.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 08:32:20 -0700 (PDT)
Date: Sun, 17 Aug 2025 18:32:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 06/11] drm/hisilicon/hibmc: add dp mode valid
 check
Message-ID: <x25nogehjvydrccphxic2qyigu4kvrysti4uai3h7ea3vk2dxu@yxpgqhfmcyen>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-7-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: 2L8Z-P8T8PSEZLU6LAdRlkG_e1JHg30J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX1dsJWlNsUv4R
 FoVbT2CNS3OsCPW7Lac8Mua3XEDr+T3jU1TVFnHkvsv6veBoryFCh8Q5mMdYXXUexR8A9PHsjm8
 hvJamoCP3AJtYJgW5wYx6MlpZJsNF2zfcjqyEQoHVjeBF7ZaWo7E/eCBqBtiFMxOtWE2QG+NGVH
 8PPFXQrKxHX/dVkwpKQ5sK3J6zzyIEG++YhTNvotc+waiEf1qfPh0yzA4K2phW4qZsK9OhNNs4T
 Uv6Wtc5p4eIdMk4T32OmjIdwiov3DzgVYc/pRdJk05Ia6ufr85Karnp31x+CCZn7bXnPiSqkvBg
 gAMJU7Q99jB8X06Zr1cBeGfK7j9OziQiQ0bygsQdJ6gdkKFnDBusT451xold6sT+7dsSHSxu60O
 1a9khnja
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a1f608 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=DyRxv8TpKIxDVovpxSwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 2L8Z-P8T8PSEZLU6LAdRlkG_e1JHg30J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
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

On Wed, Aug 13, 2025 at 05:42:33PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, check the DP BW in mode_valid_ctx() to ensure
> that DP's link rate supports high-resolution data transmission.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")

Why?

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - Remove the clock check, suggested by Dmitry Baryshkov.
>   - ( I'll add them in next series after redesigning this part)
-- 
With best wishes
Dmitry
