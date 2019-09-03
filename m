Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC63A7527
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B93E8979F;
	Tue,  3 Sep 2019 20:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2723389356
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5AF213F7AA;
 Tue,  3 Sep 2019 22:46:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm5YpwMMBdsT; Tue,  3 Sep 2019 22:46:21 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8EA0F3F346;
 Tue,  3 Sep 2019 22:46:19 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2309F360160;
 Tue,  3 Sep 2019 22:46:19 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: Christoph Hellwig <hch@infradead.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <20190903134627.GA2951@infradead.org>
 <f85e7fa6-54e1-7ac5-ce6c-96349c7af322@shipmail.org>
 <20190903162204.GB23281@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <558f1224-d157-5848-1752-1430a5b3947e@shipmail.org>
Date: Tue, 3 Sep 2019 22:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190903162204.GB23281@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567543579; bh=ReJ050/HhfY0Ips2NyF/JTyfejqDhdHoI69hGH+hQng=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d5pyVlMAIlG8kSjxdJ6L4TE+ZbVRlWIQ0rnwBa/UmsyM4NifbUmke10ZyTcfAn3Zv
 vUi7fIUcBPjcDYXRdoH5OFN7o7UnEzFdVJpQg2EO1+5b7rwG/jYnHaN2xKjTSqk3Wn
 8CDZYzOZUAiaMay+Q4PbIPxy6QBIXcZs2oPHLRpc=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=d5pyVlMA; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8zLzE5IDY6MjIgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFR1ZSwgU2Vw
IDAzLCAyMDE5IGF0IDA0OjMyOjQ1UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IHdyb3RlOgo+PiBJcyB0aGlzIGEgbGF5ZXIgdmlvbGF0aW9uIGNvbmNlcm4sIHRoYXQgaXMsIHdv
dWxkIHlvdSBiZSBvayB3aXRoIGEgc2ltaWxhcgo+PiBoZWxwZXIgZm9yIFRUTSwgb3IgaXMgaXQg
dGhhdCB5b3Ugd2FudCB0byBmb3JjZSB0aGUgZ3JhcGhpY3MgZHJpdmVycyBpbnRvCj4+IGFkaGVy
aW5nIHN0cmljdGx5IHRvIHRoZSBETUEgYXBpLCBldmVuIHdoZW4gaXQgZnJvbSBhbiBlbmdpbmVl
cmluZwo+PiBwZXJzcGVjdGl2ZSBtYWtlcyBubyBzZW5zZT8KPiA+RnJvbSBsb29raW5nIGF0IERS
TSBJIHN0cm9uZ2x5IGJlbGlldmUgdGhhdCBtYWtpbmcgRFJNIHVzZSB0aGUgRE1BCj4gbWFwcGlu
ZyBwcm9wZXJseSBtYWtlcyBhIGxvdCBvZiBzZW5zZSBmcm9tIHRoZSBlbmdpbmVlcmluZyBwZXJz
cGVjdGl2ZSwKPiBhbmQgdGhpcyBzZXJpZXMgaXMgYSBnb29kIGFyZ3VtZW50IGZvciB0aGF0IHBv
c2l0aW9ucy4KCldoYXQgSSBtZWFuIHdpdGggImZyb20gYW4gZW5naW5lZXJpbmcgcGVyc3BlY3Rp
dmUiIGlzIHRoYXQgZHJpdmVycyB3b3VsZCAKZW5kIHVwIHdpdGggYSBub24tdHJpdmlhbCBhbW91
bnQgb2YgY29kZSBzdXBwb3J0aW5nIHB1cmVseSBhY2FkZW1pYyAKY2FzZXM6IFNldHVwcyB3aGVy
ZSBzb2Z0d2FyZSByZW5kZXJpbmcgd291bGQgYmUgZmFzdGVyIHRoYW4gZ3B1IAphY2NlbGVyYXRl
ZCwgYW5kIHNldHVwcyBvbiBwbGF0Zm9ybXMgd2hlcmUgdGhlIGRyaXZlciB3b3VsZCBuZXZlciBy
dW4gCmFueXdheSBiZWNhdXNlIHRoZSBkZXZpY2Ugd291bGQgbmV2ZXIgYmUgc3VwcG9ydGVkIG9u
IHRoYXQgcGxhdGZvcm0uLi4KCj4gICBJZiBEUk0gd2FzIHVzaW5nCj4gdGhlIERNQSBwcm9wZXJs
IHdlIHdvdWxkIG5vdCBuZWVkIHRoaXMgc2VyaWVzIHRvIHN0YXJ0IHdpdGgsIGFsbCB0aGUKPiBT
RVYgaGFuZGxpbmcgaXMgaGlkZGVuIGJlaGluZCB0aGUgRE1BIEFQSS4gIFdoaWxlIHdlIGhhZCBv
Y2Nhc2lvbmFsCj4gYnVncyBpbiB0aGF0IHN1cHBvcnQgZml4aW5nIGl0IG1lYW50IHRoYXQgaXQg
Y292ZXJlZCBhbGwgZHJpdmVycwo+IHByb3Blcmx5IHVzaW5nIHRoYXQgQVBJLgoKVGhhdCBpcyBu
b3QgcmVhbGx5IHRydWUuIFRoZSBkbWEgQVBJIGNhbid0IGhhbmRsZSBmYXVsdGluZyBvZiBjb2hl
cmVudCAKcGFnZXMgd2hpY2ggaXMgd2hhdCB0aGlzIHNlcmllcyBpcyByZWFsbHkgYWxsIGFib3V0
IHN1cHBvcnRpbmcgYWxzbyB3aXRoIApTRVYgYWN0aXZlLiBUbyBoYW5kbGUgdGhlIGNhc2Ugd2hl
cmUgd2UgbW92ZSBncmFwaGljcyBidWZmZXJzIG9yIHNlbmQgCnRoZW0gdG8gc3dhcCBzcGFjZSB3
aGlsZSB1c2VyLXNwYWNlIGhhdmUgdGhlbSBtYXBwZWQuCgpUbyBkbyB0aGF0IGFuZCBzdGlsbCBi
ZSBmdWxseSBkbWEtYXBpIGNvbXBsaWFudCB3ZSB3b3VsZCBpZGVhbGx5IG5lZWQsIApmb3IgZXhh
bXBsZSwgYW4gZXhwb3J0ZWQgZG1hX3BncHJvdCgpLiAoZG1hX3BncHJvdCgpIGJ5IHRoZSB3YXkg
aXMgc3RpbGwgCnN1ZmZlcmluZyBmcm9tIG9uZSBvZiB0aGUgYnVncyB0aGF0IHlvdSBtZW50aW9u
IGFib3ZlKS4KClN0aWxsLCBJIG5lZWQgYSB3YXkgZm9yd2FyZCBhbmQgbXkgcXVlc3Rpb25zIHdl
cmVuJ3QgcmVhbGx5IGFuc3dlcmVkIGJ5IAp0aGlzLgoKL1Rob21hcwoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
