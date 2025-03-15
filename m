Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246FFA631DB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECFA10E2A7;
	Sat, 15 Mar 2025 18:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnzTrLOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A3E10E2AC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:46:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FIkwi3011341;
 Sat, 15 Mar 2025 18:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cW7zBq2vG9Kq4RtRp00LNhyk
 wIwKr7TZJvVXzuqO9uY=; b=PnzTrLOQ6ybulUf+7XRklfe9qzLZDrZzUe+JZ+jF
 fTubIoy87x8eImo3B6LFzcrkAalcv2y4ftTGTTa6XLQqxnAXB5EjoB6KgAjJ0so6
 88hWJHTphJY1WrhxbJmewuYxCGotnbzwMw8UGMptz/GGnUP1OPjDPyawmOLcE3du
 yT5fXoaR8lbSoX91CjJ/OOIPGNCZh3fklGm5Y8XJzfRNDTXEwRf+OnSJMBdOF3fx
 wzjfz+FGp+xre0+stAyvRFGWA3neqgOh4L/F8z7ggVr7BqfN0zpX+36z6gop1k8I
 akOS2aNq85koyBYebCtelqAj6qEIua57YxOpjhhlHN+aVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uts350-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:46:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8f9057432so65924636d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 11:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742064417; x=1742669217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cW7zBq2vG9Kq4RtRp00LNhykwIwKr7TZJvVXzuqO9uY=;
 b=jcAlNkNE2NJFkbMgA6ylsWcll2bH3HUm/3uQr640mWxzLW4AtHStO1o24zRaNN5czl
 qb+XKh1wl517Wc/8iFy4irFCR0R8lw22QrOhx3NJJoVe3B7cxPJoWZKSEVG+FlJvnJ+Y
 zUnhEoq/mLK1engBcaM2CPL0//gLIj3lSEAjBGdZ3Upe1HVkWTb0/ONWS4NQq3VFSI+A
 ez/0ZsgzUjCWviLmvfPMfidoLcM1/GRxakgsCCRTGEUDubPDYPawhPXh/XnJkrsAloHJ
 XbTZvHbSQL8k/h3CbButzeDy90YEZCtCeTGFX78/R2Y6Yse5Y0IgJTSGxHqowS9Bp9IE
 WOCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYAmNjV6en7ozPweCGo3iAqRPuCmn18+KoE22MjzpprMQ2CuXvYjrudyUJO2bnl0se8sxmgC2HrAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtD0rUtjaIGAWYvA9yl038jkfgnL5tMJRpGXRLqUi09lj+UK1Z
 3ggV8vkBNEUX6OaupVvln/Orhj5MBDCmNes1UyjU79fm2OGwN5sNuZ3Wjyc4TOee4O9TTmqKtiF
 gA2n7gqcv/Ts6xeDCgQHgAbANFG72DZG6DLCHC69ek/YZGUCFvzn/FnddKOXEkpi/7xw=
X-Gm-Gg: ASbGncs9LcDeijqe7x6vpo3MAqAZX5FxgWoGkFsQjj12y8seNcs8fgkX0aYBFK7x4eZ
 8DNQ34C5Y4ZfbyPCU8D5OgH9WKjDghYEHPYQIFUP2EzrhXNLaf465GwcO2MBkgUa4ZJetQyfqOX
 er3wOR9v9rk/P154h3r5EtZ7NAGmEj8ZytBJ0Q+TilcWCv5LChwTTSKWhHubiZ4V67yqnODb85b
 epME+qMVcElGq/VYCRwCDxgfgfP/J6n6X4qOqbqSosa7LkewjXCyPs/9iLpa3h+dclRN8wA1EmR
 mulxLAajItyCszEiD08vy66bFZRY5jNWllHr96fecMRcnpV44DLibOv0EWVJq02Ql+KXfJchWDk
 e4ZY=
X-Received: by 2002:a05:6214:e46:b0:6e6:6a82:4989 with SMTP id
 6a1803df08f44-6eaeaaf7679mr80369806d6.44.1742064417009; 
 Sat, 15 Mar 2025 11:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2k3woza25edkuOd6aOfh3Rheo47eOG6FJ5IAksq5indYFamjN7H0zk6nHe/RdyRLppcJ9Og==
X-Received: by 2002:a05:6214:e46:b0:6e6:6a82:4989 with SMTP id
 6a1803df08f44-6eaeaaf7679mr80369596d6.44.1742064416623; 
 Sat, 15 Mar 2025 11:46:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1c217dsm10225061fa.65.2025.03.15.11.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 11:46:54 -0700 (PDT)
Date: Sat, 15 Mar 2025 20:46:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lujianhua000@gmail.com, quic_jesszhan@quicinc.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v4] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
Message-ID: <yxy6dfmvckthcbrnojnsvxy5g7jp274axk4eh76rdezazub5af@s7nb72ufr7io>
References: <20250315182522.628187-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315182522.628187-1-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d5cb21 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Ajo0Ny0948vakP_J2TsA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4w2d9UkzZBGl-RrYjnyt_4x2JybRYeYG
X-Proofpoint-ORIG-GUID: 4w2d9UkzZBGl-RrYjnyt_4x2JybRYeYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=646
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150135
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

On Sat, Mar 15, 2025 at 11:55:22PM +0530, Tejas Vipin wrote:
> Changes the novatek-nt36523 panel to use multi style functions for
> improved error handling.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v4:
>     - Cleanup nt36523_prepare
> 
> Link to v3: https://lore.kernel.org/all/20250309040355.381386-1-tejasvipin76@gmail.com/
> 
> Changes in v3:
>     - Remove mipi_dsi_dual_msleep
>     - Change mipi_dsi_dual_dcs_write_seq_multi to use the same dsi_ctx
>       by swapping the dsi accordingly.
> 
> Link to v2: https://lore.kernel.org/all/20250307091519.245889-1-tejasvipin76@gmail.com/
> 
> Changes in v2:
>     - Uses mipi_dsi_dual_msleep
>     - Changed mipi_dsi_dual_dcs_write_seq_multi to not equate accum_err
>       of either dsi_ctx.
> 
> Link to v1: https://lore.kernel.org/all/20250306134350.139792-1-tejasvipin76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
>  1 file changed, 823 insertions(+), 860 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
