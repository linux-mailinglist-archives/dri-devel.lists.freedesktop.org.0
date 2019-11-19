Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFC1025CF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 15:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7FD6E222;
	Tue, 19 Nov 2019 14:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BDE6E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:02:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-0_w2d86zPMmnoCBxPShQnw-1; Tue, 19 Nov 2019 09:02:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D4C107ACC4;
 Tue, 19 Nov 2019 14:02:38 +0000 (UTC)
Received: from [10.72.12.74] (ovpn-12-74.pek2.redhat.com [10.72.12.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B92A4DA29;
 Tue, 19 Nov 2019 14:02:11 +0000 (UTC)
Subject: Re: [PATCH V13 4/6] mdev: introduce mediated virtio bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-5-jasowang@redhat.com>
 <20191118134056.GJ3873@mellanox.com>
 <20191118152642-mutt-send-email-mst@kernel.org>
 <20191118202843.GN3873@mellanox.com>
 <a09f528f-cfca-69cf-4728-91ff33c5caa7@redhat.com>
 <20191119123803.GA26739@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d38abc98-b828-64cd-50cd-cb0d239e1696@redhat.com>
Date: Tue, 19 Nov 2019 22:02:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191119123803.GA26739@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 0_w2d86zPMmnoCBxPShQnw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574172165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JEYo7vkZRzM4fWfOlSbwo2VIdSTxW8ivT0r70uhsMc=;
 b=SS7FP0dgSdbtTWe1hZNNvJ3NWshmapx0Hrv/orhVtqH5dT1/Hc0rGwM2yYQRi+GCz499Fp
 uLOMHR816M/ClWCjCH32lTZE12Pb/+g25eNtatPgf/5sGxwECV/q2feVUZW2UgP6NENZol
 9lEag9T6ceb84Q0NsITolSH4hNYStX0=
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvMTkg5LiL5Y2IODozOCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFR1
ZSwgTm92IDE5LCAyMDE5IGF0IDEwOjQxOjMxQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IE9uIDIwMTkvMTEvMTkg5LiK5Y2INDoyOCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24g
TW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6Mjc6MTNQTSAtMDUwMCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+Pj4+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjQxOjAwUE0gKzAwMDAsIEph
c29uIEd1bnRob3JwZSB3cm90ZToKPj4+Pj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDY6NTk6
MjFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+ICtzdHJ1Y3QgYnVzX3R5cGUgbWRl
dl92aXJ0aW9fYnVzX3R5cGU7Cj4+Pj4+PiArCj4+Pj4+PiArc3RydWN0IG1kZXZfdmlydGlvX2Rl
dmljZSB7Cj4+Pj4+PiArCXN0cnVjdCBtZGV2X2RldmljZSBtZGV2Owo+Pj4+Pj4gKwljb25zdCBz
dHJ1Y3QgbWRldl92aXJ0aW9fb3BzICpvcHM7Cj4+Pj4+PiArCXUxNiBjbGFzc19pZDsKPj4+Pj4+
ICt9Owo+Pj4+PiBUaGlzIHNlZW1zIHRvIHNoYXJlIG5vdGhpbmcgd2l0aCBtZGV2IChpZSBtZGV2
LXZmaW8pLCB3aHkgaXMgaXQgb24gdGhlCj4+Pj4+IHNhbWUgYnVzPwo+Pj4+IEkgbXVzdCBiZSBt
aXNzaW5nIHNvbWV0aGluZyAtIHdoaWNoIGJ1cyBkbyB0aGV5IHNoYXJlPwo+Pj4gbWRldl9idXNf
dHlwZSA/Cj4+Pgo+Pj4gSmFzb24KPj4KPj4gTm90ZTogdmlydGlvIGhhcyBpdHMgb3duIGJ1czog
bWRldl92aXJ0aW9fYnVzX3R5cGUuIFNvIHRoZXkgYXJlIG5vdCB0aGUgc2FtZQo+PiBidXMuCj4g
VGhhdCBpcyBldmVuIHdvcnNlLCB3aHkgaW52b2x2ZSBzdHJ1Y3QgbWRldl9kZXZpY2UgYXQgYWxs
IHRoZW4/Cj4KPiBKYXNvbgoKCkkgZG9uJ3QgcXVpdGUgZ2V0IHRoZSBxdWVzdGlvbiBoZXJlLgoK
TXkgdW5kZXJzdGFuZGluZyBmb3IgbWRldiBpcyB0aGF0IGl0IHdhcyBhIG1lZGlhdG9yIGJldHdl
ZW4gdGhlIGRyaXZlciAKYW5kIHBoeXNpY2FsIGRldmljZSB3aGVuIGl0J3MgaGFyZCB0byBsZXQg
dGhlbSB0YWxrIGRpcmVjdGx5IGR1ZSB0byB0aGUgCmNvbXBsZXhpdHkgb2YgcmVmYWN0b3Jpbmcg
YW5kIG1haW50ZW5hbmNlLiBUaGlzIGlzIGV4YWN0IHRoZSBjYXNlIG9mIApoYXJkd2FyZSB0aGF0
IGNhbiBvZmZsb2FkIHZpcnRpbyBkYXRhcGF0aCBidXQgbm90IGNvbnRyb2wgcGF0aC4gV2Ugd2Fu
dCAKdG8gcHJlc2VudCBhIHVuaWZpZWQgaW50ZXJmYWNlIChzdGFuZGFyZCB2aXJ0aW8pIGluc3Rl
YWQgb2YgYSB2ZW5kb3IgCnNwZWNpZmljIGludGVyZmFjZSwgc28gYSBtZWRpYXRvciBsZXZlbCBp
biB0aGUgbWlkZGxlIGlzIGEgbXVzdC4gRm9yIAp2aXJ0aW8gZHJpdmVyLCBtZWRpYXRvciBwcmVz
ZW50IGEgZnVsbCB2aXJ0aW8gY29tcGF0aWJsZSBkZXZpY2UuIEZvciAKaGFyZHdhcmUsIG1lZGlh
dG9yIHdpbGwgbWVkaWF0ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBiZWhhdmlvciAKZGVm
aW5lZCBieSB2aXJ0aW8gc3BlYyBhbmQgcmVhbCBoYXJkd2FyZS4KCkFuZCB0aGUgcmVhc29uIHdo
eSBub3QgaW52ZW50aW5nIHNvbWV0aGluZyBuZXcgaW5zdGVhZCBvZiBleGlzdGVkIG1kZXYgCmlz
IGJlY2F1c2UgbWRldiBmaXRzIGludG8gdGhlIHJlcXVpcmVtZW50IG9mIHZpcnRpby1tZGV2IHZl
cnkgd2VsbDoKMSkgbWF0dXJlIGZyYW1ld29yayB3aGljaCBoYXMgYmVlbiB1c2VkIGJ5IHZHUFUg
YW5kIG90aGVyIHR5cGUgZm9yIHllYXJzCjIpIGxpZmUgY3ljbGUgaW50ZXJmYWNlLCBoYXZlIGEg
dW5pZmllZCBpbnRlcmZhY2UgZm9yIG1hbmFnZW1lbnQgaW5zdGVhZCAKb2YgYSB2ZW5kb3Igc3Bl
Y2lmaWMgb25lIHNvIGxlc3MgcGFpbiBmb3IgbWFuYWdlbWVudAozKSBkZXZpY2UgdHlwZSBtYW5h
Z2VtZW50LiBJbiB0aGUgY2FzZSBvZiB2aXJ0aW8sIHVzZXIgY2FuIGNob29zZSB0byAKY3JlYXRl
IGEgdmhvc3QgdHlwZSBvZiBkZXZpY2Ugb3IgdmlydGlvIHR5cGUgb2YgZGV2aWNlLCBvciB0ZWNo
bmljYWxseSAKaXQgY2FuIGNob29zZSB3aGljaCB2ZXJzaW9uIG9yIGZlYXR1cmVzIG9mIHZpcnRp
byBkZXZpY2UgaXQgd2FudCB0byBjcmVhdGUuCjQpIElPTU1VIHN1cHBvcnQsIG1kZXYgYWxsb3dz
IERNQSBpc29sYXRpb24gZG9uZSBhdCBlaXRoZXIgcGFyZW50IGxldmVsIApvciBwbGF0Zm9ybS9i
dXMgbGV2ZWwKNSkgdmVuZG9yIHNwZWNpZmljIGF0dHJpYnV0ZXMKClNvIGluIFBhcmF2J3MgdGhy
ZWFkIFsxXSwgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseS7CoCBUaGUgbWFqb3IgY29uY2VybiAK
aXMgdGhlwqAgQVBJIG11bHRpcGxleGVyIGF0IGEgc2luZ2xlIG1kZXYgYnVzIGxldmVsLiBTbyBj
b21lcyB0byB0aGlzIApzZXJpZXMgd2hpY2ggZGVjb3VwbGUgVkZJTyBhbmQgbWFrZSBtZGV2IG1v
cmUgZ2VuZXJpYyB0byBiZSBzdWl0YWJsZSBmb3IgCmltcGxlbWVudGluZyBhIHNldCBvZiBpbmRl
cGVuZGVudCBidXNlcyB3aXRoIHNpbWlsYXIgZnVuY3Rpb25zLgoKVGhhbmtzCgpbMV0gaHR0cHM6
Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtcmRtYS9tc2c4NTg1Ni5odG1sCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
