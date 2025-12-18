Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA85CCA719
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 07:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395E10E4CE;
	Thu, 18 Dec 2025 06:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTCANGuN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCcRMhq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC5310E4CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI1YtpE3717294
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PvF2kzY2RJHVpfE8ZdMyt/
 PKZpR9Jd5AN8TGCxGkhRU=; b=pTCANGuNL/wuSiX6BBHNr34cIhBnXmhZZV6WhJ
 87EQY5dQOQrJTsjIdLUPXeYNod01Jvbf3K5P9IZK+6XMKZapuK2p3oKnBCvjWNjp
 dbbdA5UOUy2WSu1Mbb9tYCh6PJnIek0IRd6Khy6CZz/mTXvOGJQO7w15VxAoZS0M
 4+PBfkVoHjR7LxQBAdIEiNjFeJ/XnSyr8Oj5vSgWAqh/wG1gkqdIPWN+gI9lU7JT
 1z0dtuqR++UkGYugEM9rw5tY8Rgsim1dUBhyO7z6AHaW3vveZ4PnR33Woysm/8VK
 7xZG3ljk0wZaznZI3RGwA73gcioSZyd83mzQ0yf1Y/W5+fRg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n7a03g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-be8c77ecc63so469448a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 22:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766039067; x=1766643867;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PvF2kzY2RJHVpfE8ZdMyt/PKZpR9Jd5AN8TGCxGkhRU=;
 b=CCcRMhq6DLFoLfbd4ykSBPVIOv0tjn6uGF8iqd7hznlU/JYBnsLMqZ5QY9T+KX93wu
 z9ZdVepU1LykDi6Gq9gOqJkzqQ6mEQX/IajVKOlIuH9WbH6dAW9P5C6C6WEfe3Iug69B
 W7rd6vJAnnX9aDBeYGIYPl7CR6WsOVGo9P4gZWcEf7nG3gvViS1JtodWl/WL+9AHAG6l
 pwIzNfXSbLUK0DngiU0y8LEAOsOZZnilJFEZhnAx4TxRYBFO2lpgJcDneqM4uTMrUVff
 HoW5AaGvHwoCcYWqdteVWVP1vRA4ganN65xC+SfyH23AU+BHFOqat5PvP5xT2YrPFrZ4
 iqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766039067; x=1766643867;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvF2kzY2RJHVpfE8ZdMyt/PKZpR9Jd5AN8TGCxGkhRU=;
 b=H8QVMQwV5t6yhyVN5PGYZeqUiop4zdbT+rKFvYDRCQHvZra71KGsYa51k8dV5K/KSr
 tOYJ1+43JSE2lbCj827+pFChrqF8YkLMOLhwJJ/TG9kk9JrZyHf0OLAIxBBaXcdaE971
 RswIsd1NvXqDliyYTl5ejqEpVk2iaM8j8TZU6MeB47Cdb+sjTZEmGcPkIl5pb+2r3qeS
 I1pc/BaHZPgCE07qEBkaFWHF1aby4a8jY3N4zJvPhJWVOrPzfLvvEFsywLzWAU3DodNX
 YJO0Ide1Oryz1pFx5kkvA8lQE+U7Kbz+1BqzTi1ZlTAN4dLdmWWo15mV80/XVD1b7978
 bOQw==
X-Gm-Message-State: AOJu0Yyu+cnkwvFoL7Ov59qUB71lOzIGczIrrvFgtSwgnsPdQ6iRMOOV
 llfSnTDJpzP1aoI8XUDPzs3hsGKkUFMUBsaekJ5X3v3qp32ft9NTVdVZfyW8n20QycPSkMYdwF3
 xSK10R+dzqtHvQwS8qciAv8ZqpPg4CVlllJGSU1kdAR3mYApnXxy/s7joN/K92R/sJMyW07Q=
X-Gm-Gg: AY/fxX5ZI8o+QxO5sMoQJA3k2e6S6b63r7b3A+vfv1vB4XV/JOe8ZVW6Sm8L/w2IAYK
 EZXujR4f5hc3RZNQgcI5BBMk/rBlMiWokMZ8QfV8rVY2bW8KLCE/rIBtiCFmz2pyuPnfoiqfChr
 264Pk2yhuuz7/jFrYoGX/yMGXFGM3UEnajavNIPLOaUO0fJzZx1qVp5mO1qwMyGHtb8bTgamm9V
 q5ENzcois6553KPj3Ck+6dJr5Yw0kVxcM+/xaBa/gZYo7jzzxV7OXUAI7fGYHq9EhzQGqFywJsv
 rkw4FudZehC4LItroNbYQk7k7QqOWQq8BoEOhpCrt2ATwPHuiVRXUZOlSzAUpcOe4LkyL7ZA50e
 xp0mPpzhlmuZcEiW3OYSQFse1jlCv/NUFtDUFh9xSS0jMj8dlAQ==
