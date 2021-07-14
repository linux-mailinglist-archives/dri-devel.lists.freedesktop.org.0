Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D623C9ACD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751AA6E593;
	Thu, 15 Jul 2021 08:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 889796E221
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:23:24 +0000 (UTC)
X-UUID: a0124a582aaf4af196a2e5fb2fc74a12-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jGb3Fw2ghMBhqRR5HNnLI1fFNCmMhlcMRemz5Ei6vYI=; 
 b=DCftle3drc3MLosi/1G5PTrEmJcKPQwKoFJBBWP8jbqdXE2DwHhL/y3EVLXW5YANSgbS/Pi0bYnAo7u2MVCr6NlEqOVKM2vXtCC3VLIDi98+2EbsC6oEdymQP2ti9WJkBIZ/Zez8o49ktXGUyTMm/NnCJfjYvHiYTIF+DfjmUuQ=;
X-UUID: a0124a582aaf4af196a2e5fb2fc74a12-20210714
Received: from mtkmrs31.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 119119299; Wed, 14 Jul 2021 19:18:21 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:18:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:18:16 +0800
Message-ID: <1626261496.14352.16.camel@mhfsdcap03>
Subject: Re: Aw: [PATCH v6 00/11] Clean up "mediatek,larb"
From: Yong Wu <yong.wu@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Wed, 14 Jul 2021 19:18:16 +0800
In-Reply-To: <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 194C4630574F716762D04534E2ED131E926154033AFA8FFE4228D830E0E139F02000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 15 Jul 2021 08:44:52 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, Will
 Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>, Eizan
 Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Tiffany Lin <tiffany.lin@mediatek.com>, yi.kuo@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDEwOjU5ICswMjAwLCBGcmFuayBXdW5kZXJsaWNoIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IHNvcnJ5IHRoaXMgKG9yIHRoZSAyIGRlcGVuY3ktc2VyaWVzKSBjYXVz
