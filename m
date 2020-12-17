Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA02DDFBE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28A89B49;
	Fri, 18 Dec 2020 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411B6898C6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:46:02 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m12so60174686lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eSYB0Y/xRIZysMaCL0aa3isjLo158W5WBPwwbHOrbfE=;
 b=IQJRL+Lb7PAb96r55KxH7ztRsHpbX849w3oGSThKsjbwhrR5HEGjKItUC60H3ZsJPW
 PNjoDJv35lDBQiaI37xd7K1t6ho+m0NsdCOzHfJvA6u35zE+4urqIb3xWFcuysXktB4A
 ebI7unXgw0tsxCPEYs2n2MzQ2XDKRE7E8U0Wo4vNLztrImRrsmKUMUntAw+xWJ9xHtF2
 zo9ZuUMJIYMdtFrY9oBOvPRlyiqALTvZrla3ds/OD77gU23VkbZn40HFvsYyboUVxS2v
 gyhg4MCmQlOY5eGpJIFk4J22PqHBSenwJbr6df3n2gsjjRa6zhntGM8mckwXXqW0cVha
 qleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSYB0Y/xRIZysMaCL0aa3isjLo158W5WBPwwbHOrbfE=;
 b=iyC4Y2MXQItfADYZSySi6bttvO7A7zOjtD45dun+sfBUjrMw0fEe84M/HJu5zn4uuK
 2621VS8PjX05XYjfbFELyIiAKjlvnZ3r3Z0+teRVivyXNFM/JLDk6qDbl18qyjMXRzEe
 TqHcfsjmMsbS4PagtRB29ZiGhUZQu6R7NLfJKNt3sq1J7F49FRm7oxBGkr2tPwLIaGV1
 Pbt8TG0Zcc1npqmZNYKtLglEPgyIZD4d138NRaVg2YDA2x/EtaTADBVgA/XuzrGSa6xZ
 jS8O/xvhApsVLyERLZrbWBJnF3cMW8VScSwFzSUXHV88Qy/JK16KPmDBI9EJyhGuUc9x
 XAjQ==
X-Gm-Message-State: AOAM531buUbc/d0moeFwwDkwkI8/hxC+FoGy7KAmzTS1HE3fBaAo3vuA
 EcqTxPsSSMs3GttwXoEGgNI=
X-Google-Smtp-Source: ABdhPJwjaocgElWH/9WCSNDWrPgvL9Mseuuyfcz1mrOFvs69hy/dbN9dC6jiFzCRsBauzpQWnpMGcg==
X-Received: by 2002:a05:6512:3593:: with SMTP id
 m19mr35943lfr.221.1608230760739; 
 Thu, 17 Dec 2020 10:46:00 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id i19sm756871ljj.26.2020.12.17.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 10:46:00 -0800 (PST)
Subject: Re: [PATCH v2 34/48] gpu: host1x: Support power management
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-35-digetx@gmail.com>
 <cb8dca7c-6ef2-5116-6c04-816a63525e2e@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b106c4c0-bd93-bbc9-9357-45fe8fb1cf0f@gmail.com>
