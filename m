Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBCB59456
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6348610E7B0;
	Tue, 16 Sep 2025 10:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtPW4Utz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303D410E7B0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:52:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9oFtE004802
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GY9jH7r/As2cLmZvQ6njVbL7
 qlDykJ/HIAWkW0p0ibA=; b=BtPW4Utz4Eg6I1MUc2wwGD98DRZa+ISdpEoqL4Ky
 ngX+z7l97ic+4IkQnBeUGZt4hV2/cU8qG7ePHYkjL5eqsRA/f4bp9Kqz/zGpP586
 nvQ7vktJv3W8pCe719WtQrym0TS+YkvyeC3FvzWSSQc6lOJTZDXM+e0NgvzLTj1r
 7CDf+224YSrKUa2huYRrHOHa+fRVJx51SZudT8fPQB1YE8soIJznPd12VhA7Yquw
 ZLn002Bj2EPGzQSAZIrZzlFtZAPj/lXmbKtpKNxmy/mo2wIRY9TqIegLK8Zz8XNd
 DigzkxJxFQyO+UeV52yM/EtxLN3TQFpJR9sFZMGipNBu7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8uwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:52:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f290579aso109259471cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019932; x=1758624732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GY9jH7r/As2cLmZvQ6njVbL7qlDykJ/HIAWkW0p0ibA=;
 b=Ff+OEkeqolxpXYYO8RbB6WSN33hggkoD92l30fNHWzCDc7hhd2ZWFKCsT0XL1ur3mQ
 1QUKgr5IZN6fmO/sR88JA+GMBimdE5neJEzOJVBdK9ki2RDz2KomF2ExcWrUxnuLgPyF
 j4hXDYDVsX6BYWmgi9NoBq0cnZIov/cJW1fbRuHv/GuTlsVSAo1BZFI+IVzFa/WPFuql
 krL4f2qxuruBMo2ewCSbBPT4KqxCk2yiK7xUVFKgfZfMY+vDR8rAsO8yPvngYgiln1qU
 ouznx9U2JVFHJ5Qh9IAT3C3kc8f0QVF11+5IaJYiMe+4w38BZfcXFgTXBc5hmswoX0X2
 iIKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSUsw5Ri7KkTV+0tl11C50lpo83LmYxXRWWJrShtRMAFy2Ef2vnx0v6JkazMEy2zfIh8FswB+MoZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtykCNiOtm+FBS0AbWVB0w6HoOoTbhPOx7Wn0CI+L45n18JQnn
 R+OBuD8XeQBzJnSV92VBXSctP32LpB6FksDVk8M+rSUaITqzq8zUYJ70qxjrVPmyaRIPDJC7JGY
 pnaXrJS3N/lL0AXLI1MYirFlq6X/b2rAOEyhj82cHLXPxcXFFUcPL5y1yasV5OXomNJ+6Giw=
X-Gm-Gg: ASbGncsx3uRzq6I452PkGTGcyhbR0Wh1f7TnJMez2vZ+w+r1MURBkBJCNuIh+KzHAMa
 wHJQO1GGcLujKqgljlBXcugkJs0qKScNJCzpXXucsPF2D1Q8Hahi5DF19/gQke9JrCAem/x4V3X
 VgXwXpadDC64oPJokvoGQ0RfXidHJufDQxr2XEBsOOqOux6GFlu4BpzoX15QiP41aWwAok0OaSU
 yDRnqgMt+KO07BitoWwNPGYNNI6L5xlSYAEMnjs6b7CF7g25Wezn7mLdiKC9O5MkwWybibmw+mW
 3a+nn0OmKJJrCR4LlSj7fgYLg67q6x9qX9KG77iPd4fHySCUxGDChP0iJfpixfrXpce9d7YCBlI
 15X1S7sWnfIdJ0zZikHm9873c6wLGzY9v8Uaq0s6XzSrsUC3UX6uV
X-Received: by 2002:a05:622a:11c5:b0:4b3:475a:e2fc with SMTP id
 d75a77b69052e-4b77cf99570mr171341151cf.3.1758019932153; 
 Tue, 16 Sep 2025 03:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcRGZW2omipw0aiqSBcsit6n4Bg8Aldr7pugdOyDJSjJiRUzpzUc9pe7zJTRaV+Kwy7jPtxQ==
X-Received: by 2002:a05:622a:11c5:b0:4b3:475a:e2fc with SMTP id
 d75a77b69052e-4b77cf99570mr171340831cf.3.1758019931587; 
 Tue, 16 Sep 2025 03:52:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fbdsm4247142e87.30.2025.09.16.03.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:52:10 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:52:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: samsung-sofef00: clean up panel description
 after s6e3fc2x01 removal
Message-ID: <m67lqbnli2zsdwj5x2vr52s5irjqleuxv3leqey7xkj6ekpdot@loawiqett4py>
References: <20250916-sofef00-cleanup-v1-1-b29e1664e898@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-sofef00-cleanup-v1-1-b29e1664e898@ixit.cz>
X-Proofpoint-ORIG-GUID: dvR_8Qhnvb93MijGBry8Ws6q8mqgBaiA
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c9415d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JNL_I6QQloY96jlYc_YA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX54aHsd5gVUZq
 Hs39YKXRGAKphFdV7BPCutOPXSkaQ+Pee2A0bVuZp/YzrjU6pnoRq2Qhz65DUYoCot+YqOYW9bk
 tcQ6/ftXUtreW5tY4A1EBt1vyVxbIhxDH4tsMZvGNtzSArlh+Jy1eqGaJtI2sVhSgsfJvMApldU
 VRwcYdhGRURUALU5QvjQpuO56OUbaWo8tzhpOigl9xKD49OiBuEZsX9Zd+zqPrm8KMmCJ0o1ifL
 34erxsfmDkKk5mu8jyXkznU4mG6rd+owPV8UQ4d5OckP3c0KzS3/kUlyvN6ijQiAyM4t3F69VUJ
 AV7DJ0YMQGQrkShK8jNGX3jzHZ5I6YX6YHQtAF3WC7lR7FMFSFEmHTaosXa5P+js0vSdTE0h0Sp
 psrRCOlZ
X-Proofpoint-GUID: dvR_8Qhnvb93MijGBry8Ws6q8mqgBaiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000
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

On Tue, Sep 16, 2025 at 02:33:36AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Remove leftover from s6e3fc2x01 support drop.
> 
> Fixes: e1eb7293ab41 ("drm/panel: samsung-sofef00: Drop s6e3fc2x01 support")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/Kconfig                 | 6 +++---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
