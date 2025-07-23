Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850FB0FAC4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25A910E85C;
	Wed, 23 Jul 2025 19:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Om/d6bmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A4910E858
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:09:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHLFbT007832
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=j1sHXonKOMWdbcMuR27sQzHS
 dCXJJsBCxb0JuCOVz3o=; b=Om/d6bmDKaNbevN24EC86atL7mu2tvXwDS/c2Zq3
 5aWI3lsp27s5UKzZawXDa5Z4ZGpSeYCnthFY99g/FyWpqwYweXMETvuuw17fv0ni
 G0UbGcnROMQZueOOMhuJQTgqeo4vaZFPBWvhNuoIupjBT0I9AV5mJwidbU67rrad
 7fWfo1FiQD1tHsPuK9tJzdGdUe8eBuX+gSXcjxYS/JZpNPX5C2ZK66KuwfLGlmcX
 jIFaEgg2y9x6r8iLK88pt8to0+fG4zrPYbAfrw66OuHbr+RhL+LpegSWO4SJzWuX
 GptxFiWB+41KPfYlpg7R3b22sQuCekLX6J3+AT7RnsBEmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qe9x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:09:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fad9167e4cso3912826d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297753; x=1753902553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1sHXonKOMWdbcMuR27sQzHSdCXJJsBCxb0JuCOVz3o=;
 b=NwxVhCQQaZXBEQ+U0shLt1IHEjJNLLoXwZX88ICL+C4CsM+ewcZmKbjUhC14Uf4BMY
 qsZm7M9ZY8lIqHkdP8PXRSRXKo39KXeV41zhVPHipvduJyAkDPxiu8gpaV/nOaeSmXda
 y+RhaNrZ6um6uqgIbDQXWnghWfc3N1jsy/0Eakmo/FJ/BmhILmPjYncVTZBC6raIuCVz
 w5d5s2rM48yDdLMKKanbpwjQOk0Gl9l05RNXqex+JNe/0TuE5GSOH1mtheRHhqu1tIWX
 aWMvJIzEZBg2ka48/fxoSbKcp4h0978sa773JC9r6pd8AvFeDHcxJTlahcjPck8fh1Sh
 sJAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFzT7dDVNPxyYc8oS+Mp0v+wOYNVcQBsr002P+5TaXNKZfJ7gdsCRIQhUvL5bfimM1+W7m0zdFeCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRz5llzALU4Z8N8ZOk0eWCXeua6oZPdKq1XHpqR83s/HuMgD/l
 Hb38xRc0VqBJNFkIECANOlqo/1iPmBzAw/luinvaRT0u86B7qVSregwVNjfUJkbZOckha3CwYyT
 JkTpUGluuGpSu148N+n3jiQOAY13PIp8Z1dTiXLP8jIdsRMUgawtp9sNH8abhQiFnicOrAaQ=
X-Gm-Gg: ASbGnctNzlIAophnZW7giVUolOYMNcqOSBt06cGwgy0Kr+Nhkl+BzSHrmCmCZGdc+CD
 MCpMRwQBmJMKXV2BdK9r2zKz6mkLWqL3498KHNSOIX7HrvvnWKny6yrDfYoiexzWiaJRu1KtpVN
 Ybmbr/N0GwqU3EAm9O+1RBCTUL8tiWhPV1IJKBnI8EQToUNfTWez8H+S/C4EnKAkUSFSM4udM8M
 JHhBNKEUIzHSNszvYF4nbxYmcIj67uQmIIDpMejSnFK3IaSMhUyA4c/PanZtqFakINx450surWJ
 fSz/xhwZxcQR944AfMPyt+KPOe5lcSXhoQcHX3m8/51KT3sIdJLw5IDbIeCbH56+waUZibM3D1R
 NbWlidSLPCvK2EbOGJDRq5bRx5FYpOtnu0BRkve7aaCZIUUsx0rQn
X-Received: by 2002:a05:6214:762:b0:706:c9e5:c97c with SMTP id
 6a1803df08f44-707005453a5mr66358216d6.19.1753297753287; 
 Wed, 23 Jul 2025 12:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0aluluxVX5KIz2Yfb88Pr9rAwoRTR4Vc9qZoIaEKErrjlJf7+1PA2sa8Ohif0ct8DwkgssQ==
X-Received: by 2002:a05:6214:762:b0:706:c9e5:c97c with SMTP id
 6a1803df08f44-707005453a5mr66357546d6.19.1753297752657; 
 Wed, 23 Jul 2025 12:09:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4be6fc33sm621403e87.209.2025.07.23.12.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:09:11 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:09:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -resend] gpu: ipu-v3: Use dev_fwnode()
Message-ID: <vfruvb3z4i2daywolh42nyqkgnoxu2shminslq2rshtkhrlnud@ggjdp7z2r4pv>
References: <20250723062737.1831015-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723062737.1831015-1-jirislaby@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX4dNJIT0ZG44Q
 j9kEdsHDlzgfAAjO+N4XRauDn+KVfHfNTkCgqOSo74oWX1vA0Nj9BZg4krFNu05WZJLHP7v2Z0g
 BR3FFOJezHw2pBPaJuJlwV+Y4USP79WJLc0NK1s1NQEe3SlEoRc2oS9aaz4p4CLr7J9vDI0ZmHW
 VE4df79UwRdMf+18b3vN7em0DOLSIHRO7umEs5re961cAheSrGbcshtUw0/vu2D6uCn1Vv5OLAu
 fZSTc3KH3+l4GExV0k2Tlr788/0bUETyXts8j/sXyi7E3TOgXxmSaPdsKij2LG/Y+WACFsscUz3
 hbJ0PQuRjhtzS0PyliIa+ZdFucSNstuRnoe7ReznB3HlLBppdbuS1/fiqKdBDCoZyPg1QOLE7G8
 ZwMux0hyWK87Tu855KaCDold1Nz1+bnMceesRA5fbRx0d6wzgfbcoJ6kFrHHBza/LGYr5HWB
X-Proofpoint-ORIG-GUID: Ax9OQ2TJ3tYfJm70d_mwKy8kITAAe59a
X-Proofpoint-GUID: Ax9OQ2TJ3tYfJm70d_mwKy8kITAAe59a
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6881335a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=ElOPiJf0bgOxSbpTRk8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=598 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230162
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

On Wed, Jul 23, 2025 at 08:27:37AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Link: https://lore.kernel.org/all/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org/
> ---
>  drivers/gpu/ipu-v3/ipu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
