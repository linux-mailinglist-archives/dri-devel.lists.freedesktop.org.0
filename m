Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379932A206E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C846EB2A;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34A66EABC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:24:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o13so3925180ljj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TvSbmYTBbiH/6uQP+ocL/XJvZrWVgoLgTGEXcKMdRKw=;
 b=TZsCakYKTg1FrKZSl+qwJefjMXzq1vVG0ZESq6jgcr/4B0WepUkCLgNCIT825Cjwqn
 sN2TNLubmUwOOpeHaxS2Wxr5ISuxvb/BNkkbmzmdGNCCeLgHBEH5/v955E3Jzx5JPlx8
 JWM+MvTOeJ+NoAyeYCA/YQ39cN82ngBc1zcVZQpZIqlIhgilmgT9/4cAH1hq7bMU526Q
 gg9nt1msByT0vADvdhYYKgaL2i+2pYaPtCHC4AH0kcjt6Rcn0R6+hkOC57E4kZd+f1Zp
 0PD9+LHvLkidvjJDl2+0A+YPfA/b7sSvJYsRnLKvnqytrAyol9XBixf2WmxSIrzFsRws
 GqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TvSbmYTBbiH/6uQP+ocL/XJvZrWVgoLgTGEXcKMdRKw=;
 b=Lg72ZtGVSHwIC0YUst/6XcaJhfNDiS1WXr1dMX0aYJuxOz7OnwXDzFlme1AJqvpZL1
 LyzM6BHSoyIdx+k7xsZ5YEkB5gr8eprbaxTD1q7qElYmXxZ5GnhCY5r7WtLnZ0FYbIqK
 Yke+hjthZNtglxkEWKZBjXKAMpiEYpX2cL9U4tBdpwfQWV7UIdCO2uX7GHJkCk0KZCsZ
 cODoTa9bmWxIRRK/1ctP0bWkOQ8XL56ObRU+Amf2zzQDqtJIowwW8EqsDNIi+EvAuKh0
 Jmc7YTQEjwLxDSVntJ1xs1KmJBmMijyg/rZA/xCw7j/fVAErBxAwkBCP5HzFfLlmhZv3
 YFyw==
X-Gm-Message-State: AOAM531SvRNvW4hdRw2B03jBaaZNgnSQqFfiLyOjt8RRWN2gyzC1oH8a
 1GSR2ZXByC+3t7jXPTdgh0M=
