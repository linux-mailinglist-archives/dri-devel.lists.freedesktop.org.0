Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F77F307A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68BC6ED71;
	Thu,  7 Nov 2019 13:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028246E454
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:51:36 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 818BE87630
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:51:35 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id u23so2610067qtb.22
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 05:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Vuj0sOrz0obsaQW6VB4nuyg1B3f92+UjONHlMugAHRU=;
 b=ufKTgq3gR9xbvEMkjPPOdfnoeEwTUb+APcUST5nwfI79wv/7J2XC5MwCNA+UtAZWpG
 qUMn5ZgS97NW12amZpJBsOaqs3T8HG3bEV9knPGqnFgplhnC6cRWVOgmmUc1k156f+4U
 KyR/sxrDmctx5hLg3hs56L4PdniJ8ezY+/b2St2LR6yEkSHuSjB8HtCjXAR8Fz0vU2P6
 HAg4MMC9RBIRiHovBCa3MWsTt2ZL0vJkznnrAgEIBF7KjiFnC7f7sKgjK/g/nOKM2ZKg
 /JviErBJZOsddYeyiuwhxjMxM9zQbLbfQPHrmG1vTO790+2OAo5Ax4v3TVXuDsc+GVHY
 darQ==
X-Gm-Message-State: APjAAAWz/Z9MNnegcgskpJEZXuBoOiF/FqD/QqSrsqnjWd6BOiY7xo4t
 Z+n/8cO6rsb2LfzrUmdoS6bKMjsl0/abqo3adYjvGHKGpWWicK8aiGmDb8oaHklqQfm40lB6MAV
 uCPM/4kVvQqkY4LDYAP6hn2UzGQOj
X-Received: by 2002:a05:620a:9c4:: with SMTP id
 y4mr1685904qky.113.1573134694383; 
 Thu, 07 Nov 2019 05:51:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyX+KBUhWqpKhTfmZTPkTDc7Eh32z5L3hFi76AldzGn/MNvSqKAS8VxujSm8oFj0PnbSG1J/A==
X-Received: by 2002:a05:620a:9c4:: with SMTP id
 y4mr1685880qky.113.1573134694094; 
 Thu, 07 Nov 2019 05:51:34 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id o201sm1088010qka.17.2019.11.07.05.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:51:33 -0800 (PST)
