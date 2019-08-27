Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02909DD7B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 08:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FD289933;
	Tue, 27 Aug 2019 06:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511189933
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 06:16:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R6Gk5T096200;
 Tue, 27 Aug 2019 01:16:46 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R6GkWD071403
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 01:16:46 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 01:16:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 01:16:45 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R6GhB0113419;
 Tue, 27 Aug 2019 01:16:43 -0500
Subject: Re: [PATCH 07/60] drm/bridge: simple-bridge: Add support for the TI
 OP362
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fba61fe8-5526-c773-f5e7-9da3216770ea@ti.com>
Date: Tue, 27 Aug 2019 09:16:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566886606;
 bh=EPfPHlp7be7GiS/X/a+xSi0vVOueYM4gmm5saHJiHPI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CTDynfJP8RCvIBahXc0knwz0KErAAzN+rd/cOj6fRj9tHQFYz2L907JK3BLItVqRP
 3M8scSfYLfVa5gf+/JHX+b2ZP8o4TbYnYtLWejMIrQlii2G2yJq44ncUb5D0AR5rgk
 DL0ClmoxZVrlI1wNyggJnzup5MH7SQn0Of2K9v18=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgVEkgT1Az
NjIgaXMgYW4gYW5hbG9nIHZpZGVvIGFtcGxpZmllciBjb250cm9sbGVkIHRocm91Z2ggYSBHUElP
LiBBZGQKPiBzdXBwb3J0IGZvciBpdCB0byB0aGUgc2ltcGxlLWJyaWRnZSBkcml2ZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdl
LmMgfCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKPiBpbmRleCBhN2VkZjNjMzk2MjcuLjc0
OTViOWJlZjg2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1i
cmlkZ2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCj4g
QEAgLTI5Niw2ICsyOTYsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2lt
cGxlX2JyaWRnZV9tYXRjaFtdID0gewo+ICAgCQkJLnRpbWluZ3MgPSAmZGVmYXVsdF9icmlkZ2Vf
dGltaW5ncywKPiAgIAkJCS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX1ZHQSwKPiAgIAkJfSwK
PiArCX0sIHsKPiArCQkuY29tcGF0aWJsZSA9ICJ0aSxvcGEzNjIiLAo+ICsJCS5kYXRhID0gJihj
b25zdCBzdHJ1Y3Qgc2ltcGxlX2JyaWRnZV9pbmZvKSB7Cj4gKwkJCS50eXBlID0gRFJNX01PREVf
Q09OTkVDVE9SX0NvbXBvc2l0ZSwKPiArCQl9LAoKSSBoYXZlIHRvIHNheSBJJ20gcHJldHR5IGNs
dWVsZXNzIGFib3V0IHRoZSBhbmFsb2cgVFYsIGJ1dCBPTUFQIERTUyAKc3VwcG9ydHMgYWxzbyBz
LXZpZGVvIG91dHB1dHMuIEJ1dCBJIGRvbid0IGtub3cgaWYgT1BBMzYyIGNhbiBiZSB1c2VkIAp3
aXRoIHMtdmlkZW8sIG9yIGRvZXMgaXQgZGljdGF0ZSBjb21wb3NpdGUuCgpJbiBhbnkgY2FzZSwK
ClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKICBU
b21pCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAw
MDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtr
YS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
