Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224102B00FE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890166E195;
	Thu, 12 Nov 2020 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94D46E046
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:17:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s9so1235121ljo.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OgKNdkVvaz+xa5pKH11vMf7kWHOOkyKTt0eLKCTWoyM=;
 b=Xcem9iSPQQT+omFF8Jq4Zxg1UFj1oGZ3AkgbegKWJF9ZE7/DUw7FesobvK4yzHXPME
 4ey+m/ni4ky0Npgfs3w2eq89einViRu52/6CUzh2vpvRbacsSeqlHfkk0qK/2VoR5cBG
 Nn3yHbgiDzKilCptKB6KIojaSc5A2GhXGEv61N8/E+wiUYYImiYre9geZZLyMkdb0d6W
 vtd61w2JFrestyRQW+NUPPoXgP0UMkQmiiSAwZeDItM86OOJ0n0Dxf2wOv7dG9X1/cN4
 /O2DyuDpOACib5hLZH7nYa6LM+P1Kt1AYGFKJEnBhTkk0WNkV75QgPdu2r5VpxrD2YCO
 le2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OgKNdkVvaz+xa5pKH11vMf7kWHOOkyKTt0eLKCTWoyM=;
 b=IH9j65e85EEnijOQjSNDwqE3aLhvCKVHEhtIHQOV89RAp1t9TCmRD6y5ZzMGhmNoX4
 Lj2Y661Mh8039xL4XXLYMMSj4YK/FnKk8hlwIB6JLIe4BJOwIV2EJkSEaCzLAgXaTLuS
 Uyj+Xo84MsvY31nP/fp+lbf82sB3QwL4hypb3lfSeNXPA9JvH3uVuRO749Bp7Gf+Trun
 CGWXLgLhCATFUet3K2Wj67mPJXZ8kRrqYUkHgOaFp2vcJ2guxpoWBcHbUuPzJxveP85P
 VToDC9dNWZtt0zWgjGbKfPTaP3JNAjBwfrCGIBuHqYMRWdWgXAVhKFMl19t0Nc9AQRH9
 jrGA==
X-Gm-Message-State: AOAM533YLmporuGxV/XE/eUp1OwY1psTfCj6GTMSMy1fdM43XQD98SLV
 fzcxM5xzYYtboPkeEd0oTMI7Dn2UODM=
X-Google-Smtp-Source: ABdhPJzwEqcGv+xxwnbEjIK56TC9t3H5Pa/S/5wGVfme5kATJ46qhW11pu/k0uP4E+ggKdmGXgkSkw==
X-Received: by 2002:a2e:87d7:: with SMTP id v23mr931730ljj.467.1605086259116; 
 Wed, 11 Nov 2020 01:17:39 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id j11sm162356lfg.69.2020.11.11.01.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:17:38 -0800 (PST)
