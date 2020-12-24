Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291B2E2AFA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE189C8D;
	Fri, 25 Dec 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BDB89D79
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:51:46 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id y8so870645plp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 22:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=UwfYLcIirH3qmQI4JsZzO7mShidOe2h56ps9Mn8CcUM=;
 b=p3LVWtHH4lnaxCM8RaV0FuiWfeYOi6He8i8ZzNhCF2uE9taZX9ndUrAyZBXTOdxsnT
 8t1a2YxI3HYBrNnJu5/+84bn8mvwe06wBzE8OjHFScw6bPwKQUlii9XgIa5kYYzLrQjz
 cevJ8CwVsVedjRe1pyo4VzLQM56IHQU1HXJZv8Ymr7DpvswknpNhVK0bNDhjWr+AmyFA
 VXnPNO7lGfweDD3iaWdIQbaycRrOmiT6TEl2s4l7BsI+AFuYMhsl2he2VEUu8wHUmrgN
 JAyaUYWYX4+N3gjwuNljjOM87xxFl7tYQT3LDU5fujok71XDOV2xYGmYz4hU5PcuZaI9
 o6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UwfYLcIirH3qmQI4JsZzO7mShidOe2h56ps9Mn8CcUM=;
 b=hQO1YMzXZgZzrVQgnkZoT3ouDsVRppbzSNlqY/b0+V4qk/HLC6lCQIJud3y3ymG+j3
 nqt7Y82KQCbnrmhUEPs9MlxsomFeUWu+qd8ueFOTmfBg6vs1KOT8IJjc0vXG8RFZXnQX
 IwEeg1gR/88yrLCmNt0KSURpV05uOwmZJsVNIUTIs/vAuHUqLRurSPSnryKfqVC+DpA4
 AEvLZISSN7xKUxJQc/6j7nrj/QzcoELXyAhdnWBVXpI92t37Zw1V+Z8JsVDAuLZ8oMxy
 7mGXbnltRfDZC2mQyB5IJLQ6WvxygoB1ZK8Fc05I4zizOx8ONnWGYMrGk+GPbAXZrYF+
 1c5w==
X-Gm-Message-State: AOAM53037D4tCH+yW+Bbr89uEjm9SmeZ24QiC9ILIyGQrh2pOqMnmAP6
 ghMxOUbLcBTJCSuvDB8lVJ3Z2g==
X-Google-Smtp-Source: ABdhPJxPqikU/RNfF0gTcEkAqxaTFu96TFPfNpSQbS38QvWMYUf6BnYHm7AoCnEqPDZbtfAFx+0fHQ==
X-Received: by 2002:a17:90a:9d88:: with SMTP id
 k8mr3121955pjp.141.1608792705605; 
 Wed, 23 Dec 2020 22:51:45 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id w18sm25677012pfj.120.2020.12.23.22.51.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 22:51:44 -0800 (PST)
Date: Thu, 24 Dec 2020 12:21:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201224065142.7rhfx37wgg3ejjqm@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
 <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

T24gMjMtMTItMjAsIDIzOjM3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMTIuMjAyMCAw
ODo1NywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBXaGF0J3Mgd3Jvbmcgd2l0aCBnZXR0
aW5nIHRoZSByZWd1bGF0b3IgaW4gdGhlIGRyaXZlciBhcyB3ZWxsID8gQXBhcnQgZnJvbSB0aGUK
PiA+IE9QUCBjb3JlID8KPiAKPiBUaGUgdm9sdGFnZSBzeW5jaW5nIHNob3VsZCBiZSBkb25lIGZv
ciBlYWNoIGNvbnN1bWVyIHJlZ3VsYXRvcgo+IGluZGl2aWR1YWxseSBbMV0uCj4gCj4gU2Vjb25k
bHksIHJlZ3VsYXRvciBjb3JlIGRvZXNuJ3Qgd29yayB3ZWxsIHRvZGF5IGlmIHRoZSBzYW1lIHJl
Z3VsYXRvcgo+IGlzIHJlcXVlc3RlZCBtb3JlIHRoYW4gb25lIHRpbWUgZm9yIHRoZSBzYW1lIGRl
dmljZS4KCkhtbS4uLgoKPiA+PiB3aWxsIHJldHVybiB0aGUgT1BQIHRhYmxlIHJlZ3VsYXRvciBp
biBvcmRlciB0byBhbGxvdyBkcml2ZXIgdG8gdXNlIHRoZQo+ID4+IHJlZ3VsYXRvciBkaXJlY3Rs
eS4gQnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMgYSBtdWNoIGJldHRlcgo+ID4+IG9w
dGlvbiB0aGFuIHRoZSBvcHBfc3luY19yZWd1bGF0b3JzKCkgYW5kIG9wcF9zZXRfdm9sdGFnZSgp
IEFQSXMuCj4gPiAKPiA+IHNldF92b2x0YWdlKCkgaXMgc3RpbGwgZmluZSBhcyB0aGVyZSBpcyBz
b21lIGRhdGEgdGhhdCB0aGUgT1BQIGNvcmUgaGFzLCBidXQKPiA+IHN5bmNfcmVndWxhdG9yKCkg
aGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBPUFAgY29yZS4KPiA+IAo+ID4gQW5kIHRoaXMgbWF5IGxl
YWQgdG8gbW9yZSB3cmFwcGVyIGhlbHBlcnMgaW4gdGhlIE9QUCBjb3JlLCB3aGljaCBJIGFtIGFm
cmFpZCBvZi4KPiA+IEFuZCBzbyBldmVuIGlmIGl0IGlzIG5vdCB0aGUgYmVzdCwgSSB3b3VsZCBs
aWtlIHRoZSBPUFAgY29yZSB0byBwcm92aWRlIHRoZSBkYXRhCj4gPiBhbmQgbm90IGdldCBpbnRv
IHRoaXMuIE9mY291cnNlIHRoZXJlIGlzIGFuIGV4Y2VwdGlvbiB0byB0aGlzLCBvcHBfc2V0X3Jh
dGUuCj4gPiAKPiAKPiBUaGUgcmVndWxhdG9yX3N5bmNfdm9sdGFnZSgpIHNob3VsZCBiZSBpbnZv
a2VkIG9ubHkgaWYgdm9sdGFnZSB3YXMKPiBjaGFuZ2VkIHByZXZpb3VzbHkgWzFdLgo+IAo+IFRo
ZSBPUFAgY29yZSBhbHJlYWR5IGhhcyB0aGUgaW5mbyBhYm91dCB3aGV0aGVyIHZvbHRhZ2Ugd2Fz
IGNoYW5nZWQgYW5kCj4gaXQgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBsb2NraW5nIGZvciBib3Ro
IHNldF92b2x0YWdlKCkgYW5kCj4gc3luY19yZWd1bGF0b3IoKS4gUGVyaGFwcyBJJ2xsIG5lZWQg
dG8gZHVwbGljYXRlIHRoYXQgZnVuY3Rpb25hbGl0eSBpbgo+IHRoZSBQRCBkcml2ZXIsIGluc3Rl
YWQgb2YgbWFraW5nIGl0IGFsbCBnZW5lcmljIGFuZCByZS11c2FibGUgYnkgb3RoZXIKPiBkcml2
ZXJzLgo+IAo+IFsxXQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEwLjIv
c291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMNDEwNwoKTGV0cyBkbyBpdCBpbiB0aGUg
T1BQIGNvcmUgYW5kIHNlZSB3aGVyZSB3ZSBnby4KCi0tIAp2aXJlc2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
