Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5152E1B37
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 11:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376A46E925;
	Wed, 23 Dec 2020 10:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA37E6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 19:18:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m12so34530724lfo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lcB/y6qU20WLnd5c6LTo3G6tp/OwhO3SBtrWVG5rCFc=;
 b=EejIC70QVALti28WPnuavpGynvc0S9z9Vat1lwcwhaT/aIgj9d4pqxEwv3zOyTaIDP
 wGnbYvDmOM6vimG54VEZjIQp4HBfaJWqDOmjLZ/8vaQ6pr2vm+hcXu+xBS1YQKE6uu/q
 kr+/N6OrkpQtpLJ8kOlg9V+0EWS9C9q8vkq77I+5GgvFDikfZsnl+6INCAImnw1+EMTk
 f0qcHVrmlK+RsBEVlZ6PyDiIHvFqVURHyeE0Q0HQ0L7Dw2nQxQ5thn19hiB9bz6Mr+nX
 WDGhtJrdSJtXUrKHzMntzzgWLTBClIU28dTWDdENyX/ey1+pWizesNNPD1LK+s6g9qni
 ZyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcB/y6qU20WLnd5c6LTo3G6tp/OwhO3SBtrWVG5rCFc=;
 b=koBmjZEzHd7Bb9CBOImEF5IMgRiAqd25LC4lKFVatZoY+T1yVjP5AAQLmsoRwCRRyh
 prO5kksz9hVjN2UU3/Z06BE67td+Yw/X0isihm86DfFqVDOhJkoRDdMnmkdLxoZuKtck
 u43R7YWC05e+16NgwI0njPI/9PbHA45buCHlIU9cRDh6sD98zo6XRDXkSbZ/Bt+L9hnM
 +ETZwt/bfGrhbvnu9wiBWZF5ocUYC3qRsyDFHhg41nVJ1HMupBUzmhfZpV/0NZPuEyUZ
 DzkeKzLkj2agO6qN/4SYZJa2LtTCIzO5OHUgq6QU4mdnMC2EORMhuAgc/KEPFZ0p2F5a
 K5CA==
X-Gm-Message-State: AOAM532chbcPCL685ICMF4fN2a+d170HsXcLoRaiTs9diPgdh/XbAC6Z
 Tj6weeOvsaTwGvM1glsm2Zw=
X-Google-Smtp-Source: ABdhPJxW/f8t8lnOY/9IpSrJMD5QC3Uvhw+YOcc4pHXTNt7pE46dn90vPQ/S9qMKb9XmV6y5yqIGrQ==
X-Received: by 2002:a19:950:: with SMTP id 77mr9116995lfj.133.1608664704345;
 Tue, 22 Dec 2020 11:18:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id b5sm2782768lfg.13.2020.12.22.11.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:18:23 -0800 (PST)
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
 <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8fb90b3c-dcfe-e5e2-124e-bbb6d4bda0ad@gmail.com>
