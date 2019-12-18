Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304E125C6F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F26EACD;
	Thu, 19 Dec 2019 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273F6EA43
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 18:51:14 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47dPH55yGKz9vYfN
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 18:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnrRtUnOWA7I for <dri-devel@lists.freedesktop.org>;
 Wed, 18 Dec 2019 12:51:13 -0600 (CST)
Received: from mail-yw1-f72.google.com (mail-yw1-f72.google.com
 [209.85.161.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47dPH54k7qz9vLGj
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:51:13 -0600 (CST)
Received: by mail-yw1-f72.google.com with SMTP id d198so1987936ywa.17
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd6UJcISaPgTLxWAEQqv3WsIVtgS/8v211iCZDbirks=;
 b=OeidzQtsDhPqS8rXFpiUUv+POzrIjF6I80/LtumbihVUO1dW/A0GVNTp2YD9Mvwfbl
 +2nhIhLtOaWSE5H0DuaWh9fHiNPdNmT++hhI7fuHIl9K+0tqjNawsXfmK1BGw/05SXd8
 jgWQpxpTQwHMnVjJc0DQmpFKE7mh6Vgsd6n5fJDns8mH4LPJSTw7MKRZWcwhPdzZ5kQR
 3CEaRrsye4tpRXSbg60TG3qpfLIUrNJhKGFM6n1viFEtE0CsaqYkh4sc/6MqF6PvpLbp
 OKlLq4poZKpOizq9iPMVrtQ0L01hf1Lae/gCeP9X4JreL/QwXZSoFJoB7XlOeU58nky1
 77kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd6UJcISaPgTLxWAEQqv3WsIVtgS/8v211iCZDbirks=;
 b=e6CoBoqQzlXnn1RIejVxBlc2ZHbbMej4ub0z2lE97yOH/ccxxnNQdjc8kS/6WUlJp1
 qe2EWnxEU5UqW1bX9lkV5mVJdN49+SpWylG8lSElevdBag7o/mn/fprlZQ5Oglo0eJJz
 NgqWSHksS3i1mH/HPee2HjAKmyBFuUoDfFzw10FbuWtpIgvva5VCOcqkxKXO3tNPKb9/
 3fobeqEy+JM05VKSFbM9sG8IhUjWeuF0HhPcVkFIfeSggkz+UarSJ/Ikc1xG+rDDRbJl
 hgdAqN3q83NZKWMrQyvDPMAqC2y1tw+XV1LAhsFaFG1WBiefpn30/dB5eIfcRU3pIpoL
 HtBA==
X-Gm-Message-State: APjAAAWU6i7BN5/u+ECIspEBwlhtQuKk5UdHH0KCp8mExXRlmtDzvbAZ
 sV9ZntEUKJjCCCWpQcoWQP616jcUljW9QMUPPV4CaPhmfPo2BCnZqFMNitXpf4KnkMAcmYAW0BG
 S096fLW/mFaCu196IVCtwjIWtDq6bqc1k
X-Received: by 2002:a0d:d4d6:: with SMTP id w205mr3137295ywd.366.1576695072489; 
 Wed, 18 Dec 2019 10:51:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsZKX/RL+tjcXAqAVDUPxweVVSpnSIWxCrF+ZgDct/WJffKYv83avuE0gaxi/NmW2sUHifJg==
X-Received: by 2002:a0d:d4d6:: with SMTP id w205mr3137281ywd.366.1576695072283; 
 Wed, 18 Dec 2019 10:51:12 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id g65sm1202882ywd.109.2019.12.18.10.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 10:51:11 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/vmwgfx: remove unnecessary assertion in
 vmw_resource_alloc_id
Date: Wed, 18 Dec 2019 12:51:09 -0600
Message-Id: <20191218185109.23671-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every caller of vmw_resource_alloc_id checks if id is not -1. The
assertion in the said function is thus redundant and can be removed.
The patch removes the check.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index c8441030637a..50c8eb8012fd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -183,8 +183,6 @@ int vmw_resource_alloc_id(struct vmw_resource *res)
 	int ret;
 	struct idr *idr = &dev_priv->res_idr[res->func->res_type];
 
-	BUG_ON(res->id != -1);
-
 	idr_preload(GFP_KERNEL);
 	spin_lock(&dev_priv->resource_lock);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
