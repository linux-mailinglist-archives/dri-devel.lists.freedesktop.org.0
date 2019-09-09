Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10683AD5C2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 11:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE2989AB5;
	Mon,  9 Sep 2019 09:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB9589AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 09:33:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id h126so4681823qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 02:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2tHmH1stIAhWci8qIBPtmNf+VD11DJ+UCL9f9Y17abo=;
 b=YNLDJcy/smlh/TuovZN/u0j6pdBwtcu1PuIWbPFBUsaZ8MbG06v0AtYKajuo30QChh
 i0pNllcxlgimzWEYnzIf7oms82fRjPVpSsrJmxKEsoYR6LVfmL1ZRdm0xyy7Jm4sX2Mv
 7cD7lL4c/ur/FE3PWv7WPaolXhOVoAqvX9+B01Bb6j51rxWyjbfYMxJCWMWVpqiBxrdr
 llvsdIWK6DjuKIZ4KR/2szPNlbTONWEb1WCyQrhCaPQF1GKDGjnx6+i4M+fkedskFX+3
 RcIA3Via30540V2j4z85pCQymxKl0bK6kf8lBttzupRy2SBZoC1weKMs2AEuWRG7+p6E
 SSiQ==
X-Gm-Message-State: APjAAAXGzdvzs3FGTTzdBiVkm1FURg4vYxCSx1dpqLajYcOt6ap5Wn63
 nK5qiBlDmcpbi/0iYDLH+LGnN0SyIN5BxsBsGx2jwQ==
X-Google-Smtp-Source: APXvYqyJ2skoDsCxCcviaFJEdYxXi0/LKrzEr6iBfeSawT0Q0tTImcnSBrPILhJzLyjKObBRKhPopIxIjwlVAoBadOo=
X-Received: by 2002:ae9:dd81:: with SMTP id r123mr6813864qkf.103.1568021588009; 
 Mon, 09 Sep 2019 02:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <1567761708-31777-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1567761708-31777-1-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 9 Sep 2019 11:32:57 +0200
