Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5512E1B45
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C1A6E8FC;
	Wed, 23 Dec 2020 10:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE2F46E249
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 01:16:08 +0000 (UTC)
X-UUID: 9828f793167c4a04b2907d2aa7a85851-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=1JreIqPgO/MgWqYvXss3grHwTj5L9rm69LlEytrJzyI=; 
 b=BxkDtmUcYXFQ4o7/U8FsxrmahJCUSuXy2GJiKeQqDllniE1qnbwdwQugB6qQp4PTbU9tvaNigoXT6h2lVAqBr+pq7T8TfJMHZz/VwLwurEWrq0MIxyt1Sag1aIS6JYM6qaC5mvCnzBYPdSK2iKiKgo5r4d6n8kj2N8kfsk7fpJY=;
X-UUID: 9828f793167c4a04b2907d2aa7a85851-20201223
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 85176294; Wed, 23 Dec 2020 09:16:03 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:15:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:15:58 +0800
Message-ID: <1608686161.18252.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 01/17] dt-bindings: mediatek: add description for
 postmask
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:16:01 +0800
In-Reply-To: <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-=4ZwXgTA57UE9+nZm-0E-B1oimWXfaJuWxufo8LJ+pg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDIyOjQ5ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IGFkZCBkZXNjcmlwdGlvbiBmb3IgcG9zdG1hc2sNCj4gDQo+IFdoYXQgaXMg
cG9zdG1hc2s/IEkgZ29vZ2xlIGl0IGFuZCBmaW5kIGEgcG9zdG1hc2sgRUNPLiBTbyBpdCBpcyBw
b3N0bWFzayBFQ08/DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCg0KaXQgaXMg
dXNlZCBjb250cm9sIHJvdW5kIGNvcm5lciBmb3IgZGlzcGxheSBmcmFtZQ0KDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNw
LnR4dA0KPiA+IGluZGV4IDVjYTY5M2EuLjE5NzJmYTcgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dA0KPiA+IEBAIC0zNyw2ICszNyw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOg0KPiA+ICAgICAgICAgIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLWFhbCIgICAgICAgICAgICAgIC0gYWRhcHRpdmUgYW1iaWVudCBsaWdo
dCBjb250cm9sbGVyDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiICAg
ICAgICAgICAgLSBnYW1tYSBjb3JyZWN0aW9uDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+
LWRpc3AtbWVyZ2UiICAgICAgICAgICAgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJETUEgc291
cmNlcw0KPiA+ICsgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3RtYXNrIiAgICAgICAg
IC0gcG9zdCBtYXNrDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAg
ICAgICAgICAgLSBzcGxpdCBzdHJlYW0gdG8gdHdvIGVuY29kZXJzDQo+ID4gICAgICAgICAibWVk
aWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVu
Z2luZQ0KPiA+ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAg
IC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0DQo+ID4gLS0NCj4gPiAxLjgu
MS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
