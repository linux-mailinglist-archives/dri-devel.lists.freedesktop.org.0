Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E872AA301A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591836E231;
	Fri, 30 Aug 2019 06:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC5526E231
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:38:09 +0000 (UTC)
X-UUID: 52299a477fb840b4a5c534a8607efb75-20190830
X-UUID: 52299a477fb840b4a5c534a8607efb75-20190830
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 312043307; Fri, 30 Aug 2019 14:38:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:38:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:38:10 +0800
Message-ID: <1567147084.5942.24.camel@mtksdaap41>
Subject: Re: [PATCH v5, 32/32] drm/mediatek: add support for mediatek SOC
 MT8183
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:38:04 +0800
In-Reply-To: <1567090254-15566-33-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-33-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3A53A6B57AF88A36690CA44703A5200786A336B147C0319BCC50C2D54FFA42BF2000:8
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbWVk
aWF0ZWsgU09DIE1UODE4Mwo+IDEub3ZsXzJsIHNoYXJlIGRyaXZlciB3aXRoIG92bAo+IDIucmRt
YTEgc2hhcmUgZHJpdmUgd2l0aCByZG1hMCwgYnV0IGZpZm8gc2l6ZSBpcyBkaWZmZXJlbnQKPiAz
LmFkZCBtdDgxODMgbXV0ZXggcHJpdmF0ZSBkYXRhLCBhbmQgbW1zeXMgcHJpdmF0ZSBkYXRhCj4g
NC5hZGQgbXQ4MTgzIG1haW4gYW5kIGV4dGVybmFsIHBhdGggbW9kdWxlIGZvciBjcnRjIGNyZWF0
ZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMg
IHwgMTggKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
LmMgfCAyNyArKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jICAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDE2MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpb
c25pcF0KCj4gQEAgLTYxMyw2ICs2NTgsOCBAQCBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXRr
X2RybV9wbV9vcHMsIG10a19kcm1fc3lzX3N1c3BlbmQsCj4gIAkgIC5kYXRhID0gJm10MjcxMl9t
bXN5c19kcml2ZXJfZGF0YX0sCj4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1t
bXN5cyIsCj4gIAkgIC5kYXRhID0gJm10ODE3M19tbXN5c19kcml2ZXJfZGF0YX0sCj4gKwl7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwbGF5IiwKClRoaXMgc2hvdWxkIGJlICJt
ZWRpYXRlayxtdDgxODMtbW1zeXMiLgoKUmVnYXJkcywKQ0sKCj4gKwkgIC5kYXRhID0gJm10ODE4
M19tbXN5c19kcml2ZXJfZGF0YX0sCj4gIAl7IH0KPiAgfTsKPiAgCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
