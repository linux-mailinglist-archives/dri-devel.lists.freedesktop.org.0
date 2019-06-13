Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E969C43764
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BD989916;
	Thu, 13 Jun 2019 14:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0589916;
 Thu, 13 Jun 2019 14:54:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r16so1986544wrl.11;
 Thu, 13 Jun 2019 07:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RMlhECvNZkzzf9knddObYD+FvTUG/jzCxofqvk0+gvw=;
 b=QQsMO+nv112ium75VZOmmHORV6Me2nm9neBxkXNcH0g2ztFrPmeK0GFq3oHnvyv2NA
 MYDs4oCw8/1iagN+jsgxhzH8eGUYxXyH6p5i7IpjsZwAN6jnGrEVIQ4zuOoziFejUGpz
 //6b63XNuSV3BE1k4faNyJcsOAkf4aT1DbhsLh+j0xSUlSpOeOlkaDzJHbNm2gbF+/5h
 r/Lc+Nlzopn+lHX+R3iTm7OpZt+HZGEzlmh50PKnY6Ynd8TNyb2IUax5wbCIlDxLyE84
 s/FPHdqadkTMSnLY2nMgKu6MZz+7qEi1w8/rkpuzYtIBVRO57WQP6uOukBstPtt9lrXN
 Qiog==
X-Gm-Message-State: APjAAAWlxcs4v7Zx4f86tSANkaE4e6Smu6Voc6xP8D6w26BESheR+Z+m
 c/lPWnjM+5mMnma6pLQhlXwFR9how1NJmtSSC7k=
X-Google-Smtp-Source: APXvYqxqPZQfiBcFXDIwu39B0T/cMZkIHJnzVlnlen9EXQx9d1azlOzSj6qR7bZgbc61vEFH+P+9AWxXG/kOQwIWbgI=
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr37289393wrw.341.1560437693618; 
 Thu, 13 Jun 2019 07:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190613115631.GA26335@kroah.com>
In-Reply-To: <20190613115631.GA26335@kroah.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Jun 2019 10:54:41 -0400
Message-ID: <CADnq5_NFYOeDMu0P9XhE27x9Zqq=jU-+ihEFG_G-R_VJXAxqFw@mail.gmail.com>
Subject: Re: [PATCH] radeon: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RMlhECvNZkzzf9knddObYD+FvTUG/jzCxofqvk0+gvw=;
 b=cptaq3S3FEcjRwEOQfSIQcLd531GRGPIIwm2QCVfF9NPDHbBGUAQvYl751OGFz/D2v
 pSK25CqpWJpE8YMBl++z7FBGzuqUGiR4ps7IOUnqo9Bxj+9WdOu4lzqPVdXaZ+7jOeT3
 mzbycXg3L/1kJ+/oI/ccgGPL3LZqgbWYtmUf+IqGutQiZ4MFnVAFY+q5hY2obqptEPo6
 9w8WIKXkqQ7rmfyh7l86QvlbpfGIs3pS1nmLy3yMu3UhvMj/9JuBJm95o95J1Ce0rQOF
 +MIoYEKoiExrNXW8jux8X3Qp30t58STuvPOH6dw7QdqWjvQ+OeVgPUM3+kbMFZIFoLxA
 cBfA==
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgNzo1NiBBTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1
bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1
ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91
bGQKPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4KPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFu
IEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogIkRhdmlkIChDaHVuTWlu
ZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KCkFwcGxpZWQgYWxsIHRoZSByYWRlb24gYW5kIGFtZGdwdSBwYXRj
aGVzLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMgfCAyMSArKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYwo+IGluZGV4IDVkNDJmOGQ4ZTY4ZC4uNmJiY2NjNzk2ZTQwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtMTA1NiwxOSArMTA1NiwxNCBAQCBzdGF0aWMg
aW50IHJhZGVvbl90dG1fZGVidWdmc19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+
ICAgICAgICAgdW5zaWduZWQgY291bnQ7Cj4KPiAgICAgICAgIHN0cnVjdCBkcm1fbWlub3IgKm1p
bm9yID0gcmRldi0+ZGRldi0+cHJpbWFyeTsKPiAtICAgICAgIHN0cnVjdCBkZW50cnkgKmVudCwg
KnJvb3QgPSBtaW5vci0+ZGVidWdmc19yb290Owo+IC0KPiAtICAgICAgIGVudCA9IGRlYnVnZnNf
Y3JlYXRlX2ZpbGUoInJhZGVvbl92cmFtIiwgU19JRlJFRyB8IFNfSVJVR08sIHJvb3QsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJkZXYsICZyYWRlb25fdHRtX3ZyYW1fZm9w
cyk7Cj4gLSAgICAgICBpZiAoSVNfRVJSKGVudCkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKGVudCk7Cj4gLSAgICAgICByZGV2LT5tbWFuLnZyYW0gPSBlbnQ7Cj4gLQo+IC0gICAg
ICAgZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZSgicmFkZW9uX2d0dCIsIFNfSUZSRUcgfCBTX0lS
VUdPLCByb290LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZGV2LCAmcmFk
ZW9uX3R0bV9ndHRfZm9wcyk7Cj4gLSAgICAgICBpZiAoSVNfRVJSKGVudCkpCj4gLSAgICAgICAg
ICAgICAgIHJldHVybiBQVFJfRVJSKGVudCk7Cj4gLSAgICAgICByZGV2LT5tbWFuLmd0dCA9IGVu
dDsKPiArICAgICAgIHN0cnVjdCBkZW50cnkgKnJvb3QgPSBtaW5vci0+ZGVidWdmc19yb290Owo+
ICsKPiArICAgICAgIHJkZXYtPm1tYW4udnJhbSA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoInJhZGVv
bl92cmFtIiwgU19JRlJFRyB8IFNfSVJVR08sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJvb3QsIHJkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZyYWRlb25fdHRtX3ZyYW1fZm9wcyk7Cj4gKwo+ICsgICAg
ICAgcmRldi0+bW1hbi5ndHQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYWRlb25fZ3R0IiwgU19J
RlJFRyB8IFNfSVJVR08sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcm9vdCwgcmRldiwgJnJhZGVvbl90dG1fZ3R0X2ZvcHMpOwo+Cj4gICAgICAgICBjb3Vu
dCA9IEFSUkFZX1NJWkUocmFkZW9uX3R0bV9kZWJ1Z2ZzX2xpc3QpOwo+Cj4gLS0KPiAyLjIyLjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
