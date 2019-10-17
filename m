Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F95DAB36
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002C16EA56;
	Thu, 17 Oct 2019 11:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716F6EA56
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:29:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y21so2169241wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 04:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y25SQvHW6/7riw64/wdhH01byzi//dz718QUhzJWQoM=;
 b=c/VtfVjDLatB7pdwyNovQ0qIGonpYQjH0bvLzfeGnQZEe11b5uk85U9QMpFhtqVQgS
 801DCmnIXqoHikvVCTjw6N3dftBW6L4F9G1deyIDKlHydjnUNmqStEnQMj8W6cmpZXfk
 /1HZ3Xi9VSdxSv41cfbZLzIiKpIKhbacbZEw6yMWZ9Yzx/17YqkQo3W2V9wNF0T2s1gS
 hKpWGX//A00/qQQU3UqCi8UYMrwKGAGO8xgIoefmtLM/6Pg6fWqqDXZCifRQoOsrRttq
 na/nJsb8zC7Ufu83u7Qjd2QR0XqSs45OJwoDyzbXcEPs7C0KTBDXEaIwRB1wfYoy6tLy
 J82g==
X-Gm-Message-State: APjAAAUTksKRiVWKxxNbPibnuBCJtXn8eweClZckZIwRs8NSnix15VYb
 Zb2cLdDVPQwXt1zNiTxxlVefmw==
X-Google-Smtp-Source: APXvYqy315waZYadAwtLx/wuKd4IUjaUiXe5iNXNBULrE+UNqPPTqxikRQdXUrJkHirN8ZpFE3jJ2w==
X-Received: by 2002:a1c:e057:: with SMTP id x84mr2365727wmg.72.1571311784048; 
 Thu, 17 Oct 2019 04:29:44 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm1795666wmj.5.2019.10.17.04.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 04:29:43 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:29:41 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017112941.qqvgboyambzw63i3@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y25SQvHW6/7riw64/wdhH01byzi//dz718QUhzJWQoM=;
 b=LZ2BxUT3XYkN17tFc8dU93+VqpMf/c0mPGTp3UVIyg3upGlb3iY+XDdf1yfAjNQUV9
 MEbhUG/4TIwoL/i8Lg8m5fewSbe3O7KW9XX4meNTSrHGz/tZpRsIOHp0b43jn04q0XCI
 lO2jcDZa4Y8HiPEG3fP63QY6pTT7blXEh1CEunMeL+cA/8ticCfbt7sVTYaoXZEXw1ke
 5sRkxNtiy98Ej84gJCr8gbkGZ+Xxk1gqz+P34xf6RGTNU0XuTkJ9F5jUvo8ZbLcpK/t2
 wEUD0CrW6jFNo5lUiEKuA4upAA7nY7xJYPs35VaGodmJRe61wsS6q1Mh0BQ+ZhYxEVZu
 Z/lQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDM6NDM6NDZQTSArMDUzMCwgS2lyYW4gR3VuZGEgd3Jv
