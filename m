Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D202A1D8C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFE76E146;
	Thu, 29 Aug 2019 14:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E416E146
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:47:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-165-17-nat.elisa-mobile.fi
 [85.76.165.17])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA6EA2E5;
 Thu, 29 Aug 2019 16:47:00 +0200 (CEST)
Date: Thu, 29 Aug 2019 17:46:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
Message-ID: <20190829144650.GC5875@pendragon.ideasonboard.com>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
 <1566595809.1871.0@crapouillou.net>
 <20190827050054.GA22071@ravnborg.org>
 <1567073012.1884.1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567073012.1884.1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567090021;
 bh=8YUZiUr5/j0Rj/3ev2NhqX8ZVJe93cPttqYc9NDenNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ja4C7F5Jy8h2kUqrSdzShAooIkRNovzl1t4NRK9HiPYNs03iowOG+iH5dx9XvFMqG
 0NpLDQdIjLQYkTP5lbZ5lPBBBY+Nu7Eu5NzX34V6atmMZB2SCdCS9kyRo/+dgabWb5
 XRZ/+hvjpF0VS7iY/WX6ecQ/JlVgK/a2Zaz2P+lY=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bCwKCk9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDEyOjAzOjMyUE0gKzAyMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gTGUgbWFyLiAyNyBhb8O7dCAyMDE5IMOgIDc6MDAsIFNhbSBSYXZu
Ym9yZyBhIMOpY3JpdCA6Cj4gPiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAxMTozMDowOVBNICsw
MjAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+ID4+ICBMZSB2ZW4uIDIzIGFvw7t0IDIwMTkgw6Ag
MjM6MjMsIExhdXJlbnQgUGluY2hhcnQgYSDDqWNyaXQgOgo+ID4+PiBUaGUgaW5nZW5pYyBkcml2
ZXIgc3VwcG9ydHMgRFBJIHBhbmVscyBvbmx5IGF0IHRoZSBtb21lbnQsIHNvIGhhcmRjb2RlCj4g
Pj4+IHRoZWlyIHR5cGUgdG8gRFBJIGluc3RlYWQgb2YgVW5rbm93bi4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+ID4+PiAtLS0KPiA+Pj4gUGF1bCwgYXMgdGhlIGRyaXZlciBoYXMgYmVlbiBtZXJn
ZWQgaW4gdjUuMy1yYzEsIHRoaXMgaXMgYSBjYW5kaWRhdGUgZm9yCj4gPj4+IGEgdjUuMyBmaXgu
IEtlZXBpbmcgdGhlIGNvbm5lY3RvciB0eXBlIGFzIHVua25vd24gY291bGQgY2F1c2UgYQo+ID4+
PiB1c2Vyc3BhY2UgZGVwZW5kZW5jeSBvbiBpdCwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5nIGNo
YW5nZWQgbGF0ZXIuCj4gPj4gCj4gPj4gIE1ha2VzIHNlbnNlLgo+ID4+IAo+ID4+ICBSZXZpZXdl
ZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiAKPiA+IEluIGFu
b3RoZXIgbWFpbCB3ZSBkaXNjdXNzIENPTk5FQ1RPUl9QQU5FTC4gQnV0IHdlIHNob3VsZCBub3Qg
aG9sZCB1cAo+ID4gZHVlIHRvIHRoaXMuCj4gPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgo+ID4gCj4gPiBQYXVsIC0gd2lsbCB5b3UgYXBwbHkgdG8gZHJtLW1p
c2MtZml4ZXM/Cj4gCj4gSSBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCAoSSBob3BlIHRoYXQncyBP
SyBhbmQgSSBkaWRuJ3Qgc2NyZXcgdXApIGFuZCAKPiBhbHNvIGRybS1taXNjLWZpeGVzLgoKSSAq
dGhpbmsqIHlvdSBvbmx5IG5lZWRlZCB0byBwdXNoIHRvIGRybS1taXNjLWZpeGVzLiBQdXNoaW5n
IHRoZSBzYW1lCnBhdGNoIHRvIGJvdGggd2lsbCBnZW5lcmF0ZSBhIGNvbmZsaWN0IHdoZW4gZHJt
LW1pc2MtbmV4dCBpcyBtZXJnZWQgd2l0aApkcm0tbWlzYy1maXhlcyAod2hpY2ggd2lsbCBoYXBw
ZW4gaW4gbGludXgtbmV4dCBmaXJzdCwgYW5kIHRoZW4gd2hlbgpMaW51cyBtZXJnZXMgdGhlIGRy
bS1taXNjLW5leHQgYnJhbmNoIGludG8gaGlzIHRyZWUgZm9yIHY1LjUpLgoKPiA+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPiA+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4gPj4+IGluZGV4IGNlMWZhZTNhNzhh
OS4uMmUyZWQ2NTNlOWM2IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5p
Yy9pbmdlbmljLWRybS5jCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2Vu
aWMtZHJtLmMKPiA+Pj4gQEAgLTY3NSwxMCArNjc1LDkgQEAgc3RhdGljIGludCBpbmdlbmljX2Ry
bV9wcm9iZShzdHJ1Y3QgCj4gPj4gcGxhdGZvcm1fZGV2aWNlCj4gPj4+ICpwZGV2KQo+ID4+PiAg
CQlyZXR1cm4gcmV0Owo+ID4+PiAgCX0KPiA+Pj4KPiA+Pj4gLQlpZiAocGFuZWwpIHsKPiA+Pj4g
KwlpZiAocGFuZWwpCj4gPj4+ICAJCWJyaWRnZSA9IGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQo
ZGV2LCBwYW5lbCwKPiA+Pj4gLQkJCQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9Vbmtub3duKTsK
PiA+Pj4gLQl9Cj4gPj4+ICsJCQkJCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfRFBJKTsKPiA+Pj4K
PiA+Pj4gIAlwcml2LT5kbWFfaHdkZXNjID0gZG1hX2FsbG9jX2NvaGVyZW50KGRldiwgc2l6ZW9m
KCpwcml2LT5kbWFfaHdkZXNjKSwKPiA+Pj4gIAkJCQkJICAgICAgJnByaXYtPmRtYV9od2Rlc2Nf
cGh5cywKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
