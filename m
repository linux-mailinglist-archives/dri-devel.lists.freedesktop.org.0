Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54362A6462
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4B96ECFD;
	Wed,  4 Nov 2020 12:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466866ECFD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:31:46 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so26948923lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 04:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=eGRfu7cZeqB9YUMW6wjYUN4TCDuvZCIBiy+8r0Kdrlk=;
 b=eShQiJoD1/m8u+97eU87dp/yafAb16bUfFTVdkZuqkOzdCTmSurMyIKCih2nJi8WnJ
 gC8krvS3buQBVbx3pcHyWXmQ6VBS467Ff8gd2dSdD67wPJlqXLsysPTK+RyqdVs4Kseq
 A2BJxsVaaH3p6aeHBR8Yb5EQt5RIOuU2vYdR4f1IdvaBC9tQZ3JIhMGn/5KczIfHSYI2
 4zPS6rSPgQVeSHVyz5/wR9jMc7uEAqXN4AI4A40hO2A8ptyMWvH8AxuotxNao8DpfzNP
 bUh51sJEcqaTeLKnrWuJRB/SEUghmhjSX2sAb6x1qgqaHbYqAX4DYyWTrwbYUP2ij3Ie
 Ye1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=eGRfu7cZeqB9YUMW6wjYUN4TCDuvZCIBiy+8r0Kdrlk=;
 b=JxU6Y3swGzxLmb4RA3N4sTLKxSn37N7lUVlStPvv1VP620tEPYdwShhYI1j+iPtqur
 C9mZtky5+o51NbaNcHAdW7hrPSe/dctDLngDvj94tYnWhu8lzRDu7wz+ABahPrlNH4g/
 7P8byGynsuJ+panEx8P4weuxZCgASTZ7Bw/G6T6F+om69tXIQBhhHnCPS6OmPwjFmCbd
 sGDejT5xUUA4760ufllVhVrTlFMmJVqqUY+gGY+mqbN7nMaUB20m+vk3Yiv711FQUycp
 QCJMJdrreHBgmB3+4GMXi5P4T2iDnvF9XffE9Ey2jyVAgL/2bbAprEVo2XzhCECQu9Ed
 AdsA==
X-Gm-Message-State: AOAM530HVDeBMiStrglUV9TJ8/ZOAwA2kZIlpefefRpJcq+b8bf1KLZB
 NXIvHY9wsJSfMq4Df2w7pKeozpsXSbNOFdb+v8w=
X-Google-Smtp-Source: ABdhPJxYcnhLMr5T9ylhOB5yD+qW82hWOXmFvCpNYKZkAw45ROiHQe9/VagZPfb0cKmlftPPAx1vUh+o6owLdQSPzD0=
X-Received: by 2002:a05:6512:290:: with SMTP id
 j16mr9147999lfp.62.1604493104713; 
 Wed, 04 Nov 2020 04:31:44 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d@eucas1p2.samsung.com>
 <20201104103657.18007-1-s.nawrocki@samsung.com>
 <20201104103657.18007-6-s.nawrocki@samsung.com>
