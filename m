Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC7BB9CE9
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 22:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06710E0CC;
	Sun,  5 Oct 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="FiRrmCy3";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="eIo8APPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389489580
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 20:22:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-03vv.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695734; 
 b=p72Ik1bpBLmAA7+QzT2O2hLRi6Rs3jTM2N2pN4HsnUy2seKFxVfRL6Q5e+Gjs+PRO9cpP9r1Tu
 I8AtytBSRHXT8UjU82YI0UXZtv61CNa+KwYFaZrb+TDWpTCbc1NJ6BMMXYOnT/TXW5uB8SuQFv
 huyIzMWQbuEMZ1XMBHzwO4tXKqzpZy+NE3TcVZgmODo7bsBfBi3Z9mwOs9DyBpQx8YwHDpbRIe
 cW3V2Nls6fDohYlEUx1MaeA/syJIHfz0ONCwBvdri0RvbKQUQH9P0/5dl0Nb0G/BGZ9T3PG8Kf
 ifXHueEZJeSERCCHX+QjioiCHID86ITEFahF4yxgLOXlHA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-03vv.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-03vv.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695734; 
 bh=47IvIiXfgXszMY+cAV0lSu8Ko5qTBff2hny8UxJ0ZUw=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=TlUdqJnOyDuHbj+4Fpzzm+d7T4IBKM73K4SdGHgiO4JyoIVMzVzOAolK5hxGBbv8sjMl29+2qA
 7ewHmQqElD1z4n7vLPnoPzOrev4pQ69w5A63myHurDguACvLBDIzRVIxw1WQJ3/YA2Tq0A2xiY
 FgwIDWTc6FqTj3ag7DLlqquxvaXRWY3J8BHFMrxJLvR1DSkgIWUrVn3KBYm56n2rwryneo5R/n
 a6PMij0hUVdx32vJbjgiDRaD59IuE9AgpAF/xC1CwSkp0Mf6TgPhSY1gir8JQhcfNXEhYS6/w3
 ilLekYFfG1F6CKk1YlT9ueeHaltH3o+NkiO88whMbT5kgw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=bXAG6V6q0Gu2P/Y5b57UaRwcg3Y2X9SQRXNhHXSl2EQ=; b=FiRrmCy3iuJSsVAiEe5hgBpSDp
 MBL7Kpu/epwUzteI1xLcivTI/hZUKKK59mcKxdkqHjNhgc4iC+NX2tRVF+rTab1OdoUruJnsp0aQt
 eC47/Kc33G2WvpTEf2u3cUPZYZSy78IXHsv1zuc3tBy85Agx0hQEG2Rs0viKmvnLsX9I=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-03vv.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v5VFC-00000002lDS-3223
 for dri-devel@lists.freedesktop.org; Sun, 05 Oct 2025 20:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=bXAG6V6q0Gu2P/Y5b57UaRwcg3Y2X9SQRXNhHXSl2EQ=; b=eIo8APPwUd+a7hb0bvMXEmvfQn
 iQOBNyA6XEjTKlNNZS68j1e8HF9DZtPNjYe41LAnF3CTzli4Nu4XX9oYfy+d2CINvDWeou26PxawU
 eTMnX6ev6uGoZ6KyJUIG8AOJQ48qQPs+nuAG8eGOuMB8lp5c1s0y0JxGO6wcJOsEvatA=;
Received: from [87.16.13.60] (port=64461 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v5VEv-000000001im-3olJ; Sun, 05 Oct 2025 20:21:53 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 05 Oct 2025 22:21:35 +0200
Subject: [PATCH 2/3] drm/log: avoid WARN when searching for usable format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-drm_draw_conv_check-v1-2-9c814d9362f6@valla.it>
References: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
In-Reply-To: <20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 9301cda7d731d5c616e478a67f5b9bae
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v5VFC-00000002lDS-3223-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-03vv.prod.antispam.mailspamprotection.com; 
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

Use drm_draw_can_convert_from_xrgb8888() instead of
drm_draw_color_from_xrgb8888() while searching for a usable color
format. This avoids a WARN in case the first format is not usable.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index d239f1e3c456397ad64007b20dde716f5d3d0881..c0150f0c3b4b395e6e2126cf0d9660c967c182ec 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -182,7 +182,7 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
 	int i;
 
 	for (i = 0; i < plane->format_count; i++)
-		if (drm_draw_color_from_xrgb8888(0xffffff, plane->format_types[i]) != 0)
+		if (drm_draw_can_convert_from_xrgb8888(plane->format_types[i]))
 			return plane->format_types[i];
 	return DRM_FORMAT_INVALID;
 }

-- 
2.51.0

