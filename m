Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39AABE760
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF1A10E0C3;
	Tue, 20 May 2025 22:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1WvMlEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8773510E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 22:39:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0n9000728
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 22:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 INGdFU5uhKSwcTxbYag2RBqvK2YNeFulWsxZPVI5EJ0=; b=O1WvMlEJz1DuPYbu
 woYHxwqX3sIpmqqkoqhAgL0crckdvaZQqlwyTkJZqDa9rVNv7q6YtW2szt10CVza
 0tFjixGc8pK0jMWN3dNuJVYplWYAvte1edVHUVGrBH66LsbOTri9v4f3HY1azjVM
 korwOVXLhdjyIuZDjrQdkJbj6bp6H06hByGisS5/99zsHrRE+utGESv5dU8oL6Sr
 +eLw9ErtUfPNgi61piNLo7RaNQOHsXFEj1X0mUtsHlVe/zmwaVN/PaFO4LgreabN
 ceIbNIZ+CCGMltrgYJvmc2P2S4IRnU0/y8fDqOnFIFPeBsbUAzVB0aOtILNex7sX
 FqGuDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rs6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 22:39:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f53913e2b6so90197786d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 15:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780795; x=1748385595;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INGdFU5uhKSwcTxbYag2RBqvK2YNeFulWsxZPVI5EJ0=;
 b=aXpz+bDMXh6krad50NJMFAWB+a8sbAaJytITVlOzgxbMHgk+uBMMvy4823mXv6j14D
 7F7haRbcyNYvGJ57FjMfIsQZsuGjyA2qq4l4F6/2+GAgT9mBHyUUZvtTvTIpiHwaDjrI
 wopiPqRzGCtBZx2LVyhzP07gRUPdiW9C7v/o6NV8VBnVv8KaPe30R3E1FZz3lEgADclC
 LOCKhisxg/QzE1NB+9MGdK3blLod6ohJmnVuwgvVwJlUQeCD8ucuPjTJHgACLJibmghE
 m95J8SEV/AfjVtvTjaTrZannoCIEBtukWDj5u5AruTtjMxA2bpr3Bz1lJcRYb0RGXTEw
 Risg==
X-Gm-Message-State: AOJu0YzbygPYxnzB3wLkiqvzs5TzZadj444IY5wiRK5M7Pug4QyiZo8k
 FseCT1mzY6ffkDxODGs0nSr0ninJSkuwafV0PKdwi8KTHliajApotPDX77Wa68LHvlftRmmOBlh
 2LqUNdZY/jqw3+WbJ1xibENf7amMtW96i3W8OQiVg9WgfVW+eYfuDBKbAhhN5ubrWqjTSDuk=
X-Gm-Gg: ASbGncu2riuCOHU5nRRp6xte6oGqRW4cD6jMfxQzXARK8oYpnjw9vITVYGk9ssIwssE
 nbMq2MyI8pgU4p7ZBABipG17QeQgS3/Cj7cZiPtVY1de+ug2VzCTAsrYY/uQBFbQjKJYaZjOwmE
 dOt4Drk3Q6033766RcxTzS8Tn47HwcyrG/dU4vCSJgxFyhkGaG9Bvjk3Lymq6rkr00BOzpo/VNw
 Q+JSMzqwSZuGnb6zkJFIjZS59RD1MvQzGaO0mBLK6tLLCeYKf/T1ZvftPRGCCe/OFPGQ8eCEeA6
 ZhTkAD/S2ZH+SZCzqr5BGvtIqc9+eMsrdeCMTT8rlxTJ3+lYdSaY7GXg4IDGnN2VEZJ8l+HV66Q
 FgEbPFRn6mKCtVAzBX6LQ/Chl
X-Received: by 2002:ad4:5aa3:0:b0:6f5:ea0:3c1e with SMTP id
 6a1803df08f44-6f8b08813a0mr297701026d6.23.1747780794861; 
 Tue, 20 May 2025 15:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD0xAlJ3wH/oaYSOPdYI13RJeyfCfPRN9Ue6gywW+z9FJavZ09CQuxwlq9iCgVyt/X5U+Qgg==
X-Received: by 2002:ad4:5aa3:0:b0:6f5:ea0:3c1e with SMTP id
 6a1803df08f44-6f8b08813a0mr297700576d6.23.1747780794401; 
 Tue, 20 May 2025 15:39:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55208f7b362sm9497e87.236.2025.05.20.15.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 15:39:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC
 helpers
Message-Id: <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
Date: Wed, 21 May 2025 01:39:53 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lXvpMzQ41VoQzHr3DGOGqEJ2t2vY5pjk
X-Proofpoint-ORIG-GUID: lXvpMzQ41VoQzHr3DGOGqEJ2t2vY5pjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE4MyBTYWx0ZWRfX/geoTZLxv2ck
 OrP9vAJLuWkL/XmavSPOn1zZ7uA+kZxPtZ6Mh1cR5A3WgtBuofjMvUQuZM0YZbZ9JxG+2GAeNjb
 9UudZT+tpmbGTVsplMSe6MME/mo2sN417GdSi7qhE/HNjTdNAnV4i4q3xognrJl5ey1tIlT3Rgs
 P4k3e2bRx9y5VZ8VUfrQS1d+ZGE/KbE4HF+lXC4+ng0YYylNGUUCgtP9RK71+uKmApp6Ngo9avA
 y6bP4GNcMgmJdAzJFytlYXIIGjEdOgBOA8nWxUJGCeewSSSKDjR7mlRWvzkLpdx6sqckzv3zcOC
 Owvr5RTw2xL/6ULWPol66B+1bHwAGn33qgLPPs6jOeMz27ikB+1+h+zaEcstGr/z0rtA5XRemTq
 WnUmH6kSzonR2z0UZOgWjF/mfX+cuc/kpcf6j4KKKIa3yC6bM11PohD8NXCUbu4Dn6X1z/Vl
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682d04bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=DPgAmGmmPoEzzsVRo1kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200183
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


On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> Currently it is next to impossible to implement CEC handling for the
> setup using drm_bridges and drm_bridge_connector: bridges don't have a
> hold of the connector at the proper time to be able to route CEC events.
> 
> At the same time it not very easy and obvious to get the CEC physical
> address handling correctly. Drivers handle it at various places, ending
> up with the slight differences in behaviour.
> 
> [...]

Applied, thanks!

[01/10] drm/bridge: move private data to the end of the struct
        commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
[02/10] drm/bridge: allow limiting I2S formats
        commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
[03/10] drm/connector: add CEC-related fields
        commit: e72cd597c35012146bfe77b736a30fee3e77e61e
[04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
        commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
[05/10] drm/display: add CEC helpers code
        commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
[06/10] drm/display: hdmi-state-helper: handle CEC physical address
        commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
[08/10] drm/display: bridge-connector: hook in CEC notifier support
        commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
[09/10] drm/display: bridge-connector: handle CEC adapters
        commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
[10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
        commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

