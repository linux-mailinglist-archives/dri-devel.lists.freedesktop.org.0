Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A484C61379
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 12:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4498510E274;
	Sun, 16 Nov 2025 11:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVJSvkAy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W686wCbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885DF10E274
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:36:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AG2qrse3934616
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=; b=nVJSvkAy9sEqP0gj
 /pe3DkNax22Be5r5Fg5UPpXl0ZJYqcz832k6FuZf2JL+10ERGsZMWn3Mjx4WB38c
 JIKMNAVGJSif3A3wAO+6QnCixzEDb9J5/JM3NeX5tZBaQC8fomOELqby7MoyBXBY
 MrR52sILyEw5pOE4miTlc52B3JenwMzUCnj9wji6VsWZnKkVTifsSqKXobovAKHs
 5ohEuwDW7kDXvMAlhqM3TIYwTS2Z12cGUZ9hU6apRexMv2r2/tmDO9LfLCyznQ/P
 l4dPW9Dd4gl6Z37IwEv8UiHlOpVypvmbtiiHKUkKCyniooCWW7pA5Ucb7+RSX3f9
 m1pjjg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyt18r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:36:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8805c2acd64so115326626d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 03:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763293011; x=1763897811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=;
 b=W686wCbYBPGBTLmVh+ZGrzjQgugTdNYTfVmEO954q2qvqDjoxfIw91/SYBF3RITXa1
 wOw4jgwCH4DfUq1voKysyfWjUXkNKIGGh+0umGQ8PuyWlQ8w1SBOEkx0vVFirhhR1Ojw
 hzn7XOzg9Oz6Oo3D0j6OvZMOM2P2k8ESPNqEq2W7PApFiIuEeHuIWIE6CklxKYuKQvnz
 V6j5jQUa4AkcCYISRUDQAiWsKU0WLioos0865GdzDo/nGSK9ETTADnUz1k6VcaDJNxFl
 F71BCEPuAbSXlwMoljvppeRbO9RwC76ALjh6aJTdsALMkHfqyiiBCD5A3PIfuVg2OieO
 ZGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763293011; x=1763897811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=;
 b=YmAS/XqQUIh7VCLGbwAzzHdVWa22PFwSlous+N2hqYqbP+wwOvP6jC5JsC2k3vewOo
 PkcWBrPrJdkmmyJgph5OOzeHcExK6rDRdFcdPvzuVQIe6SEI67vfgIBkaiL+UeTQKPBo
 dibtPkzOUSd+i0C2PsZeRp+Lqosf05tHghO/YSKMeCSZXI4EHnp69IK418QEU1JsNmOG
 siHFuDeq9Mk+xM5hbbccD7h2crIA/dEjcGXxKEzoaYMcJJcpdAZ4F27wymmE/iAOZvrF
 xRBQvMdJB9vSbh+NpadlemcnuZirYUArILf32pPI/9gaHhXJ7BFjxCdQETlwYN6aRwNE
 dOWA==
X-Gm-Message-State: AOJu0YwK5vJlRaziEC2rTmw/FePoM4tFV8Ol/2x07+Yz/eNTViGkIKPM
 EF9e0iNptB3+npNkVE2KeQd7pDbajahjzI8/bCtqcVgYBXzJ6Cpn1QT6ox2bX10aG80H8XIoE3Y
 T+GaTJOH4+UL0Qx88GGter9qrhIWTWYj1+Y0gV6CoYc7VfuZBKlrN3TwnSzTeQY8ptzljKBQ=
