Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A228CB40
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 11:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49289CAF;
	Tue, 13 Oct 2020 09:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FAEE89CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 09:55:19 +0000 (UTC)
X-UUID: 2d083468002b4a54841e6fb34d9036e9-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ErW8HdEIq/FdudMvL/XJKMQpzparYDyvJJpkVDGt/9I=; 
 b=A4XIiW+zG7s81RxaMdCDqufQdbZ2FjDXvL2CrFVN760zsODjdZ1mBJ2F+RNEwF2fMV0bP2jiwcFz1BWdD7NNKVuWxg14t8IgtOTRbMQqq9rUE/EkW7gudbCMBR+87GmORZOH0JEzQxqOmgoNtMbpJOUFdoTu86RNHF0z8lowHQ0=;
X-UUID: 2d083468002b4a54841e6fb34d9036e9-20201013
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1675622749; Tue, 13 Oct 2020 17:55:08 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 17:55:06 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 17:55:03 +0800
Message-ID: <1602582900.10262.0.camel@mszsdaap41>
Subject: Re: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Oct 2020 17:55:00 +0800
In-Reply-To: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
 <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9058B82AC9E991BE078B9380368DAEE655AD1DF6E08AD11FCBEC7D55ED3BBE992000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTEwLTEyIGF0IDIzOjIyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0MTDmnIgxMOaXpSDpgLHlha0g5LiL5Y2IMzowOeWvq+mBk++8mg0KPiA+DQo+ID4g
Q2hhbmdlcyBzaW5jZSB2MzoNCj4gPiAgLSBSZXZlcnQgdjIsIGZvciB2MiB3aWxsIGNhdXNlIHNv
bWUgYnJpZGdlIGljIG5vIG91dHB1dC4gdGhlIGNhdXNlDQo+ID4gICAgdGhlIHZpZGVvIGxpbmV0
aW1lIGRvZXNuJ3QgbWF0Y2ggZGlzcGxheSBtb2RlIGZyb20gZ2V0IG1vZGUuDQo+ID4gIC0gTWFr
ZSBzdXJlIHRoZSBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSBhbmQgaG9yaXpvbnRhbF9iYWNr
cG9yY2hfYnl0ZQ0KPiA+ICAgIGFyZSA+IDAuDQo+IA0KPiBCZWNhdXNlIHYyIGlzIG1lcmdlZCBp
bnRvIG1haW5saW5lLCBJIHRoaW5rIHlvdSBzaG91bGQgbWVyZ2UgMS8yIGFuZA0KPiAyLzIgdG8g
b25lIHBhdGNoIHdoaWNoIGZpeCB0aGUgcHJvYmxlbSBjYXVzZWQgYnkgdjIuDQo+IA0KPiBSZWdh
cmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHJldmlld2luZy4NCkkn
bGwgdXBkYXRlIG5leHQgdmVyc2lvbi4NCg0KQmVzdCBSZWdhcmRzDQpKaXRhbw0KDQo+ID4NCj4g
PiBKaXRhbyBTaGkgKDIpOg0KPiA+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IGRzaTogRml4IHNj
cm9sbGluZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBvcg0KPiA+ICAgICBoYnAiDQo+ID4gICBk
cm0vbWVkaWF0ZWs6IGRzaTogZml4IHNjcm9sbGluZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBv
ciBoYnANCj4gPg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgNjUg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAy
LjEyLjUNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
