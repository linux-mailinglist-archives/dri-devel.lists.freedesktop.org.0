Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89075C2DAA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B8B6E039;
	Tue,  1 Oct 2019 07:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CD6E039
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 07:04:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9174D94033057;
 Tue, 1 Oct 2019 02:04:13 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9174DH0115081;
 Tue, 1 Oct 2019 02:04:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 02:04:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 02:04:13 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9174Bgw098425;
 Tue, 1 Oct 2019 02:04:12 -0500
Subject: Re: [PATCH v2 05/50] drm/bridge: Extend bridge API to disable
 connector creation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-6-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3ac8ee76-8399-6d60-1db8-05c5763e6f75@ti.com>
Date: Tue, 1 Oct 2019 10:04:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-6-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569913453;
 bh=pwD7bZvWVuzlhZ+ymXBeO8QoDf5uDX2x4yzaS23jHAY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rA0OPV3HIivWRXR1UpcqMCR6n9lOnd44Zs5bLHhvW/Xixe9+LKEZeQZJeR4GR+/H8
 O5/89gVa1p4Y22rSiG9/gIIW5FAZEudiBJDH9gY0qi75hy5zgW9s9Tii/YoE0AjpGr
 J9KUhJN95vxL0Eu1Dg/i6+Cgq1FZX37C8JAPv8Pg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAvMDgvMjAxOSAwNDoxNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKCj4gQEAgLTExMTEs
NyArMTExMyw3IEBAIGludCBkd19taXBpX2RzaV9iaW5kKHN0cnVjdCBkd19taXBpX2RzaSAqZHNp
LCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4gICB7Cj4gICAJaW50IHJldDsKPiAgIAo+
IC0JcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgJmRzaS0+YnJpZGdlLCBOVUxMKTsK
PiArCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwg
dHJ1ZSk7CgpUaGlzIGRvZXNuJ3QgbG9vayBjb3JyZWN0LiBXaGVyZSBkb2VzIHRoZSAidHJ1ZSIg
Y29tZSBmcm9tPwoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
