Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA9CDB906
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05078945A;
	Wed, 24 Dec 2025 07:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiUXOTdd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iajo0s1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691B810E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:11:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO3wKmR3796513
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=hW17W4TydeKCp5cnED0aM2
 NiaedMLHDL4MI/OU9rEeQ=; b=YiUXOTddnD8AXgf6jDU9aaLRBpN04DZJWHlUwA
 YHLz2V7Pw6VbqCEBtscx9EWgUx2c95IY0qP7P+PHDTWcnG2mhJvaqM4RqjWAHU+a
 Ez2c9IWf3QwVtTDlePVPygxC/Kqz5Bi9/3Yry+7xg8x70eiohiG8J6gju86wpwJy
 9UWIhgpaHbqfqR7sdAG2HUmqQS7/+FM6V2MF22YBg1Mt3B0HiIbfl4b0/8axwUBr
 FSrnlthS1VkrYJN60aB4EFYmWbwlw8gc4NvoLML7ItwvoTPk1CMUILD7mULnq/wH
 p96+XasGDy0fFWr4aOKdYwU8v68TlRyqeSa2lTe/jja4HgwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68dxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:11:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34aa6655510so7484851a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 23:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766560312; x=1767165112;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hW17W4TydeKCp5cnED0aM2NiaedMLHDL4MI/OU9rEeQ=;
 b=iajo0s1D4ZCE+RKTSQ/DtiCgtgEfSaSv4XkC8AFiNzceDuUW6dmOwck0HFLStc8x3k
 CFGwuSSlYZX7Wxb4zm7Cby6H5Dft/8gyjsAHQ7MmlPXzE9nDxN9Dp6YnVVqsRDsa9oOo
 Hv+/xiZXn35x1sujQL2QdtMaxFgNrbMN/1kxNHtU0zIoMPP9EMdMX9Qwj2n3kM0GctAT
 ZbMGN19lX0wrYrbqmZYkC7Yj3P21IMFbgSzZWsw8LTuSVle1qG3KgZ0Y4ERjHHdxcsw4
 Jv6nk2KTm8q+LMiqOrpiRTTBZ+9BrZS/o2OZ96vl65c0j5pePgStOOCprX2jGGtLALNo
 H5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766560312; x=1767165112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hW17W4TydeKCp5cnED0aM2NiaedMLHDL4MI/OU9rEeQ=;
 b=vy5s8IsvM/5WwCtr4VxastE6O0rvcNkcFsT+VHkXdqFeQakrRavMdS7e5yqlWuY/6/
 WhCW7cz9EzndmkWyL/jBalWe4nIaqjl/vssPvy3slp+uNgEHFIfAQTo5UCmGo55cnOG7
 Du/G/b6la9a2MA/nDHNOIH5rV8RwHbv4Ahuma/s4bTW/WjNK5y7ysy6BdFkPS3O6hqy7
 AXeToHW5qGvT20mjTL6eI84tE61O1ONsVDy4qrF/mQEjwBnHO1nLymM90jfj4jaATv5T
 mw70VUG6oMYZYMbhgG2qBZrIbmpwY+aTe2p3xIxW592bVaHOHiHBr4FYCAGymPyEIqVG
 5D1Q==
X-Gm-Message-State: AOJu0Yw6cuVTJYpxqbVmDCiC90jHbS9K8z8umslHvnuzs0d9v7Bz6c3d
 ngHwueL8JX0oYCRu8STJS39tJThTGpZn4SF4BKu7/aJQIv0BzAsOiQ5+G7kKKbRropWwrvRycEO
 SAIlxMeqtD5WxejJVKkYnL29h3GGI+v3t8AXoX3t93peCvlTBK+ymmGcmERuUxtCLPhoFTkA=
X-Gm-Gg: AY/fxX5VTDJJeqAaoSMDHdA3XxccbIqmFXzdQ/oH3WyV2t9HMdmwapvHzgWgCw0GwV1
 JwQpCDsJRyZP834IeAupenZeI3xWhacVsRjEd2UvJHaCXLK9ZVDdgV/K5dLG0u26oo1Z0zTsz/f
 uEIgPBqjWEtIPVorK3TIlzwnm3s+AUeUxCLzxWNTF+RAPK3Er0X+sbcVjgaSwn+ApTjXzXeUbVs
 m+7PJ8lTdhVLBGMQuyS/9eovuLgARtEKyZqX+cA7pOYFdoVEZo90j6zCBpD4GarsFffH3/Zv3gO
 5d0+7Cq8tFNkfW1XsgAYfMbjxxUv0iRvekbrC/N8Yswm2OFunnQp1QDaaTUHQNnk8+2Bsmqen25
 zEYV4CkieipkX2PkZFLY77uTNJi+cinX40gJaAqtHKyE8miLPKQ==
