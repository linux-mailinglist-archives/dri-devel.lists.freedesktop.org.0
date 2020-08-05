Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91923C529
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6515C89E59;
	Wed,  5 Aug 2020 05:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C0789DDF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:41:09 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id u43so9918221ybi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/sjw4o4mhutVhsZtSEpfhMydGXMfHinmAnCiEFHL8d8=;
 b=M+TYWoekUklDDIs4N744XbMMn1hxWcKy+SstmgZB630L6tjXu8JZBTcBb+/1CFZTam
 ymnx7cLnKK0k1OinxcZ/zFRsk1xXW15QFC8nf4tj5TEPPVbhuUAThGNYfbBb6NGtnS9V
 IYSxMw9viEzeAC1SbfPAEzUOLQF19u91nv+i5XLNixIFpj4lKw0YHM5HNiq88cDBVXhQ
 8wPbARJ13eyVONFQskCzBqCRvC80w1HSpYaDu2YVcXMVJQUPMe3FosriQrkivdaVhHAo
 PuzlPU77crJgvTbPQEac4kvGNMjdLtjoHKIxoWXLEu+pL2Slj1MsdgtFBk9aBZPx2yYy
 iroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/sjw4o4mhutVhsZtSEpfhMydGXMfHinmAnCiEFHL8d8=;
 b=qqc5+WD2xYe9XUUkVAQdLNBcsVguAeig9FRHY8hFu2trGT+8+kVIAl7zOLi/IYFhOA
 M/3eRrVHgIIoaweOLUyyaTo2tvNZbYsbjYqjimvxV6W+9LrLUi/2HIhUcUGmaxGRTgI9
 GFNi6c6tyYUu6S3wnRvy6aMgVWPKZNDpCL8aBANLYD2JPO+cTGccmXNizARPGr2j76Gk
 IQb6xOh9vuPcBRehMzrIi1Yx/kvM2LOSAwnJopbsVs/S3IP56gGaVacUN/X60AIZSsxR
 vFt2i5egOvIe17IdFnRkiktJNvr48Elh9REsZTnLWTbLli8jVpcCYA1oImcwXQJBaJww
 qwBQ==
X-Gm-Message-State: AOAM533S/gYofq0Ci4sAXbOxRfwjKNNXLSSvxCdZEUX5kUcibX0VTmMD
 LvLb2UQEJeWoVgVeMFZTg7fpe2QfQog43tzAg5Y=
X-Google-Smtp-Source: ABdhPJxeAJAr+EuGXS3zjH5T773ht6fqN/Kx4AMwf38VIZqqM63PV/SNOTZNJLN/lJcphyqdeBNS41JWcMNWTKfzstI=
X-Received: by 2002:a25:4d41:: with SMTP id a62mr2563325ybb.83.1596606068377; 
 Tue, 04 Aug 2020 22:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-23-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-23-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:40:57 +1000
Message-ID: <CACAvsv7GmBM=On5cRxHKEkOp7i7TqS2ka-5SUhU==vwAaU2uEQ@mail.gmail.com>
Subject: Re: [PATCH 22/59] drm/ttm: convert system manager init to new code.
To: Dave Airlie <airlied@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDEyOjU3LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+
IFJlbW92ZSB0aGUgZXhpdCBwYXRoLCBzaW5jZSB0aGlzIGNhbid0IGZhaWwgbm93Lgo+Cj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpSZXZpZXdlZC1i
eTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyB8IDMwICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPiBpbmRleCAzMDBiY2MxMDY5NmEuLmM1NmNiYzZjMGJhOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwo+IEBAIC0xNjUwLDYgKzE2NTAsMjIgQEAgaW50IHR0bV9ib19kZXZpY2Vf
cmVsZWFzZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPiAgfQo+ICBFWFBPUlRfU1lNQk9M
KHR0bV9ib19kZXZpY2VfcmVsZWFzZSk7Cj4KPiArc3RhdGljIHZvaWQgdHRtX2JvX2luaXRfc3lz
bWFuKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgdHRt
X21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bVFRNX1BMX1NZU1RFTV07Cj4gKwo+
ICsgICAgICAgLyoKPiArICAgICAgICAqIEluaXRpYWxpemUgdGhlIHN5c3RlbSBtZW1vcnkgYnVm
ZmVyIHR5cGUuCj4gKyAgICAgICAgKiBPdGhlciB0eXBlcyBuZWVkIHRvIGJlIGRyaXZlciAvIElP
Q1RMIGluaXRpYWxpemVkLgo+ICsgICAgICAgICovCj4gKyAgICAgICBtYW4tPnVzZV90dCA9IHRy
dWU7Cj4gKyAgICAgICBtYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElO
RzsKPiArICAgICAgIG1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwo+
ICsKPiArICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2luaXQoYmRldiwgbWFuLCAwKTsKPiAr
ICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgdHJ1ZSk7Cj4gK30KPiAr
Cj4gIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4g
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX2JvX2RyaXZlciAqZHJpdmVyLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gQEAg
LTE2NzAsMTYgKzE2ODYsNyBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAo+Cj4gICAgICAgICBtZW1zZXQoYmRldi0+bWFuLCAwLCBzaXplb2YoYmRl
di0+bWFuKSk7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBJbml0aWFsaXplIHRoZSBzeXN0
ZW0gbWVtb3J5IGJ1ZmZlciB0eXBlLgo+IC0gICAgICAgICogT3RoZXIgdHlwZXMgbmVlZCB0byBi
ZSBkcml2ZXIgLyBJT0NUTCBpbml0aWFsaXplZC4KPiAtICAgICAgICAqLwo+IC0gICAgICAgYmRl
di0+bWFuW1RUTV9QTF9TWVNURU1dLnVzZV90dCA9IHRydWU7Cj4gLSAgICAgICBiZGV2LT5tYW5b
VFRNX1BMX1NZU1RFTV0uYXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwo+
IC0gICAgICAgYmRldi0+bWFuW1RUTV9QTF9TWVNURU1dLmRlZmF1bHRfY2FjaGluZyA9IFRUTV9Q
TF9GTEFHX0NBQ0hFRDsKPiAtICAgICAgIHJldCA9IHR0bV9ib19pbml0X21tKGJkZXYsIFRUTV9Q
TF9TWVNURU0sIDApOwo+IC0gICAgICAgaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPiAtICAgICAg
ICAgICAgICAgZ290byBvdXRfbm9fc3lzOwo+ICsgICAgICAgdHRtX2JvX2luaXRfc3lzbWFuKGJk
ZXYpOwo+Cj4gICAgICAgICBiZGV2LT52bWFfbWFuYWdlciA9IHZtYV9tYW5hZ2VyOwo+ICAgICAg
ICAgSU5JVF9ERUxBWUVEX1dPUksoJmJkZXYtPndxLCB0dG1fYm9fZGVsYXllZF93b3JrcXVldWUp
Owo+IEBAIC0xNjkxLDkgKzE2OTgsNiBAQCBpbnQgdHRtX2JvX2RldmljZV9pbml0KHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZ0dG1fZ2xvYmFsX211
dGV4KTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLW91dF9ub19zeXM6Cj4gLSAgICAgICB0dG1f
Ym9fZ2xvYmFsX3JlbGVhc2UoKTsKPiAtICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgRVhQT1JU
X1NZTUJPTCh0dG1fYm9fZGV2aWNlX2luaXQpOwo+Cj4gLS0KPiAyLjI2LjIKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
