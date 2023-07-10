Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A474CE27
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7252A10E1C9;
	Mon, 10 Jul 2023 07:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBEA10E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:22:03 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzwRs1T4ZzBHXh4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:22:01 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688973721; x=1691565722; bh=Gh6EO96d1xAiEk2mS1BrOEBqriM
 6TGQNOsWTpVDRBTg=; b=bcXuONgPFCFhEmvNus1glrMHcK66koNeg5ekp7gM+N6
 aZ9x8twCxrYlCoAZorB9cSE99YIec0JNogEP82wX1o+lQ280CpViL8yEEVh2Wdng
 pOKBoOsszwt+zz5XOa8rnNREz+ENXGrFCmZ1ke6twa5kwg/2kleoa4SgIcCP5kFI
 TKJFV/l0jwrIlK6cCEXH+PcsQuzBheqpXnBkhsNsirIolDCHbmg4WITFFrGg39Vu
 dU3H6YkvvmFj+QxE474BnnXTypk/1n77sCPzKv91yDxq6OzZewrQIVIJ0bEmqgF7
 qSkBdqH+4bGUbcm3n0J12bMHRfTpsnS3AGyOW2HOmAQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RT7_q9gfxbfE for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 15:22:01 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzwRr6QXYzBHXgs;
 Mon, 10 Jul 2023 15:22:00 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 15:22:00 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/pci: ERROR: "foo * bar" should be "foo *bar"
In-Reply-To: <20230710072012.54076-1-xujianghui@cdjrlc.com>
References: <20230710072012.54076-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
index 6be87ecffc89..bc51987c5f5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
@@ -147,7 +147,7 @@ gk104_pcie_set_link_speed(struct nvkm_pci *pci, enum 
nvkm_pcie_speed speed)
  }

  static int
-gk104_pcie_init(struct nvkm_pci * pci)
+gk104_pcie_init(struct nvkm_pci *pci)
  {
      enum nvkm_pcie_speed lnkctl_speed, max_speed, cap_speed;
      struct nvkm_subdev *subdev = &pci->subdev;
