Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C499A38A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 01:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FEA6EB53;
	Thu, 22 Aug 2019 23:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4C6EB53;
 Thu, 22 Aug 2019 23:14:29 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E6CC2173E;
 Thu, 22 Aug 2019 23:14:28 +0000 (UTC)
Date: Thu, 22 Aug 2019 16:14:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] kernel.h: Add non_block_start/end()
Message-Id: <20190822161428.c9e4479207386d34745ea111@linux-foundation.org>
In-Reply-To: <20190820202440.GH11147@phenom.ffwll.local>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
 <20190820081902.24815-4-daniel.vetter@ffwll.ch>
 <20190820202440.GH11147@phenom.ffwll.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566515669;
 bh=vApCOM3H3LWmBhR9eGKlIz7FlGeav7+0V7QMAv0lrz4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JnFvVQX53Ce1G2PQ2HOdxbB/SubAMwjIprQiE8EBfadRyLGqt1J+ii+olw/j5668Y
 +QtLBXDlkv6/aLoxjapTqHtWc0fc3gJRJDtnIBEIp+3qWO0oQofuFmpQXuSE4efjH3
 lHWO0el4UUudjvso5nDstFN30oxIxxABVA7nHCxs=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAyMjoyNDo0MCArMDIwMCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBIaSBQZXRlciwKPiAKPiBJaXJjIHlvdSd2ZSBiZWVuIGludm9s
dmVkIGF0IGxlYXN0IHNvbWV3aGF0IGluIGRpc2N1c3NpbmcgdGhpcy4gLW1tIGZvbGtzCj4gYXJl
IGEgYml0IHVuZGVjaWRlZCB3aGV0aGVyIHRoZXNlIG5ldyBub25fYmxvY2sgc2VtYW50aWNzIGFy
ZSBhIGdvb2QgaWRlYS4KPiBNaWNoYWwgSG9ja28gc3RpbGwgaXMgaW4gc3VwcG9ydCwgYnV0IEFu
ZHJldyBNb3J0b24gYW5kIEphc29uIEd1bnRob3JwZQo+IGFyZSBsZXNzIGVudGh1c2lhc3RpYy4g
SmFzb24gc2FpZCBoZSdzIG9rIHdpdGggbWVyZ2luZyB0aGUgaG1tIHNpZGUgb2YKPiB0aGlzIGlm
IHNjaGVkdWxlciBmb2xrcyBhY2suIElmIG5vdCwgdGhlbiBJJ2xsIHJlc3BpbiB3aXRoIHRoZQo+
IHByZWVtcHRfZGlzYWJsZS9lbmFibGUgaW5zdGVhZCBsaWtlIGluIHYxLgoKSSBiZWNhbWUgbW9s
bGlmaWVkIG9uY2UgTWljaGVsIGV4cGxhaW5lZCB0aGUgcmF0aW9uYWxlLiAgSSB0aGluayBpdCdz
Ck9LLiAgSXQncyB2ZXJ5IHNwZWNpZmljIHRvIHRoZSBvb20gcmVhcGVyIGFuZCBob3BlZnVsbHkg
d29uJ3QgYmUgdXNlZAptb3JlIHdpZGVseSg/KS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
