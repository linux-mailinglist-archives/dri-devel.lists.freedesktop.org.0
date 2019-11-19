Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC778103022
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3756E445;
	Tue, 19 Nov 2019 23:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF6E6E9B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 17:00:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r7so24169466ljg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 09:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EWN1ZpXN/f4GXP8V3XISkI6qP/p5d7CKryKCLpJongQ=;
 b=K6jlUZ5s0E83t05jexCkNCN1Zwo2OvynE38NXMfTJoEYERVWR6otna9L0KVbW4cB+V
 ezk5blRzUgpsbViQtIqHi6GD8aY4WZnJVT8jVVvo2i2rNqo1E0eHOoWBzzlYGGq2bciZ
 nbHWMl5lmQxy0Q7KC0f4hAQfHJ6E5RnkPs0YBIeeKNpckGurmoJeI7w8+AO54UFrRJWy
 ePpfVkmyUABj2AsLj5x95G8bRhgZVVE864KEV6RLIEFDqR3xQMZQcVzo0rIjkStMZI8Q
 Px53iWMd9LHYXcUTfbA0sgRbnn60vujoLi2t5grpR84cFOePWyqPQls31wQN6uCA7OQ2
 b8IA==
X-Gm-Message-State: APjAAAUw2TWWIIU34cPIRwOqlH2+jjb/iDUCn5HqvesGWhgxImTVwmga
 uiuilWlvxWvji42vrj1fSOg=
X-Google-Smtp-Source: APXvYqzUJ15qHXRQXDdLUOjO7y7PndvAwTYq5Hd82LpDfgGl42VActAGgmwBJM+mFWepTDd8E6UwPQ==
X-Received: by 2002:a05:651c:390:: with SMTP id
 e16mr4856596ljp.196.1574182799913; 
 Tue, 19 Nov 2019 08:59:59 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id 206sm1213375lfb.20.2019.11.19.08.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:59:59 -0800 (PST)
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com> <20191119063139.GF2462695@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <044b17a8-7186-fec0-e786-5ec5a13e5873@gmail.com>
Date: Tue, 19 Nov 2019 19:59:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119063139.GF2462695@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EWN1ZpXN/f4GXP8V3XISkI6qP/p5d7CKryKCLpJongQ=;
 b=aV6b0zLK4e7wbM1ZqDppNii3W6Ag4g5//no+UHoUiVeNIQgXKDrnfxRLKpfBT8VqBo
 qBtgQiapfJ2JKvZBuaMVlROzz3SCBM1cugVluR5kWQm9fi25lc1zS5klcPis9FLahaOw
 /g53hBUEu5u43bK+URJzsoM4AP7d7MRZ0plD0maa7r8BksyFqTxy+wx+noGZ78dxUphQ
 DxNRXt5wJMus1KC/9ZmV+GbBAx4KC+htMC4PFs6IZTzwlKFHeHHv6gFLlOIhMrEdnbcX
 +NTUIVuLZB+X/Q55XOgdgGj4hV9lYO2GhTsR//EEFh5Kh29XPZZzEnlad3pPE9lF22WV
 u+nQ==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAwOTozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE5v