Message-ID: <CA+M3ks6MQBScJ4mOY3VD-OTP-wG2VfSLMxA-9z6ZkNAeO53SMA@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder mode
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2tHmH1stIAhWci8qIBPtmNf+VD11DJ+UCL9f9Y17abo=;
 b=vrZnv+PStMf+ECSwAA9EBVmkJ1p3GaWvYFKNeMG3Owov4IHFuOEVR00hBZEXUYgKSh
 OieKMKPXAWSyeWC/HP+/8QjHPAQdr34fWMdBDb4EyrTrZzcaWm+bFSXF8/i1Qu+HEiyz
 CKq1XWiDER91AclIs00Rtj003JXkH1Eu9Ku5Gq5DOUvFkeqvW6kHPWF61Px47znWI9K1
 S/swfW3z34aw9icDEOL4KLxAVFXkRZCd61hfEJTlf//onBcY4c/nTKxMTOkbTn4T4qAu
 gUry9EPHH1pj8bML9BWQUN4v2UvpiQKwO3J3lFPxgg0Hq0i2zXZ1H1fYb9CNTHuZvNPo
 y/0w==
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
Cc: David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgdmVuLiA2IHNlcHQuIDIwMTkgw6AgMTE6MjIsIFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5m
ZXJ0cmVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBUaGUgaW1wbGVtZW50YXRpb24gb2YgZnVuY3Rp
b25zIGVuY29kZXJfZW5hYmxlIGFuZCBlbmNvZGVyX2Rpc2FibGUKPiBtYWtlIHBvc3NpYmxlIHRv
IGNvbnRyb2wgdGhlIHBpbmN0cmwgYWNjb3JkaW5nIHRvIHRoZSBlbmNvZGVyIHR5cGUuCj4gVGhl
IHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0ZWQgb25seSBpZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQ
SS4KPiBUaGlzIGhlbHBzIHRvIG1vdmUgdGhlIERQSS1yZWxhdGVkIHBpbmN0cmwgY29uZmlndXJh
dGlvbiBmcm9tCj4gYWxsIHRoZSBwYW5lbCBvciBicmlkZ2UgdG8gdGhlIExUREMgZHQgbm9kZS4K
Pgo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+
Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQsClRoYW5rcywKQmVuamFtaW4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jCj4gaW5kZXggM2FiNGZiZi4uMWM0ZmRlMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gQEAgLTE1
LDYgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfYWRkcmVzcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvcmVzZXQuaD4KPiBAQCAtMTA0MCw2ICsxMDQxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2VuY29kZXJfZnVuY3MgbHRkY19lbmNvZGVyX2Z1bmNzID0gewo+ICAgICAgICAgLmRl
c3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+ICB9Owo+Cj4gK3N0YXRpYyB2b2lkIGx0ZGNf
ZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiArewo+ICsgICAg
ICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gKwo+ICsgICAgICAg
RFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPiArCj4gKyAgICAgICAvKiBTZXQgdG8gc2xlZXAgc3Rh
dGUgdGhlIHBpbmN0cmwgd2hhdGV2ZXIgdHlwZSBvZiBlbmNvZGVyICovCj4gKyAgICAgICBwaW5j
dHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZGV2LT5kZXYpOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
dm9pZCBsdGRjX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiAr
ewo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7Cj4gKwo+
ICsgICAgICAgRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPiArCj4gKyAgICAgICAvKgo+ICsgICAg
ICAgICogU2V0IHRvIGRlZmF1bHQgc3RhdGUgdGhlIHBpbmN0cmwgb25seSB3aXRoIERQSSB0eXBl
Lgo+ICsgICAgICAgICogT3RoZXJzIHR5cGVzIGxpa2UgRFNJLCBkb24ndCBuZWVkIHBpbmN0cmwg
ZHVlIHRvCj4gKyAgICAgICAgKiBpbnRlcm5hbCBicmlkZ2UgKHRoZSBzaWduYWxzIGRvIG5vdCBj
b21lIG91dCBvZiB0aGUgY2hpcHNldCkuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChlbmNv
ZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUEkpCj4gKyAgICAgICAgICAg
ICAgIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGRldi0+ZGV2KTsKPiArfQo+ICsK
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgbHRkY19lbmNv
ZGVyX2hlbHBlcl9mdW5jcyA9IHsKPiArICAgICAgIC5kaXNhYmxlID0gbHRkY19lbmNvZGVyX2Rp
c2FibGUsCj4gKyAgICAgICAuZW5hYmxlID0gbHRkY19lbmNvZGVyX2VuYWJsZSwKPiArfTsKPiAr
Cj4gIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYs
IHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcjsKPiBAQCAtMTA1NSw2ICsxMDg2LDggQEAgc3RhdGljIGludCBsdGRjX2Vu
Y29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwgc3RydWN0IGRybV9icmlkZ2UgKmJy
aWRnZSkKPiAgICAgICAgIGRybV9lbmNvZGVyX2luaXQoZGRldiwgZW5jb2RlciwgJmx0ZGNfZW5j
b2Rlcl9mdW5jcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgRFJNX01PREVfRU5DT0RFUl9E
UEksIE5VTEwpOwo+Cj4gKyAgICAgICBkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsICZs
dGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPiArCj4gICAgICAgICByZXQgPSBkcm1fYnJpZGdl
X2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwo+ICAgICAgICAgaWYgKHJldCkgewo+ICAg
ICAgICAgICAgICAgICBkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+IEBAIC0xMjgwLDYg
KzEzMTMsOCBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+Cj4gICAg
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobGRldi0+cGl4ZWxfY2xrKTsKPgo+ICsgICAgICAg
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKPiArCj4gICAgICAgICBw
bV9ydW50aW1lX2VuYWJsZShkZGV2LT5kZXYpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+
IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
