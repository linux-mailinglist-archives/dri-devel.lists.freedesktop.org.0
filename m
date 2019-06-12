Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FCF4335E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1AA892C2;
	Thu, 13 Jun 2019 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2019 14:22:17 UTC
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B08B895B4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:22:17 +0000 (UTC)
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Ludovic.Desroches@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Ludovic.Desroches@microchip.com";
 x-sender="Ludovic.Desroches@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Ludovic.Desroches@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.63,366,1557212400"; d="scan'208";a="36650836"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jun 2019 07:15:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 07:14:56 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 12 Jun 2019 07:14:56 -0700
Date: Wed, 12 Jun 2019 16:13:56 +0200
From: Ludovic Desroches <ludovic.desroches@microchip.com>
To: Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH][next] video: fbdev: atmel_lcdfb: remove redundant
 initialization to variable ret
Message-ID: <20190612141356.riiesqub4zvxafh3@M43218.corp.atmel.com>
Mail-Followup-To: Nicolas Ferre - M43238 <Nicolas.Ferre@microchip.com>,
 Colin King <colin.king@canonical.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190611170913.20913-1-colin.king@canonical.com>
 <37ac8530-6601-a1a0-37e0-8c6d5d1702cd@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37ac8530-6601-a1a0-37e0-8c6d5d1702cd@microchip.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
X-Mailman-Original-Authentication-Results: esa4.microchip.iphmx.com;
 dkim=none (message not signed)
 header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Colin King <colin.king@canonical.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6NTU6MzBBTSArMDIwMCwgTmljb2xhcyBGZXJyZSAt
IE00MzIzOCB3cm90ZToKPiBPbiAxMS8wNi8yMDE5IGF0IDE5OjA5LCBDb2xpbiBLaW5nIHdyb3Rl
Ogo+ID4gRXh0ZXJuYWwgRS1NYWlsCj4gPiAKPiA+IAo+ID4gRnJvbTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiA+IAo+ID4gQ3VycmVudGx5IHZhcmlhYmxlIHJl
dCBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIC1FTk9FTlQgaG93ZXZlciB0aGF0Cj4gPiB2YWx1
ZSBpcyBuZXZlciByZWFkIGFuZCByZXQgaXMgYmVpbmcgcmUtYXNzaWduZWQgbGF0ZXIgb24uIEhl
bmNlIHRoaXMKPiA+IGFzc2lnbm1lbnQgaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4K
PiA+IAo+ID4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4gPiBTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+IElu
ZGVlZDoKPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAu
Y29tPgoKQWNrZWQtYnk6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNy
b2NoaXAuY29tPiAKClRoYW5rcwoKPiAKPiBUaGFua3MsIGJlc3QgcmVnYXJkcywKPiAgICBOaWNv
bGFzCj4gCj4gCj4gPiAtLS0KPiA+ICAgZHJpdmVycy92aWRlby9mYmRldi9hdG1lbF9sY2RmYi5j
IHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYwo+ID4gaW5kZXggZmIxMTdjY2Jl
YWIzLi45MzBjYzNmOTJlMDEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0
bWVsX2xjZGZiLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYwo+
ID4gQEAgLTk1MCw3ICs5NTAsNyBAQCBzdGF0aWMgaW50IGF0bWVsX2xjZGZiX29mX2luaXQoc3Ry
dWN0IGF0bWVsX2xjZGZiX2luZm8gKnNpbmZvKQo+ID4gICAJc3RydWN0IGZiX3ZpZGVvbW9kZSBm
Yl92bTsKPiA+ICAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwo+ID4gICAJc3RydWN0IHZpZGVv
bW9kZSB2bTsKPiA+IC0JaW50IHJldCA9IC1FTk9FTlQ7Cj4gPiArCWludCByZXQ7Cj4gPiAgIAlp
bnQgaTsKPiA+ICAgCj4gPiAgIAlzaW5mby0+Y29uZmlnID0gKHN0cnVjdCBhdG1lbF9sY2RmYl9j
b25maWcqKQo+ID4gCj4gCj4gCj4gLS0gCj4gTmljb2xhcyBGZXJyZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
