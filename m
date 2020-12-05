Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D06D2D0C3E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1C56E5A9;
	Mon,  7 Dec 2020 08:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2566E446
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:52:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so10516920ljo.11
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Dec 2020 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bBF57HirJUWNF1QYKQCv5cFAIUWWtnZdZjsBsF1FLJE=;
 b=IdysiPjmnPVweioFPBqM2j0kXFOrazfcFWyxe+MuLYeOEAC2vr1O37U8hUDQcLe8C5
 xxd+KyrAq4eW4uYdJ69QH+WpDKc1Dhg1DCO0Iey/XGIdIydoRgvfFbdoalfIsJWZq2Z3
 iMIgHy8nTthhfK6rf+aL8juA5ZMNuw7tVT+DeZbOcQcb+dyKG69/HmAjUD4ynpgbAqX/
 uR3sJlzTwaCm9CDD7IP5d1l5VJZ3pMesUY3XUJj+wr2zZa1kQwiYbkkFR9JrMiADJFqy
 j3koh2M3FZ5JzRfwgDddQORHcQCV+tUDVOUggU4P0PK6r4Tug67HItzMaZr5sx1jLQ82
 GBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bBF57HirJUWNF1QYKQCv5cFAIUWWtnZdZjsBsF1FLJE=;
 b=K48VRd96xTXyQ97mKq6+32PefyItHgjpHwgq7d+JfAuZccpmU+L44jtnaXx5ikKcaI
 dKamPbnLlJlTkju2ahgJYpy6vNJviTEOcmav4LNjJBzE+cS2fBhN5ZmDKkVeSVerxPYg
 36DmktRfaHYpQ15YUJolZZklM+XnWihOVlFT4x7ryOIGnt7VCNoUlyEjnCtOTIGNO7H+
 gjWnVd5SQaRr76ov1c7Bx+jnb/YsbWBD6VxbUwNiK8K16shcLM/B0qEIJT5eB5/Rn26v
 /IfSi1303ZJU6gvZd7qdaoCvAWhJAeKyjhu76uEQQR2lD0WznrcOHI4eXEGHkNZp0cTs
 P/qw==
X-Gm-Message-State: AOAM531szPa1kCeaSkqDRY6Bvc2zqP9bJILV0NYzGGy0h92UFY5FcU9Z
 4O5BHtvnZ+XoJd8dNmhyO8M=
X-Google-Smtp-Source: ABdhPJzGAM8dSVUfPrR/U+Sun2Ezu5zVBu5XVo94j8F7KWeaq9PoGepIjjXZVKrnnHP9DQTWYaRB2Q==
X-Received: by 2002:a2e:8053:: with SMTP id p19mr5590859ljg.321.1607197960096; 
 Sat, 05 Dec 2020 11:52:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.googlemail.com with ESMTPSA id p28sm2465992ljn.22.2020.12.05.11.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 11:52:39 -0800 (PST)
Subject: Re: [PATCH v11 04/10] memory: tegra124-emc: Make driver modular
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201203192439.16177-1-digetx@gmail.com>
 <20201203192439.16177-5-digetx@gmail.com> <X8pmqVRFaBtkwDtr@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <76eb57bf-feaf-ad86-a2d6-152897af7f2f@gmail.com>
