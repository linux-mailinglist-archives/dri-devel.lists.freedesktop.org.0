Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0EC0B69E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 00:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EB310E18F;
	Sun, 26 Oct 2025 23:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="DajSYWIx";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="bkyePVvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8067F10E18F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 23:03:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-4x87.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519837; 
 b=Xvbbzx1TP3NsWW0HrsyWB5t7o8WIWwOZs81jiyEiY/4a/r9DSwab9JA9DZYYsdUI82jIxYEFoc
 GxAHXhUdIGuucXNw73GvWtKlExhCicPzJezj9jp/Afck4jFhQdX+/z5PLEKo/ThREJyrszJ1y+
 vS4pjmbtN20sjB4S1i3Lv5bX9l9HKoHKdmAdo5j2TTI5fs+gx7XUHkIbyUMDAz+khA5N2wvEBs
 +3So1/GZfpyno9WFBMN/31xxnSU0S/Z6vr+hbLePETPnVPgFlAVhGtV/EmV7bgKBsh18gx3/GH
 i/RMIJKhf4ClaINkZZHecHEvB/nJXdNegIoGG+CLquXTNA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-4x87.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-4x87.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519837; 
 bh=tSRixNkLhCUmU1E1Uy9yxAjJii9EPv9NuRcTEhUazSM=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=svoD0pZoOusUvmc/qP62tWoHXxV0iYGuvOPg+rTXtIw0baO4BZDDEZT8DCWA7BAWHXHiSEv5wf
 U4kkWdUNGv58MqNhCZ1i1N6VvAZDW4+hmD5/dEKflJ8m67UbtoCgkBMV4jrynJBtTI8Onwzq1A
 zvxSjlpXbhgdw/vi3RksNp6d9p3ABzCImu44IHREP0GTG8jwDtRQWPAIwHI2Kr3yqbCQ+/PxS2
 Nkbd9pYumfk4qKCUABI/Ud6Y/aXmKaDgPBn62hPZPSOy4nbrU0+P/xZXBeKhKuSwlWmjBDLhxX
 NkiVrmL+p4U63it+JNBCS/8gVkyWRZgL+LydIuBNSNtspw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=JWB6QTvpgPfu9uLg/5WttzxYcN0yMoWXBCd3a+bQgKo=; b=DajSYWIxk8L3Bm84hjrghJBOkf
 AfNLbmvO0IpcIYoy/jz70JeU8uD//L5CuHpRkgNmGlosrcMpVF3gEZWgSUxkxvYZMfVy9hIsow7eZ
 xpxDwngRQr3DdigG6qa1psYuI9hI7af+ttt0NnZVH+G84FkmdXLpfb7KJSZzZaZEBI1E=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-4x87.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vD9mD-00000002wZa-20Dm
 for dri-devel@lists.freedesktop.org; Sun, 26 Oct 2025 23:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=JWB6QTvpgPfu9uLg/5WttzxYcN0yMoWXBCd3a+bQgKo=; b=bkyePVvYy8jjGA4QRC03eqSlwN
 iUW+HaYTcxdxuWtbQEtjFhZLT0tNzzgtJQTH+i2D4EeVx+tFh2uNcoEGPR3d0doAS7AhEsDISrhr4
 xh2SReiC3JkiQPg/KW4EW9KAX+XCXMWL0/7tNpU4eY936Ndx6MD8+VsQ221PwyfJ/A+M=;
Received: from [87.17.42.198] (port=63736 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vD9ls-00000000KNm-1zj3; Sun, 26 Oct 2025 23:03:32 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 27 Oct 2025 00:03:03 +0100
Subject: [PATCH RFC 3/3] drm: docs: remove bootsplash from TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-drm_client_splash-v1-3-00698933b34a@valla.it>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
In-Reply-To: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=francesco@valla.it;
 h=from:subject:message-id; bh=tSRixNkLhCUmU1E1Uy9yxAjJii9EPv9NuRcTEhUazSM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDBn/VhxMPK7UHncreNrkNzMDXycvXXJ2zgyT+7sWcr07/
 H9Fuu2T+x2lLAxiXAyyYoosIetu3Nsz1/xb2gbGRzBzWJlAhjBwcQrARKI3MzIsyrd8U1UZxblQ
 1+jdmktOM9v2GMrpibOHMaeuuhq00TWe4Z/J7V+pv7f//V9tLj0xuc9M5PPfW5uYjtdeDOhYL7X
 iwHV+AA==
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
X-SGantispam-id: 6210edcd834c59c2507a9f2263105adf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vD9mD-00000002wZa-20Dm-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4x87.prod.antispam.mailspamprotection.com; 
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
index b5f58b4274b1d38e26b229b88a8b4f4ba3433179..b1a6d587c286f060d549a12cf8e771f753b712bc 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -717,23 +717,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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
2.51.0

