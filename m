Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C82AE57
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00141897B4;
	Mon, 27 May 2019 06:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B411C897B4;
 Mon, 27 May 2019 06:03:34 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id h72so3592390vkh.10;
 Sun, 26 May 2019 23:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1T7t3vTTz0shwdzCG3TjJUAaUImkyr0fiC2h61tBjXE=;
 b=JhVtIw25biav/oAckGApAdHyUyE5kRwbe5A62X3uA+GDzCApNYUCBOEggJfisqDeX3
 euajN6YLEMjP30NXhjgdPX5hIf0eoqEsGtU+fiMo+1Vnqv8WSx3oOqFr7W4VZ4M6632G
 baI6wJOAG/NppfXSZeo0HlD1URAOQFu372KCQdNJH2FnvL8IArHaqNjjSgaCLO9zUC/p
 JSadLua54BDHiSuz+30A8zUcYg86n2mY0jnQI7xhsnhF5G+3uTHndA8zUH8+hnPa7LhK
 OBH3kwKgpFm6omVyYo1y+oc2xEcBLQCXIhGMNRfiOYWTLcCRNf/KiZrnzvDYops1oSFb
 ISfA==
X-Gm-Message-State: APjAAAVzhWKNmSOOEVbyrnlLZv5Jyuw1k6CqV9Vs4L296E9sYS/XQRLa
 gEUxhJfPfvG3TFiTCLPTsG3rB6AdjxakLQTc+AM=
X-Google-Smtp-Source: APXvYqy4lCHG+K7byfehre/tmSiFInfqxdjeHMQXAnkreNLujdu+h3YsGu8NQOwxer+VpHzpAeMKNU5vApZG5EECUUM=
X-Received: by 2002:a1f:9390:: with SMTP id v138mr17944836vkd.48.1558937013713; 
 Sun, 26 May 2019 23:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
 <20190522150219.13913-2-emil.l.velikov@gmail.com>
 <CACAvsv5Z7CZOirZrRB=88rCeZt0SvBvdDjbhSpOcfE9JA20hCg@mail.gmail.com>
 <20190524151407.GA8938@arch-x1c3>
In-Reply-To: <20190524151407.GA8938@arch-x1c3>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 27 May 2019 16:03:22 +1000
Message-ID: <CACAvsv6nqEODiWPwx0w_PSZSb_n59_JZBpuyKHtx16r8KJf5AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: remove open-coded drm_invalid_op()
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1T7t3vTTz0shwdzCG3TjJUAaUImkyr0fiC2h61tBjXE=;
 b=MoP5pnKkRfHjjx/EfKgYyKmoTyUAqonBAInIcr+R5/Ue9M36b/NwDDRlOw7vqvMRmc
 JO8gNYP2vwn8o+J95VpKfGOFJrddnJ2HJN5AWxlh/gJZ0oNVQemKvXa8bTbR4Ol/QzcY
 cz+SCer+/2yl/CuhoCSmADcIsEIb5bC3gQxwzcHX/q8JIzKrq701n9VoEl+GTwEbL9Z1
 43k4UrYeU6rerNSrZEezTElSIM1C5NT6SabQRWMkPfMj7E2tS2qQPpmdTxMkIBL5DW/D
 E5spMfKZltIqI5ik9X13O9/MSSDxywZwIpi9YL8YU6TnL5Zomz+RPyq/cFmp9/sABJqB
 FOMQ==
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNSBNYXkgMjAxOSBhdCAwMToxNSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAxOS8wNS8yMywgQmVuIFNrZWdncyB3cm90ZToK
PiA+IE9uIFRodSwgMjMgTWF5IDIwMTkgYXQgMDE6MDMsIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZl
bGlrb3ZAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+ID4KPiA+ID4gQ2M6IEJlbiBTa2VnZ3MgPGJz
a2VnZ3NAcmVkaGF0LmNvbT4KPiA+ID4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9y
YS5jb20+Cj4gPiBUaGFua3MhCj4gPgo+IEZvcmdvdCB0byBtZW50aW9uLCBhbnkgb2JqZWN0aW9u
cyBpZiBJIHRha2UgdGhpcyB0aHJvdWdoIGRybS1taXNjPwo+IEknbSBhYm91dCB0byBzZW5kIGEg
bGVuZ3RoeSBzZXJpZXMgd2hpY2ggd2lsbCBjb25mbGljdCB3aXRoIHRoaXMgcGF0Y2gsCj4gYWxi
ZWl0IHRyaXZpYWxseS4KR28gZm9yIGl0LgoKPgo+IFRoYW5rcwo+IEVtaWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
