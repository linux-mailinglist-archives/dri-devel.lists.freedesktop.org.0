Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAC2B77E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F24E6E425;
	Wed, 18 Nov 2020 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1191A89F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 22:02:37 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r17so56086ljg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W5om3zQzsHiBGMpHdWoQikEGL2r18KBMb1Ag+GnaG08=;
 b=aUPTRertfb05h4PXQBp+XblhFmhkq3dYxYo19vCMmRFRwFfo3o1IW4o98iLAok03IX
 SB7/dAIf/DxDZrSAmId3g1EI40aBDac3fFJ5YPVvSW4ZcmMmQ1/fZT7zXo9ji1tnSBH2
 2ryoHGWBmcPCOGGdekoRik9gvEfoJIq1jigT730xbZyGcrmpeGU4NrOrXGvOplzotgE/
 YujRyvzI7YgCBSKphSJsvHJdJaz64JVUE1DdR45WFz0QWc2ezvGHPVWoY5Lg6HFf46Nl
 0V2nRoj5jQVYhYcul1ZHcmKsPqCQgZ5dqIGEIVHgEXRfIfsykIDOct6IpeM1FbHDQTJX
 oN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5om3zQzsHiBGMpHdWoQikEGL2r18KBMb1Ag+GnaG08=;
 b=Dh/H47dnlr7lCX01UHHClX/MYDaYwIn7o3VfC/7Rt7RN4dEDW2ndwpoVG2bXlslP99
 lI/sBwzK4FQYb67oAoj8yPzvbrNps1lyhEQgNPQt1IuNL37ebEMRZaY2B2WidkF4QPBD
 cmmTrMcnD+VycRL7VtAgALZGyb7DieRp/dIs2l/eNB1xVY7+gxlsj5ZOJAiPf6RmLyba
 2TRDvQsu/YHxpHs4MXKVquPVTM3TSSrK6XyNfOeAxH8PDNJ7YY88Tag1ZtUp42j7f46L
 RifZuGuvT8joWKSvxAUC0cGwmCF4HMJslTmt/9yh2P3kZwFxVLSSbHXwQHN3xqCWSSIl
 z+Cw==
X-Gm-Message-State: AOAM533lUIoGJds4hYb1A27KKFDXMASZabrmlxOu1clARVJPgMaSEVLh
 pB+QR5cTmjXOtxLkXn7f6Xsm6VYR22A=
X-Google-Smtp-Source: ABdhPJxGxTDDbi0d8oMMgkGSyKhMr/XNvJc72UcmGlAMm4SW4FF2fTuHTUsirRfiv8AMfkDsmlK1rg==
X-Received: by 2002:a05:651c:30d:: with SMTP id
 a13mr2849268ljp.386.1605650555139; 
 Tue, 17 Nov 2020 14:02:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id v16sm3215544ljj.0.2020.11.17.14.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 14:02:34 -0800 (PST)
Subject: Re: [PATCH v9 01/17] memory: tegra30: Support interconnect framework
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-2-digetx@gmail.com>
 <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7e484678-43cc-e612-1017-73ed580f9840@gmail.com>
