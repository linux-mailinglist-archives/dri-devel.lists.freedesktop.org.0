Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A4434C22
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8716F89A34;
	Tue,  4 Jun 2019 15:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5420789A34
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:24:47 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 203so15817464oid.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 08:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2MDK+m+FuX9/PN6wX5kGSON+cyTcWRcURp05UkjBF9I=;
 b=CSYnJes9nFl8p5PAjKNhMsWOos6WZOfrn/LCeI9yjZS11XA8qQLcSuImIbVmT03dEz
 bXZuZKdcYJt0VMmKvImSyfD2U2WVYGIOgZcdYCE4vB6T4b6Vwjk7momHy0p4/OJuKAlI
 cXpc0U0xhRQs7J/EahaZqSjy+GI+uNCsgrDrvWyKEdMq8/Nmkkybje/YQyVnv3yR1eJJ
 dIMBTsgmB4ADY7sXoFWPpbWglXys+yZaJHEJYxgcz74j2PkhKlVmKewGJsZXM0zDjdKD
 be9Xz3F0mzWzc+JGNIxaOphSuQ9sjZR3kPq262h2NbBLU6nhG4Q8NF81g5CP+wwblAxH
 eC/w==
X-Gm-Message-State: APjAAAVUf4WZwwNwz7L/4NunXOYVkczVu1GtCsFvG2j7CMMfyUrC0Xdz
 5Jo5wy7dYTYzq0arIthKPez4ZVreB0yTSLRSatGg+A==
X-Google-Smtp-Source: APXvYqwZcX0oT63VlccXPtEgj7alySpMMoRwsRSRx+g2TPQnYO7w0760NIP428jwz+RI9zMqW034ZmrebUBSM9Grzhg=
X-Received: by 2002:aca:e4c8:: with SMTP id b191mr4909798oih.110.1559661886581; 
 Tue, 04 Jun 2019 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
In-Reply-To: <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Jun 2019 17:24:35 +0200
Message-ID: <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
Subject: Re: Linking ALSA playback devices and DRM connectors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2MDK+m+FuX9/PN6wX5kGSON+cyTcWRcURp05UkjBF9I=;
 b=MI7CJxkCZNurpd0Qjzerd+fQ7mG1VIMVugMoTj/H0iLkqCmQbsrQN9k3r3YZ1oMwUl
 D0lhUpfAvJel09AW9IjjhIeHFwojfnGSp/5SfHGGwwWpVenRHqgRfpQ/FCZY0fGYF2g9
 4YcICARur9dBWIEyYm1T3MlKrpOTX1l6i++mk=
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ser,
 Simon" <simon.ser@intel.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA1OjE1IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDA0LjA2LjE5IHVtIDE3OjA1
