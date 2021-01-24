Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76770301A78
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 09:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1289CF1;
	Sun, 24 Jan 2021 08:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9004D89CF1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 08:15:18 +0000 (UTC)
Date: Sun, 24 Jan 2021 08:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611476116;
 bh=6RRhzdXSqZkbNIQx9aTX5fQsLN1eFyFM7OrfzOlanNE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KYuVylOWFPyvc6Bd9t30XTELpIWhZYgzrQdkPmGzP2Xl0PO4fU+w1UP3ntBBLgdDC
 ZjMLxG0mnmyNAg7V/yZ8bGKz4OAa54U2vRabATb9q3C4+O4Ef2+tdqNh3j54lCyUCb
 H41AtwXhl8+ZuqO20L9i/6hMOCeNTrTVG4rBDAyqkFybgTZmFa6ca8IX/rdUr3ab7n
 6TUSjZTi2/xUtFNFFnhaMlv7nXMxvDDag2XTd6ZW4CrpWEdtuI+qsuepUp1pLosoah
 NuO0virX/wdmeKocM3h+vv56LD+0b5STJdyQOsh7jY6rvTwgANyytJ4HvClFuqpc3V
 GORDOG+VNKVlQ==
To: Mario Kleiner <mario.kleiner.de@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
Message-ID: <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
In-Reply-To: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuZGF5LCBKYW51YXJ5IDI0dGgsIDIwMjEgYXQgNTo0MCBBTSwgTWFyaW8gS2xlaW5lciA8
bWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBY2NvcmRpbmcgdG8gdGhlIENU
QSA4NjEuRyBzcGVjLCBIRE1JX1NUQVRJQ19NRVRBREFUQV9UWVBFMSBpcwo+IG5vdCAxLCBidXQg
emVybywgc28gZml4IHRoaXMgZW51bS4KPgo+IFdoaWxlIHRoaXMgZG9lc24ndCBjYXVzZSBwcm9i
bGVtcyBpbiB0aGUga2VybmVsIHlldCwgYXMgdGhlCj4gY29uc3RhbnQgaXNuJ3QgYWN0aXZlbHkg
dXNlZCBieSBkcml2ZXJzIHlldCwgaXQgZGlkIGNyZWF0ZQo+IGNvbmZ1c2lvbiB3aGlsZSBkZWJ1
Z2dpbmcgSERSIHByb2JsZW1zIGluIHlvdXJzIHRydWx5LCBhbmQKPiBhbHNvIHBvdGVudGlhbCBi
dWdzIGluIHVzZXJzcGFjZSBjb21wb25lbnRzLCBhcyB0aGUgd3JvbmcKPiBlbnVtIHByb3BhZ2F0
ZXMgdG8gY29tcG9uZW50cywgZS5nLiwgbGlrZSBpdCBkaWQgYWxyZWFkeQo+IGludG8gaW50ZWwt
Z3B1LXRvb2xzICh0ZXN0cy9rbXNfaGRyLmMpIG9yIGlzIHVzZWQgYXMgd3JvbmcKPiByZWZlcmVu
Y2Ugd2hlbiB3cml0aW5nIGZ1dHVyZSBuZXcgdXNlcnNwYWNlIEhEUiBjb21wb25lbnRzCj4gbGlr
ZSBjb21wb3NpdG9ycy4KPgo+IEZpeGVzOiBmYmI1ZDAzNTNjNjIgKCJkcm06IEFkZCBIRFIgc291
cmNlIG1ldGFkYXRhIHByb3BlcnR5IikKPiBTaWduZWQtb2ZmLWJ5OiBNYXJpbyBLbGVpbmVyIDxt
YXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4KPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2Fy
QGludGVsLmNvbT4KPiBDYzogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwu
Y29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgoKU2FkbHkgSSB0aGluayBpdCdzIHRvbyBsYXRlIGZvciB0aGlzLiBTb21lIHVzZXItc3BhY2Ug
KGxpa2UgS29kaSkKYWxyZWFkeSBoYXMgY29waWVkIG92ZXIgdGhlIGtlcm5lbCBkZWZpbml0aW9u
cywgYW5kIGxpYmRybSBhbHJlYWR5IGhhcwphIHJlbGVhc2Ugd2l0aCB0aGUgd3JvbmcgdmFsdWUu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
