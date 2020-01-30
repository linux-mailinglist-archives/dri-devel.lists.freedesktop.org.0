Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ABB14DEA8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 17:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506A6E880;
	Thu, 30 Jan 2020 16:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF5F6E880
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 16:13:45 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o11so3971273ljc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 08:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4r8XUSGw6ivgjO+/mBvfD4PO+GISzP68HY4vnWOvKeA=;
 b=ToWlwxMRaDVneeA47lRB0wtlnbsjvz/7hQwniurfH9FA93xrfvWSz6c3B2wCVpOGlh
 SIupCkSOSIKU0FfLgTck8zcLJHl8um4mQZSzkaE85F7Cm97ZAY5snhGDFvm5B2AMj5CE
 gJTZAMdlQ0k9Vdk9qe/4begUB//LU0tqv/K/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4r8XUSGw6ivgjO+/mBvfD4PO+GISzP68HY4vnWOvKeA=;
 b=UpVrbR5AfbaZb4ja4MvoQ7OzVpsu3WE8C/741nRgQL5QCgOc5JIT5zkF+Z9rMIfAe2
 x6ExK9+cKbJD1fDkq3LiqwxKYSrwlf3RtQXOWU4uHP30Ms0LhKcH0lG3JzLVjQvByn/l
 n2qfkpFxkrDSIMjxdg4923JKgs9wLyvSaT8y9CnPuspB38ljNIAQr2YKjJRZkUDzMU4E
 LqBOZ0s8HHZhqskGm9Bv4KkS1jHcBO9URE16sonLFcUcWnqXO0qYtKv5srlsF4s2kAzK
 ZaadL4OiVl2E1GW6TuW7bc71RRu5Y0fc/46c11hy4tPAG03g5b1A/nO3L1wc/iuuM0Hy
 KZqQ==
X-Gm-Message-State: APjAAAUNi7W5cxcEIaa4kRUorp+ra8YOZxePE2yY0DXrxXkO/FZfiw75
 eHFXpITlcPyBsYiaEvZ6mbHptP658b4=
X-Google-Smtp-Source: APXvYqxGbPABYZ4ajktmUtR6l3mvFOKuFL6p0jgWdbknl3xtYCBOqEICNPN7gsbS6ku2AKfkZ8CYLg==
X-Received: by 2002:a2e:b536:: with SMTP id z22mr3193010ljm.259.1580400823601; 
 Thu, 30 Jan 2020 08:13:43 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id z19sm2994502lfg.26.2020.01.30.08.13.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 08:13:42 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id w1so3988095ljh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 08:13:41 -0800 (PST)
X-Received: by 2002:a2e:909a:: with SMTP id l26mr3079293ljg.209.1580400821584; 
 Thu, 30 Jan 2020 08:13:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
In-Reply-To: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jan 2020 08:13:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
Message-ID: <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.6-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 9:58 PM Dave Airlie <airlied@gmail.com> wrote:
>
> It has two known conflicts, one in i915_gem_gtt, where you should juat
> take what's in the pull (it looks messier than it is),

That doesn't seem right. If I do that, I lose the added GEM_BUG_ON()'s.

I think the proper merge resolution does this:

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index f10b2c41571c..f4fec7eb4064 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -131,6 +131,7 @@ static void gen6_ppgtt_insert_entries(struct
i915_address_space *vm,

        vaddr = kmap_atomic_px(i915_pt_entry(pd, act_pt));
        do {
+               GEM_BUG_ON(iter.sg->length < I915_GTT_PAGE_SIZE);
                vaddr[act_pte] = pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);

                iter.dma += I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 077b8f7cf6cb..4d1de2d97d5c 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -379,6 +379,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
        pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
        vaddr = kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
        do {
+               GEM_BUG_ON(iter->sg->length < I915_GTT_PAGE_SIZE);
                vaddr[gen8_pd_index(idx, 0)] = pte_encode | iter->dma;

                iter->dma += I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 79096722ce16..531d501be01f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -787,7 +787,7 @@ static int ggtt_probe_common(struct i915_ggtt
*ggtt, u64 size)
         * readback check when writing GTT PTE entries.
         */
        if (IS_GEN9_LP(i915) || INTEL_GEN(i915) >= 10)
-               ggtt->gsm = ioremap_nocache(phys_addr, size);
+               ggtt->gsm = ioremap(phys_addr, size);
        else
                ggtt->gsm = ioremap_wc(phys_addr, size);
        if (!ggtt->gsm) {

since those ppgtt_insert_entries functions had moved to their
gen-specific files.

No?

            Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
