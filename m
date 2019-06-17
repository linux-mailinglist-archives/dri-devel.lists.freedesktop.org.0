Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F279485BA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02AC89276;
	Mon, 17 Jun 2019 14:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91D89272;
 Mon, 17 Jun 2019 14:41:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 73FDF804A8;
 Mon, 17 Jun 2019 16:41:11 +0200 (CEST)
Date: Mon, 17 Jun 2019 16:41:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/amd/display: include missing linux/delay.h
Message-ID: <20190617144109.GA14528@ravnborg.org>
References: <20190617123915.926526-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617123915.926526-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=5bNecMADuYMHRIO7LrIA:9 a=CjuIK1q_8ugA:10
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
Cc: Eric Yang <eric.yang2@amd.com>, Thomas Lim <Thomas.Lim@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <tony.cheng@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJuZC4KCk9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDAyOjM4OjU1UE0gKzAyMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gU29tZSByYW5kY29uZmlnIGJ1aWxkcyBmYWlsIHRvIGNvbXBpbGUg
dGhlIGRjbjEwIGNvZGUgYmVjYXVzZSBvZgo+IGEgbWlzc2luZyBkZWNsYXJhdGlvbjoKPiAKPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jOiBJbiBmdW5jdGlvbiAnZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNlJzoKPiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jOjIzNzg6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
ICd1ZGVsYXknIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+IAo+IElu
Y2x1ZGUgdGhlIGFwcHJvcHJpYXRlIGtlcm5lbCBoZWFkZXIuCj4gCj4gRml4ZXM6IDllZDQzZWY4
NGQ5ZCAoImRybS9hbWQvZGlzcGxheTogQWRkIFVuZGVyZmxvdyBBc3NlcnRzIHRvIGRjIikKPiBT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
Ywo+IGluZGV4IDFhYzlhNGYwMzk5MC4uZDg3ZGRjN2RlOWM2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYwo+IEBAIC0yMiw2ICsyMiw3IEBACj4gICAqIEF1dGhvcnM6IEFNRAo+ICAgKgo+ICAgKi8K
PiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gIAo+ICAjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4KPiAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCgpTb21ldGhpbmcgaGFzIGdvbmUgd3Jvbmcg
aGVyZSwgYXMgeW91IGFkZCBhIHNlY29uZCBpbmNsdWRlIG9mIGxpbnV4L2RlbGF5LmguCgpXZSBo
YWQgdGhpcyBwcm9ibGVtIGJlZm9yZSwgd2hpY2ggQWxleCBmaXhlZCBieSBhcHBseWluZyBhIHBh
dGNoIHRvCmluY2x1ZGUgbGludXgvZGVsYXkuaAoKCglTYW0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