X-Received: by 2002:a05:6a00:4216:b0:7e8:43f5:bd27 with SMTP id
 d2e1a72fcca58-7f669c81ff2mr17211656b3a.60.1766039067208; 
 Wed, 17 Dec 2025 22:24:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjcqAYJhzbvHq9wbHPc4O96OAqL2IGnrb9qafv86gJxCGnrmm5D5C8yeH+AXHcK19aSoRdKw==
X-Received: by 2002:a05:6a00:4216:b0:7e8:43f5:bd27 with SMTP id
 d2e1a72fcca58-7f669c81ff2mr17211627b3a.60.1766039066756; 
 Wed, 17 Dec 2025 22:24:26 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7fe0eb24d7dsm1433161b3a.0.2025.12.17.22.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:24:26 -0800 (PST)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: [PATCH v3 0/2] This series adds LT9211C bridge driver by extending
 LT9211.
Date: Thu, 18 Dec 2025 11:54:06 +0530
Message-Id: <20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAaeQ2kC/32NSw6CMBRFt0Le2JK+FqI4ch+GQelHXgIUW2w0p
 Hu3sgAnNzk397NDtIFshGu1Q7CJIvmlgDxVoEe1PCwjUxgEFy3vkDNlDJu2TiBqNgQyJdEqgU4
 PqC9cQimuwTp6H6P3vvBIcfPhc3wk/Ll/5xIyZI0T8txwZ5HjzcdYP19q0n6e6yLQ55y/T83pE
 7sAAAA=
X-Change-ID: 20250910-add-lt9211c-bridge-5a21fcb1c803
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766039060; l=1574;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id; 
 bh=IjhpA0u5gPex9Wgy/9k20zgIgM0B6va1VAAo1IRxNlA=;
 b=5JOl+l0TsIbkP24+rWLxeB88zfYt5IzFvin3Wbgjhyn1Q7xFdrYyWYxNnFQ5/0ZLnL6hSLUYI
 XzMh839PREzBgESJ6TJzfGbaUWYJMJPcrU0kMQOkN5tmAv049X3Ftpn
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: QjmDy6ch3DAfbrN8zAywfDbJyiXswLQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfX+GYp7nlOw+V4
 5KWJeiL5A5e3o/0yxYOiiw3s5qDGoGQI/Wy18pX/TENv4rAVyRGFO7+Yj3LjPvWDmicawQf/hbB
 +wdthJ9tVMFDdA2MDdiqzzeAKiyE+0cnPxEFE6+BytDvbtzqB8geXij8oN0+ZuGAX2p+41b8gGk
 OXcLEKxvv+4LiImNgarNhdWMt3VvJjxtULAQmob0gt3rnIowUszzRbRYse6HEE/slxUdDAB6dI/
 cUL6pkcj2GlDaJfXO862WhixPOCUMyUIgx4KFF3qPLaj1Gzfv9TUA+7m4hQstrMqNjDpF3w1itu
 WF/n8i+Ftg+bXqjAwvUUdHd2ZQ0LB6FYA/OcytR/YfQ+BORj386k7OLNKnRU1K+Pu+X/F/qQl4s
 rWtG6oDZ3I9/JF8n+2Aui5wACVTGbQ==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69439e1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l2Wm8-mKMQOuCn8Uv30A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QjmDy6ch3DAfbrN8zAywfDbJyiXswLQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180050
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

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration.By Extending the
existing lontium-lt9211 driver to support DSI-to-LVDS
bridge configuration.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
Changes in v3:
  - removed lontium-lt9211c as separate driver
  - Add support to lontium-lt9211c bridge driver by extending the existing lontium-lt9211.c
  - fixed kernel test robot reported build errors
  - Link to v2:https://lore.kernel.org/lkml/20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com/

Changes in v2:
  - Combined driver patch from https://lore.kernel.org/lkml/20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com/ 
  - Added MODULE_AUTHOR
  - Uppercase to lowercase for hex values
  - Link to v1:https://lore.kernel.org/r/20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com

---
Yi Zhang (2):
      dt-bindings: bridge: lt9211c: Add bindings
      drm/bridge: add support for lontium lt9211c bridge

 .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 829 +++++++++++++++++++--
 2 files changed, 881 insertions(+), 61 deletions(-)
---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

