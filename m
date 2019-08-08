Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1930186240
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 14:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9AF6E4A7;
	Thu,  8 Aug 2019 12:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40286E4A7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 12:51:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13984CC;
 Thu,  8 Aug 2019 14:51:01 +0200 (CEST)
Date: Thu, 8 Aug 2019 15:50:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] omapdrm: no need to check return value of debugfs_create
 functions
Message-ID: <20190808125053.GJ6055@pendragon.ideasonboard.com>
References: <20190613115749.GC26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613115749.GC26335@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565268661;
 bh=EowOBH/GzOqcer3WQiIG4yaa70k1cxybWZLunYQW4Qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYW5z22B1vlWbI7Wc+U1lTxPaYnuASTWKm6k0Ggxc4+4LrcPPGAvTk1K59GlQrj70
 OAnOOp8chdEZc3ZsxNd6GLT9FAhSB35slgCG4esWVeog2uHBV6H1Bh0hxMMws3AFU1
 3eovhRZzkY6QoY7DvPQWCTApqStRCUWc3+yFXMwg=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 zhong jiang <zhongjiang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBKdW4gMTMsIDIwMTkg
YXQgMDE6NTc6NDlQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IFdoZW4gY2Fs
bGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRo
ZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUg
Y29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9u
IHRoaXMuCj4gCj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVp
Y2hlbEBjb2xsYWJvcmEuY29tPgo+IENjOiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgo+IENj
OiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPgo+IENjOiB6aG9uZyBqaWFuZyA8emhv
bmdqaWFuZ0BodWF3ZWkuY29tPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KClRoaXMgbWFrZXMgc2Vuc2UuCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKVG9taSwgd2lsbCB5b3UgdGFr
ZSB0aGlzIHBhdGNoIGluIHlvdXIgdHJlZSA/Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNzLmMgfCAxMSArKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMK
PiBpbmRleCA1NWU2ODg2M2VmMTUuLjgzYjk3MzgxMzM5NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvZHNzLmMKPiBAQCAtOTM0LDcgKzkzNCw2IEBAIGRzc19kZWJ1Z2ZzX2NyZWF0ZV9maWxl
KHN0cnVjdCBkc3NfZGV2aWNlICpkc3MsIGNvbnN0IGNoYXIgKm5hbWUsCj4gIAkJCXZvaWQgKmRh
dGEpCj4gIHsKPiAgCXN0cnVjdCBkc3NfZGVidWdmc19lbnRyeSAqZW50cnk7Cj4gLQlzdHJ1Y3Qg
ZGVudHJ5ICpkOwo+ICAKPiAgCWVudHJ5ID0ga3phbGxvYyhzaXplb2YoKmVudHJ5KSwgR0ZQX0tF
Uk5FTCk7Cj4gIAlpZiAoIWVudHJ5KQo+IEBAIC05NDIsMTUgKzk0MSw5IEBAIGRzc19kZWJ1Z2Zz
X2NyZWF0ZV9maWxlKHN0cnVjdCBkc3NfZGV2aWNlICpkc3MsIGNvbnN0IGNoYXIgKm5hbWUsCj4g
IAo+ICAJZW50cnktPnNob3dfZm4gPSBzaG93X2ZuOwo+ICAJZW50cnktPmRhdGEgPSBkYXRhOwo+
ICsJZW50cnktPmRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUobmFtZSwgMDQ0NCwgZHNzLT5k
ZWJ1Z2ZzLnJvb3QsCj4gKwkJCQkJICAgIGVudHJ5LCAmZHNzX2RlYnVnX2ZvcHMpOwo+ICAKPiAt
CWQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKG5hbWUsIDA0NDQsIGRzcy0+ZGVidWdmcy5yb290LCBl
bnRyeSwKPiAtCQkJCSZkc3NfZGVidWdfZm9wcyk7Cj4gLQlpZiAoSVNfRVJSKGQpKSB7Cj4gLQkJ
a2ZyZWUoZW50cnkpOwo+IC0JCXJldHVybiBFUlJfQ0FTVChkKTsKPiAtCX0KPiAtCj4gLQllbnRy
eS0+ZGVudHJ5ID0gZDsKPiAgCXJldHVybiBlbnRyeTsKPiAgfQo+ICAKCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