X-Gm-Gg: ASbGncuKdn+89oRvzsoDt1KbEgCoj9T/9vrZhp6k+mj+Gbf9vwet478sBdX50hmNnY9
 lVYqlIrhR04IL7CT3VHWAPxXZzvV0bPqBxKZAUR1yKA+s5vBiQYITAVLlVVkVBfrf7uR5JqCqRD
 eIanGJLsd+id/WcM2w+6elILgzz65OzScj9YHHwKOOeYBuplmjVQsV22azX1IyyTzM9aW0x2vJY
 FhiT2XJb+xLoBvZ7/nmu+bp5rSCoSzaPj2rboHTzZBsu6byxAVGkXkWK0BnBZxHPxzyT9CtB4y+
 YEWv2eSoAaO9ssIfoNoHP8pi4r6dYfcQ9IZZD0OPxS+sJ5sUS0PkPB4Zvi2bPXqjdgAQPMNaBK1
 QJhrjy/MkYGScS1cLycwxjK0xDzK5ZtqiaZhyc687ubtvGn8wr7a1XsjZvhdHEYMKuKs5OhA5OL
 eC9AevgLo3yVvC
X-Received: by 2002:a05:6214:27cc:b0:880:8682:9b46 with SMTP id
 6a1803df08f44-882926d3d4emr119921126d6.45.1763293010852; 
 Sun, 16 Nov 2025 03:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuuYZ2qRqPnytT4Ht0co/lJBzhqi3uZOB7XLqW3GSAiQkpAB7HtaYH7TYIA7VhA1y0LSU7PA==
X-Received: by 2002:a05:6214:27cc:b0:880:8682:9b46 with SMTP id
 6a1803df08f44-882926d3d4emr119920746d6.45.1763293010314; 
 Sun, 16 Nov 2025 03:36:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b3019sm2294925e87.26.2025.11.16.03.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 03:36:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maud Spierings <maud_spierings@hotmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v2 0/6] arm64: dts: qcom: x1e80100-vivobook-s15:
 add more missing features
Date: Sun, 16 Nov 2025 13:36:06 +0200
Message-ID: <176329291083.1920848.17290380320695043230.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5NyBTYWx0ZWRfXwsUqhAsjv5id
 CSXxAY11Xp4fizHczwWslnkYZncRz7mYeSjBIJFt7OmbsoQAGknz71Ar+M5mRkBNSKlAj6jA7uh
 GjAcQZ3qKfHBRZ5Gdwe+kBXG8/S1UKi/kuztzsRLyzpNS/Lj/Gt5HFEedYJo6+bi4UXhCg30eA9
 XYTnsFpEZhgjPvKxN/zisP1FEfN4QGRDwH0zlkNOsq33upWC9c1sxvWkzID+T9VCu2Z5Dcrft2A
 sRxWpzb/qp/yMAaxUjnpJOxrZJWJ6g8XLQPwiQ29XzHRhkJKlFt/KSEyZtUOjh6VRqBJZeOQ5CO
 4KcfJ3nZHWn+Lz5qwG7AS8gs97+bujPNmNN71gUjj+gY4i93DvnFcXcJig1+TzPm5KRNk0WerCM
 qMQgkrmC8XzODcjaK0FySNIhAUUuYg==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=6919b753 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DDbhtB4dO4PzCpTsSXkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 9OfUGs5S4qgb3367MTo9LQ8O6YgoG7U8
X-Proofpoint-GUID: 9OfUGs5S4qgb3367MTo9LQ8O6YgoG7U8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160097
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

On Sun, 16 Nov 2025 11:52:05 +0100, Maud Spierings wrote:
> There are still many missing features on this machine, add the ps8830
> retimers for display over usb-c, the simple bridge/HDMI port and set up
> to use IRIS.
> 
> Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.
> 
> lots of these patches are very strongly based on the work of other
> maintainers of these snapdragon machines, like the HDMI part on that of
> Neil Armstrong, many thanks to those who laid the baseline for me to
> follow.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] dt-bindings: display: bridge: simple: document the Parade PS185HDM DP-to-HDMI bridge
      commit: 07b391b6f99bc1e62f41e4ac249e7c82d46480aa
[2/6] drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge
      commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd

Best regards,
-- 
With best wishes
Dmitry

