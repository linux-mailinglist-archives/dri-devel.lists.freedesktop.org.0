Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C27A9A515
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 03:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED59C6EB9E;
	Fri, 23 Aug 2019 01:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C106EB9E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 01:53:00 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4024B23404
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 01:53:00 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id g4so4977qtq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 18:53:00 -0700 (PDT)
X-Gm-Message-State: APjAAAUOA6sJF9Cx0THNY3aF378udFdvGml+xWpIji2IPm6zgl9l9BJk
 J+8UhZVMUSuG8TXXTqfp2GZRmEmT2HQgvUShUg==
X-Google-Smtp-Source: APXvYqyft5c7abf/T+bpSEI9M+ywHq6Wph5MWDZMqP+5YUyAX8skWG5A3788yiHHwtXhbqi9IRuH2qDSGZMrPQLxNCg=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr2664407qto.224.1566525179427; 
 Thu, 22 Aug 2019 18:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190822091512.GA32661@mwanda>
 <20190822093218.26014-1-steven.price@arm.com>
In-Reply-To: <20190822093218.26014-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Aug 2019 20:52:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+1-qUxF3FSocVis6h4HV-=qnzWfK13hDq+Ns9kNEZuUg@mail.gmail.com>
Message-ID: <CAL_Jsq+1-qUxF3FSocVis6h4HV-=qnzWfK13hDq+Ns9kNEZuUg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Add missing check for pfdev->regulator
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566525180;
 bh=PJMc6ZKXa/g7b223/+IaOfRLu5NCsAji7zbyi99Rxnw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xfMBdrqoXmc7m3LbbE4byZwHzsPlVQD8gMPd1xbVbzV/s7O2qOwPeqOPvCZU7Qx2m
 oF/8cBtjKeFn7jXuSQaPXd977axDelbI4W973BABG4vUsZxnVDeRu2MT8tlqq0rJec
 j4VWYVgrGY8vxY6mbVqTTKA3OQNUeOhexOg0nMug=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNDozMiBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmlj
ZUBhcm0uY29tPiB3cm90ZToKPgo+IFdoZW4gbW9kaWZ5aW5nIHBhbmZyb3N0X2RldmZyZXFfdGFy
Z2V0KCkgdG8gc3VwcG9ydCBhIGRldmljZSB3aXRob3V0IGEKPiByZWd1bGF0b3IgZGVmaW5lZCBJ
IG1pc3NlZCB0aGUgY2hlY2sgb24gdGhlIGVycm9yIHBhdGguIExldCdzIGFkZCBpdC4KPgo+IFJl
cG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gRml4
ZXM6IGUyMWRkMjkwODgxYiAoImRybS9wYW5mcm9zdDogRW5hYmxlIGRldmZyZXEgdG8gd29yayB3
aXRob3V0IHJlZ3VsYXRvciIpCj4gU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpMb29rcyBmaW5lIHRvIG1lLCBidXQgc2VlbXMgdG8gYmUgZGVsYXll
ZCBnZXR0aW5nIHRvIHRoZSBsaXN0IGFuZApwYXRjaHdvcmsuIEknbSBndWVzc2luZyB5b3UncmUg
bm90IHN1YnNjcmliZWQgdG8gZHJpLWRldmVsIGJlY2F1c2UgYWxsCnlvdXIgcGF0Y2hlcyBzZWVt
IHRvIGdldCBkZWxheWVkLgoKUm9iCgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggNzEwZDkwM2Y4ZTBkLi5hMWY1ZmE2YTc0MmEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtNTMs
OCArNTMsMTAgQEAgc3RhdGljIGludCBwYW5mcm9zdF9kZXZmcmVxX3RhcmdldChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgKmZyZXEsCj4gICAgICAgICBpZiAoZXJyKSB7Cj4gICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiQ2Fubm90IHNldCBmcmVxdWVuY3kgJWx1ICglZClc
biIsIHRhcmdldF9yYXRlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVycik7Cj4gLSAgICAg
ICAgICAgICAgIHJlZ3VsYXRvcl9zZXRfdm9sdGFnZShwZmRldi0+cmVndWxhdG9yLCBwZmRldi0+
ZGV2ZnJlcS5jdXJfdm9sdCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBmZGV2LT5kZXZmcmVxLmN1cl92b2x0KTsKPiArICAgICAgICAgICAgICAgaWYgKHBmZGV2LT5y
ZWd1bGF0b3IpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yX3NldF92b2x0YWdl
KHBmZGV2LT5yZWd1bGF0b3IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBmZGV2LT5kZXZmcmVxLmN1cl92b2x0LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwZmRldi0+ZGV2ZnJlcS5jdXJfdm9sdCk7Cj4gICAg
ICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gICAgICAgICB9Cj4KPiAtLQo+IDIuMjAuMQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
