Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B9AA7E4C
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 05:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BD710E2F1;
	Sat,  3 May 2025 03:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCr5IQO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440110E2F1
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 03:42:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433RhNP015133
 for <dri-devel@lists.freedesktop.org>; Sat, 3 May 2025 03:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ud1Zry+uy6eSvXZsdMraDHLmklsGChP2Rw9rUoNSRps=; b=jCr5IQO2EEmLmuKy
 36z9ZruB1n/EOHql9qJIam/8azBLCVKNz+jgim/Yp6wMRcfmrD+IfKx/wYUFFc/q
 m7Uz+boOx19VSOuVRSpY6wwc4qULDAItwGxQecTxX8xKVoG8eeg0XvCDK0vqWkdX
 ++ZUmeuB3ymK3TZwS5kM8BlKgSZP32/NqymFBALl2OlpHTf/UnZ8r3JvrafmCnpq
 3naaydfargx2KORVt2vA0ft1Y+ovUE7vvSbbWjbDm29VUs4p4tOpwLKdV7ZiBJ5U
 wqMzxHSqTExDys9JmJJ9DM25QRrscSJyGEz/8bw7xnljt4haHk3nnkobo1XCMXav
 +LTeMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0533-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 03:42:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47693206f16so54291041cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 20:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746243752; x=1746848552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ud1Zry+uy6eSvXZsdMraDHLmklsGChP2Rw9rUoNSRps=;
 b=EZkjEdp8OEJ/ElAMBhzst1Q2lXWNi0hWaMHX0kb0huzG0bDSTlVfqF9owgbyXtGaqQ
 F96M19hHWbURhGTAwttL4UdwZDB963WNiNJ9AGoqJyglV+peWDCgq5whD1FB5BQ3/LkW
 dx8ujwFx14LVi3tZ/ZhSpiL6pZSKFc5XUetN4/WiNLMoybM03zGmVj7+LhkMRGtuSlMx
 Qs1NGWo+TH116LRkg145A4g6Ac6e578lwvQwTjEP41zbeMpW62mDMmonJuW+ebviTb8C
 AO3zlkDW/yGMR99eClA/WWJ1aCP6TIwR5EpIVB4kylwF4Abx8eb8ruuoHOnErEsE4rPf
 DD4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS3knbafE1D9EoP69sRM1ivN6l/dtPPYDezi2dAUJiOC0r+aQrMBNszhyHmB2r/UcBagaw0o2KVVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWD/AkIxHDSw84yQ7erhkmqrX1sMADEr81TrbYDZi2wWU+RRYq
 h0b0iOCGnNBw/o9hlWI9km6HDHbycnZ/9y+QIn9sKOl6D/Ll+8KpuqaX6urQ6kAOFrUwcTSZNRo
 9hkAbKDXHuLXzE1HEpRoQeYVbyE2EOoOIzV92C2Iq+f1mQDV7m7iqlkDHg3FT0VK1g1g=
X-Gm-Gg: ASbGncvoO2PXPkENrUXrrx/MqQ+oC2hbp7S29OkT5LrnbD3FEGcz7my1wZYlbqfmFcD
 6DUjx/tcR53cwcs5KSrHaEvIJcS3k5bIS6ILJbdkYiPJHKOBhL8peTIPy0Suoc5NHs1zioWBjS+
 o0xPf7DFMcQfeKMB/9wIdVWhWCuziHFQsiylRHZDOcaeq2p2BIgPPmRfhFvBAqNAderO5l26s6a
 jQ7b295uaFZvd2o3MxB2dGsKSqvzcZpz065W0hz8VjDfVbU3HIyjq4Q9ZxGneyVA88eZ9FcgH3W
 KyXP5RFps06bxYpGO6+ikPAHg/cvGsNLlHc0pBzwKQvAdfyjJqwtIfTxAID/IUolzJ6Tprx56L4
 eHoSZ6DORQMuNja3SEMrwSdcB
X-Received: by 2002:a05:622a:307:b0:476:903a:b7f0 with SMTP id
 d75a77b69052e-48d5dd6c5ccmr21879291cf.49.1746243752245; 
 Fri, 02 May 2025 20:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyvt+1+zYIndHZpLi8F8zPvraugqfDj70RqV4gmfcPam0xpV0vxN2pw6vmnVAsOhUglqWHKw==
X-Received: by 2002:a05:622a:307:b0:476:903a:b7f0 with SMTP id
 d75a77b69052e-48d5dd6c5ccmr21879191cf.49.1746243751942; 
 Fri, 02 May 2025 20:42:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f6613sm611338e87.217.2025.05.02.20.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 20:42:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org, Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Date: Sat,  3 May 2025 06:42:28 +0300
Message-Id: <174624368046.1030946.11578549216447987395.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
References: <20250430082850.244199-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681590a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uWS4MBAKGPj7jhiRaqwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _clD_4klwL5Yj5xoqUgd96F1WFUC_3c5
X-Proofpoint-GUID: _clD_4klwL5Yj5xoqUgd96F1WFUC_3c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNyBTYWx0ZWRfXzXQUX2lqxZOw
 pOxiRCfddhIUWaCDtSQGNuvaa047usllX76q7gD6+3PJMt+i+tuSbzG73X++7g7lwGklQ6rdFfa
 YuSblQi57Z579xhMVT9BYvLC/ssduOK3ihD1cv7RgD+/zNObP9uagBiJ3XrInIQIRAhJOXaMhOU
 j1eFK4mTZnLVpIAryhs47fNgcH46uyASKJIr01bVmYZyeUIZw2+u4OcuZVa2hPpjf8s9p1PF+7K
 TsueBX+N6bTriB/U3sWgH5LTYjNT7VbgNOQB5J/lQ7S4zetBuccLmtcw4tmKykQ9NM4MX30zOE7
 NvmVwtKBfzEyonas6GbpundLYRthBE8TcnNl60pyC9PVurx1ZUfafIdTFWRRD6T1hqjizyhAVYP
 Y/cu+zibNt2jyhHw11j49lh6BkZz7XqzdwzljP8MNrVYak+uGPAFyNN4UNyOWydf0Nh8kRPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=760 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030027
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


On Wed, 30 Apr 2025 10:28:48 +0200, Heiko Stuebner wrote:
> Working on an upcoming board dts, I noticed a dtc check warning
> about the port node and at the same time the kernel-test-robot
> noticed the same warning with a overlay I added recently.
> 
> So allow the port node in the binding of two leadtek displays
> to fix that.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: ltk050h3146w: add port property
      commit: bf0636f4348e098e2338eebbe42d7780c58a1195
[2/2] dt-bindings: display: ltk500hd1829: add port property
      commit: e782ac936941cff4c5580bb5cc2ec0e91468068c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
