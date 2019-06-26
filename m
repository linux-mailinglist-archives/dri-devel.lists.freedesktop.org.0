Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F110C571DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 21:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0576E4F3;
	Wed, 26 Jun 2019 19:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7B16E4F3;
 Wed, 26 Jun 2019 19:35:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c66so3311458wmf.0;
 Wed, 26 Jun 2019 12:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5SrQ5SYua3CBmwCDqScHd2/Bwr4oTQ8I2YEBgR7+gA=;
 b=M5wgJxI/ZN1tiEJ6WyOKaWKP3yqm5oLK/XAGjNOVn2mZxEjZspq/qRsGy8vGezUxrF
 d7P2EZBXxZ2E1N2tz/7/K2dmOwED8VEGAqDdzfTPWTVDHBIPTg1cmV3vUkQXHTHy/elj
 9/tIkbQaJD9PSuHtAL51xNxNBjb+tYRyysoZ8DU4QqjCcQh0EYDBIgY4TeK+FYfinHuO
 s8MeWSW7yp0NkE52tX/qJ9O/v7tIlBT3N0QdPCBlNkpyP07OPvwPopVDKUt2RuyxhcBR
 Ruhqaeu3SvvSeScumKQxN/VAb/KhputY6KKa2Lu6cEt87/NPL7r9YzYxbNvINTgw9I+c
 PBfg==
X-Gm-Message-State: APjAAAXwf9nxjOtpqbYtjBxB83xjRamsi/xnO7jMRgUUQm/tSHh7Pkp1
 oLSyBLhnb5qxuV4tXqPqWxt+rmv0zzQaVaRKsPE=
X-Google-Smtp-Source: APXvYqyG8Is/2v0hS1XHLGNtOeXAyVyYv2E23r0Yvate33SClP0PPy8+QLPRF9mvGuAMa/xfdd48bj61kdArq/BDS/A=
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr384737wme.29.1561577718154; 
 Wed, 26 Jun 2019 12:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-2-Kenny.Ho@amd.com>
 <20190626154929.GP12905@phenom.ffwll.local>
In-Reply-To: <20190626154929.GP12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Wed, 26 Jun 2019 15:35:06 -0400
Message-ID: <CAOWid-dyGwf=e0ikBEQ=bnVM_bC8-FeTOD8fJVMJKUgPv6vtyw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 01/11] cgroup: Introduce cgroup for drm subsystem
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/5SrQ5SYua3CBmwCDqScHd2/Bwr4oTQ8I2YEBgR7+gA=;
 b=eMsKc+rnCj8StfekhCHMqWi4SmNhIffQowFbvQPE+yXuPzxz4jp694GIj1LYbyqrtp
 7UQ8vM7QNCfBJ0nAE7gVrTydFflwf2vtINWHN4yYPxc3boYl6W9MdK8TdnqTjGsfc9Kg
 FurBoVhNLd0DKjNzVViMIQlpZbtv2DrP6GgxAgnijbQYsmmKK16K4zE8aL1IKE4Lc+R+
 eyjJZtfCP4Dqiv2LXZ2n+OF7Q2j+CKW+HJarmsrWV1nBjU1Lu8mxjZs9K4TX/ZbWaHRP
 CiKjA6Du28wcuxDpKm6wb1O4aD34efUIp42Ki0iITbQh0IFlpCFJ5djzrAEsNSzcmd8f
 MFWQ==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6NDkgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IEJ1bmNoIG9mIG5hbWluZyBiaWtlc2hlZHMKCkkgYXBwcmVjaWF0
ZSB0aGUgc3VnZ2VzdGlvbnMsIG5hbWluZyBpcyBoYXJkIDopLgoKPiA+ICsjaW5jbHVkZSA8bGlu
dXgvY2dyb3VwLmg+Cj4gPiArCj4gPiArc3RydWN0IGRybWNncnAgewo+Cj4gZHJtX2Nncm91cCBm
b3IgbW9yZSBjb25zaXN0ZW5jeSBob3cgd2UgdXN1YWxseSBjYWxsIHRoZXNlIHRoaW5ncy4KCkkg
d2FzIGhvcGluZyB0byBrZWVwIHRoZSBzeW1ib2wgc2hvcnQgaWYgcG9zc2libGUuICBJIHN0YXJ0
ZWQgd2l0aApkcm1jZyAoZm9sbG93aW5nIGJsa2NnKSwgIGJ1dCBJIGJlbGlldmUgdGhhdCBjYXVz
ZXMgY29uZnVzaW9uIHdpdGgKb3RoZXIgYXNwZWN0IG9mIHRoZSBkcm0gc3Vic3lzdGVtLiAgSSBk
b24ndCBoYXZlIHRvbyBzdHJvbmcgb2YgYW4Kb3BpbmlvbiBvbiB0aGlzIGJ1dCBJJ2QgcHJlZmVy
IG5vdCBuZWVkaW5nIHRvIGtlZXAgcmVmYWN0b3JpbmcuICBTbyBpZgp0aGVyZSBhcmUgb3RoZXIg
b3BpbmlvbnMgb24gdGhpcywgcGxlYXNlIHNwZWFrIHVwLgoKPiA+ICsKPiA+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgcHV0X2RybWNncnAoc3RydWN0IGRybWNncnAgKmRybWNncnApCj4KPiBJbiBkcm0g
d2UgZ2VuZXJhbGx5IHB1dCBfZ2V0L19wdXQgYXQgdGhlIGVuZCwgY2dyb3VwIHNlZW1zIHRvIGRv
IHRoZSBzYW1lLgoKb2ssIEkgd2lsbCByZWZhY3Rvci4KCj4gPiArewo+ID4gKyAgICAgaWYgKGRy
bWNncnApCj4gPiArICAgICAgICAgICAgIGNzc19wdXQoJmRybWNncnAtPmNzcyk7Cj4gPiArfQo+
ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRybWNncnAgKnBhcmVudF9kcm1jZ3JwKHN0
cnVjdCBkcm1jZ3JwICpjZykKPgo+IEknZCBhbHNvIGNhbGwgdGhpcyBkcm1fY2dyb3VwX3BhcmVu
dCBvciBzby4KPgo+IEFsc28gYWxsIHRoZSBhYm92ZSBuZWVkcyBhIGJpdCBvZiBuaWNlIGtlcm5l
bGRvYyBmb3IgdGhlIGZpbmFsIHZlcnNpb24uCj4gLURhbmllbAoKTm90ZWQsIHdpbGwgZG8sIHRo
YW5rcy4KClJlZ2FyZHMsCktlbm55Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