Date: Wed, 18 Nov 2020 01:02:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTEuMjAyMCAyMzoyNCwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgo+IEhpIERtaXRyeSwK
PiAKPiBUaGFuayB5b3Ugd29ya2luZyBvbiB0aGlzIQo+IAo+IE9uIDE1LjExLjIwIDIzOjI5LCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IE5vdyBJbnRlcm5hbCBhbmQgRXh0ZXJuYWwgbWVtb3J5
IGNvbnRyb2xsZXJzIGFyZSBtZW1vcnkgaW50ZXJjb25uZWN0aW9uCj4+IHByb3ZpZGVycy4gVGhp
cyBhbGxvd3MgdXMgdG8gdXNlIGludGVyY29ubmVjdCBBUEkgZm9yIHR1bmluZyBvZiBtZW1vcnkK
Pj4gY29uZmlndXJhdGlvbi4gRU1DIGRyaXZlciBub3cgc3VwcG9ydHMgT1BQcyBhbmQgRFZGUy4g
TUMgZHJpdmVyIG5vdwo+PiBzdXBwb3J0cyB0dW5pbmcgb2YgbWVtb3J5IGFyYml0cmF0aW9uIGxh
dGVuY3ksIHdoaWNoIG5lZWRzIHRvIGJlIGRvbmUKPj4gZm9yIElTTyBtZW1vcnkgY2xpZW50cywg
bGlrZSBhIERpc3BsYXkgY2xpZW50IGZvciBleGFtcGxlLgo+Pgo+PiBUZXN0ZWQtYnk6IFBldGVy
IEdlaXMgPHBnd2lwZW91dEBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lw
ZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbWVtb3J5L3RlZ3Jh
L0tjb25maWfCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvbWVtb3J5L3RlZ3Jh
L3RlZ3JhMzAtZW1jLmMgfCAzNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gwqAg
ZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jwqDCoMKgwqAgfCAxNzMgKysrKysrKysrKysr
Ky0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCA1MDEgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pCj4+Cj4gWy4uXT4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAu
Ywo+IGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCj4+IGluZGV4IGQwMzE0ZjI5NjA4
ZC4uZWE4NDkwMDMwMTRiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdy
YTMwLmMKPj4gKysrIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCj4gWy4uXQo+PiAr
Cj4+ICtzdGF0aWMgaW50IHRlZ3JhMzBfbWNfaWNjX3NldChzdHJ1Y3QgaWNjX25vZGUgKnNyYywg
c3RydWN0IGljY19ub2RlCj4+ICpkc3QpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHRlZ3JhX21j
ICptYyA9IGljY19wcm92aWRlcl90b190ZWdyYV9tYyhzcmMtPnByb3ZpZGVyKTsKPj4gK8KgwqDC
oCBjb25zdCBzdHJ1Y3QgdGVncmFfbWNfY2xpZW50ICpjbGllbnQgPSAmbWMtPnNvYy0+Y2xpZW50
c1tzcmMtPmlkXTsKPj4gK8KgwqDCoCB1NjQgcGVha19iYW5kd2lkdGggPSBpY2NfdW5pdHNfdG9f
YnBzKHNyYy0+cGVha19idyk7Cj4+ICsKPj4gK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBTa2lw
IHByZS1pbml0aWFsaXphdGlvbiB0aGF0IGlzIGRvbmUgYnkgaWNjX25vZGVfYWRkKCksIHdoaWNo
Cj4+IHNldHMKPj4gK8KgwqDCoMKgICogYmFuZHdpZHRoIHRvIG1heGltdW0gZm9yIGFsbCBjbGll
bnRzIGJlZm9yZSBkcml2ZXJzIGFyZSBsb2FkZWQuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDC
oCAqIFRoaXMgZG9lc24ndCBtYWtlIHNlbnNlIGZvciB1cyBiZWNhdXNlIHdlIGRvbid0IGhhdmUg
ZHJpdmVycwo+PiBmb3IgYWxsCj4+ICvCoMKgwqDCoCAqIGNsaWVudHMgYW5kIGl0J3Mgb2theSB0
byBrZWVwIGNvbmZpZ3VyYXRpb24gbGVmdCBmcm9tIGJvb3Rsb2FkZXIKPj4gK8KgwqDCoMKgICog
ZHVyaW5nIGJvb3QsIGF0IGxlYXN0IGZvciB0b2RheS4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKg
wqAgaWYgKHNyYyA9PSBkc3QpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiAKPiBOaXQ6
IFRoZSAicHJvcGVyIiB3YXkgdG8gZXhwcmVzcyB0aGlzIHNob3VsZCBiZSB0byBpbXBsZW1lbnQg
dGhlCj4gLmdldF9idygpIGNhbGxiYWNrIHRvIHJldHVybiB6ZXJvIGFzIGluaXRpYWwgYXZlcmFn
ZS9wZWFrIGJhbmR3aWR0aC4KPiBJJ20gd29uZGVyaW5nIGlmIHRoaXMgd2lsbCB3b3JrIGhlcmU/
Cj4gCj4gVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZSEKCkhlbGxvIEdlb3JnaSwKClJldHVybmlu
ZyB6ZXJvcyBkb2Vzbid0IGFsbG93IHVzIHRvIHNraXAgdGhlIGluaXRpYWxpemF0aW9uIHRoYXQg
aXMgZG9uZQpieSBwcm92aWRlci0+c2V0KG5vZGUsIG5vZGUpIGluIGljY19ub2RlX2FkZCgpLiBJ
dCB3aWxsIHJlY29uZmlndXJlCm1lbW9yeSBsYXRlbmN5IGluIGFjY29yZGFuY2UgdG8gYSB6ZXJv
IG1lbW9yeSBiYW5kd2lkdGgsIHdoaWNoIGlzIHdyb25nCnRvIGRvLgoKSXQgYWN0dWFsbHkgc2hv
dWxkIGJlIG1vcmUgcHJlZmVycmVkIHRvIHByZXNldCBiYW5kd2lkdGggdG8gYSBtYXhpbXVtCmJl
Zm9yZSBhbGwgZHJpdmVycyBhcmUgc3luY2VkLCBidXQgdGhpcyBzaG91bGQgYmUgZG9uZSBvbmx5
IG9uY2Ugd2Ugd2lsbAp3aXJlIHVwIGFsbCBkcml2ZXJzIHRvIHVzZSBJQ0MgZnJhbWV3b3JrLiBG
b3Igbm93IGl0J3Mgc2FmZXIgdG8ga2VlcCB0aGUKZGVmYXVsdCBoYXJkd2FyZSBjb25maWd1cmF0
aW9uIHVudG91Y2hlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
