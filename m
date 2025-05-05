Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72277AA95BF
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E5910E3FC;
	Mon,  5 May 2025 14:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR96SL6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6F310E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:26:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CXYO5007126
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 14:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=; b=UR96SL6e5gPFzkXA
 odKlmcPqeKK41JVxUf82jk//dsmtkYSa5HknVSNgzHAOjwsMkfXcZLC87mqYYI7b
 fKFwJhpAWdHtpEWLgBXi+6uSOYndtTRgIvYSR/MNzvDmUYhC6EZkhWjchi4GXnul
 azXI2GoGYe8SpUEE3e1T8tuCeZahsR/vzglHnO+TcoJxQpax8BPjaQUkCO07zZsQ
 OQ3cdGKI1orl3EqwA+Mw9+a4nR+ZQhZ0vpspTeWdR5+CGl444OKWsaZQQS7LVpNS
 FRGFUJft8cqpRT2YQrGA1iDA9E2hGvBVjhPxJ3yJ4F+wp9kICXpUQJ1tsKyT3OuX
 0XSOIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkve9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 14:26:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c791987cf6so909050085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 07:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746455185; x=1747059985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=;
 b=UlQLULXTmMPtBd+ZAdPIa2/5tF9LHm6G1XtcNjW1u+rxnqB5uJMEVqFE/QqtqnxYT8
 NOpM6h66HvmwvDSorKv2oD5EsFLmxz7Nk4OEvFb3Sq5NiaoSRVejLP9aQ45O0kPhSIOa
 JWJYH3W5ZtIej7VaL59pg+JHR7l8c11DfF6milQXcL7kKVGGO/yws5UM2ZN/bC+1VHzM
 m5JFu9aGjfES/oSVWE3O9xv37fjngleWtbuMnzskbeD3/A52ElkqTHNapNsnRoF7H6G8
 2QOPZgtrUg5s9/CduuDK6Y7r8/Oczd1+yW0D5iYvPC0BzWlJgwSGUASEw/FMOZs10dNR
 0vtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7cUSLiqXTJRsk+IjjijxOkXbh5azIKrCGJ6GcDcMnFveCqoD8WfGAF+3R7WCUm3qWPLIQibSWXf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9ysk90454uszuk/AjfMxIpqflQHVTK/FgXLJt3FBpP407DM3q
 8j6TwvkFNAi57YMkT6u0e00W7h1tE/cr3NvbHtNv6XqxeaV73vME84L3W8qrVjagTnGGHYryQlt
 +bzDt8VaUqJNh2MbOGeRkKoIXN7XxU415HHwS36AtACk5+P1gFl280/2n7AtcovMKUHBRbQFe8t
 Vc5g==
X-Gm-Gg: ASbGncvsh0YWbP+k/xq+3lWSIL0t0NI6u48Qt71JgNsfeHw5hfQTWHKdiY4Pv1x+Z0h
 7f62Q5kU/F76REX/C8aPNIZzSFC/lg8sk9TQEJgBzyW4dZ4UliGPSgmQPnAa+2fmnsAy+RGEJWv
 veVlGMA7Im+7mfUOhrIKcQAeYC/UgwBwUgC0nXQUS4z0D2foVWGIXHU+psWCfeT0TpLih1laV8t
 w/Onvvo5N8f8Gin6S15HOBGABtCHra0sQ9dNtlC3w49S9tzQQ9tmOy9b1ayxi5w075v0yLhzscy
 WLtqTNWKzDMsAsVaq8MU2P9qrIYghDQmKZeVMA0run0ffkukTMLI2IgORs+P1NcvwhPyRowKYyU
 A1mFhBX2EWj7unGC/u7J1zj/x
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1068081985a.43.1746455185086; 
 Mon, 05 May 2025 07:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH96RuYp8rf3yGAy4C3TKAyGKugvGUg3+4xADJwkHYt/kyUMmED6s/qSvsMF10QY2xjxR0J+g==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1068079385a.43.1746455184728; 
 Mon, 05 May 2025 07:26:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f17fbsm1726765e87.170.2025.05.05.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 07:26:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: (subset) [PATCH v6 00/11] Add DSI display support for SA8775P
 target
Date: Mon,  5 May 2025 17:26:23 +0300
Message-Id: <174645517266.1455227.14417676448478997955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzOCBTYWx0ZWRfXw2UnYmD4Mvwx
 /kK8D88LqeqUkUalkXJU/NbGsZt/bDceFVhlltfJ2i1tgi1nYx4QlKqlIWmtP5/BYWgmch3G+OT
 MO9+D9qaSzU0QFLiRoQuyBJttmnJUwQcqWGgBmKDPcETm9Wh1W7K6kgLWkHdUq+hIWThzk2cLFc
 2/cCdMfNq1uSac5dRRIOtJUnBhwXNTtet3YeC0ubeCom9JTehgYjsejgU5xuxZmqI7MMsoXgSDz
 k+jkWnGMYN4lKXze5gBSpmDrbJOdUraZDhMclm9OSrkSN54XeD9mCjRR4I53eu97TsbnvnXSPgS
 +OmC5rDExb3uP4zPinXV2YzhO9ko7GIUATKTf4srjH9S6wrx31Mnjiqa8SdIROsNL1zukqlkujk
 e3cd5G1zUtXiG91E4BJUXjBbi34KpQM4wCLJWw8D/NR/zzVUaxZ7SJmd8Y5NiOjMdaoMp3xO
X-Proofpoint-GUID: QKAgiXKQ9AtB1mhef1D2PMe2iZVjCBjj
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6818ca93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-3-qUcdfqlWSZcId2SUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QKAgiXKQ9AtB1mhef1D2PMe2iZVjCBjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050138
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


On Mon, 05 May 2025 15:12:39 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[08/11] drm/bridge: anx7625: enable HPD interrupts
        commit: ca8a78cdceb48ad3b753f836068611265840ef22
[09/11] drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
        commit: 71867e8d88fc7f94c2e47b3cfd676710c120cbe3
[10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
        commit: 366ca0bcc953a4a8a9c9ce2133e6843730210049
[11/11] drm/bridge: anx7625: change the gpiod_set_value API
        commit: 50935044e58e563cdcfd556d62f27bc8744dd64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
