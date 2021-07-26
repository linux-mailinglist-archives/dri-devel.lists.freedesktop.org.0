Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157853D521E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 06:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7CF6E573;
	Mon, 26 Jul 2021 04:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133E6E573
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 04:03:03 +0000 (UTC)
X-UUID: 76ec69579b424d7d853456f41aa59438-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1qkMfTfeNRmsWMXbQc8lB+Iu1NAA2I+IZkOV+hmaRlY=; 
 b=n3LrDrR5TA/du10LfUrjJS6LRF2AbbmsDlYs6yci5avcTsMEzYuafFJYAkARVdtdD6nvU+xm4G23ivt6tnGjG2x4SRREcFGeKSEWYFiBc9i0tJiRJlcWL867wE82lSiCcibUnvRdBQ2tuvz2598mlmmf2j8e9rrb1xkPWYCyCKg=;
X-UUID: 76ec69579b424d7d853456f41aa59438-20210726
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1229402346; Mon, 26 Jul 2021 12:02:58 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 12:02:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Jul 2021 12:02:57 +0800
Message-ID: <1627272177.27642.1.camel@mtksdaap41>
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: add
 force_dsi_end_without_null for dsi
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 26 Jul 2021 12:02:57 +0800
In-Reply-To: <20210726021104.80007-2-jitao.shi@mediatek.com>
References: <20210726021104.80007-1-jitao.shi@mediatek.com>
 <20210726021104.80007-2-jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, shuijing.li@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rex-bc.chen@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOg0KDQpPbiBNb24sIDIwMjEtMDctMjYgYXQgMTA6MTEgKzA4MDAsIEppdGFvIFNo
aSB3cm90ZToNCj4gU29tZSBicmlkZ2UgY2hpcCB3aWxsIHNoaWZ0IHNjcmVlbiB3aGVuIHRoZSBk
c2kgZGF0YSBkb2VzJ3QgZW50IGF0DQo+IHRoZSBzYW1lIHRpbWUgaW4gbGluZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50
eHQgICAgIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQNCj4gaW5kZXggODIzOGE4NjY4
NmJlLi4xYzJmNTNmM2FjM2QgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHNpLnR4dA0KPiBAQCAtMTksNiArMTksMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gICAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4gVGhpcyBwb3J0IHNo
b3VsZCBiZSBjb25uZWN0ZWQNCj4gICAgdG8gdGhlIGlucHV0IHBvcnQgb2YgYW4gYXR0YWNoZWQg
RFNJIHBhbmVsIG9yIERTSS10by1lRFAgZW5jb2RlciBjaGlwLg0KPiAgDQo+ICtPcHRpb25hbCBw
cm9wZXJ0aWVzOg0KPiArLSBmb3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbDogU29tZSBicmlkZ2Ug
Y2hpcChleC4gQU5YNzYyNSkgcmVxdWlyZXMgdGhlDQo+ICsgIHBhY2tldHMgb24gbGFuZXMgYWxp
Z25lZCBhdCB0aGUgZW5kLg0KPiArDQoNCkkgdGhpbmsgeW91IHNob3VsZCBhZGQgdGhpcyBwcm9w
ZXJ0eSBpbiBbMV0gYmVjYXVzZSB0aGlzIGxpbWl0YXRpb24gaXMNCkFOWDc2MjUncyBsaW1pdGF0
aW9uLg0KDQpbMV0NCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS9hbmFsb2dpeCxhbng3NjI1LnlhbWwNCg0KUmVnYXJkcywNCkNLDQoNCj4gIE1JUEkgVFgg
Q29uZmlndXJhdGlvbiBNb2R1bGUNCj4gID09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4g
IA0KDQo=

