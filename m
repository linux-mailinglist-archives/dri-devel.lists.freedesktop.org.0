Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC276D86E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 03:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956FB6E489;
	Fri, 19 Jul 2019 01:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37806E487;
 Fri, 19 Jul 2019 01:34:55 +0000 (UTC)
X-UUID: 1f2cbb28d14d40e9891180768d90e8fc-20190719
X-UUID: 1f2cbb28d14d40e9891180768d90e8fc-20190719
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 653337277; Fri, 19 Jul 2019 09:34:51 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 19 Jul 2019 09:34:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 19 Jul 2019 09:34:49 +0800
Message-ID: <1563500089.5889.0.camel@mtksdaap41>
Subject: Re: [PATCH v1 10/11] drm/mediatek: direct include of drm.h in
 mtk_drm_gem.c
From: CK Hu <ck.hu@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 19 Jul 2019 09:34:49 +0800
In-Reply-To: <1563499801.3884.0.camel@mtksdaap41>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-11-sam@ravnborg.org>
 <1563499801.3884.0.camel@mtksdaap41>
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFNhbToKCllvdSBjb3VsZCBhcHBseSB0aGlzIHBhdGNoIGludG8gZHJtLW1pc2MtbmV4dCBi
eSB5b3Vyc2VsZiwgdGhhbmtzLgoKUmVnYXJkcywKQ0sKCk9uIEZyaSwgMjAxOS0wNy0xOSBhdCAw
OTozMCArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4gT24gVGh1LCAyMDE5LTA3LTE4IGF0IDE4OjE1ICsw
MjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBEbyBub3QgcmVseSBvbiBpbmNsdWRpbmcgZHJt
LmggZnJvbSBkcm1fZmlsZS5oLAo+ID4gYXMgdGhlIGluY2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxs
IGJlIGRyb3BwZWQuCj4gPiAKPiAKPiBBY2tlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
PiA+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gQ2M6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gPiBDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KPiA+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDEgKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9nZW0uYwo+ID4gaW5kZXggOTQzNGY4OGM2MzQxLi5jYTY3MmYxZDE0MGQgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+IEBAIC01LDYg
KzUsNyBAQAo+ID4gIAo+ID4gICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+Cj4gPiAgCj4gPiAr
I2luY2x1ZGUgPGRybS9kcm0uaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2UuaD4KPiA+
ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5o
Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
