Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF61E2593
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 23:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882E76E042;
	Wed, 23 Oct 2019 21:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0856E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 21:43:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-O4PFHJpqNaaC_G9ArySt4g-1; Wed, 23 Oct 2019 17:43:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEBC01800D6B;
 Wed, 23 Oct 2019 21:43:11 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0666F5D6D0;
 Wed, 23 Oct 2019 21:42:45 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:42:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 2/6] modpost: add support for mdev class id
Message-ID: <20191023154245.32e4fa49@x1.home>
In-Reply-To: <20191023130752.18980-3-jasowang@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
 <20191023130752.18980-3-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: O4PFHJpqNaaC_G9ArySt4g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571866999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hpFFnPZykrPqLg3oDhEyOYsEg/U+o2e+slzG/d5mzQ=;
 b=DJEOMJibX2fUf5gJXlnPKMitVY1S6TNQdFMHFd/vJeuwuoMeA9j3ExrFAfNFh56HXXddej
 ChzMR5LH/ARdQAo5xirDggDrSFXbp1KA6v6tR5HQaw0CJpTVbbxJqRPq+akSbIEU3rNQMc
 uweQ71rN2q8lWbss9ryEQ0rtvd9qYkY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMyBPY3QgMjAxOSAyMTowNzo0OCArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gQWRkIHN1cHBvcnQgdG8gcGFyc2UgbWRldiBjbGFzcyBpZCB0
