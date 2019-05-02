Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96501282E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5918966C;
	Fri,  3 May 2019 06:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48183895C3;
 Thu,  2 May 2019 14:02:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9DC374;
 Thu,  2 May 2019 07:02:46 -0700 (PDT)
Received: from [10.163.1.85] (unknown [10.163.1.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600E63F220;
 Thu,  2 May 2019 07:02:37 -0700 (PDT)
Subject: Re: [PATCH] mm/pgtable: Drop pgtable_t variable from pte_fn_t
 functions
To: Matthew Wilcox <willy@infradead.org>
References: <1556803126-26596-1-git-send-email-anshuman.khandual@arm.com>
 <20190502134623.GA18948@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <03be69c4-9a63-041c-49fc-249b2bf1d58a@arm.com>
Date: Thu, 2 May 2019 19:32:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190502134623.GA18948@bombadil.infradead.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 jglisse@redhat.com, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 schwidefsky@de.ibm.com, akpm@linux-foundation.org,
 Logan Gunthorpe <logang@deltatee.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwNS8wMi8yMDE5IDA3OjE2IFBNLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiBPbiBUaHUs
IE1heSAwMiwgMjAxOSBhdCAwNjo0ODo0NlBNICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90
ZToKPj4gRHJvcCB0aGUgcGd0YWJsZV90IHZhcmlhYmxlIGZyb20gYWxsIGltcGxlbWVudGF0aW9u
IGZvciBwdGVfZm5fdCBhcyBub25lIG9mCj4+IHRoZW0gdXNlIGl0LiBhcHBseV90b19wdGVfcmFu
Z2UoKSBzaG91bGQgc3RvcCBjb21wdXRpbmcgaXQgYXMgd2VsbC4gU2hvdWxkCj4+IGhlbHAgdXMg
c2F2ZSBzb21lIGN5Y2xlcy4KPiBZb3UgZGlkbid0IGFkZCBNYXJ0aW4gU2Nod2lkZWZza3kgZm9y
IHNvbWUgcmVhc29uLiAgSGUgaW50cm9kdWNlZAoKc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBk
aWQgbm90IGxpc3QgdGhlIGVtYWlsIGJ1dCBhbnl3YXlzIEkgc2hvdWxkIGhhdmUKYWRkZWQgaXQg
ZnJvbSBnaXQgYmxhbWUuIFRoYW5rcyBmb3IgYWRkaW5nIGhpcyBlbWFpbCB0byB0aGUgdGhyZWFk
LgogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
