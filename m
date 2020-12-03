Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AC2CD66C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 14:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E3B6E995;
	Thu,  3 Dec 2020 13:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586C56E995
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:13:52 +0000 (UTC)
Date: Thu, 03 Dec 2020 13:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607001228;
 bh=ZS5RacJcaSTTGoiqn3bBe/xM6blHvWRiq+vsTnhZvgo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=hHSjdWr99qUkdrQeNApSQ50SPoC6x9JK0hno2OwfG+I6fQx2+pLUv0qpuatHAjILZ
 3z73GGGSx/Y0I8KKvesRdRvhYQ8sYNjQLN2zfplEMb+S/5IA3B7udj0JM0l+G8UUhX
 EmTBE6Ujk3X7xYpyq2VH2ezajIFXyALhiKlCsZw1gB9ykCmokszxWQDFZW5k3v+hjV
 AegTeCLGtmbZHkvXdCzm5qUQuItI8vrPn/qRYRIRSafe2SXj6oGu6EihwQNan5dZUw
 /wVWcjnnptOp5IhYeUbtkYnZ5q8+8TAOJsWepVc7h6XHmxKLJEcpDmZO81V7ziWK3N
 RPIJsAR7d9YaQ==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <uS0tWzV8KGnvxJm8AgHsNpYruoy-QmO1UkCgokwE5upl_ykS-5aOxS4ennordEC42dctZE2KOr2SuLXJg0wt9NgwpiHwa_2GjT-2-Sp2JgI=@emersion.fr>
In-Reply-To: <20201203125402.GH6112@intel.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
 <20201203125402.GH6112@intel.com>
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
Cc: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIERlY2VtYmVyIDMsIDIwMjAgMTo1NCBQTSwgVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+ID4gVGhlIGRybV9mb3VyY2Mu
aCBtYXliZSBtYWtlcyBzb21lIHNlbnNlIChJIHRoaW5rIGluIHNvbWUgcGxhY2VzIG1lc2EKPiA+
IHVzZXMgdGhlc2UgaW50ZXJuYWxseSwgYW5kIG1hbnkgZHJpdmVycyB1c2UgdGhlIG1vZGlmaWVy
cyBkaXJlY3RseSBpbgo+ID4gdGhlIG1haW4gZHJpdmVyKS4gQnV0IHRoZSBhbWRncHUgaGVhZGVy
IHNob3VsZCBiZSBhbGwgaW9jdGwgc3R1ZmYsCj4gPiB3aGljaCBzaG91bGQgYmUgYWxsIGVudGly
ZWx5IGluIHRoZSB3aW5zeXMgb25seS4KPiA+IEFsc28ga2luZGEgZGlzYXBwb2ludGluZyB0aGF0
IGRybV9mb3VyY2MuaCBpbmNsdWRlcyBkcm0uaCBhbmQgaXNuJ3QKPiA+IHN0YW5kYWxvbmUsIGJ1
dCBJIGd1ZXNzIHRoYXQgc2FpbGVkIChhdCBsZWFzdCBmb3IgbGludXgpLgo+Cj4gSXNuJ3QgdGhl
IG9ubHkgdGhpbmcgaXQgbmVlZHMgdGhlIF9fdTMyPyBJIHdvdWxkIHRoaW5rIHdlIGNvdWxkIGp1
c3QKPiByZXBsYWNlIHRob3NlIHdpdGggdW5zaWduZWQgaW50IChEUk1fRk9STUFUX0JJR19FTkRJ
QU4gYWxyZWFkeSBhc3N1bWVzCj4gaW50IGlzIDMyYml0IGl0IHNlZW1zKSBhbmQgZHJvcCB0aGUg
ZHJtLmguCj4KPiBPciBhcmUgd2UncmUgd29ycmllZCBzb21ldGhpbmcgYWxyZWFkeSBkZXBlbmRz
IG9uIGdldHRpbmcgZHJtLmggdmlhCj4ganVzdCBpbmNsdWRpbmcgZHJtX2ZvdXJjYy5oPwoKWWVz
LCBzb21lIHVzZXItc3BhY2UgbWlnaHQgb25seSBpbmNsdWRlIGRybV9mb3VyY2MuaCBhbmQgdXNl
IHN0dWZmCmNvbWluZyBmcm9tIGRybS5oLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
