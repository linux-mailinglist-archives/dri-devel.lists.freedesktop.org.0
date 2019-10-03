Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8BC9F6E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11626E9D4;
	Thu,  3 Oct 2019 13:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D19C6E9D4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:30:00 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so5457506iof.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 06:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HKr4/cJ7iq9izM911rBXPiwq2ApQcWOC8a/94M//WE=;
 b=YOYTrmHe31HTFffZm7TD0s00yDXGcGvAib8S5bqt4C6h6iQJ8Z1TlUFS8hUT60+O+9
 0ZjiGHGg6C2Uc0+gyvmwdKzWiUsBTSmCYNavJlSNUVuF/4z6LxqpDVWRhft9VnzFI+FE
 utFLr4Ff9fciWDgn4sGvwBcYYXaLpCAuwWjAvATq7eJ9lRIPHVKDOwuQf6AYsOvOzvsD
 Si+Ix0TKfDsdXBj8XCWFEsa94j0mF68OZz+fi+jk9uLvqttduqHmE3/D/SGTFlopbZZM
 ynF27A0U5w2DYrYuWQY1QyyHYPMmEfO8eE9gqOzHsK4z6iDMCH9wHqoUkigqUCxmraPE
 kFAw==
X-Gm-Message-State: APjAAAU4E48UzoF/0DdzYGfaEBT/FgBI2ahrv5j2ivjVJdeh0AYj6BQT
 yD+yH8IHTEELjuFvUS60eHDUaYhxlyMuw2CObs8=
X-Google-Smtp-Source: APXvYqxreQxx29k2JK11Fj0++YZu+xr0zRqfLfbEWCnbZtmcqopH8qTn+g4tqQ0Hc8UkcTQPywevs2q4vO1zSd9l1Aw=
X-Received: by 2002:a92:aa87:: with SMTP id p7mr9947589ill.7.1570109400135;
 Thu, 03 Oct 2019 06:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190930164425.20282-1-ayan.halder@arm.com>
In-Reply-To: <20190930164425.20282-1-ayan.halder@arm.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 3 Oct 2019 21:29:48 +0800
Message-ID: <CAKGbVbuM9riESVq+ZZgEho3R9dymVvYaZXBUD9_-0LQmxsMZpg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9HKr4/cJ7iq9izM911rBXPiwq2ApQcWOC8a/94M//WE=;
 b=g44SEnrzA2qar8s97gk4B/ztcRe7nTTl5c5ZcAd2Fs/CLz8539Me0WXGCkws3eYC44
 nYJ856R6/Ctbz9ZanNHCEx5MgYTxSy8BWyormOEux3XHMKOt+15xHMfbJ1h7MTk5yTDg
 7o2TeE6YzevPbPGeqmrVXTUwiqZVEZZUtsDb2ZmpuFkFongRBKYVHWAdfpGS+zcYv+qV
 7yvEPlPL6GlBY/P1+kKaPrJip7yCaf8zsQpUiNm+BwBO5NVhLopDZ8H7xCjsXcVCPkyJ
 RBf4dLgTtliQZzlKAZ0S2mhxym+ilnXZSfYPXNrat0TpShqSk0/h7lOGAjzqikTXqCHH
 Q5aQ==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXlhbiwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJJ20gT0sgd2l0aCBlaXRoZXIgdGhlIHN0
