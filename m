Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAB8B148
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534766E07B;
	Tue, 13 Aug 2019 07:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB906E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:38:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7cYqR031184;
 Tue, 13 Aug 2019 02:38:34 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7cYUX004934
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:38:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:38:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:38:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7cV7D094797;
 Tue, 13 Aug 2019 02:38:31 -0500
Subject: Re: [PATCH 30/60] drm/omap: dss: Fix output next device lookup in DT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-27-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5cbc8e6c-3abb-0a69-9828-d1ec576494ed@ti.com>
Date: Tue, 13 Aug 2019 10:38:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-27-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565681914;
 bh=TTC4s7tzi0AW2sdfK2jTQTbz0DKPC7DS5HpPlW0x2Ts=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JfkOogOpA1Uh1hMGgV+EPkDgsQK8moki/sHHGoqRkgoi43+X6g3nnkJQUbCYAlwra
 sh2ccPky9ra1INSlkhxP+LPWR3cf50C95yXNIxixY4Y9v3dX66s1dCcL3IhhlUUPu4
 2VpCPruYEDl2qujhaZoYpjiUIiE7FCw2qnaohdms=
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

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgRFNTIGNv
cmUgbG9va3MgdXAgdGhlIG5leHQgZGV2aWNlIGNvbm5lY3RlZCB0byBhbiBvdXRwdXQgYnkKPiB0
cmF2ZXJzaW5nIHRoZSBPRiBncmFwaC4gSXQgY3VycmVudGx5IGhhcmRjb2RlcyB0aGUgbG9jYWwg
cG9ydCBudW1iZXIgdG8KPiAwLCB3aGljaCBicmVha3MgYW55IG91dHB1dCB3aXRoIGEgZGlmZmVy
ZW50IHBvcnQgbnVtYmVyIChTREkgb24gT01BUDMKPiBhbmQgYW55IERQSSBvdXRwdXQgYnV0IHRo
ZSBmaXJzdCBvbmUpLiBGaXggdGhpcyBieSByZXB1cnBvc2luZyB0aGUKPiBjdXJyZW50bHkgdW51
c2VkIG9mX3BvcnRzIGJpdG1hc2sgaW4gb21hcF9kc3NfZGV2aWNlIHdpdGggYW4gb2ZfcG9ydAo+
IG91dHB1dCBwb3J0IG51bWJlciwgYW5kIHVzZSBpdCB0byB0cmF2ZXJzZSB0aGUgT0YgZ3JhcGgu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQ
b3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2
MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
