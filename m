Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49395F14F3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 12:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AD6ECDE;
	Wed,  6 Nov 2019 11:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A06ECDB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 11:23:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6BNTaw028417;
 Wed, 6 Nov 2019 05:23:29 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6BNTs1066849
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Nov 2019 05:23:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 05:23:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 05:23:12 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6BNP58072989;
 Wed, 6 Nov 2019 05:23:26 -0600
Subject: Re: [PATCH] drm/bridge: tc358767: fix max_tu_symbol value
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, <dri-devel@lists.freedesktop.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>
References: <CGME20190924131723epcas2p27878e7a6c00a7a077260cf0c5cad5b1a@epcas2p2.samsung.com>
 <20190924131702.9988-1-tomi.valkeinen@ti.com>
 <95fb631e-9aff-35d4-a266-f3bc92ea4939@samsung.com>
 <a26d025a-4257-8698-44e8-f0c4287da99f@ti.com>
Message-ID: <0b6d2581-9a0d-7df1-73c7-d42c5e5f68aa@ti.com>
Date: Wed, 6 Nov 2019 13:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a26d025a-4257-8698-44e8-f0c4287da99f@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573039409;
 bh=CEr0Lpo/Khte8y5fgvyQ9865NkNXCd229RjFicCs/Do=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=zKajfdeVdRJz1gdRYNR4lPp23xEQj+DshEZ/ctbtHsSriwJz91gMc0LtUojwaHdEO
 1juj/FgfvZ4pBo+AnzUGij1j7oXvU0kFA+Sv2tWuzDrBKyq5UY+AFnluy4DBj9NXA4
 Tr/H9v+QnwySYpAcjKp8fWALieOLC7WqiENV9vYg=
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTAvMjAxOSAxMjoyNSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gSGkgQW5kcnplaiwK
PiAKPiBPbiAxMC8xMC8yMDE5IDEyOjE5LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBPbiAyNC4w
OS4yMDE5IDE1OjE3LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPj4+IG1heF90dV9zeW1ib2wgd2Fz
IHByb2dyYW1tZWQgdG8gVFVfU0laRV9SRUNPTU1FTkRFRCAtIDEsIHdoaWNoIGlzIG5vdAo+Pj4g
d2hhdCB0aGUgc3BlYyBzYXlzLiBUaGUgc3BlYyBzYXlzOgo+Pj4KPj4+IHJvdW5kdXAgKChpbnB1
dCBhY3RpdmUgdmlkZW8gYmFuZHdpZHRoIGluIGJ5dGVzL291dHB1dCBhY3RpdmUgdmlkZW8KPj4+
IGJhbmR3aWR0aCBpbiBieXRlcykgKiB0dV9zaXplKQo+Pj4KPj4+IEl0IGlzIG5vdCBxdWl0ZSBj
bGVhciB3aGF0IHRoZSBhYm92ZSBtZWFucywgYnV0IGNhbGN1bGF0aW5nCj4+PiBtYXhfdHVfc3lt
Ym9sID0gKGlucHV0IEJwcyAvIG91dHB1dCBCcHMpICogdHVfc2l6ZSBzZWVtcyB0byB3b3JrIGFu
ZAo+Pj4gZml4ZXMgdGhlIGlzc3VlcyBzZWVuLgo+Pj4KPj4+IFRoaXMgZml4ZXMgYXJ0aWZhY3Rz
IGluIHNvbWUgdmlkZW9tb2RlcyAoZS5nLiAxMDI0eDc2OEA2MCBvbiAyLWxhbmVzICYKPj4+IDEu
NjJHYnBzIHdhcyBwcmV0dHkgYmFkIGZvciBtZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4KPj4KPj4gUXVldWVkIHRvIGZp
eGVzLgo+IAo+IElmIHlvdSBkaWRuJ3QgcHVzaCB0aGlzIHlldCwgY2FuIHlvdSBkcm9wIGl0IGZv
ciBub3c/IFRoaXMgd29ya3MgZm9yIGFsbCAKPiB0aGUgdmlkZW8gbW9kZXMgSSBoYXZlIHRlc3Rl
ZCwgYnV0IGFzIEkgbWVudGlvbiBhYm92ZSwgdGhlIGNhbGN1bGF0aW9uIAo+IGlzIHJlYWxseSBu
b3QgcXVpdGUgY2xlYXIgdG8gbWUuCj4gCj4gSSd2ZSBzZW50IHF1ZXJpZXMgdG8gVG9zaGliYSBh
Ym91dCBob3cgdG8gY2FsY3VsYXRlIHRoaXMsIGFuZCBJJ20gaG9waW5nIAo+IHRvIGdldCBhIHJl
cGx5IHNvb24uCj4gCj4gSWYgeW91IGRpZCBwdXNoIGl0IGFscmVhZHksIHRoYXQncyBmaW5lIHRv
bywgYXMgaXQgZG9lcyBpbXByb3ZlIHRoaW5ncy4KSnVzdCBmb3IgdGhlIHJlY29yZCwgZ290IGEg
cmVwbHkgZnJvbSBUb3NoaWJhLCBhbmQgdGhlIHBhdGNoIGlzIGNvcnJlY3QuCgogIFRvbWkKCi0t
IApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBI
ZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21p
Y2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