X-Received: by 2002:a17:90b:548c:b0:349:3fe6:ab8b with SMTP id
 98e67ed59e1d1-34e921ec30bmr12510652a91.36.1766560312160; 
 Tue, 23 Dec 2025 23:11:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXq62cC5knL5R4Af192lUYOXoYv3JhMou+LZucwkqcQ4fKAqNa5D+5SIS1pUGOYZVm8yV1eg==
X-Received: by 2002:a17:90b:548c:b0:349:3fe6:ab8b with SMTP id
 98e67ed59e1d1-34e921ec30bmr12510630a91.36.1766560311642; 
 Tue, 23 Dec 2025 23:11:51 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e769c347asm8977146a91.0.2025.12.23.23.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 23:11:51 -0800 (PST)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: [PATCH v4 0/2] This series adds LT9211C bridge driver by extending
 LT9211.
Date: Wed, 24 Dec 2025 12:41:39 +0530
Message-Id: <20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuSS2kC/33NwQ6CMAwG4FchO1vSbiDoyfcwHsY2ZAkw3XDRE
 N7dwcET8dLkb/5+nVkw3prAztnMvIk2WDemUBwypjo53g1YnTLjyEs8EYLUGvrpxIkUNN7q1Cg
 lp1Y1pGoULB0+vGnte0Ovt5Q7GybnP9uPSOv2LxcJCIqWi6rA1hDSxYWQP1+yV24Y8jTYqkbxk
 4hTvSsJQCBj8FihRN3wHWlZli+hSyIOBQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766560305; l=1786;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id; 
 bh=NPcD2nTh9N+swnALwEGpTtFthlo75VoFTv+NyasMxE8=;
 b=2qdLgalPJe0FaTHARP0TOXCJdgt+RQNPEj0DEXemzwgcFO2qRnPl+VfJdVxUlhdauWMPEu9f+
 s+TDez/QxS3BZE/6YvsYhtjf5ZHb96BnKHDi2C4EYGraAeQpcntChP9
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-GUID: N-nvFTTbzboCDyv5CWDHeSe2vNluxJfx
X-Proofpoint-ORIG-GUID: N-nvFTTbzboCDyv5CWDHeSe2vNluxJfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA2MCBTYWx0ZWRfX7i0hojb8F1+P
 3GzRYaDgkRNRJ7MfIRTXMmcHqfcPYf9i1QoQZ9uxuq6ZuPHClxUKOx7Iaoj2cp/wFx0fkYDPeJK
 +RteKX8zNfTJXF4DNF5cNwM1bmH3fEHsVvgqk2qadIgjm+i1U0+4jcvOncpJex0fSqceLpnzz5K
 I2RyDcOIB7dEswPY6ol6PuhVVQpr5tGW0hvrsWivLdhkuwubrfMhrvAiK07oV11aLVfeJ+lYZfF
 biojuvlQsK7tVi2madCzpxU+pwdXDVARQGLSsI3GafenZfnAXNsD23qSdEzZnq+YLXMEEHdbymC
 /hpSs64L7X3mee/qggffZKljy8AWtUXc8D6VdapM10wbbJFs2+9A6/9GK+GqzUveXHnfmB7HqFU
 tpFxYd2CEpVB9GhBUlePfW/OR4Ue21uLv3i2U9lSQmm4nDyglZEhPcsgXgi30vwzBU2o9YwQQiz
 UjYZP4iuzyJ9LoAssPw==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b9238 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=C95xmP7O1PCm17Ein70A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240060
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
Changes in v4:
  - Removed lontium-lt9211c.yaml.
  - Extended lontium-lt9211.yaml to support LT9211C.
  - Link to v3: https://lore.kernel.org/r/20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com

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

 .../bindings/display/bridge/lontium,lt9211.yaml    |  42 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            | 829 +++++++++++++++++++--
 2 files changed, 808 insertions(+), 63 deletions(-)
---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
-- 
Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>

