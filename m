Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D2A90F32
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C34910E9E1;
	Wed, 16 Apr 2025 23:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRnA2hWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7CA10E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLX3pM005959
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4K+WFxhxoQoMiBkaH2jjbXQBqU4EkxvFN1NoL0IIYRY=; b=ZRnA2hWJm2VICGJX
 XTp9deSvggFEoO8bfjASl+3c2l2OzSFOE3brhtxZktiAUrYWyVpZ/RzTdjdOMmTf
 Fu8/ICGzKvdbMdNwFBIYIwBGLOYhgc3lyi1HQdc+N4AtZNzuZ9igT12KHOKk6dil
 IDDWodyO8qFG3iRWwZqkJ8eiSpfmWe3h8vC8KrvW9cYHzidaBJklHG6p6RG8ZS31
 5gzMvg9L8vivGd4r8I77VXr+waoxjXD0g0rs6Bj7V0EGKcWSMwtM80CAUxR1w9Mz
 GUlVfhWcr7BqkLBZr0NUjkSHDuFP6AJseiHoR6SUo+2W0ikYQhFl9u/HXeKlnprG
 kiFejw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqd7yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f9057432so4101296d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845077; x=1745449877;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4K+WFxhxoQoMiBkaH2jjbXQBqU4EkxvFN1NoL0IIYRY=;
 b=CKUFiUnlNyjr96nkCDjsV1O46HjQqrm8yDOQv/hx2SLQF75dwlVjnLclURKyark6vF
 OqiIptvkzjoV0fsPmEb1BrxDq49ZBEAnj2ys4lDon9U5zPHVIexjePKnSQWNYczdtnyf
 5TniYkLgNEeL1KvrhFLi00W5P1kfLPRi6JfTgV55Pvbpbuk9+bmtitbQibEBe8i22PIC
 8dY5GAc3s4TXuf36O59pRbNqKDBWwMAY4Iz1ueBNgUdi0EDBeju8XcjGHK8DdCEFsKM3
 GTZDoN9NpnXhKBMaP3052v3lGqrppVKmKoSXtkW8qqbZC6Jx01w7U8WffQXdVeZM2baN
 5JpA==
X-Gm-Message-State: AOJu0YwXMonqujgXnCWGtIOlxG3WGqehJyAYXEWuY4NievMxNZmJSBKK
 vKhk7v2q9YmO0PA6AJw7U1FfoqmGoE1pTJgeIaMfYLBU52tMR7KWYi7hR5DaLW8xB9LxINqSNWU
 xn9K3mJxV0kaPiFcbh/HgtGxCVuo1uxjd6CDjygxVXO4bUmcWAfWvJMTRNWFALPCEilQ=
X-Gm-Gg: ASbGncvJcQzPHEk86N/eI9vbSL1tpsejBGyPK3sURbT2VN/K+JyxbyiHZUdb7KeFW7g
 8z4oPRdH2U9tH8FuLWXtNZ3XuyxhvRdvKXLwi4V0/Ww3AQPUyvu/jh/DrOdEjL/H4OvzHUD3F9X
 WoB2RKJJyq4VpPdeFIO/QvRvbTzctjyrVxvXSNc6H3l2eqAEXnSI7zlqEP4RzenJIGIeMuL0q+g
 gfrSqL/G8uuX8IEEVW7yHOWdyS0hFRkNaJ86sWOA8CwE4OkjANION6ZHkCpJWMM64Ikw5//qt1b
 7B0RGlyPojlEimQ70dohMjsqCm+47pOTAWzDk4UpJNHrtZvERCswFucNFYTBCDfKc9j1Qnvn9uI
 =
X-Received: by 2002:ad4:574e:0:b0:6e8:97c0:76f8 with SMTP id
 6a1803df08f44-6f2b2feb268mr54272356d6.27.1744845077656; 
 Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZbW61RsuDYFWg7JRdbm1/TXaerG5wFlxGsOZ6h9o3vx6IOSI1SDfABlIw0wQiRBwV3m3dtQ==
X-Received: by 2002:ad4:574e:0:b0:6e8:97c0:76f8 with SMTP id
 6a1803df08f44-6f2b2feb268mr54271956d6.27.1744845077353; 
 Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbbb0sm25320081fa.30.2025.04.16.16.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
References: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
Message-Id: <174484507310.205743.14049404804802219096.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:11:13 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Z4524q5UL0EUYwg7_c8bUBp0CllBKgK4
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68003916 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=TRtR8zIzb1nflcp3dq4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Z4524q5UL0EUYwg7_c8bUBp0CllBKgK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=908
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160185
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

On Fri, 11 Apr 2025 18:09:40 +0300, Dmitry Baryshkov wrote:
> The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
> correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
> separate module, it is compiled into the drm_kms_helper.o. Select
> DRM_KMS_HELPER too to express this dependency.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
      commit: b12fa5e76e1463fc5a196f2717040e4564e184b6

Best regards,
-- 
With best wishes
Dmitry


