Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3126855A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC06E1F2;
	Mon, 14 Sep 2020 07:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549466E2ED
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 18:33:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id q21so13759315edv.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sDdNABI91Tfr3hqKhoVLbPlEvPq5j5lfipsDHNaq4ik=;
 b=POua7IFvCe0e6K6KYqXq0wSmVk2tqbCN7sftakcwvJNpHX0YWSIhY+GoCljfJ7I85a
 4TjrNL9eFYYu82+CcAtWBegXoOq2YF0aCOYUldzXY7tyTzld4fgEXkuqPPpTpTNYMOnp
 1xxCjpKqHLog0AVRcRXJoisHzc6dygviNaZR7Iydf2rPC7KhdbwvwEtpA0zPJp31fNPX
 7sye9aW+jbSAuy4nufR2RvSzrugllPJUjN/1lSVihOPtB3/mMPvs9ve6zmhqJGYsMIfk
 bjp4PjbSBK4SXk4iUrxMcnOqwoBGa4lzz9DfHlq0J6UjZoiifd7GzPWKmfXvmhxmzXrk
 3Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sDdNABI91Tfr3hqKhoVLbPlEvPq5j5lfipsDHNaq4ik=;
 b=LUeqmo6NaMgg3s2AoBm8l0xWG3EV9fV6HcHIGrTUoXkYInaiPJDw+ftSddZC7MjWgH
 ZX77dtxioNy/6JVbLsd1+0okhvM3+pIoLQ0oyPq2gJrrBjte+iFJ362INloXDUXhPX0k
 03g9eQk1LyrFLhWqhT4GEM2i71c73spJdVLoiFlSh6OgqDVlIBqsWP+foo2Y29B4f3Li
 E0OhhGnG4sFERCGYaUoPoPP/CeM4pMbWV52RkzC9NnlsihpadLxZf3OwKdOPoP3jz4bO
 E9Kldk+hFbJj6xUz5+AzE0MssMZcetbcNU52dhnB3FJ5dgL+dils57Kk2gW4QJ77ngSd
 XErQ==
X-Gm-Message-State: AOAM530wNNHvByYvWTBa9R9MCWYglpdYizLP6clYyrFyZjlUs/8qnLB0
 AGenaVZRFbbOfHkUnoYOWHUkT9Ali0y9ZX/F
X-Google-Smtp-Source: ABdhPJxhXt41CHf1+Qod2riES3Z2vcmnrRmGcoecWnMBU11QIqnqWnaonf9eRAkhxYhvUjVqdDursg==
X-Received: by 2002:a05:6402:2c3:: with SMTP id
 b3mr9567811edx.213.1599935625874; 
 Sat, 12 Sep 2020 11:33:45 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dd9:a000:10b6:eb2f:be44:9365])
 by smtp.gmail.com with ESMTPSA id v2sm3589248ejh.57.2020.09.12.11.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 11:33:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
Date: Sat, 12 Sep 2020 20:33:34 +0200
Message-Id: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
does not mention that linux-aspeed@lists.ozlabs.org is moderated for
non-subscribers, but the other three entries for
linux-aspeed@lists.ozlabs.org do.

By 'majority vote' among entries, let us assume it was just missed here and
adjust it to be consistent with others.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on master and next-20200911

Joel, please ack.
David, Daniel, please pick this minor non-urgent clean-up patch.

This patch submission will also show me if linux-aspeed is moderated or
not. I have not subscribed to linux-aspeed and if it shows up quickly in
the archive, the list is probably not moderated; and if it takes longer,
it is moderated, and hence, validating the patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26af84f97353..f2561c3fc9db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5448,7 +5448,7 @@ F:	drivers/gpu/drm/panel/panel-arm-versatile.c
 
 DRM DRIVER FOR ASPEED BMC GFX
 M:	Joel Stanley <joel@jms.id.au>
-L:	linux-aspeed@lists.ozlabs.org
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
