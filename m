Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733F7D7B1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 10:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7965D6E3D2;
	Thu,  1 Aug 2019 08:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731166E3D2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 08:33:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x718X7fG098223;
 Thu, 1 Aug 2019 03:33:07 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x718X7k6108535
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 03:33:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 03:33:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 03:33:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x718X6hX038546;
 Thu, 1 Aug 2019 03:33:06 -0500
Subject: Re: [PATCH] drm/omap: Add 'alpha' and 'pixel blend mode' plane
 properties
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
References: <20190711135219.23402-1-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3c606028-4ed2-d97c-cbf3-ce7d1e698d21@ti.com>
Date: Thu, 1 Aug 2019 11:33:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190711135219.23402-1-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564648387;
 bh=UIyFD3CEBcyi2gh/ZMDnZhMVTHUDJPbYvzwmc7DbVZE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ylRXfApxu8i/CJx1bMr1A5CnSGsOFdrrgNDoT6bhWZLT5HNRFtptZ/LUeDF7/ttlY
 Rzv8WoTzpf0ZTMVJUptMRKkxqUe5WwOn1MdZQ5ayVjhTDmbuQkfdrJcc+/qlR03Mrb
 t+afRJur154ATv17b8Ma3oe48bcFp9+FhH7edERY=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMDcvMjAxOSAxNjo1MiwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBBZGQgdGhl
IGZvbGxvd2luZyBwcm9wZXJ0aWVzIGZvciBwbGFuZXM6Cj4gKiBhbHBoYQo+ICogcGl4ZWwgYmxl
bmQgbW9kZS4gT25seSAiUHJlLW11bHRpcGxpZWQiIGFuZCAiQ292ZXJhZ2UiIGFyZSBzdXBwb3J0
ZWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX3BsYW5lLmMgfCA5ICsr
KysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKV29ya3MgZm9yIG1lIGFuZCBsb29rcyBnb29kLiBJJ2xsIHF1ZXVlIHRoaXMuIFRoYW5rcyEK
CiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUg
MjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
