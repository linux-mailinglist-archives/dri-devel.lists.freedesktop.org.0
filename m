Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7814D0A2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512056E5B1;
	Thu, 20 Jun 2019 14:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF89B6E5B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:46:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KEkmor098920;
 Thu, 20 Jun 2019 09:46:48 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KEkmGG067841
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 09:46:48 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 09:46:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 09:46:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KEkiH2118963;
 Thu, 20 Jun 2019 09:46:45 -0500
Subject: Re: [PATCH] backlight: gpio-backlight: Set power state instead of
 brightness at probe
To: Daniel Thompson <daniel.thompson@linaro.org>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20190517150546.4508-1-paul.kocialkowski@bootlin.com>
 <bee40295b2c6b489468d4e1fc12d7a1ac122cb9b.camel@bootlin.com>
 <29712212-0567-702b-fbc9-c0f37806d84c@linaro.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <fc58a7f5-a71d-f559-80a4-81be54e66bc6@ti.com>
Date: Thu, 20 Jun 2019 17:47:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <29712212-0567-702b-fbc9-c0f37806d84c@linaro.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561042009;
 bh=sQX2i5IGsl3vihAlodZ3TP/Eg3a+lh9I2QnVBA7Vtig=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dnqBRU4y3JnnbZmkZ8b9Ry7+YgJg1/HcassHVppi6O76Rar7epCqL5+Hy/KNA8Y4m
 QT6KcfBP4ryUE6RCDU/GvVHmhkA4bf+Yy+mx03EznPFLcJdAL5u5GhYF2zpKQI7CVV
 U/lioyAY9wjxB2oIWxLGF52yYitlwQStipNL2ShU=
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsLAoKT24gMjAvMDYvMjAxOSAxNi41NiwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9u
IDE4LzA2LzIwMTkgMTM6NTgsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+PiBIaSwKPj4KPj4g
T24gRnJpLCAyMDE5LTA1LTE3IGF0IDE3OjA1ICswMjAwLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90
ZToKPj4+IE9uIGEgdHJpdmlhbCBncGlvLWJhY2tsaWdodCBzZXR1cCB3aXRoIGEgcGFuZWwgdXNp
bmcgdGhlIGJhY2tsaWdodCBidXQKPj4+IG5vIGJvb3Qgc29mdHdhcmUgdG8gZW5hYmxlIGl0IGJl
Zm9yZWhhbmQsIHdlIGZhbGwgaW4gYSBjYXNlIHdoZXJlIHRoZQo+Pj4gYmFja2xpZ2h0IGlzIGRp
c2FibGVkIChub3QganVzdCBibGFua2VkKSBhbmQgdGh1cyByZW1haW5zIGRpc2FibGVkIHdoZW4K
Pj4+IHRoZSBwYW5lbCBnZXRzIGVuYWJsZWQuCj4+Pgo+Pj4gU2V0dGluZyBnYmwtPmRlZl92YWx1
ZSB2aWEgdGhlIGRldmljZS10cmVlIHByb3AgYWxsb3dzIGVuYWJsaW5nIHRoZQo+Pj4gYmFja2xp
Z2h0IGluIHRoaXMgc2l0dWF0aW9uLCBidXQgaXQgd2lsbCBiZSB1bmJsYW5rZWQgc3RyYWlnaHQg
YXdheSwKPj4+IGluIGNvbXBsaWFuY2Ugd2l0aCB0aGUgYmluZGluZy4gVGhpcyBkb2VzIG5vdCB3
b3JrIHdlbGwgd2hlbiB0aGVyZQo+Pj4gd2FzIG5vCj4+PiBib290IHNvZnR3YXJlIHRvIGRpc3Bs
YXkgc29tZXRoaW5nIGJlZm9yZSwgc2luY2Ugd2UgcmVhbGx5IG5lZWQgdG8KPj4+IHVuYmxhbmsK
Pj4+IGJ5IHRoZSB0aW1lIHRoZSBwYW5lbCBpcyBlbmFibGVkLCBub3QgYmVmb3JlLgo+Pj4KPj4+
IFJlc29sdmUgdGhlIHNpdHVhdGlvbiBieSBzZXR0aW5nIHRoZSBicmlnaHRuZXNzIHRvIDEgYXQg
cHJvYmUgYW5kCj4+PiBtYW5hZ2luZyB0aGUgcG93ZXIgc3RhdGUgYWNjb3JkaW5nbHksIGEgYml0
IGxpa2UgaXQncyBkb25lIGluCj4+PiBwd20tYmFja2xpZ2h0Lgo+Pgo+PiBBbnkgZmVlZGJhY2sg
b24gdGhpcz8gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBpdCBjb3VsZCBiZSBxdWl0
ZQo+PiBjb250cm92ZXJzaWFsLCBhcyBpdCBpbXBsaWVzIHRoYXQgdGhlIGJhY2tsaWdodCBjYW4g
bm8gbG9uZ2VyIGJlCj4+IGVuYWJsZWQgd2l0aG91dCBhIGJvdW5kIHBhbmVsICh3aGljaCBJTU8g
bWFrZXMgZ29vZCBzZW5zZSBidXQgY291bGQgYmUKPj4gYSBtYXR0ZXIgdG8gZGViYXRlKS4KPiAK
PiBNeSBhcG9sb2dpZXMuIFRoaXMgcGF0Y2ggYnJvdWdodCBvbiBzdWNoIHNldmVyZSBkZWphLXZ1
IEkgZ290IHJhdGhlcgo+IGNvbmZ1c2VkLiBUaGVuIHdoZW4gSSB3ZW50IGRpZ2dpbmcgSSd2ZSBh
bHNvIGRyb3BwZWQgdGhlIGJhbGwgb24gdGhlCj4gc2FtZSBmZWF0dXJlIHByZXZpb3VzbHkuCj4g
Cj4gUGV0ZXIgVWpmYWx1c2kgcHJvdmlkZWQgYSBzaW1pbGFyIHBhdGNoIHRvIHlvdXJzIGJ1dCB3
aXRoIGEgc2xpZ2h0bHkKPiBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb246Cj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwMDIzNTkvCj4gCj4gT24gdGhlIHdob2xlIEkg
dGhpbmsgaXQgaXMgaW1wb3J0YW50IHRvIHJlYWQgdGhlIEdQSU8gcGluIHNpbmNlCj4gb3RoZXJ3
aXNlIHdlIHN3YXAgcHJvYmxlbXMgd2hlbiB0aGVyZSBib290bG9hZGVyIGRvZXMgc2V0dXAgdGhl
Cj4gYmFja2xpZ2h0IGZvciBwcm9ibGVtcyB3aGVyZSBpdCBkb2VzIG5vdC4KPiAKPiBUaGUgdGhp
bmcgSSBkb24ndCBnZXQgaXMgd2h5IGJvdGggcGF0Y2hlcyB0cnkgdG8gYXZvaWQgc2V0dGluZyB0
aGUKPiBiYWNrbGlnaHQgYnJpZ2h0bmVzcyBmcm9tIGRlZl92YWx1ZS4gU2ltcGxlIGRpc3BsYXlz
LCBlc3BlY2lhbGx5Cj4gbW9ub2Nocm9tZSBvbmVzIGFyZSBwZXJmZWN0bHkgcmVhZGFibGUgd2l0
aCB0aGUgYmFja2xpZ2h0IG9mZi4uLiB6ZXJvCj4gYnJpZ2h0bmVzcyBpcyBub3QgYSAiYmFkIiB2
YWx1ZS4KCkJlY2F1c2Ugd2UgbWlnaHQgaGF2ZSBub24gbW9ub2Nocm9tZSBkaXNwbGF5cyB3aGVy
ZSB0aGUgZGlzcGxheSBpcyBub3QKcmVhZGFibGUgd2hlbiB0aGUgYmFja2xpZ2h0IGlzIG9mZiBh
bmQgZm9yIHRoZSBzYWtlIG9mIHRvIGJlIGNvbnNpc3RlbnQ/CkZsaWNrZXJpbmcgYmFja2xpZ2h0
IGlzIG5vdCByZWFsbHkgYSBuaWNlIHRoaW5nIGR1cmluZyBib290LgoKPiBOb3Qgc3VyZSBpZiBQ
ZXRlciBpcyBzdGlsbCB3aWxsaW5nIHRvIHJldiBoaXMgdmVyc2lvbiBvZiB0aGlzIGNvZGUKPiAo
Z2l2ZW4gaG93IGJhZGx5IHdlIG5lZ2xlY3RlZCBoaW0gcHJldmlvdXNseSkgb3Igd2hldGhlciB5
b3Ugd2FudCB0byB0cnkKPiBhbmQgY29tYmluZSBib3RoIGlkZWFzLgoKTm90aGluZyBzcGVjaWFs
LCB0aGluZ3Mgc29tZXRpbWVzIGdvdCBvdmVybG9va2VkLgpJIHNob3VsZCBoYXZlIGJlZW4gbmFn
Z2luZyB5b3UgYWJvdXQgaXQgOykKCkkgdGhpbmsgdGhlIHYyIHBhdGNoIGZyb20gbWUgc2hvdWxk
IGFwcGx5IGp1c3QgZmluZSBhbmQgaXQgaGFzIHRoZSBncGlvCnJlYWQgYXMgd2VsbCwgaWYgbm90
LCB0aGVuIEkgbWlnaHQgbm90IGJlIGFibGUgdG8gcmVzZW5kIGFzIEknbSBvdXQgb2YKb2ZmaWNl
IGZvciBhIHdoaWxlCgotIFDDqXRlcgoKCj4gCj4gCj4gRGFuaWVsLgo+IAo+IAo+Pgo+PiBDaGVl
cnMsCj4+Cj4+IFBhdWwKPj4KPj4+IEZpeGVzOiA4Yjc3MGUzYzk4MjQgKCJiYWNrbGlnaHQ6IEFk
ZCBHUElPLWJhc2VkIGJhY2tsaWdodCBkcml2ZXIiKQo+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBL
b2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgo+Pj4gLS0tCj4+PiDC
oCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgMTkgKysrKysrKysr
KysrKysrKysrLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYwo+Pj4gYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jCj4+PiBpbmRleCBlNDcwZGE5NWQ4MDYuLmM5Y2I5N2ZhMTNkMCAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPj4+ICsrKyBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPj4+IEBAIC01Nyw2ICs1NywyMSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9vcHMKPj4+IGdwaW9fYmFja2xpZ2h0X29w
cyA9IHsKPj4+IMKgwqDCoMKgwqAgLmNoZWNrX2ZiwqDCoMKgID0gZ3Bpb19iYWNrbGlnaHRfY2hl
Y2tfZmIsCj4+PiDCoCB9Owo+Pj4gwqAgK3N0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlh
bF9wb3dlcl9zdGF0ZShzdHJ1Y3QKPj4+IGdwaW9fYmFja2xpZ2h0ICpnYmwpCj4+PiArewo+Pj4g
K8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBnYmwtPmRldi0+b2Zfbm9kZTsKPj4+
ICsKPj4+ICvCoMKgwqAgLyogSWYgd2UgYWJzb2x1dGVseSB3YW50IHRoZSBiYWNrbGlnaHQgZW5h
YmxlZCBhdCBib290LiAqLwo+Pj4gK8KgwqDCoCBpZiAoZ2JsLT5kZWZfdmFsdWUpCj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIEZCX0JMQU5LX1VOQkxBTks7Cj4+PiArCj4+PiArwqDCoMKgIC8q
IElmIHRoZXJlJ3Mgbm8gcGFuZWwgdG8gdW5ibGFuayB0aGUgYmFja2xpZ2h0IGxhdGVyLiAqLwo+
Pj4gK8KgwqDCoCBpZiAoIW5vZGUgfHwgIW5vZGUtPnBoYW5kbGUpCj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIEZCX0JMQU5LX1VOQkxBTks7Cj4+PiArCj4+PiArwqDCoMKgIHJldHVybiBGQl9C
TEFOS19QT1dFUkRPV047Cj4+PiArfQo+Pj4gKwo+Pj4gwqAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZV9kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdi
bCkKPj4+IMKgIHsKPj4+IEBAIC0xNDIsNyArMTU3LDkgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QKPj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihibCk7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgIC3C
oMKgwqAgYmwtPnByb3BzLmJyaWdodG5lc3MgPSBnYmwtPmRlZl92YWx1ZTsKPj4+ICvCoMKgwqAg
YmwtPnByb3BzLmJyaWdodG5lc3MgPSAxOwo+Pj4gK8KgwqDCoCBibC0+cHJvcHMucG93ZXIgPSBn
cGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKGdibCk7Cj4+PiArCj4+PiDCoMKgwqDC
oMKgIGJhY2tsaWdodF91cGRhdGVfc3RhdHVzKGJsKTsKPj4+IMKgIMKgwqDCoMKgwqAgcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgYmwpOwo+IAoKClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
