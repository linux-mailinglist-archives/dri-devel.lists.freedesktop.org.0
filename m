Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b/UGIA9ylWkWRgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A9153D5A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9F910E576;
	Wed, 18 Feb 2026 08:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="h1QqkzxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1253E10E4D4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HuGxPeUUoTAA7Z545fu8xoCOKPxhp7y1R0SdhD9LNdc=; b=h1QqkzxWex9sTxpAVrNtTh5hQe
 bB7jEws4b/FYTSsswSRytEKeOzAtwIHAbFViFKRZeWGZZEI3vbUItOqksvtPCRWOBNULTfiOuTD8q
 BRTkIea572eDZW3YuZQudPYpO5RD9IDi8YOhXPjgU7o8IlWwHH3l3oljWxcKz/TiPCL2yqdTGfKCr
 ryL1sth9+/tstWam5wUJ/fmNUnbPvgQMZLV7t1HXGdx0o4/AAk8l0VI9tkQg6J07ruyTkkwpdbpOp
 GPUbzUTEI6lff1waIX4nNnzeg9uAcxVXAI+unql00saNnXznIW8uLijWHfbtTxrjJNXYZl46M5KS4
 /eOILsRw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:56892
 helo=florijan-nb..)
 by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.1) (envelope-from <florijan.plohl@norik.com>)
 id 1vsKL3-00000007pWE-0rdF; Tue, 17 Feb 2026 13:38:01 +0100
From: Florijan Plohl <florijan.plohl@norik.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Powertip
 PH800480T032-ZHC19 panel
Date: Tue, 17 Feb 2026 13:37:58 +0100
Message-ID: <20260217123759.169317-1-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id:
 florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:02:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[norik.com:s=default];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_AS(0.00)[florijan.plohl@norik.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:upstream@lists.phytec.de,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org];
	HAS_X_GMSV(0.00)[florijan.plohl@norik.com];
	FORGED_SENDER(0.00)[florijan.plohl@norik.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[norik.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[norik.com:-];
	TO_DN_SOME(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	HAS_X_SOURCE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florijan.plohl@norik.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0E8A9153D5A
X-Rspamd-Action: no action

Add Powertip PH800480T032-ZHC19 7" LCD-TFT RGB panel compatible string.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 868edb04989a..b85071648968 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -268,6 +268,8 @@ properties:
       - powertip,ph128800t006-zhc01
         # POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
       - powertip,ph800480t013-idf02
+        # POWERTIP PH800480T032-ZHC19 7.0" WVGA TFT LCD panel
+      - powertip,ph800480t032-zhc19
         # PrimeView PM070WL4 7.0" 800x480 TFT LCD panel
       - primeview,pm070wl4
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
-- 
2.43.0

