Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC0D1076B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B2C10E0B0;
	Mon, 12 Jan 2026 03:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVgeNOUY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsRim2Ol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F1E10E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BNAhEs4176567
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=FiU9XwWxRLhdkdf0yIUxMW
 bT3ae0qEV7s4TgZM+KArU=; b=iVgeNOUYCb3Lfh7hXkr8cvaHzNcIPoLmF5LkP7
 Kc8DRv+3gGVqQl4sN9Hu7teXjIgcnOOiIWcnr6FLzv4I/4C+NCMfvES5AAvcEySk
 DNExbajXqqGOj/NEpWkKM9nKJske9M/i4XL11pMqJY4HS2ih5OQYBa2Mg633yuhm
 EkxlvAVk4f8IcBEqvB8dsNLXu2yuskPzhzAgi0aBnjMJ62w7mpsue5rIvKLmeBvx
 LTNkYEFViWfxdUoT2C39nWeHKaHWMbEl8SDQJaqxZdWvnI7jzoGPjWFBUPcbZ2hY
 K9/tOUN5tNxeih0TjCqBJi6BE+RCGAJrsSL+3wMR+jTWC0VQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3d7w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:23:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso1368363485a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768188216; x=1768793016;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FiU9XwWxRLhdkdf0yIUxMWbT3ae0qEV7s4TgZM+KArU=;
 b=AsRim2OlY57bVdMpeVU1jZW3vv6qYQhfYErx+LrFmjxz8sOE7jteo1M40bI2PjS139
 FNkvx+gorMOGkHb66BbUmpZjFBlHutGKUNh+i52NWz2Z1s4YmyWVT+1nFM3LqKyKHQzF
 LWREBi/YR+PRI4abrU22xP/iAb0xOn0X96MCMrIlY771+qtvV3OVmGlJ4Mus0BHTOe7t
 e3sdH9hiZqX5IE2IoWuYY8qi+avoA1C1piimgLXmEKauVFIblGnoJvmKEUHh2iYfd7dA
 78vvBaxGw2yvbqbDM6G3q7fhdGoycVKIbx2mcoFmK6hKsCdyLFJTdzIMoQBp/Wmp3EAJ
 Baag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768188216; x=1768793016;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiU9XwWxRLhdkdf0yIUxMWbT3ae0qEV7s4TgZM+KArU=;
 b=gZUORyY+nieTnUMzbM+GxI3nrw/gn0MGxbZt2e56fMbQUw0c9OWS5rOetWpljolAz4
 Uv5Mz+vh0gBycnbtwIft0T7+PWP8EseIlnN/eneRIY+Nodhpr+qnt0rsxiCKdJfvtU5L
 eYPYLYsXxa1+8891NRVIMdn3YPuRpDY/gLh8yFA6uaOON7QHfShp90d08vBwSyNgUYj4
 NcTCuEk9Q1Ye4eo0zC/pDynzuiovKdXmfMe+Gned6btLz4LkEA/ABJ4KlewuTw9Cd1JI
 mAORbwGDcylgHcclsjmVhW+nJay6MXvpIVQPBAffQ5si4sQf4Cj9Y2CQjy5SOuIjhY/H
 AkzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEmK8gDDetVlPYbEqBKS6wh+V2im0MnJZzwVySHL01d/uP5Klhl8OjYXVBa6P051OHkq+kDdb4xbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnodXROYi3IOPROPQPBCGJH0Fn7lWrcYIo+Z7FD8yTNQk9CZQF
 3xO9C2nZoc0Z6Bxm+LAF47PvKlV3Ng4r95OG5pgOr+zhSQR1c3B/sX13BxEFKOmhyPbbpuLQRYv
 ilYlaVYbhMY7ytd55/v2S+A/lxgDg34IgQwMNYNhfU4C297sSmiWtL3q5gfnwkEJdGA6IdX0=
X-Gm-Gg: AY/fxX7T5xT+oCA871QP6cB6m2G9Zn4a6ugG8KCNzXOP7uM7vtSBxxmLJNvpzuoPY0w
 okcKmWxTbEDi5Wmu7byzkCq8RPSWG0EeZrndf2VABbEPwlZMToYlM7UkOvnqnTj4e2+kHMlot/x
 VSXlWQeqeDk3vMog8MrJd7E9ul7vi9wp1AM731L4T7X+Y3nFM6C7yVo1bb4fFZMgI2N3vkOUFb3
 9lNxlu/M0cVpB1Jun0QzDghTEs2aMGy2FXmh2GSj+UxWz4Hbo0mURGD1PrOb7il2vQQvBLIhSJQ
 oxGJ7r7kY3BpY1CYnRCILbmnGviCtP/CP3oAXn5xoTPnppNmD24xf8voHh8dhj5zvTGaqzxKP16
 tLBjIJuD6brS0yGXFOAExdEshovp54gYUnfL1tZH2OW6Pn/2xctInyB3UqxzqIPuowTxLSWslvL
 3KWBxV7TW0StpzQW5od66RI8w=
