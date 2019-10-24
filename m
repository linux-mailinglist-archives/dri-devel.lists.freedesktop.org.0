Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD088E28E0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 05:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1A6E079;
	Thu, 24 Oct 2019 03:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B26E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 03:31:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-PfRyBGzKPp-hwj43X41j_g-1; Wed, 23 Oct 2019 23:31:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F6171005509;
 Thu, 24 Oct 2019 03:31:39 +0000 (UTC)
Received: from [10.72.12.199] (ovpn-12-199.pek2.redhat.com [10.72.12.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE78260BF1;
 Thu, 24 Oct 2019 03:31:06 +0000 (UTC)
Subject: Re: [PATCH V5 2/6] modpost: add support for mdev class id
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
 <20191023130752.18980-3-jasowang@redhat.com>
 <20191023154245.32e4fa49@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <555a101e-0ed1-2e9d-c1a4-e3b37d76bd18@redhat.com>
Date: Thu, 24 Oct 2019 11:31:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191023154245.32e4fa49@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: PfRyBGzKPp-hwj43X41j_g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571887905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q/far8ZjPdd6hm4WFk0gBs9u30vGVUeCdmmKgZKaN4=;
 b=NqHv9xqAuWmq8l9Yd6Y7bumojL1eiDWTHArYQRhqiI8X3EJL0Zpz7QTdSuDviGN5LBwDEG
 BopLNLTqFaGI9UUqRX3b4KORyv0z3eP485NBiO/w35yhGCZJXW5ni+BVFAH49ngEab2r4E
 yRaCYpOC0VraJiO+0bvDDmwttx65mcM=
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
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
 mst@redhat.com, airlied@linux.ie, heiko.carstens@de.ibm.com,
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
 rob.miller@broadcom.com, linux-s390@vger.kernel.org, sebott@linux.ibm.com,
 lulu@redhat.com, eperezma@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, haotian.wang@sifive.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, parav@mellanox.com,
 zhihong.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, oberpar@linux.ibm.com, tiwei.bie@intel.com,
 netdev@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTAvMjQg5LiK5Y2INTo0MiwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFdl
ZCwgMjMgT2N0IDIwMTkgMjE6MDc6NDggKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+PiBBZGQgc3VwcG9ydCB0byBwYXJzZSBtZGV2IGNsYXNzIGlkIHRh
YmxlLgo+Pgo+PiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+IC0t
LQo+PiAgIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICB8ICAyICsrCj4+ICAgc2Ny
aXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIHwgIDMgKysrCj4+ICAgc2NyaXB0cy9tb2Qv
ZmlsZTJhbGlhcy5jICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+PiBpbmRleCA3YjI0
ZWU5Y2I4ZGQuLmNiNzAxY2Q2NDZmMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYv
dmZpb19tZGV2LmMKPj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPj4gQEAg
LTEyNSw2ICsxMjUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRfdGFi
bGVbXSA9IHsKPj4gICAJeyAwIH0sCj4+ICAgfTsKPj4gICAKPj4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUobWRldiwgaWRfdGFibGUpOwo+PiArCj4gVHdvIHF1ZXN0aW9ucywgZmlyc3Qgd2UgaGF2ZToK
Pgo+ICNkZWZpbmUgTU9EVUxFX0RFVklDRV9UQUJMRSh0eXBlLCBuYW1lKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiBleHRlcm4gdHlwZW9mKG5hbWUpIF9fbW9kXyMjdHlwZSMj
X18jI25hbWUjI19kZXZpY2VfdGFibGUgICAgICAgICAgICAgICBcCj4gICAgX19hdHRyaWJ1dGVf
XyAoKHVudXNlZCwgYWxpYXMoX19zdHJpbmdpZnkobmFtZSkpKSkKPgo+IFRoZXJlZm9yZSB3ZSdy
ZSBkZWZpbmluZyBfX21vZF9tZGV2X19pZF90YWJsZV9kZXZpY2VfdGFibGUgd2l0aCBhbGlhcwo+
IGlkX3RhYmxlLiAgV2hlbiB0aGUgdmlydGlvIG1kZXYgYnVzIGRyaXZlciBpcyBhZGRlZCBpbiA1
LzYgaXQgdXNlcyB0aGUKPiBzYW1lIG5hbWUgdmFsdWUuICBJIHNlZSB2aXJ0aW8gdHlwZXMgYWxs
IHJlZ2lzdGVyIHRoaXMgd2F5ICh2aXJ0aW8sCj4gaWRfdGFibGUpLCBzbyBJIGFzc3VtZSB0aGVy
ZSdzIG5vIGNvbmZsaWN0LCBidXQgcGNpIHR5cGVzIG1vc3RseSAobm90Cj4gZW50aXJlbHkpIHNl
ZW0gdG8gdXNlIHVuaXF1ZSBuYW1lcy4gIElzIHRoZXJlIGEgcHJlZmVyZW5jZSB0byBvbmUgd2F5
Cj4gb3IgdGhlIG90aGVyIG9yIGl0IHNpbXBseSBkb2Vzbid0IG1hdHRlcj8KCgpJdCBsb29rcyB0
byBtZSB0aGF0IHRob3NlIHN5bWJvbCB3ZXJlIGxvY2FsLCBzbyBpdCBkb2Vzbid0IG1hdHRlci4g
QnV0IAppZiB5b3Ugd2lzaCBJIGNhbiBzd2l0Y2ggdG8gdXNlIHVuaXF1ZSBuYW1lLgoKCj4KPj4g
ICBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7Cj4+ICAgCS5u
YW1lCT0gInZmaW9fbWRldiIsCj4+ICAgCS5wcm9iZQk9IHZmaW9fbWRldl9wcm9iZSwKPj4gZGlm
ZiAtLWdpdCBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyBiL3NjcmlwdHMvbW9k
L2RldmljZXRhYmxlLW9mZnNldHMuYwo+PiBpbmRleCAwNTQ0MDViOTBiYTQuLjZjYmIxMDYyNDg4
YSAxMDA2NDQKPj4gLS0tIGEvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jCj4+ICsr
KyBiL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYwo+PiBAQCAtMjMxLDUgKzIzMSw4
IEBAIGludCBtYWluKHZvaWQpCj4+ICAgCURFVklEKHdtaV9kZXZpY2VfaWQpOwo+PiAgIAlERVZJ
RF9GSUVMRCh3bWlfZGV2aWNlX2lkLCBndWlkX3N0cmluZyk7Cj4+ICAgCj4+ICsJREVWSUQobWRl
dl9jbGFzc19pZCk7Cj4+ICsJREVWSURfRklFTEQobWRldl9jbGFzc19pZCwgaWQpOwo+PiArCj4+
ICAgCXJldHVybiAwOwo+PiAgIH0KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+PiBpbmRleCBjOTFlYmE3NTE4MDQuLmQz
NjVkZmU3YzcxOCAxMDA2NDQKPj4gLS0tIGEvc2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jCj4+ICsr
KyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+PiBAQCAtMTMzNSw2ICsxMzM1LDE1IEBAIHN0
YXRpYyBpbnQgZG9fd21pX2VudHJ5KGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB2b2lkICpzeW12YWws
IGNoYXIgKmFsaWFzKQo+PiAgIAlyZXR1cm4gMTsKPj4gICB9Cj4+ICAgCj4+ICsvKiBsb29rcyBs
aWtlOiAibWRldjpjTiIgKi8KPj4gK3N0YXRpYyBpbnQgZG9fbWRldl9lbnRyeShjb25zdCBjaGFy
ICpmaWxlbmFtZSwgdm9pZCAqc3ltdmFsLCBjaGFyICphbGlhcykKPj4gK3sKPj4gKwlERUZfRklF
TEQoc3ltdmFsLCBtZGV2X2NsYXNzX2lkLCBpZCk7Cj4+ICsKPj4gKwlzcHJpbnRmKGFsaWFzLCAi
bWRldjpjJTAyWCIsIGlkKTsKPiBBIGxvdCBvZiBlbnRyaWVzIGNhbGwgYWRkX3dpbGRjYXJkKCkg
aGVyZSwgc2hvdWxkIHdlPyAgU29ycnkgZm9yIHRoZQo+IGJhc2ljIHF1ZXN0aW9ucywgSSBoYXZl
bid0IHBsYXllZCBpbiB0aGlzIGNvZGUuICBUaGFua3MsCgoKSXQncyByZWFsbHkgZ29vZCBxdWVz
dGlvbi4gTXkgdW5kZXJzdGFuZGluZyBpcyB3ZSB3b24ndCBoYXZlIGEgbW9kdWxlIAp0aGF0IGNh
biBkZWFsIHdpdGggYWxsIGtpbmRzIG9mIGNsYXNzZXMgbGlrZSBDTEFTU19JRF9BTlkuIFNvIHRo
ZXJlJ3MgCnByb2JhYmx5IG5vIG5lZWQgZm9yIHRoZSB3aWxkY2FyZC4KClRoYW5rcwoKCj4KPiBB
bGV4Cj4KPj4gKwlyZXR1cm4gMTsKPj4gK30KPj4gKwo+PiAgIC8qIERvZXMgbmFtZWxlbiBieXRl
cyBvZiBuYW1lIGV4YWN0bHkgbWF0Y2ggdGhlIHN5bWJvbD8gKi8KPj4gICBzdGF0aWMgYm9vbCBz
eW1faXMoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwgY29uc3QgY2hhciAqc3lt
Ym9sKQo+PiAgIHsKPj4gQEAgLTE0MDcsNiArMTQxNiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGV2dGFibGUgZGV2dGFibGVbXSA9IHsKPj4gICAJeyJ0eXBlYyIsIFNJWkVfdHlwZWNfZGV2aWNl
X2lkLCBkb190eXBlY19lbnRyeX0sCj4+ICAgCXsidGVlIiwgU0laRV90ZWVfY2xpZW50X2Rldmlj
ZV9pZCwgZG9fdGVlX2VudHJ5fSwKPj4gICAJeyJ3bWkiLCBTSVpFX3dtaV9kZXZpY2VfaWQsIGRv
X3dtaV9lbnRyeX0sCj4+ICsJeyJtZGV2IiwgU0laRV9tZGV2X2NsYXNzX2lkLCBkb19tZGV2X2Vu
dHJ5fSwKPj4gICB9Owo+PiAgIAo+PiAgIC8qIENyZWF0ZSBNT0RVTEVfQUxJQVMoKSBzdGF0ZW1l
bnRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
