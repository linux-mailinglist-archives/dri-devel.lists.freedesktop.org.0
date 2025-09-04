Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA9B4300F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8210E3E5;
	Thu,  4 Sep 2025 02:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpsrypyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8610E3E5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:53:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841NQGk000375
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 02:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kz2067FEvooqYvy9DSICdzYN
 TfnwpZYpelzCotnzoz8=; b=IpsrypyUlNRH7nXE944fUy03canvDd/KcmnUss2X
 E+C5hF93+o3GGb2xXk9SVJmOHTJ0WEs6tjrryViKh8F9lYpHwE4OogXxjc2i1qDW
 PWruF+7BUPT6/q9MttQaNEt75woWC7SqCz9OsA+YbNbEXn5In/4Jkn/PTjPhL/k9
 HOYZo35OSna008awsXsdKoDVt5JD2LqwN3+WZZ+XiyZWDgYP1OO0O1CPjKlKBjNa
 uDpRpuZOuai+M5989NdjoNye3LVW5zJxQ3bSydq8Xqh7no0PKM8CgA0IVAC63+sd
 He8SkR0sZEWTStJ1D4x3ESzfZ5AgkOZsD5Ui6z+u2vwnLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush35tcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 02:53:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-71ff3e1256cso8853936d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756954412; x=1757559212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kz2067FEvooqYvy9DSICdzYNTfnwpZYpelzCotnzoz8=;
 b=lQCUXO4SMfSiwHo1gNxOas+iwykrrzM2vblJN73rzw4AdKoWqXZg+clKpoV42bckjG
 iiyE9nMYR4qGt7TK15NqGK/xQ8eTp/cinrlY+5DfEwvvkwB97oXeTk0FoG5vn0fBmw4U
 SLcG/cYPAZ1D9L3gW7DZhcC/NIbxDz97Lc8Bs9miWU2hLXp7ZiYqqtK08+EVLo7GzWXY
 2coutSg7sfb+SXtaFen2JQd0RRi/VOZPQgEPBDPySLGwp8YD+uCDsVJYLlaxXQB7bnzW
 LKPV+xgEw80KEUiZdSH8MOLySOwEYfYnjzWzVdc+rrawofJgnGcoUPdl1hkx5/2VLOD5
 H+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEmUTGXenAACv18g1pdpG9o/DvjmT+TeXPCKwS9WAGxpQzq5pjl/QOd7S3FnEExfw1ma9apWOveI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/di/xXbN5CtAcLW1UcXYI3iKr5Qbdu4NNey1ti8JG/JhUN528
 jHaOlSBEsUrZ1pbmISt+Z71nyfUKkIXhGcbhaxiuKuB+c+jIPfx7Ymh4M0wkhMOnUdSAnJZ4AQu
 CdJGX2MUgO3/pwXegkRVHCyG9eMZ7whbFqTrIT844o4AdKpDqakml6YFbzXH44F43UALfOjo=
X-Gm-Gg: ASbGnct9pQppLRvKS9otXg3pymhfBp2qpZXceoPRSqq+ekyW65krt5n0fsaMWdFNTMQ
 a9QOOsWP+JgKf3IJAllpfz6e+9cJ+FLNQT4ZxxjYC9CZ5nYzZdMLcCBz5Qo3+PZy+zIgaAIz6IM
 DgpQj05BWPVAWypJLKyOjY/XfEKbksXo37fPhZiU+2IS0yMN4P27KwHiKEUAuebeKA4E7oywOyW
 dH/efLTD8APL66nHre0/QC+9g6lyN3xKpfr75pPbIXZXeYHV3iSDu1/UedpnwM9k258tIVBLW7j
 VcbBoPv5/TvnhkwZ8LKx0KYMJTVrHnDGUV7Tk3OVmg9cIeUBn7BGq5LDf76mR+RCGJjO7CI6UAM
 JKvKW5ZABTvEu15MMYlrMdiH1aO+oKlaUS+/wa3lU4vzrNhxnarfb
X-Received: by 2002:a05:6214:493:b0:70f:a42b:1b57 with SMTP id
 6a1803df08f44-70fac966ba0mr176699116d6.66.1756954411805; 
 Wed, 03 Sep 2025 19:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErmfuA4/8yRamEwLKE6ZwFL2tSW6JHiK7PGA76/AjLA3gD6SEd/CJbWJkPBSrDcwZ6CONrSw==
X-Received: by 2002:a05:6214:493:b0:70f:a42b:1b57 with SMTP id
 6a1803df08f44-70fac966ba0mr176698946d6.66.1756954411361; 
 Wed, 03 Sep 2025 19:53:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab90ce8sm888972e87.35.2025.09.03.19.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 19:53:30 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:53:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang <syyang@lontium.com>
Cc: robh@kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, yangsunyun1993@gmail.com
Subject: Re: [PATCH v2 1/2] This patch adds a new device tree binding
 documentation.
Message-ID: <hgesm7qvkwutv46jqhulua2oycgeiwgvpnrqsynxm67zk5qjcc@bemou6qybefi>
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
 <20250904022524.1748587-1-syyang@lontium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904022524.1748587-1-syyang@lontium.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX2SvzuZDxO35C
 vpDDAsYBacxsND/onzrH86A86G0DRky5PWn4kzLatjOuDunRhVmdPYebKqsdshGkSlBdW6I0bOU
 W7oBOl0MhmiGCP/KIpacx+IiBhiReZr8wJWKopGMl/R1fCaNTYgz7QUQDNdYaNdSK5Io5gNUBW6
 s6n0wIt63H6wMvHkASwW1OA2TXQ02Dq7q0BgN1ZE01ZYXSiA9QRViIoJ19n3sssQjLjj9edtVUI
 7x8hD3pgMSZYmO97SQJb3W0d3Z4eu/JeFIF+tTZyJWT9Skr/GsbOHp/l1RgUneFWidCf05XdYB/
 tp+iNinv/nfiz8s5uYplAhdeQ9z6rfqaZ8piOfvDttWdZ6x0BrVsrZBGIsD4YnrGCkJCB7sXCgD
 6A/1TbuT
X-Proofpoint-ORIG-GUID: R9wd9UVMtDUpd33auwhm5RHstNSUrUQb
X-Proofpoint-GUID: R9wd9UVMtDUpd33auwhm5RHstNSUrUQb
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b8ff2d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Kz8-B0t5AAAA:8 a=YfVmvpBeDdD2EIU_UzEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

On Wed, Sep 03, 2025 at 07:25:24PM -0700, syyang wrote:
> Fix device tree binding validation errors reported by Rob Herring.
> 
> v2:
> - Fixed $id field to match actual filename (lontium,lt9611c.yaml)
> - build pass
> 
> Thanks to Rob Herring for the review and feedback.

Read Documentation/process/submitting-patches.rst

> 
> Signed-off-by: syyang <syyang@lontium.com>
> ---
>  .../display/bridge/lontium,lt9611c.yaml       | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
> 

-- 
With best wishes
Dmitry
