Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0AE11F1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFC56E94D;
	Wed, 23 Oct 2019 06:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220346E94D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:11:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9N6BGwp032244;
 Wed, 23 Oct 2019 01:11:16 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9N6B7bF091336
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Oct 2019 01:11:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 01:11:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 01:10:59 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9N6B6Gb110743;
 Wed, 23 Oct 2019 01:11:06 -0500
Subject: Re: [PATCH] Revert "drm/omap: add OMAP_BO flags to affect buffer
 allocation"
To: Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>
References: <20191022204733.235801-1-sean@poorly.run>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <27399092-0157-2cad-6958-356186e35b5d@ti.com>
Date: Wed, 23 Oct 2019 09:11:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022204733.235801-1-sean@poorly.run>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571811076;
 bh=ATWPx5AGoE9eb8gWDr/Xj74LlfNSt8+aAxsETh8zjvE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=P2WOv6U26CVree6crQ0fBXZs9LmWqOTQB7oAw1Md0MZhCnWVn8LL3mXUYheyd8Rwu
 aK5XS2GfgJx1wVeUIyfEO3FXyonTWXeCgVHRd2hSr+sRvTr5SBKYF3V3NYOajFWXtu
 KX35Vn615gevazl0wT7XRlD2X6Yir3a4NGCD5KCs=
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
Cc: David Airlie <airlied@linux.ie>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Sean Paul <seanpaul@chromium.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMTAvMjAxOSAyMzo0NywgU2VhbiBQYXVsIHdyb3RlOgo+IEZyb206IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjNiNDgyMjUy
ODM2YWIzYzVlNmIzYjIwZWQzMDM4NDQ5Y2JjNzY3OS4KPiAKPiBUaGlzIHBhdGNoIGRvZXMgbm90
IGhhdmUgYW4gYWNjZXB0YWJsZSBvcGVuIHNvdXJjZSB1c2Vyc3BhY2UKPiBpbXBsZW1lbnRhdGlv
biwgYW5kIGFzIHN1Y2ggaXQgZG9lcyBub3QgbWVldCB0aGUgcmVxdWlyZW1lbnRzIGZvciBhZGRp
bmcKPiBuZXcgVUFQSS4KPiAKPiBEaXNjdXNzaW9uIGlzIGluIHRoZSBMaW5rLgo+IAo+IExpbms6
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU9j
dG9iZXIvMjQwNTg2Lmh0bWwKPiBGaXhlczogMjNiNDgyMjUyODM2ICgiZHJtL29tYXA6IGFkZCBP
TUFQX0JPIGZsYWdzIHRvIGFmZmVjdCBidWZmZXIgYWxsb2NhdGlvbiIpCj4gQ2M6IFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gQ2M6IEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMg
fCA1NCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvdWFwaS9kcm0v
b21hcF9kcm0uaCAgICAgICAgfCAgOSAtLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5k
IE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3Mg
SUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
