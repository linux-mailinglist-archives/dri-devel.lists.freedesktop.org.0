Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1A25AB6C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 14:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204306E49F;
	Wed,  2 Sep 2020 12:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3A6E49F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 12:49:30 +0000 (UTC)
Date: Wed, 02 Sep 2020 12:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599050968;
 bh=5e9Nx5wzTiJf64jkdWfnx8235h+QhQ/4xm96xMj4JNk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=AmeLQyybkifsSOnKy8w6x+mMR2H31VEXSMPVlSKUnhRWwuSQfH6dMR7UX+9eDbHUM
 fVFj0SJ4/kcY0w9JZA+MFxMX60Yu+DwxwVwGrCo66lf/Qa194XcaBEz1xWhb97jkYl
 Abi4PimxOrH3Y+IFDtcCTb/YqgcF0XcxzK1hVuvXUUsEG3JHSp+tj7lzA6SstFZn4x
 Tvp4xEzTucno3BsoeamsgNbR8YtgSRmcUNtXaYlai4ZDnJzgtnKJe64+QwY1e8va2J
 EXCd9mE0pYHAUDd18fA1gP8Fc3IFcY8FghE8MkH3no3HGD8TNv8cwLunIgK3RVvNxI
 YMQ+UIxL9DBFg==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
In-Reply-To: <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMiwgMjAyMCAyOjQ0IFBNLCBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gPiBJIHN1cHBvc2Ugc29tZXRoaW5nIHNp
bWlsYXIgaGFwcGVucyBpbiB1c2VyLXNwYWNlOiBnYm1fYm9fY3JlYXRlCj4gPiB3aXRob3V0IG1v
ZGlmaWVycyBuZWVkcyB0byBwcm9wZXJseSBzZXQgdGhlIGltcGxpY2l0IG1vZGlmaWVyLCBpZS4K
PiA+IGdibV9ib19nZXRfbW9kaWZpZXIgbmVlZHMgdG8gcmV0dXJuIHRoZSBlZmZlY3RpdmUgbW9k
aWZpZXIuIElzIHRoaXMKPiA+IHNvbWV0aGluZyBhbHJlYWR5IGRvY3VtZW50ZWQ/Cj4KPiBJIGRv
bid0IHRoaW5rIHRoYXQgaGFwcGVucywgYnV0IGl0IGhhcyBjb21lIHVwIGluIGRpc2N1c3Npb25z
LiBJdCdzCj4ga2luZGEgZGlmZmVyZW50IHNjZW5hcmlvIHRob3VnaDogZ2V0ZmIyIGlzIGZvciBj
cm9zcy1jb21wb3NpdG9yIHN0dWZmLAo+IGVuYWJsaW5nIHNtb290aCB0cmFuc2l0aW9ucyBhdCBi
b290LXVwIGFuZCB3aGVuIHN3aXRjaGluZy4gU28geW91IGhhdmUKPiBhIGxlZ2l0IHJlYXNvbiBm
b3IgbWl4aW5nIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFjZSB3aXRoCj4gbm9uLW1vZGlmaWVyLWF3
YXJlIHVzZXJzcGFjZS4gQW5kIHRoZSBtb2RpZmllci1hd2FyZSB1c2Vyc3BhY2Ugd291bGQKPiBs
aWtlIHRoYXQgZXZlcnl0aGluZyB3b3JrcyB3aXRoIG1vZGlmaWVycyBjb25zaXN0ZW50bHksIGlu
Y2x1ZGluZwo+IGdldGZiMi4gQnV0IGdibSBpcyBqdXN0IHdpdGhpbiBhIHNpbmdsZSBwcm9jZXNz
LCBhbmQgdGhhdCBzaG91bGQKPiBlaXRoZXIgcnVuIGFsbCB3aXRoIG1vZGlmaWVycywgb3Igbm90
IGF0IGFsbCwgc2luY2UgdGhlc2Ugd29ybGRzIGp1c3QKPiBkb250IG1peCB3ZWxsLiBIZW5jZSBJ
J20gbm90IHNlZWluZyBtdWNoIHVzZSBmb3IgdGhhdCwgLW1vZGVzZXR0aW5nCj4gYmVpbmcgYSBj
b25mdXNlZCBtZXNzIG5vbndpdGhzdGFuZGluZyA6LSkKCldlbGzigKYgVGhlcmUncyBhbHNvIHRo
ZSBjYXNlIHdoZXJlIHNvbWUgbGVnYWN5IFdheWxhbmQgY2xpZW50IHRhbGtzIHRvIGEKbW9kaWZp
ZXItYXdhcmUgY29tcG9zaXRvci4gZ2JtX2JvX2ltcG9ydCB3b3VsZCBiZSBjYWxsZWQgd2l0aG91
dCBhCm1vZGlmaWVyLCBidXQgdGhlIGNvbXBvc2l0b3IgZXhwZWN0cyBnYm1fYm9fZ2V0X21vZGlm
aWVyIHRvIHdvcmsuCgpBbHNvLCB3bHJvb3RzIHdpbGwgY2FsbCBnYm1fYm9fY3JlYXRlIHdpdGhv
dXQgYSBtb2RpZmllciB0byBvbmx5IGxldAp0aGUgZHJpdmVyIHBpY2sgInNhZmUiIG1vZGlmaWVy
cyBpbiBjYXNlIHBhc3NpbmcgdGhlIGZ1bGwgbGlzdCBvZgptb2RpZmllcnMgcmVzdWx0cyBpbiBh
IGJsYWNrIHNjcmVlbi4gTGF0ZXIgb24gd2xyb290cyB3aWxsIGNhbGwKZ2JtX2JvX2dldF9tb2Rp
ZmllciB0byBmaWd1cmUgb3V0IHdoYXQgbW9kaWZpZXIgdGhlIGRyaXZlciBwaWNrZWQuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
