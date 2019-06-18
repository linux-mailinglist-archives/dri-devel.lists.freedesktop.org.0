Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AEC4A7B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 18:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B986E201;
	Tue, 18 Jun 2019 16:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C776E201
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 16:57:36 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id 34so6734031uar.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 09:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yo2+hP1hmPeY+E4/cOlfBNumtIf57Ixxbx1NkiGuAs0=;
 b=DIc4BX8otRAeE7aYMLXRSJW+RtUNBQDnIJZi4EWV9OM/DXgN3n5fSniHBuJhBzTEJN
 r1gojVfgYQbIne4gcewX95frVN1bnM0hH9uwfsfvqhlFQXp9Kw8Fq5vfDua2adobHzK+
 3wXau0tqADnRlBYPfDEH0BH7aGKE0L1hDXae6+bQC9mNnh9FSlip87OWr+1VvHrTzS4o
 ZC1vtRi9yWbA3gSNIDJwmjkV6RdcEltYSuzcElhtT0wwW7o2nAhj4aLyl+ZEGjv67LU3
 AY+tG8PK7Xw91r/eCTMStMDsQSMKnLvt/bfkf3tMX0+chnobx6Qijy7Rsz7Do4pWxGFQ
 2jcw==
X-Gm-Message-State: APjAAAWLbJ+Cj75gilRhfJW2p8LpiGOt/WE40AcuOu5v3RxWR41EYxod
 gb1gHszdGdQU0yJky6rrbakDPWCYe4W3zB/eEwg=
X-Google-Smtp-Source: APXvYqya/Im8N5Rkn3gJLwxn/tZrop0eZUP4okntGtk4A3/PbPyQ8ofkt5nndC/nVnQi4JD/GNfCrLwpFrBScdM3tMU=
X-Received: by 2002:a67:ecd4:: with SMTP id i20mr35616638vsp.210.1560877055649; 
 Tue, 18 Jun 2019 09:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190613192244.5447-1-ezequiel@collabora.com>
 <CAKb7UvhxnysEPrw2javE=OK8qop=3LPuRphbu_WQKvgCJYU6Kg@mail.gmail.com>
 <6b0519240580229d1cc4ce6d2c98326f2ef7f97c.camel@collabora.com>
In-Reply-To: <6b0519240580229d1cc4ce6d2c98326f2ef7f97c.camel@collabora.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 18 Jun 2019 12:57:24 -0400
Message-ID: <CAKb7Uvg1gfHdVv69sXFs8rgOP-bGkDuMXvikDMYdJO8EC1zxiQ@mail.gmail.com>
Subject: Re: [RFC/WIP] drm/rockchip: Support CRTC gamma LUT
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgOTozNiBBTSBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVs
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDE5LTA2LTEzIGF0IDE1OjM2IC0w
NDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IE5vdGUgdGhhdCB1c2Vyc3BhY2UgbWF5IHByb3Zp
ZGUgYW55IHNpemUgb2YgZ2FtbWEgbHV0LiBIYXZlIGEgbG9vayBhdAo+ID4gaTkxNS9pbnRlbF9j
b2xvci5jOmludGVsX2NvbG9yX2NoZWNrIHdoaWNoIGZpbHRlcnMgb3V0IG9ubHkgdGhlCj4gPiBh
bGxvd2VkIHNpemVzLiBDb25zaWRlciBoYXZpbmcgYSBzcGVjaWFsIGFsbG93YW5jZSBmb3IgMjU2
LXNpemVkIExVVHMKPiA+IHNpbmNlIHRoYXQncyB3aGF0IG1vc3QgbGVnYWN5IHVzZXJzcGFjZSB3
aWxsIHNldCwgYW5kIGl0IHNlZW1zIGxpa2UgYQo+ID4gd2FzdGUgdG8gY3JlYXRlIGEgMTAtYml0
IExVVCBmb3IgUkdCQTggY29sb3IuCj4gPgo+Cj4gUmlnaHQuIEkgd2lsbCBhZGQgYSBjaGVjayBm
b3IgdGhlIGdhbW1hIGx1dCBzaXplLgo+Cj4gVW5mb3J0dW5hdGVseSwgdGhpcyBoYXJkd2FyZSBz
ZWVtcyB0byBvbmx5IHN1cHBvcnQgMTAtYml0LCAxMDI0LXNpemVkIExVVHMuCj4KPiBUaGUgc3Bl
YyBkb2VzIG1lbnRpb24gYSBzdXBwb3J0IDgtYml0LCAyNTYtZW50cmllcywgYnV0IGl0J3Mgbm90
IGF0IGFsbAo+IGNsZWFyIGhvdyBjb25maWd1cmUgdGhhdC4KCkl0J3MgdXAgdG8geW91LCBhbmQg
dGhlIG1vcmUgZXhwZXJpZW5jZWQgZHJtIHJldmlld2VycywgYnV0IGV2ZW4gaWYKeW91IGNhbid0
IGZpZ3VyZSBvdXQgaG93IHRvIGJlbmQgdGhlIGhhcmR3YXJlIHRvIHlvdXIgd2lsbCAod2hpY2gg
aXMKd29ydGggYSBiaXQgb2YgZXhwbG9yYXRpb24pLCB5b3UgY2FuIHN0aWxsIGVtdWxhdGUgaXQg
YnkganVzdApyZXBlYXRpbmcgYWxsIHRoZSB2YWx1ZXMgNHguIElNSE8gMjU2LXNpemVkIExVVHMg
YXJlIHdvcnRoIHN1cHBvcnRpbmcKd2hlbiBwb3NzaWJsZS4KCkNoZWVycywKCiAgLWlsaWEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
