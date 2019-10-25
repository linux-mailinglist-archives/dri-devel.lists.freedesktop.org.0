Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF897E4134
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 03:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FD96E887;
	Fri, 25 Oct 2019 01:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8826E883
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 01:44:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-MJT2DVAnPa2BFC_zHXHHbQ-1; Thu, 24 Oct 2019 21:44:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A47476;
 Fri, 25 Oct 2019 01:44:40 +0000 (UTC)
Received: from [10.72.12.158] (ovpn-12-158.pek2.redhat.com [10.72.12.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A17835C1D4;
 Fri, 25 Oct 2019 01:44:06 +0000 (UTC)
Subject: Re: [PATCH V5 2/6] modpost: add support for mdev class id
To: Alex Williamson <alex.williamson@redhat.com>
References: <20191023130752.18980-1-jasowang@redhat.com>
 <20191023130752.18980-3-jasowang@redhat.com>
 <20191023154245.32e4fa49@x1.home>
 <555a101e-0ed1-2e9d-c1a4-e3b37d76bd18@redhat.com>
 <20191024135441.160daa56@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7eb2c515-74a9-7d65-e09c-dee4f952e9c1@redhat.com>
Date: Fri, 25 Oct 2019 09:44:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191024135441.160daa56@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: MJT2DVAnPa2BFC_zHXHHbQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571967888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qh0akrNYwC0Elz7QBIFcRniueVNDTS2+GYfPxYhIx0c=;
 b=F2sR4ys3CW0SPnhs00iI9LPAVsdidjB+RR1WajZzKb4rZ+JMzNahjeQ+/wJyOcH7embj4O
 1UoFR4oSzOl67RLY+K0g1UgzctpuixHK69VG3py0N9w/27ebIRsaQPyZiCyQ2Ztbjdx9ZO
 0HQaJG8S61sLu7jeT6M27RKWXmEtdpQ=
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

Ck9uIDIwMTkvMTAvMjUg5LiK5Y2IMzo1NCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFRo
dSwgMjQgT2N0IDIwMTkgMTE6MzE6MDQgKzA4MDAKPiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+PiBPbiAyMDE5LzEwLzI0IOS4iuWNiDU6NDIsIEFsZXggV2lsbGlh
bXNvbiB3cm90ZToKPj4+IE9uIFdlZCwgMjMgT2N0IDIwMTkgMjE6MDc6NDggKzA4MDAKPj4+IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4gICAKPj4+PiBBZGQgc3Vw
cG9ydCB0byBwYXJzZSBtZGV2IGNsYXNzIGlkIHRhYmxlLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6
IFBhcmF2IFBhbmRpdCA8cGFyYXZAbWVsbGFub3guY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy92
ZmlvL21kZXYvdmZpb19tZGV2LmMgICAgIHwgIDIgKysKPj4+PiAgICBzY3JpcHRzL21vZC9kZXZp
Y2V0YWJsZS1vZmZzZXRzLmMgfCAgMyArKysKPj4+PiAgICBzY3JpcHRzL21vZC9maWxlMmFsaWFz
LmMgICAgICAgICAgfCAxMCArKysrKysrKysrCj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL21kZXYvdmZp
b19tZGV2LmMgYi9kcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYwo+Pj4+IGluZGV4IDdiMjRl
ZTljYjhkZC4uY2I3MDFjZDY0NmYwIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2
L3ZmaW9fbWRldi5jCj4+Pj4gKysrIGIvZHJpdmVycy92ZmlvL21kZXYvdmZpb19tZGV2LmMKPj4+
PiBAQCAtMTI1LDYgKzEyNSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9jbGFzc19pZCBp
ZF90YWJsZVtdID0gewo+Pj4+ICAgIAl7IDAgfSwKPj4+PiAgICB9Owo+Pj4+ICAgIAo+Pj4+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG1kZXYsIGlkX3RhYmxlKTsKPj4+PiArCj4+PiBUd28gcXVlc3Rp
b25zLCBmaXJzdCB3ZSBoYXZlOgo+Pj4KPj4+ICNkZWZpbmUgTU9EVUxFX0RFVklDRV9UQUJMRSh0
eXBlLCBuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+IGV4dGVybiB0
eXBlb2YobmFtZSkgX19tb2RfIyN0eXBlIyNfXyMjbmFtZSMjX2RldmljZV90YWJsZSAgICAgICAg
ICAgICAgIFwKPj4+ICAgICBfX2F0dHJpYnV0ZV9fICgodW51c2VkLCBhbGlhcyhfX3N0cmluZ2lm
eShuYW1lKSkpKQo+Pj4KPj4+IFRoZXJlZm9yZSB3ZSdyZSBkZWZpbmluZyBfX21vZF9tZGV2X19p
ZF90YWJsZV9kZXZpY2VfdGFibGUgd2l0aCBhbGlhcwo+Pj4gaWRfdGFibGUuICBXaGVuIHRoZSB2
aXJ0aW8gbWRldiBidXMgZHJpdmVyIGlzIGFkZGVkIGluIDUvNiBpdCB1c2VzIHRoZQo+Pj4gc2Ft
ZSBuYW1lIHZhbHVlLiAgSSBzZWUgdmlydGlvIHR5cGVzIGFsbCByZWdpc3RlciB0aGlzIHdheSAo
dmlydGlvLAo+Pj4gaWRfdGFibGUpLCBzbyBJIGFzc3VtZSB0aGVyZSdzIG5vIGNvbmZsaWN0LCBi
dXQgcGNpIHR5cGVzIG1vc3RseSAobm90Cj4+PiBlbnRpcmVseSkgc2VlbSB0byB1c2UgdW5pcXVl
IG5hbWVzLiAgSXMgdGhlcmUgYSBwcmVmZXJlbmNlIHRvIG9uZSB3YXkKPj4+IG9yIHRoZSBvdGhl
ciBvciBpdCBzaW1wbHkgZG9lc24ndCBtYXR0ZXI/Cj4+Cj4+IEl0IGxvb2tzIHRvIG1lIHRoYXQg
dGhvc2Ugc3ltYm9sIHdlcmUgbG9jYWwsIHNvIGl0IGRvZXNuJ3QgbWF0dGVyLiBCdXQKPj4gaWYg
eW91IHdpc2ggSSBjYW4gc3dpdGNoIHRvIHVzZSB1bmlxdWUgbmFtZS4KPiBJIGRvbid0IGhhdmUg
YSBzdHJvbmcgb3BpbmlvbiwgSSdtIGp1c3QgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB3ZSdyZSBub3QK
PiBkb2luZyBzb21ldGhpbmcgb2J2aW91c2x5IGJyb2tlbi4KCgpZZXMsIHRvIGJlIG1vcmUgc2Fm
ZSBJIHdpbGwgc3dpdGNoIHRvIHVuaXF1ZSBuYW1lcyBoZXJlLgoKCj4KPj4+PiAgICBzdGF0aWMg
c3RydWN0IG1kZXZfZHJpdmVyIHZmaW9fbWRldl9kcml2ZXIgPSB7Cj4+Pj4gICAgCS5uYW1lCT0g
InZmaW9fbWRldiIsCj4+Pj4gICAgCS5wcm9iZQk9IHZmaW9fbWRldl9wcm9iZSwKPj4+PiBkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jIGIvc2NyaXB0cy9tb2Qv
ZGV2aWNldGFibGUtb2Zmc2V0cy5jCj4+Pj4gaW5kZXggMDU0NDA1YjkwYmE0Li42Y2JiMTA2MjQ4
OGEgMTAwNjQ0Cj4+Pj4gLS0tIGEvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jCj4+
Pj4gKysrIGIvc2NyaXB0cy9tb2QvZGV2aWNldGFibGUtb2Zmc2V0cy5jCj4+Pj4gQEAgLTIzMSw1
ICsyMzEsOCBAQCBpbnQgbWFpbih2b2lkKQo+Pj4+ICAgIAlERVZJRCh3bWlfZGV2aWNlX2lkKTsK
Pj4+PiAgICAJREVWSURfRklFTEQod21pX2RldmljZV9pZCwgZ3VpZF9zdHJpbmcpOwo+Pj4+ICAg
IAo+Pj4+ICsJREVWSUQobWRldl9jbGFzc19pZCk7Cj4+Pj4gKwlERVZJRF9GSUVMRChtZGV2X2Ns
YXNzX2lkLCBpZCk7Cj4+Pj4gKwo+Pj4+ICAgIAlyZXR1cm4gMDsKPj4+PiAgICB9Cj4+Pj4gZGlm
ZiAtLWdpdCBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYyBiL3NjcmlwdHMvbW9kL2ZpbGUyYWxp
YXMuYwo+Pj4+IGluZGV4IGM5MWViYTc1MTgwNC4uZDM2NWRmZTdjNzE4IDEwMDY0NAo+Pj4+IC0t
LSBhL3NjcmlwdHMvbW9kL2ZpbGUyYWxpYXMuYwo+Pj4+ICsrKyBiL3NjcmlwdHMvbW9kL2ZpbGUy
YWxpYXMuYwo+Pj4+IEBAIC0xMzM1LDYgKzEzMzUsMTUgQEAgc3RhdGljIGludCBkb193bWlfZW50
cnkoY29uc3QgY2hhciAqZmlsZW5hbWUsIHZvaWQgKnN5bXZhbCwgY2hhciAqYWxpYXMpCj4+Pj4g
ICAgCXJldHVybiAxOwo+Pj4+ICAgIH0KPj4+PiAgICAKPj4+PiArLyogbG9va3MgbGlrZTogIm1k
ZXY6Y04iICovCj4+Pj4gK3N0YXRpYyBpbnQgZG9fbWRldl9lbnRyeShjb25zdCBjaGFyICpmaWxl
bmFtZSwgdm9pZCAqc3ltdmFsLCBjaGFyICphbGlhcykKPj4+PiArewo+Pj4+ICsJREVGX0ZJRUxE
KHN5bXZhbCwgbWRldl9jbGFzc19pZCwgaWQpOwo+Pj4+ICsKPj4+PiArCXNwcmludGYoYWxpYXMs
ICJtZGV2OmMlMDJYIiwgaWQpOwo+Pj4gQSBsb3Qgb2YgZW50cmllcyBjYWxsIGFkZF93aWxkY2Fy
ZCgpIGhlcmUsIHNob3VsZCB3ZT8gIFNvcnJ5IGZvciB0aGUKPj4+IGJhc2ljIHF1ZXN0aW9ucywg
SSBoYXZlbid0IHBsYXllZCBpbiB0aGlzIGNvZGUuICBUaGFua3MsCj4+Cj4+IEl0J3MgcmVhbGx5
IGdvb2QgcXVlc3Rpb24uIE15IHVuZGVyc3RhbmRpbmcgaXMgd2Ugd29uJ3QgaGF2ZSBhIG1vZHVs
ZQo+PiB0aGF0IGNhbiBkZWFsIHdpdGggYWxsIGtpbmRzIG9mIGNsYXNzZXMgbGlrZSBDTEFTU19J
RF9BTlkuIFNvIHRoZXJlJ3MKPj4gcHJvYmFibHkgbm8gbmVlZCBmb3IgdGhlIHdpbGRjYXJkLgo+
IFRoZSBjb21tZW50IGZvciBhZGRfd2lsZGNhcmQoKSBpbmRpY2F0ZXMgZnV0dXJlIGV4dGVuc2lv
biwgc28gaXQncyBoYXJkCj4gdG8ga25vdyB3aGF0IHdlIG1pZ2h0IG5lZWQgaW4gdGhlIGZ1dHVy
ZSB1bnRpbCB3ZSBkbyBuZWVkIGl0LiAgVGhlCj4gbWFqb3JpdHkgb2YgbW9kdWxlcy5hbGlhcyBl
bnRyaWVzIG9uIG15IGxhcHRvcCAoZXZlbiBpZiBJIGV4Y2x1ZGUgcGNpCj4gYWxpYXNlcykgZW5k
IHdpdGggYSB3aWxkY2FyZC4gIFRoYW5rcywKCgpZZXMsIHNvIEkgd2lsbCBhZGQgdGhhdCBmb3Ig
ZnV0dXJlIGV4dGVuc2lvbi4KClRoYW5rcwoKCj4KPiBBbGV4Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
