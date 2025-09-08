Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439AB48902
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89FF10E4AF;
	Mon,  8 Sep 2025 09:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ncyq0gAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DED10E4AF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:48:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58894o46013497
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 09:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LhfhHap5hYU7xmjyTW9F9rXA
 9Whxyp4HeZGrijVcxzE=; b=Ncyq0gAIPuWEPH/DyS6X9PoHfbYjT9sBIjoie6G/
 doMu2uQh5g8KAWMMwBaBXuc6RkJWKy9IAKrqYUY2bYBL/Kt3v/zJfjomGJMr+LIK
 zQHBPqXgosk/m0N1ILf8T51Wlxny1qCY1xvbNEOYiSngUtY1xw7ioRLvcC+2oB7F
 clrxM3ZMQ50cHXn2h2p8yGXWDKxYl5GWNjLaNa498v3KvmXVQE43QkVrwFJ4b3ic
 IK9QFhVbW4aXu1LC5Byi8ESlsI8ap/ss1OWeklfDWJCoiMnIUZUzu8niEDF7h674
 K4S/lAZKHaRCj/uloj14L5U18LZd3oGxPUd22nK6cn0Y2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0m4n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:48:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5fbf0388eso25810881cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 02:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324887; x=1757929687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhfhHap5hYU7xmjyTW9F9rXA9Whxyp4HeZGrijVcxzE=;
 b=oI7LEDOfwhJ78QfGTlFklbqXKi2xtRyeshV3n33kswFnid2eAjIo+xkDGpdU1UT+2F
 eiH6sYGJ6tQ1Ro0qHBx7vcBT4ZfogxiHF771d8YE3gpkuNHM4DKFEMMkzhLsRWeO1TnA
 dXqfrr9wjA/qA05Hfp5hf+gzfgxqCNqCxvfqFylR+GC3ANCdBIVx8QhAiXUZmZN6x1Hk
 JDgCVkCQ3JLFyER20q8XLTjN2w5CmZ5idna0gj0gt1rYSNVT338cfoOPuKIGu4DJi+OK
 RJZiBJ6mGkuVb0y/vm6ctTg7x2OngiQprBVTO3t3rzuibllfFNGknIfbDZCrsPzW4KUY
 l1Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVfVHm/2CKgVSAZO9CfTLqup166pvLzoBryWnSamjaG/+6g0npZwoxLDSmSX76Q4/tWUeq3tLem0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoe2ZeEgIvIWnTdvYALI6nQZ5Q0lZ3pjjKDfUNdLbUCaeXYg+W
 OoMhupRQVP/qRCVyJ95i3tTJWIKFj7Er0MtrCEpmYStjzLfWkDKdjHf0OtnsITDzxSJVN7yFZ/U
 QsHYvnt2jbB0rj97j/YiTgInImYUk/js6yE7oJjsaJGAKlgK1N50HRf6aTCmFl26Ic9jeSHmmG1
 dvyV8=
X-Gm-Gg: ASbGncsO/FzATx0+MpWMoCHR238U4iQTYGuIRJ0KBl9uj3GWN+N2pLp/UhJM95D2RG+
 YxPZ8uOQUMJhw06pCgoz3uogTxiQMUd2e3n519b8r/ZBOsRquxCDb1FFqJunnYmoTneFLciISFp
 xK7J20jSvcTyCuQtewUKis3Akve8JqAM/cMc0LYts11lbGui18Hpvpho7dvumipGJlUxbDDXvOV
 Nh7nwROMgjLNKoo+qsWIxopo/nYOg+ESIu42ze8Y159Qv4mlGirmvamiOp5yYHNoKwsyqz4+XcE
 mfENoyCIxKvXIah3OciPgR7BaMqmXNL3CAPagbxee3Ibw+CgyUIQ6vcsf+4yJu/ehmiFl/cvupS
 vgjwucX4ZcCJ96rVUmqeH6QVrNs0jTUKGh3JEnN/M1U3n/y2s7K4k
X-Received: by 2002:a05:622a:5012:b0:4b5:ee26:5362 with SMTP id
 d75a77b69052e-4b5f834e673mr62482181cf.8.1757324887221; 
 Mon, 08 Sep 2025 02:48:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwW5yW9mmwUX414xMr4F3g7FOeHsQ908LynTz8dWVo8Jm54hMcp9b0uUEfgpV9Rx6Uqxf/EQ==
X-Received: by 2002:a05:622a:5012:b0:4b5:ee26:5362 with SMTP id
 d75a77b69052e-4b5f834e673mr62481891cf.8.1757324886625; 
 Mon, 08 Sep 2025 02:48:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c50317sm35222401fa.2.2025.09.08.02.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 02:48:05 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:48:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Message-ID: <3ll7uxguykwufscftok7kxexfx7w33me5py4qejup2r6jsymxu@37jycbpwodng>
References: <20250908-it6263-vendor-specific-infoframe-v2-1-3f2ebd9135ad@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-it6263-vendor-specific-infoframe-v2-1-3f2ebd9135ad@nxp.com>
X-Proofpoint-ORIG-GUID: 637hsva9urSpSBXnCk7MQGxuAiCUQG74
X-Proofpoint-GUID: 637hsva9urSpSBXnCk7MQGxuAiCUQG74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXy357PLtkviSN
 oTNRDb1MOj589u2gQKBsOnp5KwWYDJHrRn0gw72hKqz55nbR8xtFLqR1q59Lq1Tul41cMyY0yGS
 YwFc9syiLpXM7FsYEYeC+dny6OJ3UbyMvWRAJXI71Dx8XFUORa/OL5K11HxF1TWTx469ptBNPvv
 0PV1OI0ViCZF9MkkJQFi5yK/ABj4f3EcfjXf2MFN6Oa7Ef73EnDQrETOxHmwtKLJMlIbxQ+Ti3H
 7wUzCmd+p1N9JOxxxPucDPJ9LaU2X1jHVxKmXSX6lbT0/9PDfwkFGv/GXbhQU9AHCytnPSCVHUP
 qkuzFzS/8E0aVeMzVIqgNkcFiFl8pNy+bhf+KYAwZ6N4DK6j6N9TgaKF505wzVVQNFbgDkLM5t1
 twZaGvxM
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bea658 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=6IanCRA773FJqE2TFJUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Mon, Sep 08, 2025 at 02:05:48PM +0800, Liu Ying wrote:
> IT6263 supports HDMI vendor specific infoframe.  The infoframe header
> and payload are configurable via NULL packet registers.  The infoframe
> is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
> specific infoframe support.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Changes in v2:
> - Drop zeroing out all NULL packet registers.  (Dmitry)
> - Drop no longer used HDMI_PKT_HB_PB_CHUNK_SIZE macro.
> - Link to v1: https://lore.kernel.org/r/20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 64 +++++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