Date: Thu, 17 Dec 2020 21:45:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <cb8dca7c-6ef2-5116-6c04-816a63525e2e@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMTIuMjAyMCAyMToyMSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gMTIvMTcv
MjAgODowNiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBBZGQgc3VzcGVuZC9yZXN1bWUg
YW5kIGdlbmVyaWMgcG93ZXIgZG9tYWluIHN1cHBvcnQgdG8gdGhlIEhvc3QxeCBkcml2ZXIuCj4+
IFRoaXMgaXMgcmVxdWlyZWQgZm9yIGVuYWJsaW5nIHN5c3RlbS13aWRlIERWRlMgYW5kIHN1cHBv
cnRpbmcgZHluYW1pYwo+PiBwb3dlciBtYW5hZ2VtZW50IHVzaW5nIGEgZ2VuZXJpYyBwb3dlciBk
b21haW4uCj4+Cj4+IFRlc3RlZC1ieTogUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4K
Pj4gVGVzdGVkLWJ5OiBOaWNvbGFzIENoYXV2ZXQgPGt3aXphcnRAZ21haWwuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiDC
oCBkcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgfCAxMDIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYu
YyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwo+PiBpbmRleCBkMGViYjcwZTJmZGQuLmMxNTI1
Y2ZmZTdiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYwo+PiBAQCAtMTIsNiArMTIsNyBAQAo+PiDCoCAjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGlt
ZS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+PiDCoCDCoCAjZGVmaW5lIENSRUFU
RV9UUkFDRV9QT0lOVFMKPj4gQEAgLTQxNyw3ICs0MTgsNyBAQCBzdGF0aWMgaW50IGhvc3QxeF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGVycjsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgaG9zdC0+cnN0ID0gZGV2
bV9yZXNldF9jb250cm9sX2dldCgmcGRldi0+ZGV2LCAiaG9zdDF4Iik7Cj4+ICvCoMKgwqAgaG9z
dC0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmVfcmVsZWFzZWQoJnBkZXYt
PmRldiwKPj4gImhvc3QxeCIpOwo+PiDCoMKgwqDCoMKgIGlmIChJU19FUlIoaG9zdC0+cnN0KSkg
ewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gUFRSX0VSUihob3N0LT5yc3QpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZXNldDog
JWRcbiIsIGVycik7Cj4+IEBAIC00MzcsMTYgKzQzOCwxNSBAQCBzdGF0aWMgaW50IGhvc3QxeF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4+ICpwZGV2KQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBpb21tdV9leGl0Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLcKgwqDCoCBlcnIgPSBj
bGtfcHJlcGFyZV9lbmFibGUoaG9zdC0+Y2xrKTsKPj4gLcKgwqDCoCBpZiAoZXJyIDwgMCkgewo+
PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBj
bG9ja1xuIik7Cj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIGZyZWVfY2hhbm5lbHM7Cj4+IC3CoMKg
wqAgfQo+PiArwqDCoMKgIHBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOwo+PiArwqDCoMKg
IGVyciA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7Cj4+ICvCoMKgwqAgaWYgKGVy
ciA8IDApCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHJwbV9kaXNhYmxlOwo+PiDCoCDCoMKgwqDC
oMKgIGVyciA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoaG9zdC0+cnN0KTsKPj4gwqDCoMKgwqDC
oCBpZiAoZXJyIDwgMCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2
LCAiZmFpbGVkIHRvIGRlYXNzZXJ0IHJlc2V0OiAlZFxuIiwgZXJyKTsKPj4gLcKgwqDCoMKgwqDC
oMKgIGdvdG8gdW5wcmVwYXJlX2Rpc2FibGU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHJwbV9k
aXNhYmxlOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCBlcnIgPSBob3N0MXhfc3lu
Y3B0X2luaXQoaG9zdCk7Cj4+IEBAIC00ODUsOSArNDg1LDEwIEBAIHN0YXRpYyBpbnQgaG9zdDF4
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPj4gKnBkZXYpCj4+IMKgwqDCoMKgwqAgaG9z
dDF4X3N5bmNwdF9kZWluaXQoaG9zdCk7Cj4+IMKgIHJlc2V0X2Fzc2VydDoKPj4gwqDCoMKgwqDC
oCByZXNldF9jb250cm9sX2Fzc2VydChob3N0LT5yc3QpOwo+PiAtdW5wcmVwYXJlX2Rpc2FibGU6
Cj4+IC3CoMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7Cj4+IC1mcmVlX2No
YW5uZWxzOgo+PiArcnBtX2Rpc2FibGU6Cj4+ICvCoMKgwqAgcG1fcnVudGltZV9wdXQoJnBkZXYt
PmRldik7Cj4+ICvCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+PiArCj4+
IMKgwqDCoMKgwqAgaG9zdDF4X2NoYW5uZWxfbGlzdF9mcmVlKCZob3N0LT5jaGFubmVsX2xpc3Qp
Owo+PiDCoCBpb21tdV9leGl0Ogo+PiDCoMKgwqDCoMKgIGhvc3QxeF9pb21tdV9leGl0KGhvc3Qp
Owo+PiBAQCAtNTA0LDE2ICs1MDUsOTUgQEAgc3RhdGljIGludCBob3N0MXhfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UKPj4gKnBkZXYpCj4+IMKgwqDCoMKgwqAgaG9zdDF4X2ludHJfZGVp
bml0KGhvc3QpOwo+PiDCoMKgwqDCoMKgIGhvc3QxeF9zeW5jcHRfZGVpbml0KGhvc3QpOwo+PiDC
oMKgwqDCoMKgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhvc3QtPnJzdCk7Cj4+IC3CoMKgwqAgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7Cj4+ICvCoMKgwqAgcG1fcnVudGltZV9wdXQo
JnBkZXYtPmRldik7Cj4+ICvCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+
PiDCoMKgwqDCoMKgIGhvc3QxeF9pb21tdV9leGl0KGhvc3QpOwo+PiDCoCDCoMKgwqDCoMKgIHJl
dHVybiAwOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGhvc3QxeF9y
dW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArwqDCoMKgIHN0cnVj
dCBob3N0MXggKmhvc3QgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4gKwo+PiArwqDCoMKgIGNs
a19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5jbGspOwo+PiArwqDCoMKgIHJlc2V0X2NvbnRyb2xf
cmVsZWFzZShob3N0LT5yc3QpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaG9zdDF4X3J1bnRpbWVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgaG9zdDF4ICpob3N0ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4+ICvCoMKgwqAgaW50IGVycjsKPj4gKwo+PiArwqDCoMKgIGVy
ciA9IHJlc2V0X2NvbnRyb2xfYWNxdWlyZShob3N0LT5yc3QpOwo+PiArwqDCoMKgIGlmIChlcnIp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGFjcXVpcmUgcmVz
ZXQ6ICVkXG4iLCBlcnIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4gK8KgwqDC
oCB9Cj4+ICsKPj4gK8KgwqDCoCBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoaG9zdC0+Y2xrKTsK
Pj4gK8KgwqDCoCBpZiAoZXJyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBlbmFibGUgY2xvY2s6ICVkXG4iLCBlcnIpOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290
byByZWxlYXNlX3Jlc2V0Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+
PiArCj4+ICtyZWxlYXNlX3Jlc2V0Ogo+PiArwqDCoMKgIHJlc2V0X2NvbnRyb2xfcmVsZWFzZSho
b3N0LT5yc3QpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIGVycjsKPj4gK30KPj4gKwo+PiArc3Rh
dGljIF9fbWF5YmVfdW51c2VkIGludCBob3N0MXhfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGhvc3QxeCAqaG9zdCA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+PiArwqDCoMKgIGludCBlcnI7Cj4+ICsKPj4gK8KgwqDCoCBob3N0MXhfc3luY3B0X3Nh
dmUoaG9zdCk7Cj4+ICsKPj4gK8KgwqDCoCBlcnIgPSBwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQo
ZGV2KTsKPj4gK8KgwqDCoCBpZiAoZXJyIDwgMCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBl
cnI7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIF9fbWF5
YmVfdW51c2VkIGludCBob3N0MXhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4g
K8KgwqDCoCBzdHJ1Y3QgaG9zdDF4ICpob3N0ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+ICvC
oMKgwqAgc3RydWN0IGhvc3QxeF9jaGFubmVsICpjaGFubmVsOwo+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBpbmRleDsKPj4gK8KgwqDCoCBpbnQgZXJyOwo+PiArCj4+ICvCoMKgwqAgZXJyID0gcG1f
cnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsKPj4gK8KgwqDCoCBpZiAoZXJyIDwgMCkKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+ICsKPj4gK8KgwqDCoCBob3N0MXhfc3luY3B0X3Jl
c3RvcmUoaG9zdCk7Cj4gCj4gV2UgYWxzbyBuZWVkIHRvIGV4ZWN1dGUgJ2hvc3QxeF9zZXR1cF9z
aWRfdGFibGUnIHVwb24gcmVzdW1lLgoKSW5kZWVkLCB0aGFua3MuIEknbGwgY29ycmVjdCBpdCBp
biB0aGUgbmV4dCByZXZpc2lvbi4KClBlcmhhcHMgdGhlIGFjdHVhbCBzYXZlL3Jlc3RvcmUgbmVl
ZHMgdG8gYmUgbW92ZWQgdG8gdGhlIHJ1bnRpbWUKY2FsbGJhY2tzLiBBdCBsZWFzdCBJIGNhbid0
IHJlbWVtYmVyIHJpZ2h0IG5vdyB3aHkgdGhpcyB3YXNuJ3QgZG9uZSBpbgp0aGUgZmlyc3QgcGxh
Y2UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
