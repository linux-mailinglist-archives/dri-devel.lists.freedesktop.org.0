Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F5DCF8C3C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 15:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E020F10E3CC;
	Tue,  6 Jan 2026 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="bVOJde3Y";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="jquIUnvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAC710E50F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 14:26:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709565; 
 b=NcW8rIP6bZT7c0r/HPSSXZ1Tjup2+3jDxD0Q8zS9heItu0l43+SNUPZ5ldwjJhmDgxl5gEKjN6
 XWgaRLea/zA96B/QMdvx2JDIcN1jg1mZJ9UiV0a4SfpoCjx+tZ2tEIy+gIQiuq4C9WatvVXeiC
 XFcLlMDa1j5o1v91L0XND4NkgTDmn8i4Ys4FY+ti+P5n0xL9rIuLkl/YPUHaJFdpO9+DXe6LZE
 cB+gUzod1REDwDm2CdMMVXGloVT6fGycVG/gCECUGKUKP3Q+pduHvu6Gz03iBe975TBMQZAc3J
 oXJUuNTEWQNjhNC3vCYnuvIYycrfxQChzcUf9htwooFtag==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com;
 s=arckey; t=1767709565; 
 bh=0IYFBwj/1Tc94SMR8BBfztM14FE1yqGNpcH/ENSaQ1c=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=S974QEb3k3UQL1NWXlDlQPUu0T+p6jYiko3SM/q080/4SyMoSdGeV47f8JX/sj8ei7XpqKmHNP
 k0cnMYeKnrIrJ9Q4NkPgNUYkg8DUyYSH00vlcqnt/GohxSfR8madgxIk7oxIsJ5G/1Bs/edbXA
 BOuFK3xLo9PMpkGvAJtjjWY2RzWI7xD6RVMTzASQ7kWZhrlSefLl3CJNeKrOWmAZv1NvAaaXt9
 u4VzhsixcbNZeCq8eMgUHwdGyW9CiwXp5+Fakci2xw0gS9Z2g/ywIQ+Bkvw64kLh8G+b0ny6n7
 Wdu30kmaOPXQpFZswyLGvvzpJkQpt9jESBwSSNLaXC5gRA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=wiIHoTKpqez2GTpzlzsY8o+kb8sgJMLZXwtewGty5hM=; b=bVOJde3Yd9RQB0EU9QzFpyBcuT
 RFgWJc2iOOZNfOXoXPe7YR3ir8HgC0rCQFF2gwAvAOw6YvAj5jnnRfmtRxdaOlqrXcD2ME8x1Y9SM
 GJR7MwtqosnnrAq2Mj3fryAPAZRKC9ftFkeGJfw0PiZTfSSdYS+EI5MqQWxqts9+OB/o=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-qrct.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vd80W-00000007LqB-1qts
 for dri-devel@lists.freedesktop.org; Tue, 06 Jan 2026 14:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=wiIHoTKpqez2GTpzlzsY8o+kb8sgJMLZXwtewGty5hM=; b=jquIUnvnh807JgCtpiNwojuMa6
 CbnE88N3AOndu1b8mbrmryg/EcwUoOmLuA67FsmAP2hHlEpvvyiyVuEFp5ohWGbqC+6H+a+k9w5Xu
 RpTLqcXIU2bEeSHfh3Kc8+OwRuLagbH+978ZpgYCbp50+niM4ZKaRvpTLkNc2EIQ0Ezg=;
Received: from [95.248.141.113] (port=61315 helo=[192.168.178.65])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vd80Q-00000000MvX-0eas; Tue, 06 Jan 2026 14:25:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 06 Jan 2026 15:25:41 +0100
Subject: [PATCH RFC v2 2/3] MAINTAINERS: add entry for DRM splash client
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm_client_splash-v2-2-6e86a7434b59@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=francesco@valla.it;
 h=from:subject:message-id; bh=0IYFBwj/1Tc94SMR8BBfztM14FE1yqGNpcH/ENSaQ1c=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmx0gWmrCpurisy4upDdth3XxK8LZ3yg7NQP6/C1d79J
 hdL4a2OUhYGMS4GWTFFlpB1N+7tmWv+LW0D4yOYOaxMIEMYuDgFYCLRexkZlkbdds9RTr17hVnA
 oD9lWd28/VLPpzzwuWSSd2i2qK/nO4Z/1s8Yrh/hP2g+dUGjXaxk3JOX2nzLK+sy+6IUOLlMc4Q
 YAA==
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
X-SGantispam-id: 8073b8dc2e36671d888b3dedb6c748a5
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vd80W-00000007LqB-1qts-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qrct.prod.antispam.mailspamprotection.com; 
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

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648b7e4e6fc62560662e43720422e01..35032cd6fddf4828906ca30924c5322949551ddf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8758,6 +8758,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_privacy_screen*
 F:	include/drm/drm_privacy_screen*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>

-- 
2.52.0

