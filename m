Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58491D262F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768A6E19C;
	Thu, 10 Oct 2019 09:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013E16E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:25:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9PKVR117851;
 Thu, 10 Oct 2019 04:25:20 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A9PKSX126191
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 04:25:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:25:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:25:13 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9PF8n109456;
 Thu, 10 Oct 2019 04:25:15 -0500
Subject: Re: [PATCH] drm/bridge: tc358767: fix max_tu_symbol value
To: Andrzej Hajda <a.hajda@samsung.com>, <dri-devel@lists.freedesktop.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>
References: <CGME20190924131723epcas2p27878e7a6c00a7a077260cf0c5cad5b1a@epcas2p2.samsung.com>
 <20190924131702.9988-1-tomi.valkeinen@ti.com>
 <95fb631e-9aff-35d4-a266-f3bc92ea4939@samsung.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a26d025a-4257-8698-44e8-f0c4287da99f@ti.com>
Date: Thu, 10 Oct 2019 12:25:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <95fb631e-9aff-35d4-a266-f3bc92ea4939@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570699520;
 bh=iik1mrDiabWkELlB5u6tf1wRXjFtDX0+hWe7Z+OasGk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=A4llfLVJFuCZS0U9KUCRNnib8uy4aSe9d4+7JbhxTNd1aTeA0/oMG75BvMlnFaWpC
 qLcuxHlF8oc7nVzb/kCTp7/l9eZ1etROixJHEzOiRh3Z6TNQWRFAigFOVs+Emev3Jj
 dbe9UsLBfr1AEZb3WsxgcbzZMfgg39DSumsUCGqs=
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

SGkgQW5kcnplaiwKCk9uIDEwLzEwLzIwMTkgMTI6MTksIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4g
T24gMjQuMDkuMjAxOSAxNToxNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IG1heF90dV9zeW1i
b2wgd2FzIHByb2dyYW1tZWQgdG8gVFVfU0laRV9SRUNPTU1FTkRFRCAtIDEsIHdoaWNoIGlzIG5v
dAo+PiB3aGF0IHRoZSBzcGVjIHNheXMuIFRoZSBzcGVjIHNheXM6Cj4+Cj4+IHJvdW5kdXAgKChp
bnB1dCBhY3RpdmUgdmlkZW8gYmFuZHdpZHRoIGluIGJ5dGVzL291dHB1dCBhY3RpdmUgdmlkZW8K
Pj4gYmFuZHdpZHRoIGluIGJ5dGVzKSAqIHR1X3NpemUpCj4+Cj4+IEl0IGlzIG5vdCBxdWl0ZSBj
bGVhciB3aGF0IHRoZSBhYm92ZSBtZWFucywgYnV0IGNhbGN1bGF0aW5nCj4+IG1heF90dV9zeW1i
b2wgPSAoaW5wdXQgQnBzIC8gb3V0cHV0IEJwcykgKiB0dV9zaXplIHNlZW1zIHRvIHdvcmsgYW5k
Cj4+IGZpeGVzIHRoZSBpc3N1ZXMgc2Vlbi4KPj4KPj4gVGhpcyBmaXhlcyBhcnRpZmFjdHMgaW4g
c29tZSB2aWRlb21vZGVzIChlLmcuIDEwMjR4NzY4QDYwIG9uIDItbGFuZXMgJgo+PiAxLjYyR2Jw
cyB3YXMgcHJldHR5IGJhZCBmb3IgbWUpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IAo+IAo+IFF1ZXVlZCB0byBmaXhlcy4KCklm
IHlvdSBkaWRuJ3QgcHVzaCB0aGlzIHlldCwgY2FuIHlvdSBkcm9wIGl0IGZvciBub3c/IFRoaXMg
d29ya3MgZm9yIGFsbCAKdGhlIHZpZGVvIG1vZGVzIEkgaGF2ZSB0ZXN0ZWQsIGJ1dCBhcyBJIG1l
bnRpb24gYWJvdmUsIHRoZSBjYWxjdWxhdGlvbiAKaXMgcmVhbGx5IG5vdCBxdWl0ZSBjbGVhciB0
byBtZS4KCkkndmUgc2VudCBxdWVyaWVzIHRvIFRvc2hpYmEgYWJvdXQgaG93IHRvIGNhbGN1bGF0
ZSB0aGlzLCBhbmQgSSdtIGhvcGluZyAKdG8gZ2V0IGEgcmVwbHkgc29vbi4KCklmIHlvdSBkaWQg
cHVzaCBpdCBhbHJlYWR5LCB0aGF0J3MgZmluZSB0b28sIGFzIGl0IGRvZXMgaW1wcm92ZSB0aGlu
Z3MuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5r
YXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
