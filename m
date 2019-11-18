Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C529F10061F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 14:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A186E4E3;
	Mon, 18 Nov 2019 13:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169646E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:05:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAID5C0o009396;
 Mon, 18 Nov 2019 07:05:12 -0600
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAID5BWn050438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Nov 2019 07:05:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 07:05:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 07:05:10 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAID58Iv071096;
 Mon, 18 Nov 2019 07:05:08 -0600
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
Date: Mon, 18 Nov 2019 15:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191117024028.2233-12-sebastian.reichel@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574082312;
 bh=DiXAJvtnHh9Q9iCq3goecT4OyreBV/nlqB9jEhvNnQ0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CTjDil/+woArUQE7/nSBmTe7dhsjPufKCiUNwac9o+0T7LOpW98lO4iue9CEXoWsm
 6s2VP8vQ2F3TEscL3rGgYnFdemXkVYcN190hlwqceXiD0zXk/fZfrJxr0b4b9678xf
 R33us4izD9TUhqjkloMqz/XnqkagH3Ycu2xHY/Xo=
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>, "H.
 Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMTEvMjAxOSAwNDozOSwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4gVGhlIHN0YW5k
YXJkIGJpbmRpbmcgZm9yIERTSSByZXF1aXJlcywgdGhhdCB0aGUgY2hhbm5lbCBudW1iZXIKPiBv
ZiB0aGUgcGFuZWwgaXMgZW5jb2RlZCBpbiBEVC4gVGhpcyBhZGRzIHRoZSBjaGFubmVsIG51bWJl
ciBpbgo+IGFsbCBPTUFQMy01IGJvYXJkcywgaW4gcHJlcGFyYXRpb24gZm9yIHVzaW5nIGNvbW1v
biBpbmZyYXN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8
c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtZHNpLWNtLnR4dCAgICAgIHwgNCArKystCj4g
ICBhcmNoL2FybS9ib290L2R0cy9vbWFwMy1uOTUwLmR0cyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDMgKystCj4gICBhcmNoL2FybS9ib290L2R0cy9vbWFwMy5kdHNpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDMgKysrCj4gICBhcmNoL2FybS9ib290L2R0cy9vbWFwNC1k
cm9pZDQteHQ4OTQuZHRzICAgICAgICAgICAgICAgICAgICB8IDMgKystCj4gICBhcmNoL2FybS9i
b290L2R0cy9vbWFwNC1zZHAuZHRzICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysr
Ky0tCj4gICBhcmNoL2FybS9ib290L2R0cy9vbWFwNC5kdHNpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDYgKysrKysrCj4gICBhcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCj4gICA3IGZpbGVzIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpJcyB0aGlzIHJlcXVpcmVkIG9u
bHkgaW4gdGhlIC50eHQsIG9yIGFsc28gYnkgdGhlIGRyaXZlcj8gVGhpcyBkb2VzIApicmVhayBi
YWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggdGhlIGR0YnMsIGFuZCB0aGVyZSdzIGFsd2F5cyBz
b21lb25lIAp3aG8gd29uJ3QgbGlrZSBpdC4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRz
IEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9C
dXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