Date: Tue, 22 Dec 2020 22:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 23 Dec 2020 10:51:31 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjIuMTIuMjAyMCAxMjowMSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFN1cHBvcnQgc2V0X29wcCgpIGN1c3Rv
bWl6YXRpb24gd2l0aG91dCByZXF1aXJpbmcgdG8gdXNlIHJlZ3VsYXRvcnMuIFRoaXMKPj4gaXMg
bmVlZGVkIGJ5IGRyaXZlcnMgd2hpY2ggd2FudCB0byB1c2UgZGV2X3BtX29wcF9zZXRfcmF0ZSgp
IGZvciBjaGFuZ2luZwo+PiByYXRlcyBvZiBhIG11bHRpcGxlIGNsb2NrcyBhbmQgZG9uJ3QgbmVl
ZCB0byB0b3VjaCByZWd1bGF0b3IuCj4+Cj4+IE9uZSBleGFtcGxlIGlzIE5WSURJQSBUZWdyYTMw
LzExNCBTb0NzIHdoaWNoIGhhdmUgdHdvIHNpYmxpbmcgM0QgaGFyZHdhcmUKPj4gdW5pdHMgd2hp
Y2ggc2hvdWxkIGJlIHVzZSB0byB0aGUgc2FtZSBjbG9jayByYXRlLCBtZWFud2hpbGUgdm9sdGFn
ZQo+PiBzY2FsaW5nIGlzIGRvbmUgdXNpbmcgYSBwb3dlciBkb21haW4uIEluIHRoaXMgY2FzZSBP
UFAgdGFibGUgZG9lc24ndCBoYXZlCj4+IGEgcmVndWxhdG9yLCBjYXVzaW5nIGEgTlVMTCBkZXJl
ZmVyZW5jZSBpbiBfc2V0X29wcF9jdXN0b20oKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5
IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvb3BwL2NvcmUu
YyB8IDE2ICsrKysrKysrKysrKy0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vcHAvY29yZS5j
IGIvZHJpdmVycy9vcHAvY29yZS5jCj4+IGluZGV4IDNkMDJmZTMzNjMwYi4uNjI1ZGFlN2E1ZWNi
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL29wcC9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9vcHAv
Y29yZS5jCj4+IEBAIC04MjgsMTcgKzgyOCwyNSBAQCBzdGF0aWMgaW50IF9zZXRfb3BwX2N1c3Rv
bShjb25zdCBzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGUsCj4+ICAJCQkgICBzdHJ1Y3QgZGV2
X3BtX29wcF9zdXBwbHkgKm9sZF9zdXBwbHksCj4+ICAJCQkgICBzdHJ1Y3QgZGV2X3BtX29wcF9z
dXBwbHkgKm5ld19zdXBwbHkpCj4+ICB7Cj4+IC0Jc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEg
KmRhdGE7Cj4+ICsJc3RydWN0IGRldl9wbV9zZXRfb3BwX2RhdGEgKmRhdGEsIHRtcF9kYXRhOwo+
PiArCXVuc2lnbmVkIGludCByZWd1bGF0b3JfY291bnQ7Cj4+ICAJaW50IHNpemU7Cj4+ICAKPj4g
LQlkYXRhID0gb3BwX3RhYmxlLT5zZXRfb3BwX2RhdGE7Cj4+ICsJaWYgKG9wcF90YWJsZS0+c2V0
X29wcF9kYXRhKSB7Cj4+ICsJCWRhdGEgPSBvcHBfdGFibGUtPnNldF9vcHBfZGF0YTsKPj4gKwkJ
cmVndWxhdG9yX2NvdW50ID0gb3BwX3RhYmxlLT5yZWd1bGF0b3JfY291bnQ7Cj4+ICsJfSBlbHNl
IHsKPj4gKwkJZGF0YSA9ICZ0bXBfZGF0YTsKPj4gKwkJcmVndWxhdG9yX2NvdW50ID0gMDsKPj4g
Kwl9Cj4+ICsKPj4gIAlkYXRhLT5yZWd1bGF0b3JzID0gb3BwX3RhYmxlLT5yZWd1bGF0b3JzOwo+
PiAtCWRhdGEtPnJlZ3VsYXRvcl9jb3VudCA9IG9wcF90YWJsZS0+cmVndWxhdG9yX2NvdW50Owo+
PiArCWRhdGEtPnJlZ3VsYXRvcl9jb3VudCA9IHJlZ3VsYXRvcl9jb3VudDsKPj4gIAlkYXRhLT5j
bGsgPSBvcHBfdGFibGUtPmNsazsKPj4gIAlkYXRhLT5kZXYgPSBkZXY7Cj4+ICAKPj4gIAlkYXRh
LT5vbGRfb3BwLnJhdGUgPSBvbGRfZnJlcTsKPj4gLQlzaXplID0gc2l6ZW9mKCpvbGRfc3VwcGx5
KSAqIG9wcF90YWJsZS0+cmVndWxhdG9yX2NvdW50Owo+PiArCXNpemUgPSBzaXplb2YoKm9sZF9z
dXBwbHkpICogcmVndWxhdG9yX2NvdW50Owo+PiAgCWlmICghb2xkX3N1cHBseSkKPj4gIAkJbWVt
c2V0KGRhdGEtPm9sZF9vcHAuc3VwcGxpZXMsIDAsIHNpemUpOwo+PiAgCWVsc2UKPiAKPiBJIGRv
bid0IHNlZSB5b3UgbWFraW5nIHVzZSBvZiB0aGlzIGluIHRoaXMgcGF0Y2hzZXQuIEhvdyBkaWQg
eW91IGdldCB0aGlzIHRvCj4gY3Jhc2ggPwo+IAoKUGxlYXNlIHNlZSBwYXRjaCAzOCB3aGVyZSAz
ZCBkcml2ZXIgbWFrZXMgdXNlIG9mCmRldm1fcG1fb3BwX3JlZ2lzdGVyX3NldF9vcHBfaGVscGVy
KCkuCgpUaGUgb3BwX3RhYmxlLT5zZXRfb3BwX2RhdGE9TlVMTCBhbmQgb3BwX3RhYmxlLT5yZWd1
bGF0b3JfY291bnQ9LTEgaWYKT1BQIHRhYmxlIGRvZXNuJ3QgdXNlIGEgcmVndWxhdG9yLCBoZW5j
ZSB0aGUgY3Jhc2ggaGFwcGVucy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