X-Received: by 2002:a05:620a:280b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8c37f4c2b9cmr2919244085a.5.1768188216049; 
 Sun, 11 Jan 2026 19:23:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0lAFkmNxCyY5pUMAw7EePAR7rMwAsrFyo9fUkPtaIhfiEmuEj8hq5S8OvM5/UtaSZaIVLlw==
X-Received: by 2002:a05:620a:280b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8c37f4c2b9cmr2919242485a.5.1768188215615; 
 Sun, 11 Jan 2026 19:23:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b7c2dd9e2sm2373045e87.5.2026.01.11.19.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:23:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/msm/dpu: use full scale alpha in generic code
Date: Mon, 12 Jan 2026 05:23:29 +0200
Message-Id: <20260112-dpu-rework-alpha-v2-0-d168785911d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFpZGkC/32NQQ6CMBBFr0Jm7ZCWUEJceQ/DYoAZaQSKrVQN4
 e5WDuDmJ+8n//0NAnvLAc7ZBp6jDdbNCYpTBt1A843R9omhUIVRtS6xX1b0/HL+jjQuA6GqlEj
 VitG1gTRbPIt9H8prk3iw4en853iI+tf+kUWNCtuyJSpFqBa+uBDyx0pj56YpTwHNvu9fOnLXw
 LcAAAA=
X-Change-ID: 20250814-dpu-rework-alpha-060ff6bf5185
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LnjsvQIGn3pV+5KoQI6hjfodUrVTxgJONSSaUaHJE+Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZKprGlB8eMRI6J/0Wv+nAvOSh75gCDovE2AR0XLWv26
 As27QmdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhI/DsOhnVcOWvm7Ni06JHY
 4lWmL0o0tnOomwWUfcy7/eS6URjLlrhJq5YdPXQj/7i2w6UgUXGhgkzF0yU73KzfvFpZftL5E8c
 /WY/LW/rCsm4sUxBW8a3Syu2O+iznfcP5/E4mQT+/WK+DAk0WoRNFVis6LM/6VGcexb6jSkzBs+
 Lnld2/ivNcXHM73Xd3/Uuocr67oWdDg9OE6PBrVZtFdzwy+DH7/uzn+i/9E0+k/Gvtr33XuHHPm
 QOfNFnenf7CFhA/k9G53uzq5OCGO8Wpv9k39x21aL1hZJokbelsU5u+QvDdNvVHhmeXF0TmhKoI
 31MTiTIx6O+/lNtw9vepbxOTE6fH7xW22eB3dceiYwJhAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: z_FJnioRA0UtocPb1WBu_ovy2E7J-xea
X-Proofpoint-ORIG-GUID: z_FJnioRA0UtocPb1WBu_ovy2E7J-xea
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69646938 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KRYFDIPkQpTtuCs3C_AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNiBTYWx0ZWRfXy9eUrID/sE2E
 hvaM+86NieDVIotqT3O6xpE9/ZSfj6UuYKMosdm7YBO5wNkw/brhrNwO61VSMyfaC6BKCEYtiJk
 /YZIPoaoRooe3+rGPZnxryZ5yGk7REiFkx2Y3YI0aeLlMh07MZV6teBTQw7eqThm/3+L9ikNIm8
 MJRkWo/LI9BW2yzxHAtZwnWmzKSQB+dnMCXcMZXE+B7s9/U2d6T3HCc/WtMD5ZllUTpYu/invkk
 R+/Lkty1jGZ0sLlSD9FPOWHdoCwEu6CTG8igpyM10o39jg/pUeNkP7PIzfbyY5q6wA4xJXCpNZq
 34MV3Z7qcDEUBFaBISeKeuv2CeLbrg/mRw+brlPVv1CRShWTWHLZ+/nFxC8BsrX97FL1vkUTltJ
 hoxTHU7mBBfuGYIORqT5ygzHGKzU03zlXvzfjO2ZimGl5gGU0Pkg98LI3g1XiPviJa6wNWuBXhe
 TZNdDEDj+318xAXkpFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120026
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

Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
callbacks embed knowledge about platform's alpha range (8-bit or
10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
alpha and reduce alpha only in DPU-specific callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Changed fg/bg alpha args to use u16.
- Simplified combined alpha calculation by dropping useless bitmasks
  (Konrad)
- Link to v1: https://lore.kernel.org/r/20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify bg_alpha selection
      drm/msm/dpu: use full scale alpha in _dpu_crtc_setup_blend_cfg()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 21 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |  2 +-
 3 files changed, 21 insertions(+), 20 deletions(-)
---
base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
change-id: 20250814-dpu-rework-alpha-060ff6bf5185

Best regards,
-- 
With best wishes
Dmitry

