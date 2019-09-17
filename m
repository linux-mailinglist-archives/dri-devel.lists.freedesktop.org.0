Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC37B4DE0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 14:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4D6EC35;
	Tue, 17 Sep 2019 12:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98D56EC35
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:33:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v38so3151210edm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 05:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ilmBg9I2YMwvibWDRJZaEkCfUM/sW+D4XZUuUcRsYfc=;
 b=JnYCiwl16qpkUUxe2LyDEkgZ3CTKiQMHSuB0x4OfJDOw3vxwaa0zNWqZhuJrLuoYNj
 AOyl9ZUH/KymMF7SwWbvtu5mvKunJvuwt9Fm76g6RK2jLHM8wOMq69vjidiYkw8+md3+
 DGKLK06OTBPCNdYV+D3olMsGx8TANth706k2dIamE0eTsIBncein/93eiYAs5LvN7PsF
 64CYe/nqbK1wpthcfIDN7Mis+3kIoH1hYuUrcoRJrRq5Gb6Ku6Kzkl5zccOwc1Lz28w2
 w+1aWMayUztFY58ztouxUwUJQ0Fnwjj0KdhPs/ilZWHOoy2ZnHs5B8cMrF6VO77U70Dz
 z0zA==
X-Gm-Message-State: APjAAAX4dr125/EjlA5g7toaaBQM334G5xyIXqx865UXiGid6hY9ec9y
 iyy6BgLDsybTTWuL0y9HpUhbRA==
X-Google-Smtp-Source: APXvYqx/IQig1FDTnjkgmHtkO1JFOjy029wlCPWaimLNWKzgUT5F7ZMNT3ZZvoo9UOVGaxA0RmMzwg==
X-Received: by 2002:a50:eac3:: with SMTP id u3mr4501795edp.9.1568723634340;
 Tue, 17 Sep 2019 05:33:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z20sm411832edb.3.2019.09.17.05.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 05:33:53 -0700 (PDT)
Date: Tue, 17 Sep 2019 14:33:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 1/7] drm: add drm_print_bits
Message-ID: <20190917123351.GN3958@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
References: <20190904054740.20817-1-kraxel@redhat.com>
 <20190904054740.20817-2-kraxel@redhat.com>
 <66258358-b27e-4eb1-44a4-c90aa342293c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66258358-b27e-4eb1-44a4-c90aa342293c@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ilmBg9I2YMwvibWDRJZaEkCfUM/sW+D4XZUuUcRsYfc=;
 b=BOTF2/Bb/eotbRCnoavsJAQrVi+ZwxxTD2EQ7kS5NbDJ3bSwZGLUGMVTgtaAc8xAvF
 DuiPbfc29C/IgyvFaUBEDXtenoVdllLvQ4rG+MQS60fbRGQnFhsfgvSsCE/jW4HJ3wjF
 +mask6n0m6qYrh2hBXRyMCyTTeHExsm+RtneY=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDI6NDY6NDdQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gCj4gCj4gQW0gMDQuMDkuMTkgdW0gMDc6NDcgc2NocmllYiBHZXJkIEhvZmZt
