Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4C11734D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 19:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750096E138;
	Mon,  9 Dec 2019 18:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748EE6E138
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 18:00:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 975532006E;
 Mon,  9 Dec 2019 19:00:37 +0100 (CET)
Date: Mon, 9 Dec 2019 19:00:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20191209180035.GA14817@ravnborg.org>
References: <20191119231309.18295-1-robh@kernel.org>
 <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
 <20191204201452.GA30193@ravnborg.org>
 <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=_nXCi8Np0ha-vpYLopoA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLgoKPiAKPiBZZXMuIFRoZSBpc3N1ZSB3b3VsZCBiZSBlbmZvcmNpbmcgdGhlIGJpZyBk
aXNjbGFpbWVyIG9mICJEbyBub3QgYWRkCj4geW91ciBwYW5lbCBoZXJlIHVubGVzcyBpdCBoYXMg
YSBzaW5nbGUgcG93ZXIgcmFpbC4iIChBbmQgYW55dGhpbmcgZWxzZQo+IHdlIHRoaW5rIG9mKS4g
QmV0d2VlbiBhIHNpbmdsZSBsaW5lIGFkZCB2cy4gYSB3aG9sZSBuZXcgZG9jLCB5b3Uga25vdwo+
IHdoYXQgcGVvcGxlIHdpbGwgcGljay4gSSBndWVzcyBwYW5lbHMgY291bGQgc3RpbGwgYmUgbW92
ZWQgb3V0IG9mIHRoZQo+IGNvbW1vbiBkb2MgbGF0ZXIgb24uIFdlJ2QgYWxzbyBoYXZlIHRvIGJl
IGZpZ2h0aW5nIG9mZiB0aGUgImxldCBtZSBhZGQKPiBqdXN0IG9uZSBuZXcgcHJvcGVydHkgZm9y
IG15IHBhbmVsIi4KCklmIHRoZSBwYW5lbCBjYW5ub3QgYmUgc3VwcG9ydGVkIGJ5IHRoZSBwYW5l
bC1zaW1wbGUgZHJpdmVyIHRoZW4KdGhpcyBpcyBhIGdvb2Qgc2lnbiB0aGF0IGl0IGRvZXMgbm90
IGJlbG9uZyBpbiB0aGUgYmluZGluZ3MgZmlsZS4KT3Igc29tZXRoaW5nIGxpa2UgdGhpcy4KCkkg
ZG8gbm90IHNlZSBpdCBhcyBhIDE6MSBmb3IgYWxsIHBhbmVscyBidXQgSSBndWVzcyBtb3N0IHBh
bmVscwpzdXBwb3J0ZWQgYnkgcGFuZWwtc2ltcGxlIHdvdWxkIGdvIGluIGEgc2luZ2xlIGJpbmRp
bmdzIGZpbGUuCgo+IFlvdSBkaWQuIEknZCBsaWtlIHRvIGhlYXIgVGhpZXJyeSdzIHRob3VnaHRz
IG9uIHRoaXMgYmVmb3JlIGdvaW5nIGRvd24KPiB0aGlzIHBhdGguClNlY29uZGVkLCBUaGllcnJ5
PwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
