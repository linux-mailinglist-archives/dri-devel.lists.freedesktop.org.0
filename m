Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609410EF88
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 19:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A8389745;
	Mon,  2 Dec 2019 18:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7789745
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 18:49:52 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-R8b_Up3oPf2EpP1oqNZkYQ-1; Mon, 02 Dec 2019 13:49:50 -0500
Received: by mail-qk1-f198.google.com with SMTP id b9so306509qkl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 10:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=8nOlZklbXEP/MfMud/ZUPVb3jHYNuzoALbQz6584AH8=;
 b=rE/zS4nbjmYyXGG+u2li4R8p/b2E0OQcls8I9KzRRL4OlK7O2N+NVR4k3aN8g1ssYB
 zhqabLvFWNulZbd5EXF7maob8/s4d63K/RzNFy99LqefU/HgDLAhFUIZ28qQIbM1jRVw
 U513HWi66lE9QAthFuVrNIi8Nu9CquZ/mGGmWiKYekt8i5fBvIEw8SpeDK94qU/XyeFw
 XSYDInuHYdJ4BWmdbIqCNn63awi32MZG00nmVsfyoREVW6+3/p1myeaMdjDzMoUqd4KY
 bRwqMc/CT7ZE12dclStHnFdEzklNKDwdUlXF9tBJPqIBbxm417rXZVLIuq+sgwTgcSy7
 A7UA==
X-Gm-Message-State: APjAAAWzFDAzbsd1hZD09wW3gV/YKJW+A8+Lh6mhx2Sb2Lkzp4xLTVXr
 sEeT/gbeh5+MIp9T9ugnPMiNoOguvH04YeCBOgosUk6yodbzRw9F3AbVcUivqmGUjb8ONX2BGrE
 6BwiprAq8tcaJyiZFKgi1uIfuo59D
X-Received: by 2002:a37:4b06:: with SMTP id y6mr348925qka.14.1575312589758;
 Mon, 02 Dec 2019 10:49:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJRF1Uj8hXpkhpro16Z/MJEwD9ISyeLmMqcRIU5Abi4M9QOoQSdoBpNoTX1Z/vjA6P7T3A3A==
X-Received: by 2002:a37:4b06:: with SMTP id y6mr348899qka.14.1575312589488;
 Mon, 02 Dec 2019 10:49:49 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id y187sm245824qkd.11.2019.12.02.10.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 10:49:48 -0800 (PST)
Message-ID: <837a221f0fc89b9ef6d3fbd2ceae479a5c98818a.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Fix build on systems with STACKTRACE_SUPPORT=n
From: Lyude Paul <lyude@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 02 Dec 2019 13:49:47 -0500
In-Reply-To: <CAMuHMdUz7gewcFPE=cnVENGdwVp6AZD7U4y1PtwXTAmoGmvGUg@mail.gmail.com>
References: <20191202133650.11964-1-linux@roeck-us.net>
 <CAMuHMdUz7gewcFPE=cnVENGdwVp6AZD7U4y1PtwXTAmoGmvGUg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: R8b_Up3oPf2EpP1oqNZkYQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575312591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nOlZklbXEP/MfMud/ZUPVb3jHYNuzoALbQz6584AH8=;
 b=JfWmUc2RX14/O87FfXSLO1zBiEsaxRjqDs7Kqpr9M1SqW5NGbQ+Xrgzz9Z0vXTArIS77JJ
 eoI/Oif0kkUX7K43funi8Xgq03JnhYCfBYm9lWfisyA0e4Tc6na6iR96A/PsAdVp7R57X1
 cL8P1HToU1hnhBjyN+BhjNk+urVFoHo=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpJJ2xsIGdvIGFoZWFk
IGFuZCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzIQoKT24gTW9uLCAyMDE5LTEy
LTAyIGF0IDE2OjIwICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gTW9uLCBE
ZWMgMiwgMjAxOSBhdCAyOjQxIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4g
d3JvdGU6Cj4gPiBPbiBzeXN0ZW1zIHdpdGggU1RBQ0tUUkFDRV9TVVBQT1JUPW4sIHdlIGdldDoK
PiA+IAo+ID4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3Ig
U1RBQ0tUUkFDRQo+ID4gICBEZXBlbmRzIG9uIFtuXTogU1RBQ0tUUkFDRV9TVVBQT1JUCj4gPiAg
IFNlbGVjdGVkIGJ5IFt5XToKPiA+ICAgLSBTVEFDS0RFUE9UIFs9eV0KPiA+IAo+ID4gYW5kIGJ1
aWxkIGVycm9ycyBzdWNoIGFzOgo+ID4gCj4gPiBtNjhrLWxpbnV4LWxkOiBrZXJuZWwvc3RhY2t0
cmFjZS5vOiBpbiBmdW5jdGlvbiBgc3RhY2tfdHJhY2Vfc2F2ZSc6Cj4gPiAoLnRleHQrMHgxMWMp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzYXZlX3N0YWNrX3RyYWNlJwo+ID4gCj4gPiBBZGQg
dGhlIG1pc3NpbmcgZGVlbmRlbmN5IG9uIFNUQUNLVFJBQ0VfU1VQUE9SVC4KPiA+IAo+ID4gRml4
ZXM6IDEyYTI4MGM3Mjg2OCAoImRybS9kcF9tc3Q6IEFkZCB0b3BvbG9neSByZWYgaGlzdG9yeSB0
cmFja2luZyBmb3IKPiA+IGRlYnVnZ2luZyIpCj4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiAKPiBBY2tlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiAKPiBHcntvZXRqZSxl
ZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+IAotLSAKQ2hlZXJz
LAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