YW5uOgo+ID4gTmV3IGhlbHBlciB0byBwcmludCBuYW1lZCBiaXRzIG9mIHNvbWUgdmFsdWUgKHRo
aW5rIGZsYWdzIGZpZWxkcykuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50Lmgg
ICAgIHwgIDMgKysrCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIHwgMzMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNl
cnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBi
L2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4gPiBpbmRleCAxMTIxNjVkMzE5NWQuLjEyZDQ5MTYy
NTRiNCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4gPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gQEAgLTg5LDYgKzg5LDkgQEAgX19wcmludGYoMiwg
MykKPiA+ICB2b2lkIGRybV9wcmludGYoc3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFy
ICpmLCAuLi4pOwo+ID4gIHZvaWQgZHJtX3B1dHMoc3RydWN0IGRybV9wcmludGVyICpwLCBjb25z
dCBjaGFyICpzdHIpOwo+ID4gIHZvaWQgZHJtX3ByaW50X3JlZ3NldDMyKHN0cnVjdCBkcm1fcHJp
bnRlciAqcCwgc3RydWN0IGRlYnVnZnNfcmVnc2V0MzIgKnJlZ3NldCk7Cj4gPiArdm9pZCBkcm1f
cHJpbnRfYml0cyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsCj4gPiArCQkgICAgdW5zaWduZWQgbG9u
ZyB2YWx1ZSwgY29uc3QgY2hhciAqYml0c1tdLAo+ID4gKwkJICAgIHVuc2lnbmVkIGludCBmcm9t
LCB1bnNpZ25lZCBpbnQgdG8pOwo+ID4gIAo+ID4gIF9fcHJpbnRmKDIsIDApCj4gPiAgLyoqCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcmludC5jCj4gPiBpbmRleCBhZDMwMmQ3MWVlZWUuLmRmYTI3MzY3ZWJiOCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmludC5jCj4gPiBAQCAtMTg1LDYgKzE4NSwzOSBAQCB2b2lkIGRybV9w
cmludGYoc3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpmLCAuLi4pCj4gPiAgfQo+
ID4gIEVYUE9SVF9TWU1CT0woZHJtX3ByaW50Zik7Cj4gPiAgCj4gPiArLyoqCj4gPiArICogZHJt
X3ByaW50X2JpdHMgLSBwcmludCBiaXRzIHRvIGEgJmRybV9wcmludGVyIHN0cmVhbQo+ID4gKyAq
Cj4gPiArICogUHJpbnQgYml0cyAoaW4gZmxhZyBmaWVsZHMgZm9yIGV4YW1wbGUpIGluIGh1bWFu
IHJlYWRhYmxlIGZvcm0uCj4gPiArICogVGhlIGZpcnN0IG5hbWUgaW4gdGhlIEBiaXRzIGFycmF5
IGlzIGZvciB0aGUgYml0IGluZGV4ZWQgYnkgQGZyb20uCj4gPiArICoKPiA+ICsgKiBAcDogdGhl
ICZkcm1fcHJpbnRlcgo+ID4gKyAqIEB2YWx1ZTogZmllbGQgdmFsdWUuCj4gPiArICogQGJpdHM6
IEFycmF5IHdpdGggYml0IG5hbWVzLgo+ID4gKyAqIEBmcm9tOiBzdGFydCBvZiBiaXQgcmFuZ2Ug
dG8gcHJpbnQgKGluY2x1c2l2ZSkuCj4gPiArICogQHRvOiBlbmQgb2YgYml0IHJhbmdlIHRvIHBy
aW50IChleGNsdXNpdmUpLgoKSnVzdCBhbiBhc2lkZTogQXQgbGVhc3QgaW4gZHJtIHdlIGdlbmVy
YWxseSBidXQgdGhlIHBhcmFtZXRlciBkb2NzIGFib3ZlCnRoZSBmcmVlLWZsb3cgdGV4dC4KLURh
bmllbAo+ID4gKyAqLwo+ID4gK3ZvaWQgZHJtX3ByaW50X2JpdHMoc3RydWN0IGRybV9wcmludGVy
ICpwLAo+ID4gKwkJICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUsIGNvbnN0IGNoYXIgKmJpdHNbXSwK
PiA+ICsJCSAgICB1bnNpZ25lZCBpbnQgZnJvbSwgdW5zaWduZWQgaW50IHRvKQo+ID4gK3sKPiA+
ICsJYm9vbCBmaXJzdCA9IHRydWU7Cj4gPiArCXVuc2lnbmVkIGludCBpOwo+ID4gKwo+ID4gKwlm
b3IgKGkgPSBmcm9tOyBpIDwgdG87IGkrKykgewo+ID4gKwkJaWYgKCEodmFsdWUgJiAoMSA8PCBp
KSkpCj4gPiArCQkJY29udGludWU7Cj4gPiArCQlpZiAoV0FSTl9PTl9PTkNFKCFiaXRzW2ktZnJv
bV0pKQo+ID4gKwkJCWNvbnRpbnVlOwo+ID4gKwkJZHJtX3ByaW50ZihwLCAiJXMlcyIsIGZpcnN0
ID8gIiIgOiAiLCIsCj4gPiArCQkJICAgYml0c1tpLWZyb21dKTsKPiA+ICsJCWZpcnN0ID0gZmFs
c2U7Cj4gPiArCX0KPiA+ICsJaWYgKGZpcnN0KQo+ID4gKwkJZHJtX3ByaW50ZihwLCAiKG5vbmUp
Iik7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0woZHJtX3ByaW50X2JpdHMpOwo+ID4gKwo+ID4g
IHZvaWQgZHJtX2Rldl9wcmludGsoY29uc3Qgc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFy
ICpsZXZlbCwKPiA+ICAJCSAgICBjb25zdCBjaGFyICpmb3JtYXQsIC4uLikKPiA+ICB7Cj4gPiAK
PiAKPiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
Cj4gLS0gCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4g
U1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1LCA5MDQwOSBOdWVybmJlcmcsIEdlcm1h
bnkKPiBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKPiBI
UkIgMjEyODQgKEFHIE7DvHJuYmVyZykKPiAKCgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
