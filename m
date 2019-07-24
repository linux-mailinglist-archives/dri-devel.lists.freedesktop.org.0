Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A487375B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1EE6E62C;
	Wed, 24 Jul 2019 19:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F1C6E62C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:07:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so42766098wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jtQSPuZ1QzMs99js7V9Wo2RTLphiNzuGhsELT//GEEg=;
 b=HlH8HwztSoNG+ZZLD9NTnwwmF3BhEAaoPvIfN//cFZQ33qc6VfB0ohbgW/lorCUFHO
 Cwyu54MOZ4GpwZ1dU3SbNR8j+jXl1lVSC8Fq8BohsnhIpznkzNjFx/yNFwxYe7+WwXWH
 KtMYPhp1Nhr95WH+AinUWhGz2vFxUxZlJfRcqv/rLFd68/GmOyWv7fEzpdzOsAJ4g5Kx
 A3KRcIAbkbFVHmMiz+a1mmAFesmivkLoPIpos/SPQD92a+oem0/zkKaGq/eaaipWokF/
 ECrQdoxUfkC41P+KO2pNxVyyNdMoK7UJoILBQhO/IVWF4pob7h42cs7ctFrU4iQaxqVt
 WvpQ==
X-Gm-Message-State: APjAAAXTfitvSobV2oRTwTPQ0FyfiQi+scKqfAKZ7xToQOle3r+tN9Xo
 HBKhjcjnjnk9qQ6Z6AXt5QI=
X-Google-Smtp-Source: APXvYqzW5J/UxiwCLKihWU+W6v0QY2SUnZdcHCLGNhpwuL3J4T0/WFqdxk7zt2m7BHrB78puwFES8w==
X-Received: by 2002:a05:600c:212:: with SMTP id
 18mr25939276wmi.88.1563995264126; 
 Wed, 24 Jul 2019 12:07:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id w23sm48058527wmi.45.2019.07.24.12.07.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:07:43 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:07:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
Message-ID: <20190724190741.GD14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
 <20190723122016.30279-2-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-2-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDZQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHN0YXRpYyBmdW5jdGlvbiwgZXh5bm9zX2J1
c19wcm9maWxlX2luaXQoKSwgZXh0cmFjdGVkCj4gZnJvbSBleHlub3NfYnVzX3Byb2JlKCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3Vu
Zy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgfCAxMDYgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2Vy
dGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RldmZy
ZXEvZXh5bm9zLWJ1cy5jIGIvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYwo+IGluZGV4IGQ5
ZjM3NzkxMmMxMC4uZDhmMWVmYWYyZDQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZGV2ZnJlcS9l
eHlub3MtYnVzLmMKPiArKysgYi9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCj4gQEAgLTM3
MiwxMiArMzcyLDY5IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2J1c19wYXJzZV9vZihzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3RhdGljIGludCBleHlu
b3NfYnVzX3Byb2ZpbGVfaW5pdChzdHJ1Y3QgZXh5bm9zX2J1cyAqYnVzLAo+ICsJCQkJICAgc3Ry
dWN0IGRldmZyZXFfZGV2X3Byb2ZpbGUgKnByb2ZpbGUpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2Ug
KmRldiA9IGJ1cy0+ZGV2Owo+ICsJc3RydWN0IGRldmZyZXFfc2ltcGxlX29uZGVtYW5kX2RhdGEg
Km9uZGVtYW5kX2RhdGE7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qIEluaXRpYWxpemUgdGhlIHN0
cnVjdCBwcm9maWxlIGFuZCBnb3Zlcm5vciBkYXRhIGZvciBwYXJlbnQgZGV2aWNlICovCj4gKwlw
cm9maWxlLT5wb2xsaW5nX21zID0gNTA7Cj4gKwlwcm9maWxlLT50YXJnZXQgPSBleHlub3NfYnVz
X3RhcmdldDsKPiArCXByb2ZpbGUtPmdldF9kZXZfc3RhdHVzID0gZXh5bm9zX2J1c19nZXRfZGV2
X3N0YXR1czsKPiArCXByb2ZpbGUtPmV4aXQgPSBleHlub3NfYnVzX2V4aXQ7Cj4gKwo+ICsJb25k
ZW1hbmRfZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqb25kZW1hbmRfZGF0YSksIEdG
UF9LRVJORUwpOwo+ICsJaWYgKCFvbmRlbWFuZF9kYXRhKSB7Cj4gKwkJcmV0ID0gLUVOT01FTTsK
PiArCQlnb3RvIGVycjsKCkp1c3QgcmV0dXJuIHByb3BlciBlcnJvciBjb2RlLiBMZXNzIGxpbmVz
LCBvYnZpb3VzIGNvZGUgc2luY2UgeW91IGRvIG5vdApoYXZlIGFueSBjbGVhbnVwIGluIGVycm9y
IHBhdGguCgo+ICsJfQo+ICsJb25kZW1hbmRfZGF0YS0+dXB0aHJlc2hvbGQgPSA0MDsKPiArCW9u
ZGVtYW5kX2RhdGEtPmRvd25kaWZmZXJlbnRpYWwgPSA1Owo+ICsKPiArCS8qIEFkZCBkZXZmcmVx
IGRldmljZSB0byBtb25pdG9yIGFuZCBoYW5kbGUgdGhlIGV4eW5vcyBidXMgKi8KPiArCWJ1cy0+
ZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2aWNlKGRldiwgcHJvZmlsZSwKPiArCQkJCQkJ
REVWRlJFUV9HT1ZfU0lNUExFX09OREVNQU5ELAo+ICsJCQkJCQlvbmRlbWFuZF9kYXRhKTsKPiAr
CWlmIChJU19FUlIoYnVzLT5kZXZmcmVxKSkgewo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IGFkZCBkZXZmcmVxIGRldmljZVxuIik7Cj4gKwkJcmV0ID0gUFRSX0VSUihidXMtPmRldmZyZXEp
Owo+ICsJCWdvdG8gZXJyOwo+ICsJfQo+ICsKPiArCS8qIFJlZ2lzdGVyIG9wcF9ub3RpZmllciB0
byBjYXRjaCB0aGUgY2hhbmdlIG9mIE9QUCAgKi8KPiArCXJldCA9IGRldm1fZGV2ZnJlcV9yZWdp
c3Rlcl9vcHBfbm90aWZpZXIoZGV2LCBidXMtPmRldmZyZXEpOwo+ICsJaWYgKHJldCA8IDApIHsK
PiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBvcHAgbm90aWZpZXJcbiIpOwo+
ICsJCWdvdG8gZXJyOwoKVGhlIHNhbWUgLSByZXR1cm4gZXJyLgoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
