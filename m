Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702D2BA5E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EE489623;
	Mon, 27 May 2019 18:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA8489623
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:53:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p27so28028593eda.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/jREdVWmDmmNS4A5lCaOA96v27wEVQFm8EIU1UsecHs=;
 b=QqeDKWOS63zzn4DKj280Q0PuVHiow85wRL5VBWhTz1tdi1vV1QnJejT4kQfZ/CmBKi
 DNHTXuh43VjA5YjCMbj0Kml7oPJNxJk8o133p4/KNFWZzfvKkmMmdPHHtfwR2LQyA1jf
 aTs7pxZUH05KxgWHZd3hWjWTs3b0h+eoQDcaE/eBqQXZenwZUePJlo8HnhZXBzlUF6SB
 E+7sKRzeSnOs/hLQFzRJ9RM4fGYsLSFooVI7PvTpsku3Eiyak0golwhH1lfWzpedxvaH
 s4kEzAUXe/53seuSLTagM7+v0KNQ/sREL5l1N7+Z3nctB2ve0SGgvIdAyiboN9vv4BU7
 so8Q==
X-Gm-Message-State: APjAAAU3rT8KHW2y0PDjE/ngMP4lDDmsQnBqK/qT6BmRPHEW5qHyXhl4
 BErnc73rfsJAXX/Xigj2SblXYUqvHLo=
X-Google-Smtp-Source: APXvYqwMBTTZDKjG5ZA9VlidghZp60NN2tcGY6J3LtfSGjE6EMzl4GlWKVb0iaArPh6JvrJwNP6y0w==
X-Received: by 2002:a17:906:8d8:: with SMTP id
 o24mr8365734eje.235.1558983194573; 
 Mon, 27 May 2019 11:53:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s16sm1857703eji.27.2019.05.27.11.53.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 May 2019 11:53:13 -0700 (PDT)
Date: Mon, 27 May 2019 20:53:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm/syncobj: Include the <drm/drm_utils.h> header
Message-ID: <20190527185311.GS21222@phenom.ffwll.local>
References: <20190527183931.11367-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527183931.11367-1-festevam@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/jREdVWmDmmNS4A5lCaOA96v27wEVQFm8EIU1UsecHs=;
 b=fnhhZ13QAhA53rXw6KoLEp8zKHNOFUKlwNEZpwFBaJE47wrtPhzgxf1EVJXkNkokFt
 DdtyT0ptbbV8oKgODM7M65p1BRoT8vWNQZeOPQJh+00L2zYYCAKsn5+Bf+XrlddBn9cP
 ExsTcCHqsZ5LIMPcGdgBGxchN9Yq30GGFQIo0=
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDM6Mzk6MzFQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBUaGUgcHJvdG90eXBlIGZvciAnZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXMnIGlz
IHByb3ZpZGVkIGJ5Cj4gdGhlIDxkcm0vZHJtX3V0aWxzLmg+IGhlYWRlci4KPiAKPiBJbmNsdWRl
IHRoaXMgaGVhZGVyIHRvIGZpeCB0aGUgZm9sbG93aW5nIHNwYXJzZSB3YXJuaW5nOgo+IAo+IGRy
aXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jOjkzNzoxMzogd2FybmluZzogc3ltYm9sICdkcm1f
dGltZW91dF9hYnNfdG9famlmZmllcycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0
YXRpYz8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+CgpVaCBJIHRoaW5rIHRoaXMgaXNuJ3QgcXVpdGUgd2hhdCB3ZSB3YW50LiBUaGVyZSdzIGJv
dGggYSBkcm1fdXRpbHMuaCBhbmQgYQpkcm1fdXRpbC5oIGFuZCBubyBkcm1fdXRpbC5jIGFuZCBn
ZW5lcmFsbHkgd2UgdHJ5IHRvIG1hdGNoIHRoZW0gYWxsIHVwLgoKSSB0aGluayBkcm1fdXRpbHMu
aCBzaG91bGQgZGlzYXBwZWFyIGVudGlyZWx5LCB3aXRoCmRybV9nZXRfcGFuZWxfb3JpZW50YXRp
b25fcXVpcmsgbW92ZWQgdG8gZHJtX3BhbmVsLmggKHRoYXQncyBhdCBsZWFzdCBob3cKaXQncyBh
bHNvIGdyb3VwZWQgaW4gdGhlIGRvY3MpLiBBbmQgdGhlIGRybV90aW1lb3V0X2Fic190b19qaWZm
aWVzIGhlbHBlcgptb3ZlZCB0byBkcm1fdXRpbC5oLCB3aXRoIGl0J3MgaW1wbGVtZW50YXRpb24g
bW92ZWQgdG8gYSBuZXcgZHJtX3V0aWwuYwoKUGx1cyBJIGd1ZXNzIGluY2x1ZGluZyBhbGwgdGhh
dCBpbnRvIHRoZSBhIG5ldyBrZXJuZWxkb2Mgc2VjdGlvbi4KCkFzc3VtaW5nIHlvdXIgdXAgZm9y
IGEgbm90Y2ggbW9yZSBjbGVhbnVwIHRoYW4ganVzdCBzaHV0dGluZyB1cCBzcGFyc2U/CgpUaGFu
a3MsIERhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMK
PiBpbmRleCAzZDQwMDkwNTEwMGIuLmIwNmZhNDI0YmQ0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jCj4gQEAgLTQ2LDYgKzQ2LDcgQEAKPiAgICogVGhlIGZpbGUgdGFrZXMgYSByZWZlcmVuY2Ug
b24gdGhlIGtyZWYuCj4gICAqLwo+ICAKPiArI2luY2x1ZGUgPGRybS9kcm1fdXRpbHMuaD4KPiAg
I2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9maWxlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9mcy5oPgo+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
