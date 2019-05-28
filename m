Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A012C52D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 13:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2659E88EF0;
	Tue, 28 May 2019 11:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7488EF0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 11:12:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SBBrF8071878;
 Tue, 28 May 2019 06:11:53 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SBBr2P112080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 06:11:53 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 06:11:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 06:11:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SBBoLo088964;
 Tue, 28 May 2019 06:11:50 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>, <linux-omap@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <af325707-3e42-493d-e858-77878ef06138@ti.com>
Date: Tue, 28 May 2019 14:11:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510194229.20628-1-aford173@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559041913;
 bh=XbgikyC9otiR4YuTt/uxocCuXVecKc1fGa0PD78NL7o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VPQcS2VMgEKOda7JpQv+0emh77HzV9Whuj3flfgsA+DAQrZa01jON9U3tCmf2khOg
 fuw5K1DoHnhNWdOzur4PZNOJX0q0cdLT/bK5zsw6KnctJ5aFcCtwqMPk6Qb1AC39zI
 lI9LCTS6Hi/6C3uZNTUIZsvumuuOlaTDghM/tqgQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, adam.ford@logicpd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMC8wNS8yMDE5IDIyOjQyLCBBZGFtIEZvcmQgd3JvdGU6Cj4gQ3VycmVudGx5IHRo
ZSBzb3VyY2UgY29kZSBpcyBjb21waWxlZCB1c2luZyBoYXJkLWNvZGVkIHZhbHVlcwo+IGZyb20g
Q09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0suICBUaGlzIHBhdGNoIGFsbG93cyB0aGlz
Cj4gY2xvY2sgZGl2aWRlciB2YWx1ZSB0byBiZSBtb3ZlZCB0byB0aGUgZGV2aWNlIHRyZWUgYW5k
IGJlIGNoYW5nZWQKPiB3aXRob3V0IGhhdmluZyB0byByZWNvbXBpbGUgdGhlIGtlcm5lbC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KCkkgdW5kZXJz
dGFuZCB3aHkgeW91IHdhbnQgdG8gZG8gdGhpcywgYnV0IEknbSBub3Qgc3VyZSBpdCdzIGEgZ29v
ZCBpZGVhLiAKSXQncyByZWFsbHkgc29tZXRoaW5nIHRoZSBkcml2ZXIgc2hvdWxkIGZpZ3VyZSBv
dXQsIGFuZCBpZiB3ZSBhZGQgaXQgdG8gCnRoZSBEVCwgaXQgZWZmZWN0aXZlbHkgYmVjb21lcyBh
biBBQkkuCgpUaGF0IHNhaWQuLi4gSSdtIG5vdCBzdXJlIGhvdyBnb29kIG9mIGEgam9iIHRoZSBk
cml2ZXIgY291bGQgZXZlciBkbywgYXMgCml0IGNhbid0IGtub3cgdGhlIGZ1dHVyZSBzY2FsaW5n
IG5lZWRzIG9mIHRoZSB1c2Vyc3BhY2UgYXQgdGhlIHRpbWUgaXQgCmlzIGNvbmZpZ3VyaW5nIHRo
ZSBjbG9jay4gQW5kIHNvLCBJJ20gbm90IG5hY2tpbmcgdGhpcyBwYXRjaCwgYnV0IEkgCmRvbid0
IGZlZWwgdmVyeSBnb29kIGFib3V0IHRoaXMgcGF0Y2guLi4KClRoZSBzZXR0aW5nIGFsc28gYWZm
ZWN0cyBhbGwgb3V0cHV0cyAoZXhsdWRpbmcgdmVuYyksIHdoaWNoIG1heSBub3QgYmUgCndoYXQg
dGhlIHVzZXIgd2FudHMuIFRoZW4gYWdhaW4sIEkgdGhpbmsgdGhpcyBzZXR0aW5nIGlzIHJlYWxs
eSBvbmx5IApuZWVkZWQgb24gT01BUDIgJiAzLCB3aGljaCBoYXZlIG9ubHkgYSBzaW5nbGUgb3V0
cHV0LiBCdXQgdGhhdCdzIHRoZSAKc2FtZSB3aXRoIHRoZSBjdXJyZW50IGtjb25maWcgb3B0aW9u
LCBvZiBjb3Vyc2UuCgpTbywgdGhlIGN1cnJlbnQgQ09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BF
Ul9QQ0sgaXMgYW4gdWdseSBoYWNrLCBpbiBteSAKb3BpbmlvbiwgYW5kIG1vdmluZyBpdCB0byBE
VCBtYWtlcyBpdCBhIHdvcnNlIGhhY2sgPSkuIEJ1dCBJIGRvbid0IGhhdmUgCmFueSBnb29kIHN1
Z2dlc3Rpb25zIGVpdGhlci4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
