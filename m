Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5795F3B6E9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 16:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FE98921C;
	Mon, 10 Jun 2019 14:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DE38921C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:08:31 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DFF9207E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:08:31 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id 33so2532055qtr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 07:08:31 -0700 (PDT)
X-Gm-Message-State: APjAAAWELOt827r8PeJLhh7m9gJAj80EpqhciDcmOuToZzRHT4lOciV+
 /r+dUnPR7j9wqhYCcfPZJfIeFzjCujihBYOCEA==
X-Google-Smtp-Source: APXvYqwdmbIhrtP+pr3yrvnj14E//+SCvlZ+lu7Dlfsx/qGVpGKwwe0HArJH9qd9/w8lHnj9WUoC+gOD/kPrLD5jix4=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr32634676qve.148.1560175710719; 
 Mon, 10 Jun 2019 07:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
 <20190529095233.26277-3-boris.brezillon@collabora.com>
In-Reply-To: <20190529095233.26277-3-boris.brezillon@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 08:08:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJcFULN2YSu94CJXafEt5xSu+JLPXBsp584nECEafW9Cw@mail.gmail.com>
Message-ID: <CAL_JsqJcFULN2YSu94CJXafEt5xSu+JLPXBsp584nECEafW9Cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/panfrost: Add a module parameter to expose
 unstable ioctls
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560175711;
 bh=zhSQbVzzY3ThEbhr4aPdx5brOQ5ZHahWbsAR7ocDHDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CXBNPVKyIMpyee9oX5i4n7lD05Y9L18dqBFgUuKeYkFNRyU1FJDmL9vGEupC6dFiT
 ts8zDoqDMCegpbiwt17UxGUj4/e6MErmRCE+VOiNaxeLGcxXxF7JAMaItWe7sKPM9V
 y+/xRhEt36JDZha+qrNI7xMrpFXFOMfauM0V1vk8=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K0RhbmllbCBhbmQgRGF2aWQKCk9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDM6NTIgQU0gQm9yaXMg
QnJlemlsbG9uCjxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBXZSBw
bGFuIHRvIGV4cG9zZSBwZXJmb3JtYW5jZSBjb3VudGVycyB0aHJvdWdoIDIgZHJpdmVyIHNwZWNp
ZmljCj4gaW9jdGxzIHVudGlsIHRoZXJlJ3MgYSBzb2x1dGlvbiB0byBleHBvc2UgdGhlbSBpbiBh
IGdlbmVyaWMgd2F5Lgo+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8gZGVwcmVjYXRlIHRob3NlIGlv
Y3RscyB3aGVuIHRoaXMgbmV3Cj4gaW5mcmFzdHJ1Y3R1cmUgaXMgaW4gcGxhY2Ugd2UgYWRkIGFu
IHVuc2FmZSBtb2R1bGUgcGFyYW1ldGVyIHRoYXQKPiB3aWxsIGtlZXAgdGhvc2UgaW9jdGxzIGhp
ZGRlbiB1bmxlc3MgaXQncyBzZXQgdG8gdHJ1ZSAod2hpY2ggYWxzbwo+IGhhcyB0aGUgZWZmZWN0
IG9mIHRhaW50aW5nIHRoZSBrZXJuZWwpLgo+Cj4gQWxsIHVuc3RhYmxlIGlvY3RsIGhhbmRsZXJz
IHNob3VsZCB1c2UgcGFuZnJvc3RfdW5zdGFibGVfaW9jdGxfY2hlY2soKQo+IHRvIGNoZWNrIHdo
ZXRoZXIgdGhleSdyZSBzdXBwb3NlZCB0byBoYW5kbGUgdGhlIHJlcXVlc3Qgb3IgcmVqZWN0IGl0
Cj4gd2l0aCBFTk9TWVMuCj4KPiBTdWdnZXN0ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxp
a292QGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jp
cy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KCkRhbmllbCwgRGF2aWQsIEFueSBpc3N1ZXMgd2l0
aCB0aGlzIGFwcHJvYWNoIGZvciBhbiB1bnN0YWJsZSBpbnRlcmZhY2U/Cgo+IC0tLQo+IENobmFn
ZXMgaW4gdjM6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5oIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jICAgIHwgMTEgKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5oIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oCj4gaW5kZXggODA3NGYyMjEwMzRiLi4wMzExNjhmODNiZDIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCj4gQEAgLTExNSw2ICsxMTUsOCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcGFuZnJvc3RfbW9kZWxfZXEoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYsIHMzMiBpZCkKPiAgICAgICAgIHJldHVybiAhcGFuZnJvc3RfbW9kZWxfY21wKHBm
ZGV2LCBpZCk7Cj4gIH0KPgo+ICtpbnQgcGFuZnJvc3RfdW5zdGFibGVfaW9jdGxfY2hlY2sodm9p
ZCk7Cj4gKwo+ICBpbnQgcGFuZnJvc3RfZGV2aWNlX2luaXQoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYpOwo+ICB2b2lkIHBhbmZyb3N0X2RldmljZV9maW5pKHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2KTsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMK
PiBpbmRleCBkMTFlMjI4MWRkZTYuLjc1NDg4MWVjZThkNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBAQCAtMjAsNiArMjAsOSBAQAo+ICAjaW5jbHVkZSAi
cGFuZnJvc3Rfam9iLmgiCj4gICNpbmNsdWRlICJwYW5mcm9zdF9ncHUuaCIKPgo+ICtzdGF0aWMg
Ym9vbCB1bnN0YWJsZV9pb2N0bHM7Cj4gK21vZHVsZV9wYXJhbV91bnNhZmUodW5zdGFibGVfaW9j
dGxzLCBib29sLCAwNjAwKTsKPiArCj4gIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfZ2V0X3Bh
cmFtKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbGUpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fcGFuZnJvc3RfZ2V0X3BhcmFtICpwYXJh
bSA9IGRhdGE7Cj4gQEAgLTI5Nyw2ICszMDAsMTQgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0
bF9nZXRfYm9fb2Zmc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gICAg
ICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK2ludCBwYW5mcm9zdF91bnN0YWJsZV9pb2N0bF9jaGVj
ayh2b2lkKQo+ICt7Cj4gKyAgICAgICBpZiAoIXVuc3RhYmxlX2lvY3RscykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9TWVM7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4g
IHN0YXRpYyBpbnQKPiAgcGFuZnJvc3Rfb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGUpCj4gIHsKPiAtLQo+IDIuMjAuMQo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
