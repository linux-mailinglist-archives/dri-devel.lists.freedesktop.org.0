Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDFDF519
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 20:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6386E1E8;
	Mon, 21 Oct 2019 18:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86456E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:32:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-EkGRMG7VMGe6fypj4XgZZA-1; Mon, 21 Oct 2019 14:32:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9679800D41;
 Mon, 21 Oct 2019 18:32:27 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E27BA194BE;
 Mon, 21 Oct 2019 18:32:26 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:32:25 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 01/15] mm/mmu_notifier: define the header
 pre-processor parts even if disabled
Message-ID: <20191021183225.GC3177@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-2-jgg@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-2-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: EkGRMG7VMGe6fypj4XgZZA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571682753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1SVWUxl8bSg5tpSz0mHn09kXdQtCr9UWEBqRSeB3w4=;
 b=T03gB7OVjdGqYGgnCfQKx7DI8FRZZqNTe41WBWCvxYNgLpxfNKQvL49J2iSR0Ll5F/NaS/
 JpaCDrVE3CUfC+jg1+TmaTTxjlAXAXn+GX7377O7zfQpYXyR/xEDkbSQ59z0/0PiASDQYF
 EK8sB8v22MPicrUF4e9wOG+CPIk/f6A=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDM6MTI6MjhQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBO
