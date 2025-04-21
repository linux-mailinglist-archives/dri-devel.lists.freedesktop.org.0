Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A93A94E14
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E641D10E34B;
	Mon, 21 Apr 2025 08:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrtSz6Ld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE62310E34B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMgW4Q024525
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KGqEasxA4rkg6EXcFnfbprLt
 OulRWYiKToEs3VK7vDQ=; b=JrtSz6Ldu4CP27v0sPWKABFM2mkuX77kbriH/VCn
 /7O72GjLv0uvDM/XJpERxbYFSrD9uSi1fWPA9n8oViN1mCTRzCvHRuSsbZpnjxYe
 NlMSmjYHCr0MZMlyJIQF1EUe0oqw9EF4M7OnSlwgHCdNZZup8FpBJ4R/l6Fy6SKR
 YfGdn/4SKcvYz9IA351Ir7GXniezR8Vkl9DN5GQETae0JZlS6C3BT06xFnnQpsrz
 E+vmeSfeI8ZRicXS+lR4NXHa73mG7tOQrPvYLQRCfmJ/vEgm/tEOTPyjPPe4sdH5
 mLPVsY0jCJ8Nae4w4s9NDaUTlJNF4gHE4xU/PV3kAvUeYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478uhnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c572339444so579961885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745224072; x=1745828872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGqEasxA4rkg6EXcFnfbprLtOulRWYiKToEs3VK7vDQ=;
 b=NDW3fVNKv8X2XWgxMk3FFk70ckvd6FAHiUU9nzSjpHovv/EbZ/NzIRJ9YFH0XaPLtM
 Ajr+pSw2RH2Vnb+skP2VQBbICXrgbihWbxMqAzGZX9cvUmTuQXnxy4fzBXChiwIhfH2e
 yBywreGz/j1QBzpolaxOWZtlYtGzTDQUWnqClHVprIh4p4K8cKz6r+AXt0I3WDNTIzWv
 NCRIF5s9gxlNNq6j+lnKypphw1NZDYgLi+B5GdEtsKtU+kfcEpzS5GSY4wL0Na6ZeJgn
 2qWWL2YrjO8aiPbI2oJqWCfMFGfLN4rSDyP4M2XUr9dYPeX0RLZBOyt4+1WG6FjykEtR
 m18A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLDxBOVE+idmlurv456t+zN5sZg3ArRG8Q7OvF0qRToD/qCrOdTXEdL4d5KtOMuNkuULw3oUMd+e4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzrrJQZrG7I0MKJ2ey0ZjK91ntZTY8MTGfZltmDtQDZCBArYTr
 l3T4Ei7mWrWeNmn9Efa1y3cksutotXUXitjOc0EI7yp/6cmngsU8Cq3ixolquOoihJfcFFYSg00
 ePyRLBMCRyTvO9Rj3tpO15BNVLSJy+ENO2gkxX15rvat9saU1c4t7Bq8b8OQq98/QwvQ=
X-Gm-Gg: ASbGncvsKH26BpqkAX9YfO8QyCDWLP3++5Zxh0r+mJM3xar19O611mg4RUGtgQuIAE1
 T9JOFKVD2xaoJryOi0YTyOvHKhVB9ktGrgYDwGez6zWXeE/x0nWIFvL4lTjnQP9iVpUJXOCs/IW
 lEJ82UNw21fCyEUthg+3qAgTavWk3gDx67ZkUyYEF+aZmipjeXzAODo2tU6Rj2noXANJ2iXwY74
 quUPA5P+OeQSfgYL3c64jAtJEXxnXH6TiuWychSOPENUKPNG+yjWs+F7rH8mij5ruUMaDUvdu03
 t+LuafptGOsmXHafLsxWML3gD1NhFTAkA2aGwp5be6azJFRDefi44n+CIEraCydaScmETWlSD/o
 =
X-Received: by 2002:a05:620a:258c:b0:7c5:f696:f8e5 with SMTP id
 af79cd13be357-7c927f84bf2mr1482969685a.14.1745224071745; 
 Mon, 21 Apr 2025 01:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfQRiSWXcdjVXs/7z1f2HgaA+Rzpjr7swp5+QHl2EPbuJv2JHGnaXn96gkHgq+qSQFCcdBnA==
X-Received: by 2002:a05:620a:258c:b0:7c5:f696:f8e5 with SMTP id
 af79cd13be357-7c927f84bf2mr1482968385a.14.1745224071356; 
 Mon, 21 Apr 2025 01:27:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090826840sm10911011fa.75.2025.04.21.01.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:27:50 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:27:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH 2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
Message-ID: <pfsct6z4u34rhqa7w4tc7kfe5p7g6xlo7u27ff7t55cxyu4yez@vauvrkhoby6r>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
 <20250419041210.515517-3-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419041210.515517-3-tejasvipin76@gmail.com>
X-Proofpoint-GUID: AA8QQ1twh-zyv9dVZDLfvYDh09Er2GmO
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=680601a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-O-_T6ZlFlcQpfhg6YsA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: AA8QQ1twh-zyv9dVZDLfvYDh09Er2GmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxlogscore=644 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210065
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

On Sat, Apr 19, 2025 at 09:42:10AM +0530, Tejas Vipin wrote:
> There are no remaining users of mipi_dsi_dcs_write_seq and it can be
> removed in favor of mipi_dsi_dcs_write_seq_multi.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  include/drm/drm_mipi_dsi.h | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 

Nice!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
