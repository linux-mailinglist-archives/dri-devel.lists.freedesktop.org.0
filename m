Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D348F329AA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 09:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BB289AC3;
	Mon,  3 Jun 2019 07:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE289AC3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 07:32:46 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g24so15895344eds.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 00:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=juWbc2ubhF7q4lXxjbeJJ2RsKIXb7JWxqW/svcmOV48=;
 b=j6Ee47wRY31vjZ8wGMbq856QJX2vCg4Kvb7XkloaxhT7dC1qkaCjPxw8Bar/9tXMi6
 UBiFY/cYgi+vIVrkDfDp3ArMcZ8qVCJWxZyBlpgg1UhjFx8irfr2x5wWkfapEHbd55pe
 fHzCx4VN+etqafjAKcG/Y0a3WFzbODa0rCQVNE4Dd3ehti0ulBNgg2y/btZ0KBU/qpUf
 Emy6kuPi4p65EWxpy7bHs+dFccwpVg1th1/qIOw5n6Qb4Rp/Op1aiKd3XXax/yXphWhJ
 EYC8AaqMwzu2W07QMO4HUI5LzUA0yl9zt4LapS0pb/pnphZ2lpA9LHhmTkQzKWlpHuhA
 7BpA==
X-Gm-Message-State: APjAAAW7/o4GY/F+p9cfEEXjN9ex5eQpGwZTywNqVtS6gFVI2D2Oz+YC
 MKbuunmxA+yfPbU/vmvDybkkON8jc5w=
X-Google-Smtp-Source: APXvYqw6EhUAxmbnYzIDi4MLkiXLZjRXDPQMgOsQ8NoMToQe7VFsS1zOLnzzQjbCyiJf8qSSpXVi9Q==
X-Received: by 2002:a17:906:aec3:: with SMTP id
 me3mr22155731ejb.260.1559547165343; 
 Mon, 03 Jun 2019 00:32:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k2sm3748552eds.77.2019.06.03.00.32.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:32:44 -0700 (PDT)
Date: Mon, 3 Jun 2019 09:32:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH libdrm 00/10] Add C8, 30bpp and FP16 support to modetest
Message-ID: <20190603073242.GD21222@phenom.ffwll.local>
References: <20190603004017.7114-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603004017.7114-1-imirkin@alum.mit.edu>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=juWbc2ubhF7q4lXxjbeJJ2RsKIXb7JWxqW/svcmOV48=;
 b=Rg77q/y7nfuxQ0gHPbf4pfoVsFSZwoMmxQ5ooTXLIWQIrfWiiRsZSJhcwyXtC/641j
 tCLo8Aw6Krl2/5VFylRE8KZ23eoGOn+7fDqgquCEsXNtF2+RoSSPSPxqfvNo+OoWpqq+
 /mtMyAzBL2hUX8sVsUDEwbRjc/e7oihrC4v+A=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMDIsIDIwMTkgYXQgMDg6NDA6MDhQTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHBhdHRlcm4gZ2VuZXJhdGlvbiBsb2dpYyB0
byBzdXBwb3J0IGFkZGl0aW9uYWwKPiBmb3JtYXRzLCBhcyB3ZWxsIGFzIGEgbmV3ICJncmFkaWVu
dCIgcGF0dGVybiAoc2VlIHBhdGNoIGNvbW1lbnRzIG9uIHdoeQo+IEkgZm91bmQgaXQgdXNlZnVs
KS4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlc2UgZm9ybWF0cyBhcmUgcGlwZWQgdGhyb3VnaCB0byBt
b2RldGVzdCwgaW5jbHVkaW5nIHRoZQo+IGFiaWxpdHkgdG8gc2V0IGEgZ2FtbWEgdGFibGUsIHdo
aWNoIGlzIG5lY2Vzc2FyeSBmb3IgdGhlIEM4IGluZGV4ZWQKPiBmb3JtYXQuCj4gCj4gVGhpcyB3
YXMgdGVzdGVkIG9uIG5vdXZlYXUsIGFuZCB1c2VkIGZvciBicmluZy11cCBvZiB0aGUgQzgsIFhC
MzAsIGFuZAo+IEZQMTYgZm9ybWF0cyBvbiB0aGUgTlZJRElBIGhhcmR3YXJlIHRoYXQgc3VwcG9y
dHMgdGhlc2UuCgpEb2VzIG5vdXZlYXUgYWxzbyB3b3JrIHdpdGggaWd0IHRlc3RzIGZvciB0aGlz
IHN0dWZmPyBXZSBkbyBoYXZlIHN1cHBvcnQKZm9yIGludGVyYWN0aXZlIHRlc3RpbmcgKGkuZS4g
Imh1bWFuIHBscyBjaGVjayB5b3Vyc2VsZiIga2luZCBvZiB0ZXN0cykgaW4KaWd0LCBzbyBpZGVh
bGx5IHdlIGNvdWxkIG1lcmdlIGV2ZXJ5dGhpbmcgaW50byBvbmUgcGxhY2UuIExvbmctdGVybSBh
dApsZWFzdCAuLi4KLURhbmllbAoKPiAKPiBJbGlhIE1pcmtpbiAoMTApOgo+ICAgdXRpbDogYWRk
IEM4IGZvcm1hdCwgc3VwcG9ydCBpdCB3aXRoIFNNUFRFIHBhdHRlcm4KPiAgIHV0aWw6IGZpeCBN
QUtFX1JHQkEgbWFjcm8gZm9yIDEwYnBwIG1vZGVzCj4gICB1dGlsOiBhZGQgZ3JhZGllbnQgcGF0
dGVybgo+ICAgdXRpbDogYWRkIGZwMTYgZm9ybWF0IHN1cHBvcnQKPiAgIHV0aWw6IGFkZCBjYWly
byBkcmF3aW5nIGZvciAzMGJwcCBmb3JtYXRzIHdoZW4gYXZhaWxhYmxlCj4gICBtb2RldGVzdDog
ZG9uJ3QgcHJldGVuZCB0aGF0IGF0b21pYyBtb2RlIGluY2x1ZGVzIGEgZm9ybWF0Cj4gICBtb2Rl
dGVzdDogYWRkIGFuIGFkZF9wcm9wZXJ0eV9vcHRpb25hbCB2YXJpYW50IHRoYXQgZG9lcyBub3Qg
cHJpbnQKPiAgICAgZXJyb3JzCj4gICBtb2RldGVzdDogYWRkIEM4IHN1cHBvcnQgdG8gZ2VuZXJh
dGUgU01QVEUgcGF0dGVybgo+ICAgbW9kZXRlc3Q6IGFkZCB0aGUgYWJpbGl0eSB0byBzcGVjaWZ5
IGZpbGwgcGF0dGVybnMgb24gdGhlIGNvbW1hbmRsaW5lCj4gICBtb2RldGVzdDogYWRkIEZQMTYg
Zm9ybWF0IHN1cHBvcnQKPiAKPiAgdGVzdHMvbW9kZXRlc3QvYnVmZmVycy5jICB8ICAxMyArKwo+
ICB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgMTA5ICsrKysrKysrLS0KPiAgdGVzdHMvdXRp
bC9mb3JtYXQuYyAgICAgICB8ICAgNyArCj4gIHRlc3RzL3V0aWwvcGF0dGVybi5jICAgICAgfCA0
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgdGVzdHMvdXRpbC9w
YXR0ZXJuLmggICAgICB8ICAgNyArCj4gIDUgZmlsZXMgY2hhbmdlZCwgNTQzIGluc2VydGlvbnMo
KyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
