Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309163EA2B6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 12:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A90F6E057;
	Thu, 12 Aug 2021 10:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A436E057
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 10:07:13 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h11so9740194ljo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MYArfwyoBo3dGsKUJMsxwhHgYqZKbCcsgh7gGUNtDK4=;
 b=i5pl2dc+IIZq62s73J165t7SbTE/a6uwhQcs74jwe9KmwHHHprhV6B7adGgzY2ul5F
 h3ad9IJiBKNdQ1Yy+0atN7ISXCxsrMGXnfmJsO6X4rAencCuDMvqer1gR8DISUT+MUdX
 mFWLcuQYXLFjOzlL0+b+7kJuGkuB4wCN/YMkw/r+eyS6zgywYe+L6amtdlG3N+EOpGsE
 J1HMLNEKBn3QeV3/WPSCpmI5s5ySDG9/4fJ+UJO1H5Xch03iP3WdOduEdYUt1pTqbuK7
 XsqkYhAszn/r202BsWcaBlPgkZHQ5nFUcQEBqetJcuzusrxc9TEefXgeJD4qBlDR12PM
 /RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MYArfwyoBo3dGsKUJMsxwhHgYqZKbCcsgh7gGUNtDK4=;
 b=m13GpyPogIH5EnP5ma1gl8OHevJSI82TuRBVqBPenknqlb3I42teFtRrUyTK2maXbb
 LzEx5gHtsQZKbAU/dGkC/aZjVoCaLDgJ/AbGY0IBVdpQ5XYGhiAJtEdoIviCn73TXjN3
 inbN+7Bmw2XaE2UnGh06IX01BwesNaIqAhaFUiSrP2G3VnPngE8aa98eW8Ri2E9k1LuW
 cI0iD0jxl50JV7VB4m977BkK+ysWeDyUAy1ogRB4JF05sBrYj0kYttx9csSV+jk1OBnR
 BEInBfEfs+QZ0cMBatns0zN5MJtdzvZpl48cBq/fQlnDk3uj6WtasVp5f/EWPuKVxS1S
 bmqQ==
X-Gm-Message-State: AOAM532pMePwigNUYa0PDh2HkgZM6Ntqc3RkZ2N57nnqhqsOjv3QgJN8
 QMyXPAHogGju5cLn9wB4i5RCxQ==
X-Google-Smtp-Source: ABdhPJzegmFCE5odxbsD4HArsZ9uuMjN7H8TkJnoN55vikWCUHEpo/5436B3LFAXNhCNvYbyx3Wtvw==
X-Received: by 2002:a2e:814a:: with SMTP id t10mr2410500ljg.318.1628762831975; 
 Thu, 12 Aug 2021 03:07:11 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id o8sm212528lfo.292.2021.08.12.03.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:07:11 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id B75B41028BC; Thu, 12 Aug 2021 13:07:24 +0300 (+03)
Date: Thu, 12 Aug 2021 13:07:24 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 07/11] treewide: Replace the use of mem_encrypt_active()
 with prot_guest_has()
Message-ID: <20210812100724.t4cdh7xbkuqgnsc3@box.shutemov.name>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <029791b24c6412f9427cfe6ec598156c64395964.1627424774.git.thomas.lendacky@amd.com>
 <166f30d8-9abb-02de-70d8-6e97f44f85df@linux.intel.com>
 <4b885c52-f70a-147e-86bd-c71a8f4ef564@amd.com>
 <20210811121917.ghxi7g4mctuybhbk@box.shutemov.name>
 <0a819549-e481-c004-7da8-82ba427b13ce@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a819549-e481-c004-7da8-82ba427b13ce@amd.com>
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

On Wed, Aug 11, 2021 at 10:52:55AM -0500, Tom Lendacky wrote:
> On 8/11/21 7:19 AM, Kirill A. Shutemov wrote:
> > On Tue, Aug 10, 2021 at 02:48:54PM -0500, Tom Lendacky wrote:
> >> On 8/10/21 1:45 PM, Kuppuswamy, Sathyanarayanan wrote:
> >>>
> >>>
> >>> On 7/27/21 3:26 PM, Tom Lendacky wrote:
> >>>> diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
> >>>> index de01903c3735..cafed6456d45 100644
> >>>> --- a/arch/x86/kernel/head64.c
> >>>> +++ b/arch/x86/kernel/head64.c
> >>>> @@ -19,7 +19,7 @@
> >>>>   #include <linux/start_kernel.h>
> >>>>   #include <linux/io.h>
> >>>>   #include <linux/memblock.h>
> >>>> -#include <linux/mem_encrypt.h>
> >>>> +#include <linux/protected_guest.h>
> >>>>   #include <linux/pgtable.h>
> >>>>     #include <asm/processor.h>
> >>>> @@ -285,7 +285,7 @@ unsigned long __head __startup_64(unsigned long
> >>>> physaddr,
> >>>>        * there is no need to zero it after changing the memory encryption
> >>>>        * attribute.
> >>>>        */
> >>>> -    if (mem_encrypt_active()) {
> >>>> +    if (prot_guest_has(PATTR_MEM_ENCRYPT)) {
> >>>>           vaddr = (unsigned long)__start_bss_decrypted;
> >>>>           vaddr_end = (unsigned long)__end_bss_decrypted;
> >>>
> >>>
> >>> Since this change is specific to AMD, can you replace PATTR_MEM_ENCRYPT with
> >>> prot_guest_has(PATTR_SME) || prot_guest_has(PATTR_SEV). It is not used in
> >>> TDX.
> >>
> >> This is a direct replacement for now.
> > 
> > With current implementation of prot_guest_has() for TDX it breaks boot for
> > me.
> > 
> > Looking at code agains, now I *think* the reason is accessing a global
> > variable from __startup_64() inside TDX version of prot_guest_has().
> > 
> > __startup_64() is special. If you access any global variable you need to
> > use fixup_pointer(). See comment before __startup_64().
> > 
> > I'm not sure how you get away with accessing sme_me_mask directly from
> > there. Any clues? Maybe just a luck and complier generates code just right
> > for your case, I donno.
> 
> Hmm... yeah, could be that the compiler is using rip-relative addressing
> for it because it lives in the .data section?

I guess. It has to be fixed. It may break with complier upgrade or any
random change around the code.

BTW, does it work with clang for you?

> For the static variables in mem_encrypt_identity.c I did an assembler rip
> relative LEA, but probably could have passed physaddr to sme_enable() and
> used a fixup_pointer() style function, instead.

Sounds like a plan.

> > A separate point is that TDX version of prot_guest_has() relies on
> > cpu_feature_enabled() which is not ready at this point.
> 
> Does TDX have to do anything special to make memory able to be shared with
> the hypervisor?

Yes. But there's nothing that required any changes in early boot. It
handled in ioremap/set_memory.

> You might have to use something that is available earlier
> than cpu_feature_enabled() in that case (should you eventually support
> kvmclock).

Maybe.

> > I think __bss_decrypted fixup has to be done if sme_me_mask is non-zero.
> > Or just do it uncoditionally because it's NOP for sme_me_mask == 0.
> 
> For SNP, we'll have to additionally call the HV to update the RMP to make
> the memory shared. But that could also be done unconditionally since the
> early_snp_set_memory_shared() routine will check for SNP before doing
> anything.

-- 
 Kirill A. Shutemov
