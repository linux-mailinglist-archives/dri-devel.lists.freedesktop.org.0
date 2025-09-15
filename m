Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCFB56DDD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330BF10E286;
	Mon, 15 Sep 2025 01:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEoQcX3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710CE10E286
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:31:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELPFBK029327
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TcJ0ybloGvHGKF4GG02Qp+Ji
 unAoDyIz1wNa1WR0eJ0=; b=aEoQcX3XjDiwxFNZVXI/9dQ5qPZhBipw7/PSlXKx
 p7qEJLH6mJ6mxLXEkxyFjnexu6ilfHagrNTNoaulggzOVQACuAgkotDVJ9ijNKWg
 5nrJ9jVlEQwm0S7z9bwt0lRs90ReByPIaF4McT9tP39EnsLnUB6VWtk2CTHSvfGH
 xvLZwwFHd6Ww1pB1DuuibePEpWOwqNHCjNEFCDeSV52Bfz3qyL90xb+Jn8bfd3CJ
 r5QG+s37WMrt6AEw7Aw5h2URdlg0L5tMWmE8hwOzlqbw89nRL7aAlziAVdi3xKKm
 B1cmNk/CO7r2TyGpjjWtSG9A7YuAa3f5w4NxVC5ESdIoVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr39rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:31:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so79828721cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899911; x=1758504711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TcJ0ybloGvHGKF4GG02Qp+JiunAoDyIz1wNa1WR0eJ0=;
 b=gF0SyRyz5Exr0gskXIV++YksugBwE4QI1eAuCcLxWS3NfENme8h2KmwpRw3pZTQhIC
 Mn4dAW30E0/sBAwV9rR6oTTkjDlEOksZm2Z7DhvhE6bSG+Bg5TKEqH+zuv6hTnHIc+4h
 II2PI2j/3AJRIf/+V0xCgh8mi8ZlsOL2TE30dzc2c3P9VTCu+2zKpZV7uOnMk930kbAn
 epoZaCMnDGbbcflzjVQlKBHX/b9OPTcWhbFgaBN9yeA/P7r938Moncv/z6H4HgbeHt7U
 LsDrC9oEWzsd2JmkxUVP1RHGkwPGCS26Q5257gtPbu4L40Xe4HDUmxwYoJeTTdTBig0f
 nkBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyJYx7B10hPlGFYONqyQR9ForUXqQ9490YvLFJm4OiwiiSZKeNHKZYawyu/HIelNjFk6lIcsGPEOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2y8UAftLMQrbYbMR4bNDIKjuxXIJmkunD6aD38mXNYWt+TNdt
 wUno65jzUWlcxs8V9H2S1A9CLZJ7OgrELYoltRFqohhcashMcbMZElYhca1UmyyWn68mn7zNCKp
 NVYRzy9saGF2QIJE306anMOicecWq8G2SMhetb61HQgAH8WW6CnEZFC/kgnJSLpb2s8AAa6I=
X-Gm-Gg: ASbGnctxFuBlnz2sFrgTyfmLMR4Oq7qMewVB6kPjfEfxkcIwnigeR0/I5zgvcvryzC1
 qAc9HDaQ9EHdGGaMRHbLkJa22YvtyUMTnxRfzynJXoUhM6joqmtASQAkhyHK9uXFmbsWLcd6ioA
 02QOH6ecYdBSgVV7LCR/5gAODhpKxJaZs6tRSK0dN3vkP+2rkTTzcIP8oh8fAfXvs1z4qDb/AWc
 5RwtqibI+3ZatRg+A5HZKm31b1OenHezyfktdaH6aEmLwwC9fXAxGl6x5CJYAKq4VNTONRlZY/3
 0G2HZutw7vrJf23Q5MQY1bhdJjxEOfAougSsJHNT/j9StJnTULck6tgGWU3ZvARUdfC88Ga/Tf2
 JkKGkgC9KOZ71FWuf8A3quv5FGu7a/lMwgcAaEwsLWQf8S6fahzR6
X-Received: by 2002:ac8:7e96:0:b0:4b3:2dc:8b84 with SMTP id
 d75a77b69052e-4b77d12a31bmr122322621cf.47.1757899910607; 
 Sun, 14 Sep 2025 18:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVrMreE7OMj8MxiWmIm0GBSOu7bo6i+Ps/Q4ehmdYwNOXPVmtMmMD9KbYt/UgI4ov3lbfN/Q==
X-Received: by 2002:ac8:7e96:0:b0:4b3:2dc:8b84 with SMTP id
 d75a77b69052e-4b77d12a31bmr122322381cf.47.1757899910134; 
 Sun, 14 Sep 2025 18:31:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5d20df19sm3261383e87.48.2025.09.14.18.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:31:49 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:31:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, l.stach@pengutronix.de,
 dianders@chromium.org, m.szyprowski@samsung.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_dpcd_read_link_status()
Message-ID: <fdzw7qfha5h7luvpxvgr7vvdhlpvc2dzkkfxbp7fv7obnvmurw@tf7jefpjatsl>
References: <20250911112756.4008435-1-damon.ding@rock-chips.com>
 <20250911112756.4008435-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911112756.4008435-2-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: 3hEskRUVruvF1SKQ1yVBEHEjYUqjNJXt
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c76c87 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=_6liaYtLipVCF3ugnXEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX/jwSKyquNrk0
 U0yZ+rW/hi3hBlBmfKS8cu09D7BqkXvoS7xmnxPJ5blC5AliSpWCyZIzJ5d1E/jgzNkBFTTsU7p
 DPlev+ZhradTSz59dBw1EsPiV0vUAB2bkWg1/lpjscUfEHj1nxI1wu6ePNsE2ZONvPfpVrkEMf6
 7A8x6TFKt1vAgHISM65zsPteTGOjc0+FJ1ilE/nofyFzwG1IK9lRfn5jomIQEQLH5WhVp6nivbA
 4RSXBldNbCgQ5+Ng1T3/7ApiyEr9Hd1tRPQ9YaUl842XLu8XB+heFJa8bPGjVXTaATrMQThJD/W
 6V8Q/1czmsEQo5hiRn76h+LiMbxwSQznUYb3arTHA28S8vSf9UHOV1VEgnhkcp17dHf8RIVwpro
 oqrzOFov
X-Proofpoint-GUID: 3hEskRUVruvF1SKQ1yVBEHEjYUqjNJXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
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

On Thu, Sep 11, 2025 at 07:27:53PM +0800, Damon Ding wrote:
> Use existing DP helper API to read link status related DPCDs.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
