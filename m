Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6970957
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE0989DEC;
	Mon, 22 Jul 2019 19:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA489DEA;
 Mon, 22 Jul 2019 19:10:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s15so15009393wmj.3;
 Mon, 22 Jul 2019 12:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVYcCckX+JiVpMSlYoHq4KH9qszVNVB70AhdXAa1wJQ=;
 b=Zml9P8ovvFKebwFCfwA+GwbwXL2d5JEz6yJ0ovAhERmA2EqPSdiYgQxjP2nQ80aXGz
 D38nTHhxJVjMgLo2QQGmNw0gutF7BiRueYcPnOvjVp9OSLMu6nhZLHR6Z5bRHTh8uj8V
 g1oN+sYYDmELV9sJH6fIG4JalF31GWqahPmqw33IoRwOehxmwphmIfxExIk89yhp/6B4
 6UExvT6RsO0i3kHVCdKtl22PzgrlH2/BECw3d8rKGlwLpztUy+iJM/dmiB4kveKupIgn
 4eui3Y7x8njmXjmlXwq1EYX1+WEmqUmyVVjvBcNwejBD0ZF0GsuiGR9kutq2tWeDD6Fo
 Lx7A==
X-Gm-Message-State: APjAAAV/t8RsxpC+tDubq3Tje+0FEnXwIZi272gG8dIM7SPmbcdVIRiC
 55UPszwr4UipXqQj11ouQim4icdTDI/gVQ4RzRU=
X-Google-Smtp-Source: APXvYqxOEcG0mMOrFl56XRrzHBF5u5axdSumScYcjEH9nwQRrxRPxxCVtT76ftWqC0vQG4IXEFFcHxbx9pdIOoye/Ak=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr61322784wmc.34.1563822632926; 
 Mon, 22 Jul 2019 12:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190721214935.GA910@embeddedor>
In-Reply-To: <20190721214935.GA910@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2019 15:10:20 -0400
Message-ID: <CADnq5_OTmx==m+1fJbf1PxPhPM0H0O8GRjq4eWeX6sw889YPrA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix missing break in switch statement
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aVYcCckX+JiVpMSlYoHq4KH9qszVNVB70AhdXAa1wJQ=;
 b=qub/iKrFGQDkwWhl+TYx1KEcXLO9fhwX0W3Mh/KuF+4I+fObmrUXyUTCnDVgRw7IxL
 9R1o69vAhHi+rIbwOWA/3FRnYQxL/H8nti83VcnlUQuU12z7t2VFgPiI9XbZbxP+VEnj
 o12Swo/OjV31OZho6aBoQHzug5tjcqwoKIMwNAFPZUyGJwzy0AbM9dTtk2bN3YZJB4oI
 NaA3tTFtJQv93nmLTl6RrbeGTsUV3A9x5NuYFLhViv2m1hAU1lzyA3Ix6kFU8YAEmEf5
 FB0aOnP9hEJobyKxxqnLyG/E/QtYCv6KhapPylSVoxaYv6edAddMdIpGq+XKT3cH6YbN
 htCA==
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Philip Cox <Philip.Cox@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgNjoxMiBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+IEFkZCBtaXNzaW5nIGJyZWFrIHN0YXRlbWVu
dCBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSBjb2RlIGZyb20gZmFsbGluZwo+IHRocm91Z2ggdG8g
Y2FzZSBDSElQX05BVkkxMC4KPgo+IFRoaXMgYnVnIHdhcyBmb3VuZCB0aGFua3MgdG8gdGhlIG9u
Z29pbmcgZWZmb3J0cyB0byBlbmFibGUKPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Cj4gRml4
ZXM6IDE0MzI4YWE1OGNlNSAoImRybS9hbWRrZmQ6IEFkZCBuYXZpMTAgc3VwcG9ydCB0byBhbWRr
ZmQuICh2MykiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
R3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KCkFwcGxpZWQuICBU
aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3Jh
dC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCj4gaW5kZXggNzkyMzcxNDQyMTk1Li40ZTNmYzI4NGY2
YWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKPiBAQCAtNjY4LDYg
KzY2OCw3IEBAIHN0YXRpYyBpbnQga2ZkX2ZpbGxfZ3B1X2NhY2hlX2luZm8oc3RydWN0IGtmZF9k
ZXYgKmtkZXYsCj4gICAgICAgICBjYXNlIENISVBfUkFWRU46Cj4gICAgICAgICAgICAgICAgIHBj
YWNoZV9pbmZvID0gcmF2ZW5fY2FjaGVfaW5mbzsKPiAgICAgICAgICAgICAgICAgbnVtX29mX2Nh
Y2hlX3R5cGVzID0gQVJSQVlfU0laRShyYXZlbl9jYWNoZV9pbmZvKTsKPiArICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIENISVBfTkFWSTEwOgo+ICAgICAgICAgICAgICAgICBw
Y2FjaGVfaW5mbyA9IG5hdmkxMF9jYWNoZV9pbmZvOwo+ICAgICAgICAgICAgICAgICBudW1fb2Zf
Y2FjaGVfdHlwZXMgPSBBUlJBWV9TSVpFKG5hdmkxMF9jYWNoZV9pbmZvKTsKPiAtLQo+IDIuMjIu
MAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
