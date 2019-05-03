Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAA1349D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 23:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA308928F;
	Fri,  3 May 2019 21:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F00E8928F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 21:04:38 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B96A20B7C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 21:04:38 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id j6so8382788qtq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 14:04:38 -0700 (PDT)
X-Gm-Message-State: APjAAAUY4jej/rxgxTgj4mZR5nIWOW2w9ORafEwASLZcsPMAPotUSZ5w
 Js5cfyEE/yunewNA4Z9KsQNRUZ+SgxvGqLneHg==
X-Google-Smtp-Source: APXvYqzDhtomvD/UG5VnDEpd3rpo/VWczm2g7M/gKQWkAodiJL3Pto+4N35kj/6+1fphl2pHAnNd4smJ9Xi0ZDsKGXk=
X-Received: by 2002:aed:37a1:: with SMTP id j30mr10600080qtb.144.1556917477297; 
 Fri, 03 May 2019 14:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556195258.git.robin.murphy@arm.com>
In-Reply-To: <cover.1556195258.git.robin.murphy@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 May 2019 16:04:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+-21xWqPhSTeG8Juk1fhfsBDWy9-pFwVuHgGq7JnEs-w@mail.gmail.com>
Message-ID: <CAL_Jsq+-21xWqPhSTeG8Juk1fhfsBDWy9-pFwVuHgGq7JnEs-w@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panfrost: Misc. fixes and cleanups
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556917478;
 bh=JZCFnc067dKfhEib7cBD2TbcPo3mqnplGNRx6MkaGnY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OBFI5kytvk0xfv4Cyl6T8JFPgs1BPjdH/kjMrYJky4rvSep2i52OVFXOwgSHZjwgA
 FK6cYstSyOk2dQin2sdUYLE4p3Glf41bfCgh61KQvluNWw9yQhWLxNs5eTDUTuAWCD
 17i/VEgPmo667pFdLuqE4r4lnH5f/pi35HOJxkeY=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAxMDozMSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gVGhlc2UgYXJlIGEgZmV3IHRyaXZpYWwgZml4
ZXMgYW5kIGNsZWFudXBzIGZyb20gcGxheWluZyB3aXRoIHRoZQo+IHBhbmZyb3N0IGtlcm5lbCBk
cml2ZXIgb24gYW4gQXJtIEp1bm8gYm9hcmQuIE5vdCB0aGF0IGFueW9uZSBoYXMgZXZlcgo+IGNh
cmVkIG11Y2ggYWJvdXQgdGhlIGJ1aWx0LWluIEdQVSBvbiBKdW5vLCBidXQgaXQncyBhdCBsZWFz
dCBhIHNvbWV3aGF0Cj4gaW50ZXJlc3RpbmcgcGxhdGZvcm0gZnJvbSB0aGUga2VybmVsIGRyaXZl
ciBwZXJzcGVjdGl2ZSBmb3IgaGF2aW5nCj4gSS9PIGNvaGVyZW5jeSwgUkFNIGFib3ZlIDRHQiwg
YW5kIERWRlMgYWJzdHJhY3RlZCBiZWhpbmQgYSBmaXJtd2FyZQo+IGludGVyZmFjZS4KPgo+IFJv
YmluLgo+Cj4KPiBSb2JpbiBNdXJwaHkgKDQpOgo+ICAgZHJtL3BhbmZyb3N0OiBTZXQgRE1BIG1h
c2tzIGVhcmxpZXIKPiAgIGRybS9wYW5mcm9zdDogRGlzYWJsZSBQTSBvbiBwcm9iZSBmYWlsdXJl
Cj4gICBkcm0vcGFuZnJvc3Q6IERvbid0IHNjcmVhbSBhYm91dCBkZWZlcnJlZCBwcm9iZQo+ICAg
ZHJtL3BhbmZyb3N0OiBTaG93IHN0b3JlZCBmZWF0dXJlIHJlZ2lzdGVycwo+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDEyICsrKysrLS0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMgfCAxOSArKysrKysrKysrKystLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpTZXJpZXMgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LWZpeGVzLgoKUm9iCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
