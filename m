Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E02A956A1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 21:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF53710E119;
	Mon, 21 Apr 2025 19:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRvigm5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25C10E119
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIg3pF008360
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=P3HJl5U4M+u/M9qqMj09srNN
 G0MDWTXKKxwIH4K4Y7M=; b=dRvigm5fwWZc1ilMX/w8yI7PuHCy+5FF58b+6HIq
 V0TUg5RHAUvBzFNoCHImgJKL85cyjUqkfeUKCNX+chaSb1lQUHn7QVnGyDvbbrLS
 +X5IMjell2ndEpIRyG3WmzOpMn97E/YTKdJL9ixO6Vzv6QPhauY/kke8trO+jA+a
 TtIWCAKCElJx1BWCeelebVxcZSjlE9lw+v9KhIFCF73UYrpSFZFcaDlOtnecxOnf
 yuCvykTuvLONEEOg6m9j7OH0VFYV2FMgtzSWtVo61GxRM8tCZO3gO8QhWOHndWBL
 +fg/P+ElBdNgaCcKJ4yo/X2PfPBCK23MDxK3p8tLovN0Bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svd4qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 19:19:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso80298476d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745263145; x=1745867945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3HJl5U4M+u/M9qqMj09srNNG0MDWTXKKxwIH4K4Y7M=;
 b=tnGuHkmj1D02tGxKpZKx4Onbk1IY96fv6Oe8fdvGkBs1qOV0Lohtdy/2uYWyTbsSF5
 7tOktZUnaM+qPcDfXngNNgX6x3+C0P8bSAc3Z5gUdFC0XhlbUJVs4GIXc5ro60cJKRZk
 xhR0miPWwzAoLCvM1T9WvMewDQ7dUxr1MFL1MerLCbF8xvqqkXl84MhjV/JZ3BBo8num
 8sPAN4XuOGa7av/OaddunKrWXPZOIPnJG1PbTt/9diMdGzS0IOBN6CGJEcM7DwcW/wR4
 2ILF1G0mnuNiutR551QOJUS5MP2RuTKhuwjuZj4p3L3HXg1WnbiwFD5OT+q2aYWAxMVH
 EkbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVj47tCt09AqQkssYMjn3auV2ML7YatR1xCbqPemcvUnfu1wTAAIHpI2EK1wdWHdwruhBo4tgA4EI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXJ0QIpt+y6guCj7ZZMs/Hu38dd+tcEG4GY/Q51UGAb/YI4HJ5
 D7Up+t9rOcdhmJHNOBUbcDOsHVgZmbLmE5bVhHiSdzp7B2URePQVs36AShbQIeZdHBhPgkf0XFV
 yBd7NWF3jl2kp4leK91Z720vvbVyRgEqpYI48HLguLFK54djCQC77k+m+VQhBY8LFhlw=
X-Gm-Gg: ASbGnctPDFPSx/CmLAurqBtFxFqiQYTnLGs1UsZfch4db1B/wowPJtSfj4/WEZ4ixzv
 ApCRzgZ4HEVfQyMs4KkITZ8OJK3lndbwA6YKtnkNfgzruYT9Wap/S4PiQhrvvUwUpsgKTO/7HSS
 Dtkba09LB/5SVrGti05DL+V1X1z+97XlPOv+wkT9R5NYy5rfyQZWHnQykKOaMj8H1UtKZM6Owz1
 6/aqEu/9CTMG4Ta3Dlt+nZh/X+Y/OrzDtNNQF4YnyV/I59/psXg6OieRFwYfS/TXznF1caHojd3
 FoWLJ9+OF4PKziK1gPw5pM/ztiDIfkEXz/7GKMeWUDprakdTAPgikeOKmOcVRMK4We3tz3weNo0
 =
X-Received: by 2002:a05:6214:29c1:b0:6e6:6599:edf6 with SMTP id
 6a1803df08f44-6f2c4655ae9mr244942886d6.34.1745263145434; 
 Mon, 21 Apr 2025 12:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZIiJHpu+XUpxDxWiR87XVzvWdC1v4TRH+LmXdVc2oMPFMOGKvkVumgqYB9XfpZ+V0eYgvyQ==
X-Received: by 2002:a05:6214:29c1:b0:6e6:6599:edf6 with SMTP id
 6a1803df08f44-6f2c4655ae9mr244942486d6.34.1745263145127; 
 Mon, 21 Apr 2025 12:19:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5f6854sm1002109e87.254.2025.04.21.12.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 12:19:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:19:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/panel-edp: Add support for several panels
Message-ID: <323jsow4mg4ku7hrcw25qpr26nnzbjbtin367ysevyqg6ax46y@247gfrr3rk64>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Proofpoint-GUID: kIGo4e06enZCFFVzujBp7TRMDvRSHD0l
X-Proofpoint-ORIG-GUID: kIGo4e06enZCFFVzujBp7TRMDvRSHD0l
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=68069a2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=waiYy8LU7usWoTZ8VmwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=992 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210150
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

On Mon, Apr 21, 2025 at 07:36:34PM +0800, Zhengqiao Xia wrote:
> AUO B140QAN08.H
> BOE NE140WUM-N6S
> CSW MNE007QS3-8
> 
> Zhengqiao Xia (3):
>   drm/panel-edp: Add support for AUO B140QAN08.H panel
>   drm/panel-edp: Add support for BOE NE140WUM-N6S panel
>   drm/panel-edp: Add support for CSW MNE007QS3-8 panel
> 
>  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

For the series,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'd still like to hear a word from Doug as he usually manages/reviews
panels.

-- 
With best wishes
Dmitry
