Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D812449DCB8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439810E82E;
	Thu, 27 Jan 2022 08:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6DC10EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:14:04 +0000 (UTC)
X-UUID: 29a9983c1c37452a9feea7eb02f38e62-20220127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject;
 bh=X5hOIEZrFxsvOJ0cBOC5VQ67YacSR/OpCAOolQnmOE8=; 
 b=H2MWJkiGto8ZyADhyN3IEp/di0KWgzXR/7+30CvLUxYBwRuLOTxMeqtkV+EilnjB8Pom4VPaTiI4ZHD5N4MZ6E2A1r6vzmoNnlde99S+hR1YMv6xl0LwDvYSIsI+50YjXgf4/haaV4XXlvMkgQv8zXDqvYdRRebk0u9+J/8sXuw=;
X-UUID: 29a9983c1c37452a9feea7eb02f38e62-20220127
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1804577149; Thu, 27 Jan 2022 11:14:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 27 Jan 2022 11:13:59 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 11:13:59 +0800
Subject: Re: [PATCH v1, 4/8] media: mtk-vcodec: Adds compatible for mt8195
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-5-yunfei.dong@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <44215372-ff16-6f58-f4be-4df3f506a460@mediatek.com>
Date: Thu, 27 Jan 2022 11:13:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220127025544.10854-5-yunfei.dong@mediatek.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1542421955.1041755487"
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

--__=_Part_Boundary_001_1542421955.1041755487
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCg0KT24mIzMyOzEvMjcvMjImIzMyOzEwOjU1JiMzMjtBTSwmIzMyO1l1bmZlaSYjMzI7
RG9uZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtBZGRzJiMzMjtjb21wYXRpYmxlJiMzMjtmb3ImIzMy
O210ODE5NSYjMzI7cGxhdGZvcm0uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtZdW5mZWkmIzMyO0RvbmcmIzMyOyZsdDt5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20mZ3Q7
DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMmIzMyO3wmIzMyOzQmIzMyOysrKysNCiZn
dDsmIzMyOyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NCYjMzI7aW5zZXJ0
aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMmIzMyO2IvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQomZ3Q7
JiMzMjtpbmRleCYjMzI7MmQyMWQwMDEwYzljLi45MzhiZjE0ZTRlOGMmIzMyOzEwMDY0NA0KJmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19kcnYuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KJmd0OyYjMzI7QEAmIzMyOy00NjgsNiYj
MzI7KzQ2OCwxMCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2Zf
ZGV2aWNlX2lkJiMzMjttdGtfdmNvZGVjX21hdGNoW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYj
MzI7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTg2LXZjb2Rl
Yy1kZWMmcXVvdDssDQomZ3Q7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXRr
X3ZkZWNfc2luZ2xlX2NvcmVfcGRhdGEsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7fSwNCiZndDsmIzMy
Oyt7DQomZ3Q7JiMzMjsrLmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5
NS12Y29kZWMtZGVjJnF1b3Q7LA0KJmd0OyYjMzI7Ky5kYXRhJiMzMjs9JiMzMjsmYW1wO210a19s
YXRfc2lnX2NvcmVfcGRhdGEsDQomZ3Q7JiMzMjsrfSwNCiZndDsmIzMyOyYjMzI7JiMzMjt7fSwN
CiZndDsmIzMyOyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7DQoN
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

--__=_Part_Boundary_001_1542421955.1041755487
Content-Type: text/plain;
	charset="utf-8";
	format=flowed
Content-Transfer-Encoding: base64

DQpPbiAxLzI3LzIyIDEwOjU1IEFNLCBZdW5mZWkgRG9uZyB3cm90ZToNCj4gQWRkcyBjb21wYXRp
YmxlIGZvciBtdDgxOTUgcGxhdGZvcm0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9u
ZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgfCA0ICsrKysNCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+IGluZGV4IDJk
MjFkMDAxMGM5Yy4uOTM4YmYxNGU0ZThjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+IEBAIC00Njgs
NiArNDY4LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a192Y29kZWNf
bWF0Y2hbXSA9IHsNCj4gICAJCS5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4Ni12Y29kZWMt
ZGVjIiwNCj4gICAJCS5kYXRhID0gJm10a192ZGVjX3NpbmdsZV9jb3JlX3BkYXRhLA0KPiAgIAl9
LA0KPiArCXsNCj4gKwkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LXZjb2RlYy1kZWMi
LA0KPiArCQkuZGF0YSA9ICZtdGtfbGF0X3NpZ19jb3JlX3BkYXRhLA0KPiArCX0sDQo+ICAgCXt9
LA0KPiAgIH07DQo+ICAgDQo+IA0KDQpSZXZpZXdlZC1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwu
bGluQG1lZGlhdGVrLmNvbT4NCg0KUmVnYXJkcywNCk1hY3BhdWwgTGlu

--__=_Part_Boundary_001_1542421955.1041755487--

