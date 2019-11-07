Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1053F2F6F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65186EB55;
	Thu,  7 Nov 2019 13:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59C46EB55
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:33:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-OCtDdWVKNrKS2VpNpFxOEw-1; Thu, 07 Nov 2019 08:33:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA6831005500;
 Thu,  7 Nov 2019 13:32:56 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D50B360BE0;
 Thu,  7 Nov 2019 13:32:30 +0000 (UTC)
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <20191107080834-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b2265e3a-6f86-c21a-2ebd-d0e4eea2886f@redhat.com>
Date: Thu, 7 Nov 2019 21:32:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107080834-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OCtDdWVKNrKS2VpNpFxOEw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573133586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtVPfNetgN4OJ+kdxUdEeGOlhfhZVM+OtnzXrAWUlvU=;
 b=JuKqHTEXHI2vUrDRLUkSdATj5JdKDdInnR2XJbmlW+FBegts6jggMCiQSF0xflxt1hEouh
 zA2GWpuXUNKII8/wN7BhsRPB1UJoqM0cY44blFgyHxdAKYlk0oC+42Ywteb/v52DW0gWxd
 YFsyF6iQs1BgaZ5ujMHpNe46wxjHm4A=
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

Ck9uIDIwMTkvMTEvNyDkuIvljYg5OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDM6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDA2OjE4OjQ1UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS8xMS83IOS4i+WNiDU6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IFRoaXMgc2FtcGxlIGRyaXZlciBjcmVhdGVzIG1kZXYgZGV2aWNl
IHRoYXQgc2ltdWxhdGUgdmlydGlvIG5ldCBkZXZpY2UKPj4+Pj4+IG92ZXIgdmlydGlvIG1kZXYg
dHJhbnNwb3J0LiBUaGUgZGV2aWNlIGlzIGltcGxlbWVudGVkIHRocm91Z2ggdnJpbmdoCj4+Pj4+
PiBhbmQgd29ya3F1ZXVlLiBBIGRldmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3Vy
ZSBIVkEgaXMgdXNlZAo+Pj4+Pj4gZGlyZWN0bHkgYXMgdGhlIElPVkEuIFRoaXMgc2hvdWxkIGJl
IHN1ZmZpY2llbnQgZm9yIGtlcm5lbCB2aXJ0aW8KPj4+Pj4+IGRyaXZlciB0byB3b3JrLgo+Pj4+
Pj4KPj4+Pj4+IE9ubHkgJ3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBs
YW4gdG8gYWRkICd2aG9zdCcgdHlwZQo+Pj4+Pj4gb24gdG9wIHdoaWNoIHJlcXVpcmVzIHNvbWUg
dmlydHVhbCBJT01NVSBpbXBsZW1lbnRlZCBpbiB0aGlzIHNhbXBsZQo+Pj4+Pj4gZHJpdmVyLgo+
Pj4+Pj4KPj4+Pj4+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrPGNvaHVja0ByZWRoYXQuY29tPgo+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+
PiBJJ2QgcHJlZmVyIGl0IHRoYXQgd2UgY2FsbCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4+
Pj4+IG12bmV0LWxvb3BiYWNrLiBKdXN0IHNvIHBlb3BsZSBkb24ndCBleHBlY3QgYSBmdWxseQo+
Pj4+PiBmdW5jdGlvbmFsIGRldmljZSBzb21laG93LiBDYW4gYmUgcmVuYW1lZCB3aGVuIGFwcGx5
aW5nPwo+Pj4+IEFjdHVhbGx5LCBJIHBsYW4gdG8gZXh0ZW5kIGl0IGFzIGFub3RoZXIgc3RhbmRh
cmQgbmV0d29yayBpbnRlcmZhY2UgZm9yCj4+Pj4ga2VybmVsLiBJdCBjb3VsZCBiZSBlaXRoZXIg
YSBzdGFuZGFsb25lIHBzZXVkbyBkZXZpY2Ugb3IgYSBzdGFjayBkZXZpY2UuCj4+Pj4gRG9lcyB0
aGlzIHNvdW5kcyBnb29kIHRvIHlvdT8KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gVGhhdCdzIGEgYmln
IGNoYW5nZSBpbiBhbiBpbnRlcmZhY2Ugc28gaXQncyBhIGdvb2QgcmVhc29uCj4+PiB0byByZW5h
bWUgdGhlIGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+Pj4gT2hlcndpc2UgdXNlcnMgb2Yg
YW4gb2xkIGtlcm5lbCB3b3VsZCBleHBlY3QgYSBzdGFja2VkIGRyaXZlcgo+Pj4gYW5kIGdldCBh
IGxvb3BiYWNrIGluc3RlYWQuCj4+Pgo+Pj4gT3IgZGlkIEkgbWlzcyBzb21ldGhpbmc/Cj4+Cj4+
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBpdCB3YXMgYSBzYW1wbGUgZHJpdmVyIGluIC9kb2Mu
IEl0IHNob3VsZCBub3QgYmUKPj4gdXNlZCBpbiBwcm9kdWN0aW9uIGVudmlyb25tZW50LiBPdGhl
cndpc2Ugd2UgbmVlZCB0byBtb3ZlIGl0IHRvCj4+IGRyaXZlci92aXJ0aW8uCj4+Cj4+IEJ1dCBp
ZiB5b3UgaW5zaXN0LCBJIGNhbiBwb3N0IGEgVjExLgo+Pgo+PiBUaGFua3MKPiB0aGlzIGNhbiBi
ZSBhIHBhdGNoIG9uIHRvcC4KCgpUaGVuIG1heWJlIGl0J3MgYmV0dGVyIGp1c3QgZXh0ZW5kIGl0
IHRvIHdvcmsgYXMgYSBub3JtYWwgbmV0d29ya2luZyAKZGV2aWNlIG9uIHRvcD8KClRoYW5rcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
