Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660CC1D09C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA8810E224;
	Wed, 29 Oct 2025 19:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="gvuq8XCA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GJ7Zg+pG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE410E224
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:42:18 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cxd1P38TMz9tgK;
 Wed, 29 Oct 2025 20:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761766937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ZThYyYJOwM1+BCwYF269VW+S6XvWye2pxq2VEf4UAc=;
 b=gvuq8XCAtRlAYCrGtrF0P3P4PuyPupf//+PO2Gh/loOUKusWFp25p97d9qa/CHgivoj0/8
 lKTxEYA4IurN8FN4mBhHVgU1UIydM4XYxQgoP//LrHuQITdrasMOwqvrLaaAl/pefbZzyJ
 KXWoiw+5tMrCuxmybTs3GTdmWDc2wBy5GsxYtqUCv6fMQNdr1j8ORgoP7UZAiaC2Jvxtzx
 lkrgLILhJ+XPoJGbs1MBLDmAIoRJaa7I1hlpJYfSmUYULLkS3bbbnzp9m4Ys07//7VXg6I
 688qlqUvNoWjVCzHKYoPO7M9vbrnlea/f/ieNi4jM3dEZDhy8YTmrWEP2/d4rg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GJ7Zg+pG;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761766935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ZThYyYJOwM1+BCwYF269VW+S6XvWye2pxq2VEf4UAc=;
 b=GJ7Zg+pGDiNcyur0EutixwUf5F6DbfSIxNmPr92Om9wa7utudBIRTeNuZ1Ga8CHrpqXdFt
 aI6c0sdRgtPfxb1iH0Gb15QFoZjo/wbRQwdWLaQ/HelFmxHJEQZxlUMo2LofbpOYe+v1AZ
 +fPscTdBoco3KY9rxo69hU2fSHY3gaj0hSyo9dKGwgEQgPSuc/x6DKfUT3RJurbvqonfvT
 4P8VIN0sOqv9ptvSj8FsH9lIaprRR/KEZYll3cohxdU/IWH05PmUoWJStAcNtg5n6z6Kmk
 QyyZe2wmssur4nF4dEBvH12XKv1Dso67l8AIeYcr+nHUnmHn4QlCrDVoi/mzgA==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline
Date: Wed, 29 Oct 2025 20:42:02 +0100
Message-ID: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d99c324eee434e72efc
X-MBO-RS-META: fm4bxq96txzbruo1s1tkytmibwba6nsp
X-Rspamd-Queue-Id: 4cxd1P38TMz9tgK
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

Fix the following DT schema check warning:

./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:103:1: [warning] too many blank lines (2 > 1) (empty-lines)

One newline is enough. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index aa8b2069cc24b..a7ca6d3fdf10a 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -100,7 +100,6 @@ allOf:
         clocks:
           maxItems: 1
 
-
   - if:
       properties:
         compatible:
-- 
2.51.0

