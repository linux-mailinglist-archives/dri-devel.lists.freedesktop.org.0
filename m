Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54966474F2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C8B891C2;
	Sun, 16 Jun 2019 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 14 Jun 2019 14:22:04 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9489954
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:22:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-171-6ZL5OlDfPHWG6RvRpXiEQg-1; Fri, 14 Jun 2019 15:15:45 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 14 Jun 2019 15:15:44 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 14 Jun 2019 15:15:44 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Ian Abbott" <abbotti@mev.co.uk>, H Hartley Sweeten
 <hsweeten@visionengravers.com>
Subject: RE: [PATCH 16/16] dma-mapping: use exact allocation in
 dma_alloc_contiguous
Thread-Topic: [PATCH 16/16] dma-mapping: use exact allocation in
 dma_alloc_contiguous
Thread-Index: AQHVIrfpTFjppS25RkWUhwqPPyqZ4qabLzdw
Date: Fri, 14 Jun 2019 14:15:44 +0000
Message-ID: <a90cf7ec5f1c4166b53c40e06d4d832a@AcuMS.aculab.com>
References: <20190614134726.3827-1-hch@lst.de>
 <20190614134726.3827-17-hch@lst.de>
In-Reply-To: <20190614134726.3827-17-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: 6ZL5OlDfPHWG6RvRpXiEQg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Intel Linux Wireless <linuxwifi@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcKPiBTZW50OiAxNCBKdW5lIDIwMTkgMTQ6NDcKPiAKPiBN
YW55IGFyY2hpdGVjdHVyZXMgKGUuZy4gYXJtLCBtNjggYW5kIHNoKSBoYXZlIGFsd2F5cyB1c2Vk
IGV4YWN0Cj4gYWxsb2NhdGlvbiBpbiB0aGVpciBkbWEgY29oZXJlbnQgYWxsb2NhdG9yLCB3aGlj
aCBhdm9pZHMgYSBsb3Qgb2YKPiBtZW1vcnkgd2FzdGUgZXNwZWNpYWxseSBmb3IgbGFyZ2VyIGFs
bG9jYXRpb25zLiAgTGlmdCB0aGlzIGJlaGF2aW9yCj4gaW50byB0aGUgZ2VuZXJpYyBhbGxvY2F0
b3Igc28gdGhhdCBkbWEtZGlyZWN0IGFuZCB0aGUgZ2VuZXJpYyBJT01NVQo+IGNvZGUgYmVuZWZp
dCBmcm9tIHRoaXMgYmVoYXZpb3IgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9kbWEtY29udGln
dW91cy5oIHwgIDggKysrKystLS0KPiAga2VybmVsL2RtYS9jb250aWd1b3VzLmMgICAgICAgIHwg
MTcgKysrKysrKysrKystLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1jb250
aWd1b3VzLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1jb250aWd1b3VzLmgKPiBpbmRleCBjMDVkNGU2
NjE0ODkuLjJlNTQyZTMxNGFjZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1jb250
aWd1b3VzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1jb250aWd1b3VzLmgKPiBAQCAtMTYx
LDE1ICsxNjEsMTcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqZG1hX2FsbG9jX2NvbnRp
Z3VvdXMoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgCQlnZnBfdCBnZnApCj4g
IHsKPiAgCWludCBub2RlID0gZGV2ID8gZGV2X3RvX25vZGUoZGV2KSA6IE5VTUFfTk9fTk9ERTsK
PiAtCXNpemVfdCBhbGlnbiA9IGdldF9vcmRlcihQQUdFX0FMSUdOKHNpemUpKTsKPiArCXZvaWQg
KmNwdV9hZGRyID0gYWxsb2NfcGFnZXNfZXhhY3Rfbm9kZShub2RlLCBzaXplLCBnZnApOwo+IAo+
IC0JcmV0dXJuIGFsbG9jX3BhZ2VzX25vZGUobm9kZSwgZ2ZwLCBhbGlnbik7Cj4gKwlpZiAoIWNw
dV9hZGRyKQo+ICsJCXJldHVybiBOVUxMOwo+ICsJcmV0dXJuIHZpcnRfdG9fcGFnZShwKTsKPiAg
fQoKRG9lcyB0aGlzIHN0aWxsIGd1YXJhbnRlZSB0aGF0IHJlcXVlc3RzIGZvciAxNmsgd2lsbCBu
b3QgY3Jvc3MgYSAxNmsgYm91bmRhcnk/Ckl0IGxvb2tzIGxpa2UgeW91IGFyZSBsb3NpbmcgdGhl
IGFsaWdubWVudCBwYXJhbWV0ZXIuCgpUaGVyZSBtYXkgYmUgZHJpdmVycyBhbmQgaGFyZHdhcmUg
dGhhdCBhbHNvIHJlcXVpcmUgMTJrIGFsbG9jYXRlcwp0byBub3QgY3Jvc3MgMTZrIGJvdW5kYXJp
ZXMgKGV0YykuCgoJRGF2aWQKCi0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLClJlZ2lzdHJhdGlv
biBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
