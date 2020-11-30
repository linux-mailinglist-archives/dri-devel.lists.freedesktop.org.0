Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5A2C9962
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA246E54C;
	Tue,  1 Dec 2020 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9689A4E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 22:57:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r24so25137745lfm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CF4VCvT4y1MxLEN3CJpvUBs6aS1caFV9qr8mvMQWWkQ=;
 b=d2cpPCDwNOjwJ6zcyEH2OArFryPnDeS1v1mqLxiZ+cT8m5CMXk396ihiK1Z+IbhVGH
 1tDI2bfUXmCLyz0+wmsNpiZ8XBXhA1tumhbrUIKZiRJlzSGihfizD+UFCJu63/yAb4+K
 rV3Zm1PIcTZyuCXFy1FHWMOmSyc7jFxs5KUvk5p4diMvitODg1SqQZUkVjyquBm3BdPC
 N8Q2rwDqqHMfQsUGPskU3kXBiQdkLyCsLBgyldzxov3xNZ+QZpIqAjdOyAGQbGL41qm9
 BL787np2iHPKbnFaf48ATS0ymrwLyBukH6pVmXsxfCrhm5VPqbwaZOEPhxRq3gN3bZqt
 Bogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CF4VCvT4y1MxLEN3CJpvUBs6aS1caFV9qr8mvMQWWkQ=;
 b=eVNE2wH8jkRR4Uk03CoeeqvcPT52m7Lbov6fhcI7jsF6/OetFCilUChogwRp/VBxat
 k0NteO90sKeIA4ptS/lYQgrH46Q7ndV1p5AGXoHEbNBZsVr2zH/Ax56evTf7dzHeLJRr
 /ijbuGYHEXYU6orDxYGnKilOR0yb2emT6HYf0c0eP5xv+y6o9UXS1cU2PskY7oDYfQ9e
 NT80ru5JaGDjJmg0MQ9SRDvA0H7JkEwvg62X5VAIKrWDXBiWJ6HlXQB8QquY7FPM9I5r
 BtlNpT5FjSsGzjCEXmx+dnH2Q5Sx6JWOi8GstKuuiCTRnLcMbelmKt6RebkgdAeSx11A
 zk6A==
X-Gm-Message-State: AOAM5328iBr0yc4WEqzPfM+u2z77WpbclETPu80ZQMcwaN8MlViei0hk
 OH0mAhm5GgTA5PocCJPUGWDHfzeGERE=
X-Google-Smtp-Source: ABdhPJxPQ5c3K0b2ozPSWkF7iFJ7NCtYycGijm2HoLwZV/SOV1v33DiiclIeLz/+U3dd6zS5vKhPhQ==
X-Received: by 2002:ac2:4890:: with SMTP id x16mr10210588lfc.4.1606777066004; 
 Mon, 30 Nov 2020 14:57:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id p16sm2616059lfe.255.2020.11.30.14.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 14:57:45 -0800 (PST)
Subject: Re: [PATCH v10 17/19] ARM: tegra: Add EMC OPP properties to Tegra20
 device-trees
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-18-digetx@gmail.com>
 <60657f5e-bd30-094e-f8df-6ba69e0d6a3e@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ed05baf-3a01-3a2b-cd79-98b356c846cf@gmail.com>
Date: Tue, 1 Dec 2020 01:57:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <60657f5e-bd30-094e-f8df-6ba69e0d6a3e@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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

