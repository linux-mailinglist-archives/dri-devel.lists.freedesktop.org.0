Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873AE3C8F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDAA6E785;
	Thu, 24 Oct 2019 19:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8C6E784
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 19:55:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-rQGSdyFqNNOUITf7Nv_epw-1; Thu, 24 Oct 2019 15:54:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A4947B;
 Thu, 24 Oct 2019 19:54:54 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB675D9D5;
 Thu, 24 Oct 2019 19:54:42 +0000 (UTC)
Date: Thu, 24 Oct 2019 13:54:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V5 2/6] modpost: add support for mdev class id
Message-ID: <20191024135441.160daa56@x1.home>
In-Reply-To: <555a101e-0ed1-2e9d-c1a4-e3b37d76bd18@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
 <20191023130752.18980-3-jasowang@redhat.com>
 <20191023154245.32e4fa49@x1.home>
 <555a101e-0ed1-2e9d-c1a4-e3b37d76bd18@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: rQGSdyFqNNOUITf7Nv_epw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571946900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46JWhWsVeq/tB0Aj5YNxoiRSmrwdl+Kq9BaeK3ujO0U=;
 b=DFyau+12Pf776Ra8ToZbfReIJM3hr50lO1EqlGKpxMWpK9hKxLtlHi8EfiH8kRtmVZdQoy
 JpVJ1IDyNc/Pr/+n55GZM09pcm0m0bUta4d7Y+ih7FqD71L+yAQS45IKjw0MPpLgdzHqOs
 uuu/uL7ZxjoMq54T7hQLBG/3061NeOg=
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

