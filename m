Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D44CF8C42
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DCB10E50F;
	Tue,  6 Jan 2026 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="YIE7c16o";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="X8DKm7NV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B47C10E50E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:26:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709565; 
 b=hT3Vuhaq1lGHxT/Z47hNer/KB8o8pWk96nuUUvy0a0AobBuIbfYMGtvdLmchratOj+estOCP12
 IgHUZy5/zbmbkv/dJzzhJI7QbyftVJjOHw7SXvv4xlBxn6heV7ACBjkdIZuYjulH2wnSlW/hRG
 228BRYNYQQolEMha3PG/9DfrYmPpI+0kPpCPKdWSnhGEPfNZCvztwcfPjNcpY9kfmKjqgJhGA6
 m+n1f94FaBTjk51Yju6ZcRuVISNwlvoxQ+Rv2l93Q2RasmBs2wFxeMd9/yytADs3BuxCEJZPf9
 k0LddurFliCTU1kwx4y9lGsMW6oj6s4JWUZqxZJnx/8gLg==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709565; 
 bh=IAwJRtP6e6Uok6TXGFtjo0psvVmWxfzfjk894Ekbkgk=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=ATM38mkG46vdzUtq9x2ugg0taCGaRagu+ukJGiyU0cmXvkDO4U7dlQRrv0INtpmHHZONpD6uYl
 AaGg8JWEyVRAxWxoYq2lAsiF055nqbfDFAV9mzIZJhqFr0QeWzKdggjsG14JU2z960K1AaQSf6
 0dK/Y6Q2r0vpD1ma+8cW1Kt46hlJxSPHDvIEYLtCMcj7xrZJ43jMt2BIz2g0TUBhQroFXZUvZf
 OT5PxP46mlslgKB8XOG0N6JSWHOO4zURFOMQfedKIWPRJ5Fo1l50krGYiTH6Xif47HtKNXTLko
 ti/chjG2cyKdgrpjXLhuG/FCSBlB9czpPt/hDZLTGC+CJA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=DfKGtrGKPa3faWLHh9s5lvGkj1UBCJYGSw0oOVidCkA=; b=YIE7c16oislepvrZAZONK5X3mR
 g4diukoddsjJhR0gn+U6wfStJOM3jZ5NNYZOnAmKif8ENyHo4UvAfeec3c6jbpyPycTUW1B2KNjyw
 kTC/u4S1OvcJn3bwDmfQSsbtGImYaGgZ4wY7pQtgShpt22IZ8zJWTxVHyhKZhWJPfsiU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-rv86.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vd80W-000000092dQ-2VfA
 for dri-devel@lists.freedesktop.org; Tue, 06 Jan 2026 14:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=DfKGtrGKPa3faWLHh9s5lvGkj1UBCJYGSw0oOVidCkA=; b=X8DKm7NV+9b2ecTeAkwSCIeOFM
 bN+lnqT25kLjdj7zBjEJpPS6d7QsH/dKOrALH6IS0enDINpVBTi0JFeg3nHNk1NJqYZTRf64dpe7k
 7i6K5OMneVpjVgxt6QcU3UXTkF45yd35TKxj664aGtlLWdopO2BcyT93Y5jbDG/WlVIs=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vd80Q-00000000MvX-3A1v; Tue, 06 Jan 2026 14:25:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 06 Jan 2026 15:25:42 +0100
Subject: [PATCH RFC v2 3/3] drm: docs: remove bootsplash from TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm_client_splash-v2-3-6e86a7434b59@valla.it>
References: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
In-Reply-To: <20260106-drm_client_splash-v2-0-6e86a7434b59@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, 
 Mario Limonciello <mario.limonciello@amd.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=francesco@valla.it;
 h=from:subject:message-id; bh=IAwJRtP6e6Uok6TXGFtjo0psvVmWxfzfjk894Ekbkgk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0gXmUTertpzR2dZ+eW365IkmL11kct489H+6uy/w0
 LPKwsmHO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJrPJjZHjeevb4/au3buf3
 7n65r44jj1+ucYK9ifiUbSf4nt/+/KeGkaFBZfl6/7eRrH+vn3r9dnvjpZbdz/aKC2p6ZtxnK4l
 W+sIGAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 87080fadc7c86920905eacf9dd0d9380
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80W-000000092dQ-2VfA-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-rv86.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb97d6895752d4cfe21c94d0000973..e32b303cca26fa284f795e30dab18cf9e9496a9e 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -754,23 +754,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 

-- 
2.52.0

