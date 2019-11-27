Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026010A807
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 02:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46116E1E2;
	Wed, 27 Nov 2019 01:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 27 Nov 2019 01:36:59 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FE546E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 01:36:59 +0000 (UTC)
X-UUID: 624387a667234246a9ecf48859cfa127-20191127
X-UUID: 624387a667234246a9ecf48859cfa127-20191127
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1287883452; Wed, 27 Nov 2019 09:31:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:31:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 27 Nov 2019 09:30:52 +0800
Message-ID: <1574818303.15691.10.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: fix up 1440x900 dp display black
 screen issue
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 27 Nov 2019 09:31:43 +0800
In-Reply-To: <1574750869-12611-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1574750869-12611-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6B9FEC13DEDCAA3FED78A3946FCFD3C5E46997A32C15BEB208086C51E86B01A2000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FfLWy7hYVqt6twZ6RqO6oRqpE+bo5f378iJWtJ09HPs=; 
 b=Bq7Fl4Oi+Lk1tD3cPumLCx2s10Mu4jWil28A3RTJo3pWHNRK6aRpiAyIkLsR8RogIH3PV81b/J+K1sXYDQszV4IbWbTuRajebbtueiosyRG1tkg2Gic46Iwkp/q53UENRRkapchJ+tsK+GkA7c0SvuOlR+ZBHH/WuIBtE3zTPzw=;
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

SGksIFlvbmdxaWFuZzoNCg0KT24gVHVlLCAyMDE5LTExLTI2IGF0IDE0OjQ3ICswODAwLCB5b25n
cWlhbmcubml1QG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIHBhdGNoIGZpeCB1cCAxNDQweDkw
MCBkcCBkaXNwbGF5IGJsYWNrIHNjcmVlbiBpc3N1ZQ0KPiB0aGUgY29tcHV0ZWQgcmVzdWx0IHdp
bGwgb3ZlcmZsb3cgcmRtYTEgZmlmbyBtYXggc2l6ZQ0KPiB3aGVuIGV4dGVybmFsIGRpc3BsYXkg
cGl4ZWwgY2xvY2sgYmlnZ2VyIHRoYW4gNzRNSFoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX3JkbWEuYw0KPiBpbmRleCBjMWFiZGUzLi40MTE0M2Y1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gQEAgLTE1Miw2ICsxNTIsMTAgQEAgc3Rh
dGljIHZvaWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2ln
bmVkIGludCB3aWR0aCwNCj4gIAkgKiBhY2NvdW50IGZvciBibGFua2luZywgYW5kIHdpdGggYSBw
aXhlbCBkZXB0aCBvZiA0IGJ5dGVzOg0KPiAgCSAqLw0KPiAgCXRocmVzaG9sZCA9IHdpZHRoICog
aGVpZ2h0ICogdnJlZnJlc2ggKiA0ICogNyAvIDEwMDAwMDA7DQo+ICsNCj4gKwlpZiAodGhyZXNo
b2xkID4gcmRtYV9maWZvX3NpemUpDQo+ICsJCXRocmVzaG9sZCA9IHJkbWFfZmlmb19zaXplOw0K
PiArDQoNClRoaXMgbG9va3MgbGlrZSB0aGF0IHRocmVzaG9sZCBpcyBvdmVyIHNwZWMuIEkgdGhp
bmsgdGhpcyBGSUZPIGlzIHVzZWQNCnRvIGNvdmVyIHRoZSBsYXRlbmN5IG9mIHJlYWRpbmcgZGF0
YSBmcm9tIERSQU0uIFdoZW4gZGF0YSBpcyByZWFkIGZyb20NCk9WTCBub3QgUkRNQSwgT1ZMIGFs
cmVhZHkgaGFzIGEgRklGTywgc28gUkRNQSBGSUZPIGlzIHVzZWxlc3MuIFNvIEkNCnRoaW5rIHlv
dSBzaG91bGQgc2V0IHRocmVzaG9sZCB0byBhIHNwZWNpYWwgdmFsdWUgd2hlbiBSRE1BIGlzIGlu
IGRpcmVjdA0KbGluayBtb2RlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgCXJlZyA9IFJETUFfRklG
T19VTkRFUkZMT1dfRU4gfA0KPiAgCSAgICAgIFJETUFfRklGT19QU0VVRE9fU0laRShyZG1hX2Zp
Zm9fc2l6ZSkgfA0KPiAgCSAgICAgIFJETUFfT1VUUFVUX1ZBTElEX0ZJRk9fVEhSRVNIT0xEKHRo
cmVzaG9sZCk7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
