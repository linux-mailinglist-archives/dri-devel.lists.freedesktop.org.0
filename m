Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A684D12990
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1A8984D;
	Fri,  3 May 2019 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E034B8984D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:11:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x438B0Ti038747;
 Fri, 3 May 2019 03:11:00 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x438B0AK103668
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 03:11:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 03:10:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 03:10:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x438As7e057914;
 Fri, 3 May 2019 03:10:55 -0500
Subject: Re: [PATCHv2 16/22] drm/bridge: tc358767: remove check for video mode
 in link enable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-17-tomi.valkeinen@ti.com>
 <20190420221450.GS4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e022f4ae-0c62-3d4e-f793-c3e53d60109b@ti.com>
Date: Fri, 3 May 2019 11:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420221450.GS4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556871060;
 bh=2B11r51BrNFe7MpjRVst3+OkdR9T+DUsDN3iVywPSvc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pkosFp8ZvzTC7qp2thRK/bT7S2lkaWcWVDuE2qGnB8VZLrQf4zSTQMmvtPYy/5Uh4
 +0ZJLEr+K6wyfcE5KBtFVcKoJHycY44/pGknaKk+HDB9akZyatZAsFrnr7pSI/V48M
 2wEVoBRavhud0vT5lAR8pTk9PQnKrj9QV+Kr4k5o=
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

T24gMjEvMDQvMjAxOSAwMToxNCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0
IDEyOjMxOjQwUE0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiB0Y19tYWluX2xpbmtf
ZW5hYmxlKCkgY2hlY2tzIGlmIHZpZGVvbW9kZSBoYXMgYmVlbiBzZXQsIGFuZCBmYWlscyBpZgo+
PiB0aGVyZSdzIG5vIHZpZGVvbW9kZS4gQXMgdGNfbWFpbl9saW5rX2VuYWJsZSgpIG5vIGxvbmdl
ciBkZXBlbmRzIG9uIHRoZQo+PiB2aWRlb21vZGUsIHdlIGNhbiBkcm9wIHRoZSBjaGVjay4KPiAK
PiBTaG91bGRuJ3QgeW91IG1vdmUgdGhlIGNoZWNrIHRvIHRoZSBzdHJlYW0gZW5hYmxlIGZ1bmN0
aW9uID8gT3IgaWYgaXQncwo+IG5vdCBuZWVkZWQgdGhlcmUsIGV4cGxhaW4gd2h5IGluIHRoZSBj
b21taXQgbWVzc2FnZSA/CgpUcnVlLiBJIGJlbGlldmUgaXQgaXMgbm90IG5lZWRlZC4gSSBkb24n
dCB0aGluayBicmlkZ2VfZW5hYmxlIHNob3VsZCBiZQpjYWxsZWQgYXQgYWxsLCBpZiB0aGVyZSBo
YXMgbm90IGJlZW4gYSBtb2RlIHNldCBiZWZvcmUgaXQuIElmIHRoZXJlJ3Mgbm8KbW9kZSwgYnJp
ZGdlIGVuYWJsZSBwcmVzdW1hYmx5IHdvdWxkIGZhaWwgZm9yIGFueSBicmlkZ2UuLi4KCiBUb21p
CgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
