Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA9CFB10
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 15:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E068A6E161;
	Tue,  8 Oct 2019 13:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5C6E161
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 13:13:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5so3120675wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 06:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4/gqMspncqHxoM+1ttDc77/pbJmHfPCJTee07ZfUHno=;
 b=TYHyUd/nlcHNr8ddAE8VXoj07Neb0phnBH17uWEgRhLdy9f0WmgvgASQ6rh8ZEoSFc
 kfV5STJ+9R3cvSIc7zcPM1Md9u9PWTNCGAvUSFkGD8RfixYd0F9Vqthnx9uMZz1slRFV
 DoUJbmVvVLzB32mdbs358MQqC9G6ImYoDbIEZbDk/2vXl5J3qOZK02xIBsTu2ZIgYhpp
 kFVeS3XrYAPigshixB3yfDmRtslqT2Py2r3TSxH7AaXwihY9ZTsfGuwDmMM+3iS8yTDi
 pHB9U7+GzuwXxJewVkhf07WJkZg6JNBVDNW40+L1ZSlRhB9WIGZFNydyGGwMdBC3l9hn
 Wi5w==
X-Gm-Message-State: APjAAAUY/DFcRA7RWYs7BkuPRMfm7YM4cfnvSzIugqQ+FjAZEjTUCRh1
 uHYmawrNbGY2z1N0H7wCTOzRtjAmPYKPu/QklWI=
X-Google-Smtp-Source: APXvYqxDjj9R1eLsbfM93+Ua0jbWuZW3UUrhqo+R7jjPbYDXXXRSUcECu8hZ1QI6mieUd0jXkD3UvogqmpmweEQn0tM=
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr3734708wma.102.1570540434202; 
 Tue, 08 Oct 2019 06:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
In-Reply-To: <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Oct 2019 09:13:41 -0400
Message-ID: <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4/gqMspncqHxoM+1ttDc77/pbJmHfPCJTee07ZfUHno=;
 b=Oqk5v82c32u/ci22zhSfc1KsQNvEU9hm1cs7cBw0Ut2xmyGiYFMJqNkuR2MlxBB5E8
 EG/H2vXGp2muWTVQwOE0UQXkw/vVmf4PTXHl7jF5SFsbnSXGGC530n91YjseKvzzxDdf
 PeWXJCz5fYZaXxV0/uGZpWwY2MSyP4p5qJSReL7ogBVa3z2wPhYK6s11wwtUS6Ox9qj0
 GYOJp7CXy9WD9o3ZV1dkcmN4jTsbjhE7edySkiysE9kgY3tb682BP3NZc4IAan48wpNC
 zfnJoSWC6Qqx64IRyBlFLWD9NrhfvfitvxumHcwNeLcPY3pALNaPVkuSBRQhzdSmjeH2
 zAuA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA0OjA0IEFNIEtvZW5pZywgQ2hyaXN0aWFuCjxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gTXkgZ2l0IHZlcnNpb24gc2hvdWxkIGJlIHJl
