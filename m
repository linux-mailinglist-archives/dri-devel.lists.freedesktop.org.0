Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B051BA75B12
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 18:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04B310E04D;
	Sun, 30 Mar 2025 16:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ce84ToK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4D410E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:55:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDsWka014445
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GUrBfIYYw5qsuVg+BKVVhTizYQpWebXJ5V8Ck22XQcY=; b=Ce84ToK03dnR+Iot
 pyECRxPQQx9zLrdco4FGIsRUeLjigkmumSRZk4yiEHETbH8bj5vjQkJOAyHQKFhR
 yg9oRy5CdwgXai/8xnIA+YEeLwohQzwbVOyXAChFVWzGeiD8XLs95fxu/QEcXhqt
 YOi4tnqN2DbSR7X/Pq0XTOiABrHn3zG1yRrqRlFnrRNlSoSvSht3o6/xeaFgerm6
 gT7V5MrMVxKY1ODLGepIHo4xibrOXZRen37pzM09t1bZlrN1mh+Jb/CW+/sgunrc
 qiOfkWfAs8NFVrKtMg1ysi/UkhEHMMisBA4mBQ/m31khsMmE56d3WX3+uvsB52aP
 V96z8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjq3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:55:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so691063085a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 09:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743353717; x=1743958517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUrBfIYYw5qsuVg+BKVVhTizYQpWebXJ5V8Ck22XQcY=;
 b=AMIxbFuUEMXa0VFGHCB8FdduRt9LsWnD9m8ia+inemsghp/2oEu5MsCY93s29uRTgE
 RueD6oRMRFrX0B0lFXvPffoMCrft7F295qWmq7MvmGNuXsBrN1+RiihsIoAaPdSozvYT
 bqM7Qk1fzZg8oZ5lWsBl2zk98uySzOz0xcQfzB/lQOjWj83a14UDFQzpMiqVAptDwHMn
 CTLwfDxnN60giBQHddvxkRt0SZEIm2hOpX4luxiMhiqEE+OXwn1kab+Ewh+XRhKYD0sh
 XYHYwMpJgzwPe2Uhj4/xCUXnn5kepXxjIuRcnBEtJ5ySIVwDy95RbKN3wVeGUzBBAKZy
 6U0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4dlIEwVekWX2XYtxLTZ46QpuVo/P0Lw+vOZl0RcJwa8crqbqik6vTAgx1HCpOrMwn0EXoVRiyqbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXj4x8p+6ZdUzw6YqDvC9Z6iVmsqQKPnyOLolY31SIAlUhlPQL
 1Wa0otbFv5cY5QGVF1YNlsk2DRAV0TF0WBn992NJtmg3BkRxaHpfzZ/8lbWmZZ2TANnADr25TKj
 v6J1pZEABDTddX1hSpChhvx6MGLJCgeZ8OaH2ZqWBNPOkgTpfbssIoJTh4GP22nq9xN8=
X-Gm-Gg: ASbGncukSCWruuQHIfRxb+AWzAzDLQw85IM5iHy8VtjI3sz0G+2ozHb8LCbTOXldGUv
 adE42X0hP4/LjVErb4r0wX/QSouw/d+tAsYM6vBAGn3kKDcl6Q31utkisX3EWyISh/LWxK6FJOT
 9WJH1PW3KTuH7BYc0+l/VqDCswdrSY4/ARqqH82/9LkXe/5ZeyWV+n0xnzy5FDM2qmXZH9VyCFU
 Bd+TWOmDBCWgL5aIrotpNMIYVd1GoW49p7R8JfPj/KMPYoiBR5QaKooqqL62oZesyUVrwRJBwiI
 TZyHaSnRLtkFxPo7Hq7VxYHV0enkg10detgPSwprwkZvmStGmH3TP5KJ6Lef4UIbgLA=
X-Received: by 2002:a05:620a:1a83:b0:7c5:61fc:d325 with SMTP id
 af79cd13be357-7c69072a768mr984589485a.31.1743353717394; 
 Sun, 30 Mar 2025 09:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH364mIFZJW3hoz85FbxuesUCOvVrbLJe9Tx2HRSGKqXtJp8FuUZyrC4KRjGSWtAKEsT6D0ng==
X-Received: by 2002:a05:620a:1a83:b0:7c5:61fc:d325 with SMTP id
 af79cd13be357-7c69072a768mr984586385a.31.1743353717015; 
 Sun, 30 Mar 2025 09:55:17 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b09592ea6sm926902e87.170.2025.03.30.09.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 09:55:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Dominik Haller <d.haller@phytec.de>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v11 00/14] drm/bridge: cdns-dsi: Fix the
 color-shift issue
Date: Sun, 30 Mar 2025 19:55:11 +0300
Message-ID: <174335361171.2556605.12634785416741695829.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9bFJV7JnNH4sc3dnj2bqgCjuJe-6SCul
X-Proofpoint-ORIG-GUID: 9bFJV7JnNH4sc3dnj2bqgCjuJe-6SCul
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e97787 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=d6wwUhUekskWgI7q1RoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300118
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

On Sat, 29 Mar 2025 17:09:11 +0530, Aradhya Bhatia wrote:
> This series provides some crucial fixes and improvements for the Cadence's DSI
> TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs,
> as well as in Sitara AM62P and AM62L SoCs.
> 
> Along with that, this series aims to fix the color-shift issue that has been
> going on with the DSI controller. This controller requires to be enabled before
> the previous entity enables its stream[0]. It's a strict requirement which, if
> not followed, causes the colors to "shift" on the display. The fix happens in
> 2 steps.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/14] drm/bridge: cdns-dsi: Fix connecting to next bridge
        commit: 688eb4d465484bc2a3471a6a6f06f833b58c7867
[02/14] drm/bridge: cdns-dsi: Fix phy de-init and flag it so
        commit: fd2611c13f69cbbc6b81d9fc7502abf4f7031d21
[03/14] drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
        commit: 132bdcec399be6ae947582249a134b38cf56731c
[04/14] drm/bridge: cdns-dsi: Check return value when getting default PHY config
        commit: c6a7ef0d4856b9629df390e9935d7fd67fe39f81
[05/14] drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
        commit: 47c03e6660e96cbba0239125b1d4a9db3c724b1d
[06/14] drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
        commit: 7ad8b3441b8ebfc56b439a28328f78c755bbef29
[07/14] drm/mipi-dsi: Add helper to find input format
        commit: e83967c355d6194c906e7bb3f1c72cb002e14c9d
[08/14] drm/bridge: cdns-dsi: Add input format negotiation
        commit: bc36ee983fb34962a407c06196cc7874bf408146
[09/14] drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
        commit: a53d987756eab40678f241d7cd0eb7e1ca42bba7

I have applied only cdns-dsi specific patches. I think that generic framework
changes should get a review from somebody closer to a core, with better view of
possible consequences.

Best regards,
-- 
With best wishes
Dmitry

