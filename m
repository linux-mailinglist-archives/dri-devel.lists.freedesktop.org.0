Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74BD254D2D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 20:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EA16E2C8;
	Thu, 27 Aug 2020 18:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18BB6E137
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598553462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=GIOyNKn4lpZbuj6L4tBDqNoHcELuwP+YTy/cWEhcVsA=;
 b=IOriGMUYT+Rzk6245FvwBD5s7m3uRl12iWz+ZyKeypjSC0zPkSKhbO3Ky4BGAWOmSXtmf6
 f0nMUrbdZ93YyTVB/reQU4dTb77+fQuMMELMlDi8wcoyTY1ODDbFjAKF+sppDjhQRpl9jq
 Wvgwn2PCYzEAfys6pF2im7GmTWHJY8k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-WnrNXSlnPC2waRDdbm56cg-1; Thu, 27 Aug 2020 14:37:38 -0400
X-MC-Unique: WnrNXSlnPC2waRDdbm56cg-1
Received: by mail-qk1-f199.google.com with SMTP id e63so5620207qkd.14
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GIOyNKn4lpZbuj6L4tBDqNoHcELuwP+YTy/cWEhcVsA=;
 b=ABe5mrDaQXGlxR4lZrEQyul15pOaKqNBQIlr8kaQYHImuXZEcQvDINhOiRRLCKJ0jW
 uzT/GnNOqBiwkOlaS7W4/SbpcLJJ0TWegtFaTePjwiJ1mPEN1o29wCrjYRINK1rHgGid
 1L2EHKEjehPGQkyquuFk2Abx7KXMaaAZY8tVLqUwSm3ULiHLyc8FnEjtel5NLbFVcOm+
 pbHvVwHX7m0lbCFiAXE4K63NYDHZKfGHIysCH8B5UqE3x76naCCLFoT1BC+LWoChl81m
 RcYa8Cb/6JW2BUbmxuErZ0+gl3C2zuMRMUJSxuZo5vRA0eArgZBxtSdMTfQZeyBXiIXj
 rPCA==
X-Gm-Message-State: AOAM531IAdwcwAeD3Pbp2s/lM1EuL25iLOddWpgo8HF1IGybkvvqH14p
 E0O6q+lQqHDxNrNx98i7SksGynsctah6B5RfdNC9bFgh974kSWb8te9T1Z2P4tcY+cJYOPb/GRG
 Y47ox53lCowEYly7ttycoH3/aHtx4
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr20255260qto.187.1598553457827; 
 Thu, 27 Aug 2020 11:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXdvN0a05gbC1rP9FvdO3i+S9AkoKl/LGZWrmmNmYELI9HeqKh23RzqUkEBrEfpUvhGucamw==
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr20255172qto.187.1598553456580; 
 Thu, 27 Aug 2020 11:37:36 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x28sm2362305qki.55.2020.08.27.11.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 11:37:35 -0700 (PDT)
From: trix@redhat.com
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: remove redundant check
Date: Thu, 27 Aug 2020 11:37:23 -0700
Message-Id: <20200827183723.7767-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis flags this problem

hw.c:271:12: warning: The left operand of '>=' is a
  garbage value
    if (pv.M1 >= pll_lim.vco1.min_m ...
        ~~~~~ ^

This is mostly not a problem because an early check in
nouveau_hw_fix_bad_vpll()

    	if (nvbios_pll_parse(bios, pll, &pll_lim))
		return;
	nouveau_hw_get_pllvals(dev, pll, &pv);

shadows a similar check in nouveau_hw_get_pllvals()

	ret = nvbios_pll_parse(bios, plltype, &pll_lim);
	if (ret || !(reg1 = pll_lim.reg))
		return -ENOENT;

Since the first check is redundant, remove it and
check the status of nouveau_hw_get_pllvals().

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/hw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index b674d68ef28a..b96c5628c33b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -259,14 +259,12 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
 	struct nvkm_clk *clk = nvxx_clk(device);
-	struct nvkm_bios *bios = nvxx_bios(device);
 	struct nvbios_pll pll_lim;
 	struct nvkm_pll_vals pv;
 	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
 
-	if (nvbios_pll_parse(bios, pll, &pll_lim))
+	if (nouveau_hw_get_pllvals(dev, pll, &pv))
 		return;
-	nouveau_hw_get_pllvals(dev, pll, &pv);
 
 	if (pv.M1 >= pll_lim.vco1.min_m && pv.M1 <= pll_lim.vco1.max_m &&
 	    pv.N1 >= pll_lim.vco1.min_n && pv.N1 <= pll_lim.vco1.max_n &&
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
