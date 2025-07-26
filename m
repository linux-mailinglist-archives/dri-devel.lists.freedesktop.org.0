Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400EB12A5A
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 14:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086B10E26D;
	Sat, 26 Jul 2025 12:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uic5+gBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF84E10E26D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:04:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q4mQxq021775
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VoyOpXRtg8gribBcwI2od48J
 idopHaqstqRQI8GRAvQ=; b=Uic5+gBJ9Cg+damRxJqNwUobzHWxb0WUFthMrxQ5
 82CAhudDKkbCP1zzrv/qSse5/vBH405bLWg/Zt5Z/h2L7RgyrDAO/2dJi4Upups1
 23cW9WrrbUVAiVKjQOd8HXVmMdEJNZkKlTZGXc1Ze5GqNdNhRFFuIwHUcXJnxB01
 CSDLSBgXOZA2skOgtyuOOgv2F9Pb3wNWpaTcLA6j0dINwirELFTURIs8MVIPmcXB
 LGSuTAzFxblbw9a4VNTarVC32W1p2HUdmCrW7Sg6a9toI4PQZicsjHYyaVa0iuI3
 onYYM6JuMSpfi56WDDAtDVSfogo/7h3X969T26iYpa9aRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racgff0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 12:04:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so62068536d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 05:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753531443; x=1754136243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoyOpXRtg8gribBcwI2od48JidopHaqstqRQI8GRAvQ=;
 b=f5rbMQVZfJrZCcTppRSG3ezYIEQ8KuPD3GMskhCj/eUjWkt7sgttd+3veUsG+BQ4Tx
 Pw6+O8JNyTeyKnXhRt5z0ovYNcA3vxxT3VLjUffUEjl9HNq9CAO7gSLAFMLRgcWYpaMT
 PkQOo4v/Fh+WSYn57Sz2NdMtKsh6wfagiOWz0zt0PwJr6+pNS0l/3Hch1jB+F0kwkhnD
 qGD7tyYqV2B11quS4ok72JbVaFtjkbYR2iRxbRC1YBBsYfkHQGNXwx/x2UWTApf7RxGY
 3Mcy2UdFLVkI0rvb8uD/xHnwKfPeUM0O6z4xlB5Y3MVHSzAxtEv+vabQ+9Nxh0/JtqvN
 /WUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFNRjjDcWnJGjjgOY/A6fw8+Rb8QwaRkjccgJf8V3MYSr7HCV3hP5vwkibYruEezZpTsZH6zBlk+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw+jEKYMS270XosoPH0F9guiMkvS7p1hcLwV0QYzJKf30f9VyF
 mRGG9rpDInzYpOfxlF21KchRGpP40RT59X2Y8uw9Dv3liZ2xaU7uMaDhYoVB3NS93H2ONeDXr4J
 fIIbKvXSi4+ezRr8MlOysNu6IzzXpQY1X9RYx+xXwRgFEE1jY5vJQrqv0cQgvsXu16ALxX5Q=
X-Gm-Gg: ASbGncsPP2T+eU0aUCU3POoTo3C6VuGuOPTd4CSn/fptiLO81P+O3aKrRaL+yPJ4A38
 Iad6XZYd0zsxut3HULnDm19g/OP787SbXQVMFpTovniJFc0GIbG5zHt8CmDgje7GLdUk6NOFUkg
 elZ+NC8sELjvf5yA1hkPWL25fgizz4EBIB0OVOZYGNY09mCiel/oCRxFNBE4LXsAYxskdEA6Zu0
 pWUQ7nsP4izHLbDtnit+wh18gP1jgLcBlvnkHQiwr07TN+3RPj40oH2GrWAFM/16q1+rE8YoJS5
 R2iwrMOWq00y3KXOvzr2XSC5yyB2lrcozGLoBQvyDgwO5IzV8uJXW0EL8pPz9Q/GrSykXEDZiva
 YKSm3Sz5mO7MqcSAVVxzeLuiyY/A9YQawMw1LfuXc62UgKULc4Dq6
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id
 6a1803df08f44-7072c79f177mr39705076d6.7.1753531442315; 
 Sat, 26 Jul 2025 05:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58ci26k7CLxO9KIg2k91tBSPq0VEHMytUV57ob5dO9j8+ZCHVsrHrzcPy3gVkj6+ng5cHLw==
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id
 6a1803df08f44-7072c79f177mr39704146d6.7.1753531441626; 
 Sat, 26 Jul 2025 05:04:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d924sm413275e87.43.2025.07.26.05.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:03:59 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 10/14] drm/rockchip: analogix_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <c3a7fptnm7vxpcz3ouzyov2woi4btknb2so7np6z4iq4anyodp@ajgkwlc4khga>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-11-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6884c434 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=23ZsHGXRUfRepE-eGp0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: Ss-LaopnelCFqQr_lViW_RUXuGf0skya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX+C8unhpPTeXO
 v5/Ezrk0mej84QGhC7OUkpo3nNqOgBbXS+fGOWyapyFxueyGapDhoolYKAENTq4G1+hsaJ4jHs5
 cAmWrTr+RE9QhbUhNj03KQUI/EVufGv/HVIqg3BfxRq1wJ5keu+ZJGZX4eWl4UkPBjk4zRSFsNF
 196MZP6+96JGuwFSFfEpMbCzSn5Ie6b3tLPJLCunLZhjjdaElQoLruBERa0LFqnvxqvVnSxNwPl
 3i66s6I93r1+n0+CCZ++eemODgr1xzmDE1ZwCIv9K3OgLzY7E10iLUv1yIrV2bRTtF+9kI57WXb
 Oh86yjFDAlagQ6SA0BEuHBM68Ihd3rUzoTXhisB892iDmAf+KoMlXweOU9FCupSk28kfjCrMb9H
 J/UXIUyeifAvJU95KpVLiQhepILbcJDVuwOGuEDHCP19buG+TJjptApjEuQbpVPB/0j/k0nI
X-Proofpoint-ORIG-GUID: Ss-LaopnelCFqQr_lViW_RUXuGf0skya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=791 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260104
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

On Thu, Jul 24, 2025 at 04:03:00PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Rockchip side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
