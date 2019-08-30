Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A6A3006
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8C16E26D;
	Fri, 30 Aug 2019 06:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 108246E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:34:43 +0000 (UTC)
X-UUID: 38e5d13ac4ea4e928864b05c935a20a0-20190830
X-UUID: 38e5d13ac4ea4e928864b05c935a20a0-20190830
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 360870798; Fri, 30 Aug 2019 14:34:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 14:34:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 30 Aug 2019 14:34:38 +0800
Message-ID: <1567146872.5942.21.camel@mtksdaap41>
Subject: Re: [PATCH v5, 30/32] drm/mediatek: add connection from DITHER0 to
 DSI0
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 30 Aug 2019 14:34:32 +0800
In-Reply-To: <1567090254-15566-31-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-31-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2D80EE79821C3E6C697081CC7D2D39A69D62CD500E2390B9E48C61F531F4FD352000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IERJVEhFUjAgdG8gRFNJMAoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8
IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggMjM3ODI0Zi4uZmQzODY1OCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTM1LDEwICszNSwx
MiBAQAo+ICAKPiAgI2RlZmluZSBNVDgxODNfRElTUF9PVkwwXzJMX01PVVRfRU4JCTB4ZjA0Cj4g
ICNkZWZpbmUgTVQ4MTgzX0RJU1BfT1ZMMV8yTF9NT1VUX0VOCQkweGYwOAo+ICsjZGVmaW5lIE1U
ODE4M19ESVNQX0RJVEhFUjBfTU9VVF9FTgkJMHhmMGMKPiAgI2RlZmluZSBNVDgxODNfRElTUF9Q
QVRIMF9TRUxfSU4JCTB4ZjI0Cj4gIAo+ICAjZGVmaW5lIE9WTDBfMkxfTU9VVF9FTl9ESVNQX1BB
VEgwCQkJQklUKDApCj4gICNkZWZpbmUgT1ZMMV8yTF9NT1VUX0VOX1JETUExCQkJCUJJVCg0KQo+
ICsjZGVmaW5lIERJVEhFUjBfTU9VVF9JTl9EU0kwCQkJCUJJVCgwKQo+ICAjZGVmaW5lIERJU1Bf
UEFUSDBfU0VMX0lOX09WTDBfMkwJCQkweDEKPiAgCj4gICNkZWZpbmUgTVQyNzAxX0RJU1BfTVVU
RVgwX01PRDAJCQkweDJjCj4gQEAgLTMyMyw2ICszMjUsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IG10a19kZHBfbW91dF9lbihjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhICpkYXRhLAo+
ICAJCSAgIG5leHQgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewo+ICAJCSphZGRyID0gTVQ4MTgz
X0RJU1BfT1ZMMV8yTF9NT1VUX0VOOwo+ICAJCXZhbHVlID0gT1ZMMV8yTF9NT1VUX0VOX1JETUEx
Owo+ICsJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9ESVRIRVIgJiYgbmV4dCA9PSBE
RFBfQ09NUE9ORU5UX0RTSTApIHsKPiArCQkqYWRkciA9IE1UODE4M19ESVNQX0RJVEhFUjBfTU9V
VF9FTjsKPiArCQl2YWx1ZSA9IERJVEhFUjBfTU9VVF9JTl9EU0kwOwo+ICAJfSBlbHNlIHsKPiAg
CQl2YWx1ZSA9IDA7Cj4gIAl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
