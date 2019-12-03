Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB891103DF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC28E6E871;
	Tue,  3 Dec 2019 17:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBC56E871
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:55:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 297C080532;
 Tue,  3 Dec 2019 18:55:06 +0100 (CET)
Date: Tue, 3 Dec 2019 18:55:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: rpi: Drop unused GPIO includes
Message-ID: <20191203175504.GA25327@ravnborg.org>
References: <20191203152655.159281-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203152655.159281-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=-VAfIpHNAAAA:8
 a=KKAkSRfTAAAA:8 a=9yiaPes8zJkGT_LvJEsA:9 a=CjuIK1q_8ugA:10
 a=srlwD-8ojaedGGhPAyx8:22 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMuCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNDoyNjo1NVBNICswMTAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IFRoZSBScGkgcGFuZWwgZHJpdmVyIGRvZXNuJ3QgdXNlIGFueSBz
eW1ib2xzIGZyb20gdGhlc2UKPiBHUElPIGluY2x1ZGVzIHNvIGp1c3QgZHJvcCB0aGVtLgo+IAo+
IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMgfCAyIC0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCj4gaW5kZXggMDk4MjRlOTJm
Yzc4Li5hZGYyZGFjZTk2ZTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwo+IEBAIC00NCw4ICs0NCw2IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9mYi5oPgo+IC0jaW5jbHVkZSA8bGludXgvZ3Bpby5oPgo+IC0jaW5jbHVk
ZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+CgpPYnZpb3Vz
bHkgY29ycmVjdCAtIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCBhbmQgcHVzaGVkIG91dC4KCglT
YW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
