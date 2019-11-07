Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3281F2E50
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 13:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D96D6E484;
	Thu,  7 Nov 2019 12:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9266E484
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 12:43:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-8LDROsBLN-2gMmnotsVoag-1; Thu, 07 Nov 2019 07:43:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CEED477;
 Thu,  7 Nov 2019 12:43:45 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A587D608AC;
 Thu,  7 Nov 2019 12:43:31 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
Date: Thu, 7 Nov 2019 20:43:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107061942-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 8LDROsBLN-2gMmnotsVoag-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573130633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pATjVuxpgA+rUzNn2lzZ9Qgz3lzYzBUuXos2KOBhUA8=;
 b=bl+vmigeVJGr5HxXEqOWfdH8REhMWohJ62gxE0mpTRlHD8bF9GQPcke6EgJ3r1yEwmD/i8
 Rwnp0EFirpQi5hydm1ePkmK473XT6U3/rX55lHdrGY6V6BblNoenTkNzazuII7trzrfeEb
 EbPDm1kvbXeC1F5BnVCCAea+zHew+dI=
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
 airlied@linux.ie, heiko.carstens@de.ibm.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kwankhede@nvidia.com, rob.miller@broadcom.com, linux-s390@vger.kernel.org,
 sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, haotian.wang@sifive.com,
 cunming.liang@intel.com, zhi.a.wang@intel.com, farman@linux.ibm.com,
 idos@mellanox.com, gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 alex.williamson@redhat.com, xiao.w.wang@intel.com, freude@linux.ibm.com,
 parav@mellanox.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 oberpar@linux.ibm.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvNyDkuIvljYg3OjIxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS8xMS83IOS4i+WNiDU6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDA5OjM1OjMxUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11
bGF0ZSB2aXJ0aW8gbmV0IGRldmljZQo+Pj4+IG92ZXIgdmlydGlvIG1kZXYgdHJhbnNwb3J0LiBU
aGUgZGV2aWNlIGlzIGltcGxlbWVudGVkIHRocm91Z2ggdnJpbmdoCj4+Pj4gYW5kIHdvcmtxdWV1
ZS4gQSBkZXZpY2Ugc3BlY2lmaWMgZG1hIG9wcyBpcyB0byBtYWtlIHN1cmUgSFZBIGlzIHVzZWQK
Pj4+PiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Ig
a2VybmVsIHZpcnRpbwo+Pj4+IGRyaXZlciB0byB3b3JrLgo+Pj4+Cj4+Pj4gT25seSAndmlydGlv
JyB0eXBlIGlzIHN1cHBvcnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBhZGQgJ3Zob3N0JyB0eXBl
Cj4+Pj4gb24gdG9wIHdoaWNoIHJlcXVpcmVzIHNvbWUgdmlydHVhbCBJT01NVSBpbXBsZW1lbnRl
ZCBpbiB0aGlzIHNhbXBsZQo+Pj4+IGRyaXZlci4KPj4+Pgo+Pj4+IEFja2VkLWJ5OiBDb3JuZWxp
YSBIdWNrPGNvaHVja0ByZWRoYXQuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+IEknZCBwcmVmZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMg
c29tZXRoaW5nIGVsc2UsIGUuZy4KPj4+IG12bmV0LWxvb3BiYWNrLiBKdXN0IHNvIHBlb3BsZSBk
b24ndCBleHBlY3QgYSBmdWxseQo+Pj4gZnVuY3Rpb25hbCBkZXZpY2Ugc29tZWhvdy4gQ2FuIGJl
IHJlbmFtZWQgd2hlbiBhcHBseWluZz8KPj4gQWN0dWFsbHksIEkgcGxhbiB0byBleHRlbmQgaXQg
YXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVyZmFjZSBmb3IKPj4ga2VybmVsLiBJdCBj
b3VsZCBiZSBlaXRoZXIgYSBzdGFuZGFsb25lIHBzZXVkbyBkZXZpY2Ugb3IgYSBzdGFjayBkZXZp
Y2UuCj4+IERvZXMgdGhpcyBzb3VuZHMgZ29vZCB0byB5b3U/Cj4+Cj4+IFRoYW5rcwo+IFRoYXQn
cyBhIGJpZyBjaGFuZ2UgaW4gYW4gaW50ZXJmYWNlIHNvIGl0J3MgYSBnb29kIHJlYXNvbgo+IHRv
IHJlbmFtZSB0aGUgZHJpdmVyIGF0IHRoYXQgcG9pbnQgcmlnaHQ/Cj4gT2hlcndpc2UgdXNlcnMg
b2YgYW4gb2xkIGtlcm5lbCB3b3VsZCBleHBlY3QgYSBzdGFja2VkIGRyaXZlcgo+IGFuZCBnZXQg
YSBsb29wYmFjayBpbnN0ZWFkLgo+Cj4gT3IgZGlkIEkgbWlzcyBzb21ldGhpbmc/CgoKTXkgdW5k
ZXJzdGFuZGluZyBpcyB0aGF0IGl0IHdhcyBhIHNhbXBsZSBkcml2ZXIgaW4gL2RvYy4gSXQgc2hv
dWxkIG5vdCAKYmUgdXNlZCBpbiBwcm9kdWN0aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2Ug
bmVlZCB0byBtb3ZlIGl0IHRvIApkcml2ZXIvdmlydGlvLgoKQnV0IGlmIHlvdSBpbnNpc3QsIEkg
Y2FuIHBvc3QgYSBWMTEuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
