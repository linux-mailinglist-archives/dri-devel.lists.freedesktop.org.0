Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022642A5C1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E5789C37;
	Tue, 12 Oct 2021 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAE389C37
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634045621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MT+WGN85virsYnfaWkabBnlRhl4BVNJstj9q0qW4GvU=;
 b=eoZQNTOi+nVo5gkdDPNREj5OyhvHPj1PPGtzQqhN7VxGE3hU1WUg7q7Ibf8h39OW5+OuTC
 CDRc9HdcSNOrIZh6wu5YBI9JV7QLxBadLbd8jh8fGXDkqR+V9hJZ1bpgCi2lRnXsfNRneH
 9GlLktySzMA5GtC7EDxhoySzzzGJFSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-RBUgYFH9O_q5mZZv5hxddA-1; Tue, 12 Oct 2021 09:33:39 -0400
X-MC-Unique: RBUgYFH9O_q5mZZv5hxddA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso15721977wrg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MT+WGN85virsYnfaWkabBnlRhl4BVNJstj9q0qW4GvU=;
 b=gFepKzmuoKfmVmjhHvMdiJT59koJIf+6LUdp9JprRTePMwWzi3BCm12rrJTj1+3ATD
 93DuZO7aQFFzk+U+iLnfUq4hm2Fipv0ElGTXq1PGgmQJwuYW/RRgkBodEWevuw+fBEGW
 bq/86MXdJrsYn9AwUG/fFoN085nomT2nh/e3q2dDq0lLFxwZpiMjHrCvh/PUVaApYpcL
 Tt0GjoBlLHVFqRVS6WgI7qM/gmkgWvug6NLH3AMobevfiGS50hIkZWA2pgxbX4A2EJwt
 3Ql/O1PHAMfuNpud2sbc5fFHeioh7hftxFwS4jbMEVWSRDZqDxugSYnoOT898xB7MQCT
 sBHA==
X-Gm-Message-State: AOAM533fioXcSy1cgSZXge8udVR8qj0I2mdPUIFAnaZrxTfmlzUU+7f4
 hfWXOI2wkQL9leaBuFgpTeoHH3RDIIahUqMj/Qoe9UUWYrCIlV2qMXoYAdnTraPl2Mj8i7eNKPA
 cpf+Ney6zt0JOZ5w2xGns7e8xaH3R
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr5550798wmq.79.1634045616528; 
 Tue, 12 Oct 2021 06:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhDxKhOlvfo/706pxslzpu1FHeBx94YPhwo2SnElkp9WJha5oN/R8hfR1LOXibQ33TMS0vwQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr5550783wmq.79.1634045616303; 
 Tue, 12 Oct 2021 06:33:36 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id q204sm2656305wme.10.2021.10.12.06.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:33:35 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 DRI <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/mmu/gp100: remove unused variable
Date: Tue, 12 Oct 2021 15:33:34 +0200
Message-Id: <20211012133334.1737918-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Fixes a compilation issue introduced because I forgot to test with WERROR
enabled.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: DRI <dri-devel@lists.freedesktop.org>
Cc: nouveau@lists.freedesktop.org
Fixes: 404046cf4805 ("drm/nouveau/mmu/gp100-: drop unneeded assignment in the if condition.")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 2b21f43069aa..17899fc95b2d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -488,7 +488,7 @@ gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
 		struct gp100_vmm_fault_cancel_v0 v0;
 	} *args = argv;
 	int ret = -ENOSYS;
-	u32 inst, aper;
+	u32 aper;
 
 	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false)))
 		return ret;
-- 
2.31.1

