Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BD99213E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51B10E245;
	Sun,  6 Oct 2024 20:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.b="y97SzS0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from st43p00im-zteg10063401.me.com (st43p00im-zteg10063401.me.com
 [17.58.63.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8910E245
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1728247398; bh=lLvj4KTKZ8sDf9++iN7YmwSkmBPSmS8JDWOEGVKITro=;
 h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To;
 b=y97SzS0igRMtyEMMl8pwAlPifEjBIb7HuBILYvquGbE+nMxSjVT+c84xXAViWEWfS
 r4NZXLwL4TNNfZMLkxhTNia0PxGhELQV2401obcyRBkY/5ZqbOS+5RyyIGt+Dnh0/7
 hbT9svpG2ha2a3ElMWGXoyqHtozMtt+dOf8tL5fWA0GRibC+wOob47tTF2Uo6gYgg1
 WtBAPU/B7w5bUTV8Izm66EBxkES+2Q8PVqcpps0CMwX5VpL4MxA5AqGBtNIqNtJTy3
 rWwwUEFktmjoaSJ4IY81VSQqkbWYoQtiRpgMMV+PVf7+eMuHFcU+SQOijWX6i9SRkW
 0iPfN1Y3f9Cmg==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-zteg10063401.me.com (Postfix) with ESMTPSA id
 6D9D0A807B1; Sun,  6 Oct 2024 20:43:17 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
Subject: [PATCH v2 0/3] ARM: dts: st: add and enable MALI400 on
 stih410/stih410-b2260
Date: Sun, 06 Oct 2024 20:42:48 +0000
Message-Id: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEj2AmcC/2WMuw7CMAwAf6XyjJEdNbwm/gN1aFLTeuhDSYlAV
 f6d0JXxTqfbIEpQiXCrNgiSNOo8FTCHCvzQTr2gdoXBkKmZyGJcFfvlhRfLHbVnQ3LyUOolyFP
 f++nRFB40rnP47OPEP/v/SIyEV+eZi3a2dvdRjn4eock5fwH54c5YmwAAAA==
X-Change-ID: 20241005-sti-gpu-851d0a720e6c
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: aFPJO27W4_fSgQW8B2SRbN6nzzbCdVCN
X-Proofpoint-GUID: aFPJO27W4_fSgQW8B2SRbN6nzzbCdVCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_19,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxlogscore=613 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410060149
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
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

This series adds necessary node within the stih410.dtsi for
the MALI400 GPU and enable the GPU on the stih410-b2260
board.
For that purpose and since the MALI400 GPU is available on
the STi platform (stih410 / stih418), a new st,sti-mali
compatible is also added within the mali bindings.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
Changes in v2:
- rename compatible from st,sti-mali to st,stih410-mali
- Link to v1: https://lore.kernel.org/r/20241005-sti-gpu-v1-0-9bc11100b54b@me.com

---
Alain Volmat (3):
      dt-bindings: gpu: mali-utgard: Add st,stih410-mali compatible
      ARM: dts: st: add node for the MALI gpu on stih410.dtsi
      ARM: dts: st: enable the MALI gpu on the stih410-b2260

 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |  1 +
 arch/arm/boot/dts/st/stih410-b2260.dts             |  4 +++
 arch/arm/boot/dts/st/stih410.dtsi                  | 34 ++++++++++++++++++++++
 3 files changed, 39 insertions(+)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241005-sti-gpu-851d0a720e6c

Best regards,
-- 
Alain Volmat <avolmat@me.com>

