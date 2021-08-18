Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B893EF9AA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 06:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BE16E3AC;
	Wed, 18 Aug 2021 04:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636FD6E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:45:52 +0000 (UTC)
X-UUID: 003283c68a2b45638f8ffa8fbba34e84-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gwefHctzxshOaf4fg4KkL1L7hvd5+4m+WWaOv+quqNM=; 
 b=ToLjk/B9DFglSQSn/31qLMqzxKNNBEb9k1VBIf+dg8k/sZFrIozvHsbctC2nh6VdkcCPSAdo1HjXN3RkziqLilC2CmjFCQOpiljm9LpNNpvaIaDgmR1C+l6IyHbeUvlEGFZVbOPoJfYJzKEPHuYAtfLIeCdQBUz6RUat8N8tHEY=;
X-UUID: 003283c68a2b45638f8ffa8fbba34e84-20210818
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 890575281; Wed, 18 Aug 2021 12:45:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 12:45:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 12:45:45 +0800
Message-ID: <1629261946.11678.5.camel@mtksdaap41>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 18 Aug 2021 12:45:46 +0800
In-Reply-To: <20210816192523.1739365-2-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-2-msp@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hcmt1czoNCg0KT24gTW9uLCAyMDIxLTA4LTE2IGF0IDIxOjI1ICswMjAwLCBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIHdyb3RlOg0KPiBEUF9JTlRGIGlzIHNpbWlsYXIgdG8gdGhlIGFj
dHVhbCBkcGkuIFRoZXkgZGlmZmVyIGluIHNvbWUgcG9pbnRzDQo+IHJlZ2FyZGluZyByZWdpc3Rl
cnMgYW5kIHdoYXQgbmVlZHMgdG8gYmUgc2V0IGJ1dCB0aGUgZnVuY3Rpb24gYmxvY2tzDQo+IGl0
c2VsZiBhcmUgc2ltaWxhciBpbiBkZXNpZ24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIDxtc3BAYmF5bGlicmUuY29tPg0KPiAtLS0NCj4gIC4uLi9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sICAgICAgICB8IDQ4ICsrKysrKysrKysrKysr
KystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwNCj4gaW5kZXgg
ZGQyODk2YTQwZmYwLi5kZTRiZGFjZDgzYWMgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55YW1sDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRwaS55YW1sDQo+IEBAIC00LDcgKzQsNyBAQA0KPiAgJGlkOiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IXo1VHlQdmJx
M1pMSGpSUHNjT0hpZ1VNbGlramh0Sk1GckVRcWVtY2pRWmE0TmFYQkU5dHpNbkRGTWExcVlnJCAN
Cj4gICRzY2hlbWE6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IXo1VHlQ
dmJxM1pMSGpSUHNjT0hpZ1VNbGlramh0Sk1GckVRcWVtY2pRWmE0TmFYQkU5dHpNbkFqdUJDeHNn
JCANCj4gDQo+IC10aXRsZTogbWVkaWF0ZWsgRFBJIENvbnRyb2xsZXIgRGV2aWNlIFRyZWUgQmlu
ZGluZ3MNCj4gK3RpdGxlOiBtZWRpYXRlayBEUEkvRFBfSU5URiBDb250cm9sbGVyIERldmljZSBU
cmVlIEJpbmRpbmdzDQo+ICANCj4gIG1haW50YWluZXJzOg0KPiAgICAtIENLIEh1IDxjay5odUBt
ZWRpYXRlay5jb20+DQo+IEBAIC0xMyw3ICsxMyw4IEBAIG1haW50YWluZXJzOg0KPiAgZGVzY3Jp
cHRpb246IHwNCj4gICAgVGhlIE1lZGlhdGVrIERQSSBmdW5jdGlvbiBibG9jayBpcyBhIHNpbmsg
b2YgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGFuZA0KPiAgICBwcm92aWRlcyA4LWJpdCBSR0IvWVVW
NDQ0IG9yIDgvMTAvMTAtYml0IFlVVjQyMiBwaXhlbCBkYXRhIG9uIGEgcGFyYWxsZWwNCj4gLSAg
b3V0cHV0IGJ1cy4NCj4gKyAgb3V0cHV0IGJ1cy4gVGhlIE1lZGlhdGVrIERQX0lOVEYgaXMgYSBz
aW1pbGFyIGZ1bmN0aW9uIGJsb2NrIHRoYXQgaXMNCj4gKyAgY29ubmVjdGVkIHRvIHRoZSAoZW1i
ZWRkZWQpIGRpc3BsYXkgcG9ydCBmdW5jdGlvbiBibG9jay4NCj4gIA0KPiAgcHJvcGVydGllczoN
Cj4gICAgY29tcGF0aWJsZToNCj4gQEAgLTIzLDYgKzI0LDcgQEAgcHJvcGVydGllczoNCj4gICAg
ICAgIC0gbWVkaWF0ZWssbXQ4MTczLWRwaQ0KPiAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZHBp
DQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE5Mi1kcGkNCj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4
MTk1LWRwaW50Zg0KDQpJJ3ZlIHJldmlld2VkIHRoZSBtb2RpZmljYXRpb24gaW4gZHJpdmVyLCBp
dCBzZWVtcyB0aGF0IGRwaW50ZiBpcyBhbG1vc3QNCnRoZSBzYW1lIGFzIGRwaS4gV2h5IHVzZSB0
aGUgbmFtZSAiZHBpbnRmIj8gSSBjb3VsZCBhY2NlcHQgdGhpcyBuYW1lDQpvbmx5IGl0J3MgZGVm
aW5lZCBieSBoYXJkd2FyZSBkYXRhIHNoZWV0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgDQo+ICAg
IHJlZzoNCj4gICAgICBtYXhJdGVtczogMQ0KPiBAQCAtMzcsMTAgKzM5LDExIEBAIHByb3BlcnRp
ZXM6DQo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBEUEkgUExMDQo+ICANCj4gICAgY2xvY2stbmFt
ZXM6DQo+IC0gICAgaXRlbXM6DQo+IC0gICAgICAtIGNvbnN0OiBwaXhlbA0KPiAtICAgICAgLSBj
b25zdDogZW5naW5lDQo+IC0gICAgICAtIGNvbnN0OiBwbGwNCj4gKyAgICBkZXNjcmlwdGlvbjoN
Cj4gKyAgICAgIEZvciBkcGkgY2xvY2tzIHBpeGVsLCBlbmdpbmUgYW5kIHBsbCBhcmUgcmVxdWly
ZWQuIEZvciBkcGludGYgcGl4ZWwsIHBsbCwNCj4gKyAgICAgIHBsbF9kMiwgcGxsX2Q0LCBwbGxf
ZDgsIHBsbF9kMTYsIGhmX2ZtbSwgaGZfZmRwIGFyZSByZXF1aXJlZC4NCj4gKyAgICBtaW5JdGVt
czogMw0KPiArICAgIG1heEl0ZW1zOiA4DQo+ICANCj4gICAgcGluY3RybC0wOiB0cnVlDQo+ICAg
IHBpbmN0cmwtMTogdHJ1ZQ0KPiBAQCAtNjQsNiArNjcsMzkgQEAgcmVxdWlyZWQ6DQo+ICAgIC0g
Y2xvY2stbmFtZXMNCj4gICAgLSBwb3J0DQo+ICANCj4gK2FsbE9mOg0KPiArICAtIGlmOg0KPiAr
ICAgICAgcHJvcGVydGllczoNCj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gKyAgICAgICAgICBj
b250YWluczoNCj4gKyAgICAgICAgICAgIGVudW06DQo+ICsgICAgICAgICAgICAgIC0gbWVkaWF0
ZWssbXQ4MTk1LWRwaW50Zg0KPiArICAgIHRoZW46DQo+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiAr
ICAgICAgICBjbG9ja3M6DQo+ICsgICAgICAgICAgbWluSXRlbXM6IDgNCj4gKyAgICAgICAgICBt
YXhJdGVtczogOA0KPiArICAgICAgICBjbG9jay1uYW1lczoNCj4gKyAgICAgICAgICBpdGVtczoN
Cj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBpeGVsDQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBw
bGwNCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IHBsbF9kMg0KPiArICAgICAgICAgICAgLSBjb25z
dDogcGxsX2Q0DQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBwbGxfZDgNCj4gKyAgICAgICAgICAg
IC0gY29uc3Q6IHBsbF9kMTYNCj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGhmX2ZtbQ0KPiArICAg
ICAgICAgICAgLSBjb25zdDogaGZfZmRwDQo+ICsgICAgZWxzZToNCj4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ICsgICAgICAgIGNsb2NrczoNCj4gKyAgICAgICAgICBtaW5JdGVtczogMw0KPiArICAg
ICAgICAgIG1heEl0ZW1zOiAzDQo+ICsgICAgICAgIGNsb2NrLW5hbWVzOg0KPiArICAgICAgICAg
IGl0ZW1zOg0KPiArICAgICAgICAgICAgLSBjb25zdDogcGl4ZWwNCj4gKyAgICAgICAgICAgIC0g
Y29uc3Q6IGVuZ2luZQ0KPiArICAgICAgICAgICAgLSBjb25zdDogcGxsDQo+ICsNCj4gIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiAgDQo+ICBleGFtcGxlczoNCg0K

