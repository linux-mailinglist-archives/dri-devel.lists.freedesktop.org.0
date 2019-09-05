Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF60A987C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 04:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2A89A62;
	Thu,  5 Sep 2019 02:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8210889A62
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 02:41:49 +0000 (UTC)
X-UUID: ee9c975d9c9f4a36948ac9b4ed035b23-20190905
X-UUID: ee9c975d9c9f4a36948ac9b4ed035b23-20190905
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 291277882; Thu, 05 Sep 2019 10:41:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Sep 2019 10:41:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Sep 2019 10:41:37 +0800
Message-ID: <1567651299.13330.4.camel@mtksdaap41>
Subject: Re: [PATCH v6 0/7] Support dsi for mt8183
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 5 Sep 2019 10:41:39 +0800
In-Reply-To: <20190811104008.53372-1-jitao.shi@mediatek.com>
References: <20190811104008.53372-1-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24890.000
X-TM-AS-Result: No-10.241600-8.000000-10
X-TMASE-MatchedRID: 6otD/cJAac2EFkjzuXHNt+LdprnA5EQRJih/yo+OvlVSAxvL+nqAnW4+
 gA+i9D2DqMlm1+4tGhQfHS8wUUuW9T4Pcn5OGAtGMpVOsYwN78M0YG6kQ2QiFFSOymiJfTYXrr5
 TE4GLzk06n5U+9hWy0GYwRleGHW3t0/GyN5MpGlOqNnzrkU+2mgKflB9+9kWVcJHSK1bfF9XGcw
 gtERMbmd99l6mYw28dfPU3ZRMebCuKiQbKW6KJeAlpVkdtt3WuOHhqIXe4IzZIyDY579vwTFYvW
 mlP6FyeEu6Hmd7GM5PTDbyTDLiYnVGEd5OSBmbmngIgpj8eDcC063Wh9WVqgmWCfbzydb0g2EuZ
 q9zngaeNo+PRbWqfRDsAVzN+Ov/sXEXPO/6fybNBoFITciebPaiz/Co2CGruef8GeKgmo5snmxJ
 8YZpSdw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.241600-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24890.000
X-TM-SNTS-SMTP: 75FAA2A7B910283301DE15DCDB5DB7A8A744F4C0B4B7E434DF4A678FAB936AED2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry
 Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy
 Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0
LTUuNSBbMV0sIGFuZCBJIGJyZWFrCiJbdjYsMi83XSBkcm0vbWVkaWF0ZWs6IGZpeGVzIENNRFEg
cmVnIGFkZHJlc3Mgb2YgbXQ4MTczIGlzIGRpZmZlcmVudAp3aXRoIG10MjcwMSIgaW50byB0d28g
cGF0Y2hlcywgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNvbS9ja2h1LW1lZGlhdGVrL2xp
bnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLW5leHQtNS41CgpSZWdhcmRzLApDSwoK
Ck9uIFN1biwgMjAxOS0wOC0xMSBhdCAxODo0MCArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IENo
YW5nZSBzaW5jZSB2NToKPiAgLSBmaW5lIHR1bmUgZHBoeSB0aW1pbmcuCj4gCj4gQ2hhbmdlIHNp
bmNlIHY0Ogo+ICAtIG1vdmUgbWlwaV9kc2lfaG9zdF91bnJlZ2l0ZXIoKSB0byAucmVtb3ZlKCkK
PiAgLSBmaW5lIHR1bmUgYWRkIGZyYW1lIHNpemUgY29udHJvbCBjb2Rpbmcgc3R5bGUKPiAgLSBj
aGFuZ2UgdGhlIGRhdGEgdHlwZSBvZiBkYXRhX3JhdGUgYXMgdTMyLCBhbmQgYWRkIERJVl9ST1VO
RF9VUF9VTEwKPiAgLSB1c2UgZGl2X3U2NCB3aGVuIDgwMDAwMDAwMDBVTEwgLyBkc2ktPmRhdGFf
cmF0ZS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYzCj4gIC0gYWRkIG9uZSBtb3JlICd0YWInIGZvciBi
aXR3aXNlIGRlZmluZS4KPiAgLSBhZGQgVGVzdGVkLWJ5OiBSeWFuIENhc2UgPHJ5YW5kY2FzZUBj
aHJvbWl1bS5vcmc+Cj4gCWFuZCBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4uCj4gIC0gcmVtb3ZlIGNvbXBhcmUgZGFfaHNfemVybyB0byBkYV9oc19wcmVwYXJlLgo+IAo+
IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gY2hhbmdlIHRoZSB2aWRlbyB0aW1pbmcgY2FsYyBtZXRo
b2QKPiAgLSBmaW5lIHRoZSBkc2kgYW5kIG1pcGl0eCBpbml0IHNlcXVlbmNlCj4gIC0gZmluZSB0
dW5lIGNvbW1pdCBtc2cKPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIHNlcGFyYXRlIGZyYW1l
IHNpemUgYW5kIHJlZyBjb21taXQgY29udHJvbCBpbmRlcGVuZGVudCBwYXRjaGVzLgo+ICAtIGZp
eCBzb21lIHJldHVybiB2YWx1ZXMgaW4gcHJvYmUKPiAgLSByZW1vdmUgRFNJX0NNRFcwIGluICJD
TURRIHJlZyBhZGRyZXNzIG9mIG10ODE3MyBpcyBkaWZmZXJlbnQgd2l0aCBtdDI3MDEiIAo+IAo+
IEppdGFvIFNoaSAoNyk6Cj4gICBkcm0vbWVkaWF0ZWs6IG1vdmUgbWlwaV9kc2lfaG9zdF9yZWdp
c3RlciB0byBwcm9iZQo+ICAgZHJtL21lZGlhdGVrOiBmaXhlcyBDTURRIHJlZyBhZGRyZXNzIG9m
IG10ODE3MyBpcyBkaWZmZXJlbnQgd2l0aAo+ICAgICBtdDI3MDEKPiAgIGRybS9tZWRpYXRlazog
YWRkIGRzaSByZWcgY29tbWl0IGRpc2FibGUgY29udHJvbAo+ICAgZHJtL21lZGlhdGVrOiBhZGQg
ZnJhbWUgc2l6ZSBjb250cm9sCj4gICBkcm0vbWVkaWF0ZWs6IGFkZCBtdDgxODMgZHNpIGRyaXZl
ciBzdXBwb3J0Cj4gICBkcm0vbWVkaWF0ZWs6IGNoYW5nZSB0aGUgZHNpIHBoeXRpbWluZyBjYWxj
dWxhdGUgbWV0aG9kCj4gICBkcm06IG1lZGlhdGVrOiBhZGp1c3QgZHNpIGFuZCBtaXBpX3R4IHBy
b2JlIHNlcXVlbmNlCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgIHwgMjI0
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjEgaW5zZXJ0
aW9ucygrKSwgNjUgZGVsZXRpb25zKC0pCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
