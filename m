Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CF49DCBC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A7110E93A;
	Thu, 27 Jan 2022 08:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5F010EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:13:24 +0000 (UTC)
X-UUID: 6a6c34f1b16f40a083c0d8dbe5b42166-20220127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject;
 bh=7eCg6mZ7yaE3nvsPR2s2xJ8Y1iWaYUFZbqEchMkBWLA=; 
 b=lJvbumGWIsKdyfjc9KGSYJIDKi0McYZHu47OB28PIxkX40iiJTEN4ZwynpgY+LJ2xwjxyYBWBY/SffetCtNQWTk1LHmj616310Hh6NisNvPcfujKTNYhlr2FoQW4g4JprORLlEGrNUf3ajvezZITNwtZns0dqv7WukwDdcJkxBk=;
X-UUID: 6a6c34f1b16f40a083c0d8dbe5b42166-20220127
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1078697365; Thu, 27 Jan 2022 11:13:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 11:13:20 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 11:13:19 +0800
Subject: Re: [PATCH v1, 3/8] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8195
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-4-yunfei.dong@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <6d82d43c-8cf9-49cc-9a23-1d4af29ece81@mediatek.com>
Date: Thu, 27 Jan 2022 11:13:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220127025544.10854-4-yunfei.dong@mediatek.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_845185682.1223068033"
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, Macross Chen <macross.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_845185682.1223068033
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjsxLzI3LzIyJiMzMjsxMDo1NSYjMzI7QU0sJiMzMjtZdW5mZWkmIzMyO0Rv
bmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7QWRkcyYjMzI7ZGVjb2RlciYjMzI7ZHQtYmluZGluZ3Mm
IzMyO2ZvciYjMzI7bXQ4MTk1Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYj
MzI7WXVuZmVpJiMzMjtEb25nJiMzMjsmbHQ7eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyOyYjMzI7Li4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyYjMzI7
JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRlY29kZXIueWFtbCYj
MzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNv
ZGVjLXN1YmRldi1kZWNvZGVyLnlhbWwNCiZndDsmIzMyO2luZGV4JiMzMjthM2M4OTIzMzhhYzAu
LmEyZjJkYjI5ZGFlZCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rl
ci55YW1sDQomZ3Q7JiMzMjsrKysmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sDQomZ3Q7JiMzMjtA
QCYjMzI7LTUwLDYmIzMyOys1MCw3JiMzMjtAQCYjMzI7cHJvcGVydGllczoNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2VudW06DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTkyLXZjb2RlYy1k
ZWMNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMz
MjttZWRpYXRlayxtdDgxODYtdmNvZGVjLWRlYw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5NS12Y29kZWMtZGVjDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZzoNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO21heEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7DQoN
ClJldmlld2VkLWJ5OiYjMzI7TWFjcGF1bCYjMzI7TGluJiMzMjsmbHQ7bWFjcGF1bC5saW5AbWVk
aWF0ZWsuY29tJmd0Ow0KDQpSZWdhcmRzLA0KTWFjcGF1bCYjMzI7TGluDQo8L3ByZT48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_845185682.1223068033
Content-Type: text/plain;
	charset="utf-8";
	format=flowed
Content-Transfer-Encoding: base64

T24gMS8yNy8yMiAxMDo1NSBBTSwgWXVuZmVpIERvbmcgd3JvdGU6DQo+IEFkZHMgZGVjb2RlciBk
dC1iaW5kaW5ncyBmb3IgbXQ4MTk1Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcg
PHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sICAgICAgICAgICB8IDEgKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2
LWRlY29kZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRlY29kZXIueWFtbA0KPiBpbmRleCBhM2M4OTIzMzhhYzAu
LmEyZjJkYjI5ZGFlZCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sDQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMt
c3ViZGV2LWRlY29kZXIueWFtbA0KPiBAQCAtNTAsNiArNTAsNyBAQCBwcm9wZXJ0aWVzOg0KPiAg
ICAgICBlbnVtOg0KPiAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXZjb2RlYy1kZWMNCj4gICAg
ICAgICAtIG1lZGlhdGVrLG10ODE4Ni12Y29kZWMtZGVjDQo+ICsgICAgICAtIG1lZGlhdGVrLG10
ODE5NS12Y29kZWMtZGVjDQo+ICAgDQo+ICAgICByZWc6DQo+ICAgICAgIG1heEl0ZW1zOiAxDQo+
IA0KDQpSZXZpZXdlZC1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4N
Cg0KUmVnYXJkcywNCk1hY3BhdWwgTGlu

--__=_Part_Boundary_003_845185682.1223068033--

