Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076127A5A47
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F7D10E33D;
	Tue, 19 Sep 2023 06:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Mon, 18 Sep 2023 21:57:27 UTC
Received: from mail.sakamoto.pl (mail.sakamoto.pl [185.236.240.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2AE10E118
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:57:27 +0000 (UTC)
Authentication-Results: mail.sakamoto.pl;
	auth=pass (plain)
Date: Mon, 18 Sep 2023 23:49:44 +0200
From: Alicja Michalska <alka@sakamoto.pl>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: anx7814: Add definition for anx7816
Message-ID: <ZQjFabKW7QvrvsnG@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Haraka-GeoIP: FR
X-Haraka-GeoIP-Received: 37.165.191.167:FR
Received: from localhost (Unknown [127.0.0.1])
 by mail.sakamoto.pl (Haraka/2.8.28) with ESMTPSA id
 00563704-9D56-448D-AC2A-1D164520EB98.1
 envelope-from <alka@sakamoto.pl>
 tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
 Mon, 18 Sep 2023 23:49:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=sakamoto.pl; s=s20200705610;
 h=from:subject:date:message-id:to:cc:mime-version;
 bh=sI571ETAaL0Us0YlexREagZHnhYjl//syzK9E0tVq1U=;
 b=gLhvsyYwxgka72wBii+b4ZJ8YMKsQMkTMIuTAq1Uss5mNwKYZXZh5an1lYSrGaeY1ZaOFJw7o+
 6Ku5p9u/H3a4GwhwJM9mMngwSJplp48Yiy8bpZ6qA5fu8i9L33aZt52q3MdNB/13C+K9w4Y5kA54
 c27hLPdEy2V5kSzgCb5Z6ALrAR6C+USrZ83tQUol20WVUzYeXhBkHNFg7HB+DS/C/PbSdHzaI4IU
 enwrOgzdH+Y+xH+GpNhklu6jp9PrLQq9qdz8rElXfpvb+uirOGNIq1y1OBl9PLIQXrHMtILGAP+Z
 DGLoBPn8Qskfk38P7QrWju0CdslEWh4nXa1FDfTQ==
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested by Robert Foss <rfoss@kernel.org>, this patch adds
definition for anx7816. It supplements the patch submitted to dri-devel.

Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
---
 .../devicetree/bindings/display/bridge/analogix,anx7814.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
index 4a5e5d9d6f90..4509c496731b 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
@@ -17,6 +17,7 @@ properties:
       - analogix,anx7808
       - analogix,anx7812
       - analogix,anx7814
+      - analogix,anx7816
       - analogix,anx7818
 
   reg:
-- 
2.41.0