bGF0aXZlIG5ldywgYnV0IEknbSB1c3VhbGx5IHVzaW5nIHRodW5kZXJiaXJkCj4gdG8gc2VuZCBw
dWxsIHJlcXVlc3RzIG5vdCBnaXQgaXRzZWxmIHNpbmNlIEkgd2FudCB0byBlZGl0IHRoZSBtZXNz
YWdlCj4gYmVmb3JlIHNlbmRpbmcuCj4KPiBIb3cgd291bGQgSSBkbyB0aGlzIGluIGEgd2F5IHBh
dGNod29yayBsaWtlcyBpdCB3aXRoIGdpdD8KCkZXSVcsIEkgdXN1YWxseSBnZW5lcmF0ZSB0aGUg
ZW1haWwgZmlyc3QgYW5kIHRoZW4gdXNlIGdpdC1zZW5kLWVtYWlsCnRvIGFjdHVhbGx5IHNlbmQg
aXQuCgpBbGV4Cgo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPgo+IEFtIDA3LjEwLjE5IHVtIDIx
OjU4IHNjaHJpZWIgRGF2ZSBBaXJsaWU6Cj4gPiBGb3Igc29tZSByZWFzb24gdGhpcyBkaWRuJ3Qg
ZW5kIHVwIGluIHBhdGNod29yayB3aGljaCBtYWtlcyBpdCBoYXJkCj4gPiBmb3IgbWUgdG8gcHJv
Y2Vzcy4KPiA+Cj4gPiBVc3VhbCBzdXNwZWN0cyBhcmUgdXNpbmcgdG9vIG9sZCBhIGdpdCB0byBz
ZW5kIGl0IG9yIG1heWJlIGl0IGdvdCBjdHJsLU1zIGluIGl0Lgo+ID4KPiA+IERhdmUuCj4gPgo+
ID4gT24gVGh1LCAzIE9jdCAyMDE5IGF0IDAxOjQ0LCBDaHJpc3RpYW4gS8O2bmlnCj4gPiA8Y2tv
ZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IEhpIERhdmUsIERhbmll
bCwKPiA+Pgo+ID4+IHdlIGhhZCBzb21lIHByb2JsZW1zIHRoaXMgY3ljbGUgc2VuZGluZyBvdXQg
VFRNIGZpeGVzIGJlY2F1c2Ugb2YgbGFjayBvZgo+ID4+IHRpbWUgdG8gcmViYXNlIGFtZC1zdGFn
aW5nLWRybS1uZXh0Lgo+ID4+Cj4gPj4gQmVjYXVzZSBvZiB0aGlzIEFsZXggYW5kIEkgZGVjaWRl
ZCB0aGF0IEknbSBnb2luZyB0byBzZW5kIG91dCBUVE0gcHVsbAo+ID4+IHJlcXVlc3RzIHNlcGFy
YXRlbHkgbm93LiBTbyB0aGlzIGlzIHRoZSBmaXJzdCBzbWFsbCBidW5jaCBvZiBmaXhlcyBmb3Ig
NS40Lgo+ID4+Cj4gPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGVjYjhm
NzAyOGM1ZWIzZDc0MGJiODJiMGYxZDkwZjJkZjYzYzVjOgo+ID4+Cj4gPj4gICAgIExpbnV4IDUu
NC1yYzEgKDIwMTktMDktMzAgMTA6MzU6NDAgLTA3MDApCj4gPj4KPiA+PiBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+Pgo+ID4+ICAgICBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvY2tvZW5pZy9saW51eC1kcm0uZ2l0IGRybS10dG0tZml4ZXMKPiA+Pgo+
ID4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzZWVmY2ZlOWE2NDRiZTQ0MDk2OTFi
NDRjM2IyZDYyOWQxNzdmYjlhOgo+ID4+Cj4gPj4gICAgIGRybS90dG06IFJlc3RvcmUgdHRtIHBy
ZWZhdWx0aW5nICgyMDE5LTEwLTAyIDE1OjU3OjM0ICswMjAwKQo+ID4+Cj4gPj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4+IENocmlzdGlhbiBLw7ZuaWcgKDEpOgo+ID4+ICAgICAgICAgZHJtL3R0bTogZml4IGJ1c3kg
cmVmZXJlbmNlIGluIHR0bV9tZW1fZXZpY3RfZmlyc3QKPiA+Pgo+ID4+IFRob21hcyBIZWxsc3Ry
b20gKDEpOgo+ID4+ICAgICAgICAgZHJtL3R0bTogUmVzdG9yZSB0dG0gcHJlZmF1bHRpbmcKPiA+
Pgo+ID4+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAgNCArKy0tCj4gPj4g
ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE2ICsrKysrKystLS0tLS0tLS0K
PiA+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
Cj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IENocmlzdGlhbi4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
