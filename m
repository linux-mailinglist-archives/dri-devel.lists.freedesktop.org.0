Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BDB39DC9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 14:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF00610E0CB;
	Thu, 28 Aug 2025 12:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrFl0OVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1D410E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:51:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5QohI016089
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tfd9haVIEplY3fZh8UFTDF44fFE4kBR445IEmKqTe9U=; b=ZrFl0OVkLaHoo7aQ
 7+aD+VZtRnu8N817LDxDuYkmmvpgecjqD3xjzeXK8zxdrHtVhKhBBV3HtAq2C7m6
 BvaDagOQfMowtCAlbn9Vq5j8o24PzP+nAKknsqYmOcAi1jfAqaDqNJTiWctNk4yE
 0DTDyTdCZzYLKHWR3MfS9+k+73aj+WcGWE7t62qPPi5mNr01q6XEBGXiPK5tncW0
 k5mRIP0JtYijbDoUVh5Svjk/Oqw3pyysNmtFnnqwLXRuV6VlrRe3BLKiZ/j1THsc
 CZk58IodJhZ0KzW0rdnc6GQ0VhDI6UJCR0fxoa9kJ8MqRMCaM7Ly23MhAnzDPT+M
 RH0/hA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf2h4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 12:51:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ddd80d02fso11561646d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 05:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756385514; x=1756990314;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tfd9haVIEplY3fZh8UFTDF44fFE4kBR445IEmKqTe9U=;
 b=ZdcQBQIPRcU8/7OkRyhLMeqJn5GlUxl3xeATuAT6wEjx/4tf5VO46cPK3Yozmpmv52
 ejscceyhjFCTa9A2ZmmmV2ILiKh6hT246SomIFmqf7Ovj7LEOe0+blGuRaDsaW/S4vM0
 CSTkWvDtN+BeNUkOxRj/rHgQhlp9YRjrHIiQkLNHeUKJ9aBeIGSovhKsBMLqUDcfZi53
 UT1HiZBetj3LF3dIff3hlc+VOC55oEPc/IPrW12JpUgp5BOfK+87qj9vvwK0eSrWK0Kz
 8ioH+nU1zT8ce/sxM6qv643LAfU6yNn//1JA4cdjtpVfjLgXGKnszfeecfULdUaPReSi
 6JcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtzGwbdADD3PA9MWU/gSCIK6yKN6b7dncDEZCmKF1d7sleBU2YnGkrLd6oi6xxjJW89fU7GlCmu2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa9MyZFuWunMwYMhhJU0IUPfg1tU7jvo9tcF6kcxRxvom7oB3F
 r9CoJiQhhRo52pnndf2G6tB8dK5f9o4/20vUkko6mSza5WfoqrH98QQU2RL2N2l2fMu0gJE3Z6L
 ik76WQsovTWFgG8PcNMAaqLW1iLz1cHqxZLweDU8WRnf7Qw6mubnYSoJ/DtPJ4CryLBDBsuA=
X-Gm-Gg: ASbGnctdu+Pk47sebv0VyfK5AjaAL5kfkOX2Da2XCXvngK574yvnx+/+jVeJUf6s+TB
 zZc1rjvuTnyIlsaojYW7G6xZIdlD8d1ITKjUIu+QhSybITnBGK562H8BtzmOf7o4jHpistJntAZ
 +fEzEFw8KW1KbLlF0zvzFupD0Mz8yB8SWvE4/WZk/F6gfE6UGEG2NAMBkPonxNQ8uyZvSZ+Te97
 gwAlDwurFTxA5sNYokmTWOpGPQ2kaN01SRbTmjslngTtqEMy9qN2iFZbkS+EJVKBYX2hZ3OI81R
 cdEM19cTdd8YfysAccbzPz90dyAwL0BvRzdJVLAigbjIpwMpAyylUBdaydyjKMDwLY7WZ9xm8nZ
 JB+aZMFaiAVwioSqsglpoFfiwHrA7ogQ20G1P3VyNo4ONPQTd+C/s
X-Received: by 2002:a05:6214:4e84:b0:70d:cb0a:51a4 with SMTP id
 6a1803df08f44-70dcb0a5584mr139047686d6.67.1756385513600; 
 Thu, 28 Aug 2025 05:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlfk41J1Q4Xm0qZ0A0YrWOLqz/9Wocie0W7tu8ccOHfhHHejewxQGjgn8RGDCYKRuo/fz6Q==
X-Received: by 2002:a05:6214:4e84:b0:70d:cb0a:51a4 with SMTP id
 6a1803df08f44-70dcb0a5584mr139047336d6.67.1756385512930; 
 Thu, 28 Aug 2025 05:51:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35bffafcsm3316070e87.17.2025.08.28.05.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 05:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort
 Controller
Message-Id: <175638551173.1202.7687103827759188815.b4-ty@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 15:51:51 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lRuL3uNuSjsRhsfpy9qiK0YYZPuX-KSH
X-Proofpoint-ORIG-GUID: lRuL3uNuSjsRhsfpy9qiK0YYZPuX-KSH
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b050ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=td1j7nzBk3E7ehaXNNAA:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX2ijmTSOOzEKd
 Ja10nFAQDyYPKpkg8R11T5VyOBnFenf+lSAFHHI6BlH/2RfzZZ92aLA2hUP/u7y3KlM8J9U04Yx
 8aiGMxYZ9Byw33SjDgwleYR1E8ldHFbHPydddcHSf/esg48l2LmiHgWrYz41UA3YgWuD0EuKfBc
 51Iyc/Wbzl6fQR+dNjZbXvJa3NkNC8AtHokXDcXSt0C0Wh96f5cg14dEV0yMlo767KCyH15tRSa
 9dmpxkfXTBxfsg6z8FsTCexVQotHNrlT1WQ4HmUbjRMYCs2PQ5kx9EKlHuf+1eWeyOCK6dZUhd/
 oBIOjyhKQC99lHEtTrK/pltxbmENzS6LajswQm6wf8pl1VVVopbBnGfNpZ6pu+cmnMNnTzRXzxP
 FAt15bVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
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

On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] dt-bindings: display: rockchip: Add schema for RK3588 DPTX Controller
        commit: 2b036b13c8c2cadf7a27036f911ec99742504fce
[02/10] drm/bridge: synopsys: Add DW DPTX Controller support library
        commit: 86eecc3a9c2e06462f6a273fcd24150b6da787de
[03/10] drm/rockchip: Add RK3588 DPTX output support
        commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174
[04/10] MAINTAINERS: Add entry for DW DPTX Controller bridge
        commit: 0b6da6d3a8d5391ff9da2358ac5afd8b7badd943

Best regards,
-- 
With best wishes
Dmitry