Date: Sat, 5 Dec 2020 22:52:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X8pmqVRFaBtkwDtr@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMTIuMjAyMCAxOTo0MSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4+ICtib29s
IHRlZ3JhMTI0X2Nsa19lbWNfZHJpdmVyX2F2YWlsYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPj4g
K3sKPj4gKwlzdHJ1Y3QgdGVncmFfY2xrX2VtYyAqdGVncmEgPSBjb250YWluZXJfb2YoaHcsIHN0
cnVjdCB0ZWdyYV9jbGtfZW1jLCBodyk7Cj4+ICsKPj4gKwlyZXR1cm4gdGVncmEtPnByZXBhcmVf
dGltaW5nX2NoYW5nZSAmJiB0ZWdyYS0+Y29tcGxldGVfdGltaW5nX2NoYW5nZTsKPj4gK30KPiAK
PiBUaGlzIGxvb2tzIGEgYml0IGhhY2tpc2ggYW5kIEkgcHJlZmVyIHRoZSB3YXkgdGhpcyB3YXMg
ZG9uZSBmb3IKPiBUZWdyYTIxMC4KCkkgbWF5IGhhdmUgYW4gb3Bwb3NpdGUgb3BpbmlvbiA6KQoK
PiBCdXQgdGhhdCdzIG1vc3RseSBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgYW5kIHdlIGNhbiBh
bHdheXMKPiByZXN0cnVjdHVyZSB0aGlzIGlmIHdlIHdhbnQgdG8uCgpUaGlzIGlzIHRydWUuIEkn
bSBub3Qgc2F5aW5nIHRoYXQgdGhlIGN1cnJlbnQgdjExIHZhcmlhbnQgaXMgYWJzb2x1dGVseQpp
ZGVhbCwgYnV0IGl0IHNob3VsZCBiZSBnb29kIGVub3VnaCBmb3IgdGhlIHN0YXJ0ZXIgKElNTykg
YW5kIGFjdHVhbGx5IEkKZG9uJ3QgaGF2ZSBhbnkgaWRlYXMgcmlnaHQgYWJvdXQgd2hhdCBjb3Vs
ZCBiZSBkb25lIGJldHRlci4KCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay90ZWdyYS9jbGst
dGVncmExMjQuYyBiL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay10ZWdyYTEyNC5jCj4+IGluZGV4IGU5
MzEzMTlkY2M5ZC4uOTM0NTIwYWFiNmUzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay90ZWdy
YS9jbGstdGVncmExMjQuYwo+PiArKysgYi9kcml2ZXJzL2Nsay90ZWdyYS9jbGstdGVncmExMjQu
Ywo+PiBAQCAtMTUwMCw2ICsxNTAwLDI2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB0ZWdyYTEyNF8x
MzJfY2xvY2tfaW5pdF9wcmUoc3RydWN0IGRldmljZV9ub2RlICpucCkKPj4gIAl3cml0ZWwocGxs
ZF9iYXNlLCBjbGtfYmFzZSArIFBMTERfQkFTRSk7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBzdHJ1
Y3QgY2xrICp0ZWdyYTEyNF9jbGtfc3JjX29uZWNlbGxfZ2V0KHN0cnVjdCBvZl9waGFuZGxlX2Fy
Z3MgKmNsa3NwZWMsCj4+ICsJCQkJCQl2b2lkICpkYXRhKQo+PiArewo+PiArCXN0cnVjdCBjbGtf
aHcgKmh3Owo+PiArCXN0cnVjdCBjbGsgKmNsazsKPj4gKwo+PiArCWNsayA9IG9mX2Nsa19zcmNf
b25lY2VsbF9nZXQoY2xrc3BlYywgZGF0YSk7Cj4+ICsJaWYgKElTX0VSUihjbGspKQo+PiArCQly
ZXR1cm4gY2xrOwo+PiArCj4+ICsJaHcgPSBfX2Nsa19nZXRfaHcoY2xrKTsKPj4gKwo+PiArCWlm
IChjbGtzcGVjLT5hcmdzWzBdID09IFRFR1JBMTI0X0NMS19FTUMpIHsKPj4gKwkJaWYgKCF0ZWdy
YTEyNF9jbGtfZW1jX2RyaXZlcl9hdmFpbGFibGUoaHcpKQo+PiArCQkJcmV0dXJuIEVSUl9QVFIo
LUVQUk9CRV9ERUZFUik7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIGNsazsKPj4gK30KPiAKPiBI
bS4uLiB3aHkgZXhhY3RseSBkbyB3ZSBuZWVkIHRoaXM/IE9uIFRlZ3JhMjEwIGFuZCBsYXRlciwg
dGhlIEVNQyBkcml2ZXIKPiBpcyB0aGUgb25seSBjb25zdW1lciBvZiB0aGUgRU1DIGNsb2NrIGFu
ZCBzaW5jZSBpdCBhbHNvIHByb3ZpZGVzIHNvbWUgb2YKPiB0aGUgbmVjZXNzYXJ5IHBhcnRzIHRv
IHNjYWxlIHRoZSBFTUMgY2xvY2ssIHRoYXQncyBhIGNoaWNrZW4gYW5kIGVnZwo+IHByb2JsZW0u
CgpUaGUgVDEyNCBFTUMgZHJpdmVyIGhhcyBhbiBleGlzdGluZyBhY3RpdmUgdXNlciBmb3IgdGhl
IEVNQyBjbG9jaywgdGhlCmRldmZyZXEvYWN0bW9uIGRyaXZlciB3aGljaCB3YXRjaGVzIGFuZCBk
cml2ZXMgdGhlIEVNQyBjbG9jayByYXRlLiBUaGUKRU1DIGNsb2NrIHNoYW4ndCBiZSByZXF1ZXN0
ZWQgYnkgdGhlIGRldmZyZXEgZHJpdmVyIHVudGlsIEVNQyBkcml2ZXIgaXMKcmVhZHksIHRoZSBv
bmx5IHNlbnNpYmxlIHdheSB0byBhY2hpZXZlIHRoaXMgaXMgaW1wbGVtZW50ZWQgYnkgdGhpcyBw
YXRjaC4KClRoZSBkZXZmcmVxIGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgVDIxMCAoeWV0PykgYW5k
IHlvdSBzaG91bGQgd2l0bmVzcwp0aGUgcHJvYmxlbSBpZiB5b3UnbGwgdHJ5IHRvIGltcGxlbWVu
dCB0aGUgVDIxMCBzdXBwb3J0LgoKPiBJJ20gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIGhv
dyB0aGlzIGlzIHN1cHBvc2VkIHRvIHdvcmsKPiBoZXJlIGFuZCB3aHkgd2UgY2FuJ3QgZG8gdGhp
cyBpbiBhIHNpbWlsYXIgd2F5IHRoYW4gVGVncmEyMTAuCgpUaGUgQ0NGIHJldHVybnMgLUVQUk9C
RV9ERUZFUiBmb3IgY2xrX2dldCgpIG9ubHkgdW50aWwgY2xvY2sgcHJvdmlkZXIgaXMKcmVnaXN0
ZXJlZCwgb3RoZXJ3aXNlIGl0IHJldHVybnMgYSBkdW1teS9zdHViIGNsb2NrIG9uY2UgcHJvdmlk
ZXIgaXMKYXZhaWxhYmxlIGFuZCBjbGsgKG9mIHRoZSBwcm92aWRlcikgaXNuJ3QgcmVnaXN0ZXJl
ZC4gVGhlIENDRiBwcm92aWRlcgpmb3IgdGhlIEVNQyBjbG9jayBpcyB0aGUgdGVncmEtY2xrIGRy
aXZlciwgbm90IHRoZSBFTUMgZHJpdmVyLgoKT25jZSBjbGtfZ2V0KCkgaXMgaW52b2tlZCBieSBh
IGNsayB1c2VyLCB0aGUgQ0NGIHBlcmZvcm1zIHRoZSBjbGsgbG9va3VwCnVzaW5nIHRoZSBEVCBz
cGVjaWZpZXIgYW5kIHRoaXMgbG9va3VwIGlzIGFib3J0ZWQgd2l0aCBhIC1FUFJPQkVfREVGRVIK
ZnJvbSB0aGUgY2xrX3NyY19vbmVjZWxsX2dldCgpIGNhbGxiYWNrIGlmIEVNQyBkcml2ZXIgaXNu
J3QgbG9hZGVkIHlldC4KSSBkb24ndCB0aGluayB0aGF0IHRoZXJlIGFyZSBhbnkgb3RoZXIgdmFy
aWFudHMgdG8gYWNoaWV2ZSB0aGlzIGJlaGF2aW91ci4KCkkgYWxzbyBwcmVmZXIgdG8gaGF2ZSBh
IGNsZWFuIHNlcGFyYXRpb24gb2YgdGhlIGNsayBhbmQgRU1DIGRyaXZlcnMKYmVjYXVzZSB0aGlz
IGlzIGEgbXVjaCBtb3JlIGV4cHJlc3NpdmUgdmFyaWFudCB0aGFuIG1peGluZyBkcml2ZXJzCnRv
Z2V0aGVyIGluIG9ic2N1cmUgd2F5LiBUaGUgcHJlLVQyMTAgRU1DIGRyaXZlcnMgZG9uJ3QgbmVl
ZCB0byB0b3VjaApjbGsgcmVnaXN0ZXJzIGZvciBwcm9ncmFtbWluZyBvZiB0aGUgbWVtb3J5IHRp
bWluZ3MsIGhlbmNlIHRob3NlIEVNQwpkcml2ZXJzIGFyZSBpbiBhIGJpdCBiZXR0ZXIgcG9zaXRp
b24gdGhhbiB0aGUgVDIxMCBkcml2ZXIuCgpUaGUgVDIxMCBFTUMgZHJpdmVyIGFsc28gY291bGQg
aGF2ZSBhIGNsZWFuZXIgc2VwYXJhdGlvbiBieSB1c2luZyBhCnNwZWNpYWwgdGVncmEtY2xrIEFQ
SSBmb3IgdGhlIGNsay9FTUMgZnVuY3Rpb25zLCBpbnN0ZWFkIG9mIHNob3ZpbmcgYQpyYXcgY2xr
IElPIHBvaW50ZXIgdG8gdGhlIEVNQyBkcml2ZXIuIEl0IGZlZWxzIGxpa2UgSSB3YXMgYWxyZWFk
eQpzdWdnZXN0aW5nIHRoaXMgYWJvdXQgYSBoYWxmLXllYXIgYWdvLCBiZWZvcmUgdGhlIFQyMTAg
ZHJpdmVyIHdhcyBtZXJnZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