YWJsZS4KPiAKPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgIHwgIDIgKysKPiAgc2NyaXB0cy9t
b2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIHwgIDMgKysrCj4gIHNjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYyAgICAgICAgICB8IDEwICsrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5j
IGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPiBpbmRleCA3YjI0ZWU5Y2I4ZGQuLmNi
NzAxY2Q2NDZmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+
ICsrKyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCj4gQEAgLTEyNSw2ICsxMjUsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1kZXZfY2xhc3NfaWQgaWRfdGFibGVbXSA9IHsKPiAgCXsg
MCB9LAo+ICB9Owo+ICAKPiArTU9EVUxFX0RFVklDRV9UQUJMRShtZGV2LCBpZF90YWJsZSk7Cj4g
KwoKVHdvIHF1ZXN0aW9ucywgZmlyc3Qgd2UgaGF2ZToKCiNkZWZpbmUgTU9EVUxFX0RFVklDRV9U
QUJMRSh0eXBlLCBuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKZXh0ZXJu
IHR5cGVvZihuYW1lKSBfX21vZF8jI3R5cGUjI19fIyNuYW1lIyNfZGV2aWNlX3RhYmxlICAgICAg
ICAgICAgICAgXAogIF9fYXR0cmlidXRlX18gKCh1bnVzZWQsIGFsaWFzKF9fc3RyaW5naWZ5KG5h
bWUpKSkpCgpUaGVyZWZvcmUgd2UncmUgZGVmaW5pbmcgX19tb2RfbWRldl9faWRfdGFibGVfZGV2
aWNlX3RhYmxlIHdpdGggYWxpYXMKaWRfdGFibGUuICBXaGVuIHRoZSB2aXJ0aW8gbWRldiBidXMg
ZHJpdmVyIGlzIGFkZGVkIGluIDUvNiBpdCB1c2VzIHRoZQpzYW1lIG5hbWUgdmFsdWUuICBJIHNl
ZSB2aXJ0aW8gdHlwZXMgYWxsIHJlZ2lzdGVyIHRoaXMgd2F5ICh2aXJ0aW8sCmlkX3RhYmxlKSwg
c28gSSBhc3N1bWUgdGhlcmUncyBubyBjb25mbGljdCwgYnV0IHBjaSB0eXBlcyBtb3N0bHkgKG5v
dAplbnRpcmVseSkgc2VlbSB0byB1c2UgdW5pcXVlIG5hbWVzLiAgSXMgdGhlcmUgYSBwcmVmZXJl
bmNlIHRvIG9uZSB3YXkKb3IgdGhlIG90aGVyIG9yIGl0IHNpbXBseSBkb2Vzbid0IG1hdHRlcj8K
Cj4gIHN0YXRpYyBzdHJ1Y3QgbWRldl9kcml2ZXIgdmZpb19tZGV2X2RyaXZlciA9IHsKPiAgCS5u
YW1lCT0gInZmaW9fbWRldiIsCj4gIAkucHJvYmUJPSB2ZmlvX21kZXZfcHJvYmUsCj4gZGlmZiAt
LWdpdCBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyBiL3NjcmlwdHMvbW9kL2Rl
dmljZXRhYmxlLW9mZnNldHMuYwo+IGluZGV4IDA1NDQwNWI5MGJhNC4uNmNiYjEwNjI0ODhhIDEw
MDY0NAo+IC0tLSBhL3NjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYwo+ICsrKyBiL3Nj
cmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYwo+IEBAIC0yMzEsNSArMjMxLDggQEAgaW50
IG1haW4odm9pZCkKPiAgCURFVklEKHdtaV9kZXZpY2VfaWQpOwo+ICAJREVWSURfRklFTEQod21p
X2RldmljZV9pZCwgZ3VpZF9zdHJpbmcpOwo+ICAKPiArCURFVklEKG1kZXZfY2xhc3NfaWQpOwo+
ICsJREVWSURfRklFTEQobWRldl9jbGFzc19pZCwgaWQpOwo+ICsKPiAgCXJldHVybiAwOwo+ICB9
Cj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYyBiL3NjcmlwdHMvbW9kL2Zp
bGUyYWxpYXMuYwo+IGluZGV4IGM5MWViYTc1MTgwNC4uZDM2NWRmZTdjNzE4IDEwMDY0NAo+IC0t
LSBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+ICsrKyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYwo+IEBAIC0xMzM1LDYgKzEzMzUsMTUgQEAgc3RhdGljIGludCBkb193bWlfZW50cnkoY29u
c3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAqYWxpYXMpCj4gIAlyZXR1cm4g
MTsKPiAgfQo+ICAKPiArLyogbG9va3MgbGlrZTogIm1kZXY6Y04iICovCj4gK3N0YXRpYyBpbnQg
ZG9fbWRldl9lbnRyeShjb25zdCBjaGFyICpmaWxlbmFtZSwgdm9pZCAqc3ltdmFsLCBjaGFyICph
bGlhcykKPiArewo+ICsJREVGX0ZJRUxEKHN5bXZhbCwgbWRldl9jbGFzc19pZCwgaWQpOwo+ICsK
PiArCXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOwoKQSBsb3Qgb2YgZW50cmllcyBj
YWxsIGFkZF93aWxkY2FyZCgpIGhlcmUsIHNob3VsZCB3ZT8gIFNvcnJ5IGZvciB0aGUKYmFzaWMg
cXVlc3Rpb25zLCBJIGhhdmVuJ3QgcGxheWVkIGluIHRoaXMgY29kZS4gIFRoYW5rcywKCkFsZXgK
Cj4gKwlyZXR1cm4gMTsKPiArfQo+ICsKPiAgLyogRG9lcyBuYW1lbGVuIGJ5dGVzIG9mIG5hbWUg
ZXhhY3RseSBtYXRjaCB0aGUgc3ltYm9sPyAqLwo+ICBzdGF0aWMgYm9vbCBzeW1faXMoY29uc3Qg
Y2hhciAqbmFtZSwgdW5zaWduZWQgbmFtZWxlbiwgY29uc3QgY2hhciAqc3ltYm9sKQo+ICB7Cj4g
QEAgLTE0MDcsNiArMTQxNiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2dGFibGUgZGV2dGFi
bGVbXSA9IHsKPiAgCXsidHlwZWMiLCBTSVpFX3R5cGVjX2RldmljZV9pZCwgZG9fdHlwZWNfZW50
cnl9LAo+ICAJeyJ0ZWUiLCBTSVpFX3RlZV9jbGllbnRfZGV2aWNlX2lkLCBkb190ZWVfZW50cnl9
LAo+ICAJeyJ3bWkiLCBTSVpFX3dtaV9kZXZpY2VfaWQsIGRvX3dtaV9lbnRyeX0sCj4gKwl7Im1k
ZXYiLCBTSVpFX21kZXZfY2xhc3NfaWQsIGRvX21kZXZfZW50cnl9LAo+ICB9Owo+ICAKPiAgLyog
Q3JlYXRlIE1PRFVMRV9BTElBUygpIHN0YXRlbWVudHMuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
