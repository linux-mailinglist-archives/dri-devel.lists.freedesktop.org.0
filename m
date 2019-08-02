Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF781343
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0786E27A;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAD76E02E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 22:59:44 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1htgWR-0004QR-HV; Fri, 02 Aug 2019 22:59:39 +0000
Date: Fri, 2 Aug 2019 15:59:39 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
Message-ID: <20190802225939.GE5597@bombadil.infradead.org>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
 <20190802203344.GD5597@bombadil.infradead.org>
 <1564780650.11067.50.camel@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564780650.11067.50.camel@lca.pw>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Vp/kqP9japOy3ACodrJwRs1V+FSeqYXiepD5OU8/Pg=; b=qKZqH04Z5Il/hHnxT/u/iLha8B
 WenSRYxHMj0u1ZloMPhq0g6W3hB7+FE9AQ4R30P1C3J7aQa1ytNC2T/N26tNJ4FWsBGlkijfYHsxX
 UEYJBazuzGCdPoFBysXcXrkbSYWFkTNL4K38eV3n1fbdQu8ikuBK2gQmnFVnlCPpbd/DKS7xrlcCm
 1jHEuppTBrazcYe0A57CpIROQcyKrNvjl9ZNdspZPTx3AI2PaMDyJ1tWm2MLZyhre7wPX4USF933R
 kiVnEgHWD2atTokkjOx8fRL+uNE2pbJYu0R28sazP4B2iXaGpcwJjh2I8ADyClABJaInyn+mM7FQZ
 qUD5+fAw==;
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Andrew Morton <akpm@linux-foundation.org>,
 petr@vandrovec.name, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6MTc6MzBQTSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6
Cj4gT24gRnJpLCAyMDE5LTA4LTAyIGF0IDEzOjMzIC0wNzAwLCBNYXR0aGV3IFdpbGNveCB3cm90
ZToKPiA+IEl0IG9jY3VycyB0byBtZSB0aGF0IHdoZW4gYSBwYWdlIGlzIGZyZWVkLCB3ZSBjb3Vs
ZCByZWNvcmQgc29tZSB1c2VmdWwgYml0cwo+ID4gb2YgaW5mb3JtYXRpb24gaW4gdGhlIHBhZ2Ug
ZnJvbSB0aGUgc3RhY2sgdHJhY2UgdG8gaGVscCBkZWJ1ZyBkb3VibGUtZnJlZcKgCj4gPiBzaXR1
YXRpb25zLsKgwqBFdmVuIGp1c3Qgc3Rhc2hpbmcgX19idWlsdGluX3JldHVybl9hZGRyZXNzIGlu
IHBhZ2UtPm1hcHBpbmcKPiA+IHdvdWxkIGJlIGhlbHBmdWwsIEkgdGhpbmsuCj4gCj4gU291bmRz
IGxpa2UgbmVlZCB0byBlbmFibGUgInBhZ2Vfb3duZXIiLCBzbyBpdCB3aWxsIGRvIMKgX19kdW1w
X3BhZ2Vfb3duZXIoKS4KClRoYXQgZG9lc24ndCBoZWxwIGJlY2F1c2Ugd2UgY2FsbCByZXNldF9w
YWdlX293bmVyKCkgaW4gdGhlIGZyZWUgcGFnZSBwYXRoLgoKV2UgY291bGQgdHVybiBvbiB0cmFj
aW5nIGJlY2F1c2Ugd2UgY2FsbCB0cmFjZV9tbV9wYWdlX2ZyZWUoKSBpbiB0aGlzCnBhdGguICBU
aGF0IHJlcXVpcmVzIHRoZSByZXBvcnRlciB0byBiZSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgcHJv
YmxlbSwKYW5kIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhpcyBpcyBhICJoYXBwZW5l
ZCBvbmNlIiBvciAiZXZlcnkKdGltZSBJIGRvIHRoaXMsIGl0IGhhcHBlbnMiIHByb2JsZW0uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
