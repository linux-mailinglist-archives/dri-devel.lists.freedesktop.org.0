Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GjcJk/srmmSKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3C23C168
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D75010E54C;
	Mon,  9 Mar 2026 15:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wkl0HyYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C793B10E563
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:50:17 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-50917e02472so13948011cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773071417; x=1773676217; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
 b=Wkl0HyYVHFuiRXOL430Kxir9gIypF0woRzLUYmVii60g3bSd20mGSt9lwjJKpNEBdb
 9gXsEyTzCRmdnZaKDAA6BLcMeaHw+bIUJ8hKYGTIp0FTVrQDetD1+G6TjnH0Sifv2opG
 LQ6CJ5gQ1T7lcb+aoxlyOSzmyKlxsFT2xpsfLKWc4ZKQqQv2CgsjqT1Yjk0oV5P9jKas
 BDLmhThVxQ0l9Tc6z6Gwdub+wLgUAbz7m2VKuznUvaLOE50PxrV84HbdmBVXH0e/99ki
 SRbUsNhftpDhbdC0mjkXigZcqcubHAnF3BOA7hRyx3fhVpht1n7aif7OhEUoq6Pu5V0U
 SfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773071417; x=1773676217;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
 b=feUbx3BjNOceGF7CRYZNyetyAqJjSCIBzdFlOKpVPSgeFbpbJ51iiTR7AQEFEhCTZk
 LXkQf6JdWZhU/J3jiH41bTCLjTkGlBEaWvEETohAkS5iHOSZNl9QyVAXditbcrudFWEJ
 ssVjT2qY9BWWV9iIIvUC3WKu9C/yyR7PhJ0Oj6OmUMw6/GWkiba5CyYYtJiBltgkmKZ9
 E7m0au3131w8an8fJj7OO0N1yHoNZjA4BaXuJaBlAy/1XUWSGI4/yGcu2IOisJGt4Sry
 uitVqxX3e4p55lexEzvv1OufhU3Sg5/xp8h1xEcwxyjdOrQ167FxvKWlMKU/W+iF4wKW
 ye2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCMcdssveHbLOYt5765ohB07r2q/Aiegd0ocXgFcFoEOQ6/Y+g7xELX3LToecpOs7vWdEBLVMI4xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmoozHZ5bGIvN4gy+siMEmdPKuTqM6A2LpjzS+Icn/BeHySnyU
 6DfE5RXk7UYSM+BXw3WejKGk7nQGyFK8+lEjFxt0AUPJgQaBFuQUOexoDQmkgfzKhEc=
X-Gm-Gg: ATEYQzx0oeMUtjo1xm5ZkrHn7IAgqqyZdfUAE7tHhpzT7p6t1WPYnODr0IK71754QpD
 fLTRWA27OYiM28oNEKiazJAo6zRAM0LJjut8vW7TRZtn0zdjWbGxTYhRLn59WWB+djOTB82yW+c
 HRZr0M9UkJ2uPosl2+oqDhHs+1eSBN9XMwz3Qn/u4V/FGe/NBI3zfcZ5zQLn+zvMDOcafGjDWX6
 3NdXMVjVCPp+JWDw/6dCmUF9Kxx5KjeMDG/3x0vtij39rPAQq/Ne+6LWDykRlaVtvFFAZ/qwE8f
 dwCmgU/3wdja1AHkXlfebpTG1/w4+SxRWSHaAySZYfKTWfRwA7yus/DFc4OULUtME+Wwqyth13V
 wyFz/xIDjquYgN7NQ8ZjRfTed6Bp9TABBVDGTTRwURJwTfMYlQ19nN691Jjhw+orV6ijH+S+6N2
 TKwtMeJOz1QVOF6MlQBQBZbaD8cHufOLI9xjfJaM3zcRS5RI8RCED0WwShOYmInJ96ncW6dhbtZ
 0Z3jdJe
X-Received: by 2002:a05:622a:30a:b0:503:4251:6597 with SMTP id
 d75a77b69052e-508f46f8abdmr155244531cf.29.1773071416552; 
 Mon, 09 Mar 2026 08:50:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a57a4ec29sm837376d6.19.2026.03.09.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 08:50:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vzcs3-0000000GsMM-18A4;
 Mon, 09 Mar 2026 12:50:15 -0300
Date: Mon, 9 Mar 2026 12:50:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Gonda <pgonda@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
Message-ID: <20260309155015.GP1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-3-jiri@resnulli.us>
 <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
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
X-Rspamd-Queue-Id: 15B3C23C168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pgonda@google.com,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,resnulli.us:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:44AM -0600, Peter Gonda wrote:
> Great feature to have thanks Jiri! A couple naive questions.
> 
> On Thu, Mar 5, 2026 at 5:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> > allocate decrypted (shared) memory for confidential computing (CoCo)
> > VMs.
> >
> > On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> > encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> > Intel TDX) to control whether a given memory access is encrypted or
> > decrypted. The kernel's direct map is set up with encryption enabled,
> > so pages returned by alloc_pages() are encrypted in the direct map
> > by default. To make this memory usable for devices that do not support
> > DMA to encrypted memory (no TDISP support), it has to be explicitly
> > decrypted. A couple of things are needed to properly handle
> > decrypted memory for the dma-buf use case:
> >
> > - set_memory_decrypted() on the direct map after allocation:
> >   Besides clearing the encryption bit in the direct map PTEs, this
> >   also notifies the hypervisor about the page state change. On free,
> >   the inverse set_memory_encrypted() must be called before returning
> >   pages to the allocator. If re-encryption fails, pages
> >   are intentionally leaked to prevent decrypted memory from being
> >   reused as private.
> >
> > - pgprot_decrypted() for userspace and kernel virtual mappings:
> >   Any new mapping of the decrypted pages, be it to userspace via
> >   mmap or to kernel vmalloc space via vmap, creates PTEs independent
> >   of the direct map. These must also have the encryption bit cleared,
> >   otherwise accesses through them would see encrypted (garbage) data.
> 
> So this only works on new mappings? What if there are existing
> mappings to the memory that will be converted to shared?

The set_memory_decrypted() is called during system_heap_allocate(), it
is not possible to change dynamically between encrypted/decrypted.

Once the heap is created every PTE is always created with the correct
pgprot.

Jason
