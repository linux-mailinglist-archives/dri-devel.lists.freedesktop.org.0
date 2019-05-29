Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EC2D91C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDF089F71;
	Wed, 29 May 2019 09:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176D989F71
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:32:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4T9Wnxm013499;
 Wed, 29 May 2019 04:32:49 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4T9Wn1t074537
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 May 2019 04:32:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 04:32:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 04:32:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4T9Wkn5043713;
 Wed, 29 May 2019 04:32:46 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <0f124d61-b2ed-2b7f-f63a-0b478473c8fd@ti.com>
Date: Wed, 29 May 2019 12:33:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c2eaee25-a0d3-2632-fdea-3a81ac7085af@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559122369;
 bh=2CV8kVGEL0DMRiySLsnj3/iJiNMR+R8ZgD7i62w7GMA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dNt+pk8f/F0CeV2V0M1owj47aWo7uhBpsHFxJ+wZmllgADPY9uTdoLqiVILdgYdcy
 PYqSduIK6wqutKVyYF9FI/tZcc2VMdPGSLXOHeCQziQuyY55QM5z9UoMha/UcuX+J/
 yhuasD8cnxZ5scS9dhXv2BFnZYyl7Q0xCkwe97ag=
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyOC8wNS8yMDE5IDEzLjMyLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAyOC8wNS8y
MDE5IDEzOjE4LCBUb255IExpbmRncmVuIHdyb3RlOgo+PiBTdHJhbmdlIHRoYXQgdGhpcyBpcyBu
b3QgYWZmZWN0aW5nIG90aGVyIHgxNT8gSSB0aGluayB0aW1lcjEyIHdvdWxkCj4+IGJlIGJsb2Nr
ZWQgb24gSFMgZGV2aWNlcyB0aG91Z2g/Cj4gCj4gSSBkb24ndCBrbm93Li4uIEkgY2FuJ3QgYmVs
aWV2ZSBteSB4MTUgd291bGQgYmUgdW5pcXVlID0pLiBDYW4gaXQgYmUKPiBzb21ldGhpbmcgaW4g
dGhlIGtlcm5lbCBjb25maWc/IHUtYm9vdD8KPiAKPiBQZXRlciBzaG91bGQgaGF2ZSB0aGUgc2Ft
ZSBBMy4gUGV0ZXIsIGNhbiB5b3UgdHJ5IHdpdGggbXkgY29uZmlnPwoKSXQgZGlkIG5vdCBib290
IHdpdGggeW91ciBjb25maWcuCk15IGNvbmZpZyBib290cywgSSdtIHVzaW5nIFNMVUIuCkZsaXBw
aW5nIENPTkZJR19TTFVCX0RFQlVHX09OIHRvIHkgYW5kIHRoZSBrZXJuZWwgZG9lcyBub3QgYm9v
dC4KCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
