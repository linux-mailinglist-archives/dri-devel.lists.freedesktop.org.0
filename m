Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059882B531E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01E86EA83;
	Mon, 16 Nov 2020 20:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94DC6E12A;
 Mon, 16 Nov 2020 20:46:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p1so20246271wrf.12;
 Mon, 16 Nov 2020 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n7206K9tbQjrW9WffRhlFU03h2XPHVa1EJsFslHQZc8=;
 b=V9P3O57JwSOXE4Z/U9mCTVsVxRev+UDzCjmh2+cmsy0VZx93J51SqMoOm+qkWXJ5by
 Ta6k32mrflPo/zvmGzOGyGemF+8mqpkYwXPFoEVPT32HPJ5Pe2AG/jKVnrtu80CunmlE
 Wysr8IuhYTkUWW54uorMR1E3kgN2l/D5GI4NBNCcK0/Fqc1sGhXqkAqa8MG/ZY0K5EKP
 J0AwQnsCIf7K/3LTDU/vfviHCNbxImjv6fepY24rTQdiAu23kspNjuejCJEiavfBZAvc
 t8aMbOvR1lWbTFqo47cLUEr1kdHWBPEiHg2wuGo2/CJmXQDvGuWLKMKqR2Dkm1uMIRVz
 /LnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n7206K9tbQjrW9WffRhlFU03h2XPHVa1EJsFslHQZc8=;
 b=pQgdJtizdWxgY/wdi0a39HpP3VAcRAOyVDkEwFvS/5ecuvro/JJCJ4poYwHrClLYCf
 ZhLCqgD1hOlgNYy+vmNQNiDumdyCRH0DmtmHRMNdkIcUPQIGNUkGsqVtJCwLM2etH0fC
 yrbKEF8No3e9JEFip94pgSa/+FUCVxjZ2yPqjaCVvX6y6wy0yi5pMJZZhUNOTxj8qAoH
 +4kviP6H50DFrBaciHrfdQWhUr6SLU90mE1axL/9YeIAhJ88+8dTanI9O7pzzLsUJMzQ
 iUWNE+6jj4Xj2b9L/5t6xfgn9q7gzahkRZh6QCko7RLJx9RTJdrqYJlt4hjZ1YQqF84x
 yhEw==
X-Gm-Message-State: AOAM533ugo7eJ97hlT5JnPgTjUVLjb0zJphYrlExQIdtrpDPJSz7fhke
 zFqsqkKOp+JtGFaBFBuUwSO+Fpsw3zxRNKuxlaA=
X-Google-Smtp-Source: ABdhPJzBHUUYDmNrmFwgmzoxO2xlGZGD4FgVoxPR0v30R6cuqJYbuzlV+EyMqUJtGvEU0GUM+8xvcxtMPQVTDPk+sls=
X-Received: by 2002:adf:e551:: with SMTP id z17mr21691708wrm.374.1605559595551; 
 Mon, 16 Nov 2020 12:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-42-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-42-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:46:24 -0500
Message-ID: <CADnq5_O6-AtbMtURHi+0mKgBv7W0PhRZKPNSi0qmEu_E-gj0rw@mail.gmail.com>
Subject: Re: [PATCH 41/43] drm/radeon/evergreen_cs: Move
 'r600_dma_cs_next_reloc()'s prototype to shared header
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

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYzoyMzQzOjU6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9kbWFfY3NfbmV4dF9y
ZWxvY+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDIzNDMgfCBpbnQgcjYwMF9kbWFfY3Nf
bmV4dF9yZWxvYyhzdHJ1Y3QgcmFkZW9uX2NzX3BhcnNlciAqcCwKPiAgfCBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgfCAzICstLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuaCAgICAgICAgIHwgNCArKysrCj4gIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcjYwMF9jcy5jICAgICAgfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdy
ZWVuX2NzLmMKPiBpbmRleCA1M2I3NWNmMjAxOTU4Li4wZGU3OWYzYTdlM2ZmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jCj4gQEAgLTI4LDYgKzI4LDcgQEAKPgo+ICAj
aW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgo+ICsjaW5jbHVk
ZSAicjYwMC5oIgo+ICAjaW5jbHVkZSAiZXZlcmdyZWVuZC5oIgo+ICAjaW5jbHVkZSAiZXZlcmdy
ZWVuX3JlZ19zYWZlLmgiCj4gICNpbmNsdWRlICJjYXltYW5fcmVnX3NhZmUuaCIKPiBAQCAtMzcs
OCArMzgsNiBAQAo+Cj4gICNkZWZpbmUgUkVHX1NBRkVfQk1fU0laRSBBUlJBWV9TSVpFKGV2ZXJn
cmVlbl9yZWdfc2FmZV9ibSkKPgo+IC1pbnQgcjYwMF9kbWFfY3NfbmV4dF9yZWxvYyhzdHJ1Y3Qg
cmFkZW9uX2NzX3BhcnNlciAqcCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cmFkZW9uX2JvX2xpc3QgKipjc19yZWxvYyk7Cj4gIHN0cnVjdCBldmVyZ3JlZW5fY3NfdHJhY2sg
ewo+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgZ3JvdXBfc2l6ZTsKPiAgICAgICAg
IHUzMiAgICAgICAgICAgICAgICAgICAgIG5iYW5rczsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yNjAwLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuaAo+IGlu
ZGV4IGU2NmVmNTg3MDZjZDguLmRiZGZmNDU2ODUxNmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yNjAwLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAu
aAo+IEBAIC0yOCwxMCArMjgsMTQgQEAKPiAgI2lmbmRlZiBfX1I2MDBfSF9fCj4gICNkZWZpbmUg
X19SNjAwX0hfXwo+Cj4gK3N0cnVjdCByYWRlb25fYm9fbGlzdDsKPiArc3RydWN0IHJhZGVvbl9j
c19wYXJzZXI7Cj4gIHN0cnVjdCByYWRlb25fZGV2aWNlOwo+Cj4gIHUzMiByNjAwX2dwdV9jaGVj
a19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgaW50IHI2MDBfaWhf
cmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cj4gIHZvaWQgcjYwMF9paF9y
aW5nX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+Cj4gK2ludCByNjAwX2RtYV9j
c19uZXh0X3JlbG9jKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCByYWRlb25fYm9fbGlzdCAqKmNzX3JlbG9jKTsKPiAgI2VuZGlm
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIF9fUjYwMF9IX18gKi8KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3I2MDBfY3MuYwo+IGluZGV4IGYyMGI2MTk0NjY4MTYuLmRjNjhlNTM4ZDVhOTcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2NzLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3I2MDBfY3MuYwo+IEBAIC0yOSw2ICsyOSw3IEBACj4KPiAgI2luY2x1ZGUg
InJhZGVvbi5oIgo+ICAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIKPiArI2luY2x1ZGUgInI2MDAu
aCIKPiAgI2luY2x1ZGUgInI2MDBkLmgiCj4gICNpbmNsdWRlICJyNjAwX3JlZ19zYWZlLmgiCj4K
PiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
