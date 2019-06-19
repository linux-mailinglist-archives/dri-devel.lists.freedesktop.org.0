Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F34B529
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6BA6E33F;
	Wed, 19 Jun 2019 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5DE6E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:44:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 02:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="358562827"
Received: from taniyasi-mobl.ger.corp.intel.com (HELO [10.252.35.15])
 ([10.252.35.15])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jun 2019 02:44:08 -0700
Subject: Re: [PATCH] fbcon: Export fbcon_update_vcs
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20190619081115.27921-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <2849b344-5cdb-a06f-5998-075cf91e15ed@linux.intel.com>
Date: Wed, 19 Jun 2019 11:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619081115.27921-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kbuild test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jingoo Han <jingoohan1@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMTktMDYtMjAxOSBvbSAxMDoxMSBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gSSBmYWlsZWQg
dG8gc3BvdCB0aGlzIHdoaWxlIGNvbXBpbGUtdGVzdGluZy4gT29wcy4KPgo+IFJlcG9ydGVkLWJ5
OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBGaXhlczogOWUxNDY3MDAyNjMw
ICgiZmJjb246IHJlcGxhY2UgRkJfRVZFTlRfTU9ERV9DSEFOR0UvX0FMTCB3aXRoIGRpcmVjdCBj
YWxscyIpCj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBUaG9tcHNv
biA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Cj4gQ2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+IENj
OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IEhhbnMgZGUg
R29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gQ2M6IFlpc2hlbmcgWGllIDx5c3hpZUBmb3ht
YWlsLmNvbT4KPiBDYzogIk1pY2hhxYIgTWlyb3PFgmF3IiA8bWlycS1saW51eEByZXJlLnFtcW0u
cGw+Cj4gQ2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gQ2M6IE1pa3VsYXMgUGF0
b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IENjOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IENjOiBMdWthcyBXdW5uZXIg
PGx1a2FzQHd1bm5lci5kZT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCj4gaW5k
ZXggYjgwNjdlMDdmOGE4Li5jOTIzNWEyZjQyZjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiY29uLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYwo+IEBAIC0zMDM3LDYgKzMwMzcsNyBAQCB2b2lkIGZiY29uX3VwZGF0ZV92Y3Moc3RydWN0
IGZiX2luZm8gKmluZm8sIGJvb2wgYWxsKQo+ICAJZWxzZQo+ICAJCWZiY29uX21vZGVjaGFuZ2Vk
KGluZm8pOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woZmJjb25fdXBkYXRlX3Zjcyk7Cj4gIAo+ICBp
bnQgZmJjb25fbW9kZV9kZWxldGVkKHN0cnVjdCBmYl9pbmZvICppbmZvLAo+ICAJCSAgICAgICBz
dHJ1Y3QgZmJfdmlkZW9tb2RlICptb2RlKQoKVGhhbmtzLCBwdXNoZWQgdG8gdG9waWMgYnJhbmNo
LiA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