T24gVGh1LCAyNCBPY3QgMjAxOSAxMTozMTowNCArMDgwMApKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKCj4gT24gMjAxOS8xMC8yNCDkuIrljYg1OjQyLCBBbGV4IFdpbGxp
YW1zb24gd3JvdGU6Cj4gPiBPbiBXZWQsIDIzIE9jdCAyMDE5IDIxOjA3OjQ4ICswODAwCj4gPiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ICAKPiA+PiBBZGQgc3Vw
cG9ydCB0byBwYXJzZSBtZGV2IGNsYXNzIGlkIHRhYmxlLgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6
IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFub3guY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL3Zm
aW8vbWRldi92ZmlvX21kZXYuYyAgICAgfCAgMiArKwo+ID4+ICAgc2NyaXB0cy9tb2QvZGV2aWNl
dGFibGUtb2Zmc2V0cy5jIHwgIDMgKysrCj4gPj4gICBzY3JpcHRzL21vZC9maWxlMmFsaWFzLmMg
ICAgICAgICAgfCAxMCArKysrKysrKysrCj4gPj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21k
ZXYuYyBiL2RyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jCj4gPj4gaW5kZXggN2IyNGVlOWNi
OGRkLi5jYjcwMWNkNjQ2ZjAgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy92ZmlvL21kZXYvdmZp
b19tZGV2LmMKPiA+PiArKysgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+ID4+IEBA
IC0xMjUsNiArMTI1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZGV2X2NsYXNzX2lkIGlkX3Rh
YmxlW10gPSB7Cj4gPj4gICAJeyAwIH0sCj4gPj4gICB9Owo+ID4+ICAgCj4gPj4gK01PRFVMRV9E
RVZJQ0VfVEFCTEUobWRldiwgaWRfdGFibGUpOwo+ID4+ICsgIAo+ID4gVHdvIHF1ZXN0aW9ucywg
Zmlyc3Qgd2UgaGF2ZToKPiA+Cj4gPiAjZGVmaW5lIE1PRFVMRV9ERVZJQ0VfVEFCTEUodHlwZSwg
bmFtZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiBleHRlcm4gdHlwZW9m
KG5hbWUpIF9fbW9kXyMjdHlwZSMjX18jI25hbWUjI19kZXZpY2VfdGFibGUgICAgICAgICAgICAg
ICBcCj4gPiAgICBfX2F0dHJpYnV0ZV9fICgodW51c2VkLCBhbGlhcyhfX3N0cmluZ2lmeShuYW1l
KSkpKQo+ID4KPiA+IFRoZXJlZm9yZSB3ZSdyZSBkZWZpbmluZyBfX21vZF9tZGV2X19pZF90YWJs
ZV9kZXZpY2VfdGFibGUgd2l0aCBhbGlhcwo+ID4gaWRfdGFibGUuICBXaGVuIHRoZSB2aXJ0aW8g
bWRldiBidXMgZHJpdmVyIGlzIGFkZGVkIGluIDUvNiBpdCB1c2VzIHRoZQo+ID4gc2FtZSBuYW1l
IHZhbHVlLiAgSSBzZWUgdmlydGlvIHR5cGVzIGFsbCByZWdpc3RlciB0aGlzIHdheSAodmlydGlv
LAo+ID4gaWRfdGFibGUpLCBzbyBJIGFzc3VtZSB0aGVyZSdzIG5vIGNvbmZsaWN0LCBidXQgcGNp
IHR5cGVzIG1vc3RseSAobm90Cj4gPiBlbnRpcmVseSkgc2VlbSB0byB1c2UgdW5pcXVlIG5hbWVz
LiAgSXMgdGhlcmUgYSBwcmVmZXJlbmNlIHRvIG9uZSB3YXkKPiA+IG9yIHRoZSBvdGhlciBvciBp
dCBzaW1wbHkgZG9lc24ndCBtYXR0ZXI/ICAKPiAKPiAKPiBJdCBsb29rcyB0byBtZSB0aGF0IHRo
b3NlIHN5bWJvbCB3ZXJlIGxvY2FsLCBzbyBpdCBkb2Vzbid0IG1hdHRlci4gQnV0IAo+IGlmIHlv
dSB3aXNoIEkgY2FuIHN3aXRjaCB0byB1c2UgdW5pcXVlIG5hbWUuCgpJIGRvbid0IGhhdmUgYSBz
dHJvbmcgb3BpbmlvbiwgSSdtIGp1c3QgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB3ZSdyZSBub3QKZG9p
bmcgc29tZXRoaW5nIG9idmlvdXNseSBicm9rZW4uCgo+ID4+ICAgc3RhdGljIHN0cnVjdCBtZGV2
X2RyaXZlciB2ZmlvX21kZXZfZHJpdmVyID0gewo+ID4+ICAgCS5uYW1lCT0gInZmaW9fbWRldiIs
Cj4gPj4gICAJLnByb2JlCT0gdmZpb19tZGV2X3Byb2JlLAo+ID4+IGRpZmYgLS1naXQgYS9zY3Jp
cHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgYi9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1v
ZmZzZXRzLmMKPiA+PiBpbmRleCAwNTQ0MDViOTBiYTQuLjZjYmIxMDYyNDg4YSAxMDA2NDQKPiA+
PiAtLS0gYS9zY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMKPiA+PiArKysgYi9zY3Jp
cHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMKPiA+PiBAQCAtMjMxLDUgKzIzMSw4IEBAIGlu
dCBtYWluKHZvaWQpCj4gPj4gICAJREVWSUQod21pX2RldmljZV9pZCk7Cj4gPj4gICAJREVWSURf
RklFTEQod21pX2RldmljZV9pZCwgZ3VpZF9zdHJpbmcpOwo+ID4+ICAgCj4gPj4gKwlERVZJRCht
ZGV2X2NsYXNzX2lkKTsKPiA+PiArCURFVklEX0ZJRUxEKG1kZXZfY2xhc3NfaWQsIGlkKTsKPiA+
PiArCj4gPj4gICAJcmV0dXJuIDA7Cj4gPj4gICB9Cj4gPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
bW9kL2ZpbGUyYWxpYXMuYyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+ID4+IGluZGV4IGM5
MWViYTc1MTgwNC4uZDM2NWRmZTdjNzE4IDEwMDY0NAo+ID4+IC0tLSBhL3NjcmlwdHMvbW9kL2Zp
bGUyYWxpYXMuYwo+ID4+ICsrKyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+ID4+IEBAIC0x
MzM1LDYgKzEzMzUsMTUgQEAgc3RhdGljIGludCBkb193bWlfZW50cnkoY29uc3QgY2hhciAqZmls
ZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAqYWxpYXMpCj4gPj4gICAJcmV0dXJuIDE7Cj4gPj4g
ICB9Cj4gPj4gICAKPiA+PiArLyogbG9va3MgbGlrZTogIm1kZXY6Y04iICovCj4gPj4gK3N0YXRp
YyBpbnQgZG9fbWRldl9lbnRyeShjb25zdCBjaGFyICpmaWxlbmFtZSwgdm9pZCAqc3ltdmFsLCBj
aGFyICphbGlhcykKPiA+PiArewo+ID4+ICsJREVGX0ZJRUxEKHN5bXZhbCwgbWRldl9jbGFzc19p
ZCwgaWQpOwo+ID4+ICsKPiA+PiArCXNwcmludGYoYWxpYXMsICJtZGV2OmMlMDJYIiwgaWQpOyAg
Cj4gPiBBIGxvdCBvZiBlbnRyaWVzIGNhbGwgYWRkX3dpbGRjYXJkKCkgaGVyZSwgc2hvdWxkIHdl
PyAgU29ycnkgZm9yIHRoZQo+ID4gYmFzaWMgcXVlc3Rpb25zLCBJIGhhdmVuJ3QgcGxheWVkIGlu
IHRoaXMgY29kZS4gIFRoYW5rcywgIAo+IAo+IAo+IEl0J3MgcmVhbGx5IGdvb2QgcXVlc3Rpb24u
IE15IHVuZGVyc3RhbmRpbmcgaXMgd2Ugd29uJ3QgaGF2ZSBhIG1vZHVsZSAKPiB0aGF0IGNhbiBk
ZWFsIHdpdGggYWxsIGtpbmRzIG9mIGNsYXNzZXMgbGlrZSBDTEFTU19JRF9BTlkuIFNvIHRoZXJl
J3MgCj4gcHJvYmFibHkgbm8gbmVlZCBmb3IgdGhlIHdpbGRjYXJkLgoKVGhlIGNvbW1lbnQgZm9y
IGFkZF93aWxkY2FyZCgpIGluZGljYXRlcyBmdXR1cmUgZXh0ZW5zaW9uLCBzbyBpdCdzIGhhcmQK
dG8ga25vdyB3aGF0IHdlIG1pZ2h0IG5lZWQgaW4gdGhlIGZ1dHVyZSB1bnRpbCB3ZSBkbyBuZWVk
IGl0LiAgVGhlCm1ham9yaXR5IG9mIG1vZHVsZXMuYWxpYXMgZW50cmllcyBvbiBteSBsYXB0b3Ag
KGV2ZW4gaWYgSSBleGNsdWRlIHBjaQphbGlhc2VzKSBlbmQgd2l0aCBhIHdpbGRjYXJkLiAgVGhh
bmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
