Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A338434F56
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FE86E9E8;
	Wed, 20 Oct 2021 15:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390266E9EA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=JMVwsKvJpWFYKcUkBT7sbXlPZGL7hVdo76FZDvKInxo=; b=vL
 EMJJrKHBzSxzDASehgExJCASDewxEFDxCocvayezFYlGyMWhXdKbWnYHJCEe56L2yck3jVCycRU2n
 rNDwPh1LcPLpsAe2Nvv6AVXeg0TgS0k1G8xFB3S9DrXdPxiZU1WrGul0dWQWeBl/CCSc2ONR+j3Uj
 62U7EFUuARkMoEjZQH2Prb7LmdqvoNV+1vy5ClNrnx9lml70mFpqpiB/MAt2NQtKIUPgBvjHSi88I
 sCelW3oZcQGYaRDHBK67o5PSRB96hZCKH0Ia4N9VNaNBL6mZh0g22rdMklMFMRye18CNd73y/Zlfn
 iaROOB0g4sj6hF5pB2L8yWrVccqIezzg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mdDc0-00043j-CX; Wed, 20 Oct 2021 16:34:40 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <john@metanate.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/3] drm/panel: ilitek-ili9881c: Read panel orientation
Date: Wed, 20 Oct 2021 16:34:27 +0100
Message-Id: <20211020153432.383845-1-john@metanate.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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

Support the "rotation" DT property for ILI9881C based panels.

The first patch is a fix for the binding, then the usual binding update
followed by the corresponding driver update.

John Keeping (3):
  dt-bindings: ili9881c: add missing panel-common inheritance
  dt-bindings: ili9881c: add rotation property
  drm/panel: ilitek-ili9881c: Read panel orientation

 .../bindings/display/panel/ilitek,ili9881c.yaml       |  4 ++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 11 +++++++++++
 2 files changed, 15 insertions(+)

-- 
2.33.1

