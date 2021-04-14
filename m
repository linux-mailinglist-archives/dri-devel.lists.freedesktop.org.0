Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E435EA84
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 03:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36516E425;
	Wed, 14 Apr 2021 01:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 533196E425
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 01:49:29 +0000 (UTC)
X-UUID: f7396c8faeda45e0be7a6a30e1b282f7-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=FupmUWH8LIKhK1/JE8q0K7K7FyJglWX2Rt4xjp/RIXk=; 
 b=jjsb+UFiFl5eYuEPQ/Nn+gnH6yUIR1SKSYEwK6uORzy5i7LGRtRqMXMN7uvTddqB66+PK7sBV1fsmbF3UGpsBwlNZ6i/Y+5zDMZXXmgzb2mLQ3k9ZhPx0FtbJeyk5IZgLfXIaKpoVrPt8G1bzqDatGRy+InXBRpgMCKFLDYCpmA=;
X-UUID: f7396c8faeda45e0be7a6a30e1b282f7-20210414
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1608903243; Wed, 14 Apr 2021 09:49:23 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Apr 2021 09:49:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Apr 2021 09:49:18 +0800
Message-ID: <1618364957.9156.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 3/5] Revert "dt-bindings: mailbox: mtk-gce: fix
 incorrect mbox-cells value"
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 14 Apr 2021 09:49:17 +0800
In-Reply-To: <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618226325-31927-4-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY__zcdjA-tu4kNtWjy=37_HZV1U2fS6=k4OBAbjfNwC9Ow@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: DTML <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Dennis YC
 Hsieh <dennis-yc.hsieh@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTA0LTE0IGF0IDA3OjM4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0NOaciDEy5pelIOmAseS4gCDkuIvljYg3OjE55a+r6YGT77ya
DQo+ID4NCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGY4M2IwM2ZjNzI3YWI1NmE3N2U2ODcxM2Q2
ZTQwMjk5Njk4ZjNjOWYuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5
b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50eHQgfCAyICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ay1nY2Uu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50
eHQNCj4gPiBpbmRleCA3NzcxZWNhLi5jZjQ4Y2Q4IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L210ay1nY2UudHh0DQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbXRrLWdjZS50eHQNCj4g
PiBAQCAtNDcsNyArNDcsNyBAQCBFeGFtcGxlOg0KPiA+ICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTM1IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX0dDRT47DQo+ID4gICAgICAgICAgICAg
ICAgIGNsb2NrLW5hbWVzID0gImdjZSI7DQo+ID4gLSAgICAgICAgICAgICAgICNtYm94LWNlbGxz
ID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAjbWJveC1jZWxscyA9IDwzPjsNCj4gDQo+IEkg
dGhpbmsgd2Ugc2hvdWxkIG5vdCBjaGFuZ2UgdGhlIGJpbmRpbmcganVzdCB0byBmaXggc29mdHdh
cmUgYnVnLg0KPiBJIHRoaW5rIHRoZXJlIGFyZSBtYW55IHRlbXBvcmFyeSBzb2x1dGlvbiB0byBm
aXggZHJtIGJ1Zy4gSWYgZHJtIGJ1Zw0KPiBpcyBjYXVzZWQgYnkgY3Vyc29yIHBsYW5lLCB5b3Ug
Y291bGQgdGVtcG9yYXJpbHkgbGV0IGRybSBub3Qgc3VwcG9ydA0KPiBjdXJzb3IgcGxhbmUgdG8g
Zml4IGl0IChpbiBbMV0sIGRvIG5vdCByZXR1cm4gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKS4NCj4g
QnV0IEkgd291bGQgbGlrZSB5b3UgdG8gZmluZCBvdXQgdGhlIGNvcnJlY3Qgc29sdXRpb24gcmF0
aGVyIHRoYW4gYQ0KPiB0ZW1wb3Jhcnkgc29sdXRpb24gYmVjYXVzZSB0aGlzIGJ1ZyBpcyBub3Qg
c28gdXJnZW50LiAoRm9yIG1lLCBidWcgb2YNCj4gYnVpbGQgZmFpbCwgYm9vdCBmYWlsLCBibGFj
ayBzY3JlZW4gaXMgdXJnZW50KS4NCj4gDQo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmM/aD12NS4xMi1yYzcjbjY5OQ0KPiANCj4gUmVn
YXJkcywNCj4gQ2h1bi1LdWFuZy4NCg0KdGhpcyBub3QgZHJtIGJ1ZywgYnV0IGNhdXNlZCBieSBj
bWRxIHBhdGNoDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvcGF0Y2gvMjAyMDAyMTQwNDMzMjUuMTY2MTgtMy1iaWJieS5oc2llaEBtZWRpYXRlay5j
b20vDQpiZWZvcmUgdGhpcyBwYXRjaCwgZHJtIGN1cnNvciBhbmQgdWkgd29ya3Mgd2VsbA0KYWZ0
ZXIgdGhpcyBwYXRjaCwgdWkgd2lsbCBmbGFzaCB3aGVuIG1vdmUgY3Vyc29yDQoNCnRoaXMgaXMg
Y3JpdGljYWwgaXNzdWUsDQoNCj4gDQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gIEV4YW1wbGUg
Zm9yIGEgY2xpZW50IGRldmljZToNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGlydHkNCj4gPg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
