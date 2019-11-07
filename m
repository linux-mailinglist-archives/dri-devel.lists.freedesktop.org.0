Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC43F3002
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8A6F699;
	Thu,  7 Nov 2019 13:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E326EB57
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:41:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-BhQNNXH4MTueutQVI-hMlw-1; Thu, 07 Nov 2019 08:40:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14428017DD;
 Thu,  7 Nov 2019 13:40:51 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C641600D1;
 Thu,  7 Nov 2019 13:40:10 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
 <20191107080721-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <29d92758-18f7-15c7-fd04-0556b1f9033c@redhat.com>
Date: Thu, 7 Nov 2019 21:40:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107080721-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BhQNNXH4MTueutQVI-hMlw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573134059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrRk9jJT/1ACKeP3964rK2rTDoGnupNCrHKoiqqL+xU=;
 b=P9humavgHP/QJBUn5y8kkFpkj3dHiQ2RQ9BAxYSrWBIidYFISfZoF9dNFXUus+Rw5R3At7
 cDvELrvwZswJ+/yRvSbq417c593HsHkiCneTEFawvPhx0TPKyKHjeA6zpQV6bBdJR7unht
 vaCQXqtukeYgOct29Foa0ujmPOPsyN0=
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
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, airlied@linux.ie,
 heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 parav@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNyDkuIvljYg5OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDc6MDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS8xMS83IOS4i+WNiDg6NDMsIEphc29uIFdhbmcgd3JvdGU6Cj4+PiBPbiAyMDE5
LzExLzcg5LiL5Y2INzoyMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+IE9uIFRodSwg
Tm92IDA3LCAyMDE5IGF0IDA2OjE4OjQ1UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+
IE9uIDIwMTkvMTEvNyDkuIvljYg1OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4+
PiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAwOTozNTozMVBNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+Pj4+Pj4+IFRoaXMgc2FtcGxlIGRyaXZlciBjcmVhdGVzIG1kZXYgZGV2aWNlIHRoYXQg
c2ltdWxhdGUKPj4+Pj4+PiB2aXJ0aW8gbmV0IGRldmljZQo+Pj4+Pj4+IG92ZXIgdmlydGlvIG1k
ZXYgdHJhbnNwb3J0LiBUaGUgZGV2aWNlIGlzIGltcGxlbWVudGVkIHRocm91Z2ggdnJpbmdoCj4+
Pj4+Pj4gYW5kIHdvcmtxdWV1ZS4gQSBkZXZpY2Ugc3BlY2lmaWMgZG1hIG9wcyBpcyB0byBtYWtl
IHN1cmUgSFZBIGlzIHVzZWQKPj4+Pj4+PiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91
bGQgYmUgc3VmZmljaWVudCBmb3Iga2VybmVsIHZpcnRpbwo+Pj4+Pj4+IGRyaXZlciB0byB3b3Jr
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRlZCByaWdodCBu
b3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBlCj4+Pj4+Pj4gb24gdG9wIHdoaWNoIHJlcXVp
cmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0aGlzIHNhbXBsZQo+Pj4+Pj4+
IGRyaXZlci4KPj4+Pj4+Pgo+Pj4+Pj4+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrPGNvaHVja0By
ZWRoYXQuY29tPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVk
aGF0LmNvbT4KPj4+Pj4+IEknZCBwcmVmZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5n
IGVsc2UsIGUuZy4KPj4+Pj4+IG12bmV0LWxvb3BiYWNrLiBKdXN0IHNvIHBlb3BsZSBkb24ndCBl
eHBlY3QgYSBmdWxseQo+Pj4+Pj4gZnVuY3Rpb25hbCBkZXZpY2Ugc29tZWhvdy4gQ2FuIGJlIHJl
bmFtZWQgd2hlbiBhcHBseWluZz8KPj4+Pj4gQWN0dWFsbHksIEkgcGxhbiB0byBleHRlbmQgaXQg
YXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVyZmFjZSBmb3IKPj4+Pj4ga2VybmVsLiBJ
dCBjb3VsZCBiZSBlaXRoZXIgYSBzdGFuZGFsb25lIHBzZXVkbyBkZXZpY2Ugb3IgYSBzdGFjawo+
Pj4+PiBkZXZpY2UuCj4+Pj4+IERvZXMgdGhpcyBzb3VuZHMgZ29vZCB0byB5b3U/Cj4+Pj4+Cj4+
Pj4+IFRoYW5rcwo+Pj4+IFRoYXQncyBhIGJpZyBjaGFuZ2UgaW4gYW4gaW50ZXJmYWNlIHNvIGl0
J3MgYSBnb29kIHJlYXNvbgo+Pj4+IHRvIHJlbmFtZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9pbnQg
cmlnaHQ/Cj4+Pj4gT2hlcndpc2UgdXNlcnMgb2YgYW4gb2xkIGtlcm5lbCB3b3VsZCBleHBlY3Qg
YSBzdGFja2VkIGRyaXZlcgo+Pj4+IGFuZCBnZXQgYSBsb29wYmFjayBpbnN0ZWFkLgo+Pj4+Cj4+
Pj4gT3IgZGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4+Pgo+Pj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0
aGF0IGl0IHdhcyBhIHNhbXBsZSBkcml2ZXIgaW4gL2RvYy4gSXQgc2hvdWxkIG5vdAo+Pj4gYmUg
dXNlZCBpbiBwcm9kdWN0aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2UgbmVlZCB0byBtb3Zl
IGl0IHRvCj4+PiBkcml2ZXIvdmlydGlvLgo+Pj4KPj4+IEJ1dCBpZiB5b3UgaW5zaXN0LCBJIGNh
biBwb3N0IGEgVjExLgo+Pj4KPj4+IFRoYW5rcwo+Pgo+PiBPciBtYXliZSBpdCdzIGJldHRlciB0
byByZW5hbWUgdGhlIHR5cGUgb2YgY3VycmVudCBtZGV2IGZyb20gJ3ZpcnRpbycgdG8KPj4gJ3Zp
cnRpby1sb29wYmFjaycuIFRoZW4gd2UgY2FuIGFkZCBtb3JlIHR5cGVzIGluIHRoZSBmdXR1cmUu
Cj4+Cj4+IFRoYW5rcwo+Pgo+IE1heWJlIGJ1dCBpcyB2aXJ0aW8gYWN0dWFsbHkgYSBsb29wYmFj
ayBzb21laG93PyBJIHRob3VnaHQgd2UKPiBjYW4gYmluZCBhIHJlZ3VsYXIgdmlydGlvIGRldmlj
ZSB0aGVyZSwgbm8/CgoKSXQgaGFzIGEgcHJlZml4LCBzbyB1c2VyIHdpbGwgc2VlICJtdm5ldC12
aXJ0aW8tbG9vcGJhY2siLgoKVGhhbmtzCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