MDEuMTIuMjAyMCAwMDoxNywgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+IEhpIERtaXRyeSwKPiAK
PiBPbiAyMy8xMS8yMDIwIDAwOjI3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEFkZCBFTUMg
T1BQIERWRlMgdGFibGVzIGFuZCB1cGRhdGUgYm9hcmQgZGV2aWNlLXRyZWVzIGJ5IHJlbW92aW5n
Cj4+IHVuc3VwcG9ydGVkIE9QUHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4KPiBUaGlzIGNoYW5nZSBpcyBnZW5lcmF0aW5nIHRoZSBmb2xs
b3dpbmcgd2FybmluZyBvbiBUZWdyYTIwIFZlbnRhbmEKPiBhbmQgcHJldmVudHMgdGhlIEVNQyBm
cm9tIHByb2JpbmcgLi4uCj4gCj4gWyAgICAyLjQ4NTcxMV0gdGVncmEyMC1lbWMgNzAwMGY0MDAu
bWVtb3J5LWNvbnRyb2xsZXI6IGRldmljZS10cmVlIGRvZXNuJ3QgaGF2ZSBtZW1vcnkgdGltaW5n
cwo+IFsgICAgMi40OTkzODZdIHRlZ3JhMjAtZW1jIDcwMDBmNDAwLm1lbW9yeS1jb250cm9sbGVy
OiAzMmJpdCBEUkFNIGJ1cwo+IFsgICAgMi41MDU4MTBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLQo+IFsgICAgMi41MTA1MTFdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEgYXQg
L2xvY2FsL3dvcmtkaXIvdGVncmEvbWx0LWxpbnV4X25leHQva2VybmVsL2RyaXZlcnMvb3BwL29m
LmM6ODc1IF9vZl9hZGRfb3BwX3RhYmxlX3YyKzB4NTk4LzB4NjFjCj4gWyAgICAyLjUyOTc0Nl0g
TW9kdWxlcyBsaW5rZWQgaW46Cj4gWyAgICAyLjU0MDE0MF0gQ1BVOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgTm90IHRhaW50ZWQgNS4xMC4wLXJjNS1uZXh0LTIwMjAxMTMwICMxCj4gWyAgICAy
LjU1NDYwNl0gSGFyZHdhcmUgbmFtZTogTlZJRElBIFRlZ3JhIFNvQyAoRmxhdHRlbmVkIERldmlj
ZSBUcmVlKQo+IFsgICAgMi41NjA4OTJdIFs8YzAxMTEzNmM+XSAodW53aW5kX2JhY2t0cmFjZSkg
ZnJvbSBbPGMwMTBiYjYwPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQo+IFsgICAgMi41Njg2NDBd
IFs8YzAxMGJiNjA+XSAoc2hvd19zdGFjaykgZnJvbSBbPGMwYmNlZTU0Pl0gKGR1bXBfc3RhY2sr
MHhjOC8weGRjKQo+IFsgICAgMi41NzU4NjZdIFs8YzBiY2VlNTQ+XSAoZHVtcF9zdGFjaykgZnJv
bSBbPGMwMTIzNWRjPl0gKF9fd2FybisweDEwNC8weDEwOCkKPiBbICAgIDIuNTgyOTEyXSBbPGMw
MTIzNWRjPl0gKF9fd2FybikgZnJvbSBbPGMwMTIzNjkwPl0gKHdhcm5fc2xvd3BhdGhfZm10KzB4
YjAvMHhiOCkKPiBbICAgIDIuNTkwMzk3XSBbPGMwMTIzNjkwPl0gKHdhcm5fc2xvd3BhdGhfZm10
KSBmcm9tIFs8YzA4MjVhZDA+XSAoX29mX2FkZF9vcHBfdGFibGVfdjIrMHg1OTgvMHg2MWMpCj4g
WyAgICAyLjU5OTI2OV0gWzxjMDgyNWFkMD5dIChfb2ZfYWRkX29wcF90YWJsZV92MikgZnJvbSBb
PGMwODI1YjkwPl0gKGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKzB4M2MvMHgxYTApCj4gWyAgICAy
LjYwODU4Ml0gWzxjMDgyNWI5MD5dIChkZXZfcG1fb3BwX29mX2FkZF90YWJsZSkgZnJvbSBbPGMw
ODdiNzc0Pl0gKHRlZ3JhX2VtY19wcm9iZSsweDQ3OC8weDk0MCkKPiBbICAgIDIuNjE3NTQ4XSBb
PGMwODdiNzc0Pl0gKHRlZ3JhX2VtY19wcm9iZSkgZnJvbSBbPGMwNjU0Mzk4Pl0gKHBsYXRmb3Jt
X2Rydl9wcm9iZSsweDQ4LzB4OTgpCj4gWyAgICAyLjYyNTg5OV0gWzxjMDY1NDM5OD5dIChwbGF0
Zm9ybV9kcnZfcHJvYmUpIGZyb20gWzxjMDY1MjIzOD5dIChyZWFsbHlfcHJvYmUrMHgyMTgvMHgz
YjgpCj4gWyAgICAyLjYzNDE2Ml0gWzxjMDY1MjIzOD5dIChyZWFsbHlfcHJvYmUpIGZyb20gWzxj
MDY1MjU0MD5dIChkcml2ZXJfcHJvYmVfZGV2aWNlKzB4NWMvMHhiNCkKPiBbICAgIDIuNjQyMzM4
XSBbPGMwNjUyNTQwPl0gKGRyaXZlcl9wcm9iZV9kZXZpY2UpIGZyb20gWzxjMDY1Mjc0MD5dIChk
ZXZpY2VfZHJpdmVyX2F0dGFjaCsweDU4LzB4NjApCj4gWyAgICAyLjY1MTIwOF0gWzxjMDY1Mjc0
MD5dIChkZXZpY2VfZHJpdmVyX2F0dGFjaCkgZnJvbSBbPGMwNjUyN2M4Pl0gKF9fZHJpdmVyX2F0
dGFjaCsweDgwLzB4YmMpCj4gWyAgICAyLjY1OTczMF0gWzxjMDY1MjdjOD5dIChfX2RyaXZlcl9h
dHRhY2gpIGZyb20gWzxjMDY1MDYxMD5dIChidXNfZm9yX2VhY2hfZGV2KzB4NzQvMHhiNCkKPiBb
ICAgIDIuNjY3OTA1XSBbPGMwNjUwNjEwPl0gKGJ1c19mb3JfZWFjaF9kZXYpIGZyb20gWzxjMDY1
MTVmOD5dIChidXNfYWRkX2RyaXZlcisweDE2NC8weDFlOCkKPiBbICAgIDIuNjc2MTY4XSBbPGMw
NjUxNWY4Pl0gKGJ1c19hZGRfZHJpdmVyKSBmcm9tIFs8YzA2NTMyYTg+XSAoZHJpdmVyX3JlZ2lz
dGVyKzB4N2MvMHgxMTQpCj4gWyAgICAyLjY4NDI1OV0gWzxjMDY1MzJhOD5dIChkcml2ZXJfcmVn
aXN0ZXIpIGZyb20gWzxjMDEwMjIwOD5dIChkb19vbmVfaW5pdGNhbGwrMHg1NC8weDJiMCkKPiBb
ICAgIDIuNjkyNDQxXSBbPGMwMTAyMjA4Pl0gKGRvX29uZV9pbml0Y2FsbCkgZnJvbSBbPGMxMDAx
MGNjPl0gKGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWE0LzB4MWY0KQo+IFsgICAgMi43MDExNDVd
IFs8YzEwMDEwY2M+XSAoa2VybmVsX2luaXRfZnJlZWFibGUpIGZyb20gWzxjMGJkNDUxMD5dIChr
ZXJuZWxfaW5pdCsweDgvMHgxMTgpCj4gWyAgICAyLjcwOTMyMV0gWzxjMGJkNDUxMD5dIChrZXJu
ZWxfaW5pdCkgZnJvbSBbPGMwMTAwMWIwPl0gKHJldF9mcm9tX2ZvcmsrMHgxNC8weDI0KQo+IFsg
ICAgMi43MTY4ODVdIEV4Y2VwdGlvbiBzdGFjaygweGMxNTAxZmIwIHRvIDB4YzE1MDFmZjgpCj4g
WyAgICAyLjcyMTkzM10gMWZhMDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPiBbICAgIDIuNzMwMTA2XSAxZmMw
OiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMAo+IFsgICAgMi43MzgyNzhdIDFmZTA6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwCj4gWyAgICAyLjc1MTk0MF0gLS0t
WyBlbmQgdHJhY2UgNjFlM2I3NmRlY2EyN2VmMyBdLS0tCj4gCj4gCj4gQ2hlZXJzCj4gSm9uCj4g
CgpIZWxsbyBKb24sCgpUaGF0IGlzIGhhcm1sZXNzIGFuZCBleHBlY3RlZCB0byBoYXBwZW4gYmVj
YXVzZSB0aGUgcGF0Y2ggIm1lbW9yeToKdGVncmEyMDogU3VwcG9ydCBoYXJkd2FyZSB2ZXJzaW9u
aW5nIGFuZCBjbGVhbiB1cCBPUFAgdGFibGUKaW5pdGlhbGl6YXRpb24iIGlzbid0IGFwcGxpZWQg
eWV0LCB3aGlsZSBUaGllcnJ5IGFscmVhZHkgYXBwbGllZCB0aGUgRFQKcGF0Y2hlcyBmcm9tIHRo
aXMgdjEwLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
