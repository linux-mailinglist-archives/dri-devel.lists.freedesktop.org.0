Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED2A5602
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1389B51;
	Mon,  2 Sep 2019 12:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8301E89BA3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:29:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 05:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; d="scan'208";a="176308892"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 02 Sep 2019 05:28:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2019 15:28:58 +0300
Date: Mon, 2 Sep 2019 15:28:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20190902122858.GU7482@intel.com>
References: <20190831172546.GA1972@raspberrypi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190831172546.GA1972@raspberrypi>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMzEsIDIwMTkgYXQgMDY6MjU6NDZQTSArMDEwMCwgU2lkb25nIFlhbmcgd3Jv
dGU6Cj4gVXNlIGFscGhhIHZhbHVlIHRvIGJsZW5kIHNvdXJjZSB2YWx1ZSBhbmQgZGVzdGluYXRp
b24gdmFsdWUgSW5zdGVhZCBvZgo+IGp1c3Qgb3ZlcndyaXRlIHdpdGggc291cmNlIHZhbHVlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNpZG9uZyBZYW5nIDxyZWFsd2Fra2FAZ21haWwuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgfCAxMyArKysrKysrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKPiBpbmRleCBkNTU4NTY5NWM2NGQu
LmI3NzYxODVlNWNiNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Nv
bXBvc2VyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKPiBA
QCAtNzUsNiArNzUsOSBAQCBzdGF0aWMgdm9pZCBibGVuZCh2b2lkICp2YWRkcl9kc3QsIHZvaWQg
KnZhZGRyX3NyYywKPiAgCWludCB5X2xpbWl0ID0geV9zcmMgKyBoX2RzdDsKPiAgCWludCB4X2xp
bWl0ID0geF9zcmMgKyB3X2RzdDsKPiAgCj4gKwl1OCAqc3JjLCAqZHN0Owo+ICsJdTMyIGFscGhh
LCBpbnZfYWxwaGE7CgpUaGVzZSBjb3VsZCBhbGwgbGl2ZSBpbiBhIHRpZ2h0ZXIgc2NvcGUuCgpB
cGFydCBmcm9tIHRoYXQgbGd0bQpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gKwo+ICAJZm9yIChpID0geV9zcmMsIGlfZHN0ID0g
eV9kc3Q7IGkgPCB5X2xpbWl0OyArK2kpIHsKPiAgCQlmb3IgKGogPSB4X3NyYywgal9kc3QgPSB4
X2RzdDsgaiA8IHhfbGltaXQ7ICsraikgewo+ICAJCQlvZmZzZXRfZHN0ID0gZGVzdF9jb21wb3Nl
ci0+b2Zmc2V0Cj4gQEAgLTg0LDggKzg3LDE0IEBAIHN0YXRpYyB2b2lkIGJsZW5kKHZvaWQgKnZh
ZGRyX2RzdCwgdm9pZCAqdmFkZHJfc3JjLAo+ICAJCQkJICAgICArIChpICogc3JjX2NvbXBvc2Vy
LT5waXRjaCkKPiAgCQkJCSAgICAgKyAoaiAqIHNyY19jb21wb3Nlci0+Y3BwKTsKPiAgCj4gLQkJ
CW1lbWNweSh2YWRkcl9kc3QgKyBvZmZzZXRfZHN0LAo+IC0JCQkgICAgICAgdmFkZHJfc3JjICsg
b2Zmc2V0X3NyYywgc2l6ZW9mKHUzMikpOwo+ICsJCQlzcmMgPSB2YWRkcl9zcmMgKyBvZmZzZXRf
c3JjOwo+ICsJCQlkc3QgPSB2YWRkcl9kc3QgKyBvZmZzZXRfZHN0Owo+ICsJCQlhbHBoYSA9IHNy
Y1szXSArIDE7Cj4gKwkJCWludl9hbHBoYSA9IDI1NiAtIHNyY1szXTsKPiArCQkJZHN0WzBdID0g
KGFscGhhICogc3JjWzBdICsgaW52X2FscGhhICogZHN0WzBdKSA+PiA4Owo+ICsJCQlkc3RbMV0g
PSAoYWxwaGEgKiBzcmNbMV0gKyBpbnZfYWxwaGEgKiBkc3RbMV0pID4+IDg7Cj4gKwkJCWRzdFsy
XSA9IChhbHBoYSAqIHNyY1syXSArIGludl9hbHBoYSAqIGRzdFsyXSkgPj4gODsKPiArCQkJZHN0
WzNdID0gMHhmZjsKPiAgCQl9Cj4gIAkJaV9kc3QrKzsKPiAgCX0KPiAtLSAKPiAyLjIwLjEKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
