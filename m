Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748723E4C3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296A6E937;
	Thu,  6 Aug 2020 23:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DCC6E937;
 Thu,  6 Aug 2020 23:49:29 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v22so25613850edy.0;
 Thu, 06 Aug 2020 16:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+I4p8XXlJQ6d21x4t9UTcs09KX3zrf9MSbX2C6W67EM=;
 b=htUkQHA5S1o9XUwn69AB7VmSd03LMgKmAcxC1OXwYj25Fc6lrxVSlTYnicvQMO5ogd
 xrej1e6xcxQy1IiisViO+AnFyLO8V/9dLIIxgyLMapOprYyI2YTl0u76WeM/jNnq5fz3
 28R6ERyNU6tD1fbPoRJFtxFEV9KL94gqgpkCk8MRKnxjs+wAP4VH7ssFENdxUhXvY3ek
 h8MJJRv+OwRm6GNzyUMx61UVoQNopUeGuILW0NCTiQO0If5JI7g+iRkVt21mQE+8x79Z
 l1MnzWWbp9jxD9KTrzNhUTzxc0pLrHrgU7sg3aEWi0azlN3zqhSjRVmITmAc1x9kEuG/
 8TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+I4p8XXlJQ6d21x4t9UTcs09KX3zrf9MSbX2C6W67EM=;
 b=NlQP83B1oOGgQUM5LLwPft9gXcr30uuXG788zk7aui9oVTlb3v/XOEq/qatRDgENfA
 7pA+CtEq1vBxXNTg3n2byMFF3e/uSqg4kQAQSH9Idon5+igPrIhrUQM2Vuw7AfNcTyPV
 x5WaKbEkGFP+RgdUtag0ScoW4H6saHk1WXRdOeFzvTYm1FsaNfb73ZXRyIbshJYyVqkT
 VFh/Dv+2xFo/dKXwAiOx0Jtmuytwm+/j7s2AL58YONI9n3luUKssatgT2NC0B9oFiVrK
 WFE4P10WKiReXzrdaAJnMvmuzmoDDuqbeymgeb2ytdEiUtaG3INpj9seYD24O7dQBxQq
 Z8PA==
X-Gm-Message-State: AOAM532iw9ngkj4b5QUZKpp4eoVfwqIBveEmb6D/Quf0MEzfnLLtUVH5
 4ejzJJvgsAWBTkKKS5cGu0hiiMJwsBSkX5ElaV4=
X-Google-Smtp-Source: ABdhPJwEsqvWZRBvoaexBYxLgndRiXQlaIzpAQEXn64zlbXdvUqs1n+am8g0FAi5eCppL3FHJXPYqTGcHl/HKHRGsaY=
X-Received: by 2002:aa7:c246:: with SMTP id y6mr6636610edo.78.1596757768181;
 Thu, 06 Aug 2020 16:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200806135148.2032-1-christian.koenig@amd.com>
 <20200806135148.2032-3-christian.koenig@amd.com>
In-Reply-To: <20200806135148.2032-3-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Aug 2020 09:49:15 +1000
Message-ID: <CAPM=9tyxVFEByBeLKyhAZPn3U1Qed+AvBYAHLJ=w5=XE6H+vyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/radeon: drop superflous AGP handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEF1ZyAyMDIwIGF0IDIzOjUxLCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgb2JqZWN0IGZsYWdzIGNyZWF0
ZWQgaW4gcmFkZW9uX3R0bV9wbGFjZW1lbnRfZnJvbV9kb21haW4gdGFrZSBjYXJlIHRoYXQKPiB3
ZSB1c2UgdGhlIGNvcnJlY3QgY2FjaGluZyBmb3IgQUdQLCB0aGlzIGlzIGp1c3Qgc3VwZXJmbG91
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KClJldmlld2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAyMSArKy0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTkgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IDMxZjRj
ZjIxMWI2YS4uMjkwYzhiNDc5ODUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRt
LmMKPiBAQCAtNzYsMjYgKzc2LDkgQEAgc3RhdGljIGludCByYWRlb25fdHRtX2luaXRfdnJhbShz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKPgo+ICBzdGF0aWMgaW50IHJhZGVvbl90dG1faW5p
dF9ndHQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHsKPiAtICAgICAgIHVpbnQzMl90
IGF2YWlsYWJsZV9jYWNoaW5nLCBkZWZhdWx0X2NhY2hpbmc7Cj4gLQo+IC0gICAgICAgYXZhaWxh
YmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwo+IC0gICAgICAgZGVmYXVsdF9jYWNo
aW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwo+IC0KPiAtI2lmIElTX0VOQUJMRUQoQ09ORklHX0FH
UCkKPiAtICAgICAgIGlmIChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1ApIHsKPiAtICAgICAg
ICAgICAgICAgaWYgKCFyZGV2LT5kZGV2LT5hZ3ApIHsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBEUk1fRVJST1IoIkFHUCBpcyBub3QgZW5hYmxlZFxuIik7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLSAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAg
ICAgYXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19VTkNBQ0hFRCB8Cj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgVFRNX1BMX0ZMQUdfV0M7Cj4gLSAgICAgICAgICAgICAgIGRlZmF1bHRf
Y2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOwo+IC0gICAgICAgfQo+IC0jZW5kaWYKPiAtCj4gICAg
ICAgICByZXR1cm4gdHRtX3JhbmdlX21hbl9pbml0KCZyZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9U
VCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXZhaWxhYmxlX2NhY2hpbmcs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHRfY2FjaGluZywgdHJ1
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFRNX1BMX01BU0tfQ0FDSElO
RywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFRNX1BMX0ZMQUdfQ0FDSEVE
LCB0cnVlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZGV2LT5tYy5ndHRf
c2l6ZSA+PiBQQUdFX1NISUZUKTsKPiAgfQo+Cj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
