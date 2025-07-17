Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8BB094B4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F310610E889;
	Thu, 17 Jul 2025 19:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RAL2y2X4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0E410E889
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 19:16:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso826033f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752779802; x=1753384602; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mzt9wZOnZ6+CbKPnKZeU8dqGY8Qw3egF+06TS84cda4=;
 b=RAL2y2X4b5ginhFaOymyyKuKmxDuFfwGShoZMLp23HYFv3quAKulTZS0/KTUfO8VxN
 MF/8xyZvEXPAMyDUxX4XjdmH+PSLuM3bspmjTLeLxPiMbC6B3lt2uI6oGFnDS0ulELsj
 g7EAlC5WXF8Wuq+jBzFDV/FNfOnf58Kt33o1MR8cwrGTP0CMUWyH9Yhx6UVmCG5AtaZ7
 kUKpzYw/q2ZTmifTrFtEx65t8nlopZy8PpwJkGfTNssPT7dwQSftB9662+iiWd742JD9
 LmTMNuWI4APC8cb4Q8Eb5CVefr5NJnUsTylswpGe7SSzksiE4mAUjzmq58cJfpMfBkSy
 K6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752779802; x=1753384602;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mzt9wZOnZ6+CbKPnKZeU8dqGY8Qw3egF+06TS84cda4=;
 b=TlFZoZQsTM1ByFDnCjEGBp1F758MhqIdIOam6qylLR5hM0gwLvvAaI4IFEBomhMLT5
 TniT8flYrYAAepyMA4v17/+AAAT1pIg3TClzXuxxe/NZJpjXLry1/GoFhr15qiJD0M5H
 yfmcK9kUpCc7yK+8ov62BhrrpE7ELBVGe7zEIPAIu09Od5fv59OEuaoaSwBEOWObGpyM
 Qeb4w0nK2VXMo808wGMYdJOwowR/EwvJQ/JV9M590bmV8/JneRBAwLPgKzASsy5iMwDF
 okCwDiu536OQdsHh+oGSMZaaI0TXtmh1gchLROUWib88GHsn0qcNXHRAGLkH0qd7lXGY
 SROg==
X-Gm-Message-State: AOJu0YyszhBTCXsXt0O+ZGVMoUbPLqPDKBPFE4rpy9QKNFenCseiOeQj
 zF6SdnPHoUdvUSI0DOGel5l4E2AH6sjIgnAi5RGu1jUWw+7GIlR4tFulwn1RMw==
X-Gm-Gg: ASbGnctb2ah8e5wei8KPz/D0FintImehfM0P5vjVd9xrhnix+xvkyIS+ZI6fIEcigkc
 gI1DPY2TxNt41BuegHpXIBVKo9uKJ3TIIsEsyAc4quYy4ONAEgvrGSWuQudvi8UcoXRPObsJJjh
 eN35MsQy6HRML8F9IaKxOgxnR6x08Jhx6g6ZE8SDEdUt2+1R8OQwoe5i+27gThbATT1xSfeKd0C
 jhbEku26VM0xRqDqetbsZZZxfHDdUHa3Ow0ezY6bI4yd6Db/Orx4X1dkXXwDHPs/JvvDbGQqmso
 WbrwbXITbVeTR40hPTegiJK3KdVjfxQHhHWFrvmYyBeEQGWaz91jFZ41h4PFdS1xkMFim4otPzn
 FCTuZIMxoducIlIKt7MgXZnKBXi/kBO0t
X-Google-Smtp-Source: AGHT+IFF8lsVWJTJwrDMD6i4As+eyuiIbEESQQF0qhNLx6tTwcszxJEOXDFYIrXcHilqwhBPrGxWeg==
X-Received: by 2002:a05:6000:420b:b0:3a8:6260:d321 with SMTP id
 ffacd0b85a97d-3b613e60143mr3320230f8f.3.1752779802135; 
 Thu, 17 Jul 2025 12:16:42 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8dc22a8sm21918017f8f.34.2025.07.17.12.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 12:16:41 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/4] STi device-tree display subsystem rework
