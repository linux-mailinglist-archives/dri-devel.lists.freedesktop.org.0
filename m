Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FAC481850
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 03:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD358989C;
	Thu, 30 Dec 2021 02:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2D28989C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 02:01:28 +0000 (UTC)
X-UUID: 35eccb63286540c1a4ce3c8ba61de529-20211230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HYqS7d+eiPmGytyx8HRz1poJJR6kp79sEhVu1clfAK8=; 
 b=e/mQkyJB35YWGcso6cQkDKbtzAlDZ6IU/LwTLXiohgLdGDkpFhktMp7Y759NzlSamGle3PGj3fouwiIfm3xFtxIjxlr2Do6FIY+dxur7LQnRjJQQSP5o+ZZEzRK7mb/ixQMrPbxhTxN1noSSr0FIEe6bQO9CTvP3hU0Io+pxSAU=;
X-UUID: 35eccb63286540c1a4ce3c8ba61de529-20211230
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1994099198; Thu, 30 Dec 2021 09:56:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 09:56:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Dec 2021 09:56:07 +0800
Message-ID: <33cd21877853d3f602a7403f37a30d68e9fa3e4a.camel@mediatek.com>
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Miaoqian Lin <linmq006@gmail.com>
Date: Thu, 30 Dec 2021 09:56:07 +0800
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
References: <20211224082103.7658-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTEyLTI0IGF0IDA4OjIxICswMDAwLCBNaWFvcWlhbiBMaW4gd3JvdGU6DQo+
IFRoZSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBmdW5jdGlvbiBtYXkgcmV0dXJuIE5VTEwu
DQo+IEFkZCBjaGVjayB0byBwcmV2ZW50IHBvdGVudGlhbCBudWxsIGRlcmVmZXJlbmNlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTWlhb3FpYW4gTGluIDxsaW5tcTAwNkBnbWFpbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5jIHwgMiArKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuYw0KPiBiL2RyaXZlcnMvcGh5L21lZGlh
dGVrL3BoeS1tdGstbWlwaS1kc2kuYw0KPiBpbmRleCAyOGFkOTQwM2M0NDEuLjY3YjAwNWQ1Yjll
MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWRzaS5j
DQo+ICsrKyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuYw0KPiBAQCAt
MTQ2LDYgKzE0Niw4IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUoc3RydWN0DQo+IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAltaXBp
X3R4LT5kcml2ZXJfZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiArCWlm
ICghbWlwaV90eC0+ZHJpdmVyX2RhdGEpDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+ICAJ
bWlwaV90eC0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsN
Cj4gIAlpZiAoSVNfRVJSKG1pcGlfdHgtPnJlZ3MpKQ0KDQpBY2tlZC1ieTogQ2h1bmZlbmcgWXVu
IDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KDQpUaGFua3MNCg==

