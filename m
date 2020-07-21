Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C9227A04
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D686E506;
	Tue, 21 Jul 2020 08:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56E6E506
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:00:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 002392005C;
 Tue, 21 Jul 2020 10:00:23 +0200 (CEST)
Date: Tue, 21 Jul 2020 10:00:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] video: backlight: cr_bllcd: Remove unused variable
 'intensity'
Message-ID: <20200721080022.GA41608@ravnborg.org>
References: <20200721073919.925935-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073919.925935-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=8YDWVOxWXuGqFK3bR7oA:9
 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLgoKT24gVHVlLCBKdWwgMjEsIDIwMjAgYXQgMDg6Mzk6MTlBTSArMDEwMCwgTGVlIEpv
bmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcga2VybmVsIGJ1aWxkIHdhcm5pbmc6Cj4g
Cj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmM6IEluIGZ1bmN0aW9uIOKAmGNy
X2JhY2tsaWdodF9zZXRfaW50ZW5zaXR54oCZOgo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9j
cl9ibGxjZC5jOjYyOjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhpbnRlbnNpdHnigJkg
Wy1XdW51c2VkLXZhcmlhYmxlXQo+ICA2MiB8IGludCBpbnRlbnNpdHkgPSBiZC0+cHJvcHMuYnJp
Z2h0bmVzczsKPiAgfCBefn5+fn5+fn4KPiAKPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3Jn
Pgo+IENjOiBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KPiBDYzogQmFydGxvbWll
aiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9y
Zwo+IEZpeGVzOiAyNGQzNDYxN2MyNGYgKCJiYWNrbGlnaHQ6IGNyX2JsbGNkOiBJbnRyb2R1Y2Ug
Z3Bpby1iYWNrbGlnaHQgc2VtYW50aWNzIikKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgoKVGhhbmtzIGZvciBmaXhpbmcgdGhpcy4KVGhlIGRyaXZlciBv
bmx5IGJ1aWxkIGZvciBYODYgc28gdGhlIHdhcm5pbmdzIHdhcyBsb3N0IGluIG90aGVyIGJ1aWxk
Cm5vaXNlLgpPbmUgbW9yZSB0aGluZyB0byBpbXByb3ZlIGJlZm9yZSBuZXh0IHN1Ym1pc3Npb24g
LSBzb3JyeSBmb3IgdGhpcy4KClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9jcl9ibGxjZC5jIHwgMSAt
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2NyX2JsbGNkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9j
cl9ibGxjZC5jCj4gaW5kZXggYTI0ZDQyZTFlYTNjZC4uNGFkMGE3MjUzMWZlMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9jcl9ibGxjZC5jCj4gKysrIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvY3JfYmxsY2QuYwo+IEBAIC01OSw3ICs1OSw2IEBAIHN0cnVjdCBjcl9w
YW5lbCB7Cj4gIAo+ICBzdGF0aWMgaW50IGNyX2JhY2tsaWdodF9zZXRfaW50ZW5zaXR5KHN0cnVj
dCBiYWNrbGlnaHRfZGV2aWNlICpiZCkKPiAgewo+IC0JaW50IGludGVuc2l0eSA9IGJkLT5wcm9w
cy5icmlnaHRuZXNzOwo+ICAJdTMyIGFkZHIgPSBncGlvX2JhciArIENSVk1MX1BBTkVMX1BPUlQ7
Cj4gIAl1MzIgY3VyID0gaW5sKGFkZHIpOwo+ICAKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
