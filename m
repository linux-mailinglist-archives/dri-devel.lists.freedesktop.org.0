Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6161325B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 18:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792AF6E820;
	Fri,  3 May 2019 16:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46056E820
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:41:09 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id p18so8639559itm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 09:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fjLoGVU1gaH6UfBmo61XmqKTUT9KNrV65aNqszwWgfM=;
 b=tPV432WURublXmcjoJpHByI4GDo8zfrfFzTzqyNYjy6Z2tzDYIgTupo+YwKBac07yi
 Gla8qa5C/TfHZcp3/5qu3tdRYmcqLS1le+z+1m7Do3uZGxi07MQfrIFO+GzY8FyKK246
 qK8qbUDq0eMUG5aLm01WGok0YSeIKoi4wbdbyIQ94s1Kh18954RCxdhbPPyC7NibFN1S
 u7Oc7OJeSfw40Jk80qGpxq9BtJOWmnuZ4NZ8ZP0bOGS59e+YTS+W2RR1HYnPpBTkLxal
 i5EtEDQn29wx6qHJR6S2UoEXLY9Qa7N4XoggrNABsl1cbY+t5/fYLCMC30E8Pabtz5sr
 xNNw==
X-Gm-Message-State: APjAAAXPToyruWFlnJcvycjUcolEMM4vcFcQHlAfgtaHAjDpOqApzvXW
 Xec1IC8oLbZKtX9dt0MTlaGIydFucmfJ4NwGoiI=
X-Google-Smtp-Source: APXvYqwlBSYQlISp0r6yiSxEkv5WvdDoLXFua6M0BKcjdBpadMAOqsRgC+U4oGHSsAWc7wjocOGcQ6Ri66hnffjOIss=
X-Received: by 2002:a24:e517:: with SMTP id g23mr7579662iti.113.1556901669124; 
 Fri, 03 May 2019 09:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190503163804.31922-1-robert.foss@collabora.com>
In-Reply-To: <20190503163804.31922-1-robert.foss@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 May 2019 09:40:58 -0700
Message-ID: <CAPaKu7SfkUN4FBQ5Xm3zfdvvbcvBAWDz0k2FVdn8TNZWwiV-tg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Remove redundant return type
To: Robert Foss <robert.foss@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fjLoGVU1gaH6UfBmo61XmqKTUT9KNrV65aNqszwWgfM=;
 b=UjsUVC5iF4LqG2oy2Fm/ty3L+OVTzO7Q9pu8WST7JLtlmqUcvycVQaowzWwK8cBNA1
 3/cE8gzLPDRvY/Cdu/FXqVqs1fWaO7sWYqX1Zlv1W9f2TkLRuIT696Hs0aiNsE67DapD
 5LWVUIYJ9GD2e5kf5BVXRJqTlR8K30tHtJ+7VmHvjg7q7tiB7Y13GZrGiS3o5TpYNwCV
 8wPd9lsIcELP0qtfG5Jyi7bnWTmO/QFzwQKZ6GWVjHU1PFt53mB/vo0V/0hBslFfLsLR
 oVmZYAkMwI1n7BH0GYrKQAjGHJ4IOy5QA4pt9zbRrWMqbXIv7jDWlkd2SdFMkH9q3eGW
 +5OA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA5OjM4IEFNIFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0Bj
b2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IHZpcnRpb19ncHVfZmVuY2VfZW1pdCgpIGFsd2F5cyBy
ZXR1cm5zIDAsIHNpbmNlIGl0Cj4gaGFzIG5vIGVycm9yIHBhdGhzLgo+Cj4gQ29uc2VxdWVudGx5
IG5vIGNhbGxzIGZvciB2aXJ0aW9fZ3B1X2ZlbmNlX2VtaXQoKQo+IHVzZSB0aGUgcmV0dXJuIHZh
bHVlLCBhbmQgaXQgY2FuIGJlIHJlbW92ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgRm9z
cyA8cm9iZXJ0LmZvc3NAY29sbGFib3JhLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEVtaWwgVmVsaWtv
diA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBDaGlhLUkgV3UgPG9s
dmFmZmVAZ21haWwuY29tPgo+IC0tLQo+Cj4gVGhpcyBwYXRjaCB3YXMgc3VnZ2VzdGVkIGluIHRo
aXMgZW1haWwgdGhyZWFkOgo+Cj4gW1BBVENIXSBkcm0vdmlydGlvOiBhbGxvY2F0ZSBmZW5jZXMg
d2l0aCBHRlBfS0VSTkVMCj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVs
L21zZzIwODUzNi5odG1sCj4KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5o
ICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIHwgMyAr
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gaW5kZXggZDU3N2NiNzZmNWFkLi45
YmM1Njg4N2ZiZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gQEAg
LTMzNCw3ICszMzQsNyBAQCBpbnQgdmlydGlvX2dwdV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gIC8qIHZpcnRpb19ncHVfZmVuY2UuYyAqLwo+
ICBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqdmlydGlvX2dwdV9mZW5jZV9hbGxvYygKPiAgICAg
ICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpOwo+IC1pbnQgdmlydGlvX2dwdV9m
ZW5jZV9lbWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCj4gK3ZvaWQgdmlydGlv
X2dwdV9mZW5jZV9lbWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hkciAqY21kX2hkciwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNlICpmZW5j
ZSk7Cj4gIHZvaWQgdmlydGlvX2dwdV9mZW5jZV9ldmVudF9wcm9jZXNzKHN0cnVjdCB2aXJ0aW9f
Z3B1X2RldmljZSAqdmRldiwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYwo+
IGluZGV4IDIxYmQ0YzRhMzJkMS4uZTA3NDRhYzc2OGNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2ZlbmNlLmMKPiBAQCAtODEsNyArODEsNyBAQCBzdHJ1Y3QgdmlydGlvX2dw
dV9mZW5jZSAqdmlydGlvX2dwdV9mZW5jZV9hbGxvYyhzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2Ug
KnZnZGV2KQo+ICAgICAgICAgcmV0dXJuIGZlbmNlOwo+ICB9Cj4KPiAtaW50IHZpcnRpb19ncHVf
ZmVuY2VfZW1pdChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICt2b2lkIHZpcnRp
b19ncHVfZmVuY2VfZW1pdChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZpcnRpb19ncHVfY3RybF9oZHIgKmNtZF9oZHIs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqZmVu
Y2UpCj4gIHsKPiBAQCAtOTYsNyArOTYsNiBAQCBpbnQgdmlydGlvX2dwdV9mZW5jZV9lbWl0KHN0
cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCj4KPiAgICAgICAgIGNtZF9oZHItPmZsYWdz
IHw9IGNwdV90b19sZTMyKFZJUlRJT19HUFVfRkxBR19GRU5DRSk7Cj4gICAgICAgICBjbWRfaGRy
LT5mZW5jZV9pZCA9IGNwdV90b19sZTY0KGZlbmNlLT5zZXEpOwo+IC0gICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+ICB2b2lkIHZpcnRpb19ncHVfZmVuY2VfZXZlbnRfcHJvY2VzcyhzdHJ1Y3Qgdmly
dGlvX2dwdV9kZXZpY2UgKnZnZGV2LAo+IC0tCj4gMi4yMC4xCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