X-Google-Smtp-Source: ABdhPJxJqsa3z4OBcKgBN7B+2gEVgZQYaZlOk6XiYr6D8zFcMO+Rg/JZv768uPAmCkRM1XwgguwIZw==
X-Received: by 2002:a2e:681a:: with SMTP id c26mr5126010lja.56.1604244252401; 
 Sun, 01 Nov 2020 07:24:12 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id l9sm1778384ljc.86.2020.11.01.07.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 07:24:11 -0800 (PST)
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH2rBaWKox9nKM=_Wz8k65FLt1R7D8xSOUxe7xAJ1A00hA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <961863f7-933d-d455-cd5d-99bab898ee75@gmail.com>
Date: Sun, 1 Nov 2020 18:24:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH2rBaWKox9nKM=_Wz8k65FLt1R7D8xSOUxe7xAJ1A00hA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTEuMjAyMCAxNzo0NCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDc6MjIgQU0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBwYXRjaCBtb3ZlcyBBQ1RNT04gZHJpdmVy
IGF3YXkgZnJvbSBnZW5lcmF0aW5nIE9QUCB0YWJsZSBieSBpdHNlbGYsCj4+IHRyYW5zaXRpb25p
bmcgaXQgdG8gdXNlIHRoZSB0YWJsZSB3aGljaCBjb21lcyBmcm9tIGRldmljZS10cmVlLiBUaGlz
Cj4+IGNoYW5nZSBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIGRldmljZS10cmVlcyBp
biBvcmRlciB0byBicmluZwo+PiBzdXBwb3J0IGZvciB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29y
ayB0byB0aGUgZHJpdmVyLiBUaGlzIGlzIGEgbWFuZGF0b3J5Cj4+IGNoYW5nZSB3aGljaCBuZWVk
cyB0byBiZSBkb25lIGluIG9yZGVyIHRvIGltcGxlbWVudCBpbnRlcmNvbm5lY3QtYmFzZWQKPj4g
bWVtb3J5IERWRlMuIFVzZXJzIG9mIGxlZ2FjeSBkZXZpY2UtdHJlZXMgd2lsbCBnZXQgYSBtZXNz
YWdlIHRlbGxpbmcgdGhhdAo+PiB0aGVpcnMgRFQgbmVlZHMgdG8gYmUgdXBncmFkZWQuIE5vdyBB
Q1RNT04gaXNzdWVzIG1lbW9yeSBiYW5kd2lkdGggcmVxdWVzdAo+PiB1c2luZyBkZXZfcG1fb3Bw
X3NldF9idygpLCBpbnN0ZWFkIG9mIGRyaXZpbmcgRU1DIGNsb2NrIHJhdGUgZGlyZWN0bHkuCj4+
Cj4+IFRlc3RlZC1ieTogUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4KPj4gVGVzdGVk
LWJ5OiBOaWNvbGFzIENoYXV2ZXQgPGt3aXphcnRAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9k
ZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jIHwgOTEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jIGIv
ZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+IGluZGV4IDNmNzMyYWI1MzU3My4u
MWIwYjkxYTcxODg2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZm
cmVxLmMKPj4gKysrIGIvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMzAtZGV2ZnJlcS5jCj4+IEBAIC0x
OSw2ICsxOSw4IEBACj4+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPj4gICNpbmNsdWRlIDxs
aW51eC93b3JrcXVldWUuaD4KPj4KPj4gKyNpbmNsdWRlIDxzb2MvdGVncmEvZnVzZS5oPgo+PiAr
Cj4gCj4gVGhpcyBwYXRjaCB0b3VjaGVzIHRoZSBPUFAuIElzIGl0IHJlbGF0ZWQgdG8gdGhpcyBj
aGFuZ2U/CgpZZXMsIHRoaXMgaXMgbmVlZGVkIGZvciB0aGUgZGV2X3BtX29wcF9zZXRfc3VwcG9y
dGVkX2h3KCkuCgo+PiAgI2luY2x1ZGUgImdvdmVybm9yLmgiCj4+Cj4+ICAjZGVmaW5lIEFDVE1P
Tl9HTEJfU1RBVFVTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAKPj4g
QEAgLTE1NSw2ICsxNTcsNyBAQCBzdHJ1Y3QgdGVncmFfZGV2ZnJlcV9kZXZpY2Ugewo+Pgo+PiAg
c3RydWN0IHRlZ3JhX2RldmZyZXEgewo+PiAgICAgICAgIHN0cnVjdCBkZXZmcmVxICAgICAgICAg
ICpkZXZmcmVxOwo+PiArICAgICAgIHN0cnVjdCBvcHBfdGFibGUgICAgICAgICpvcHBfdGFibGU7
Cj4+Cj4+ICAgICAgICAgc3RydWN0IHJlc2V0X2NvbnRyb2wgICAgKnJlc2V0Owo+PiAgICAgICAg
IHN0cnVjdCBjbGsgICAgICAgICAgICAgICpjbG9jazsKPj4gQEAgLTYxMiwzNCArNjE1LDE5IEBA
IHN0YXRpYyB2b2lkIHRlZ3JhX2FjdG1vbl9zdG9wKHN0cnVjdCB0ZWdyYV9kZXZmcmVxICp0ZWdy
YSkKPj4gIHN0YXRpYyBpbnQgdGVncmFfZGV2ZnJlcV90YXJnZXQoc3RydWN0IGRldmljZSAqZGV2
LCB1bnNpZ25lZCBsb25nICpmcmVxLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHUzMiBmbGFncykKPj4gIHsKPj4gLSAgICAgICBzdHJ1Y3QgdGVncmFfZGV2ZnJlcSAqdGVncmEg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4gLSAgICAgICBzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJl
cSA9IHRlZ3JhLT5kZXZmcmVxOwo+PiAgICAgICAgIHN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4+
IC0gICAgICAgdW5zaWduZWQgbG9uZyByYXRlOwo+PiAtICAgICAgIGludCBlcnI7Cj4+ICsgICAg
ICAgaW50IHJldDsKPj4KPj4gICAgICAgICBvcHAgPSBkZXZmcmVxX3JlY29tbWVuZGVkX29wcChk
ZXYsIGZyZXEsIGZsYWdzKTsKPj4gICAgICAgICBpZiAoSVNfRVJSKG9wcCkpIHsKPj4gLSAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGZpbmQgb3BwIGZvciAlbHUgSHpcbiIs
ICpmcmVxKTsKPj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGZpbmQg
b3BwIGZvciAlbHUgSHpcbiIsICpmcmVxKTsKPiAKPiBZb3UgdXNlZCB0aGUgJ0ZhaWxlZCB0bycg
Zm9ybWF0IGluIGFsbW9zdCBldmVyeSBlcnJvciBjYXNlLgo+IERvbid0IG5lZWQgdG8gY2hhbmdl
IGl0Lgo+IChzbmlwKQoKR29vZCBjYXRjaCwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