Date: Thu, 7 Nov 2019 08:51:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V10 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
Message-ID: <20191107085108-mutt-send-email-mst@kernel.org>
References: <20191106133531.693-1-jasowang@redhat.com>
 <20191106133531.693-7-jasowang@redhat.com>
 <20191107040700-mutt-send-email-mst@kernel.org>
 <bd2f7796-8d88-0eb3-b55b-3ec062b186b7@redhat.com>
 <20191107061942-mutt-send-email-mst@kernel.org>
 <d09229bc-c3e4-8d4b-c28f-565fe150ced2@redhat.com>
 <c588c724-04da-2991-9f88-f36c0d04364a@redhat.com>
 <20191107080721-mutt-send-email-mst@kernel.org>
 <29d92758-18f7-15c7-fd04-0556b1f9033c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29d92758-18f7-15c7-fd04-0556b1f9033c@redhat.com>
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

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6NDA6MDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzExLzcg5LiL5Y2IOTowOCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6NDc6MDZQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDg6NDMsIEphc29uIFdhbmcgd3JvdGU6
Cj4gPiA+ID4gT24gMjAxOS8xMS83IOS4i+WNiDc6MjEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+ID4gPiA+IE9uIFRodSwgTm92IDA3LCAyMDE5IGF0IDA2OjE4OjQ1UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIDIwMTkvMTEvNyDkuIvljYg1OjA4LCBNaWNo
YWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkg
YXQgMDk6MzU6MzFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRo
aXMgc2FtcGxlIGRyaXZlciBjcmVhdGVzIG1kZXYgZGV2aWNlIHRoYXQgc2ltdWxhdGUKPiA+ID4g
PiA+ID4gPiA+IHZpcnRpbyBuZXQgZGV2aWNlCj4gPiA+ID4gPiA+ID4gPiBvdmVyIHZpcnRpbyBt
ZGV2IHRyYW5zcG9ydC4gVGhlIGRldmljZSBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naAo+
ID4gPiA+ID4gPiA+ID4gYW5kIHdvcmtxdWV1ZS4gQSBkZXZpY2Ugc3BlY2lmaWMgZG1hIG9wcyBp
cyB0byBtYWtlIHN1cmUgSFZBIGlzIHVzZWQKPiA+ID4gPiA+ID4gPiA+IGRpcmVjdGx5IGFzIHRo
ZSBJT1ZBLiBUaGlzIHNob3VsZCBiZSBzdWZmaWNpZW50IGZvciBrZXJuZWwgdmlydGlvCj4gPiA+
ID4gPiA+ID4gPiBkcml2ZXIgdG8gd29yay4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gT25seSAndmlydGlvJyB0eXBlIGlzIHN1cHBvcnRlZCByaWdodCBub3cuIEkgcGxhbiB0byBh
ZGQgJ3Zob3N0JyB0eXBlCj4gPiA+ID4gPiA+ID4gPiBvbiB0b3Agd2hpY2ggcmVxdWlyZXMgc29t
ZSB2aXJ0dWFsIElPTU1VIGltcGxlbWVudGVkIGluIHRoaXMgc2FtcGxlCj4gPiA+ID4gPiA+ID4g
PiBkcml2ZXIuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBDb3Ju
ZWxpYSBIdWNrPGNvaHVja0ByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+IEknZCBwcmVm
ZXIgaXQgdGhhdCB3ZSBjYWxsIHRoaXMgc29tZXRoaW5nIGVsc2UsIGUuZy4KPiA+ID4gPiA+ID4g
PiBtdm5ldC1sb29wYmFjay4gSnVzdCBzbyBwZW9wbGUgZG9uJ3QgZXhwZWN0IGEgZnVsbHkKPiA+
ID4gPiA+ID4gPiBmdW5jdGlvbmFsIGRldmljZSBzb21laG93LiBDYW4gYmUgcmVuYW1lZCB3aGVu
IGFwcGx5aW5nPwo+ID4gPiA+ID4gPiBBY3R1YWxseSwgSSBwbGFuIHRvIGV4dGVuZCBpdCBhcyBh
bm90aGVyIHN0YW5kYXJkIG5ldHdvcmsgaW50ZXJmYWNlIGZvcgo+ID4gPiA+ID4gPiBrZXJuZWwu
IEl0IGNvdWxkIGJlIGVpdGhlciBhIHN0YW5kYWxvbmUgcHNldWRvIGRldmljZSBvciBhIHN0YWNr
Cj4gPiA+ID4gPiA+IGRldmljZS4KPiA+ID4gPiA+ID4gRG9lcyB0aGlzIHNvdW5kcyBnb29kIHRv
IHlvdT8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gVGhhdCdzIGEg
YmlnIGNoYW5nZSBpbiBhbiBpbnRlcmZhY2Ugc28gaXQncyBhIGdvb2QgcmVhc29uCj4gPiA+ID4g
PiB0byByZW5hbWUgdGhlIGRyaXZlciBhdCB0aGF0IHBvaW50IHJpZ2h0Pwo+ID4gPiA+ID4gT2hl
cndpc2UgdXNlcnMgb2YgYW4gb2xkIGtlcm5lbCB3b3VsZCBleHBlY3QgYSBzdGFja2VkIGRyaXZl
cgo+ID4gPiA+ID4gYW5kIGdldCBhIGxvb3BiYWNrIGluc3RlYWQuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nPwo+ID4gPiA+IAo+ID4gPiA+IE15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCBpdCB3YXMgYSBzYW1wbGUgZHJpdmVyIGluIC9kb2MuIEl0IHNob3VsZCBu
b3QKPiA+ID4gPiBiZSB1c2VkIGluIHByb2R1Y3Rpb24gZW52aXJvbm1lbnQuIE90aGVyd2lzZSB3
ZSBuZWVkIHRvIG1vdmUgaXQgdG8KPiA+ID4gPiBkcml2ZXIvdmlydGlvLgo+ID4gPiA+IAo+ID4g
PiA+IEJ1dCBpZiB5b3UgaW5zaXN0LCBJIGNhbiBwb3N0IGEgVjExLgo+ID4gPiA+IAo+ID4gPiA+
IFRoYW5rcwo+ID4gPiAKPiA+ID4gT3IgbWF5YmUgaXQncyBiZXR0ZXIgdG8gcmVuYW1lIHRoZSB0
eXBlIG9mIGN1cnJlbnQgbWRldiBmcm9tICd2aXJ0aW8nIHRvCj4gPiA+ICd2aXJ0aW8tbG9vcGJh
Y2snLiBUaGVuIHdlIGNhbiBhZGQgbW9yZSB0eXBlcyBpbiB0aGUgZnV0dXJlLgo+ID4gPiAKPiA+
ID4gVGhhbmtzCj4gPiA+IAo+ID4gTWF5YmUgYnV0IGlzIHZpcnRpbyBhY3R1YWxseSBhIGxvb3Bi
YWNrIHNvbWVob3c/IEkgdGhvdWdodCB3ZQo+ID4gY2FuIGJpbmQgYSByZWd1bGFyIHZpcnRpbyBk
ZXZpY2UgdGhlcmUsIG5vPwo+IAo+IAo+IEl0IGhhcyBhIHByZWZpeCwgc28gdXNlciB3aWxsIHNl
ZSAibXZuZXQtdmlydGlvLWxvb3BiYWNrIi4KPiAKPiBUaGFua3MKPiAKCgp5ZXMgYnV0IGl0J3Mg
bXZuZXQgdGhhdCBpcyBkb2luZyB0aGUgbG9vcGJhY2ssIG5vdCB2aXJ0aW8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
