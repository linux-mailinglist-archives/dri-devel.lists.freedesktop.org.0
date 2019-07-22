Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B9703F8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2589CC1;
	Mon, 22 Jul 2019 15:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC7D89CC1;
 Mon, 22 Jul 2019 15:39:03 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id s4so15476824uad.7;
 Mon, 22 Jul 2019 08:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hgZcpVVp/dg4wOwWMBzkRISvw7hgEO99JBvJotv5aqQ=;
 b=uDWu6+PE1coow2uy+4E+3rb98hHDpwVrVVSfGE07GcFfrpS2SLrNeM7Ij7PaC8flhj
 WL1kyoy5jvm6GhWtrRMYE0DIDu75FGED0pnpdqN9DWpFtl5yIAGVqNrHTJT13a3VR0H0
 TkXWsS9eBUBudls7TlEUNESTIy9lGTkcqtsPlrxA33CDbp3j2qxTad6f6iS5CXps9iyh
 jIHHOD4KASwbF6mxWkbMlPbChcHpwP/0LJg1wC6HCicgI0ot0L27KlLFA1BPJTZkJHQv
 OkgQDW2P0sjNXTarp/7ldQ1yslKNatrQ7dzEQE6PldkAgcwDENpBraRtwV+X+fPlBDqi
 QJug==
X-Gm-Message-State: APjAAAWd9jZUauP9yb0MMcNtsqZdJea7Lemap7wbWns13dhUI7VYmg/T
 FBDopRgvTPuObWEt/iB3w1aw7HeRx622w877y3Q=
X-Google-Smtp-Source: APXvYqwVb7uqYo4/pPz8YPf3YkfdCu6VKgGFbbYJ8tdXCjKcxw3QyL/vbgd+IjqvcBkpgpjP8ICK4P7MoiA4p0GfhD8=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr42116368uaq.106.1563809942711; 
 Mon, 22 Jul 2019 08:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
In-Reply-To: <20190720084527.12593-2-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 Jul 2019 16:38:39 +0100
Message-ID: <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hgZcpVVp/dg4wOwWMBzkRISvw7hgEO99JBvJotv5aqQ=;
 b=WRe4S6/O+33FveRFAhswhtJiChU/64WIrYuxn9IBu8c3ROIscVDDubooChjPOoZjv+
 heTR2+aHt8CbJN5+Wb3P41C6A7NWOwywH+vBZBkZ9bpn1YZUcDFNroPAgGGeDQ+mbj5a
 0iENBQZAFGX07+z2jTXwXZMN2f5WWhqF4OKY89KVpIH8JrlK09HSO+Gkl/oU9jXpfpgR
 873B7mZtbDz1KNoVpOSqYwQLM6XuuV3FvQQ2GaOBZ15QNPG1kHFdFzlMUp3jxDsyuaUK
 aY1Nn9f7qfd1u1rrqix7uqQukIbXCS8qD7xCE3wZy6bGs0UGRNaqdleCrPY8zc5htZS6
 /LEQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMCBKdWwgMjAxOSBhdCAwOTo0NiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IFRoZSBEUk1fUkVBRCwgRFJNX1dSSVRFIG1hY3JvcyBjb21lcyBmcm9t
IHRoZSBkZXByZWNhdGVkIGRybV9vc19saW51eC5oCj4gaGVhZGVyIGZpbGUuIFJlbW92ZSB0aGVp
ciB1c2UgdG8gcmVtb3ZlIHRoaXMgZGVwZW5kZW5jeS4KPgo+IFJlcGxhY2UgdGhlIHVzZSBvZiB0
aGUgbWFjcm9zIHdpdGggb3BlbiBjb2RlZCB2YXJpYW50cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogS2V2aW4gQnJhY2UgPGtldmluYnJh
Y2VAZ214LmNvbT4KPiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pgo+IENjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4g
Q2M6IE1pa2UgTWFyc2hhbGwgPGh1YmNhcEBvbW5pYm9uZC5jb20+Cj4gQ2M6IElyYSBXZWlueSA8
aXJhLndlaW55QGludGVsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPiBDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4K
PiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmggfCAxNSArKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
cnYuaAo+IGluZGV4IDZkMWFlODM0NDg0Yy4uZDVhMmIxZmZkOGMxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZHJ2LmgKPiBAQCAtMTE1LDEwICsxMTUsMTcgQEAgZW51bSB2aWFfZmFtaWx5IHsKPiAgLyog
VklBIE1NSU8gcmVnaXN0ZXIgYWNjZXNzICovCj4gICNkZWZpbmUgVklBX0JBU0UgKChkZXZfcHJp
di0+bW1pbykpCj4KPiAtI2RlZmluZSBWSUFfUkVBRChyZWcpICAgICAgICAgIERSTV9SRUFEMzIo
VklBX0JBU0UsIHJlZykKPiAtI2RlZmluZSBWSUFfV1JJVEUocmVnLCB2YWwpICAgIERSTV9XUklU
RTMyKFZJQV9CQVNFLCByZWcsIHZhbCkKPiAtI2RlZmluZSBWSUFfUkVBRDgocmVnKSAgICAgICAg
IERSTV9SRUFEOChWSUFfQkFTRSwgcmVnKQo+IC0jZGVmaW5lIFZJQV9XUklURTgocmVnLCB2YWwp
ICAgRFJNX1dSSVRFOChWSUFfQkFTRSwgcmVnLCB2YWwpCj4gKyNkZWZpbmUgVklBX1JFQUQocmVn
KSBcCj4gKyAgICAgICByZWFkbCgoKHZvaWQgX19pb21lbSAqKVZJQV9CQVNFLT5oYW5kbGUpICsg
KHJlZykpCj4gKwo+ICsjZGVmaW5lIFZJQV9XUklURShyZWcsIHZhbCkgXAo+ICsgICAgICAgd3Jp
dGVsKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+aGFuZGxlKSArIChyZWcpKQo+ICsK
PiArI2RlZmluZSBWSUFfUkVBRDgocmVnKSBcCj4gKyAgICAgICByZWFkYigoKHZvaWQgX19pb21l
bSAqKVZJQV9CQVNFLT5oYW5kbGUpICsgKHJlZykpCj4gKwo+ICsjZGVmaW5lIFZJQV9XUklURTgo
cmVnLCB2YWwpIFwKPiArICAgICAgIHdyaXRlYih2YWwsICgodm9pZCBfX2lvbWVtICopVklBX0JB
U0UtPmhhbmRsZSkgKyAocmVnKSkKPgpJTUhPIGEgZmFyIGJldHRlciBpZGVhIGlzIHRvIGV4cGFu
ZCB0aGVzZSBtYWNyb3MgYXMgc3RhdGljIGlubGluZSBmdW5jdGlvbnMuClRoZSBleHRyYSBib251
cyBoZXJlIGlzIHRoYXQgdGhlIHBzZXVkby1tYWdpY2FsIFZJQV9CQVNFIHdpbGwgYWxzbyBkaXNh
cHBlYXIuCgpTaW5jZSBhbGwgdGhlIFZJQV9SRUFEOCBhcmUgdXNlZCBmb3IgbWFza2luZywgb25l
IG1pZ2h0IGFzIHdlbGwgZHJvcAp0aGVtIGluIGZhdm91ciBvZiB2aWFfbWFzaygpLgoKV0RZVD8K
LUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
