Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58528132753
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258726E064;
	Tue,  7 Jan 2020 13:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EB66E064
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:13:50 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id f16so20469397qvi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 05:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P/SE5McdrTSka+bx/IZ5kkM57UgYz4XAyQjoMJHuUQs=;
 b=lp6BmAU0n6esjFwvTsD7juffeuCaGxC1bSIiRNmFr/sUC7nD5ezvlMA1x7UHlOLYXZ
 xDPoQt7suR7V6Rmb6dy09Qjh7HkEXo1/ev014cf5hflGFRxsp52Lr07pRFS+LElYp6K4
 aCUJYZuW+cZyknx5s5p8l/Kd72gHgbGO1cM5KX3ge2uJhU9b8k+L0ZfXWym+zmpB93Xc
 coCXwor7WgQCDiokAh0sCEoVPu3p6dBqfVfn8Z6jrrlp2MGxEuC+NKBDebCcPYg9hz4z
 PIrQYpG7mvATEWjsO08YCVZmyl4udH1ZEyOukIzlb/dcM6B92e1rpsUaz3fNlbPPwKs6
 eNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P/SE5McdrTSka+bx/IZ5kkM57UgYz4XAyQjoMJHuUQs=;
 b=Mmtc6tLUnT5nh7Mww/8cvt2iYcDsRk3vaq2AVcrdMQyGE93EqySwGBGjiAlcyqMVRy
 +zecTiqszZtl9yU88Zk5Jsvk/XLu7jdaR29Vg271hJ1hgPQAUOo+HwoYPWlhwRkokfGl
 6XuVtjJ8fdfD6hBunFshxEg02ntAo3W0VDB2gpnUuaT1SNKfEKw7Q9f0ol9SzXEkVsLV
 Mf3ePrkFeq9GLSjytNCSV7vgo3x26kk8UWqxeGFEEvS9cbdjSnjJqV6sJOoua1gnk8TF
 FGEHuvvlB5hifnOY34HTG4AkeG7oZIL50aFkKmDhhAfYniITiVv3pC6gSnCP3j6/gKS+
 pxew==
X-Gm-Message-State: APjAAAXHIHR4bL1DcvBvu31wDda3HPTzrdI7V5RXyd0yVhJfwlNuAtag
 wS/zYxZuOmeLGNRMtxCf6QqRB/YtaJ53SG50BbxDxA==
X-Google-Smtp-Source: APXvYqxD8SqL3UJjUIuFxPcR3Me6JeA87ulj3MZhtnLa0lw2HLKk/7HlGnEg2mKYujkBBWSJY2LF26CwTxc/tN5acsw=
X-Received: by 2002:a0c:cd8e:: with SMTP id v14mr83896788qvm.182.1578402829335; 
 Tue, 07 Jan 2020 05:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20191210102437.19377-1-benjamin.gaignard@st.com>
