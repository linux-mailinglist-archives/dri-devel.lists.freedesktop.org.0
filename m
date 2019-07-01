Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FA5B2BB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 03:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96A089D81;
	Mon,  1 Jul 2019 01:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 464E489D81
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 01:29:47 +0000 (UTC)
X-UUID: d29bdff237594c7c81a1686025d435ae-20190701
X-UUID: d29bdff237594c7c81a1686025d435ae-20190701
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 872957804; Mon, 01 Jul 2019 09:29:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 1 Jul 2019 09:29:25 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 1 Jul 2019 09:29:23 +0800
Message-ID: <1561944562.17120.1.camel@mtksdaap41>
Subject: Re: [v5 4/7] drm/mediatek: add frame size control
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 1 Jul 2019 09:29:22 +0800
In-Reply-To: <20190627080116.40264-5-jitao.shi@mediatek.com>
References: <20190627080116.40264-1-jitao.shi@mediatek.com>
 <20190627080116.40264-5-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24732.000
X-TM-AS-Result: No-12.337600-8.000000-10
X-TMASE-MatchedRID: zGP2F0O7j/vmLzc6AOD8DfHkpkyUphL9xXRDKEyu2zF+SLLtNOiBhmmd
 1p2wVSdNRw3fpQHgw3t0pmQclXiHl4UJf3YQjB6CiJwEp8weVXwxXH/dlhvLv2q646qiEnRz7yL
 x17DX9aet2gtuWr1Lmt52diAVzqN2Z/mERv8EXlX754IB1tyKcqg3Fm19nZrJ0u/U/L+rNlES99
 dUV0LYkjvFiNq8G3M5EiVVgKqFXk5Nfs8n85Te8oMbH85DUZXyseWplitmp0j6C0ePs7A07RRAJ
 C2k3BZ6qjisAJ9xR93/FHz8N5NA/ciiN6rHv+xKGCY6L4Z1ACk=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.337600-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24732.000
X-TM-SNTS-SMTP: A90BCEAADDCB8D640566EAD2CCD718AC8B8A63ED6C117C0EF66499DE0C7667252000:8
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

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA2LTI3IGF0IDE2OjAxICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gT3VyIG5ldyBEU0kgY2hpcCBoYXMgZnJhbWUgc2l6ZSBjb250cm9sLgo+IFNvIGFk
ZCB0aGUgZHJpdmVyIGRhdGEgdG8gY29udHJvbCBmb3IgZGlmZmVyZW50IGNoaXBzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdl
ZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KClRoaXMgdmVyc2lvbiBpcyBkaWZmZXJl
bnQgdGhhbiBwcmV2aW91cyB2ZXJzaW9uLCBzbyB5b3Ugc2hvdWxkIHJlbW92ZQp0aGUgcmV2aWV3
ZWQtYnkgdGFnLiBGb3IgdGhpcyB2ZXJzaW9uLCBJIHN0aWxsIGdpdmUgeW91IGEKClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA2YjY1NTA5
MjZkYjYuLjQ1ZTMzMTA1NTg0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IEBAIC03OCw2ICs3OCw3IEBACj4gICNkZWZpbmUgRFNJX1ZCUF9OTAkJMHgyNAo+ICAjZGVmaW5l
IERTSV9WRlBfTkwJCTB4MjgKPiAgI2RlZmluZSBEU0lfVkFDVF9OTAkJMHgyQwo+ICsjZGVmaW5l
IERTSV9TSVpFX0NPTgkJMHgzOAo+ICAjZGVmaW5lIERTSV9IU0FfV0MJCTB4NTAKPiAgI2RlZmlu
ZSBEU0lfSEJQX1dDCQkweDU0Cj4gICNkZWZpbmUgRFNJX0hGUF9XQwkJMHg1OAo+IEBAIC0xNjIs
NiArMTYzLDcgQEAgc3RydWN0IHBoeTsKPiAgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgewo+
ICAJY29uc3QgdTMyIHJlZ19jbWRxX29mZjsKPiAgCWJvb2wgaGFzX3NoYWRvd19jdGw7Cj4gKwli
b29sIGhhc19zaXplX2N0bDsKPiAgfTsKPiAgCj4gIHN0cnVjdCBtdGtfZHNpIHsKPiBAQCAtNDMw
LDYgKzQzMiwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVj
dCBtdGtfZHNpICpkc2kpCj4gIAl3cml0ZWwodm0tPnZmcm9udF9wb3JjaCwgZHNpLT5yZWdzICsg
RFNJX1ZGUF9OTCk7Cj4gIAl3cml0ZWwodm0tPnZhY3RpdmUsIGRzaS0+cmVncyArIERTSV9WQUNU
X05MKTsKPiAgCj4gKwlpZiAoZHNpLT5kcml2ZXJfZGF0YS0+aGFzX3NpemVfY3RsKQo+ICsJCXdy
aXRlbCh2bS0+dmFjdGl2ZSA8PCAxNiB8IHZtLT5oYWN0aXZlLAo+ICsJCSAgICAgICBkc2ktPnJl
Z3MgKyBEU0lfU0laRV9DT04pOwo+ICsKPiAgCWhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9
ICh2bS0+aHN5bmNfbGVuICogZHNpX3RtcF9idWZfYnBwIC0gMTApOwo+ICAKPiAgCWlmIChkc2kt
Pm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0UpCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
