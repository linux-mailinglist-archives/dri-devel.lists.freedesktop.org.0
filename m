Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB952C4CA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E652789B55;
	Tue, 28 May 2019 10:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5989B55
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:50:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAo9M5071145;
 Tue, 28 May 2019 05:50:09 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAo9XG043109
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 05:50:09 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:50:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:50:09 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAo5Pl127389;
 Tue, 28 May 2019 05:50:06 -0500
Subject: Re: [PATCH] drm/omap: Make sure device_id tables are NULL terminated
To: Thomas Meyer <thomas@m3y3r.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <1558989631144-20791398-0-diffsplit-thomas@m3y3r.de>
 <1558989631162-1860150863-1-diffsplit-thomas@m3y3r.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7bb26068-36fe-33d2-b374-079cdedab76d@ti.com>
Date: Tue, 28 May 2019 13:50:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558989631162-1860150863-1-diffsplit-thomas@m3y3r.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559040609;
 bh=3KI4TZCi5svmvrs/+WfaxacZZlvuTjo1DGtT0rt3dWA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=jKZXaT5vjwf3nk0m/96lzgkrJiflhp3wRwspDaqU2XvZVmj+06hjp/D/7qSOxA4fh
 Sr/q/h5y1kp62fONWkVhpP0HakggdKA5c7ztnHyAg9UV1BJ4opX9qMvGya2Xtv1Nt3
 1O38sDyVizyeYv7Q5gxjnv+cYJic/w/03BzKfr4w=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDUvMjAxOSAyMzo0MSwgVGhvbWFzIE1leWVyIHdyb3RlOgo+IE1ha2Ugc3VyZSAob2Yv
aTJjL3BsYXRmb3JtKV9kZXZpY2VfaWQgdGFibGVzIGFyZSBOVUxMIHRlcm1pbmF0ZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIE1leWVyIDx0aG9tYXNAbTN5M3IuZGU+Cj4gLS0tCj4gCj4g
ZGlmZiAtdSAtcCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5p
dC5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MtYm9vdC1pbml0LmMKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy1ib290LWluaXQuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLWJvb3QtaW5pdC5jCj4gQEAg
LTE5OCw2ICsxOTgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvbWFwZHNz
Cj4gICAJeyAuY29tcGF0aWJsZSA9ICJ0b3Bwb2x5LHRkMDI4dHRlYzEiIH0sCj4gICAJeyAuY29t
cGF0aWJsZSA9ICJ0cG8sdGQwMjh0dGVjMSIgfSwKPiAgIAl7IC5jb21wYXRpYmxlID0gInRwbyx0
ZDA0M210ZWExIiB9LAo+ICsJe30sCj4gICB9Owo+ICAgCj4gICBzdGF0aWMgaW50IF9faW5pdCBv
bWFwZHNzX2Jvb3RfaW5pdCh2b2lkKQo+IAoKVGhhbmtzISBJJ3ZlIHBpY2tlZCB0aGlzIHVwLgoK
ICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAy
MiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlw
YWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
