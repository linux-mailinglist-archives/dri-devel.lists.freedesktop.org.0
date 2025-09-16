Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB32B59410
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3210E066;
	Tue, 16 Sep 2025 10:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eD+NRm78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0E10E066
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:47:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAAXqf020364
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=il1ylO5UElnP2PjAWM+meiZk
 z9ec0WNfLUquacAr7yg=; b=eD+NRm78QVVxDtrtLm44FJmkEyKnUaWx8h/F6NvE
 RIwMh8ltikkaGXSpFXjSgvBdfUA4FfJkpICFvqszTLUzounuZMnW0VvzkPYlaUMs
 mMXsDnfxX/AE5i9R0M9PVxK5ZL2STuD5nScet6mVpcCInmFfrSdvsEVmvps2UiC/
 ooquqEyPzc5XryW6rLfsV/NiIEWHTSmsMUam5iT6wQlfrmYfH5uAuc12H1It5ISy
 z4O/xvvE/iZh0ZYf7CNbJZZZay48C+TClwZTlSUXq6CELI5T9x+DPxj7j2m6yMHE
 xvh6v/1jxgeHIemJPeTGwAj9XzDmrumKU04Y/vJLmR3GNw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chggdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:47:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-778eac53ed9so72090776d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019664; x=1758624464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il1ylO5UElnP2PjAWM+meiZkz9ec0WNfLUquacAr7yg=;
 b=Nmk03mOWFExfi0XDGwrQh7YsoyiIWjSSEZcVc9vKda88UQPLjoyic+X98WWAroWD8d
 mvM6VX6JZFsK3CZE7HfqPH9/it7ryKpVVPcJ/zBUnSv5G/VHQMKsahxZ50aAxQq9MSv6
 HxLSl8NEOnyAoYO7YrZ8w9Gq9Hy8xJ2LuhG8qW+5u3oyEbUmO/ULWmOPaS5f/S2dojVM
 BFRMk7ieGguh/QaS4wzdNnefBtRfGWDYV1rqa3rkmXeDNZ6h7Ej+mur9nN34eAnBNF7R
 2g2MTXB11xG4O8imtreUOoD6e++sjGt/U1jyASq5eg4HMm9oIdm/2iTNgv8w1fD55s5W
 Kv9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHXVp4xIDZY8IFrtQqXqsvQMwbOqDx0uNjTPESBb5RjCCnYXFMBnbXE0isWEWkcUSXWx9U/h+Qo1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJzp29sA5G8O+ojrNXdjIgJSEdgsLE01q8ebjDGogeGgws46uk
 ASnmPz6swbf2ybLPFXMsQLv8PJKtV2oiBJ0ugYXPXlHpOyykPQ/T5KIcuAGzuos7zuPqXBCYEHL
 jSlEDmnLcsnotMHZCVdfORes3t3VFS+GCZ5vHBsmcmNNudiFpztlUvZY7XadEgBpMRKLL0C8=
X-Gm-Gg: ASbGncvArJw7pQztAUaZjQuKdED2q0e2bUoRufSFk1clvodH+8hJOqHRaBI57JV86pF
 xxQSaX04baGi4IofinBtSO7XXchGt91gzgyMSjtHSQWkC7xY/A/AJKOqQp6cUQrvHPnRUiWsqRS
 YnKfpXfuqKt6CR0JO29o7ugZi6lFBvIi9UH8hn6DN2HD/DIVa0Dg5tf09vFDSU07TAp8ExaO/kX
 lWo9c6AaMrINDtRdQqOlDVkJcLNtss9NlzyX1hAXkQZ1nycqZ6JPvJHdkoB8eBiOa9h6i97oXNe
 WUVxYWfHO04NEhJ7EJWPMJfrg2l+qsTrwLBgpGbB6wx0GZzPwhqU1QPc7YKh6St/6AvBZrBPj/1
 yAP+BAREfekoGSwljC1g0xgLNNnWc21biKhPJZsRSxzewo2d6RE8e
X-Received: by 2002:a05:6214:5192:b0:728:854:6c5d with SMTP id
 6a1803df08f44-767c1f720camr187319396d6.40.1758019663998; 
 Tue, 16 Sep 2025 03:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcF+9+EVEVyFkGibcgDFcmq8UYwcsHfhxQRgJtqpwnGTS/igxMZNVub2ptM4Dj++CblB7lZw==
X-Received: by 2002:a05:6214:5192:b0:728:854:6c5d with SMTP id
 6a1803df08f44-767c1f720camr187318856d6.40.1758019663329; 
 Tue, 16 Sep 2025 03:47:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-570340058c8sm3904023e87.62.2025.09.16.03.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:47:41 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 5/5] drm/bridge: it6505: skip auto training
 when previous try fail
Message-ID: <6n676e7a22sxdvvqxjjv2hcxcq3lg4hdvdmwewneeb5zhy4m2y@2ovapkawanjm>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-5-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-fix-link-training-v3-5-0f55bfdb272a@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c94051 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=bPpkopM70cy9w_l897MA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: xzXQSaF_YPTBqvclA-_Qq3zyuEy-2RiA
X-Proofpoint-GUID: xzXQSaF_YPTBqvclA-_Qq3zyuEy-2RiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX7BIc1dteclKP
 OOhpBADfIxEcRDttQQs37X2qcxcgaP/EX02Cbf8oL/WovKkAyeuZTxGm57ljDVT7T43XrwBBZdv
 N721S2JrtPxQ6fKI2SUstmZ32hDnZoNmB5/Uhd9qOGu38xTcfMK+qA0c38uvFsmvbYul0TQN1UC
 JH5Ww5xdh4rwrqZfRm4hVCw+2LdvmTEBb5yE1dJJZBupR5xTOPw+n1T9vDFZkcEUrbLCEmjmRM7
 1ysSKmuPiPJj0lyvtxShZF9D25kGWj47qM5XTVkdePVMPK3VhlqzCLbchuIsR7gl2n2nEhEEqkB
 0FGC9lJ885iWQh21SFydxQS14k3h7XJzE4UVjJLnmUbOcvan29oR7TQqYgpZpECQDqGum4/bOR7
 XIUIPw95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
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

On Tue, Sep 16, 2025 at 12:47:45PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When connect to device which can only training done by
> step training,

> skip auto training when link training restart,
> usually happen when display resolution is changed.

Please expand your commit message for it to make sense to somebody who
doesn't know the issue. If I understood it correctly, it should be
something like 'The driver performs a full cycle of attempting auto link
training and then manual link training on each modeset. Save time by
skipping the auto training if it failed previously for this monitor'.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
