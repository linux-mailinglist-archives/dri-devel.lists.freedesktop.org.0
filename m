Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E084DF517
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 20:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B929B6E1D8;
	Mon, 21 Oct 2019 18:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125576E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:31:50 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-zS_LJt_qP3K6LOvuvx91fA-1; Mon, 21 Oct 2019 14:31:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D4A800D41;
 Mon, 21 Oct 2019 18:31:44 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80CE95DA2C;
 Mon, 21 Oct 2019 18:31:43 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:31:41 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 04/15] mm/hmm: define the pre-processor related parts
 of hmm.h even if disabled
Message-ID: <20191021183141.GB3177@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-5-jgg@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20191015181242.8343-5-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zS_LJt_qP3K6LOvuvx91fA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571682709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlG+wz+lkBtRxzyiEF0b2PvSL0je5jeFY5DxP5d4mNY=;
 b=BxoDEIgLHEnu4ihEaZARN9zGTr30xTs7klouN3B3EqkwUz/AML6REqqseTLNvpm2HBobBD
 Q/+e8GDbdJd+Uq7OyCE+WTBMw6X9lvXP0fJdVxsSwK+PQit+R82CKjY/jYCDgxVd5rD57j
 RUW5nt60Ep4M0y1sTTFvmAMz6ST+9OM=
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

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDM6MTI6MzFQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBP
bmx5IHRoZSBmdW5jdGlvbiBjYWxscyBhcmUgc3R1YmJlZCBvdXQgd2l0aCBzdGF0aWMgaW5saW5l
cyB0aGF0IGFsd2F5cwo+IGZhaWwuIFRoaXMgaXMgdGhlIHN0YW5kYXJkIHdheSB0byB3cml0ZSBh
IGhlYWRlciBmb3IgYW4gb3B0aW9uYWwgY29tcG9uZW50Cj4gYW5kIG1ha2VzIGl0IGVhc2llciBm
b3IgZHJpdmVycyB0aGF0IG9ubHkgb3B0aW9uYWxseSBuZWVkIEhNTV9NSVJST1IuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmV2aWV3ZWQt
Ynk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoKPiAtLS0KPiAgaW5jbHVk
ZS9saW51eC9obW0uaCB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQo+ICBrZXJuZWwvZm9yay5jICAgICAgIHwgIDEgLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IGluZGV4IDhhYzFmZDZhODFh
ZjhmLi4yNjY2ZWIwOGE0MDYxNSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCj4g
KysrIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IEBAIC02Miw4ICs2Miw2IEBACj4gICNpbmNsdWRl
IDxsaW51eC9rY29uZmlnLmg+Cj4gICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgo+ICAKPiAtI2lm
ZGVmIENPTkZJR19ITU1fTUlSUk9SCj4gLQo+ICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9taWdyYXRlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZW1yZW1hcC5o
Pgo+IEBAIC0zNzQsNiArMzcyLDE1IEBAIHN0cnVjdCBobW1fbWlycm9yIHsKPiAgCXN0cnVjdCBs
aXN0X2hlYWQJCWxpc3Q7Cj4gIH07Cj4gIAo+ICsvKgo+ICsgKiBSZXRyeSBmYXVsdCBpZiBub24t
YmxvY2tpbmcsIGRyb3AgbW1hcF9zZW0gYW5kIHJldHVybiAtRUFHQUlOIGluIHRoYXQgY2FzZS4K
PiArICovCj4gKyNkZWZpbmUgSE1NX0ZBVUxUX0FMTE9XX1JFVFJZCQkoMSA8PCAwKQo+ICsKPiAr
LyogRG9uJ3QgZmF1bHQgaW4gbWlzc2luZyBQVEVzLCBqdXN0IHNuYXBzaG90IHRoZSBjdXJyZW50
IHN0YXRlLiAqLwo+ICsjZGVmaW5lIEhNTV9GQVVMVF9TTkFQU0hPVAkJKDEgPDwgMSkKPiArCj4g
KyNpZmRlZiBDT05GSUdfSE1NX01JUlJPUgo+ICBpbnQgaG1tX21pcnJvcl9yZWdpc3RlcihzdHJ1
Y3QgaG1tX21pcnJvciAqbWlycm9yLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSk7Cj4gIHZvaWQgaG1t
X21pcnJvcl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpOwo+ICAKPiBAQCAt
MzgzLDE0ICszOTAsNiBAQCB2b2lkIGhtbV9taXJyb3JfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21p
cnJvciAqbWlycm9yKTsKPiAgaW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcik7Cj4gIHZvaWQgaG1tX3JhbmdlX3Vu
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOwo+ICAKPiAtLyoKPiAtICogUmV0cnkg
ZmF1bHQgaWYgbm9uLWJsb2NraW5nLCBkcm9wIG1tYXBfc2VtIGFuZCByZXR1cm4gLUVBR0FJTiBp
biB0aGF0IGNhc2UuCj4gLSAqLwo+IC0jZGVmaW5lIEhNTV9GQVVMVF9BTExPV19SRVRSWQkJKDEg
PDwgMCkKPiAtCj4gLS8qIERvbid0IGZhdWx0IGluIG1pc3NpbmcgUFRFcywganVzdCBzbmFwc2hv
dCB0aGUgY3VycmVudCBzdGF0ZS4gKi8KPiAtI2RlZmluZSBITU1fRkFVTFRfU05BUFNIT1QJCSgx
IDw8IDEpCj4gLQo+ICBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKPiAgCj4gIGxvbmcgaG1tX3JhbmdlX2RtYV9tYXAoc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gQEAgLTQwMSw2ICs0MDAsNDQgQEAgbG9uZyBobW1fcmFu
Z2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAo+ICAJCQkgc3RydWN0IGRldmlj
ZSAqZGV2aWNlLAo+ICAJCQkgZG1hX2FkZHJfdCAqZGFkZHJzLAo+ICAJCQkgYm9vbCBkaXJ0eSk7
Cj4gKyNlbHNlCj4gK2ludCBobW1fbWlycm9yX3JlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICpt
aXJyb3IsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICt7Cj4gKwlyZXR1cm4gLUVPUE5PVFNVUFA7
Cj4gK30KPiArCj4gK3ZvaWQgaG1tX21pcnJvcl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9y
ICptaXJyb3IpCj4gK3sKPiArfQo+ICsKPiAraW50IGhtbV9yYW5nZV9yZWdpc3RlcihzdHJ1Y3Qg
aG1tX3JhbmdlICpyYW5nZSwgc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKPiArewo+ICsJcmV0
dXJuIC1FT1BOT1RTVVBQOwo+ICt9Cj4gKwo+ICt2b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0
cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ICt7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgbG9u
ZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHVuc2lnbmVkIGludCBm
bGFncykKPiArewo+ICsJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5s
aW5lIGxvbmcgaG1tX3JhbmdlX2RtYV9tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gKwkJ
CQkgICAgIHN0cnVjdCBkZXZpY2UgKmRldmljZSwgZG1hX2FkZHJfdCAqZGFkZHJzLAo+ICsJCQkJ
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gK3sKPiArCXJldHVybiAtRU9QTk9UU1VQUDsKPiAr
fQo+ICsKPiArc3RhdGljIGlubGluZSBsb25nIGhtbV9yYW5nZV9kbWFfdW5tYXAoc3RydWN0IGht
bV9yYW5nZSAqcmFuZ2UsCj4gKwkJCQkgICAgICAgc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ICsJ
CQkJICAgICAgIGRtYV9hZGRyX3QgKmRhZGRycywgYm9vbCBkaXJ0eSkKPiArewo+ICsJcmV0dXJu
IC1FT1BOT1RTVVBQOwo+ICt9Cj4gKyNlbmRpZgo+ICAKPiAgLyoKPiAgICogSE1NX1JBTkdFX0RF
RkFVTFRfVElNRU9VVCAtIGRlZmF1bHQgdGltZW91dCAobXMpIHdoZW4gd2FpdGluZyBmb3IgYSBy
YW5nZQo+IEBAIC00MTEsNiArNDQ4LDQgQEAgbG9uZyBobW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlLAo+ICAgKi8KPiAgI2RlZmluZSBITU1fUkFOR0VfREVGQVVMVF9U
SU1FT1VUIDEwMDAKPiAgCj4gLSNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlSUk9S
KSAqLwo+IC0KPiAgI2VuZGlmIC8qIExJTlVYX0hNTV9IICovCj4gZGlmZiAtLWdpdCBhL2tlcm5l
bC9mb3JrLmMgYi9rZXJuZWwvZm9yay5jCj4gaW5kZXggZjk1NzJmNDE2MTI2MjguLjQ1NjFhNjVk
MTlkYjg4IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9mb3JrLmMKPiArKysgYi9rZXJuZWwvZm9yay5j
Cj4gQEAgLTQwLDcgKzQwLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2JpbmZtdHMuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L21tYW4uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21tdV9ub3RpZmllci5oPgo+
IC0jaW5jbHVkZSA8bGludXgvaG1tLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICAjaW5j
bHVkZSA8bGludXgvbW0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWNhY2hlLmg+Cj4gLS0gCj4g
Mi4yMy4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
