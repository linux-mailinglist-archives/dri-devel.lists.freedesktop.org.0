Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F700F2ED8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44E76F690;
	Thu,  7 Nov 2019 13:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B0D6F687
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:08:32 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E900F5945C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:08:31 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id q54so2482722qtk.15
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 05:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tXcdjIfv7WULf2HezusDMoDHkz/54up9J9zs1V5mjUk=;
 b=FD5t7pkYZTDuBE+qyx4/tC/V5zY7sz90e6Be2juf0CrwdTGUgl4IyuGs07CCKjLkcd
 aOIxv48as9CtNFVBSb8rUQEYuuU6LkOb+oowcah42l7Jvy6cbRh60OqVeGcLvi7LNeON
 pDHJ3CBtPsdtrP0sHpQsShJxxX/ziTTePaeQ9DozFIKu/llyeYJ8pjM7vBy0W2rb5pmR
 qwkaq1Few8w4i8hwlGsTQ/aQyx4NQ3Sbkgh9vgercvKVfTIpnqeAvL8whnNMRPkhJx6Q
 cklb00qwcHRQ0DKTEIyXYpnLbh8KtP0psIeSjoxQiGqrEo1Tb60xJXpB8E+n7l5uNIQC
 /7cg==
X-Gm-Message-State: APjAAAXdWiV6AbGn89oD96/JjEwM8iukOtSGCp0HpmQMJCb1XBVj45Zr
 u94pQ1JmFE7RDfDR9ZSI+ICEw8eU4/brN7YZBPAGPBb+610EoVGFNvec4lz1AzRdsxzgEPBOzf9
 3xw0ryGzi9y1nSUwQkw/y7eWB+R52
X-Received: by 2002:a0c:e947:: with SMTP id n7mr3315681qvo.103.1573132111121; 
 Thu, 07 Nov 2019 05:08:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzprSHQlujR1MF9UHe+PqRrS5UswVR63DxA+6BEPw7ceXTuOVmM5LOubh+MnCt3hahFb/kSQ==
X-Received: by 2002:a0c:e947:: with SMTP id n7mr3315638qvo.103.1573132110806; 
 Thu, 07 Nov 2019 05:08:30 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id 11sm1387231qtx.45.2019.11.07.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:08:29 -0800 (PST)
Date: Thu, 7 Nov 2019 08:08:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107080721-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDc6MDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2IODo0MywgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+
ID4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+
ID4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MTg6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gPiBPbiAyMDE5LzExLzcg5LiL5Y2INTowOCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzU6MzFQTSArMDgw
MCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gVGhpcyBzYW1wbGUgZHJpdmVyIGNyZWF0
ZXMgbWRldiBkZXZpY2UgdGhhdCBzaW11bGF0ZQo+ID4gPiA+ID4gPiB2aXJ0aW8gbmV0IGRldmlj
ZQo+ID4gPiA+ID4gPiBvdmVyIHZpcnRpbyBtZGV2IHRyYW5zcG9ydC4gVGhlIGRldmljZSBpcyBp
bXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+ID4gPiA+ID4gPiBhbmQgd29ya3F1ZXVlLiBBIGRl
dmljZSBzcGVjaWZpYyBkbWEgb3BzIGlzIHRvIG1ha2Ugc3VyZSBIVkEgaXMgdXNlZAo+ID4gPiA+
ID4gPiBkaXJlY3RseSBhcyB0aGUgSU9WQS4gVGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBmb3Ig
a2VybmVsIHZpcnRpbwo+ID4gPiA+ID4gPiBkcml2ZXIgdG8gd29yay4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IE9ubHkgJ3ZpcnRpbycgdHlwZSBpcyBzdXBwb3J0ZWQgcmlnaHQgbm93LiBJIHBs
YW4gdG8gYWRkICd2aG9zdCcgdHlwZQo+ID4gPiA+ID4gPiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMg
c29tZSB2aXJ0dWFsIElPTU1VIGltcGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4gPiA+ID4gPiA+
IGRyaXZlci4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNr
PGNvaHVja0ByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5n
PGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+ID4gPiBJJ2QgcHJlZmVyIGl0IHRoYXQgd2UgY2Fs
bCB0aGlzIHNvbWV0aGluZyBlbHNlLCBlLmcuCj4gPiA+ID4gPiBtdm5ldC1sb29wYmFjay4gSnVz
dCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiA+ID4gPiA+IGZ1bmN0aW9uYWwgZGV2
aWNlIHNvbWVob3cuIENhbiBiZSByZW5hbWVkIHdoZW4gYXBwbHlpbmc/Cj4gPiA+ID4gQWN0dWFs
bHksIEkgcGxhbiB0byBleHRlbmQgaXQgYXMgYW5vdGhlciBzdGFuZGFyZCBuZXR3b3JrIGludGVy
ZmFjZSBmb3IKPiA+ID4gPiBrZXJuZWwuIEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUg
cHNldWRvIGRldmljZSBvciBhIHN0YWNrCj4gPiA+ID4gZGV2aWNlLgo+ID4gPiA+IERvZXMgdGhp
cyBzb3VuZHMgZ29vZCB0byB5b3U/Cj4gPiA+ID4gCj4gPiA+ID4gVGhhbmtzCj4gPiA+IFRoYXQn
cyBhIGJpZyBjaGFuZ2UgaW4gYW4gaW50ZXJmYWNlIHNvIGl0J3MgYSBnb29kIHJlYXNvbgo+ID4g
PiB0byByZW5hbWUgdGhlIGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+ID4gPiBPaGVyd2lz
ZSB1c2VycyBvZiBhbiBvbGQga2VybmVsIHdvdWxkIGV4cGVjdCBhIHN0YWNrZWQgZHJpdmVyCj4g
PiA+IGFuZCBnZXQgYSBsb29wYmFjayBpbnN0ZWFkLgo+ID4gPiAKPiA+ID4gT3IgZGlkIEkgbWlz
cyBzb21ldGhpbmc/Cj4gPiAKPiA+IAo+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IHdh
cyBhIHNhbXBsZSBkcml2ZXIgaW4gL2RvYy4gSXQgc2hvdWxkIG5vdAo+ID4gYmUgdXNlZCBpbiBw
cm9kdWN0aW9uIGVudmlyb25tZW50LiBPdGhlcndpc2Ugd2UgbmVlZCB0byBtb3ZlIGl0IHRvCj4g
PiBkcml2ZXIvdmlydGlvLgo+ID4gCj4gPiBCdXQgaWYgeW91IGluc2lzdCwgSSBjYW4gcG9zdCBh
IFYxMS4KPiA+IAo+ID4gVGhhbmtzCj4gCj4gCj4gT3IgbWF5YmUgaXQncyBiZXR0ZXIgdG8gcmVu
YW1lIHRoZSB0eXBlIG9mIGN1cnJlbnQgbWRldiBmcm9tICd2aXJ0aW8nIHRvCj4gJ3ZpcnRpby1s
b29wYmFjaycuIFRoZW4gd2UgY2FuIGFkZCBtb3JlIHR5cGVzIGluIHRoZSBmdXR1cmUuCj4gCj4g
VGhhbmtzCj4gCgpNYXliZSBidXQgaXMgdmlydGlvIGFjdHVhbGx5IGEgbG9vcGJhY2sgc29tZWhv
dz8gSSB0aG91Z2h0IHdlCmNhbiBiaW5kIGEgcmVndWxhciB2aXJ0aW8gZGV2aWNlIHRoZXJlLCBu
bz8KCi0tIApNU1QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
