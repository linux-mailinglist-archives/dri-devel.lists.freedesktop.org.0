Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C274B951D0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DED10E5B1;
	Tue, 23 Sep 2025 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrEuqHn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8F10E5B1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:03:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H9Qr001850
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=N9VvJiiEfuibCwd3WFX3PUUK
 4AoEriLzCqFcQqEJWTo=; b=JrEuqHn3/6Loax1achA80FK+eU7UAK/Ud72aUpM7
 9yT3MMY3Sz/AShAkhxdCK375zi/vZpaNL+eh2BpW5uRleNHFBzXbnBMnLsyu+6Om
 vXGyBTPNIBG0ty6XaS/nOwkjp44nLe6hj+LUOtrEQ2pppI9Zagvrw4MAmj0FtGCo
 j2Nv+lx8fpAUO/2DuoEvP9rFxmROOq1At0s65GteKcQdBQkg9E9s9KE8yQyLejV2
 i7ap2tuuKoU+w+uPaCNmUfihvLiVrQRFol+niSlvP50kMpGKCdY1qRKOo1zbyIEU
 bbVxTXwsoCuc5OqlFxe/SIJ5baElNRMvs4DZL+fW4PmUfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fft54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:03:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-792f273fd58so93978896d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758618237; x=1759223037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9VvJiiEfuibCwd3WFX3PUUK4AoEriLzCqFcQqEJWTo=;
 b=TOtZl0QVJXWH1+Cd03rtUVWbSWn1db01SSJ+qyExcg+SpSePkA9Np3uMbLhwvWIiKF
 cucspdI9+WHorS8PTU3pNn2ldsMb6ndoi2hhTAWlsEqNaPL8PKc5jmjIGEFvFmVoyOpC
 hKVg7IQlbkJxI5/D68py9YZ8t3yyzOnhlyHfXGXDUwlzQu0G1plRstc4QkPPYUKsvIXk
 jbXu6u4ry9YNMqW7oOwePtAi3ZxccWR/PavS0hhxgObMWvq3mYIcVbgn6bTaIYKZUD6l
 zl+iZkbrrqBCw1u+HdhzrH0BVbUfe+Wx9erB/Tj9xXikeyCuLiHPiV+W37UFIvowyO8U
 jkCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsIuGsK1AUpbGUGyzgTsI4f3sC1BeZvsZ8r0qDMzXgTlCmlyESey8DKZWss7m8k0SBTajuvhaDdRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsCmTLI8vI0AJ1xra3ImPQxO2JjC/1ar9QTSl10/M2VvU7/JdY
 oGCQRKsS3WJHJR0zjaxWAWNJ7A5VCujO5LYjKZBw5zv3Gx51UZdfhAg+1BkAPmZqcBKTqJnQHht
 Gkd3uztPsyAb6ylDqJwr3QoREzfrNFhtq2mgh5WE0NI8GIU0I6/VtXeInevMwFka5Zqjw/VY=
X-Gm-Gg: ASbGncukcaFkZmBN3uE3w5FUv/UNykACEvo/Ci5BpVsl9dkCjRXj6Yj2sc2DG8Q0QL/
 fFp8jxaIKGDpixcppqGRCgtfoBuMjwTu7dibqYwNJUwKePr5QUWgTCTMV88tqQDcC6YZcsPbaLF
 D1Pmdufiz06gt4KLcjcCLdTgseTUAiqX8/QHEgI+YkH3AWR0VnOJvxuz6P2RKwZCrKtt3ATGNXf
 EZSZ/lFlfZ05wvcTiQx9WZj4H0ESwPpZ9XfqaTibVzXO0ynByUNJhSY1q/yKINrdFbXZ5AciMVV
 5DZ4jq5zMNZVSOKY0FIF0V5k+MRc2TwhXHGrk6K4zrYH5Yzdz2XbCFuwFa9zEnDmo7lo1Jekviv
 Qp/iwna85Q8K5xxvRHbF5ATX7pzDL0txWWBON/htoxlxHsfrcu2RY
X-Received: by 2002:a05:6214:2129:b0:7ad:179b:6472 with SMTP id
 6a1803df08f44-7e71bcbeb77mr20144256d6.53.1758618236549; 
 Tue, 23 Sep 2025 02:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXtyN7kZQLjCpjvBStXoTFCJzTiR6gRbqkzv7uy9Rmgc2Siqdmrlmy6eFmsWYX/A81wP5zjQ==
X-Received: by 2002:a05:6214:2129:b0:7ad:179b:6472 with SMTP id
 6a1803df08f44-7e71bcbeb77mr20143976d6.53.1758618236091; 
 Tue, 23 Sep 2025 02:03:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b9592e6c3sm2402073e87.46.2025.09.23.02.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 02:03:55 -0700 (PDT)
Date: Tue, 23 Sep 2025 12:03:53 +0300
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, Pet.Weng@ite.com.tw,
 Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/bridge: it6505: add INT status check while
 link auto training
Message-ID: <pzwwlv4epiy36t7k66ymhbcetyz47tzvx2kxwmbqzdn7kygori@gwwxchq52mkw>
References: <20250923-fix-link-training-v4-0-7c18f5d3891e@ite.com.tw>
 <20250923-fix-link-training-v4-2-7c18f5d3891e@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-fix-link-training-v4-2-7c18f5d3891e@ite.com.tw>
X-Proofpoint-ORIG-GUID: MU2tcbyOtjzFHZGdyR7D1YUzMXtsR9UY
X-Proofpoint-GUID: MU2tcbyOtjzFHZGdyR7D1YUzMXtsR9UY
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d2627e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=YJcEIqG2WBgLaOaGd_8A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7V58rZDII/8/
 psCKuPnb68klbWp3A2PjUiBHbtR9UO0xDCQlnMciLU7uadOqIbFDTQ9c0rDGb21qI4Jc2rJyuqh
 UVbGVOg3TAy83+YizahgfOFJ2cAB1f3NyXp6JEzK1hj8u6gf8vAnSS/eByqk6Iy22chmowlCTvI
 JLZtBF+MfSp7jHy0Pr6S49808S15ihVNcKx5M37LUka+Q1QpnqZxCHsn2DYCosFPX5XnMrCOUzV
 3WTVbUC36YEN5NF1RDZ5As+Fo+m4WMTjd3Kzr3Sx3MznZ+tHRHA1KIvNUIXMOOrqJQNc3t+u426
 WRpuJcuQ1vcvPWiFSGvESEqdLulEcvLPcO4BjuZ18jwfFY5lNW2e5Y9nfDbvJKDuuD1a3SOf1ju
 9s5WWyN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Tue, Sep 23, 2025 at 02:23:42PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When start link training, interrupt status INT_LINK_TRAIN_FAIL can use to
> check link training fail and no need to wait until timeout.
> 
> it6505_irq_link_train_fail() remove from interrupt and no longer used.
> 
> IT6505 HW auto link training which will write DPCD and check training
> status automatically.
> 
> In the case that driver set link rate at 2.7G and HW fail to training,
> it will change link configuration and try 1.65G. And this will cause
> INT_VID_FIFO_ERROR triggered when link clock is changed.
> 
> When video error occurs, video logic is reset and link training restart,
> this will cause endless auto link training.
> 
> when start  link auto training, disable INT_VID_FIFO_ERROR to avoid loop
> and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 38 ++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
