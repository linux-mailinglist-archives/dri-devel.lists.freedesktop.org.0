Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D863B3602
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206D6EC9E;
	Thu, 24 Jun 2021 18:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA006EAA3;
 Thu, 24 Jun 2021 10:34:32 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so3226131pji.0; 
 Thu, 24 Jun 2021 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ISlLS/Bnqpf/oAWEGOJgKBZ0Rb18u3bU0Ep0kv2LMg0=;
 b=ItVpaR72A3eWg+6QNdd9RNw76aFcKOXvgi86A4U+ygjRobuSVtqGLn83lJQMbfCPA4
 LQIa3P9bWqZxWn65q97p0mTXZfMJxza4XBkddIpoDzA0Y1gz2b4OTCDChEW1fNnXNMtx
 Fd/HR/h+M9YqDeioWNf5AArKjGRkQ+rrWucptSeSf/UUf6QUwL4Nowo/4rEimVbdxS4Q
 CrrkCNn+4rsxvoMWh2fX66Avx4PzjnR2opDju0qKu/sbanWcGLqwESvvdl5Yw6PwyCya
 zQM4h5g6tjIbnWhNNgTE1fjofoOSBjtXdTRyzTMD0NSsHlc5YkGJ7hehN9KlI5q5bxjS
 Pecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ISlLS/Bnqpf/oAWEGOJgKBZ0Rb18u3bU0Ep0kv2LMg0=;
 b=t1j5ApqGnpQqaLjYNihhiucDo529FxhzaUjrzHNTop3coFyzh+reTsGcddTF1sQh5o
 J2G8eHP8K+R+QeEfOVWppIuqAkKcZ/GF1Yr0fzAUo4dYY+eG7raEgamtKxasJPAwODm1
 x38IYzAB//NcXpRuockh+gn6kg259c1402TeStc1NXw9oS89Sud4+wVDZz2Ah7NPOlzB
 T/LsSld524GfJ/VkztoA9zo6fq6Jx7qCdaneI85jH/rxaIBCyWbq6pq1PrXJvuOgO6zs
 24XInn9e+KHBY2r9S0ijs/hvN6wbJ4KA0BocmO7MfCc9a5WDFx68pVigbP/2SOVGiYVr
 PLlw==
X-Gm-Message-State: AOAM533stQQHoancNMKFDL245V5ymp6XOgTDKo/losZbwguySMOllxA5
 YZQfwaQO1skrLNWTJGE6IDU=
X-Google-Smtp-Source: ABdhPJy6kajrzF0OadUDC6nHAS6U7gmSDYSh4DBdORcOqITOBjGnDhRDrYwGVGZv+udz0pGSetXg8w==
X-Received: by 2002:a17:90b:4ac6:: with SMTP id
 mh6mr15043416pjb.210.1624530871905; 
 Thu, 24 Jun 2021 03:34:31 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id k63sm7664839pjh.13.2021.06.24.03.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:34:31 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:34:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624530624.8jff1f4u11.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
> assoicated struct pages, so they should not be passed to pfn_to_page.
> This series removes such calls from the x86 and arm64 secondary MMU. To
> do this, this series modifies gfn_to_pfn to return a struct page in
> addition to a pfn, if the hva was resolved by gup. This allows the
> caller to call put_page only when necessated by gup.
>=20
> This series provides a helper function that unwraps the new return type
> of gfn_to_pfn to provide behavior identical to the old behavior. As I
> have no hardware to test powerpc/mips changes, the function is used
> there for minimally invasive changes. Additionally, as gfn_to_page and
> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
> easily changed over to only use pfns.
>=20
> This addresses CVE-2021-22543 on x86 and arm64.

Does this fix the problem? (untested I don't have a POC setup at hand,
but at least in concept)

I have no problem with improving the API and probably in the direction=20
of your series is good. But there seems to be a lot of unfixed arch code=20
and broken APIs remaining left to do after your series too. This might=20
be most suitable to backport and as a base for your series that can take
more time to convert to new APIs.

Thanks,
Nick

---

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a6bc7af0e28..e208c279d903 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2104,13 +2104,21 @@ static int hva_to_pfn_remapped(struct vm_area_struc=
t *vma,
 	 * Whoever called remap_pfn_range is also going to call e.g.
 	 * unmap_mapping_range before the underlying pages are freed,
 	 * causing a call to our MMU notifier.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
 	 */=20
-	kvm_get_pfn(pfn);
+	if (!kvm_try_get_pfn(pfn))
+		r =3D -EFAULT;
=20
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn =3D pfn;
-	return 0;
+
+	return r;
 }
=20
 /*
@@ -2487,6 +2495,13 @@ void kvm_set_pfn_accessed(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
=20
+static int kvm_try_get_pfn(kvm_pfn_t pfn)
+{
+	if (kvm_is_reserved_pfn(pfn))
+		return 1;
+	return get_page_unless_zero(pfn_to_page(pfn));
+}
+
 void kvm_get_pfn(kvm_pfn_t pfn)
 {
 	if (!kvm_is_reserved_pfn(pfn))