dGU6Cj4gVGhlIGF1dG8gc3RyaW5nIGRldGVjdGlvbiBhbGdvcml0aG0gY2hlY2tzIGlmIHRoZSBj
dXJyZW50IFdMRUQKPiBzaW5rIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQuIEl0IHRyaWVzIGVuYWJs
aW5nIGV2ZXJ5IHNpbmsgYW5kCj4gY2hlY2tzIGlmIHRoZSBPVlAgZmF1bHQgaXMgb2JzZXJ2ZWQu
IEJhc2VkIG9uIHRoaXMgaW5mb3JtYXRpb24KPiBpdCBkZXRlY3RzIGFuZCBlbmFibGVzIHRoZSB2
YWxpZCBzaW5rIGNvbmZpZ3VyYXRpb24uCj4gQXV0byBjYWxpYnJhdGlvbiB3aWxsIGJlIHRyaWdn
ZXJlZCB3aGVuIHRoZSBPVlAgZmF1bHQgaW50ZXJydXB0cwo+IGFyZSBzZWVuIGZyZXF1ZW50bHkg
dGhlcmVieSBpdCB0cmllcyB0byBmaXggdGhlIHNpbmsgY29uZmlndXJhdGlvbi4KPiAKPiBUaGUg
YXV0by1kZXRlY3Rpb24gYWxzbyBraWNrcyBpbiB3aGVuIHRoZSBjb25uZWN0ZWQgTEVEIHN0cmlu
Zwo+IG9mIHRoZSBkaXNwbGF5LWJhY2tsaWdodCBtYWxmdW5jdGlvbnMgKGJlY2F1c2Ugb2YgZGFt
YWdlKSBhbmQKPiByZXF1aXJlcyB0aGUgZGFtYWdlZCBzdHJpbmcgdG8gYmUgdHVybmVkIG9mZiB0
byBwcmV2ZW50IHRoZQo+IGNvbXBsZXRlIHBhbmVsIGFuZC9vciBib2FyZCBmcm9tIGJlaW5nIGRh
bWFnZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2lyYW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3Jh
Lm9yZz4KCkl0J3MgYSBjb21wbGV4IGJpdCBvZiBjb2RlIGJ1dCBJJ20gT0sgd2l0aCBpdCBpbiBw
cmluY2lwbGUuIEV2ZXJ5dGhpbmcKYmVsb3cgaXMgYWJvdXQgc21hbGwgZGV0YWlscyBhbmQvb3Ig
bml0cGlja2luZy4KCgo+ICtzdGF0aWMgdm9pZCB3bGVkX292cF93b3JrKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKPiArewo+ICsJc3RydWN0IHdsZWQgKndsZWQgPSBjb250YWluZXJfb2Yod29y
aywKPiArCQkJCQkgc3RydWN0IHdsZWQsIG92cF93b3JrLndvcmspOwo+ICsJZW5hYmxlX2lycSh3
bGVkLT5vdnBfaXJxKTsKPiArfQo+ICsKCkEgYml0IG9mIGNvbW1lbnRpbmcgYWJvdXQgd2h5IHdl
IGhhdmUgdG8gd2FpdCAxMG1zIGJlZm9yZSBlbmFibGluZyB0aGUKT1ZQIGludGVycnVwdCB3b3Vs
ZCBiZSBhcHByZWNpYXRlZC4KCgo+ICtzdGF0aWMgaXJxcmV0dXJuX3Qgd2xlZF9vdnBfaXJxX2hh
bmRsZXIoaW50IGlycSwgdm9pZCAqX3dsZWQpCj4gK3sKPiArCXN0cnVjdCB3bGVkICp3bGVkID0g
X3dsZWQ7Cj4gKwlpbnQgcmM7Cj4gKwl1MzIgaW50X3N0cywgZmF1bHRfc3RzOwo+ICsKPiArCXJj
ID0gcmVnbWFwX3JlYWQod2xlZC0+cmVnbWFwLAo+ICsJCQkgd2xlZC0+Y3RybF9hZGRyICsgV0xF
RDNfQ1RSTF9SRUdfSU5UX1JUX1NUUywgJmludF9zdHMpOwo+ICsJaWYgKHJjIDwgMCkgewo+ICsJ
CWRldl9lcnIod2xlZC0+ZGV2LCAiRXJyb3IgaW4gcmVhZGluZyBXTEVEM19JTlRfUlRfU1RTIHJj
PSVkXG4iLAo+ICsJCQlyYyk7Cj4gKwkJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICsJfQo+ICsKPiAr
CXJjID0gcmVnbWFwX3JlYWQod2xlZC0+cmVnbWFwLCB3bGVkLT5jdHJsX2FkZHIgKwo+ICsJCQkg
V0xFRDNfQ1RSTF9SRUdfRkFVTFRfU1RBVFVTLCAmZmF1bHRfc3RzKTsKPiArCWlmIChyYyA8IDAp
IHsKPiArCQlkZXZfZXJyKHdsZWQtPmRldiwgIkVycm9yIGluIHJlYWRpbmcgV0xFRF9GQVVMVF9T
VEFUVVMgcmM9JWRcbiIsCj4gKwkJCXJjKTsKPiArCQlyZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gKwl9
Cj4gKwo+ICsJaWYgKGZhdWx0X3N0cyAmCj4gKwkJKFdMRUQzX0NUUkxfUkVHX09WUF9GQVVMVF9C
SVQgfCBXTEVEM19DVFJMX1JFR19JTElNX0ZBVUxUX0JJVCkpCj4gKwkJZGV2X2RiZyh3bGVkLT5k
ZXYsICJXTEVEIE9WUCBmYXVsdCBkZXRlY3RlZCwgaW50X3N0cz0leCBmYXVsdF9zdHM9ICV4XG4i
LAo+ICsJCQlpbnRfc3RzLCBmYXVsdF9zdHMpOwo+ICsKPiArCWlmIChmYXVsdF9zdHMgJiBXTEVE
M19DVFJMX1JFR19PVlBfRkFVTFRfQklUKSB7Cj4gKwkJbXV0ZXhfbG9jaygmd2xlZC0+bG9jayk7
Cj4gKwkJZGlzYWJsZV9pcnFfbm9zeW5jKHdsZWQtPm92cF9pcnEpOwoKV2UncmUgY3VycmVudGx5
IHJ1bm5pbmcgdGhlIHRocmVhZGVkIElTUiBmb3IgdGhpcyBpcnEuIERvIHdlIHJlYWxseSBuZWVk
CnRvIGRpc2FibGUgaXQ/Cgo+ICsKPiArCQlpZiAod2xlZF9hdXRvX2RldGVjdGlvbl9yZXF1aXJl
ZCh3bGVkKSkKPiArCQkJd2xlZF9hdXRvX3N0cmluZ19kZXRlY3Rpb24od2xlZCk7Cj4gKwo+ICsJ
CWVuYWJsZV9pcnEod2xlZC0+b3ZwX2lycSk7Cj4gKwo+ICsJCW11dGV4X3VubG9jaygmd2xlZC0+
bG9jayk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9Cj4gKwoKU25pcC4K
Cgo+ICtzdGF0aWMgaW50IHdsZWRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gK3sKPiArCXN0cnVjdCB3bGVkICp3bGVkID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5kZXYp
Owo+ICsKPiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmd2xlZC0+b3ZwX3dvcmspOwo+ICsJ
bXV0ZXhfZGVzdHJveSgmd2xlZC0+bG9jayk7CgpIYXZlIHRoZSBpcnEgaGFuZGxlcnMgYmVlbiBk
aXNhYmxlZCBhdCB0aGlzIHBvaW50PwoKQWxzbywgaWYgeW91IHdhbnQgdG8gZGVzdHJveSB0aGUg
bXV0ZXggc2hvdWxkbid0IHRoYXQgY29kZSBiZSAKaW50cm9kdWNlZCBpbiB0aGUgc2FtZSBwYXRj
aCB0aGF0IGludHJvZHVjZXMgdGhlIG11dGV4Pwo+ICsKPiArCXJldHVybiAwOwo+ICt9CgoKRGFu
aWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