diAxOCwgMjAxOSBhdCAxMTowMjozMFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4g
Wy4uLl0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc29jL3RlZ3JhL21jLmggYi9pbmNsdWRlL3Nv
Yy90ZWdyYS9tYy5oCj4+IGluZGV4IDEyMzhlMzU2NTNkMS4uNTkzOTU0MzI0MjU5IDEwMDY0NAo+
PiAtLS0gYS9pbmNsdWRlL3NvYy90ZWdyYS9tYy5oCj4+ICsrKyBiL2luY2x1ZGUvc29jL3RlZ3Jh
L21jLmgKPj4gQEAgLTE0MSw2ICsxNDEsMTEgQEAgc3RydWN0IHRlZ3JhX21jX3Jlc2V0X29wcyB7
Cj4+ICAJCQkgICAgY29uc3Qgc3RydWN0IHRlZ3JhX21jX3Jlc2V0ICpyc3QpOwo+PiAgfTsKPj4g
IAo+PiArc3RydWN0IHRlZ3JhX21jX2ljY19ub2RlIHsKPj4gKwljb25zdCBjaGFyICpuYW1lOwo+
PiArCXVuc2lnbmVkIGludCBpZDsKPj4gK307Cj4+ICsKPj4gIHN0cnVjdCB0ZWdyYV9tY19zb2Mg
ewo+PiAgCWNvbnN0IHN0cnVjdCB0ZWdyYV9tY19jbGllbnQgKmNsaWVudHM7Cj4+ICAJdW5zaWdu
ZWQgaW50IG51bV9jbGllbnRzOwo+PiBAQCAtMTYwLDYgKzE2NSw5IEBAIHN0cnVjdCB0ZWdyYV9t
Y19zb2Mgewo+PiAgCWNvbnN0IHN0cnVjdCB0ZWdyYV9tY19yZXNldF9vcHMgKnJlc2V0X29wczsK
Pj4gIAljb25zdCBzdHJ1Y3QgdGVncmFfbWNfcmVzZXQgKnJlc2V0czsKPj4gIAl1bnNpZ25lZCBp
bnQgbnVtX3Jlc2V0czsKPj4gKwo+PiArCWNvbnN0IHN0cnVjdCB0ZWdyYV9tY19pY2Nfbm9kZSAq
aWNjX25vZGVzOwo+PiArCXVuc2lnbmVkIGludCBudW1faWNjX25vZGVzOwo+PiAgfTsKPj4gIAo+
PiAgc3RydWN0IHRlZ3JhX21jIHsKPj4gQEAgLTE4NCw0ICsxOTIsMjIgQEAgc3RydWN0IHRlZ3Jh
X21jIHsKPj4gIGludCB0ZWdyYV9tY193cml0ZV9lbWVtX2NvbmZpZ3VyYXRpb24oc3RydWN0IHRl
Z3JhX21jICptYywgdW5zaWduZWQgbG9uZyByYXRlKTsKPj4gIHVuc2lnbmVkIGludCB0ZWdyYV9t
Y19nZXRfZW1lbV9kZXZpY2VfY291bnQoc3RydWN0IHRlZ3JhX21jICptYyk7Cj4+ICAKPj4gKyNp
ZmRlZiBDT05GSUdfSU5URVJDT05ORUNUX1RFR1JBCj4+ICtpbnQgdGVncmFfaWNjX21jX3NldHVw
X2ludGVyY29ubmVjdChzdHJ1Y3QgdGVncmFfbWMgKm1jKTsKPj4gK2ludCB0ZWdyYV9pY2NfZW1j
X3NldHVwX2ludGVyY29ubmVjdChzdHJ1Y3QgZGV2aWNlICplbWNfZGV2LAo+PiArCQkJCSAgICAg
dW5zaWduZWQgaW50IGRyYW1fZGF0YV9idXNfd2lkdGhfYnl0ZXMpOwo+PiArI2Vsc2UKPj4gK3N0
YXRpYyBpbmxpbmUgaW50IHRlZ3JhX2ljY19tY19zZXR1cF9pbnRlcmNvbm5lY3Qoc3RydWN0IHRl
Z3JhX21jICptYyk7Cj4+ICt7Cj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBp
bmxpbmUgaW50Cj4+ICt0ZWdyYV9pY2NfZW1jX3NldHVwX2ludGVyY29ubmVjdChzdHJ1Y3QgZGV2
aWNlICplbWNfZGV2LAo+PiArCQkJCSB1bnNpZ25lZCBpbnQgZHJhbV9kYXRhX2J1c193aWR0aF9i
eXRlcykKPj4gK3sKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKyNlbmRpZgo+IAo+IElzIHRoZXJl
IHJlYWxseSBhbnkgcmVhc29uIHdoeSB3ZSBzaG91bGQgbWFrZSB0aGlzIHN1cHBvcnQgb3B0aW9u
YWw/IEl0Cj4gc2VlbXMgdG8gbWUgbGlrZSB3ZSB3b3VsZCBhbHdheXMgd2FudCB0aGlzIGVuYWJs
ZWQgb25jZSBpdCdzIHRlc3RlZCBhbmQKPiBrbm93biB0byB3b3JrLgoKVGhlcmUgaXMgYWx3YXlz
IHNvbWUgcm9vbSBmb3IgYnVncywgc2hvdWxkIGJlIGJldHRlciB0byBoYXZlIGFuIG9wdGlvbgp0
byBkaXNhYmxlIElDQyBlbnRpcmVseSAoSU1PKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