ZSBhIE5VTEwgUG9pbnRlciBkZXJlZiBpbiBpb21tdV9ncm91cF9yZW1vdmVfZGV2aWNlIG9uIG10
NzYyMy9icGktcjINCg0KSGkgRnJhbmssDQoNClRoYW5rcyBmb3IgeW91ciByZXBvcnQuIG10NzYy
MyB1c2UgbXRrX2lvbW11X3YxLmMuDQoNCkkgd2lsbCB0cnkgdG8gcmVwcm9kdWNlIHRoaXMgbG9j
YWxseS4NCg0KPiANCj4gaSB3b25kZXIgd2h5IG9uIGJvb3R1cCBhIGNsZWFudXAgaXMgcnVuLCBi
dXQgaGF2ZSBubyBoaW50IGFib3V0IHRoaXMuDQo+IA0KPiBzaW5jZSAiZHRzOiBtdGstbWRwOiBy
ZW1vdmUgbWVkaWF0ZWssIHZwdSBwcm9wZXJ0eSBmcm9tIHByaW1hcnkgTURQIGRldmljZSIgYWxs
IGlzIGdvb2QsIGkgZ3Vlc3MgcHJvYmxlbSBjb21lcyB1cCB3aGlsZSByZW1vdmluZyBsYXJiIHdp
dGggRFQNCj4gDQo+IHRoaXMgaXMgYmFja3RyYWNlDQo+IA0KPiBbICAgIDYuMjc0NDY1XSBQQyBp
cyBhdCBpb21tdV9ncm91cF9yZW1vdmVfZGV2aWNlKzB4MjgvMHgxNDgNCj4gWyAgICA2LjI3OTg3
N10gTFIgaXMgYXQgaW9tbXVfcmVsZWFzZV9kZXZpY2UrMHg0Yy8weDcwDQo+IA0KPiBbICAgIDYu
Njc0MzQ3XSBCYWNrdHJhY2U6DQo+IFsgICAgNi42NzY3OTddIFs8YzBjOWMzN2M+XSAoaW9tbXVf
Z3JvdXBfcmVtb3ZlX2RldmljZSkgZnJvbSBbPGMwNmJmMDI4Pl0gKGlvbW0pDQo+IFsgICAgNi42
ODYyMjFdICByNzowMDAwMDAwMCByNjpjMDZiZjA0YyByNTpjMGQ3YTFhYyByNDpjMjFmYzAxMA0K
PiBbICAgIDYuNjkxODgzXSBbPGMwNmJlZmRjPl0gKGlvbW11X3JlbGVhc2VfZGV2aWNlKSBmcm9t
IFs8YzA2YmYwNjQ+XSAocmVtb3ZlX2lvKQ0KPiBbICAgIDYuNzAwNjg5XSAgcjU6MDAwMDAwMDAg
cjQ6MDAwMDAwMDANCj4gWyAgICA2LjcwNDI2NV0gWzxjMDZiZjA0Yz5dIChyZW1vdmVfaW9tbXVf
Z3JvdXApIGZyb20gWzxjMDczMzQzND5dIChidXNfZm9yX2VhYykNCj4gWyAgICA2LjcxMjcyNV0g
WzxjMDczMzNhYz5dIChidXNfZm9yX2VhY2hfZGV2KSBmcm9tIFs8YzA2YmY2NTg+XSAoYnVzX3Nl
dF9pb21tdSkNCj4gWyAgICA2LjcyMDc1M10gIHI2OmMzMzFmNDQwIHI1OmMxNDA2ZjU4IHI0OmZm
ZmZmZmVhDQo+IFsgICAgNi43MjUzNzBdIFs8YzA2YmY1YTA+XSAoYnVzX3NldF9pb21tdSkgZnJv
bSBbPGMwNmMxZTg4Pl0gKG10a19pb21tdV9wcm9iZSspDQo+IFsgICAgNi43MzM0ODRdICByNzpj
MzJkYjBiOCByNjpjMjFmOWMwMCByNTpjMzMxZjFjMCByNDowMDAwMDAwMA0KPiBbICAgIDYuNzM5
MTQ1XSBbPGMwNmMxYmZjPl0gKG10a19pb21tdV9wcm9iZSkgZnJvbSBbPGMwNzM4YzE0Pl0gKHBs
YXRmb3JtX3Byb2JlKQ0KPiBbICAgIDYuNzQ3MTc2XSAgcjEwOmMyMWY5YzEwIHI5OmMyNDk2ZjU0
IHI4OmMxNDYyM2I4IHI3OmMxNDYyM2I4IHI2OmMxNDA1YjkwIHI1MA0KPiBbICAgIDYuNzU1MDEy
XSAgcjQ6MDAwMDAwMDANCj4gWyAgICA2Ljc1NzU0NF0gWzxjMDczOGJhOD5dIChwbGF0Zm9ybV9w
cm9iZSkgZnJvbSBbPGMwNzM1OTY4Pl0gKHJlYWxseV9wcm9iZS5wYSkNCj4gWyAgICA2Ljc2NjAw
Nl0gIHI3OmMxNDYyM2I4IHI2OmMxNDA1YjkwIHI1OjAwMDAwMDAwIHI0OmMyMWY5YzEwDQo+IFsg
ICAgNi43NzE2NjddIFs8YzA3MzU4YTA+XSAocmVhbGx5X3Byb2JlLnBhcnQuMCkgZnJvbSBbPGMw
NzM1Y2VjPl0gKHJlYWxseV9wcm8pDQo+IFsgICAgNi43Nzk4NjZdICByNzpjMjFmOWMxMCByNjpj
MjU0OWU3NCByNTpjMTQwNWI5MCByNDpjMjFmOWMxMA0KPiBbICAgIDYuNzg1NTI3XSBbPGMwNzM1
Y2E0Pl0gKHJlYWxseV9wcm9iZSkgZnJvbSBbPGMwNzM1ZGUwPl0gKF9fZHJpdmVyX3Byb2JlX2Rl
KQ0KPiBbICAgIDYuNzkzOTg0XSAgcjU6YzE0MDViOTAgcjQ6YzIxZjljMTANCj4gWyAgICA2Ljc5
NzU2MF0gWzxjMDczNWQzMD5dIChfX2RyaXZlcl9wcm9iZV9kZXZpY2UpIGZyb20gWzxjMDczNWZh
MD5dIChkcml2ZXJfcCkNCj4gWyAgICA2LjgwNjU0M10gIHI5OmMyNDk2ZjU0IHI4OjAwMDAwMDA4
IHI3OmMyMWY5YzEwIHI2OmMyNTQ5ZTc0IHI1OmMxNGM2ZWM4IHI0OjQNCj4gWyAgICA2LjgxNDI5
MV0gWzxjMDczNWY1Yz5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKSBmcm9tIFs8YzA3MzY0MTA+XSAo
X19kZXZpY2VfYSkNCj4gWyAgICA2LjgyMzQ0OF0gIHI5OmMyNDk2ZjU0IHI4OjAwMDAwMDAwIHI3
OmMyMWY5YzEwIHI2OmMyNTQ5ZTc0IHI1OmMxNDA1YjkwIHI0OjENCj4gWyAgICA2LjgzMTE5Nl0g
WzxjMDczNjM1Yz5dIChfX2RldmljZV9hdHRhY2hfZHJpdmVyKSBmcm9tIFs8YzA3MzM1NDA+XSAo
YnVzX2ZvcikNCj4gWyAgICA2Ljg0MDAwN10gIHI3OmMxNDYyM2I4IHI2OmMwNzM2MzVjIHI1OmMy
NTQ5ZTc0IHI0OjAwMDAwMDAwDQo+IFsgICAgNi44NDU2NjldIFs8YzA3MzM0YWM+XSAoYnVzX2Zv
cl9lYWNoX2RydikgZnJvbSBbPGMwNzM1N2U4Pl0gKF9fZGV2aWNlX2F0dGEpDQo+IFsgICAgNi44
NTQwNDRdICByNjowMDAwMDAwMSByNTpjMjFmOWM1NCByNDpjMjFmOWMxMA0KPiBbICAgIDYuODU4
NjYyXSBbPGMwNzM1NmU0Pl0gKF9fZGV2aWNlX2F0dGFjaCkgZnJvbSBbPGMwNzM2NjJjPl0gKGRl
dmljZV9pbml0aWFsKQ0KPiBbICAgIDYuODY3MjA3XSAgcjY6YzIxZjljMTAgcjU6YzE0MDZmNTgg
cjQ6YzE0MDZjYTANCj4gWyAgICA2Ljg3MTgyNV0gWzxjMDczNjYxMD5dIChkZXZpY2VfaW5pdGlh
bF9wcm9iZSkgZnJvbSBbPGMwNzM0NmRjPl0gKGJ1c19wcm9iZSkNCj4gWyAgICA2Ljg4MDQ1NF0g
WzxjMDczNDY0OD5dIChidXNfcHJvYmVfZGV2aWNlKSBmcm9tIFs8YzA3MzRjYzg+XSAoZGVmZXJy
ZWRfcHJvYikNCj4gDQo+IA0KPiBiaXNlY3Qgc2hvd3MgdGhpcyBjb21taXQgYXMgYnJlYWtpbmc6
DQo+IA0KPiBBdXRob3I6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiBEYXRlOiAg
IFdlZCBKdWwgMTQgMTA6NTY6MTcgMjAyMSArMDgwMA0KPiANCj4gICAgIGlvbW11L21lZGlhdGVr
OiBBZGQgcHJvYmVfZGVmZXIgZm9yIHNtaS1sYXJiDQo+IA0KPiAgICAgUHJlcGFyZSBmb3IgYWRk
aW5nIGRldmljZV9saW5rLg0KPiANCj4gcmVnYXJkcyBGcmFuaw0KDQo=

