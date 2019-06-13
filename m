Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C269543648
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18F8991D;
	Thu, 13 Jun 2019 13:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F88991D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:09:58 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so31147921edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Xzdfzy8zNS0YSd5ly3OdiM3dkuIheYCiePnjPsn+HxU=;
 b=UfpSwm/uGFzG0x/fnmohOetj7OzYavhtVGT8UfzOsjFLvtAH6cxqHSG0GdwU2mO1Og
 iT4PotkxtY2OUZUvFupJEMMNUIdFqoP+GGtA3bRYEd+oLS9EoAh6GBC3L+NiO7DetA03
 Isy5JW3UApWuUoomDi2Gv/DNENBeNL7w5KIPBXOxAc1e92GDUQevMibOHYiYBptdg1X+
 J04eY026t7mh2yE/sWWE32ltl6aCpq5ZYDQo31E4Fbv/SklPLOx7kiwHEUw7Vj0Z7g9j
 B9FnFYFUJAoQ6nVy61m9O1hDX7RpbAG1xsYq+ljIs8MlsHEQGK0X5i0HurRkw7j1c98G
 Mc3g==
X-Gm-Message-State: APjAAAUVtrx62iy1v7G4bHIHOeRMBEdBR4mgW/aFAlCvpfzV0IxhQ0GW
 JS83jvNmT795DpbqT/KuQLyddg==
X-Google-Smtp-Source: APXvYqwmVHrS6PrcZHFz7AB5No4NKP8hEohPsK+CDPa+KdDrbwI4e9Nq6eH31UoYK/wvxq72pq73Mg==
X-Received: by 2002:a17:906:6055:: with SMTP id
 p21mr1387745ejj.35.1560431396829; 
 Thu, 13 Jun 2019 06:09:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s16sm549466eji.27.2019.06.13.06.09.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 06:09:55 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:09:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] panel: rocktech: no need to check return value of
 debugfs_create functions
Message-ID: <20190613130953.GN23020@phenom.ffwll.local>
References: <20190613115717.GB26335@kroah.com>
 <20190613121616.GA5339@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613121616.GA5339@bogon.m.sigxcpu.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Xzdfzy8zNS0YSd5ly3OdiM3dkuIheYCiePnjPsn+HxU=;
 b=W4CL6ZxAr/poP2BPLahEe6kfqTrfSZrbaqcSlj+4Prl35JpmiPrZgSa/wdNskQKSB2
 wbuyjK+yXzi6BkoSr8F9SY/uODpB35CgU6KZa6AVLvyFa+cSPMGP0ZsK3+AlHBuzLm+E
 mmcBIMUZK18VZ6cjY/PWqMY0soA3ILcDJn06g=
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDI6MTY6MTZQTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gSGksCj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDE6NTc6MTdQTSArMDIwMCwg
R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gV2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rp
b25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCj4gPiByZXR1cm4gdmFsdWUu
ICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMgc2hvdWxk
Cj4gPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4gPiAKPiA+
IENjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNwdS5vcmc+Cj4gPiBDYzogVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyB8
IDE0ICsrKy0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gPiBpbmRleCBkODhlYThkYTJlYzIuLjZkY2I2
OTJjNDcwMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2Nr
dGVjaC1qaDA1N24wMDkwMC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
cm9ja3RlY2gtamgwNTduMDA5MDAuYwo+ID4gQEAgLTI1NywyMCArMjU3LDEyIEBAIHN0YXRpYyBp
bnQgYWxscGl4ZWxzb25fc2V0KHZvaWQgKmRhdGEsIHU2NCB2YWwpCj4gPiAgREVGSU5FX1NJTVBM
RV9BVFRSSUJVVEUoYWxscGl4ZWxzb25fZm9wcywgTlVMTCwKPiA+ICAJCQlhbGxwaXhlbHNvbl9z
ZXQsICIlbGx1XG4iKTsKPiA+ICAKPiA+IC1zdGF0aWMgaW50IGpoMDU3bl9kZWJ1Z2ZzX2luaXQo
c3RydWN0IGpoMDU3biAqY3R4KQo+ID4gK3N0YXRpYyB2b2lkIGpoMDU3bl9kZWJ1Z2ZzX2luaXQo
c3RydWN0IGpoMDU3biAqY3R4KQo+ID4gIHsKPiA+IC0Jc3RydWN0IGRlbnRyeSAqZjsKPiA+IC0K
PiA+ICAJY3R4LT5kZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKERSVl9OQU1FLCBOVUxMKTsK
PiA+IC0JaWYgKCFjdHgtPmRlYnVnZnMpCj4gPiAtCQlyZXR1cm4gLUVOT01FTTsKPiA+ICAKPiA+
IC0JZiA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoImFsbHBpeGVsc29uIiwgMDYwMCwKPiA+IC0JCQkJ
Y3R4LT5kZWJ1Z2ZzLCBjdHgsICZhbGxwaXhlbHNvbl9mb3BzKTsKPiA+IC0JaWYgKCFmKQo+ID4g
LQkJcmV0dXJuIC1FTk9NRU07Cj4gPiAtCj4gPiAtCXJldHVybiAwOwo+ID4gKwlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKCJhbGxwaXhlbHNvbiIsIDA2MDAsIGN0eC0+ZGVidWdmcywgY3R4LAo+ID4gKwkJ
CSAgICAmYWxscGl4ZWxzb25fZm9wcyk7Cj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyB2b2lkIGpo
MDU3bl9kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgamgwNTduICpjdHgpCj4gCj4gUmV2aWV3ZWQtYnk6
IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CgpBcHBsaWVkIHRvIGRybS1taXNjLW5l
eHQsIHRoYW5rcy4KCkZvciB0aGUgb3RoZXJzIEknbGwgYXNzdW1lIGRyaXZlcnMgbWFpbnRhaW5l
cnMgd2lsbCBwaWNrIHRoZW0gdXAuIElmIG5vdApwbHMgcGluZy9yZXNlbmQgYW5kIEknbGwgc3R1
ZmYgYWxsIHRoZSByZW1haW5pbmcgb25lcyBpbnRvIGRybS1taXNjLW5leHQuCgpUaGFua3MsIERh
bmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
