Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B741EAD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325F988F93;
	Wed, 12 Jun 2019 08:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0888F93
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:10:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5C8AWQ4094853;
 Wed, 12 Jun 2019 03:10:32 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5C8AWWZ045790
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 03:10:32 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 03:10:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 03:10:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5C8AUIa060789;
 Wed, 12 Jun 2019 03:10:30 -0500
Subject: Re: [GIT PULL] omapdrm changes for 5.3
To: Daniel Vetter <daniel@ffwll.ch>, Sebastian Reichel <sre@kernel.org>
References: <a709f57d-6909-8550-3932-d84e0b5bc3ef@ti.com>
 <20190611113051.GB2458@phenom.ffwll.local>
 <20190611161921.5uoib4vr5gckkdpx@earth.universe>
 <20190611173651.GK2458@phenom.ffwll.local>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <587b5cda-59b0-d5aa-7556-faaee016fa7d@ti.com>
Date: Wed, 12 Jun 2019 11:10:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611173651.GK2458@phenom.ffwll.local>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560327032;
 bh=rInbyCYd8bxDuexysQwnCRy14Cno2/r/foMiskMLQ+E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JBRNJuW7/cXNC0u44/5RSZLOKUIkA0sfGez8XlYZYKczux4Ufzt5VrW48gFD4kb9+
 Gp4er0UBSRksL9vQkQBrHKFNDNWXzro6RV63aqyr/XXRpvqDBqRmId/PLsrpDY92Sq
 duj6faFUhs1bTewyl1vBtUdod7KFf9NFRn1rnh88=
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
Cc: David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMDYvMjAxOSAyMDozNiwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4+Pj4gb21hcGRybSBj
aGFuZ2VzIGZvciA1LjMKPj4+Pgo+Pj4+IC0gQWRkIHN1cHBvcnQgZm9yIERTSSBjb21tYW5kIG1v
ZGUgZGlzcGxheXMKPj4+Cj4+PiBUaGFua3MsIHB1bGxlZC4KPj4KPj4gRmluYWxseSA6KQo+IAo+
IEhtIHdoeT8gUHVsbCBpcyBsZXNzIHRoYW4gYSBkYXkgb2xkLCBhbmQgSSBkaWRuJ3Qgc2VlIGFu
IG9sZGVyIG9uZSB0aGF0Cj4gRGF2ZSBvciBtZSBtaXNzZWQgLi4uCgpUaGF0IHdhcyBkaXJlY3Rl
ZCBhdCBtZSA9KS4KCkkndmUgYmVlbiByZWx1Y3RhbnQgdG8gbWVyZ2UgdGhlIERTSSBjb21tYW5k
IG1vZGUgc3VwcG9ydCwgYXMgaXQncyBiYXNlZCAKb24gdGhlIG9tYXBkcm0gc3BlY2lmaWMgZHJp
dmVyIG1vZGVsLCBpbnN0ZWFkIG9mIGRybSBicmlkZ2VzL3BhbmVscy4gCkVzcGVjaWFsbHkgYXMg
TGF1cmVudCBoYXMgYmVlbiBjcmVhdGluZyBodWdlIHBhdGNoIHNlcmllc2VzIGNvbnZlcnRpbmcg
Cm9tYXBkcm0gdG8gdGhlIGRybSBicmlkZ2UvcGFuZWwgbW9kZWwsIEkndmUgYmVlbiB3b3JyaWVk
IGFib3V0IGNvbmZsaWN0cyAKYW5kIG1ha2luZyBMYXVyZW50J3Mgd29yayBtb3JlIGRpZmZpY3Vs
dC4gU28uLi4gVGhlIERTSSBjb21tYW5kIG1vZGUgCnNlcmllcyBoYXMgYmVlbiBmbG9hdGluZyBh
cm91bmQgZm9yIGEgbG9uZyB0aW1lLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