YXRpYyByZXNlcnZlZCB0eXBlIHdheSBvcgp0aGUgcHJldmlvdXMgZHluYW1pYyB3YXkuIFNvIHRo
aXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KClBT
LiBmb3IgYW55b25lIHdvdWxkIGxpa2UgdG8ga25vdyB0aGUgdXNhZ2Ugb2YgdGhpcyBtb2RpZmll
ciwgbGltYSBtZXNhCmRyaXZlciBuZWVkIHRoaXMgbW9kaWZpZXIgdG8gZGVub3RlIHNvbWUgdGls
ZWQgdGV4dHVyZSBmb3JtYXQgYW5kIHNoYXJlZApiZXR3ZWVuIGNsaWVudCBhbmQgZGlzcGxheSBz
ZXJ2ZXIuCgpSZWdhcmRzLApRaWFuZwoKT24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMjo0NSBBTSBB
eWFuIEhhbGRlciA8QXlhbi5IYWxkZXJAYXJtLmNvbT4gd3JvdGU6Cj4KPiBBZGQgdGhlIERSTV9G
T1JNQVRfTU9EX0FSTV8xNlgxNl9CTE9DS19VX0lOVEVSTEVBVkVEIG1vZGlmaWVyIHRvCj4gZGVu
b3RlIHRoZSAxNngxNiBibG9jayB1LWludGVybGVhdmVkIGZvcm1hdCB1c2VkIGluIEFybSBVdGdh
cmQgYW5kCj4gTWlkZ2FyZCBHUFVzLgo+Cj4gQ2hhbmdlcyBmcm9tIHYxOi0KPiAxLiBSZXNlcnZl
ZCB0aGUgdXBwZXIgZm91ciBiaXRzIChvdXQgb2YgdGhlIDU2IGJpdHMgYXNzaWduZWQgdG8gZWFj
aCB2ZW5kb3IpCj4gdG8gZGVub3RlIHRoZSBjYXRlZ29yeSBvZiBBcm0gc3BlY2lmaWMgbW9kaWZp
ZXJzLiBDdXJyZW50bHksIHdlIGhhdmUgdHdvCj4gY2F0ZWdvcmllcyBpZSBBRkJDIGFuZCBNSVND
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUmF5bW9uZCBTbWl0aCA8cmF5bW9uZC5zbWl0aEBhcm0uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEF5YW4ga3VtYXIgaGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29t
Pgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5o
IGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBpbmRleCAzZmVlYWEzZjk4N2EuLmIx
ZDNkZTk2MTEwOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gQEAgLTY0OCw3ICs2NDgsMjEg
QEAgZXh0ZXJuICJDIiB7Cj4gICAqIEZ1cnRoZXIgaW5mb3JtYXRpb24gb24gdGhlIHVzZSBvZiBB
RkJDIG1vZGlmaWVycyBjYW4gYmUgZm91bmQgaW4KPiAgICogRG9jdW1lbnRhdGlvbi9ncHUvYWZi
Yy5yc3QKPiAgICovCj4gLSNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoX19hZmJjX21v
ZGUpICAgZm91cmNjX21vZF9jb2RlKEFSTSwgX19hZmJjX21vZGUpCj4gKwo+ICsvKgo+ICsgKiBU
aGUgdG9wIDQgYml0cyAob3V0IG9mIHRoZSA1NiBiaXRzIGFsbG90ZWQgZm9yIHNwZWNpZnlpbmcg
dmVuZG9yIHNwZWNpZmljCj4gKyAqIG1vZGlmaWVycykgZGVub3RlIHRoZSBjYXRlZ29yeSBmb3Ig
bW9kaWZpZXJzLiBDdXJyZW50bHkgd2UgaGF2ZSBvbmx5IHR3bwo+ICsgKiBjYXRlZ29yaWVzIG9m
IG1vZGlmaWVycyBpZSBBRkJDIGFuZCBNSVNDLiBXZSBjYW4gaGF2ZSBhIG1heGltdW0gb2Ygc2l4
dGVlbgo+ICsgKiBkaWZmZXJlbnQgY2F0ZWdvcmllcy4KPiArICovCj4gKyNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfQVJNX0NPREUodHlwZSwgdmFsKSBcCj4gKyAgICAgICBmb3VyY2NfbW9kX2NvZGUo
QVJNLCAoKF9fdTY0KXR5cGUgPDwgNTIpIHwgKCh2YWwpICYgMHgwMDBmZmZmZmZmZmZmZmZmVUxM
KSkKPiArCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfQUZCQyAweDAwCj4gKyNk
ZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQyAweDAxCj4gKwo+ICsjZGVmaW5lIERS
TV9GT1JNQVRfTU9EX0FSTV9BRkJDKF9fYWZiY19tb2RlKSBcCj4gKyAgICAgICBEUk1fRk9STUFU
X01PRF9BUk1fQ09ERShEUk1fRk9STUFUX01PRF9BUk1fVFlQRV9BRkJDLCBfX2FmYmNfbW9kZSkK
Pgo+ICAvKgo+ICAgKiBBRkJDIHN1cGVyYmxvY2sgc2l6ZQo+IEBAIC03NDIsNiArNzU2LDE3IEBA
IGV4dGVybiAiQyIgewo+ICAgKi8KPiAgI2RlZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAo
MVVMTCA8PCAxMSkKPgo+ICsvKgo+ICsgKiBBcm0gMTZ4MTYgQmxvY2sgVS1JbnRlcmxlYXZlZCBt
b2RpZmllcgo+ICsgKgo+ICsgKiBUaGlzIGlzIHVzZWQgYnkgQXJtIE1hbGkgVXRnYXJkIGFuZCBN
aWRnYXJkIEdQVXMuIEl0IGRpdmlkZXMgdGhlIGltYWdlCj4gKyAqIGludG8gMTZ4MTYgcGl4ZWwg
YmxvY2tzLiBCbG9ja3MgYXJlIHN0b3JlZCBsaW5lYXJseSBpbiBvcmRlciwgYnV0IHBpeGVscwo+
ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiArICovCj4gKyNkZWZpbmUgRFJNX0ZP
Uk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgXAo+ICsgICAgICAgRFJNX0ZP
Uk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQywgMVVMTCkKPiAr
Cj4gKwo+ICAvKgo+ICAgKiBBbGx3aW5uZXIgdGlsZWQgbW9kaWZpZXIKPiAgICoKPiAtLQo+IDIu
MjMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