Subject: Re: [PATCH v8 11/26] memory: tegra124-emc: Make driver modular
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-12-digetx@gmail.com> <20201111090434.GB4050@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f44b64f5-6b08-5f1e-4f9b-a73a1705d493@gmail.com>
Date: Wed, 11 Nov 2020 12:17:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111090434.GB4050@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAxMjowNCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+PiAtb2Jq
LSQoQ09ORklHX1RFR1JBMTI0X0VNQykJCSs9IGNsay10ZWdyYTEyNC1lbWMubwo+PiArb2JqLSQo
Q09ORklHX0FSQ0hfVEVHUkFfMTI0X1NPQykJKz0gY2xrLXRlZ3JhMTI0LWVtYy5vCj4+ICtvYmot
JChDT05GSUdfQVJDSF9URUdSQV8xMzJfU09DKQkrPSBjbGstdGVncmExMjQtZW1jLm8KPiBIb3cg
aXMgaXQgcmVsYXRlZCB0byBtb2R1bGFyaXphdGlvbj8gSXQgbG9va3MgbGlrZSBkaWZmZXJlbnQg
aXNzdWUgaXMKPiBmaXhlZCBoZXJlLgoKVGhlIENPTkZJR19URUdSQTEyNF9FTUMgbm93IGNvdWxk
IGJlICdtJywgd2hpbGUgdGhlIGNsb2NrIGNvZGUgbXVzdCBiZQpidWlsdC1pbi4gVGhlIFRFR1JB
MTI0IEVNQyBkcml2ZXIgaXMgdXNlZCBieSBUMTI0IGFuZCBUMTMyIFNvQ3MuCgouLi4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay5oIGIvZHJpdmVycy9jbGsvdGVncmEvY2xr
LmgKPj4gaW5kZXggNmI1NjVmNmI1ZjY2Li4yZGE3YzkzYzFhNmMgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvY2xrL3RlZ3JhL2Nsay5oCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay5oCj4+
IEBAIC04ODEsMTggKzg4MSw2IEBAIHZvaWQgdGVncmFfc3VwZXJfY2xrX2dlbjVfaW5pdCh2b2lk
IF9faW9tZW0gKmNsa19iYXNlLAo+PiAgCQkJdm9pZCBfX2lvbWVtICpwbWNfYmFzZSwgc3RydWN0
IHRlZ3JhX2NsayAqdGVncmFfY2xrcywKPj4gIAkJCXN0cnVjdCB0ZWdyYV9jbGtfcGxsX3BhcmFt
cyAqcGxsX3BhcmFtcyk7Cj4+ICAKPj4gLSNpZmRlZiBDT05GSUdfVEVHUkExMjRfRU1DCj4+IC1z
dHJ1Y3QgY2xrICp0ZWdyYV9jbGtfcmVnaXN0ZXJfZW1jKHZvaWQgX19pb21lbSAqYmFzZSwgc3Ry
dWN0IGRldmljZV9ub2RlICpucCwKPj4gLQkJCQkgICBzcGlubG9ja190ICpsb2NrKTsKPj4gLSNl
bHNlCj4+IC1zdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKnRlZ3JhX2Nsa19yZWdpc3Rlcl9lbWMo
dm9pZCBfX2lvbWVtICpiYXNlLAo+PiAtCQkJCQkJIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4+
IC0JCQkJCQkgc3BpbmxvY2tfdCAqbG9jaykKPj4gLXsKPj4gLQlyZXR1cm4gTlVMTDsKPj4gLX0K
Pj4gLSNlbmRpZgo+IFdoeSBjbG9jayBjaGFuZ2VzIGFyZSBzbyB0aWdodGx5IGNvdXBsZWQgd2l0
aCBtYWtpbmcgYW4gRU1DIGRyaXZlcgo+IG1vZHVsYXI/IFVzdWFsbHkgdGhpcyBzaG91bGQgYmUg
YSBzZXBhcmF0ZSBjaGFuZ2UgLSB5b3UgYWRqdXN0IGFueQo+IGRlcGVuZGVuY2llcyB0byBhY2Nl
cHQgbGF0ZSBvciBkZWZlcnJlZCBwcm9iaW5nLCBleHBvcnRlZCBzeW1ib2xzLAo+IGxvb3NlbiB0
aGUgY291cGxpbmcgYmV0d2VlbiBkcml2ZXJzLCBldGMuIGFuZCB0aGVuIHlvdSBjb252ZXJ0IHNv
bWV0aGluZwo+IHRvIG1vZHVsZS4KCkJlY2F1c2UgdGhlIGNsb2NrIGFuZCBFTUMgZHJpdmVyIHdl
cmUgbm90IHNlcGFyYXRlZCBmcm9tIGVhY2ggb3RoZXIKcHJldmlvdXNseS4gVGhlIGNsb2NrIHBh
cnQgY2FuJ3QgYmUgbW9kdWxhcml6ZWQgZWFzaWx5IGFuZCBwcm9iYWJseQpzaG91bGRuJ3QuCgpJ
J20gbm90IHN1cmUgd2hldGhlciBpdCdzIGFjdHVhbGx5IHBvc3NpYmxlIHRvIHNwbGl0IHRoaXMg
cGF0Y2ggd2l0aG91dAp0YWtpbmcgYSBjbG9zZXIgYSBsb29rLgoKSSdtIGFsc28gZG91YnQgdGhh
dCBpdCB3b3VsZCByZWFsbHkgd29ydGggdGhlIGVmZm9ydCBmb3IgYSAxMDAgbGluZXMgb2YKYSBj
aGFuZ2VkIGNvZGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
