Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CB504C4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 10:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE53A89468;
	Mon, 24 Jun 2019 08:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01B88941E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 08:44:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a14so20534173edv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 01:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fXWH0AXJ7/15RPX9UsVs89MP9tdKgL5So+gtl/RGlWY=;
 b=PzEsGtAoGvPhadl6iRxnJejjOc6I+hKpgdC+1lNbN97rQzFJeL1cKejftuiH/9s6Ld
 Hi/1QuIz/V9q/K+Z26BQQDY7Yu8cY8TBxGTCnFoTDtBA72Dp4AH4q//PKWsX5oDp5gMP
 9SUOCREukdDqx1RMWOnccmD1ChgGZTDwjT2HuPvfu6guVD48BBmfdF+3UnXxCLafD0Mb
 mvADd4qvUfTpuOrftWx9XwFRPFgdmwLAbSEC4uecWgsuz1QZImxeI4eARw+V6WQp/gQU
 BqYXXDZzizmaO+/OvEepDgrrB0/OsCPz5yKf6CKZi9MDEJkqou1yTApQ1sM7YptBq7jn
 5GFg==
X-Gm-Message-State: APjAAAXF1C6qG+MljfxjBeo3XKo5cCCHLhfVGoVUNqDh1GeUM3aI9cKK
 s4KukYpuS4J9MYy5E+JpwXnkN5oW5PA=
X-Google-Smtp-Source: APXvYqzE/Paz27FPMELgVW1RiloHB7hgzgbVIHUq5OE8qL1X7D+cBWePdPQ5B2v4f1kbpcgeB8VIpg==
X-Received: by 2002:a17:906:5a48:: with SMTP id
 l8mr80602185ejs.169.1561365876322; 
 Mon, 24 Jun 2019 01:44:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g2sm3637445edg.81.2019.06.24.01.44.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 01:44:35 -0700 (PDT)
Date: Mon, 24 Jun 2019 10:44:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] drm/connector: Fix warning in debug message
Message-ID: <20190624084433.GO12905@phenom.ffwll.local>
References: <20190624084016.12937-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624084016.12937-1-maxime.ripard@bootlin.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fXWH0AXJ7/15RPX9UsVs89MP9tdKgL5So+gtl/RGlWY=;
 b=QZo1CVKy2oTl1liNU6AAbCnBAJhpWPa6IyPzHITFSxZsn9aCCqj5JbM0wQRKxo08GL
 0tYluV/pkS2UqT0/Y2geXfrHLCLqTuCTFR8AVi94Fw2B4yvXIQ6qhV2fkn5E12/+G5lR
 ARp5ZU15w5nfegFgzYWqDw5MplLvVR8tWblCA=
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6NDA6MTZBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBUaGUgY29tbWl0IDNhZWViMTNkODk5NiAoImRybS9tb2RlczogU3VwcG9ydCBtb2Rl
cyBuYW1lcyBvbiB0aGUgY29tbWFuZAo+IGxpbmUiKSBhZGRlZCBuYW1lIHN1cHBvcnQgdG8gdGhl
IERSTSBtb2RlcywgYW5kIGFkZGVkIHRoYXQgbmFtZSB0byB0aGUKPiBkZWJ1ZyBtZXNzYWdlLgo+
IAo+IEhvd2V2ZXIsIHRoYXQgY29kZSB0ZXN0cyBmb3Igd2hldGhlciBvciBub3QgdGhlIG5hbWUg
dmFyaWFibGUgaXMgTlVMTCBhbmQKPiBvbmx5IHByaW50cyBpdCBpZiBpdCdzIG5vdC4gRXhjZXB0
IHRoYXQgdGhhdCB2YXJpYWJsZSBpcyBhbiBhcnJheSwgc28gaXQKPiB3aWxsIG5ldmVyIGJlIE5V
TEwuCj4gCj4gVGhlIG9yaWdpbmFsIGludGVudCB3YXMgdG8gcHJpbnQgaXQgb25seSB3aGVuIHRo
ZSBuYW1lIGhhcyBiZWVuIHNwZWNpZmllZC4KPiBKdXN0IHByaW50aW5nIHRoZSBhcnJheSBkaXJl
Y3RseSB3aWxsIGFjaGlldmUgdGhlIHNhbWUgdGhpbmcgc2luY2UgdGhlCj4gZHJtX2NtZGxpbmVf
bW9kZSBzdHJ1Y3R1cmUgdGhhdCBob2xkcyBpdCBpcyBpdHNlbGYgY29udGFpbmVkIGluCj4gZHJt
X2Nvbm5lY3RvciwgdGhhdCBpcyBhbGxvY2F0ZWQgd2l0aCBpdHMgd2hvbGUgY29udGVudCB6ZXJv
J2QuCj4gCj4gVGhhdCBtZWFucyB0aGF0IGlmIHRoZSBuYW1lIGlzIG5vdCBkZWNsYXJlZCwgdGhl
IGFycmF5IHdpbGwgYmUgYWxsIHplcm9zLAo+IHdoaWNoIHdpbGwgbm90IHByaW50IGFueXRoaW5n
Lgo+IAo+IENjOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KPiBS
ZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gRml4ZXM6IDNh
ZWViMTNkODk5NiAoImRybS9tb2RlczogU3VwcG9ydCBtb2RlcyBuYW1lcyBvbiB0aGUgY29tbWFu
ZCBsaW5lIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMyArLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYwo+IGluZGV4IDNhZmVkNTY3Nzk0Ni4uMDY4ZDRiMDVmMWJlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gQEAgLTE0MCw4ICsxNDAsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fY29ubmVjdG9yX2dldF9jbWRsaW5lX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikKPiAgCX0KPiAgCj4gIAlEUk1fREVCVUdfS01TKCJjbWRsaW5lIG1vZGUgZm9y
IGNvbm5lY3RvciAlcyAlcyAlZHglZEAlZEh6JXMlcyVzXG4iLAo+IC0JCSAgICAgIGNvbm5lY3Rv
ci0+bmFtZSwKPiAtCQkgICAgICBtb2RlLT5uYW1lID8gbW9kZS0+bmFtZSA6ICIiLAo+ICsJCSAg
ICAgIGNvbm5lY3Rvci0+bmFtZSwgbW9kZS0+bmFtZSwKPiAgCQkgICAgICBtb2RlLT54cmVzLCBt
b2RlLT55cmVzLAo+ICAJCSAgICAgIG1vZGUtPnJlZnJlc2hfc3BlY2lmaWVkID8gbW9kZS0+cmVm
cmVzaCA6IDYwLAo+ICAJCSAgICAgIG1vZGUtPnJiID8gIiByZWR1Y2VkIGJsYW5raW5nIiA6ICIi
LAo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
