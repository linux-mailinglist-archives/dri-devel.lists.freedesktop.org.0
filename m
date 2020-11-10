Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4322AE2FD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B029089CDD;
	Tue, 10 Nov 2020 22:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8089CDD;
 Tue, 10 Nov 2020 22:13:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so4732122wmd.4;
 Tue, 10 Nov 2020 14:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xT6tM+gk4HWRrKa6KAYYWDmgkvtKHBouJiXVkJogMyY=;
 b=nrUzDrXPj6FL98r9ZOB0jMR+yPNdfIgxOXvxEcZUFaLuatcB4IR088eynT6CkasFQi
 +8AhSr99IRAZZLtZ1+eyyyhI1g700ZZxv1LOd6m8tExnGslznwl0DxbEsiR3hybdgvdm
 jOZtueBelhP3bV/0bOWYoAIrwefJc08EXjV6OOQY+qB6xKI8XcqkjphoPTsjO6iaBsmx
 ubsicWALSk1xCFgiRRK/BF1IWGMPryElz1hsAMQowCmATSQBdgUsA7oUchpvsKfrE2b+
 es2DlivbP6mucg9hW/h6fURkgDokypNiXBysSmHeApbxrgE47rHXMWMHOHef5Jdee6ej
 KkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xT6tM+gk4HWRrKa6KAYYWDmgkvtKHBouJiXVkJogMyY=;
 b=AYU6jBHmppENjlxdt1tf+QsiWlVk1Kn9HHCX5gRwJuLJ1FU265FKUXQpaOAJAvfJVB
 nICS9x+rAAlZBs9JXsZ3GeZCD/1v9dywIuF0fumylYcGOOD83UNJ+3pzLPzqwwh68qmR
 3ft/Ixo9XjFFlF4EzFFEkPlwZt7CoTUiSAj1v2sum5yo/tIPvo7R1EUtcI7yErGEgGg1
 iXpONp2FQ020ucwFlr+z5w8tkBDuIq7krw2B6g1O965EId7E0yMcnragdIuZIKfC4dXn
 04X4/aGl4gtiS6zvCoch3umhHkvzcIXDjI20D2jmbOplhVrWZ4sKjveid+5yuEvAnf6f
 2kXw==
X-Gm-Message-State: AOAM531ixeqNhyAzxU+kN/d/140gdab95LQMKyXlIPjm10cxvZPHHXih
 93v2R2JMG+yHuUQoZ21GXMN+w4Aw0A0SIkUWVYCf+qbG
X-Google-Smtp-Source: ABdhPJwozkwJCQ+Wga7e+74HHRTVPMXaLdO9viRHZ3LonxLmlXppLHNHt/2QbxPhMU6KK/xnwLhGCct1Bjg3rAofqAo=
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr247045wma.79.1605046435639; 
 Tue, 10 Nov 2020 14:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-10-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-10-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:13:44 -0500
Message-ID: <CADnq5_NnJ8y9Eq1bHgA81YyY+UZQG3K+G2mvtPFZCm4hOZdXVg@mail.gmail.com>
Subject: Re: [PATCH 09/20] drm/radeon/radeon_irq_kms: Demote non-conformant
 kernel-doc fix another
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU2
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpcnEnIG5vdCBkZXNjcmli
ZWQgaW4gJ3JhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21zJwo+ICBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9pcnFfa21zLmM6NTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2FyZycgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX2RyaXZlcl9pcnFfaGFuZGxl
cl9rbXMnCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYzo1NzE6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ24nIG5vdCBkZXNjcmliZWQgaW4g
J3JhZGVvbl9pcnFfa21zX3NldF9pcnFfbl9lbmFibGVkJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9pcnFfa21zLmM6NTcxOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1l
dGVyICdudW0nIGRlc2NyaXB0aW9uIGluICdyYWRlb25faXJxX2ttc19zZXRfaXJxX25fZW5hYmxl
ZCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2lycV9rbXMuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25faXJxX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
Cj4gaW5kZXggYjg2YmM4OGFkNDMwOC4uMzUyMTA4NDAzMGQyNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmMKPiBAQCAtNDMsMTEgKzQzLDkgQEAKPgo+ICAjZGVm
aW5lIFJBREVPTl9XQUlUX0lETEVfVElNRU9VVCAyMDAKPgo+IC0vKioKPiArLyoKPiAgICogcmFk
ZW9uX2RyaXZlcl9pcnFfaGFuZGxlcl9rbXMgLSBpcnEgaGFuZGxlciBmb3IgS01TCj4gICAqCj4g
LSAqIEBpbnQgaXJxLCB2b2lkICphcmc6IGFyZ3MKPiAtICoKPiAgICogVGhpcyBpcyB0aGUgaXJx
IGhhbmRsZXIgZm9yIHRoZSByYWRlb24gS01TIGRyaXZlciAoYWxsIGFzaWNzKS4KPiAgICogcmFk
ZW9uX2lycV9wcm9jZXNzIGlzIGEgbWFjcm8gdGhhdCBwb2ludHMgdG8gdGhlIHBlci1hc2ljCj4g
ICAqIGlycSBoYW5kbGVyIGNhbGxiYWNrLgo+IEBAIC01NTYsNyArNTU0LDcgQEAgdm9pZCByYWRl
b25faXJxX2ttc19kaXNhYmxlX2hwZChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdW5zaWdu
ZWQgaHBkX21hc2spCj4gICAqIEBtYXNrOiB0aGUgbWFzayB0aGF0IGVuYWJsZXMgdGhlIGludGVy
cnVwdHMKPiAgICogQGVuYWJsZTogd2hldGhlciB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgaW50
ZXJydXB0IHJlZ2lzdGVyCj4gICAqIEBuYW1lOiB0aGUgbmFtZSBvZiB0aGUgaW50ZXJydXB0IHJl
Z2lzdGVyIHRvIHByaW50IHRvIHRoZSBrZXJuZWwgbG9nCj4gLSAqIEBudW06IHRoZSBudW1iZXIg
b2YgdGhlIGludGVycnVwdCByZWdpc3RlciB0byBwcmludCB0byB0aGUga2VybmVsIGxvZwo+ICsg
KiBAbjogdGhlIG51bWJlciBvZiB0aGUgaW50ZXJydXB0IHJlZ2lzdGVyIHRvIHByaW50IHRvIHRo
ZSBrZXJuZWwgbG9nCj4gICAqCj4gICAqIEhlbHBlciBmb3IgdXBkYXRpbmcgdGhlIGVuYWJsZSBz
dGF0ZSBvZiBpbnRlcnJ1cHQgcmVnaXN0ZXJzLiBDaGVja3Mgd2hldGhlcgo+ICAgKiBvciBub3Qg
dGhlIGludGVycnVwdCBtYXRjaGVzIHRoZSBlbmFibGUgc3RhdGUgd2Ugd2FudC4gSWYgaXQgZG9l
c24ndCwgdGhlbgoKVGhlIGZ1bmN0aW9uIG5hbWUgaW4gdGhlIGNvbW1lbnQgZG9lc24ndCBtYXRj
aCB0aGUgZnVuY3Rpb24gbmFtZSBpdCBpcwpkb2N1bWVudGluZy4gIENhcmUgdG8gZml4IHRoYXQg
dXAgdG9vPwoKQWxleAoKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
