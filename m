Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3458E273
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 03:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B93A6E886;
	Thu, 15 Aug 2019 01:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 709B66E886
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:40:42 +0000 (UTC)
X-UUID: 153b63453c964d65b347271be224daca-20190815
X-UUID: 153b63453c964d65b347271be224daca-20190815
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 817517570; Thu, 15 Aug 2019 09:40:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 15 Aug 2019 09:40:36 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 15 Aug 2019 09:40:36 +0800
Message-ID: <1565833236.24305.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 0/2] drm/mediatek: make imported PRIME buffers
 contiguous
From: CK Hu <ck.hu@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 15 Aug 2019 09:40:36 +0800
In-Reply-To: <20190729053335.251379-1-acourbot@chromium.org>
References: <20190729053335.251379-1-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFsZXhhbmRyZToKCk9uIE1vbiwgMjAxOS0wNy0yOSBhdCAxNDozMyArMDkwMCwgQWxleGFu
ZHJlIENvdXJib3Qgd3JvdGU6Cj4gVGhlIGRlZmF1bHQgRE1BIHNlZ21lbnQgc2l6ZSB3YXMgdXNl
ZCB3aGVuIGltcG9ydGluZyBQUklNRSBidWZmZXJzLAo+IHdoaWNoIHJlc3VsdGVkIGluIGEgY2hh
bmNlIG9mIHRoZW0gbm90IGJlaW5nIGNvbnRpZ3VvdXMgaW4gdGhlIHZpcnR1YWwKPiBJTyBzcGFj
ZSBvZiB0aGUgZGV2aWNlIGFuZCBtdGtfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSgpIGNvbXBs
YWluaW5nCj4gdGhhdCB0aGUgU0cgdGFibGUgd2FzIG5vdCBjb250aWd1b3VzIGFzIGl0IGV4cGVj
dHMuCj4gCj4gVGhpcyBzZXJpZXMgZml4ZXMgdGhpcyBpc3N1ZSBieQo+IAo+IDEpIFVzaW5nIHRo
ZSBjb3JyZWN0IERNQSBkZXZpY2Ugd2hlbiBpbXBvcnRpbmcgUFJJTUUgYnVmZmVycywKPiAyKSBT
ZXR0aW5nIGEgbW9yZSBzdWl0YWJsZSBETUEgc2VnbWVudCBzaXplIG9uIHRoZSBETUEgZGV2aWNl
IHRoYW4gdGhlCj4gZGVmYXVsdCA2NEtCLgoKRm9yIHRoZSBzZXJpZXMsIGFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLWZpeGVzLTUuMyBbMV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20v
Y2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1maXhlcy01
LjMKCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIFNwbGl0IGludG8gdHdvIHBhdGNoZXMsCj4g
LSBGaXhlZCBhbiBlcnJvciBwYXRoIHRoYXQgd291bGQgaGF2ZSByZXR1cm5lZCAwLgo+IAo+IEFs
ZXhhbmRyZSBDb3VyYm90ICgyKToKPiAgIGRybS9tZWRpYXRlazogdXNlIGNvcnJlY3QgZGV2aWNl
IHRvIGltcG9ydCBQUklNRSBidWZmZXJzCj4gICBkcm0vbWVkaWF0ZWs6IHNldCBETUEgbWF4IHNl
Z21lbnQgc2l6ZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8
IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5oIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
