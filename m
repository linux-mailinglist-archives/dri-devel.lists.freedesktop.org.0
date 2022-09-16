Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D65BB096
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 17:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4697F10E3FF;
	Fri, 16 Sep 2022 15:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BBF10E3FF;
 Fri, 16 Sep 2022 15:54:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bj12so50294872ejb.13;
 Fri, 16 Sep 2022 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EuWFWN26twjl6pnBL7u1oZiY5YRuiq7q1++u96G3pgY=;
 b=EoQJiVAYTrd4M3+DKqSvM9nCwEIljCqrB31LX/Mf3YTd9IN1mXiqpwdfmYb1HmzhSF
 hBXK9YQ4RNqyZzeDWzGuAExSL8cI7LfiyjoHgtvsnZmoTCP0xOrpNd+c46PDGFtKDrft
 arPkvo2nWfkQBevvVRQORFApZ7E1ncEhBKau6WEfbADES93CreFsNJaTUq2Cb3uUhb1G
 MoF0+YsZKJ04z84ZAfyGHcwhZIYZEMzvjx+l2SfhjkDO4OLQpIXjsNG684fnZ9HP5Y2z
 PBq0MP9cq0SS8L/cQGrLrtmJHJZCn04wDe3dVYkHhYn68gk8mi9PfgIMl7NNv8ut9uTM
 jIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EuWFWN26twjl6pnBL7u1oZiY5YRuiq7q1++u96G3pgY=;
 b=HcXQpTwiHBqNTnMrXCjjuDw9e+nX3KykB/IxW0pAnODYhlqcEUmTWiEeXt7/XIJeXw
 cQA/gX9uZyrzxj5NVUTkpoMAS/Fc3F0SC1bLN6dE5ynt+Q1C7E+ZC2ZKs/okPRg5zRej
 FsZaXXH26tMVjTSUrEIXoZ3fI9nkkfI33t3pjXhVKGlPXiZzsKhuKR90LdqCK+eL+iGj
 KRVFhsdh1ST9tFnr0KwhA20H7kkdweGRyKMVbF3gbWAO+OO/qffcpLCElIbt5QWZJWAw
 LfRIBeMAl3NXVGJb6QxhU8unSHF1h48G1wvSKnngeS8ZDUyjT1Vz3ssw/Uqj6Kj3xpfL
 ax6Q==
X-Gm-Message-State: ACrzQf2Oc3xat3DRYbnOE76F7g5MtFVmX7zktPKDSfqEILXYP9kXSXcM
 n5B17LvfS1o4sL/sQg1g8UfRDyT0ryutbMdrYjspTHxfJsv1oDz0
X-Google-Smtp-Source: AMsMyM5S2RFtr9n8n8rdNH6foyfaJk78kYuOTBmn+L2hXS5/Y0XV9NEVfOYZSy1QOWTfM/qwcuFWq3lkxQaCptutRsM=
X-Received: by 2002:a17:906:8a77:b0:780:a02d:ca4a with SMTP id
 hy23-20020a1709068a7700b00780a02dca4amr2848192ejc.488.1663343694459; Fri, 16
 Sep 2022 08:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
 <20220907030754.GU1089@zhen-hp.sh.intel.com>
 <CAJedcCxO_Rq0qMeLiHtY5+FuN1A1pDGsZd3gMtvUpm1xbAK3aA@mail.gmail.com>
 <Yxmzj2nCoTKurCY8@kroah.com>
 <CAJedcCwVC6Rg+wF7h6GhFvL6BGkKV=DS9Mo9fOf-gfDAk9VqPg@mail.gmail.com>
 <CAJedcCxRQ4h-ChNsD4OWpDMUJd3JNaQrvD=uVKxMpYONGFUgzA@mail.gmail.com>
 <YyQzDlM5n7mOLh5Q@kroah.com>
In-Reply-To: <YyQzDlM5n7mOLh5Q@kroah.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Fri, 16 Sep 2022 23:54:42 +0800
Message-ID: <CAJedcCzt_1ZRV5egMLdoFVZ4hBDE+nDu9fLkBuGY0A=uYicvQA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 xmzyshypnc <1002992920@qq.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From afe79848cb74cc8e45ab426d13fa2394c87e0422 Mon Sep 17 00:00:00 2001
From: xmzyshypnc <1002992920@qq.com>
Date: Fri, 16 Sep 2022 23:48:23 +0800
Subject: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry

There is a double-free security bug in split_2MB_gtt_entry.

Here is a calling chain :
ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.

If intel_gvt_dma_map_guest_page failed, it will call
ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
kfree(spt). But the caller does not notice that, and it will call
ppgtt_free_spt again in error path.

Fix this by only freeing spt in ppgtt_invalidate_spt in good case.

Signed-off-by: Zheng Wang <hackerzheng666@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..550519f0acca 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -959,7 +959,7 @@ static inline int ppgtt_put_spt(struct
intel_vgpu_ppgtt_spt *spt)
    return atomic_dec_return(&spt->refcount);
 }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int
is_error);

 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
        struct intel_gvt_gtt_entry *e)
@@ -995,7 +995,7 @@ static int
ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
                ops->get_pfn(e));
        return -ENXIO;
    }
-   return ppgtt_invalidate_spt(s);
+   return ppgtt_invalidate_spt(s, 0);
 }

 static inline void ppgtt_invalidate_pte(struct intel_vgpu_ppgtt_spt *spt,
@@ -1016,7 +1016,7 @@ static inline void ppgtt_invalidate_pte(struct
intel_vgpu_ppgtt_spt *spt,
    intel_gvt_dma_unmap_guest_page(vgpu, pfn << PAGE_SHIFT);
 }

-static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt)
+static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt, int is_error)
 {
    struct intel_vgpu *vgpu = spt->vgpu;
    struct intel_gvt_gtt_entry e;
@@ -1059,9 +1059,11 @@ static int ppgtt_invalidate_spt(struct
intel_vgpu_ppgtt_spt *spt)
        }
    }

-   trace_spt_change(spt->vgpu->id, "release", spt,
+   if (!is_error) {
+       trace_spt_change(spt->vgpu->id, "release", spt,
             spt->guest_page.gfn, spt->shadow_page.type);
-   ppgtt_free_spt(spt);
+       ppgtt_free_spt(spt);
+   }
    return 0;
 fail:
    gvt_vgpu_err("fail: shadow page %p shadow entry 0x%llx type %d\n",
@@ -1215,7 +1217,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *vgpu,
        ret = intel_gvt_dma_map_guest_page(vgpu, start_gfn + sub_index,
                           PAGE_SIZE, &dma_addr);
        if (ret) {
-           ppgtt_invalidate_spt(spt);
+           ppgtt_invalidate_spt(spt, 1);
            return ret;
        }
        sub_se.val64 = se->val64;
@@ -1393,7 +1395,7 @@ static int
ppgtt_handle_guest_entry_removal(struct intel_vgpu_ppgtt_spt *spt,
            ret = -ENXIO;
            goto fail;
        }
-       ret = ppgtt_invalidate_spt(s);
+       ret = ppgtt_invalidate_spt(s, 0);
        if (ret)
            goto fail;
    } else {
-- 
2.25.1
