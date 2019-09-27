Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E53C0077
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9996EE98;
	Fri, 27 Sep 2019 07:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D166EE98
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 07:55:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R7tHv2065733;
 Fri, 27 Sep 2019 02:55:17 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R7tHgD077317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Sep 2019 02:55:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 02:55:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 02:55:09 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R7tE5K122558;
 Fri, 27 Sep 2019 02:55:14 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>, Tero
 Kristo <t-kristo@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
Date: Fri, 27 Sep 2019 10:55:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569570917;
 bh=tRDmuFTcml9/vkcUAcgHfVDQw97SRNjv+W5LESjr7XI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=huDKGiiTuQoxMrSKLQ4HaZZ0bHxCorwA5fVfKJKSbv4nwI4rPsuKgRB4f+rS0wWTV
 qZEAZeYx7sUl0PlkbiZwlmuBI8cWIH/o7zEJQFcDZbSibeUbJH0HzX4AUhMKoy1GRd
 LZeuRRobiubmw8KKEE2V9ZkUv1I6R8kLV7AthT/M=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KGRyb3BwaW5nIGZvbGtzIHdobydyZSBwcm9iYWJseSBub3QgaW50ZXJlc3RlZC4uLikKCk9uIDI2
LzA5LzIwMTkgMTc6MTIsIEFkYW0gRm9yZCB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBh
dCAxOjU1IEFNIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAyNS8wOS8yMDE5IDIzOjUxLCBBZGFtIEZvcmQgd3JvdGU6Cj4+Cj4+Pj4gSGFzIGFu
eW9uZSBkZWJ1Z2dlZCB3aHkgdGhlIGhhbmcgaXMgaGFwcGVuaW5nPwo+Pj4gSSBzdGFydGVkIHRv
IGRlYnVnIHRoaXMsIGJ1dCBJIGdvdCBkaXN0cmFjdGVkIHdoZW4gSSBub3RpY2VkIHRoZSBMQ0QK
Pj4+IGRpZCd0IHdvcmsgYXQgYWxsIG9uIG1vZGVybiBrZXJuZWxzLiAgSSBoYXZlIHRoYXQgZml4
ZWQgbm93LCBzbyBJIGNhbgo+Pj4gZ28gYmFjayB0byBpbnZlc3RpZ2F0aW5nIHRoaXMuCgpJIGRv
bnQnIGhhdmUgdGhlIHNhbWUgYm9hcmQsIGJ1dCBJIHdhcyB0ZXN0aW5nIHdpdGggb21hcDMgYmVh
Z2xlIHhtLiBJIApjYW4gcmVwcm9kdWNlIHJhdGhlciBzaW1pbGFyIGlzc3VlLCBhbHRob3VnaCBJ
IGRvbid0IGdldCBhIGhhbmcgYnV0IAppbnN0ZWFkIHN5bmMgbG9zdCBhbmQgdW5kZXJmbG93IGZs
b29kICh3aGljaCBtYWtlcyB0aGUgZGV2aWNlIHVudXNhYmxlKS4KCkl0IGxvb2tzIGxpa2UgYSBi
dWcgaW4gb21hcCBjbG9jayBoYW5kbGluZy4KCkRTUyB1c2VzIGRzczFfYWx3b25fZmNrXzM0MzBl
czIgYXMgZmNsay4gZHNzMV9hbHdvbl9mY2tfMzQzMGVzMiBjb21lcyAKZnJvbSBkcGxsNF9jaywg
YW5kIHRoZXJlJ3MgYSBkaXZpZGVyIGFmdGVyIHRoZSBQTEwsIGRwbGw0X200X2NrLgoKV2hlbiB0
aGUgRFNTIGRyaXZlciBzZXRzIGRzczFfYWx3b25fZmNrXzM0MzBlczIgcmF0ZSB0byAyNzAwMDAw
MCBvciAKMjc4NzA5NjcsIHdoaWNoIGNhbiBiZSBjcmVhdGVkIHdpdGggbTQgZGl2aWRlcnMgMzIg
YW5kIDMxLCBpdCBsb29rcyBsaWtlIAp0aGUgZGl2aWRlciBnb2VzIHRvIGJ5cGFzcywgb3IgdG8g
YSB2ZXJ5IHNtYWxsIHZhbHVlLiBEU1MgZ2V0cyBhIHZlcnkgCmhpZ2ggY2xvY2sgcmF0ZSBhbmQg
YnJlYWtzIGRvd24uCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQ
b3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2
MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
