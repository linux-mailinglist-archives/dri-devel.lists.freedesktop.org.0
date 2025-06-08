Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8AEAD11FE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32FD10E21D;
	Sun,  8 Jun 2025 12:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKrKqAog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D936710E1F9
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:36:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558ASkYF009948
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 12:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QMchh18XIKjcNGbJVAE9z89B
 dh3GHDDXcUD6ZQzWboE=; b=LKrKqAogVcNiO7EgN6/uI0zS7pEAKoU9poKkQBv5
 T/SwvQv+Qq7YxnNO7EHbV807TLGheYoMmmRub+s5LK1AnjSrnryhXWDe4KN9XiyI
 142Xd4GCx1vDg4LD2kNjFwP4CPZ00Ap45wangHi3sNKd4Puf4Wx4vtyLHEIiEtex
 09Q6MWu7Ar1Jl0tbSvDThwz6Muj58CVpY5GvwAbp3Kzxbf1pDq0zqQB7uUBNg1nI
 9Veo1SWP+pjMAYaYOjiBZz02Gk2OEtJNJFKD5y5ZvZu4sQt84b0Vun3yXRikN+YZ
 dmk0VbaEoodwH1YoofP6D9iW+jwyEN9K3P979oUYLF/1Iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcakfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:36:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c790dc38b4so599706085a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749386197; x=1749990997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMchh18XIKjcNGbJVAE9z89Bdh3GHDDXcUD6ZQzWboE=;
 b=tGJzSAyxr0VInKcyrvqUUtRuvV7jEQeX+aQbVHN7uIYs4ZYQ7p/Wi6uFL18ojs7+y3
 v9XgDzQDEW1bb4QCRXe5O+XCfqlmVe9Mh0qWdRcSqPGFJc/pp33oLeQwLTgjc0lzMrBN
 xFR7Mb7QcQzx7TUj8Gym+eYZja5hwYjOX8et/irlptO2wvCpvZRz+IYtjgNj0Jw7uyt8
 Tz/iW+UqK1CI4xShvVmhv8HHhQpoiUvIcBQZXBL84eVI05tZ38WvI2IWikP2NhxH/MVC
 Yv9XJoEOgKOiiPe62uUveDoeDQWnlW5xOea10nJi1aG5JkuBePv7xJiQNX0PruaNSK79
 8rBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUByJExH4KgnNtXetRsstqpfXWqZGL1UFZEml0YWlXpHb8E1s2sv+kCtFgmXNJxg8F2cON5odZkoYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAOVuAW42+2odsg8I8BlSYzn53RWOLwYiauztiNskDiJk5HMs6
 eZJw7ljY5MnvNnBeHq8+q6XQ509fDLOw0QHQD2R29BAH+y+8jaqPunBwzXdMy0mO2d2AdnCy+gM
 5eNASjhMQFgxZBAtSgVgCHUZAIDu5Coyr7gFKz5GA3uv4wReCM1Ltnbr4lTXCzMF6EJoMBk8=
X-Gm-Gg: ASbGncu0uVRL3QjsVb8+klXqCYIsU3BJH3l36yMc4VBlWoVRbN+ZJQSd80T9Uxs2jNC
 nQYwuBuRnJSkKiZ5zNrgWjUo9O4ACGRvmr/R3RxBAW+pC0FfDLHvd7j428amfKaYcpyi1iXSPPx
 /aSvts8rCOSKGoVQDVmYmhKRLsfw/2n2tk2gxrAZfdgDWokp1omCzu1nNDj79Pvjyxh/EHHEtka
 Krt/FxdsRVvd9EU9zWI+oDZWuwXq91hxkSiAdPr9tCm4MMxBGZ7BjB09130BAASoY8phUu98Dfd
 vdUQgGvjjRfSqOgiI68jA4OjnA0hLpBsUILKgz6/Pw6rb1/NXVky7wxXBDlNhzlMtDpRk4J3WjL
 9GcSR/RmX+A==
X-Received: by 2002:a05:620a:444d:b0:7cb:de0d:ba59 with SMTP id
 af79cd13be357-7d3871fefd6mr708116385a.17.1749386196629; 
 Sun, 08 Jun 2025 05:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESMQMBN9peETZizKFaXKMOqHtH3cx/FmiHI69T4+zpC05m9uJy5izUDSrrrC9Zt4LcSZqTaA==
X-Received: by 2002:a05:620a:444d:b0:7cb:de0d:ba59 with SMTP id
 af79cd13be357-7d3871fefd6mr708110485a.17.1749386195657; 
 Sun, 08 Jun 2025 05:36:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d783csm747883e87.71.2025.06.08.05.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:36:33 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:36:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-6-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5OSBTYWx0ZWRfXx7lpHhq6uZYz
 Zy69VltQGbbHkUYreCpCYagoVZ5FLwQM2Zuqv3tOWyy8642PbQXmzTlCxvgSr+8bk0lCCDkPEO2
 w09UzWskvzZ6UQuMzjPkJXMiLcAW5KFzlEDjpk+31DVd+oMMe+0FjtEOzE2RWSbqiqFYPO3E7Bj
 vWefmZT9a6b8KBjeJcdiMmGS3gjc2YtQBujAwtu0vx78hqZgoIr2C+1iCX3pxAOmbmZk0SGrz9N
 vORFEYieAs0hc/zt7bSCxYDTIU+0CS5jRFycwX9lXSyj7yj+aYDlH3q4qKp3xgqL5FfMDRf5ZHT
 P0uRAu3NlTZaoBdhgUfE/GjP0d+cD3cmfL0BUcIsTmwHZBuMWeEkAWm8cHw+I2YPeurYad1LLXh
 XWnYSRFOzgXsKgm0A+DsYtb3UK+SsTucMF9w6m7oLUfkM9LjewG/afUz4iUjJfdmjO0QDKAR
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684583d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=FZSnmcJDv_DbaQ288-oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Qt4JptA6CHZNlqKzffRgfeG6AwWbIvSL
X-Proofpoint-ORIG-GUID: Qt4JptA6CHZNlqKzffRgfeG6AwWbIvSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080099
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

On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> DP Link training successful at 8.1Gbps with some monitors' max link rate
> are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
> from devices' capabilities.

I've hard time understanding this message.

> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")

No, the tag is incorrect. Mentioned commit is not related.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>  4 files changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> index 676059d4c1e6..8191233aa965 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>  
>  	return 0;
>  }
> -
> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> -{
> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> -
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);

Where did these two writes go?

> -
> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> -}
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
