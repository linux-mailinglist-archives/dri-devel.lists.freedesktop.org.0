Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB34EC73
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 17:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0B56E8E4;
	Fri, 21 Jun 2019 15:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B66E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:46:18 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so10755464edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=e9FqVZr5b+a770joRDvkAjX8x20hANlrXYnr+CAbP1A=;
 b=nNJIfVsdklq2HsH6noN7QLoW7XXlYFh3L0dnpaGcwgiTPXBTav4ifaDO/fi3p/SKqU
 oaahACuTMQDbIy1tIlOAv9IYu/gSdy7joNywXr0Vx9Rg2ziRL2KXqVVYDxGWjojsYs6Q
 RRUo1p7OU12ATdd5RK4n+UrYbMLt8LF786K+OseCeNGvXBte0VOJI8EAtdjJ9ehIKQWs
 x1r5jC4Syk+Alu91pyaYI+VwGcw+XvsPK0HdnD51gHU0J96Cr2rrKnCrE80MyVXAV5e+
 5IvSuY6tfL6zAP7BC7HXN41CzmKkcy5vofMzgpNGdfC/llYcPGucjCyMHw3iUtUza42z
 yrtQ==
X-Gm-Message-State: APjAAAUu7OabJAjN/Mu7eQUBkjX+uEiECdo2blpptAtd6hmdn5povVT4
 53lyVk1v9xpkmtGBa7lfgOIFMY+jBf0=
X-Google-Smtp-Source: APXvYqzIxuiwqjn6lc7BhaDeypky1HTzEE7pY7AksTb3faIWsAKXZ7zbJfUaLiPXSWS6Nb7nMjJuMA==
X-Received: by 2002:a50:a53a:: with SMTP id
 y55mr130545345edb.147.1561131976509; 
 Fri, 21 Jun 2019 08:46:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f3sm493022ejc.15.2019.06.21.08.46.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 08:46:15 -0700 (PDT)
Date: Fri, 21 Jun 2019 17:46:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [PATCH 2/2] drm: Set crc->opened = false before setting crc
 source to NULL.
Message-ID: <20190621154609.GF12905@phenom.ffwll.local>
References: <20190605170639.8368-1-dingchen.zhang@amd.com>
 <20190605170639.8368-2-dingchen.zhang@amd.com>
 <dee2bc30-8af4-98f9-a7e9-936c925af840@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dee2bc30-8af4-98f9-a7e9-936c925af840@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e9FqVZr5b+a770joRDvkAjX8x20hANlrXYnr+CAbP1A=;
 b=PceS+OMbA8OsgEBG/WmFsyKEnNMv1v5lfM0y062y7xYFI2WIMshs3QmNoZSfgoGopx
 sUeNaffQ/2SLYoY0AyyFEhfXGXU5GFJrq3k9keZsLcn52DAqppTns/klAIyaFQmlaUDs
 5yA3vBolGi/ymo0uKxhNgyfiK1UOVIdHREtO8=
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
Cc: "Zhang, Dingchen \(David\)" <Dingchen.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDI6MjE6NDNQTSArMDAwMCwgSGFycnkgV2VudGxhbmQg
d3JvdGU6Cj4gT24gMjAxOS0wNi0wNSAxOjA2IHAubS4sIERpbmdjaGVuIFpoYW5nIHdyb3RlOgo+
ID4gdG8gdGVybWluYXRlIHRoZSB3aGlsZS1sb29wIGluIGRybV9kcF9hdXhfY3JjX3dvcmsgd2hl
biBkcm1fZHBfc3RhcnQvc3RvcF9jcmMKPiA+IGFyZSBjYWxsZWQgaW4gdGhlIGhvb2sgdG8gc2V0
IGNyYyBzb3VyY2UuCj4gPiAKPiA+IENjOkxlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPiwgSGFy
cnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+LCBOaWNrIDxOaWNob2xhcy5LYXpsYXVza2FzQGFt
ZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8ZGluZ2NoZW4uemhhbmdA
YW1kLmNvbT4KPiAKPiBJIHdvbmRlciBob3cgdGhpcyBpc24ndCBjcmVhdGluZyBwcm9ibGVtcyBm
b3IgUm9ja2NoaXAgd2l0aCB0aGUgQW5hbG9naXgKPiBicmlkZ2UuCj4gCj4gUmV2aWV3ZWQtYnk6
IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IAo+IEhhcnJ5Cj4gCj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA3ICsrKysrKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RlYnVnZnNfY3JjLmMKPiA+IGluZGV4IGUyMGFkZWY5ZDYyMy4uMGU4YmNjMTMwMzgzIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKPiA+IEBAIC0yNDksNiArMjQ5LDEzIEBA
IHN0YXRpYyBpbnQgY3J0Y19jcmNfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
ZmlsZSAqZmlsZXApCj4gPiAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGZpbGVwLT5mX2lub2Rl
LT5pX3ByaXZhdGU7Cj4gPiAgCXN0cnVjdCBkcm1fY3J0Y19jcmMgKmNyYyA9ICZjcnRjLT5jcmM7
Cj4gPiAgCj4gPiArCS8qIHRlcm1pbmF0ZSB0aGUgaW5maW5pdGUgd2hpbGUgbG9vcCBpZiAnZHJt
X2RwX2F1eF9jcmNfd29yaycgcnVubmluZyAqLwo+ID4gKwlpZiAoY3JjLT5vcGVuZWQpIHsKPiA+
ICsJCXNwaW5fbG9ja19pcnEoJmNyYy0+bG9jayk7Cj4gPiArCQljcmMtPm9wZW5lZCA9IGZhbHNl
Owo+ID4gKwkJc3Bpbl91bmxvY2tfaXJxKCZjcmMtPmxvY2spOwo+ID4gKwl9CgpFaXRoZXIgeW91
IGRvbid0IG5lZWQgYSBsb2NrIHRvIGxvb2sgYXQgLT5vcGVuZWQsIG9yIHlvdSBuZWVkIGl0LiBO
b3QKYm90aC4gVG9vIGxhenkgY2hlY2sgd2hpY2ggd2F5IHRoaXMgaXMsIGl0J3MgcHJhY3RpY2Fs
bHkgdy9lIGhlcmUgOi0pCi1EYW5pZWwKCj4gPiArCj4gPiAgCWNydGMtPmZ1bmNzLT5zZXRfY3Jj
X3NvdXJjZShjcnRjLCBOVUxMKTsKPiA+ICAKPiA+ICAJc3Bpbl9sb2NrX2lycSgmY3JjLT5sb2Nr
KTsKPiA+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
