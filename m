Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AB6B70F3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E810E490;
	Mon, 13 Mar 2023 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91A10E28D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 23:42:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso9755854wmq.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 16:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678664553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=la0p/jvvcd1pW9pC/kzK82qIi7c6KvzFPifjBlwZbrc=;
 b=aLZj8JfH0eQ7HFdZx/+iprS/tlBFopYdB1aCKQXTt5WK8FgM8bcDbsa+wSY1iKQJxE
 Sq7nlwxxzv+OkfrXORItUJ0aliFlsx2GYC4bVIbkqOdoz3XJ/8X+6UsBq/gt7H0EZtMt
 nuAc/KhC3rf0zvdcWc/OLcAHwR9ZY+peyrzGWB24fyZW1aAv3sBtA5JYpdpHACiwUM4C
 Zn2OTxsvJxQeZs50umFz+7v+OiiQaf/ZCNb2VEVVGtNQsaBRYYbpPPVuAQjUJokXjnKZ
 skXJHxntFAccCGCVcChxVjMizrL+8AfSuhDiDuW1ANf8qzQ5/J6eKWecB6/XPCdmkVUt
 dJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678664553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=la0p/jvvcd1pW9pC/kzK82qIi7c6KvzFPifjBlwZbrc=;
 b=St3Xcr97EiXsulnRyGenkwO4O/IVFZyzjqS8KmfU5dvUUMOgVcTe98Y59H9kUqi57y
 X5HlfJJJFqqvl+dxDDY+enPdgMD44y9en6Oh9DqJd9NsAQgMYOqVMgkqk3wJ0JvKAOUh
 K/0IKLAjPpaETQctE9+WBtwHr5/HTMmpAKM4Zkal8pyA+APJn7FUvsTT3WuZ6plgWufI
 yZcEWvrC3HT01vJ4eiIiIUagSsPb0D+oPRSFzMmB7aDD+/8/LVmxI/RkVFYvMUusZz49
 Cvxe2p3CVB9rLYYSGJfCiLzUc7vNK94lKJ0FFwWizRHCJGO3Tl/xjE9yxkiiPDJZv43y
 PXTQ==
X-Gm-Message-State: AO0yUKULOFZzChqzgK8SjxMAm1ZgHgJt6F+ymIvq+timgfgpzWx29klh
 DKxoN9jCyJW1n6oNWoTPNCc=
X-Google-Smtp-Source: AK7set91yp0phYi1oU83T07w5p/4LtduuFcFeFbpdusqdMZ60+SpKowFcXg2lljxmC60wI0iAyj0hw==
X-Received: by 2002:a05:600c:4e87:b0:3eb:38a2:2bcd with SMTP id
 f7-20020a05600c4e8700b003eb38a22bcdmr9079693wmq.28.1678664553621; 
 Sun, 12 Mar 2023 16:42:33 -0700 (PDT)
Received: from lucifer.home (host86-146-209-214.range86-146.btcentralplus.com.
 [86.146.209.214]) by smtp.googlemail.com with ESMTPSA id
 iz20-20020a05600c555400b003ed201ddef2sm3698376wmb.2.2023.03.12.16.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:42:32 -0700 (PDT)
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] drm/ttm: Remove comment referencing now-removed
 vmf_insert_mixed_prot()
Date: Sun, 12 Mar 2023 23:40:15 +0000
Message-Id: <db403b3622b94a87bd93528cc1d6b44ae88adcdd.1678661628.git.lstoakes@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678661628.git.lstoakes@gmail.com>
References: <cover.1678661628.git.lstoakes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 08:17:55 +0000
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Konig <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function no longer exists, however the prot != vma->vm_page_prot case
discussion has been retained and moved to vmf_insert_pfn_prot() so refer to
this instead.

Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index ca7744b852f5..5df3edadb808 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -254,7 +254,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		 * encryption bits. This is because the exact location of the
 		 * data may not be known at mmap() time and may also change
 		 * at arbitrary times while the data is mmap'ed.
-		 * See vmf_insert_mixed_prot() for a discussion.
+		 * See vmf_insert_pfn_prot() for a discussion.
 		 */
 		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
 
-- 
2.39.2

