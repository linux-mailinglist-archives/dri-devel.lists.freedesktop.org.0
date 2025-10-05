Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4ABB9CEC
	for <lists+dri-devel@lfdr.de>; Sun, 05 Oct 2025 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636BD10E2BA;
	Sun,  5 Oct 2025 20:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="hPg/jzOH";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="brOnScoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8B89580
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 20:22:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-nf36.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695735; 
 b=Yi9ZYgViltQi3Rd8TTWaplK2wacjNF4leVxFzrX0m7W79WH2HQgsGzl088n/P3Qc1njSHiXeEd
 rA9oBVO1R3eFY+ZqqvGSkox6PvNm4Q4fQs1EQ0Bg/+LYxunE3HiAdXjAqpH8HUMOtGutYTN5H1
 +xqn4B2LyZ6ivmUUWDMToOLP19mIqdQu7y3kDUooHnYmZ4s29mgHAVkPgJxmkXHPLXQZejfqMD
 HumvxMF48bCRmm1S6HAuTVf6b3Nuxju4jYAqJBnjvAP5c6uVtv4w2g5SxiKcLUNp7FAwxUsCBs
 DzN7LZVobzd37UrjsgcbM87Pd0xFxTDnyS0U9GsmnAe9+w==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-nf36.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-nf36.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759695735; 
 bh=DRH7iMOTbuY1/iWEix7sZhqd6n/2Tw1ybJZR6DrwRcU=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=e8mDM+BRqPX/JW1sdUDle+SOIsijH+eny/5Tb6RSpIxYa90fnaO4tiu9eAvlJbS1TDQNNaxy3/
 2r5Hgr5265JgjXt5WAlXnyMNavUb/hz8LoyeEkhgs5Cv7B/L4L98HkUokOwS2wn64OhTXelmF9
 7aWAk6sVE7MRVbMmqzRC6juLnrX8iIHYuNi07yZJ3YXw9nVt8rY/1n3NbiCKkFWrKAKpbG6FKr
 L3v+egy61YoRCGDRpxSIs9HdFP6ww4J/1AyXX0z6t+ukQen3vAHX45sehDZj9zQl64GAxvRkaq
 Gp986B2aBF2oAiCOqkS5uDRHlK009zspuC0Zmj12Hp5IMw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=kdy+0w++K99irbhKozpIsd52YcoplzuImJedZzCCHOA=; b=hPg/jzOHU5p/tJ/2C8f5DKMkDu
 En9u4mwZ88mIGWMJpYFqvqRAIysCuF7EmMdKNBhxT2EEyh8KOWG9m3TTMq5nl6pzEJ95EIn9K4rP6
 kZuZPRM8d3mK0ptvMWlCwCOBmxHv91qx9tA0Y2o+qN5QA6osXzFWmtwOGLoS0vCQm1Ms=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-nf36.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v5VFC-00000008Izj-3k76
 for dri-devel@lists.freedesktop.org; Sun, 05 Oct 2025 20:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=kdy+0w++K99irbhKozpIsd52YcoplzuImJedZzCCHOA=; b=brOnScoFUOdb5rfvddxtf6dIzJ
 QHcTzeakvVQYLUxz/aozGCByYNUlSmwYcGNrBEPBwWTVl747lsY0UqnsCF9bL4zP01z00z+BoKYYm
 jcbWemFa9JSI/loZJEGm9J2CmQglfzgg56OW+PWTr7smY/sRT8QLpB5jTxfCMbYFL4DQ=;
Received: from [87.16.13.60] (port=64461 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v5VEw-000000001im-3ajW; Sun, 05 Oct 2025 20:21:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 05 Oct 2025 22:21:36 +0200
Subject: [PATCH 3/3] drm/log: avoid WARN when checking format support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-drm_draw_conv_check-v1-3-9c814d9362f6@valla.it>
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
X-SGantispam-id: 509aa86eedfef6d02a4642c14ae57d08
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v5VFC-00000008Izj-3k76-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nf36.prod.antispam.mailspamprotection.com; 
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
drm_draw_color_from_xrgb8888() while checking if a color format is
usable. This avoids a WARN in case the first format is not usable.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 1d6312fa142935fcf763381920ad889ca4cf4b27..4ba961e445e576d03cfb58953eead90d32b40151 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -785,7 +785,7 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 {
 	if (format->num_planes != 1)
 		return false;
-	return drm_draw_color_from_xrgb8888(0xffffff, format->format) != 0;
+	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
 static void draw_panic_dispatch(struct drm_scanout_buffer *sb)

-- 
2.51.0