In-Reply-To: <20201104103657.18007-6-s.nawrocki@samsung.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 4 Nov 2020 21:31:08 +0900
Message-ID: <CAGTfZH2uSYesGdOikGZ_2qBWe4i+yZ6RnczJyn5ML=pvusC+iw@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Reply-To: cwchoi00@gmail.com
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3lsd2VzdGVyLAoKT24gV2VkLCBOb3YgNCwgMjAyMCBhdCA3OjM3IFBNIFN5bHdlc3RlciBO
YXdyb2NraQo8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFk
ZHMgdGhlIGZvbGxvd2luZyBwcm9wZXJ0aWVzIGZvciBFeHlub3M0NDEyIGludGVyY29ubmVjdAo+
IGJ1cyBub2RlczoKPiAgLSBpbnRlcmNvbm5lY3RzOiB0byBkZWNsYXJlIGNvbm5lY3Rpb25zIGJl
dHdlZW4gbm9kZXMgaW4gb3JkZXIgdG8KPiAgICBndWFyYW50ZWUgUE0gUW9TIHJlcXVpcmVtZW50
cyBiZXR3ZWVuIG5vZGVzLAo+ICAtICNpbnRlcmNvbm5lY3QtY2VsbHM6IHJlcXVpcmVkIGJ5IHRo
ZSBpbnRlcmNvbm5lY3QgZnJhbWV3b3JrLAo+ICAtIHNhbXN1bmcsZGF0YS1jbGstcmF0aW86IHdo
aWNoIGFsbG93cyB0byBzcGVjaWZ5IG1pbmltdW0gZGF0YSBjbG9jawo+ICAgIGZyZXF1ZW5jeSBj
b3JyZXNwb25kaW5nIHRvIHJlcXVlc3RlZCBiYW5kd2lkdGggZm9yIGVhY2ggYnVzLgo+Cj4gTm90
ZSB0aGF0ICNpbnRlcmNvbm5lY3QtY2VsbHMgaXMgYWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFy
ZSBub3QKPiBoYXJkY29kZWQgYW55d2hlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndp
Z2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5h
d3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY4Ogo+
ICAtIG5vbmUuCj4KPiBDaGFuZ2VzIGZvciB2NzoKPiAgLSBhZGp1c3RlZCB0byB0aGUgRFQgcHJv
cGVydHkgY2hhbmdlczogImludGVyY29ubmVjdHMiIGluc3RlYWQKPiAgICBvZiAic2Ftc3VuZyxp
bnRlcmNvbm5lY3QtcGFyZW50IiwgInNhbXN1bmcsZGF0YS1jbGstcmF0aW8iCj4gICAgaW5zdGVh
ZCBvZiAiYnVzLXdpZHRoIi4KPgo+IENoYW5nZXMgZm9yIHY2Ogo+ICAtIGFkZGVkIGJ1cy13aWR0
aCBwcm9wZXJ0eSBpbiBidXNfZG1jIG5vZGUuCj4KPiBDaGFuZ2VzIGZvciB2NToKPiAgLSBhZGp1
c3QgdG8gcmVuYW1lZCBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlIHByb3BlcnR5LAo+
ICAtIGFkZCBwcm9wZXJ0aWVzIGluIGNvbW1vbiBleHlub3M0NDEyLmR0c2kgZmlsZSByYXRoZXIg
dGhhbgo+ICAgIGluIE9kcm9pZCBzcGVjaWZpYyBvZHJvaWQ0NDEyLW9kcm9pZC1jb21tb24uZHRz
aS4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0
MTIuZHRzaQo+IGluZGV4IGU3Njg4MWQuLjQ5OTllNjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi5kdHNpCj4gQEAgLTM4Myw2ICszODMsOCBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9ETUM+Owo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gImJ1cyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgb3BlcmF0aW5n
LXBvaW50cy12MiA9IDwmYnVzX2RtY19vcHBfdGFibGU+Owo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNhbXN1bmcsZGF0YS1jbG9jay1yYXRpbyA9IDw0PjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiBAQCAtNDUyLDYg
KzQ1NCw4IEBACj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtf
RElWX0dETD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIjsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVm
dGJ1c19vcHBfdGFibGU+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVyY29ubmVjdHMg
PSA8JmJ1c19kbWM+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNpbnRlcmNvbm5lY3QtY2Vs
bHMgPSA8MD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsK
PiAgICAgICAgICAgICAgICAgfTsKPgo+IEBAIC00NjgsNiArNDcyLDggQEAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsb2NrIENMS19BQ0xLMTYwPjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIG9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kaXNwbGF5X29wcF90YWJsZT47Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJjb25uZWN0cyA9IDwmYnVzX2xlZnRidXMgJmJ1c19k
bWM+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiAgICAgICAg
ICAgICAgICAgfTsKPgo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKUmV2aWV3ZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cw
MC5jaG9pQHNhbXN1bmcuY29tPgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
