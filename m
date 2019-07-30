Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6CC7A14A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 08:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E8E89B29;
	Tue, 30 Jul 2019 06:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7489B29
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 06:28:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6U6SnuI045723;
 Tue, 30 Jul 2019 01:28:49 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6U6SnVP081171
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jul 2019 01:28:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 01:28:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 01:28:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6U6Sk8j101709;
 Tue, 30 Jul 2019 01:28:46 -0500
Subject: Re: [PATCH] gpu: drm/tilcdc: Fix switch case fallthrough
To: Keerthy <j-keerthy@ti.com>, <jsarha@ti.com>
References: <20190717050946.18488-1-j-keerthy@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f378f2dc-6a74-35cc-a380-2eba0ebcf004@ti.com>
Date: Tue, 30 Jul 2019 09:28:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717050946.18488-1-j-keerthy@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564468129;
 bh=PLsC8/r/ZZEgAbNdLAv4EtCcWJ7e6fBvFcibZ2kPfTU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PpasndDWg0rr4B2SEIKXGNzQlkWnHMz6YikArudSUz1MLjK9tKRJqN1684l5tyTs0
 h9OAn2SGkrP97ZFZ3EFtMe0uyldYBuUZJqPA00Gmy7i/wJ6x8xz0+4/brmOAb30agC
 L6i0VXr89Gzke4aBF5+47UxqnkIZIglziteZp//c=
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
Cc: airlied@linux.ie, t-kristo@ti.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDcvMjAxOSAwODowOSwgS2VlcnRoeSB3cm90ZToKPiBGaXggdGhlIGJlbG93IGJ1aWxk
IHdhcm5pbmcvRXJyb3IKPiAKPiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmM6
IEluIGZ1bmN0aW9uIOKAmHRpbGNkY19jcnRjX3NldF9tb2Rl4oCZOgo+IGRyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX2NydGMuYzozODQ6ODogZXJyb3I6IHRoaXMgc3RhdGVtZW50IG1heSBm
YWxsCj4gdGhyb3VnaCBbLVdlcnJvcj1pbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgICByZWcg
fD0gTENEQ19WMl9URlRfMjRCUFBfVU5QQUNLOwo+ICAgICAgfn5+fl5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLmM6Mzg2OjM6IG5vdGU6
IGhlcmUKPiAgICAgY2FzZSBEUk1fRk9STUFUX0JHUjg4ODoKPiAgICAgXn5+fgo+IGNjMTogYWxs
IHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gbWFrZVs1XTogKioqIFtkcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY19jcnRjLm9dIEVycm9yIDEKPiBtYWtlWzRdOiAqKiogW2Ry
aXZlcnMvZ3B1L2RybS90aWxjZGNdIEVycm9yIDIKPiBtYWtlWzRdOiAqKiogV2FpdGluZyBmb3Ig
dW5maW5pc2hlZCBqb2JzLi4uLgo+IAo+IEZpeGVzOiBmNjM4MmYxODZkMjk4Mjc1MCAoImRybS90
aWxjZGM6IEFkZCB0aWxjZGNfY3J0Y19tb2RlX3NldF9ub2ZiKCkiKQo+IFNpZ25lZC1vZmYtYnk6
IEtlZXJ0aHkgPGota2VlcnRoeUB0aS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdGls
Y2RjL3RpbGNkY19jcnRjLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
