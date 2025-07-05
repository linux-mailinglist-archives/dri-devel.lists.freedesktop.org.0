Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD472AFA146
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 21:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0510E23A;
	Sat,  5 Jul 2025 19:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SI2R4JFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDE610E23A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 19:06:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565IOt3a022670
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 19:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t6XQnLaTPoi8ccl6X7Yo5PDD6ywDE3LoQxRYWhwU+VM=; b=SI2R4JFQ4nLOk4Yg
 mYeuqGcGykYQJzzN4w0I7N2rGlqgDgJtvucnHGcU5X9ZU1gzuZoKzSZoJSdTKJD9
 VMWGh+JWUrOHQzEZkDN0PHTf9dVba2yzPHPz78BjskGmWUs2C56uTrmOfkJ8NI/B
 dFnm9VgTmKEbPgK5e+h5u1Krh+ZdMTzdzfRDZ/9jHAJeKsGdi4/gNlp844tSPhPM
 BiydnYE7/irctPKuOj48bIiQAO1622YmhZG725kuClgy0QS1P9VFVPmJDdeiT9lS
 r5zVFcvkzCRoWAOeHHm0UujzIlBXjY9aGtsZjHjKkSgXoPZUxVGtQYtazHlqc7GD
 rPYo5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqa15e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 19:06:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d099c1779dso280591385a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 12:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751742402; x=1752347202;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6XQnLaTPoi8ccl6X7Yo5PDD6ywDE3LoQxRYWhwU+VM=;
 b=cCelZWsN6Q5+Qky0EiSXwa/3gUSfHU/6+foN9NhKbqUbiukKBeReqiCe/9HexAdf2V
 9Fun7MR6icRmQ7LIXi/zfru7idBGPfflQmQrpM22K/hv261EJ8YJ74nMjIISCeMVPW3K
 K56wAvV1uaRT/eGH27aPJjayF6DecdCTOrh4Tm0T1ffJbrYUD6+VycWbAJzgSAoeZAMW
 EiNNf9BepQEGKm1PLff+edZd/PWYzlre8/AdhymSV9Yf57JstB0BbkC7mju40lwDp49s
 /rLWLlui9rdy9DEpnqzIKLLbTHSONqeVdYhdVHflVhYAr0H+o0MmIDm5nw9iwXLEreA3
 g1jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNbkOtCd2sNmKUmOe0mZS9hjYWJ9JUGzmzN3pLH3q94w3RLtJGMQ/ITKQiQGmxEDAaeGWgzrqxveU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+2yNG0Hrw4S6xexY5scbg7zAjhg5VjfaYac1pTpyfnhdp5rn5
 vZual41UtgJMy0dcj1Z+rOYsACTNZdwcyTh2dhsig4RZ4T9VewX5g7VORZqZsY70qKkXgSM/jI/
 D8ZylEE9+oNH77HArALs2DtBrdhw0WERAvf51andL7kblfkwHDLMtW9u+iQ7uwQDEqlMLWek=
X-Gm-Gg: ASbGncveaM/i56bL+BsjTh4NQlLF2GMPOyQ2/lm2DmU7XnF54ZpAUvlNXP1HyD3iYQc
 Gl/7LVHAEkkIOh0PwgUC23PhwksPwFz2cnK9GeVhFOitVpzr1q0T3PhCykmrbKA8c73+jKneIPH
 Bt6rxDrz7cBDgq10ZaOiUMVWePK9shR00gD+arrvX0jxUtiQzHPYh6FFnV+xml3fPilAgIt28Gr
 Fwu7E8WPBSOzwt0OxW31QbniJrK7q5HewzkE+nLVlhOH4as30dYKOtspCjV7xPxuaDjFzfnaI7W
 ZRWlEx7xzADxHGKV7a9fgu32JxNyriZ/wkMRhjLR2Im6h7AxWl61EkJtpMFfGeLFCvNMgtdfTAy
 xScIEDjBhDYJsAR4giLxWOuAVbexpbBmk8gQ=
X-Received: by 2002:a05:620a:2b8a:b0:7d4:2841:9c with SMTP id
 af79cd13be357-7d5dcc751d9mr1018326985a.8.1751742401932; 
 Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdJetRllyfwwSgin++nTYIyzbzfjO0Tf+iKLl2gWqNvpNrUmzlVcrPSxiurUzcyC3C6ATRBQ==
X-Received: by 2002:a05:620a:2b8a:b0:7d4:2841:9c with SMTP id
 af79cd13be357-7d5dcc751d9mr1018323785a.8.1751742401498; 
 Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384a8fdbsm662261e87.169.2025.07.05.12.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
References: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
Message-Id: <175174240044.1825705.3743497752836229087.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 22:06:40 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686977c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=1kJDpHXNGl3mU_r8nRYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TuUw3KewB-Kj1vBIAa_2x0j3trMsJwFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNiBTYWx0ZWRfX7cgm1U9c3GI0
 lCxEgEEibu3VTvwBZ9OVt73cDklDw2b9om7AQiY1UGKvE18bESQDqvFF0TZ+rL5FYM4hHZmkDOt
 k26qBQAbH0UizBQY2n/H6xbkfoePwT49OcnQCaw2v8i7tYuPARnbdtZZUBfqEeqDfnjtDw177jz
 DUPOjNGUxr6WEI9HyXtEp4vZF1qiHRqMp65zN08Ckbm4wlNQu9SLCIyQ8+pVph2zx76/bQnuJMu
 qEWDNSSNk5kJDUH4SJoHDAW905f8K2gJKUrUfD4PyddNaE8h6LctYcoyG3yKe9Xihb5KKZccWgY
 r5upC7ySCQtDq43o9z0OE5AyqXW9Q9IazbaNiC/8C70dVcIZjlH3gfWxCIpWu3bQSoAhr3BVjHr
 QUnZvASUOC4l72XdsVtNCAB7M9e25FuSkch411coZU36+YbWlqSDo5TdnyxpL+ovvCAo+Kso
X-Proofpoint-GUID: TuUw3KewB-Kj1vBIAa_2x0j3trMsJwFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050126
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

On Fri, 04 Jul 2025 14:52:54 +0300, Cristian Ciocaltea wrote:
> When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
> CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
> expected to fail with -EINVAL.  That is because all required audio (or
> CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.
> 
> Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
> ops only when the aforementioned kernel config options have been
> enabled.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: adv7511: Fix DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
      commit: 40818680d8350dc35b1d1ac31c75038d13461126

Best regards,
-- 
With best wishes
Dmitry


