Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5CB59A7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 04:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958296EDBB;
	Wed, 18 Sep 2019 02:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968946EDBA;
 Wed, 18 Sep 2019 02:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D47A307D90E;
 Wed, 18 Sep 2019 02:24:04 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9AB41001B22;
 Wed, 18 Sep 2019 02:23:55 +0000 (UTC)
Date: Tue, 17 Sep 2019 20:23:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 0/2] Mdev: support mutiple kinds of devices
Message-ID: <20190917202355.50830aa2@x1.home>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D57B260@SHSMSX104.ccr.corp.intel.com>
References: <20190912094012.29653-1-jasowang@redhat.com>
 <20190917113125.6b2970e5@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D57B260@SHSMSX104.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 18 Sep 2019 02:24:05 +0000 (UTC)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "idos@mellanox.com" <idos@mellanox.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "freude@linux.ibm.com" <freude@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Bie,
 Tiwei" <tiwei.bie@intel.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Wang, 
 Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBTZXAgMjAxOSAwMTo1NDo0MyArMDAwMAoiVGlhbiwgS2V2aW4iIDxrZXZpbi50
aWFuQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uCj4gPiBTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSAxOjMxIEFNCj4gPiAKPiA+IFtjYyArUGFy
YXZdCj4gPiAKPiA+IE9uIFRodSwgMTIgU2VwIDIwMTkgMTc6NDA6MTAgKzA4MDAKPiA+IEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gICAKPiA+ID4gSGkgYWxsOgo+
ID4gPgo+ID4gPiBEdXJpbmcgdGhlIGRldmVsb3BtZW50IG9mIHZpcnRpby1tZGV2WzFdLiBJIGZp
bmQgdGhhdCBtZGV2IG5lZWRzIHRvIGJlCj4gPiA+IGV4dGVuZGVkIHRvIHN1cHBvcnQgZGV2aWNl
cyBvdGhlciB0aGFuIHZmaW8gbWRldiBkZXZpY2UuIFNvIHRoaXMKPiA+ID4gc2VyaWVzIHRyaWVz
IHRvIGV4dGVuZCB0aGUgbWRldiB0byBiZSBhYmxlIHRvIGRpZmZlciBmcm9tIGRpZmZlcmVudAo+
ID4gPiBkZXZpY2VzIGJ5Ogo+ID4gPgo+ID4gPiAtIGRldmljZSBpZCBhbmQgbWF0Y2hpbmcgZm9y
IG1kZXYgYnVzCj4gPiA+IC0gZGV2aWNlIHNwZWljZmljIGNhbGxiYWNrcyBhbmQgbW92ZSB2Zmlv
IGNhbGxiYWNrcyB0aGVyZQo+ID4gPgo+ID4gPiBTZW50IGZvciBlYXJseSByZWl2ZXcsIGNvbXBp
bGUgdGVzdCBvbmx5IQo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE5LzkvMTAvMTM1ICAKPiA+IAo+ID4gSSBleHBlY3QgUGFyYXYgbXVz
dCBoYXZlIHNvbWV0aGluZyBzaW1pbGFyIGluIHRoZSB3b3JrcyBmb3IgdGhlaXIKPiA+IGluLWtl
cm5lbCBuZXR3b3JraW5nIG1kZXYgc3VwcG9ydC4gIExpbmsgdG8gZGlzY3Vzc2lvbiBzbyBmYXI6
Cj4gPiAKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDE5MDkxMjA5NDAxMi4yOTY1
My0xLQo+ID4gamFzb3dhbmdAcmVkaGF0LmNvbS9ULyN0Cj4gPiAgIAo+IAo+IEl0IGxpbmtzIHRv
IHRoZSBjdXJyZW50IHRocmVhZC4gSXMgaXQgaW50ZW5kZWQgb3IgZG8geW91IHdhbnQKPiBwZW9w
bGUgdG8gbG9vayBhdCBhbm90aGVyIHRocmVhZCBkcml2ZW4gYnkgUGFyYXY/IDotKQoKU29ycnks
IHRoZSBsaW5rIHdhcyBwcm92aWRlZCBmb3IgUGFyYXYgc2luY2UgdGhleSB3ZXJlbid0IGNjJ2Qu
ICBUaGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
