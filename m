Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF514733B1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2710E834;
	Mon, 13 Dec 2021 18:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC5410E82E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:11:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id p18so12565528wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=anky/pj7/rcmax3ozqQQ2mqz0Ex4H2mV+LKwnahctPA=;
 b=C6Ksw4ZmqTccE99SjXGbEk3og3sAvMwKdQENu5l4qeq7vt6NrZtM6kQqobQj3FClPk
 eqg8aPYhegvZ2AsO/kk9ZcV21cX4u4pXU3Os7anXkoFvbMpLzkcIiM15QX6ynmQxs+mX
 vNHTXSgz2G7rNm2L/tnwB9qI4k7MPYLHBG7J+ay5J6+i7LuXAV1T/Z6pkbHYdW8xQace
 +kX1SxObYd1bmM7Oo1ikya0GqneMIquWMPoVvDCC6NnMZwfaIAfHVg37jwrJC+GfED89
 PXQKql2/LqJs2Sp/kGnZq3aY8MVyCLPRM7H/AtEjAHtSZlYay/EgwpY2umLjCSpuXRcz
 uHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anky/pj7/rcmax3ozqQQ2mqz0Ex4H2mV+LKwnahctPA=;
 b=ZEOlvGuNxgpOhghZsj+pJl2GdcGWRRXUG+4fGmiUHSF7Q+SE18Ji6qlN1AbsOKZoDv
 BWch17fHL8V9XzuoCjGGtAcKDk9uvMffnkbyFSdYnGfRoEXlYs+eY2/yTpFG8tJIMUhM
 Fcqn30xX1tD74TBNVvWNn1F0hQ/EZGI+vbxl6UO/ZZQJZ6znCEga3ywKrOSvUAAkfr0A
 i5MJjj2AcpX50S7WT2PmkoBWwW5Zk7KQsSxc7JV+MmgeH2Y4fV2npIW17iD4zptogLXD
 zt7niiwXVGr1LL4LzjZVMfpkDk9ODmttfNN5aanVQTW8bGyJ2QuemAkd2R0SrsMNrm6T
 74rg==
X-Gm-Message-State: AOAM5319tmG7te5fy9cC9WyL7evLgtiPh9s1ulHBU/k1VyK6W0h4mFGw
 3ZZock0r60jBnoBvlkhYWuc=
X-Google-Smtp-Source: ABdhPJyoyFlW4lEPr6DsCtti6saUfqve3Q+d0k+LKKOlrYyVg9C0Nr+BYqJy0BUwrdTzoJLvxrMYxA==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr321247wme.72.1639419101745;
 Mon, 13 Dec 2021 10:11:41 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id t127sm8750956wma.9.2021.12.13.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:11:41 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 3/3] drm/vkms: drop "Multiple overlay planes" TODO
Date: Mon, 13 Dec 2021 19:11:31 +0100
Message-Id: <20211213181131.17223-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213181131.17223-1-jose.exposito89@gmail.com>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

