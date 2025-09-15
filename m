Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B968B57B46
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327D10E485;
	Mon, 15 Sep 2025 12:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCH8gLQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609B110E485
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:38:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FAQf3u018287
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fmb6MUpiP+yHPdu02ocRwcBu
 vBIq20AZnHMtS+w4EwQ=; b=UCH8gLQR4RnuhM13UUbEDCFo0LFUiCeSDngCZNC6
 FhCOriPOEeljmMUTgd1lQA3lE2lsPd3MK7HKlDZ48Og7FI4FFko7Eb3Z58MY42bN
 5QEoaY+3If7yGjsug84l8ZpFNnFXFU8bcEtKU7c68fXSAkQIskrexRaHJG7u7Oc4
 NrARAjnSBUYD7c1ZDbGt11iYZ54DaWINQg23EUHoQM1lWloY8jP44S729E2TDRHG
 eg3Yx/o5SCV/+hnr6EvtLd6qE0RetYZzpEK4RfY9PX0/TBtLYcfB4ZD2nFHW8X6S
 FMZ9eVud1PwuqLLqKkhH5dj91WMkpAUrtcH4iaV+gwDxGQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sgbg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:38:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-72023d1be83so133885406d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757939931; x=1758544731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fmb6MUpiP+yHPdu02ocRwcBuvBIq20AZnHMtS+w4EwQ=;
 b=i4loLDGUoNT4zzSdNxVUVuj6RwXmqUyVkrc2lCxeU/RsZg0sG3GdEg5tuu0F8wir33
 WejUTDCIF+HYh0IGw3X2pmFseoSmXoXBJx+d5ziVxXMsIjTDjJLI5ycQvw1ovytj1K/M
 1si45jPw4gGey60Xjc7/kXx0vk/Q98CigbKbfJpiKEoClicFRRzJw8F21k+K7pmMt75S
 LX5lmGZ5E4v5RqP/Qq+isZmSwbvAL+8hud8YIBr/3w/TUK7m5kNmn+EbL2zdxSsjn7vr
 UUsJGh5QkL8Yy/swDx2JPUUE8qDg0jB96ktum4ctb+DpFhLorn3vefBne47Mky4y6HI/
 0qQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWumihNvb1735TVdJvm8t5JonoCviyW85OK6R+Q+QNaE0K1Iz/tA19GyxOLS0EN6ddo71xTd7uYb/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFdrlSrWTWSQmfTftykW1lvP+Fqq4LblNkZEPqJKiDBXPZqVcp
 JmOLpRnv64XsdOs+buZ9oWMpw+5MtieHPrfDUYIAUn8o/dmA7dSweuwiel6+uL2ZZxp8nEldIl1
 T7+7X27YUH7ZIQ74SV5K4E4bg2oylcOgIdtqAVaXWK7s7FHJ0JsjBtWsABjnxYFVzk1sFwnU=
X-Gm-Gg: ASbGnctOYZrfY7xH28AQHdO8gyA7sJ9N098VSo2Duxsytlxi35ixSZAAoZkj1QNWFld
 5Jn66BL+OtJlh9eH+9EVp64YEcOGVh2ht0NAS/sAEzJUEBakzMnZ1/8qitTLKsvN0EvfQV0Zcyp
 ya2suiQhmOSCuL6dMY8YR8QLTLp9VBQOu9GiXkhToMwaaTwO4uYV/Ac5jA18fi7HtBtk8kPiRqA
 V9Hp1AfCwTC9VTddchfV79I92JA2UxQCGbhE5SP2vvJ/SJyJ5KBBmRu3a6gA3gIx0Kn+Q7sXQL0
 zrx7PafQFAWaEG42HoZMcH4qRz+mnkhi8Xn7zK0JqpKFtl9Z6/rOC+9XwwrQ60Yu+HwBlSWksE+
 zpk0BM8+tFiGGWZkOn0LKHzIfuorXlvDxdfKp4FkO18IyOH97XN5K
X-Received: by 2002:a05:6214:5004:b0:725:f1c3:2ab with SMTP id
 6a1803df08f44-767c1f71efcmr141751036d6.43.1757939931329; 
 Mon, 15 Sep 2025 05:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECQ/ky4PMlA94VBI8Y6iP+p4utCJhLTah33pyYzU/Wknu7JOg31Xy7D9L0TMZRcWSzS6GnLA==
X-Received: by 2002:a05:6214:5004:b0:725:f1c3:2ab with SMTP id
 6a1803df08f44-767c1f71efcmr141750666d6.43.1757939930802; 
 Mon, 15 Sep 2025 05:38:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571a547ae5bsm2588322e87.19.2025.09.15.05.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 05:38:49 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:38:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dianders@chromium.org, m.szyprowski@samsung.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Reuse
 &link_train.training_lane[] to set DPCD DP_TRAINING_LANEx_SET
Message-ID: <cen5nir6tn4ah5z7vgp6k5lxy3cobgzjzm3xmx5hjklr2fsrb3@cx3n47n3ji4n>
References: <20250912034949.4054878-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912034949.4054878-1-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: KnV8ZjMWQujj1-dOvcFrzQ6dnQHvahao
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c808dc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=plrDVsGnED_3QBdGXOcA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: KnV8ZjMWQujj1-dOvcFrzQ6dnQHvahao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX+CoSH5KL4iFg
 bQ2M+6yFjFY0xliwfAjruzC+Fdl/Dl/5LAPgfBFroz3KiB0NROHr7cMW+1FFz2qLFB+Hq9UjbLv
 ZxievdY+sFOkXcHiDPmh64Xvj7nfugmIxWO84tjAfkVeItF9lOQiWD51KjbL7B21+Qxm7ybGx2u
 JpmpU6wZSVY4y/lRQlE8HewCvxXNpCP8qOCCD2mheeWuQJOjcpkcArPUb0X2L4fgW0L7qtZp1kQ
 qH3UzuQWzrCDlzjrro9jfC3F1vS/Po7EpbXt56rA8TzNCfZHEOcUhakArxiG8KwVlxCV9gmmiT/
 bvzc0zg3nj28/bugm6z95FfvimXIXvRU4nNIgOOg9O+woEK5jN4oZH+ju7eqTUg4IVp85/wKzqw
 vkIdQJwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

On Fri, Sep 12, 2025 at 11:49:49AM +0800, Damon Ding wrote:
> In analogix_dp_link_start(), &link_train.training_lane[] is used to
> set phy PE/VS configurations, and buf[] is initialized with the same
> values to set DPCD DP_TRAINING_LANEx_SET.
> 
> It makes sense to reuse &link_train.training_lane[] to set DPCD
> DP_TRAINING_LANEx_SET, which can remove the redundant assignments
> and make codes more consice.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> ---
> 
> Changes in v2:
> - Add Tested-by tag.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