Date: Thu, 17 Jul 2025 21:15:31 +0200
Message-Id: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNLeWgC/03M0QrCIBTG8VcZ5zrjaNNYV71H7EKd2w61OXRYM
 Xz3bBB0+f/g+20QXSAX4VJtEFyiSH4uwQ8V2FHPg2PUlQaBQmKNnMWVWHBPH+7MIDZScn1SwkI
 5LMH19NqxW1t6pLj68N7tJL7rj1H/TBIMWceN4r3Bc1Or6zBpehytn6DNOX8A7qr4j6QAAAA=
X-Change-ID: 20250401-sti-rework-b009551a362c
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=PyayYQ0JPKYC1bSL+yF6YQ9AEnmvymFEa0T+fiUNE9w=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwQs4pAM5O38T3nlF8WEU7Y1ach2SghQdlSd
 adJbgagmsiJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMEAAKCRDnIYpo1BLC
 tUxUEACQ1QihV0/vZF+Z/ZIMLTCNbEanzLlzjAJHu/gACUzwmyqQJhxOU2sI0NlfI4fNnrDXVXX
 3jXo+32bwmKHyRv00ls59P4a2tNtmANDSLl29KDKXRQofRMWv8Z4gadAbZyH9+vV08C5a34d7KP
 HGmgHSzq3EzRHjI3+uLXSSayuLzZlWKc8wF0XPbSLvna47gLHxqjZ9TQg9QOIyswiDsIXchnSKs
 JSJGCTSQQzbU04fuToq8JHXUSoMUHclxDppK0+SfJ/r77L4+0DWUy2bzuyf8G/ixqNragahIjBW
 YvoOvV/xGgXrdKUnt7cfP2CRRCpIcgRUx9KL0hBol/m6Xm5QuSY66guBwaNJkBCBjLnibmw/jab
 uny3szjVv6tviSINjWBqFxxIqV9lPGGjs1krT4VhA8pxmNIDvWhyRw0iz+FbyU/8nhyKkFGKzwM
 egEKm3+tFJSy5/nT/2BiC7P36ip9UyFi1s7+1lhIV3kY5ZCy6j3XDET5JyyC445WceMSPGy9drt
 PdKXf1ILK1uaMaOTREFlH5zQb8pADUj/v3A8n1c7PJPtC479R7Er/hFwGPD8VXo7lU4dALC7IGA
 oW1UaNYAKydYyRTL0a8gHxXM2jeIj12ozjm2xhrJO2uE4jZ+aav5Ou/vGzJn29QZ0zJqBylIydS
 4yPttkUKVVLkHTg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
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

This serie aims to rework the display-subsystem node, which was
previously included directly within the SoC node.  This was wrong
because it is an abstraction and describes how IPs behave together, not
what the hardware is.  Instead, extract display-subsystem outside of the
SoC node, and let IPs describe their connections.  Doing so helps the
readability, and eases the understanding of the hardware.

Several nodes have been renamed to stick to the generic names defined in
the device-tree specification.

This series depends on another sent a few days ago.  It is not critical
though, since not having it only triggers warnings when building
deprecated device-trees.  Please see link below.

Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (4):
      drm/sti: check dma_set_coherent_mask return value
      drm/sti: make use of drm_of_component_probe
      ARM: dts: sti: extract display subsystem out of soc
      ARM: dts: sti: remove useless cells fields

 arch/arm/boot/dts/st/stih410.dtsi | 316 ++++++++++++++++++++++----------------
 drivers/gpu/drm/sti/sti_drv.c     |  18 +--
 2 files changed, 192 insertions(+), 142 deletions(-)
---
base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
change-id: 20250401-sti-rework-b009551a362c

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

