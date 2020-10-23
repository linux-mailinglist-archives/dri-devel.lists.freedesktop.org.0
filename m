Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72DC297210
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 17:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046146E051;
	Fri, 23 Oct 2020 15:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853AA89256
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 15:14:31 +0000 (UTC)
Date: Fri, 23 Oct 2020 15:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603466069;
 bh=fpfmanFgqlU/lzWtOZ6sJt9HDyNApPI+OcMiQ1jU2Q8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kIDxE14QEkaab3DTVkhGSAm0Ss7xK3j7CsyJ5mOtzoqIfPmmgCVWRXnbm297kmrD/
 CjHX777iIfuy6oMkDbm+0N6W9LN9V/fN44t4vjKaXngxyNZUeMmMgkjEq+r3LsT4+K
 bD3IR6FMLBYLV3rk7NKQ1IV9p+OxJYhiWmWXTSqwJlCavw9Kctkxy4+VE9zYCmQ4h0
 bHaPNdqcAQR5/hqMcYr5N0CcB5k22sLWqvDqdKFIa4xdF3AnRlKIi8AUkFM83RPo6i
 UYzNlD5ezvMF79e099tP36ZH4tm8xIkRSVXtj1JGc+S7QBtMyoJh8Z7q1iwzLr9ki1
 VOeAxdvce0hSA==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] drm_modes: signed integer overflow
Message-ID: <BaLsmzqZNUi-nVbYiLstRgspKGlLahAI8vM2_NPfos2PxM0N9lycj-Zn5TdqNtEHB-jeWgmzw9EHJxq4H5552tVi4bAZXTLnP0y1QsTPFtY=@emersion.fr>
In-Reply-To: <20201022101423.GI6112@intel.com>
References: <47527cdb-2eda-b5a3-d77c-3855b91a0b61@infradead.org>
 <20201022101423.GI6112@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIE9jdG9iZXIgMjIsIDIwMjAgMTI6MTQgUE0sIFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIE9jdCAyMSwg
MjAyMCBhdCAwODoxMzo0M1BNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4KPiA+IEhpLAo+
ID4gV2l0aCBsaW51eC1uZXh0IDIwMjAxMDIxLCB3aGVuIGJvb3RpbmcgdXAsIEkgYW0gc2VlaW5n
IHRoaXM6Cj4gPiBbIDAuNTYwODk2XSBVQlNBTjogc2lnbmVkLWludGVnZXItb3ZlcmZsb3cgaW4g
Li4vZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jOjc2NToyMAo+ID4gWyAwLjU2MDkwM10gMjM3
NjAwMCAqIDEwMDAgY2Fubm90IGJlIHJlcHJlc2VudGVkIGluIHR5cGUgJ2ludCcKPgo+IERhbmcu
IERpZG4ndCByZWFsaXplIHRoZXNlIG5ldyBjcmF6eSA+OGsgbW9kZXMgaGF2ZSBkb3RjbG9ja3Mg
cmVhY2hpbmcKPiBhbG1vc3QgNiBHSHosIHdoaWNoIHdvdWxkIG92ZXJmbG93IGV2ZW4gdTMyLiBJ
IGd1ZXNzIHdlJ2xsIHN3aXRjaCB0bwo+IDY0Yml0IG1hdGhzLiBOb3cgSSB3b25kZXIgaG93IG1h
bnkgb3RoZXIgcGxhY2VzIGNhbiBoaXQgdGhpcyBvdmVyZmxvdwo+IGluIHByYWN0aWNlLi4uCgpD
YW4geW91IHByb3ZpZGUgYW4gZXhhbXBsZSBvZiBhIGZ1bGwgY3JhenkgPjhrIG1vZGU/IEknbSB0
cnlpbmcgdG8gZ2V0CmEgZml4IGZvciBteSB1c2VyLXNwYWNlIFsxXSwgYW5kIEknbSB3b25kZXJp
bmcgaWYgaW50MzJfdCBpcyBlbm91Z2gKYWZ0ZXIgZGl2aWRpbmcgYnkgbW9kZS0+aHRvdGFsLgoK
Q0MgUGVra2EsIGp1c3QgRllJIChJIHRoaW5rIFdlc3RvbiBoYXMgc2ltaWxhciBjb2RlKS4KClsx
XTogaHR0cHM6Ly9naXRodWIuY29tL3N3YXl3bS93bHJvb3RzL3B1bGwvMjQ1MApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
