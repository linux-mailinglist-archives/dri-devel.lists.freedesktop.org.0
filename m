Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E31F5B8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 15:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152A891D2;
	Wed, 15 May 2019 13:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E722891D2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 13:40:19 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so4220581edx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 06:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=N9ijmgLXgxSF4qWdom+Ms7wpAn2ieGPHX7+AolwLaa4=;
 b=Iep6CrD8BSJbbzMOboKr0mzdDsVm4VqivP2zrPF6YDNpn+N+vGMXgSQdA6cV8epBEn
 dUK4BxMtI4NFChSfPwh2eHglQcvgZ8Q6GiNJLZTAsf6e/GSV7sW99RC7h9xVnkS1fyRh
 VWY2IP3nHjx23s1swEcT5Z6Oe9KGQvQCwXD0oQVpCCsccM2UZS96MEhsToTl+tU20iAA
 pWHpMCaRPIafcUUcVmsHuy/Ine/dfjuQQHqsvqE/UYSDnpKQl0YyRiHUaqBCkN320aIk
 ihJwSw5U5T7liWJGOr/kk2yJYvKnubgPvMuuHME+/8fwFoalvRBPjAwfkS1hMvUJTSsa
 tOAA==
X-Gm-Message-State: APjAAAUwatLF7b0KJRXFtFgSnRQblJf+/erB34tujhCiI6CTQprwCqup
 GRHIXOAK2zKtwR5JoH94JMNXkg==
X-Google-Smtp-Source: APXvYqwxRoI1bVpV102BQLvyQ58YdtgveYUCH79AV812RYm6g8vuNQc9YdFSFhfwT3BJb5i1C9K3tQ==
X-Received: by 2002:a17:906:3459:: with SMTP id
 d25mr21184672ejb.7.1557927618173; 
 Wed, 15 May 2019 06:40:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m3sm480910ejc.5.2019.05.15.06.40.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:40:17 -0700 (PDT)
Date: Wed, 15 May 2019 15:40:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] drm/fb-helper: Fix drm_fb_helper_hotplug_event() NULL
 ptr argument
Message-ID: <20190515134014.GJ17751@phenom.ffwll.local>
References: <20190515132925.48867-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515132925.48867-1-noralf@tronnes.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=N9ijmgLXgxSF4qWdom+Ms7wpAn2ieGPHX7+AolwLaa4=;
 b=RT8qIGLb3NbuzkdKbaRj+xb6LoxIVjaUWTat5j8e8KuUt7XKUwI8V49z9SQlkgmu8I
 QfqNAopjyk/isj/W6oyS/7OhdGR2zmQKnsQdOa0xbpqw2X0+bJ5+6Jn0bErhEnRICaub
 9I+YTkVVEncZbSUKBN6prOh2ZZDsTYDfD8cmw=
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDM6Mjk6MjVQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudCgpIHNob3VsZCB0b2xlcmF0ZSB0
aGUgZmJfaGVscGVyIGFyZ3VtZW50IGJlaW5nCj4gTlVMTC4gQ29tbWl0IDAzYTk2MDZlN2ZlZSAo
ImRybS9mYi1oZWxwZXI6IEF2b2lkIHJhY2Ugd2l0aCBEUk0gdXNlcnNwYWNlIikKPiBpbnRyb2R1
Y2VkIGEgZmJfaGVscGVyIGRlcmVmZXJlbmNlIGJlZm9yZSB0aGUgTlVMTCBjaGVjay4KPiBGaXh1
cCBieSBtb3ZpbmcgdGhlIGRlcmVmZXJlbmNlIGFmdGVyIHRoZSBOVUxMIGNoZWNrLgo+IAo+IEZp
eGVzOiAwM2E5NjA2ZTdmZWUgKCJkcm0vZmItaGVscGVyOiBBdm9pZCByYWNlIHdpdGggRFJNIHVz
ZXJzcGFjZSIpCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CgpB
aCB0aGUgY2xhc3NpYyAiSSBzcG90dGVkIGEgZGVyZWYgYmVmb3JlIHlvdXIgTlVMTCBjaGVjaywg
SSdtIGdvaW5nIHRvCm9wdGltaXplIHRoaXMgYWxsIGF3YXkgYmVjYXVzZSB5b3UgZ290IGl0IHdy
b25nIiBub25zZW5zZSBmcm9tIGdjYy4gSQp0aG91Z2h0IHRoZSBrZXJuZWwgdXNlcyBhIHNwZWNp
YWwgY29tcGlsZSBmbGFnIHRvIGF2b2lkIHRoaXMgb3B0aW1pemF0aW9uCi4uLgoKUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIu
Ywo+IGluZGV4IGMyNTlhMjg1MjJmOC4uYTUyYjQ4ZmFmYmQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jCj4gQEAgLTMwMzEsNyArMzAzMSw2IEBAIEVYUE9SVF9TWU1CT0woZHJtX2ZiX2hl
bHBlcl9pbml0aWFsX2NvbmZpZyk7Cj4gICAqLwo+ICBpbnQgZHJtX2ZiX2hlbHBlcl9ob3RwbHVn
X2V2ZW50KHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCj4gIHsKPiAtCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBmYl9oZWxwZXItPmRldjsKPiAgCWludCBlcnIgPSAwOwo+ICAKPiAg
CWlmICghZHJtX2ZiZGV2X2VtdWxhdGlvbiB8fCAhZmJfaGVscGVyKQo+IEBAIC0zMDQ0LDEzICsz
MDQzLDEzIEBAIGludCBkcm1fZmJfaGVscGVyX2hvdHBsdWdfZXZlbnQoc3RydWN0IGRybV9mYl9o
ZWxwZXIgKmZiX2hlbHBlcikKPiAgCQlyZXR1cm4gZXJyOwo+ICAJfQo+ICAKPiAtCWlmICghZmJf
aGVscGVyLT5mYiB8fCAhZHJtX21hc3Rlcl9pbnRlcm5hbF9hY3F1aXJlKGRldikpIHsKPiArCWlm
ICghZmJfaGVscGVyLT5mYiB8fCAhZHJtX21hc3Rlcl9pbnRlcm5hbF9hY3F1aXJlKGZiX2hlbHBl
ci0+ZGV2KSkgewo+ICAJCWZiX2hlbHBlci0+ZGVsYXllZF9ob3RwbHVnID0gdHJ1ZTsKPiAgCQlt
dXRleF91bmxvY2soJmZiX2hlbHBlci0+bG9jayk7Cj4gIAkJcmV0dXJuIGVycjsKPiAgCX0KPiAg
Cj4gLQlkcm1fbWFzdGVyX2ludGVybmFsX3JlbGVhc2UoZGV2KTsKPiArCWRybV9tYXN0ZXJfaW50
ZXJuYWxfcmVsZWFzZShmYl9oZWxwZXItPmRldik7Cj4gIAo+ICAJRFJNX0RFQlVHX0tNUygiXG4i
KTsKPiAgCj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