IHNjaHJpZWIgU2VyLCBTaW1vbjoKPiA+IEhpLAo+ID4KPiA+IEknbSB0cnlpbmcgdG8gbGluayBB
TFNBIHBsYXliYWNrIGRldmljZXMgYW5kIERSTSBjb25uZWN0b3JzLiBJbiBvdGhlcgo+ID4gd29y
ZHMsIEknZCBsaWtlIHRvIGJlIGFibGUgdG8ga25vdyB3aGljaCBBTFNBIGRldmljZSBJIHNob3Vs
ZCBvcGVuIHRvCj4gPiBwbGF5IGF1ZGlvIG9uIGEgZ2l2ZW4gY29ubmVjdG9yLgo+ID4KPiA+IFVu
Zm9ydHVuYXRlbHksIEkgaGF2ZW4ndCBmb3VuZCBhIHdheSB0byBleHRyYWN0IHRoaXMgaW5mb3Jt
YXRpb24uIEkKPiA+IGtub3cgL3Byb2MvYXNvdW5kL2NhcmROL2VsZCogZXhwb3NlIHRoZSBFRElE
LWxpa2UgZGF0YS4gSG93ZXZlciBieQo+ID4gbG9va2luZyBhdCB0aGUgQUxTQSBBUEkgKGFsc286
IGFwbGF5IC1sIGFuZCAtTCkgSSBjYW4ndCBmaW5kIGEgd2F5IHRvCj4gPiBmaWd1cmUgb3V0IHdo
aWNoIFBDTSBkZXZpY2UgbWFwcyB0byB0aGUgRUxELgo+ID4KPiA+IEFtIEkgbWlzc2luZyBzb21l
dGhpbmc/Cj4KPiBJcyB0aGF0IGFjdHVhbGx5IGZpeGVkIG9uIGFsbCBoYXJkd2FyZT8gT3IgZG8g
d2UgbWF5YmUgaGF2ZSBzb21lCj4gaGFyZHdhcmUgd2l0aCBvbmx5IG9uZSBhdWRpbyBjb2RlYyBh
bmQgbXVsdGlwbGUgY29ubmVjdG9ycz8KPgo+ID4KPiA+IElmIG5vdCwgd2hhdCB3b3VsZCBiZSB0
aGUgYmVzdCB3YXkgdG8gZXhwb3NlIHRoaXM/Cj4gPgo+ID4gLSBBIHN5bWxpbmsgdG8gdGhlIEFM
U0EgYXVkaW8gUENNIGRldmljZSBpbgo+ID4gICAgL3N5cy9jbGFzcy9kcm0vY2FyZE4tQ09OTkVD
VE9SPwo+ID4gLSBBIHN5bWxpbmsgdG8gdGhlIERSTSBjb25uZWN0b3IgaW4gL3N5cy9jbGFzcy9z
b3VuZC9wY20qPwo+Cj4gSWYgaXQncyBmaXhlZCB0aGFuIHRob3NlIHR3byBvcHRpb25zIHNvdW5k
IHNhbmUgdG8gbWUuCj4KPiA+IC0gQSBEUk0gY29ubmVjdG9yIHByb3BlcnR5Pwo+Cj4gSWYgaXQn
cyBjb25maWd1cmFibGUgdGhhbiB0aGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBvcHRpb24gdG8gbWUu
Cj4KPiBBbnl3YXkgYWRkZWQgb3VyIERDIHRlYW0sIHN0dWZmIGxpa2UgdGhhdCBpcyB0aGVpciBj
b25zdHJ1Y3Rpb24gc2l0ZS4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gPiAtIFNvbWVo
b3cgZXhwb3NlIHRoZSBjb25uZWN0b3IgbmFtZSB2aWEgdGhlIEFMU0EgQVBJPwo+ID4gLSBFeHBv
c2UgdGhlIGNvbm5lY3RvciBFRElEIHZpYSBBTFNBPwo+ID4gLSBPdGhlciBpZGVhcz8KCkkgdGhp
bmsgb24gb3VyIE1TVCBodyB5b3UgZ2V0IGEgY29tYmluYXRpb24gb2YgQ1JUQ3MgeCBDT05ORUNU
T1JzIG9uCnRoZSBhbHNhIHNpZGUuIEkuZS4gZm9yIGV2ZXJ5IHBhaXIgb2YgY29ubmVjdG9yIGFu
ZCBjcnRjIHlvdSBnZXQgYQpzZXBhcmF0ZSBhbHNhIHBpbi4gVGhpcyBpcyBiZWNhdXNlIHdpdGgg
bXN0LCB5b3UgY291bGQgaGF2ZSB1cCB0bwpudW1fY3J0Y3Mgc3RyZWFtcyBvbiBhIHNpbmdsZSBj
b25uZWN0b3IuIE5vdCBzdXJlIGhvdyB0byBtb2RlbCB0aGF0LgoKQmlnZ2VyIHF1ZXN0aW9uOiBI
b3cgZG8geW91IHdhbnQgdG8gbWFrZSB0aGUgY29vcGVyYXRpb24gaGFwcGVuPwpUaGVyZSdzIGJl
ZW4gc29tZSBpZGVhcyBmbG9hdGluZyBhYm91dCBtYWtpbmcgdGhlIGhkbWkgY29ubmVjdGlvbgpi
ZXR3ZWVuIGRybSBhbmQgYWxzYSBzb21laG93IHJlcHJlc2VudGVkIGluIHRoZSBjb2RlLCBidXQg
bm90aGluZyBldmVyCnJlYWxseSBoYXBwZW5lZC4gdGhlcmUncyBkcm1fYXVkaW9fY29tcG9uZW50
LmgsIGJ1dCB0aGF0J3MganVzdCB0aGUKaW50ZXJmYWNlLCBpdCBkb2Vzbid0IHJlYWxseSBzb2x2
ZSBob3cgdG8gbWFrZSB0aGUgY29ubmVjdGlvbi4gQWxzbwpvbmx5IHVzZWQgYnkgaTkxNS9oZGEu
Ci1EYW5pZWwKCgoKPiA+IFRoYW5rcyEKPiA+Cj4gPiBTaW1vbiBTZXIKPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5
IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
