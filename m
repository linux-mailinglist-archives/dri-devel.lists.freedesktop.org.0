Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75DF4CC7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 14:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867306F982;
	Fri,  8 Nov 2019 13:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB356F982
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 13:11:01 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y129so3723293vsc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 05:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHUE1bTyfqVUZ/D4r6IGMke7yvhzZ20Z4xS/c6A1e30=;
 b=MBjDZ4pv0KskHag63Vi5LUGP7g0/OrXtceBAhNdxMezORceSfnqholqRv6QTzQACpu
 LKRKVwKHinEGlKTZwjo+vHVhG4YLT7O4lXhW4jMoi93P28QatWKb++u+BRqY+7t1EW7o
 MS2jO+HWxZ3ElAUeA4+mQozIxGV0Jp14Xu1WfH9pGzfztK5BXv4IJ6tbf5U0CDDMEYZB
 j18tvO979S43AHBSHdaCeR8NbsEo4obhNWZ+m/pHVgWNfLXktNRS7DDxgoxCp0FVIhAf
 x632LDbZKmYe+TfgIdlh6Cfgyj6F8r9mw2Ifc6WcsBq+oTGy6wdxgltGPe8X90YbiR/Y
 L55A==
X-Gm-Message-State: APjAAAWuhi4l9q9wzG7Etf6hQ7Si/zTHwkL+CFiytuxZ8xuI/Vju7z8z
 oXYWJ/KQh4chUfbAq7s9aiY9BnR1pqjV2pKzbIz4LQ==
X-Google-Smtp-Source: APXvYqwSEAM6rcjodj6ZY+UTOx94kBMN1GETOlx9MKlJauXaDH0gUZnTo85pO9fSikHcA+pQ7O/tcwVNEc2Ay7+MWkU=
X-Received: by 2002:a67:fdc9:: with SMTP id l9mr8115005vsq.138.1573218660426; 
 Fri, 08 Nov 2019 05:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-4-emil.l.velikov@gmail.com>
 <d652ceaa-2c64-31f0-1793-14a5de51dc57@arm.com>
In-Reply-To: <d652ceaa-2c64-31f0-1793-14a5de51dc57@arm.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 Nov 2019 13:10:42 +0000
Message-ID: <CACvgo52zMar0q1CPNd0UnBFU3AZt-m1v7ZKaP0y3p6bSJ6LxFQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panfrost: remove DRM_AUTH and respective comment
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qHUE1bTyfqVUZ/D4r6IGMke7yvhzZ20Z4xS/c6A1e30=;
 b=XobRlhwB5yEBS+JPt/sHnc/r7jUPvIMz+dFSOCfBZ0U+fSvNxvSacGD3SyN3gZEe3s
 NMcgPwDpXl4WBEsBb1hKDesrKZMgwdybG7hxtCJmb1CIoE8jHDKIo9SoNe0Q+qeNJ95E
 sM0Qb0HQw4yXNKibCxMdwRd07MuJDxToaTbROe+LeHZxats+Wi6ORXXej07g34qlyqhd
 iKtQ95SC0l7k44q+ykDAR9Bznj+hJVdQH8OZfRJMuOMpZiOXYowPpmNczdNGrYZNn8Bd
 o0FK8x2Ue7NgzSHy3zspXkQHkKo8ie4+HOGFb9awckh/YDUq9ZVlso83BQZf5R3OXxWl
 mtIQ==
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxIE5vdiAyMDE5IGF0IDEzOjM0LCBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBh
cm0uY29tPiB3cm90ZToKPgo+IE9uIDAxLzExLzIwMTkgMTM6MDMsIEVtaWwgVmVsaWtvdiB3cm90
ZToKPiA+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Pgo+ID4gQXMgb2YgZWFybGllciBjb21taXQgd2UgaGF2ZSBhZGRyZXNzIHNwYWNlIHNlcGFyYXRp
b24uIFlldCB3ZSBmb3Jnb3QgdG8KPiA+IHJlbW92ZSB0aGUgcmVzcGVjdGl2ZSBjb21tZW50IGFu
ZCBEUk1fQVVUSCBpbiB0aGUgaW9jdGwgZGVjbGFyYXRpb24uCj4gPgo+ID4gQ2M6IFRvbWV1IFZp
em9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiA+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+ID4gQ2M6IFN0ZXZl
biBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gPiBGaXhlczogNzI4MmY3NjQ1ZDA2ICgi
ZHJtL3BhbmZyb3N0OiBJbXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mgc3BhY2VzIikKPiA+IFNpZ25l
ZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4KPiBS
ZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPgo+IEknbSBu
b3Qgc3VyZSBEUk1fQVVUSCBwcm92aWRlZCB1cyB3aXRoIG11Y2ggaW4gdGhlIGZpcnN0IHBsYWNl
IChiZWNhdXNlCj4gcmVuZGVyIG5vZGVzIGNvdWxkIHNub29wL2FmZmVjdCB0aGUgcHJpbWFyeSBu
b2RlKSwgYnV0IHNpbmNlIHdlIGhhdmUKPiBhZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24gaXQncyBj
bGVhcmx5IG5vdCByZXF1aXJlZCBub3cuCj4KVGhhbmtzIFN0ZXZlLiBUaGlzIGlzIGV4YWN0bHkg
dGhlIHJlYXNvbiB3aHkgSSByZW1vdmVkIGl0IGZyb20gbW9zdApvdGhlciBkcml2ZXJzLgpUaGVy
ZSBhcmUgZXF1aXZhbGVudCB2bXdnZnggY2hhbmdlcyBhbmQgYSBEUk0gY29yZSBwYXRjaCBpbiB0
aGlzIHNlcmllcy4KCkRvIHlvdSB0aGluayB5b3UnbGwgaGF2ZSBzb21lIHRpbWUgdG8gY2hlY2sg
dGhvc2Ugb3Zlcj8gV291bGQgYmUKYW1hemluZyBpZiBJIGNhbiBhcHBseSB0aGUgbG90IGluIG9u
ZSBnbyB0byBkcm0tbWlzYy4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
