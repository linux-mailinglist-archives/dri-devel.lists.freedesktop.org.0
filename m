Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2585C4AC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D6289C6B;
	Mon,  1 Jul 2019 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D05D88130
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:41:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61Eel75075389;
 Mon, 1 Jul 2019 09:40:47 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61EelNv091078
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 09:40:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 09:40:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 09:40:47 -0500
Received: from [172.24.190.172] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61Eegav086236;
 Mon, 1 Jul 2019 09:40:44 -0500
Subject: Re: [PATCH 00/12] ARM: davinci: da850-evm: remove more legacy GPIO
 calls
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>, David Lechner
 <david@lechnology.com>, Linus Walleij <linus.walleij@linaro.org>
References: <20190625163434.13620-1-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <fe42c0e1-2bfb-2b1c-2c38-0e176e88ec6e@ti.com>
Date: Mon, 1 Jul 2019 20:10:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561992047;
 bh=v09DKmxdyp0eEsvf+kyn4y4hnlTkeSpL6c6F1V4f4FA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oLkEnK10lOzZSr8kWXvyIEzwRTGPy9yC0AqouKKQ5P0FswISZynDNwYfWMhmiESnO
 And5l8d/dgLdTP0j/yDzwkkEYIZZXxsL2/pm9cog/7jNYxFgiEpeHFw0/VSWgS6ceC
 gC3uk1kSLls9pkjZPE1FSx5VuIP5L7DrnYuD+2Ps=
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLCBEYW5pZWwsIEppbmdvbywKCk9uIDI1LzA2LzE5IDEwOjA0IFBNLCBCYXJ0b3N6IEdv
bGFzemV3c2tpIHdyb3RlOgo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gCj4gVGhpcyBpcyBhbm90aGVyIHNtYWxsIHN0ZXAgb24gdGhlIHBh
dGggdG8gbGliZXJhdGluZyBkYXZpbmNpIGZyb20gbGVnYWN5Cj4gR1BJTyBBUEkgY2FsbHMgYW5k
IHNocmlua2luZyB0aGUgZGF2aW5jaSBHUElPIGRyaXZlciBieSBub3QgaGF2aW5nIHRvCj4gc3Vw
cG9ydCB0aGUgYmFzZSBHUElPIG51bWJlciBhbnltb3JlLgo+IAo+IFRoaXMgdGltZSB3ZSdyZSBy
ZW1vdmluZyB0aGUgbGVnYWN5IGNhbGxzIHVzZWQgaW5kaXJlY3RseSBieSB0aGUgTENEQwo+IGZi
ZGV2IGRyaXZlci4KPiAKPiBUaGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyBtb2RpZnkgdGhlIEdQSU8g
YmFja2xpZ2h0IGRyaXZlci4gVGhlIGZpcnN0Cj4gb2YgdGhlbSBhZGRzIHRoZSBuZWNlc3Nhcnkg
ZnVuY3Rpb25hbGl0eSwgdGhlIG90aGVyIHR3byBhcmUganVzdAo+IHR3ZWFrcyBhbmQgY2xlYW51
cHMuCgpDYW4geW91IHRha2UgdGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgZm9yIHY1LjMgLSBpZiBp
dHMgbm90IHRvbyBsYXRlPyBJCnRoaW5rIHRoYXQgd2lsbCBtYWtlIGl0IGVhc3kgZm9yIHJlc3Qg
b2YgcGF0Y2hlcyB0byBtYWtlIGludG8gc3Vic2VxdWVudAprZXJuZWwgcmVsZWFzZXMuCgo+IAo+
IE5leHQgdHdvIHBhdGNoZXMgZW5hYmxlIHRoZSBHUElPIGJhY2tsaWdodCBkcml2ZXIgaW4KPiBk
YXZpbmNpX2FsbF9kZWZjb25maWcuCj4gCj4gUGF0Y2ggNi8xMiBtb2RlbHMgdGhlIGJhY2tsaWdo
dCBHUElPIGFzIGFuIGFjdHVhbCBHUElPIGJhY2tsaWdodCBkZXZpY2UuCj4gCj4gUGF0Y2hlcyA3
LTkgZXh0ZW5kIHRoZSBmYmRldiBkcml2ZXIgd2l0aCByZWd1bGF0b3Igc3VwcG9ydCBhbmQgY29u
dmVydAo+IHRoZSBkYTg1MC1ldm0gYm9hcmQgZmlsZSB0byB1c2luZyBpdC4KPiAKPiBMYXN0IHRo
cmVlIHBhdGNoZXMgYXJlIGltcHJvdmVtZW50cyB0byB0aGUgZGE4eHggZmJkZXYgZHJpdmVyIHNp
bmNlCj4gd2UncmUgYWxyZWFkeSB0b3VjaGluZyBpdCBpbiB0aGlzIHNlcmllcy4KClRoYW5rcywK
U2VraGFyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
