Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7E487C32
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 19:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610DA10EB91;
	Fri,  7 Jan 2022 18:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECF310EB79
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 18:28:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so3234131wmn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 10:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=urda7dukOjrduEUTaGt81lKPi62bFg/eZfAHEnqnCIg=;
 b=gloVyOKLDM2n1melDN1jmsJswfStK3ckg1+saVhwtTmTctR15QrSoAldJg3BvggjMu
 EMSAhEHWrUUJIcmNO8eUXXpPdhcs2Q9TEDoV9A8QUCZaJ06i71G2ecpm9sgzwZJOeaao
 +cFOXqdTWRSJHR9nRxw5VwK3WDU3tj2LyVZEmRtE2jcEukXEp2wFW4qex3Ghd1AC9V36
 20Oh2t76aZKkViz0LnwkcYHrAMnZ8P0jozlv/QPJfjPRkk3fS92i9S4IH9SFY/JQeP/r
 eC3dmHvrUmsm9ZCqGjhaWR9T1y6WOan8BCKr5WM5KrlBcMFOi4CDtmTYy9mk6WZFRF8Y
 Tx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=urda7dukOjrduEUTaGt81lKPi62bFg/eZfAHEnqnCIg=;
 b=6O731IFuUqEVOF+1a/N8LGYT98N5WlwyLxrRnK2n5NXmk7DGxLDXC/7ba+sPxUV3GA
 KbFahaxnYS/injEb0heAnz9q0jgXAKTjhobphdsKQbvm2opoazxqXPgoeuyr//cLTTBj
 oo0ogu8yacsO1vmxTWcO3hvo052tA+4mbNPO+DomDnfP0cp2ck9pq3m06mvR1Myogp03
 tb1pf+iO6AKxvJqSPJOJyiNxudTrCDihx+9MaSGLXhKboKLt2eRfJaVq38O+0oCd8NRQ
 yfVuN+qS5qqeMdP91nf6uEosskAQnN7YTFQ+YDV9lGAexLq0y6BYHNX+VkfGXctQUDK8
 GGTA==
X-Gm-Message-State: AOAM530wfEWl/YpA011DhzD6+wkWNhNEPcBc/foTqY2bPpbuciTfWEUN
 j78+KYjq1U+edFi7nxCgR5Q=
X-Google-Smtp-Source: ABdhPJwabAvd1EH2SexXZ080BbdJeepu7hHYBJaMGKOUOUGw2xitoVaOt2tkFDvBpxPtS8ZgYEQ3Qg==
X-Received: by 2002:a05:600c:3d8f:: with SMTP id
 bi15mr12037071wmb.172.1641580095018; 
 Fri, 07 Jan 2022 10:28:15 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p62sm4913499wmp.10.2022.01.07.10.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:28:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH RESEND v2 3/3] drm/vkms: drop "Multiple overlay planes" TODO
Date: Fri,  7 Jan 2022 19:28:09 +0100
Message-Id: <20220107182809.141003-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107182809.141003-1-jose.exposito89@gmail.com>
References: <20220107182809.141003-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the task from the TODO list.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 941f0e7e5eef..9c873c3912cc 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -124,8 +124,6 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- Multiple overlay planes. [Good to get started]
-
 - Clearing primary plane: clear primary plane before plane composition (at the
   start) for correctness of pixel blend ops. It also guarantees alpha channel
   is cleared in the target buffer for stable crc. [Good to get started]
-- 
2.25.1

