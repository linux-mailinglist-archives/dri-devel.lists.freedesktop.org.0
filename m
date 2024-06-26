Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950D917F74
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D477110E02C;
	Wed, 26 Jun 2024 11:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="5BqrJaai";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hSGRcJnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CED710E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:20:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 7BE7C11403B7;
 Wed, 26 Jun 2024 07:20:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 26 Jun 2024 07:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1719400815; x=1719487215; bh=fkOGLKTKKu
 fIvxA5SItl5LCFUub24XZOe7xquE5snEY=; b=5BqrJaailBsUYuKzXmNr1uTHjT
 fMTM2xb18DZG8jd8VWp9FVFhxdRjN4K8XBr9X7dzUM9ZGFpaIwIL3h6N6ldlcIwd
 uRg9Ro2rc4ZbyS+e0o5Q80CHre/cfTfOd0b+isFPke/sl3lY4jcSzilFC6OYjtt/
 0iKKq1io8M4UIIZ5ChpPAtBkJbE2O5T1YYOTSnlHnR+gjSdoaz2fXlhYAtOFdoYF
 N1B3BUOqTeyJgiP4m0krXlSTLCsJ2tjEVAagEKV3R6dleM/ConRid2oySO1OU/Ep
 bFaNckGlYvQpG8hWSfW7aVLwB4UL3zex6fZwYCKiE5azqhHwYktb6Ut9UOLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719400815; x=1719487215; bh=fkOGLKTKKufIvxA5SItl5LCFUub2
 4XZOe7xquE5snEY=; b=hSGRcJnSRIDDjyKwxBXuXfHvLitxr7CdgsLfbSQfZzCr
 SZZvG6XY0Uy5XU1y+6pBCPh8UIYPyyask3VNwMw5GaCDbi7eficUTL4z/WzTWeU2
 8QRx9L6R/gIjvWQ/HTpJg8/3afrllAip8c+lBsPwm6tNS+EFGRWxRDMufU2zPghi
 rzngdFv/CKFQGt7ZlqxmtJmI/6iruXL2bTssWXMmhgG2efu8OhZoF8CxowaJEE7+
 fHWQbPxETBHM5MG7oEO9yYOAwXxbk2G9eDr2lFWHbQ+YbXlJANSBGXkIUXHbbQ+V
 8ncR9JGKvfoqRncSrWVvjX9nehNSqxp9qQoLmdIyWQ==
X-ME-Sender: <xms:bvl7Zrg23EMdEqhckCxFtUfobG7c0Y3Tk7Jdqevs1lPI0g_iGkNm5Q>
 <xme:bvl7ZoC4ggen1yItOkmOYDNryh2cuULTixdWezGtaUpAaOoA-zeHmNXkeE-M2Y70D
 VNeC_RN3OXKSOV-6w>
X-ME-Received: <xmr:bvl7ZrHmy7HmTpJTEgDPkm4YGBN4w9p1fVeyjhMK3ngDgQUx8Smwkn96s_9vCjAIl-ms_9R8XKsmCHJVFnLi0TSMvRik4aL97VQ_Ih8xcEYj5Ufh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepfeejjefhjefhgfeitdellefhueekfeetueektdejvdeuueegudehudffkeevudeu
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:bvl7ZoSrI1PbmcRKjOVk_a1_HwO-eT-c_REpHGbNLRtURCegqMBYbw>
 <xmx:bvl7ZoxjPEQA1wUXu1wa_zLWDcav4DFfEf2HqSyOGQnA9SijBEXMOA>
 <xmx:bvl7Zu7GHP0DWcYNqfnd2OQVc2xFygoUYIda_NRLjE_1HmgNnm6mGQ>
 <xmx:bvl7ZtwYANrF6ad9tLlShhIJj0oMwZCALF81DvNG9-ZJ_GIq8myFGg>
 <xmx:b_l7Ztgd4yqkwl-dvezHthPCn0XPYzEv08Di0P3npp15WeiM81oQM8KK>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 07:20:09 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 0/3] Correct WL-355608-A8 panel compatible
Date: Wed, 26 Jun 2024 23:17:47 +1200
Message-ID: <20240626112005.248576-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The previous patch adding support for this panel [1] referred to previously by its serial number only. As discussed after the patch was committed, the preference is to use the integrating device vendor and name in this circumstance.

This series corrects the panel compatible to reflect the vendor (Anbernic, already in the vendor prefix table), updates the NV3052C panel driver with the new compatible, and lastly adds num-chipselects and sck-gpios to the DT binding example, identified by make dt_bindings_check as required for bit-banged SPI over GPIO lines.

Regards,

Ryan

[1] https://lore.kernel.org/dri-devel/20240530211415.44201-1-ryan@testtoast.com/

Ryan Walklin (3):
  dt-bindings: display: panel: Rename WL-355608-A8 panel
  drm: panel: nv3052c: Correct WL-355608-A8 panel compatible
  dt-bindings: display: panel: correct Anbernic RG35XX panel example

 .../{wl-355608-a8.yaml => anbernic,rg35xx-panel.yaml} | 11 +++++++----
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c       |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml => anbernic,rg35xx-panel.yaml} (76%)

-- 
2.45.2

