Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E648821BF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD046E46D;
	Mon,  5 Aug 2019 16:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF696E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:28:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so79261443edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 09:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=K2sXdJclvxxAYKvFks8+6yO1xMDUMlAVO7dNDPYOkGk=;
 b=Onucm2FxByC9eCuteP96p0uEEzPGaorO3glCjGf4U3ewF0qm12fXZtheToGj3Bs0FF
 XuD2j6DdQA7BULHWWYgU2pdxTcg+zNRRfucDzcx4w7WnW/FOIBBbUX1b2Cm38od0LOCb
 7uKjkIUBMDQ1GMBg5/CJmZgzOQeZLUR7gQ/XUb8dKi+kaEJKqDjcHnWgfvhMDK0mnRds
 H3KMCmUVZJToKiIgffiqd8mHSGiOIDSENUkBqs0FFaJ1pQSjuC4o9i9D72hlheUuUkJE
 ZZ1k2YHYOVtNyWyr54bOvZnY/8PmYRXBFJWGgR0Z1rxPP7yup2pomZKaNr2w+Sm/mR5e
 F06Q==
X-Gm-Message-State: APjAAAXZSWFy4WwVZppekCmvsw2W/7YMf5eBHoPjABkpIF+VCCFkXIgW
 T4uER1gccRTo+hK5YXr+J3I=
X-Google-Smtp-Source: APXvYqzqpKCsu467X75hIFy1sVlZKf+Bf8W0vtVAT2iAo+V+GY4Ok7k+nNtRT/J8897lFJErLyFMAA==
X-Received: by 2002:a50:982a:: with SMTP id g39mr133558286edb.88.1565022498990; 
 Mon, 05 Aug 2019 09:28:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c49sm20421214eda.74.2019.08.05.09.28.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:28:17 -0700 (PDT)
Date: Mon, 5 Aug 2019 18:28:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: connector: Clarify drm_connecter.ddc field
 documentation
Message-ID: <20190805162815.GT7444@phenom.ffwll.local>
References: <20190804122653.6587-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804122653.6587-1-laurent.pinchart@ideasonboard.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K2sXdJclvxxAYKvFks8+6yO1xMDUMlAVO7dNDPYOkGk=;
 b=KpwXQTAtUYwPMzcPmXCQeCcArngYJeggs0eO6Q4DV/UV23FyL9W6h4gJ7owZ1On0Rr
 yq69xQd8ti0APTMyei0Tbm6MV/M7qhnt7XY2yjz664EtaPBfkn+BVHzFcoasC2U7YnAi
 01dzAefu0UKCtMkbIweZaJYQc3lskE/B+Ns0c=
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
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMDM6MjY6NTNQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBJbXByb3ZlIHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZSBkZGMgZmllbGQgYnkg
dXNpbmcgRERDIGFuZCBJMkMKPiBjb25zaXN0ZW50bHksIGFuZCBleHBsYWluaW5nIG1vcmUgY2xl
YXJseSB3aGF0IHRoZSBmaWVsZCBwb2ludHMgdG8uCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGlu
ZGV4IGZjNWQwODQzODMzMy4uMGQwMTY2MmFhNDBlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBA
IC0xMzE1LDEwICsxMzE1LDEwIEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKPiAgCj4gIAkvKioK
PiAgCSAqIEBkZGM6IGFzc29jaWF0ZWQgZGRjIGFkYXB0ZXIuCj4gLQkgKiBBIGNvbm5lY3RvciB1
c3VhbGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBkZGMgYWRhcHRlci4gSWYgYSBkcml2ZXIgdXNlcwo+
IC0JICogdGhpcyBmaWVsZCwgdGhlbiBhbiBhcHByb3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNy
ZWF0ZWQgaW4gY29ubmVjdG9yCj4gLQkgKiBzeXNmcyBkaXJlY3RvcnkgdG8gbWFrZSBpdCBlYXN5
IGZvciB0aGUgdXNlciB0byB0ZWxsIHdoaWNoIGkyYwo+IC0JICogYWRhcHRlciBpcyBmb3IgYSBw
YXJ0aWN1bGFyIGRpc3BsYXkuCj4gKwkgKiBXaGVuIHRoZSBjb25uZWN0b3IgY2FycmllcyBEREMg
c2lnbmFscywgdGhpcyBmaWVsZCBwb2ludHMgdG8gdGhlIEkyQwoKcy9EREMvYSBEREMvCgo+ICsJ
ICogYWRhcHRlciBjb25uZWN0ZWQgdG8gdGhlIEREQyBzaWduYWxzLCBpZiBhbnkuIFdoZW4gdGhp
cyBmaWVsZCBpcyBub3QKcy9ub3QgTlVMTC9pcyBzZXQvIG90aGVyd2lzZSBwYXJzaW5nIGhpY2N1
cCBvbiB0aGUgZG91YmxlIG5lZ2F0aXZlIDotKQoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiArCSAqIE5VTEwgYSBzeW1ib2xpYyBsaW5rIGlz
IGNyZWF0ZWQgaW4gdGhlIGNvbm5lY3RvcidzIHN5c2ZzIGRpcmVjdG9yeQo+ICsJICogdG8gZXhw
b3NlIHRoZSBJMkMgYWRhcHRlciB1c2VkIGJ5IHRoZSBjb25uZWN0b3IuCj4gIAkgKgo+ICAJICog
VGhlIGZpZWxkIHNob3VsZCBiZSBzZXQgYnkgY2FsbGluZyBkcm1fY29ubmVjdG9yX2luaXRfd2l0
aF9kZGMoKS4KPiAgCSAqLwo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
