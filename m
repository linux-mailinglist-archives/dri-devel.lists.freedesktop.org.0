Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284CB166C7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 21:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEB210E385;
	Wed, 30 Jul 2025 19:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EImQmiXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7F010E385
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 19:18:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbdDg013073
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 19:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FanBCw5BLoPwtDxkGNTUqhlX
 8TW+RlQwVcVVxpLhSWw=; b=EImQmiXDzkiRn46ydjaUn017FBJzOGg+snH8HvIk
 CVE8cvPzeHighmIGP9tu+QOOxBZyAMgg2IN7vLE8eICGAgy0p+hjDA6NYxyuGqrE
 4aCrHPM93FhkdDrQHVE58ji3zjGl82fS/qQA4YX882A0e++kjUlUgbdTF83tJzC+
 Y2APKePWBKnxe2L5P9oAlfflSNtpt9heIomYL9rVxpve0aXUYhdiZiZHS+2Xn6V0
 vKbzD29arggM+itUX6fxPD4t3EvJu6Z0RDPleP+4agXtFDTdSK1OBG4+wjF6/kY9
 Lb2/51tWJq5MqLgwQvUT242YWin5FNkH1+9hGS7PSikqiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm4y12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 19:18:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7073b4fb53eso2088976d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753903105; x=1754507905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FanBCw5BLoPwtDxkGNTUqhlX8TW+RlQwVcVVxpLhSWw=;
 b=c/M+bFsjswP+zNod729mJS9ePFaDS11nUolg/SxX9wLYpYeTfdQgsmUPKIxCGR36oY
 d4o7yIVYLazgwkIWJJQUOhss80JAdeLkE+2BWtZIFIkAMydAIp+llOt4NuQlM2uG51dk
 UjZr6uPyNKrqbGOqsTMRYrgHzqecxdxCmVh6xNkLU8Wjs2fZ1ptfW/PxM6hLmz/sDk3q
 jvl3WobBoxGC3HzGb9yMyDsOsTU75qBKnZSIM51DwyMIJFLWTERRQ1BUrKi3168iyxBv
 35zc6FUS5yrprEZ7km8MeT1zj0a05hJjTDle+weXA736RYDOVGcoSjFcCIEf5G0XdU+9
 CTgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB2YH63R4Or1zFKKdfJQAeCyS/yKoLMqn3YnzbxGFvs8AlYLmBlQ69dZqYLSN4nQN3yv9s9roLE5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3/d0sdX0pc5KhpaDAu9lRmCYmqLurlgjC9xPKb7U+fnluXqkB
 vYq6luC08cmm3Sjq0z89vCrrC4oMbQk19Q5ZKzCITAufx6EZqeP0ZxrZPTXV5sKGF+TV86m0gbT
 guUVjanzU3rr943XvqBo4OnVL6ocbWkB1DzKj9fXeuHcnuSTz5EayFAkw6g9N5IuSifXMTZ4=
X-Gm-Gg: ASbGnctMs2QVGL8U0prOOn1aTwzlTfBBWKKT5KjLrdhN3/8A2EJb8tWzKh1uxjlXUGg
 V/KdE3ml9Yut8I7ri250SV6QsiHrTuTrP8HzOdwcqbaeOUDFTH8+INa9wXD0Sye/KOS7V+wzZFb
 Y1EXjymG9/nMUitp8xHiMOlO5yg4MbAthw+Iq5mrYxb5GTDK4jfCOg6ryeclV9dbXK8fSpKJKyi
 P7bxTDuCLMnvEtNycm8JbAlu10E31CgxzKY1nTW2aI7YP22nP+sYOmy6/m+jQxOvn2xy94TcKRZ
 kAFTksy1hlbxpju1g82LVY2X/3G2M0MJDt6zKOE1tPBccaEW+vBM5U+NAFzxaWpn1xVUUSV2o4K
 PvCMUn/clAeV0R2NhaegNBWYS9k9uScd4gvKuP9ptJSU13Y3F/djf
X-Received: by 2002:ad4:5aa3:0:b0:704:ac29:dda0 with SMTP id
 6a1803df08f44-70766e7f5damr67685526d6.18.1753903104413; 
 Wed, 30 Jul 2025 12:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8eNJMjl5UHD4Y7oHflbvKCvMNV3/wEu2j4m9V/ZDllzbIpyv02lYi/lD+mXFIvB4zqunEA==
X-Received: by 2002:ad4:5aa3:0:b0:704:ac29:dda0 with SMTP id
 6a1803df08f44-70766e7f5damr67684826d6.18.1753903103812; 
 Wed, 30 Jul 2025 12:18:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63363865sm2226014e87.83.2025.07.30.12.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 12:18:22 -0700 (PDT)
Date: Wed, 30 Jul 2025 22:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] drm/bridge: lt9611uxc: reset edid_read on disconnect
Message-ID: <bffxdqrltd7tlyvl5feoo7iriyw3kdhemeljbj3wvjzis7phkp@agztacm2jusr>
References: <20250730-lt9611uxc-reset-edid-v1-1-3ea4d5b16197@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-lt9611uxc-reset-edid-v1-1-3ea4d5b16197@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688a7001 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=shrNnMrm9754DlGR998A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE0MCBTYWx0ZWRfX1tnWWyLl9A0w
 2E/BWrvzkaQyyLYxuiJexMfVp5DB8UYW2trUQ9hSikD1u5CyJmSET1ak+5TGSzPGyqbx8HR1SQg
 To+aPJLs1okE9qJabJwpMY2XVoNygSwFUjhaWLMpv4fzoIZ7A7KzAPAyuzFZnhhqWJ41eryAsAE
 kkUjSkzCJIbhtC2GvYhD3ATCbqlA0DkYSSNQ6dqKvnUt1jQj9qKdU5q7qUFBb0ZEQzz819T2uCP
 cdLAKPWqbjinUCAgDSzwtHUSEzTcPvXfbbQmTTRccVHy13CUh9rXLX+5xn3sl8dJ/TPeKosHDHL
 ievQYX8XKKZWl1YyLySlZ1YlxOftxJwYTmUkZu8RFrf/4JY/RkAjE9NnFPnUKYf8E6+tIYG41ok
 +JJ7tWD/adnGVRpBeenWJHMnjQwSBXPtPBUGO69QAuRtgEVcnbG0hG+DJxP/y10j6hvTINqb
X-Proofpoint-ORIG-GUID: MSc9f3ZsUgvcTtj3b8n0bnHXja76qAIl
X-Proofpoint-GUID: MSc9f3ZsUgvcTtj3b8n0bnHXja76qAIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300140
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

On Wed, Jul 30, 2025 at 08:01:10PM +0530, Nilesh Laad wrote:
> Currently edid_read has value from previous connect session
> and resulting in drm using older edid before new edid is available
> in lt9611uxc.
> Reset edid_read so that correct status is updated and correct edid
> is available for drm.
> 
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
