Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB737B18F99
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 19:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EFE10E13E;
	Sat,  2 Aug 2025 17:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxBEt47R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EA610E13E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 17:45:10 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 572FEZDT019816
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 17:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0EbUAvWWQpPrO+h431DyWvyK
 NZekIvD59gM98+lMufs=; b=CxBEt47RdTWU3Bkrzu8hTRDxdKAyTeDdJ+M94Fqk
 aZZyWpjFaS/0zV8tYY4VxVqAZLiQKKqs6KTAUEolyo/E/uuelYKj0nZizyYhYtOZ
 Q/lSP23WLsu8bXj1vPWYO4kFGwQhXcDhU4SchzzDbrZ1pgtHx6pdZmgHM7yIRh2x
 6c6shGIb/o8B+qOCR8W/52htHsdip59GvITUuRx3cyxx/Sk7k9Thk4noE9mBuNcr
 VSTmMu7h1y9c/gIyIJNmrWz8H7KPRKXy7H1uzDMu8NRXXFKrTxfaqAjGIrKS6yCo
 oREGLh1YP22CdIWvBI/Z8WZttROA+aOnxZ21ux1Bh+nHbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwh582-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 17:45:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af1a20cbcfso12273501cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 10:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754156708; x=1754761508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EbUAvWWQpPrO+h431DyWvyKNZekIvD59gM98+lMufs=;
 b=B5GAqleeew036nmkuVw542iMMeiW7dlNggckUJK88+gNJSkMfZT+2XzlWuEMxQH7Rj
 o9PZ80FYnfSpUZKoO/YyrH1WB9Yk7TgzyXafp4/hben5ZZrzGMbrk5w9rpG5d0wmvk0G
 3Y3YeZpuLN3GvXTtAVaElA6NWgjlj9rkLAXAeMiWiJUl1N2TVbE/q0Ac+Bnvum9qpRdg
 cIejaWVEi8YeBw4GKLBca1mU6nMJ2mjF84uDLH2fEiozQN0XrJ/3oH9JsdBKZRAV51HR
 H4j+hoL34mrVcfTnvKeA10Qm3BzRPAEdulBKJr4BXa9v8kFDv20hD0+n4t+VbT5ugwTE
 VM8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Q4jJpnHkqbcFrRsIfMwXCC7afxZe2EeJfn+aAQDHhQ+fv06flqe/qxqljvxCRDs73Fmt0AKTWuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRcVV/5ohe8gmaxpLNgFKIftDNkE+2fJoDaUJLKCwP6ab6i46N
 jhTChsylm4xbWl003+ubzp4/Nt17YMKkeZvWWKwDMvu6aRQdwkulGHHt6ZG6snyLNLygoxrx6i8
 QOt5UXKb/MfvM/UxVc0vkcsswvxYXDnkwCCSDz7Hr4SBmsqqIqfyJg8Qw0BKqZ0m2STXg/WE=
X-Gm-Gg: ASbGncsW2yXztWE6S9igvzSF6nAiaUuBZLTV294CeoNst6g6dVTOeomd26lASuC08Na
 89y9B2SiXl8hn3YiB1eQL8eBq5VT70eGLWxWkLVRkqI5PwxKXrJWb+oduOzZQcbrWTrfY1mYb2/
 6Pr/hkbFuxiPqXDhxEX7CdGW5lrgnjMGwgQhqCa3u9w38JvE3Z1HBrY+eRCBV4kRpZODmnKajzv
 pU53RxUePjyqIXc/s6yhS7HZe3636GNmH0JIcuj1XsWMDCbRgzne6btE9+jCMvO3LXR1uvgFvj6
 gqV2+UGFGu/CcZLTVozULkoFlspgu1R7Ebsw34Su0TcZFtTk47BHZBYB2xU7bIARbLLXizPhsn+
 CPzR5vjhivhmrViG50rgAW6nRwT7d+w/nNXmTim+QyGenZenDD+z7
X-Received: by 2002:a05:622a:6090:b0:4ab:95a7:71d2 with SMTP id
 d75a77b69052e-4af10d77e73mr60076391cf.56.1754156708026; 
 Sat, 02 Aug 2025 10:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZFJ9ZncMv0GBgEG7PbQ/lsOlmBLqt5+Q9IM7PyWYnWZaynQup7F4KuR6kPQ1X6ByQ9G2Qog==
X-Received: by 2002:a05:622a:6090:b0:4ab:95a7:71d2 with SMTP id
 d75a77b69052e-4af10d77e73mr60076051cf.56.1754156707629; 
 Sat, 02 Aug 2025 10:45:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfdcsm1065014e87.1.2025.08.02.10.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 10:45:06 -0700 (PDT)
Date: Sat, 2 Aug 2025 20:45:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: fix OF node leak
Message-ID: <n3pu5ninfmknkde5ntn6hrybshhkhd7iorehfj4pv5zj4lvsyd@6z7v2h3amvri>
References: <20250708085124.15445-1-johan@kernel.org>
 <20250708085124.15445-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708085124.15445-2-johan@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDE0MyBTYWx0ZWRfX4SEb/2VGVI0b
 FUoiUaKaLutHj7WE4t6VBr1219HfWYPOk9fyRFVi1KNYbfz1zEN5O2XzTi7S1skxZHjeAMb+iBj
 E1uodahmrFAKlEz/wtbqaqAZMQeR6u1uEU9jY9UAuA5+5I7kTJOO7O5I6FqMLq3MBztQTZcjsxX
 3lzB8xw60xgYGVksUufMr+KbIVr8VNtIXHVTyR6ZrYDvu6l3z5xJ+X7iojsNqIJB4Ybm3Mg92rB
 wyRIlcA+7CJKfB0bVHjg7iDCnn9721Gdqxozbb4KlBtyXqln1KjLjeJdM0cDLbw1ziAEZMDdkRq
 iZDfGCZj9A6k4GD/Beo0L7cJ+3rYRnAMc1IA38ltq8hL5DLtHM5lCvZsPJiBYApWAGbef7b4EZq
 aJzV5VDEP/EA4HkQhC+Tg6wL5LEE6Q/LN1Yf918YPbU3aM/0rPaXkz3xsq+t5DiTcBpkbQtX
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=688e4ea4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZKwWdIalRbw524GBQUkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6hMZtmqFnGHrrrNO9LFYU1jtKvNdXDcZ
X-Proofpoint-ORIG-GUID: 6hMZtmqFnGHrrrNO9LFYU1jtKvNdXDcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020143
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

On Tue, Jul 08, 2025 at 10:51:23AM +0200, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when creating the aux
> bridge device when the device is later released.
> 
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/aux-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
PLease excuse me for the delay.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
