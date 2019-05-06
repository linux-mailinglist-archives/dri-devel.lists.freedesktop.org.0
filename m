Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECB147F1
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A1B8982F;
	Mon,  6 May 2019 09:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB4E8982F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:59:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x469xB72025393;
 Mon, 6 May 2019 04:59:11 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x469xAJM119447
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2019 04:59:10 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 04:59:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 04:59:02 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x469wxa6014550;
 Mon, 6 May 2019 04:59:00 -0500
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
 <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
 <20190503124825.GF4912@pendragon.ideasonboard.com>
 <c9de8795-fce6-bf0b-08c6-120537272573@ti.com>
 <20190503171123.GC4903@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3888b097-9357-71e0-d8da-183cc52519ab@ti.com>
Date: Mon, 6 May 2019 12:58:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503171123.GC4903@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1557136751;
 bh=z7qKUal1sbLn0OOje2w8+lZbc52AcyqPxwhCP3tA5ZA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CjWcM5ueNFvBZtfr8uBt5RLkbE6JQUZ7+DGWZqkP9WX5pzgji9K5+Ofh9WdU8Y7/6
 FXEY8cR4ZQc8aO8hfXRqzF5Rl+/KnucXVjYf6rN1/u2bKcczKrDaYd7q74oq62U97M
 /fhbWEIQ3q2O74vIjcDGN9t12ruAQ/kbkdVQRycQ=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwgQW5kcmV5LAoKT24gMDMvMDUvMjAxOSAyMDoxMSwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPj4gSSBhZ3JlZSB0aGF0IGlmIHRoZSBwYW5lbCBBbmRyZXkgbWVudGlvbmVkIGlz
IHN0aWxsIHVzZWQsIHdlIG5lZWQgdG8KPj4gaGFuZGxlIGl0IHNvbWVob3cuIEJ1dCBJIHRoaW5r
IGV4cGxpY2l0bHkgaGFuZGxpbmcgc3VjaCBhIGNhc2UgaXMgYmV0dGVyCj4+IHRoYW4gZ3Vlc3Np
bmcuCj4gCj4gVGhlIHJpc2sgbWF5IG5vdCBiZSB3b3J0aCBpdCwgSSBhZ3JlZS4gSSB3b3VsZCBl
eHBsYWluIHRoaXMgaW4gZGV0YWlscwo+IGluIHRoZSBjb21taXQgbWVzc2FnZSB0aG91Z2gsIGFu
ZCBhZGQgYSBjb21tZW50IHRvIHRoZSBjb2RlIGFzIHdlbGwsIHRvCj4gZWFzZSBmdXR1cmUgZGVi
dWdnaW5nLgoKQW5kcmV5LCBkbyB5b3Ugc3RpbGwgaGF2ZSB0aGUgcGFuZWwgdGhhdCBkb2Vzbid0
IHdvcmsgd2l0aCA4YjEwYj8gSXMgaXQKdXNlZCBpbiByZWFsIGxpZmUgKGkuZS4gaXQgd2FzIG5v
dCBqdXN0IGEgdGVtcG9yYXJ5IGRldmVsb3BtZW50IHBoYXNlCnBhbmVsKT8gV2hhdCdzIHRoZSBt
b2RlbCwgYW5kIGlzIHRoZXJlIGEgcHVibGljIGRhdGFzaGVldD8KCkV2ZXJ5d2hlcmUgSSBsb29r
LCBJIGFsd2F5cyBzZWUgOGIxMGIgYXMgbWFuZGF0b3J5IGZvciBhbGwgRFAgdmVyc2lvbnMKZm9y
IHRoZSBtYWluIGxpbmsuIElmIHRoZSBwYW5lbCBpbiBxdWVzdGlvbiByZXF1aXJlcyA4YjEwYiB0
byBiZQpkaXNhYmxlZCwgSSB3b3VsZCBpbWFnaW5lIHRoYXQgbWVudGlvbmVkIGluIGl0cyBkYXRh
c2hlZXQsIGFzIGl0J3Mga2luZApvZiBhIGJpZyB0aGluZy4gSSB3b3VsZCBndWVzcyB0aGF0IHRo
ZSBwYW5lbCBkb2Vzbid0IHdvcmsgd2l0aCBtYW55IGVEUApzb3VyY2VzLgoKPj4gQW5kIGlzbid0
IHRoaXMgc29tZXRoaW5nIHRoYXQncyBub3QgcmVhbGx5IFRDMzU4NzY3IHNwZWNpZmljPyBJZiB0
aGF0Cj4+IHBhbmVsIGlzIHVzZWQgd2l0aCBvdGhlciBicmlkZ2VzLCB3ZSBuZWVkIHRvIGRlYWwg
d2l0aCB0aGlzIGNhc2Ugd2l0aAo+PiB0aG9zZSBicmlkZ2VzIHRvbz8gT3IgaXMgVEMzNTg3Njcg
dGhlIG9ubHkgYnJpZGdlIHRoYXQgYWxsb3dzIGRpc2FibGluZwo+PiA4YjEwYj8KPiAKPiBJIGRv
bid0IGtub3cgYWJvdXQgb3RoZXIgYnJpZGdlcywgYnV0IEkgdGhpbmsgaXQgd291bGQgbmVlZCB0
byBiZQo+IGhhbmRsZWQgZ2xvYmFsbHksIHllcy4KCk9rLiBUaGlzIGRvZXMgc291bmQgbGlrZSBh
IHJlbGF0aXZlbHkgYmlnIHdvcmssIGFkZGluZyBhIG5ldyBmaWVsZCB0bwpzaW1wbGUgcGFuZWws
IG9yIG1heWJlIGEgbmV3IERUIHByb3BlcnR5IHRvIHRoZSBwYW5lbHMsIGFuZCBtYWtpbmcgdGhl
CmJyaWRnZXMgd29yayB1c2UgdGhhdCBkYXRhIChldmVuIGlmIHdlJ2QgYWRkIHRoZSBzdXBwb3J0
IG9ubHkgdG8KdGMzNTg3NjcgZm9yIG5vdykuCgpJIGRvbid0IHdhbnQgdG8gYnJlYWsgQW5kcmV5
J3MgcGFuZWwsIGJ1dCBJIGhhdmUgdG8gc2F5IEknbSBub3QgdmVyeQplbnRodXNpYXN0aWMgYWJv
dXQgdGhpcyB3b3JrIGVpdGhlciA9KS4KClRoZSBEUCAxLjAgc3BlYyBkb2VzIHNheSB0aGF0IFBS
QlM3IHRlc3QgcGF0dGVybiBpcyBub3QgOGIxMGIgZW5jb2RlZC4gSQp1bmRlcnN0YW5kIHRoaXMg
bWVhbmluZyB0aGF0IDhiMTBiIGlzIG5vdCB1c2VkIGZvciBzb21lIHBhcnRpY3VsYXIKdGVzdHMs
IHdoaWNoIHdvdWxkIGV4cGxhaW4gd2h5IDhiMTBiIGNhbiBiZSB0dXJuZWQgb2ZmIGluIHRjMzU4
NzY3IChhbmQKbWF5YmUgdGhhdCBhbHNvIG1lYW5zIGl0IGNhbiBiZSB0dXJuZWQgb2ZmIGluIGFs
bC9tb3N0IG90aGVyIERQIHNvdXJjZXMpLgoKIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBG
aW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVz
aW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
