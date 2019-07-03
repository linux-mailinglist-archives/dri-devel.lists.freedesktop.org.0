Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55615EB0A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 20:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6E76E184;
	Wed,  3 Jul 2019 18:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542B6E184
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 18:02:44 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n5so6914295ioc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 11:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lGD5x0fixG7eCvn8wfznKG3XFZqIHDTN6YyrwUc2rM=;
 b=Z7tNDE6zlhYZ/J/9ugM/5V6sZTl76cNaaQj4exVFPPEpi4tYduDWtX6SHxxtiE6jEq
 za10MbaxGFPfjt0BoEBOfX88HTplN9I+qs4Z2avfSFcrKchmLWr6vnxA6cXNkS3ieChc
 h4zCFqY7ewq84pEEvHTNXf2dbg9lzBYS73+k1ffs+MekOfMLnVGh/ztuQ5NSRSuNMBIw
 O5lkdjbMHyK6hjYTuvlmDXPUXjaj1U2Svod2KWjh09jsCO98Uv4OhY7jlz/YlR4ujiMD
 KWcuRanXKtRjnq6filCH15W5pjjX7pQoPVKzUnYjhr6jFUvDEoD4UHHuwQ2nwmCCDIol
 JcCg==
X-Gm-Message-State: APjAAAVorxkn0xcibX34G3XMdvNWY57nRRvNE7mhYcqmQCXcBq8HpULl
 5JNOFoRFp7Dex613jfQYsKee/86JVrQj6Qb1oTw=
X-Google-Smtp-Source: APXvYqwtsJYFM4tLDw4ftXCfYIpH9Xg25kh7AlfCvOCOFJ7kerq8S60yd5DQ+VmMExC39g3dDiCVCaM4o7CoCuOlUPI=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr38048015ios.84.1562176964009; 
 Wed, 03 Jul 2019 11:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-7-kraxel@redhat.com>
In-Reply-To: <20190702141903.1131-7-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Jul 2019 11:02:33 -0700
Message-ID: <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve, unreserve}
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8lGD5x0fixG7eCvn8wfznKG3XFZqIHDTN6YyrwUc2rM=;
 b=iKihlh6l1s6aC19KE31uBgziYsN9WXu+n6WlT9ZjzAHZ4SVHuBCDBhXOhvNAUqbZLT
 pRP80Lx1QFP2fg+pVhGmPiywK1bO3kKIVCxpp3ZKimuVdwbgsVkYrVgbSmOaBdiq88fC
 RGWeOE8MZFeEK8+FVZQgxWtYLP3lJYZhamHU6FTY32RqlOKiS1bM5q2UBnihIw8c6Pjy
 jHXVACNS232kKnLp2EeKqun+mQ5GWmNbF4WDKIH8HmG3v3pn0KkFDvk1b14AJBK2MQxw
 PxbHNwmDw87GzLgazKKbKTol2ZUxNaSLS1C6NYyegJE6QRDjgTF3QwY1zDW0WCv5eRHS
 FGjg==
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCA3OjE5IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IENhbGwgcmVzZXJ2YXRpb25fb2JqZWN0XyogZGlyZWN0bHkgaW5z
dGVhZAo+IG9mIHVzaW5nIHR0bV9ib197cmVzZXJ2ZSx1bnJlc2VydmV9Lgo+Cj4gdjQ6IGNoZWNr
IGZvciBFSU5UUiBvbmx5Lgo+IHYzOiBjaGVjayBmb3IgRUlOVFIgdG9vLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rydi5oCj4gaW5kZXggMDZjYzBlOTYxZGY2Li4wN2Y2MDAxZWE5MWUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gQEAgLTQwMiw5ICs0MDIsOSBAQCBzdGF0aWMg
aW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29i
amVjdCAqYm8pCj4gIHsKPiAgICAgICAgIGludCByOwo+Cj4gLSAgICAgICByID0gdHRtX2JvX3Jl
c2VydmUoJmJvLT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKPiArICAgICAgIHIgPSByZXNlcnZh
dGlvbl9vYmplY3RfbG9ja19pbnRlcnJ1cHRpYmxlKGJvLT5nZW1fYmFzZS5yZXN2LCBOVUxMKTsK
Q2FuIHlvdSBlbGFib3JhdGUgYSBiaXQgYWJvdXQgaG93IFRUTSBrZWVwcyB0aGUgQk9zIGFsaXZl
IGluLCBmb3IKZXhhbXBsZSwgdmlydGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3RfaW9jdGw/ICBJ
biB0aGF0IGZ1bmN0aW9uLCBvbmx5CnRocmVlIFRUTSBmdW5jdGlvbnMgYXJlIGNhbGxlZDogdHRt
X2JvX3Jlc2VydmUsIHR0bV9ib192YWxpZGF0ZSwgYW5kCnR0bV9ib191bnJlc2VydmUuICBJIGFt
IGN1cmlvdXMgaG93IHRoZXkga2VlcCB0aGUgQk8gYWxpdmUuCgo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KHIgIT0gMCkpIHsKPiAtICAgICAgICAgICAgICAgaWYgKHIgIT0gLUVSRVNUQVJUU1lTKSB7
Cj4gKyAgICAgICAgICAgICAgIGlmIChyICE9IC1FSU5UUikgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRldiA9Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBiby0+Z2VtX2Jhc2UuZGV2LT5kZXZfcHJpdmF0ZTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXZfZXJyKHFkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFpbGVkXG4i
LCBibyk7Cj4gQEAgLTQxNiw3ICs0MTYsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1
X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCj4KPiAgc3RhdGlj
IGlubGluZSB2b2lkIHZpcnRpb19ncHVfb2JqZWN0X3VucmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dw
dV9vYmplY3QgKmJvKQo+ICB7Cj4gLSAgICAgICB0dG1fYm9fdW5yZXNlcnZlKCZiby0+dGJvKTsK
PiArICAgICAgIHJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPmdlbV9iYXNlLnJlc3YpOwo+
ICB9Cj4KPiAgLyogdmlyZ2wgZGVidWZzICovCj4gLS0KPiAyLjE4LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
