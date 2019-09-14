Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EDDB2C03
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 17:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A186F527;
	Sat, 14 Sep 2019 15:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494DE6F526;
 Sat, 14 Sep 2019 15:46:25 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r9so746252edl.10;
 Sat, 14 Sep 2019 08:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eFH4iXt2HpFd5wNrI5MRklz1IyY3NaeinHNqvFrBg0A=;
 b=o4Kwd3CEvK+U9UEwPn0fADNqMo+B5orMZX4/Mlb3/7Fm9+6K9nyWuTf1x4A5B6ODms
 Ht7N9rdSYIRX1sAKx01psEUJ/aqF9fmujT7PzDHEVfpu6RIbVjMXy6mbbR7NCwUrkCJw
 /g9WVv7FlQadnNj+Bw0+Ge+cqRiUzi3+N63WpK6sigFZXU1ag5kt9/mQ7dl/yD1/699L
 GW2kBi2hIrgZsqsu5nFGE3Iwuw3K3wrORSA9DhaxPnvjHpN5fwsl1DVlHzV7WcgP8wWw
 CxcMGtVvg1uT1pCu9rJkt8D7NJfxgf6J3AWlIstMUHmgENYl1RHWtwCYv3+8tMrraamk
 RsEA==
X-Gm-Message-State: APjAAAWSsrQr19JpRjuicuk5dn9hOwC9saZQ7kDIzxssEhI7sPn9UteX
 oQ2Janw2JxEc0E+IoK/ixYNupH0fld3DD/uPaJZpX4hk
X-Google-Smtp-Source: APXvYqz6ZTPaISmDQzOlqWbnHI0Usa4b+3rwr+zz0z1E2QlhVKbTdnxvJhNdaxDHj5aMWtxe0O2mBJTma3+/sOLJLvY=
X-Received: by 2002:a50:935d:: with SMTP id n29mr53279003eda.294.1568475983791; 
 Sat, 14 Sep 2019 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568375189.git.jani.nikula@intel.com>
 <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
In-Reply-To: <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 14 Sep 2019 08:46:13 -0700
Message-ID: <CAF6AEGuEuawA035_jMxu2EoFRrzpXqjGqSEsC_TVjzmB2xXgPg@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm: use drm_debug_enabled() to check for debug
 categories
To: Jani Nikula <jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eFH4iXt2HpFd5wNrI5MRklz1IyY3NaeinHNqvFrBg0A=;
 b=hMysgWbVZ66tTxTEwvY1axECTH3W9Ts9APKz/N3+x6ZHvobtE/WwCPFZdTrIjEMXr/
 JOTSR1CLsc1n81XD4pn38hsP5UgwBjoFymxe1c9N9RTdrm7I00XgMd11gVDEmDHWZbAn
 86Noko/KhIcDQbatMnLtbdNsLtbd9WnheG7ef9AFFoZFK8Z9rx5wmu/YiLhbgZRvErHl
 e98HCyXcXA3PMQh2ldtoa9foS4uCeTXRLmu1AD54znhLswbfTxHu7oNHI5bMwgmrbiW9
 sA3EYyv0gn/Rfe8IDD0kDU4NcATykXpne3OgDbO7KYx34fyM1DbY6KAvFqC4I/HHDWf7
 9P5Q==
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNDo1MiBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPiB3cm90ZToKPgo+IEFsbG93IGJldHRlciBhYnN0cmFjdGlvbiBvZiB0aGUgZHJt
X2RlYnVnIGdsb2JhbCB2YXJpYWJsZSBpbiB0aGUKPiBmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlcy4KPgo+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
SmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CgpJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGNvbmZs
aWN0IHcvIGFueXRoaW5nLCBzbyBsYW5kIHZpYSBkcm0tbWlzYz8KCkJSLAotUgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oCj4gaW5kZXggOWU0MGY1NTljNTFmLi4wMGUzMzUz
ZjlhYWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2tt
cy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oCj4gQEAg
LTI5LDcgKzI5LDcgQEAKPiAgICovCj4gICNkZWZpbmUgRFBVX0RFQlVHKGZtdCwgLi4uKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGRv
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gLSAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShkcm1fZGVidWcgJiBEUk1f
VVRfS01TKSkgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBpZiAodW5s
aWtlbHkoZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0tNUykpKSAgICAgICAgICAgICAgIFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBEUk1fREVCVUcoZm10LCAjI19fVkFfQVJHU19fKTsgXAo+
ICAgICAgICAgICAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1Zyhm
bXQsICMjX19WQV9BUkdTX18pOyAgICAgICAgICAgICAgICAgICAgICBcCj4gQEAgLTQxLDcgKzQx
LDcgQEAKPiAgICovCj4gICNkZWZpbmUgRFBVX0RFQlVHX0RSSVZFUihmbXQsIC4uLikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGRvIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gLSAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShkcm1fZGVidWcgJiBEUk1fVVRfRFJJVkVS
KSkgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZHJt
X2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpKSAgICAgICAgICAgIFwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBEUk1fRVJST1IoZm10LCAjI19fVkFfQVJHU19fKTsgXAo+ICAgICAgICAg
ICAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZyhmbXQsICMjX19W
QV9BUkdTX18pOyAgICAgICAgICAgICAgICAgICAgICBcCj4gLS0KPiAyLjIwLjEKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
