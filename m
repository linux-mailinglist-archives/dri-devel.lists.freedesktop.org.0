Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500D50A2E1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179C10E5CE;
	Thu, 21 Apr 2022 14:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111C10E5CE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650552196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ePPTKrCMwADglYVO5peeQ4QQVf5OFLO0wZ8LDZ1O6g8=;
 b=aXWgJ2aoIt1bqE9O9vEi9cV/N+G6Ze72TBxP14ydES+gWE66VTiSkCOdwHRgL6S89iYxjI
 +O8CaJugJ3QW4sCHpJaT23/toiu1CzhjRTjHYDZ1tWRm2FwFdtKPh9g4idOADKwBu48B79
 UMtxdpSscZzx94winbYIQT863wAR+qM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-jG4pGXUfM0O5BOqxcrG_Uw-1; Thu, 21 Apr 2022 10:43:15 -0400
X-MC-Unique: jG4pGXUfM0O5BOqxcrG_Uw-1
Received: by mail-qk1-f200.google.com with SMTP id
 c8-20020a05620a268800b0069c0f1b3206so3423986qkp.18
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePPTKrCMwADglYVO5peeQ4QQVf5OFLO0wZ8LDZ1O6g8=;
 b=ifHYfzlJRgGFHiHbqeOduOPayYynyrglafC1gtqbmWvJgZpVjSgkSoD0guJlK7QttU
 y1Hs86zeV5/3pZiQXpemw1EOWyThCg15aAqdLiAzw5w453aURbXDdTadgqTxYygnVrM/
 inXa1PtnryGS/ai2Bw+s2czS5ZHLqEaDqD+xPR/N7YHtQykyHbvxOVV+Xi0meh86wTtL
 K/no7cGqdC3LpcFjPYIqUr8myo2F2FtgTItnv903XMQ9K1UYq8qLTC4+us3nFxutYmnI
 vl55luK4DlPR0TqyFd44+njm6/Uup/VOHEgREtY2WImMuKaSZgqTDqQGgjYv36k+wXnr
 0RLg==
X-Gm-Message-State: AOAM533ley8arq+ho66Qk4p7BScIVdAQOpVoDimR1O5mVM0p64r0WWdo
 Y59GlXTmOHWxBMQGzMtDdRzAAmUBJPKB4sX7pmSyhJ0bmQMCH6hRNd2RJwAcIkodhgk6m8+PyPV
 8n29egQ+NtF6BWjAoyi4shhevCC7e
X-Received: by 2002:ad4:5bc1:0:b0:42d:758c:f694 with SMTP id
 t1-20020ad45bc1000000b0042d758cf694mr19026797qvt.99.1650552194936; 
 Thu, 21 Apr 2022 07:43:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2jn3q9z234SvBuh9QXKIyb+5gtFlLQqL5BZmnHLuyhZev75JSd04yeLJ/gjoODjM5Sghq+Q==
X-Received: by 2002:ad4:5bc1:0:b0:42d:758c:f694 with SMTP id
 t1-20020ad45bc1000000b0042d758cf694mr19026774qvt.99.1650552194715; 
 Thu, 21 Apr 2022 07:43:14 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05622a138e00b002f335c3dbf2sm3538660qtk.37.2022.04.21.07.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:43:14 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: cdn-dp: change rk3399_cdn_dp from global to
 static
Date: Thu, 21 Apr 2022 10:43:04 -0400
Message-Id: <20220421144304.586396-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-rockchip@lists.infradead.org, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
cdn-dp-core.c:51:20: warning: symbol 'rk3399_cdn_dp' was not declared. Should it be static?

rk3399_cdn_dp is only used in cdn-dp-core.c so change
its storge-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index d3e6c93739bf..ce67c9daa2b1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -48,7 +48,7 @@ struct cdn_dp_data {
 	u8 max_phy;
 };
 
-struct cdn_dp_data rk3399_cdn_dp = {
+static struct cdn_dp_data rk3399_cdn_dp = {
 	.max_phy = 2,
 };
 
-- 
2.27.0