In-Reply-To: <20191210102437.19377-1-benjamin.gaignard@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 7 Jan 2020 14:13:38 +0100
Message-ID: <CA+M3ks7ha2PkznLJ8JO=ZLo9eN2Q3ijiR+Zw9x2PKPH3Vwbovw@mail.gmail.com>
Subject: Re: [PATCH] drm/modes: tag unused variables to avoid warnings
To: Benjamin Gaignard <benjamin.gaignard@st.com>
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAxMSBkw6ljLiAyMDE5IMOgIDEwOjIwLCBCZW5qYW1pbiBHYWlnbmFyZAo8YmVuamFt
aW4uZ2FpZ25hcmRAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBTb21lIHZhcmlhYmxlcyBhcmUgc2V0
IGJ1dCBuZXZlciB1c2VkLiBUbyBhdm9pZCB3YXJuaW5nIHdoZW4gY29tcGlsaW5nCj4gd2l0aCBX
PTEgYW5kIGtlZXAgdGhlIGFsZ29yaXRobSBsaWtlIGl0IGlzIHRhZyB0aGVzZXMgdmFyaWFibGVz
Cj4gd2l0aCBfbWF5YmVfdW51c2VkIG1hY3JvLgoKR2VudGxlIHBpbmcuClRoYW5rcywKQmVuamFt
aW4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25h
cmRAc3QuY29tPgo+IC0tLQo+IGNoYW5nZXMgaW4gdGhpcyB2ZXJzaW9uOgo+IC0gZG8gbm90IG1v
ZGlmeSB0aGUgY29kZSB0byByZW1vdmUgdGhlIHVudXNlZCB2YXJpYWJsZXMKPiAgIGp1c3QgcHJl
Zml4IHRoZW0gd2l0aCBfX21heWJlX3VudXNlZCBtYWNyby4KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVzLmMgfCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IGluZGV4IDg4MjMyNjk4ZDdh
MC4uNzBhZWQ0ZTI5OTBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IEBAIC0yMzMsNyArMjMzLDcg
QEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9jdnRfbW9kZShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBpbnQgaGRpc3BsYXksCj4gICAgICAgICAgICAgICAgIC8qIDMpIE5vbWluYWwgSFN5
bmMgd2lkdGggKCUgb2YgbGluZSBwZXJpb2QpIC0gZGVmYXVsdCA4ICovCj4gICNkZWZpbmUgQ1ZU
X0hTWU5DX1BFUkNFTlRBR0UgICA4Cj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoYmxh
bmtfcGVyY2VudGFnZTsKPiAtICAgICAgICAgICAgICAgaW50IHZzeW5jYW5kYmFja19wb3JjaCwg
dmJhY2tfcG9yY2gsIGhibGFuazsKPiArICAgICAgICAgICAgICAgaW50IHZzeW5jYW5kYmFja19w
b3JjaCwgX19tYXliZV91bnVzZWQgdmJhY2tfcG9yY2gsIGhibGFuazsKPgo+ICAgICAgICAgICAg
ICAgICAvKiBlc3RpbWF0ZWQgdGhlIGhvcml6b250YWwgcGVyaW9kICovCj4gICAgICAgICAgICAg
ICAgIHRtcDEgPSBIVl9GQUNUT1IgKiAxMDAwMDAwICAtCj4gQEAgLTM4Niw5ICszODYsMTAgQEAg
ZHJtX2d0Zl9tb2RlX2NvbXBsZXgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNwbGF5
LCBpbnQgdmRpc3BsYXksCj4gICAgICAgICBpbnQgdG9wX21hcmdpbiwgYm90dG9tX21hcmdpbjsK
PiAgICAgICAgIGludCBpbnRlcmxhY2U7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgaGZyZXFfZXN0
Owo+IC0gICAgICAgaW50IHZzeW5jX3BsdXNfYnAsIHZiYWNrX3BvcmNoOwo+IC0gICAgICAgdW5z
aWduZWQgaW50IHZ0b3RhbF9saW5lcywgdmZpZWxkcmF0ZV9lc3QsIGhwZXJpb2Q7Cj4gLSAgICAg
ICB1bnNpZ25lZCBpbnQgdmZpZWxkX3JhdGUsIHZmcmFtZV9yYXRlOwo+ICsgICAgICAgaW50IHZz
eW5jX3BsdXNfYnAsIF9fbWF5YmVfdW51c2VkIHZiYWNrX3BvcmNoOwo+ICsgICAgICAgdW5zaWdu
ZWQgaW50IHZ0b3RhbF9saW5lcywgX19tYXliZV91bnVzZWQgdmZpZWxkcmF0ZV9lc3Q7Cj4gKyAg
ICAgICB1bnNpZ25lZCBpbnQgX19tYXliZV91bnVzZWQgaHBlcmlvZDsKPiArICAgICAgIHVuc2ln
bmVkIGludCB2ZmllbGRfcmF0ZSwgX19tYXliZV91bnVzZWQgdmZyYW1lX3JhdGU7Cj4gICAgICAg
ICBpbnQgbGVmdF9tYXJnaW4sIHJpZ2h0X21hcmdpbjsKPiAgICAgICAgIHVuc2lnbmVkIGludCB0
b3RhbF9hY3RpdmVfcGl4ZWxzLCBpZGVhbF9kdXR5X2N5Y2xlOwo+ICAgICAgICAgdW5zaWduZWQg
aW50IGhibGFuaywgdG90YWxfcGl4ZWxzLCBwaXhlbF9mcmVxOwo+IC0tCj4gMi4xNS4wCj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