b3cgdGhhdCB3ZSBoYXZlIEtFUk5FTF9IRUFERVJfVEVTVCBhbGwgaGVhZGVycyBhcmUgZ2VuZXJh
bGx5IGNvbXBpbGUKPiB0ZXN0ZWQsIHNvIHJlbHlpbmcgb24gbWFrZWZpbGUgdHJpY2tzIHRvIGF2
b2lkIGNvbXBpbGluZyBjb2RlIHRoYXQgZGVwZW5kcwo+IG9uIENPTkZJR19NTVVfTk9USUZJRVIg
aXMgbW9yZSBhbm5veWluZy4KPiAKPiBJbnN0ZWFkIGZvbGxvdyB0aGUgdXN1YWwgcGF0dGVybiBh
bmQgcHJvdmlkZSBtb3N0IG9mIHRoZSBoZWFkZXIgd2l0aCBvbmx5Cj4gdGhlIGZ1bmN0aW9ucyBz
dHViYmVkIG91dCB3aGVuIENPTkZJR19NTVVfTk9USUZJRVIgaXMgZGlzYWJsZWQuIFRoaXMKPiBl
bnN1cmVzIGNvZGUgY29tcGlsZXMgbm8gbWF0dGVyIHdoYXQgdGhlIGNvbmZpZyBzZXR0aW5nIGlz
Lgo+IAo+IFdoaWxlIGhlcmUsIHN0cnVjdCBtbXVfbm90aWZpZXJfbW0gaXMgcHJpdmF0ZSB0byBt
bXVfbm90aWZpZXIuYywgbW92ZSBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+CgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xp
c3NlQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwg
NDYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIG1tL21tdV9ub3RpZmll
ci5jICAgICAgICAgICAgfCAxMyArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbW11X25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4gaW5kZXgg
MWJkOGU2YTA5YTNjMjcuLjEyYmQ2MDNkMzE4Y2U3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbW11X25vdGlmaWVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCj4g
QEAgLTcsOCArNyw5IEBACj4gICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvc3JjdS5oPgo+ICAKPiArc3RydWN0IG1tdV9ub3RpZmllcl9tbTsKPiAgc3RydWN0
IG1tdV9ub3RpZmllcjsKPiAtc3RydWN0IG1tdV9ub3RpZmllcl9vcHM7Cj4gK3N0cnVjdCBtbXVf
bm90aWZpZXJfcmFuZ2U7Cj4gIAo+ICAvKioKPiAgICogZW51bSBtbXVfbm90aWZpZXJfZXZlbnQg
LSByZWFzb24gZm9yIHRoZSBtbXUgbm90aWZpZXIgY2FsbGJhY2sKPiBAQCAtNDAsMzYgKzQxLDgg
QEAgZW51bSBtbXVfbm90aWZpZXJfZXZlbnQgewo+ICAJTU1VX05PVElGWV9TT0ZUX0RJUlRZLAo+
ICB9Owo+ICAKPiAtI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIKPiAtCj4gLSNpZmRlZiBDT05G
SUdfTE9DS0RFUAo+IC1leHRlcm4gc3RydWN0IGxvY2tkZXBfbWFwIF9fbW11X25vdGlmaWVyX2lu
dmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwOwo+IC0jZW5kaWYKPiAtCj4gLS8qCj4gLSAqIFRoZSBt
bXUgbm90aWZpZXJfbW0gc3RydWN0dXJlIGlzIGFsbG9jYXRlZCBhbmQgaW5zdGFsbGVkIGluCj4g
LSAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2FsbF9sb2NrcygpIHBy
b3RlY3RlZAo+IC0gKiBjcml0aWNhbCBzZWN0aW9uIGFuZCBpdCdzIHJlbGVhc2VkIG9ubHkgd2hl
biBtbV9jb3VudCByZWFjaGVzIHplcm8KPiAtICogaW4gbW1kcm9wKCkuCj4gLSAqLwo+IC1zdHJ1
Y3QgbW11X25vdGlmaWVyX21tIHsKPiAtCS8qIGFsbCBtbXUgbm90aWZpZXJzIHJlZ2lzdGVyZCBp
biB0aGlzIG1tIGFyZSBxdWV1ZWQgaW4gdGhpcyBsaXN0ICovCj4gLQlzdHJ1Y3QgaGxpc3RfaGVh
ZCBsaXN0Owo+IC0JLyogdG8gc2VyaWFsaXplIHRoZSBsaXN0IG1vZGlmaWNhdGlvbnMgYW5kIGhs
aXN0X3VuaGFzaGVkICovCj4gLQlzcGlubG9ja190IGxvY2s7Cj4gLX07Cj4gLQo+ICAjZGVmaW5l
IE1NVV9OT1RJRklFUl9SQU5HRV9CTE9DS0FCTEUgKDEgPDwgMCkKPiAgCj4gLXN0cnVjdCBtbXVf
bm90aWZpZXJfcmFuZ2Ugewo+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gLQlzdHJ1
Y3QgbW1fc3RydWN0ICptbTsKPiAtCXVuc2lnbmVkIGxvbmcgc3RhcnQ7Cj4gLQl1bnNpZ25lZCBs
b25nIGVuZDsKPiAtCXVuc2lnbmVkIGZsYWdzOwo+IC0JZW51bSBtbXVfbm90aWZpZXJfZXZlbnQg
ZXZlbnQ7Cj4gLX07Cj4gLQo+ICBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyB7Cj4gIAkvKgo+ICAJ
ICogQ2FsbGVkIGVpdGhlciBieSBtbXVfbm90aWZpZXJfdW5yZWdpc3RlciBvciB3aGVuIHRoZSBt
bSBpcwo+IEBAIC0yNDksNiArMjIyLDIxIEBAIHN0cnVjdCBtbXVfbm90aWZpZXIgewo+ICAJdW5z
aWduZWQgaW50IHVzZXJzOwo+ICB9Owo+ICAKPiArI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIK
PiArCj4gKyNpZmRlZiBDT05GSUdfTE9DS0RFUAo+ICtleHRlcm4gc3RydWN0IGxvY2tkZXBfbWFw
IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwOwo+ICsjZW5kaWYKPiAr
Cj4gK3N0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2Ugewo+ICsJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWE7Cj4gKwlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPiArCXVuc2lnbmVkIGxvbmcgc3RhcnQ7
Cj4gKwl1bnNpZ25lZCBsb25nIGVuZDsKPiArCXVuc2lnbmVkIGZsYWdzOwo+ICsJZW51bSBtbXVf
bm90aWZpZXJfZXZlbnQgZXZlbnQ7Cj4gK307Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGludCBtbV9o
YXNfbm90aWZpZXJzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICB7Cj4gIAlyZXR1cm4gdW5saWtl
bHkobW0tPm1tdV9ub3RpZmllcl9tbSk7Cj4gZGlmZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5j
IGIvbW0vbW11X25vdGlmaWVyLmMKPiBpbmRleCA3ZmRlODg2OTVmMzVkNi4uMzY3NjcwY2ZkMDJi
N2IgMTAwNjQ0Cj4gLS0tIGEvbW0vbW11X25vdGlmaWVyLmMKPiArKysgYi9tbS9tbXVfbm90aWZp
ZXIuYwo+IEBAIC0yNyw2ICsyNywxOSBAQCBzdHJ1Y3QgbG9ja2RlcF9tYXAgX19tbXVfbm90aWZp
ZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXAgPSB7Cj4gIH07Cj4gICNlbmRpZgo+ICAKPiAr
LyoKPiArICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIGFuZCBp
bnN0YWxsZWQgaW4KPiArICogbW0tPm1tdV9ub3RpZmllcl9tbSBpbnNpZGUgdGhlIG1tX3Rha2Vf
YWxsX2xvY2tzKCkgcHJvdGVjdGVkCj4gKyAqIGNyaXRpY2FsIHNlY3Rpb24gYW5kIGl0J3MgcmVs
ZWFzZWQgb25seSB3aGVuIG1tX2NvdW50IHJlYWNoZXMgemVybwo+ICsgKiBpbiBtbWRyb3AoKS4K
PiArICovCj4gK3N0cnVjdCBtbXVfbm90aWZpZXJfbW0gewo+ICsJLyogYWxsIG1tdSBub3RpZmll
cnMgcmVnaXN0ZXJlZCBpbiB0aGlzIG1tIGFyZSBxdWV1ZWQgaW4gdGhpcyBsaXN0ICovCj4gKwlz
dHJ1Y3QgaGxpc3RfaGVhZCBsaXN0Owo+ICsJLyogdG8gc2VyaWFsaXplIHRoZSBsaXN0IG1vZGlm
aWNhdGlvbnMgYW5kIGhsaXN0X3VuaGFzaGVkICovCj4gKwlzcGlubG9ja190IGxvY2s7Cj4gK307
Cj4gKwo+ICAvKgo+ICAgKiBUaGlzIGZ1bmN0aW9uIGNhbid0IHJ1biBjb25jdXJyZW50bHkgYWdh
aW5zdCBtbXVfbm90aWZpZXJfcmVnaXN0ZXIKPiAgICogYmVjYXVzZSBtbS0+bW1fdXNlcnMgPiAw
IGR1cmluZyBtbXVfbm90aWZpZXJfcmVnaXN0ZXIgYW5kIGV4aXRfbW1hcAo+IC0tIAo+IDIuMjMu
MAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
