Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E354636DDCA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598FA6ECDE;
	Wed, 28 Apr 2021 17:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEC06EC86
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 17:04:29 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id t22so9935529pgu.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=ZBABP32kAKUkL73RzLrs/VZTLUwl6tRRR4kreJjVivIQnqrLTx++PGkZdghCv6A51h
 i5wfgs4sj08UJWCJZAhmuB1UPJXH2+qBGrDT9VrYMuWAyEi9ipQ4WYYmOIrBtCW1JSTT
 xZT0g/d1wPha/HFRrZyfSi4R5Ae53TxzQP2kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=Yu16D3/A24vrCvPMJsJmW8//s4KFDPbcOzUs5D0X3oPH6QSUc9vlW1hatsLU3cS9Dj
 yMtBAxNwbawj7kDF9d5FbZV6HVS4AO2z6HndvdVl3NOvnlIn4fANxfEcmumJ296Oc+4A
 Z+/HWWeF7cPUbGLCyjZMEOf5GIEvZet/NXYAD3AVQKusoJVBUTC2aAj1S4bpG4biHyrq
 YxwgFcK4zyTdbsHGn49hYuqTul9wYG7AaosWizBXJ2xqFA9sFhHNIfVM1V2nIF624H2U
 nJoFouVYi+KhKn6cmCnkaSkUhh7npjj0sl+BKkYVdT/BN27wRkbDFVYl0uzYr9DuacM1
 KvqA==
X-Gm-Message-State: AOAM530nmj6lAGvDivYTCyii7LxN7iaD2IIOPOZQjjou7OKKU3F9dcoU
 LRc8ar4QeEMynnQKdlIf+Xlg8UA8evAmfQ==
X-Google-Smtp-Source: ABdhPJxmrYhCyqvJ9YcpCKMIp11Js7eA8QUCI7vGyyUeKC4ER8oO8PiDoUeETkQrLQ/8pN+UBHWhJg==
X-Received: by 2002:aa7:92cb:0:b029:1f1:542f:2b2b with SMTP id
 k11-20020aa792cb0000b02901f1542f2b2bmr28418795pfa.31.1619629469280; 
 Wed, 28 Apr 2021 10:04:29 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:28 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/4] arm64: dts: mt8183: Add panel rotation
Date: Thu, 29 Apr 2021 01:04:16 +0800
Message-Id: <20210428170416.1027484-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
