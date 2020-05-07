Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7511B1C93EB
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8A56E9F9;
	Thu,  7 May 2020 15:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AE46E9F7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y4so6811310wrm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOKVHQegB4DuiF6FAJRDUXMILu/YoG8Nfo5HpSFpDnk=;
 b=J/cUrPTNTTp/LF5ABqYegt1GfCaHIBG8RMRtqB/QyEf9Pt8XZOs+dvqoy4uN7iO3Bm
 9g7hd7EmqFBoVrKiBG7k5Sliw2wUAmuSoA6KyJg/T99eCQScnILcYZO3ELtUg77tQVfR
 vqB4NaoDCtK1VtV7W03UZZYJn/2aavRCoB874G+Hxs8caP8zXdsw3pq8FOK3RZ4in2ck
 qOYiSkUH1ZczBUD0IeZ86ufrws74sUfLB4Ji5EitbaKEwLbqht7sttcpnMUm+Fw1Tchc
 Kmz3VgzJv6x79/Zqbb7fdfguWEkA5p2nmGqQuKoxHTS8J1RjdyCwC4HWeIW9U2rJsDwV
 /8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOKVHQegB4DuiF6FAJRDUXMILu/YoG8Nfo5HpSFpDnk=;
 b=KS21/5dpnE7YilbHRCT7FA9zku5w2u0O0FzvXVBaq+YKaszDx9LYVvf2Gsv8hLofEW
 rb/7MilAnlezQ8MsFF111RwQtQvWJ9UdM7ddFjIURoTf0gMLxi75dJDmhEjXmt6F+CAo
 L49SYT74NdFbN9NkTJj2UGgdGaaDT75Y61t4x8VJbvtsjPfeT3jzOCl+6Gvh47kSn2h7
 r3p5MArNWr0JJOVQyEBB4z9dSfdMHWZKlcAho6bQL0JRzj86/i9b6tcAGHI7+7MgRKbz
 dHQLD1yoEvqgAmWpmJcoUPEknfKh4+0GB5he33BZJra5Tp6cXpay0UKR6ZU3QSsOZxm5
 ym5w==
X-Gm-Message-State: AGi0PuabE+1LU9PXKR8Wu/CfQeeifUlMr7KZZnRNmKXf8aPtLfpeXepu
 1tcDKOGaGb6zt/lOps/b2I5+Vx2k
X-Google-Smtp-Source: APiQypJP6Nob9Au0ZF1RxPooKsvmIpIDYM8zjaNPF5L98qOe+t5O5wy+iCioYM1AIlMCbADYmWGy9A==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr15635705wrc.24.1588864256021; 
 Thu, 07 May 2020 08:10:56 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:54 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/36] drm/doc: drop struct_mutex references
Date: Thu,  7 May 2020 16:07:50 +0100
Message-Id: <20200507150822.114464-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

There's little point in providing partial and ancient information about
the struct_mutex. Some drivers are using it, new ones should not.

As-it this only provides for confusion.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 Documentation/gpu/drm-mm.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 1839762044be..5ba2ead8f317 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -178,11 +178,8 @@ GEM Objects Lifetime
 --------------------
 
 All GEM objects are reference-counted by the GEM core. References can be
-acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
-respectively. The caller must hold the :c:type:`struct drm_device <drm_device>`
-struct_mutex lock when calling drm_gem_object_get(). As a convenience, GEM
-provides drm_gem_object_put_unlocked() functions that can be called without
-holding the lock.
+acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
+respectively.
 
 When the last reference to a GEM object is released the GEM core calls
 the :c:type:`struct drm_driver <drm_driver>` gem_free_object_unlocked
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
