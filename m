Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E14AC6AF4
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6D10E615;
	Wed, 28 May 2025 13:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8MzSD6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9810E62D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:49:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9lCke013860
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=; b=i8MzSD6nVRzQJFym
 YeapS9mErWPakUo/a349MpEC/gkKDj+SMzl+ehS5QHAd60G5R5x7SL0GWnFzXfr8
 AINR7hl68lundk6eiXStqVMcvLBSiXEivBvFygOYQalAEIDuWXyvwUbMzJxq4aZe
 hYokdVFaQaV1DeqjeqpZK5FZhEJKORO8W8kCm1OlgJnGaUGy+SU3IW2lgk9xOBPN
 Nk3f5t/wkOKj/1S7PyIkoOYiayOcvwwt5sVZoRORkQPkisygtbL34rMERCXcJGQb
 RnSs/eVUS/BZT+Bqsi0KGuZLTgKlfWZnsDYxm5wYboenKTE5tZSgmInoVzFQMcPw
 vtXP7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cw1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:49:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6faacebc952so56955546d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 06:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748440167; x=1749044967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=;
 b=CcmzvqChi4aj/elmXwaGjUhVBUJk3oGkVR/Lx5D+ESREjTukbO79TgnjL5XheveDs0
 LK1IU1Z1eWr7R0A7z4OMj6Ex8ZkRvVF11QPy4SUwo/NMjumt+rGzDmxGO38INbeM0aVj
 OyeewDlw1UJhmjoTfPNoBZBoy/bYc6S+jHls7z3App/4fcqYJok5ktclzbSnEPPBP2dR
 qc15yfiZ2rxr5nMMWLYN0tsVItFlEAxjC3PP2zDnzYeyzx9H7MbUPEhr1LjO85i2FonP
 h+p3hlMwpf2d3+OaGckPP4SCHRKaJOcQXZjdFSHMdK8ZIbCvOQOSi/gMz2BXoqZuRgH2
 DASQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Ii4LUsRs8Ch/BFpI6L6Fi+iIwjO5ZHqCnSg9e7Kk0HWitVtIA3C6Qzc2nwZ4sftcJiA/6jQrE78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlDu5SJbC7zTgxsgbUp0Fhe38OfsRo9FLEAOdtEwBQ/0kI1gf9
 V9WJZTHJR+aO37QsucIqSW1xNKcH/zJf33YTckLPdTxLLd3Kd9oh1P2rsGaWjJt7J68CMZXSFGQ
 X19y2MUpEpEmSAVz7f9psfmIZLouqFLYtsSL17pqoya5/PY2XkWOfjkDqgn6K/MMeaKVLe6U=
X-Gm-Gg: ASbGnctaAfL0QOq/Kzewc5paCt2Bhqqwq07sFdWw1g0f2TYCoFgsFYqb6sAZSDxKF1O
 9+SgSD0UnYkjRne/DnfPoB0AxaCjlIZ2ngYlUNNjSGMZvAkei6mpeCF04sNDZTue/hu6mvh8u4v
 y5b17LZi2+JWMpcNLJZnFGgMgN7Dh9EcRV43q73ERYUh7sTb/Xvl2vZcxBUMP02sGr7GhmbSSEw
 i1nUJqLjTrWP4FfDy2rMz8sBbNg0jg5E+eUUWE3M98UG6Vx50NcDTUQJmBgrpZS5lIw5Fi0/wGB
 KoY1W9EqBUPp8UL31kGAZknMhYnjLkiAbWkRxfud81/1grZR6uaRCRu6M3YsFiQ2h1sbD7/L3ZN
 CKJQB+nmgEaJ35JJ1zd4A5fsE
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id
 6a1803df08f44-6fa9cff156fmr267535276d6.5.1748440166977; 
 Wed, 28 May 2025 06:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDO6tyMZzFc/D9U+K6bEzH7XCUHyfwSxg+WJm9sWUexygSxn7JoUOf89bLsbQ1ceAIxPl3Rg==
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id
 6a1803df08f44-6fa9cff156fmr267534936d6.5.1748440166606; 
 Wed, 28 May 2025 06:49:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f6a6253sm289576e87.202.2025.05.28.06.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 06:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tomm.merciai@gmail.com, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Improve adv7511_mode_set()
Date: Wed, 28 May 2025 16:49:25 +0300
Message-Id: <174844015640.298125.2461085924621609472.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68371468 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Uzkek4HQei2ilSC5KyYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 5tfybjLqyYLJMT8eYwAJk_zC48uqXX_7
X-Proofpoint-ORIG-GUID: 5tfybjLqyYLJMT8eYwAJk_zC48uqXX_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMSBTYWx0ZWRfXx+l1Q47a1Jln
 4jrOqSF58YZKWovFxpzKTNEGI7a1O3/qRWev39RPqZU76+5vHSd+9KZO2+tqCAtKLoDd2hoxdnQ
 pDWaQE9jH0FOMAKRTawZlwY+Qa9OOPVoAh0ry6xcs/VqaA+jFmxq4tnnOQMY+5EZ3MTbOlzjKrU
 KKCRTgUfOZKTWaaRp0k+D+yaXikQ+3m3G4kMfz920Tzte/e5/V1qyef7J8npD1yH7fTeXlj+r+6
 Un7fK5bIrKpzAlmva8Z7Knj8yxajHFrVbyvQAXiPiwhJNf1ce4WZKpNeybfymgRb/H9g0tG3m17
 TeYFOBEzoAEppE6/n+ZOvODzCCJgIyBeDB3J6NrOFR5xi9t5f6+zJMIkhwehFafKb8SJty0cu20
 VgSPWWnc2DeJmfxZjgyRIlAPXbt1hN/Rzn3HldhPNlYDThtfJotZEnM3KMuB0wGTJbW6eSOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280121
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

On Wed, 28 May 2025 09:04:36 +0200, Tommaso Merciai wrote:
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into adv7511_mode_set()
      commit: 1f5090c4ae71d070aa9dac49b8ef3efe0da0fb36
[2/2] drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
      commit: 6e76b312a681224881c05835ed5a26e012ce80ea

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
