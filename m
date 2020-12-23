Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB062E2AE2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7803E89B69;
	Fri, 25 Dec 2020 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8696189E26
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s26so272421lfc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3ureyQ26WVdvpPiApVvGnYNle5Fa1VHsYVcg9Aec3Z4=;
 b=JB7ZNM87FEjcnjJQONVUuTF17BvJ9V9ZS3hebD+x6uzZg2DGPHE7Lj1X+o+J9ISuus
 85ihjaar8Lr4oCD3QODU4FGkYnl2eCgmVKKIopMmCAmQ/KoYdSiq45M2PLliJt5mggct
 kbQvz4I/RnBpUtpDfvzstCJx9yCv5A+xF1dc3waB/YCRipctvTjPnf7xPX8lKAn0lIyg
 /ebkOqGUMAUeBqGUgJZBD1K+4lyYODAmeakH/EFLCs6V/OvqtWh98BegqF1PG/j41Vcv
 CBmasECEhUJ0viZjm5sowMCRQ1vgelVHsqCnS+LtFcP0F8Jn0Z7f5agO/J+nwc1xMDWE
 EGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ureyQ26WVdvpPiApVvGnYNle5Fa1VHsYVcg9Aec3Z4=;
 b=E0DtRq/NhcAki+EexGtnh6qM5iroQLWRR1leEEMnOSk1U3QlckkwPvBOTqeuU/2Mg0
 cPElFWLOWlX6sNSeUnMZ68Y6piTfjHwEAUHCKTtXx8Zqptxamy2WEXXXKg9HAFbrEOaJ
 ZDC810Uadxk/86CdqNBM87/euO7YE8AaOHjp57TX9Q33C8ZanR9ZusF5Z+xp038U8SoH
 iaFbtm1qFGPU2ADyDuG+xmKyiOseSaWoGDca8nnd6ryP2juavkkUFNc7e9CIRk0FmX2a
 Zro2Zr1PrHCNIHFduCycZnQK9CUG4dh18GHLjyg/t/q4dpHgqtmAvkZFFsukcqyeXNww
 RBrA==
X-Gm-Message-State: AOAM531lhdahgmHBXyFEQgNCeO/hDayBx1TKRPXrYWQlIJHfv1v8XDE4
 S4UoPAG55H2uTgoFgI0eaHs=
X-Google-Smtp-Source: ABdhPJxs2A1nOlz1juXuG3l0yvblA/Eo3IZZbB6Wrfw9MxG4tEEGohUi/FH/Bgb4gz3Fw9m3GGijnw==
X-Received: by 2002:a2e:9f01:: with SMTP id u1mr12029965ljk.386.1608755869072; 
 Wed, 23 Dec 2020 12:37:49 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id z14sm3349336lfd.283.2020.12.23.12.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:37:48 -0800 (PST)
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
Date: Wed, 23 Dec 2020 23:37:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
Content-Language: en-US
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

MjMuMTIuMjAyMCAwNzoxOSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjItMTItMjAs
IDIyOjE1LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIyLjEyLjIwMjAgMDk6NDIsIFZpcmVz
aCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTctMTItMjAsIDIxOjA2LCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+Pj4gQWRkIGEgY2VpbCB2ZXJzaW9uIG9mIHRoZSBkZXZfcG1fb3BwX2ZpbmRf
bGV2ZWwoKS4gSXQncyBoYW5keSB0byBoYXZlIGlmCj4+Pj4gbGV2ZWxzIGRvbid0IHN0YXJ0IGZy
b20gMCBpbiBPUFAgdGFibGUgYW5kIHplcm8gdXN1YWxseSBtZWFucyBhIG1pbmltYWwKPj4+PiBs
ZXZlbC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdt
YWlsLmNvbT4KPj4+Cj4+PiBXaHkgZG9lc24ndCB0aGUgZXhhY3QgdmVyc2lvbiB3b3JrIGZvciB5
b3UgaGVyZSA/Cj4+Pgo+Pgo+PiBUaGUgZXhhY3QgdmVyc2lvbiB3b24ndCBmaW5kIE9QUCBmb3Ig
bGV2ZWw9MCBpZiBsZXZlbHMgZG9uJ3Qgc3RhcnQgd2l0aAo+PiAwLCB3aGVyZSAwIG1lYW5zIHRo
YXQgbWluaW1hbCBsZXZlbCBpcyBkZXNpcmVkLgo+IAo+IFJpZ2h0LCBidXQgd2h5IGRvIHlvdSBu
ZWVkIHRvIHNlbmQgMCBmb3IgeW91ciBwbGF0Zm9ybSA/Cj4gCgpUbyBwdXQgcG93ZXIgZG9tYWlu
IGludG8gdGhlIGxvd2VzdCBwZXJmb3JtYW5jZSBzdGF0ZSB3aGVuIGRldmljZSBpcyBpZGxpbmcu
CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMC1yYzIvc291cmNlL2RyaXZl
cnMvb3BwL2NvcmUuYyNMODk3CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4x
MC1yYzIvc291cmNlL2RyaXZlcnMvb3BwL2NvcmUuYyNMNzg1CgpBbHNvIHBsZWFzZSBzZWUgcGF0
Y2ggMzIsIHRlZ3JhX2Nsb2NrX3J1bnRpbWVfc3VzcGVuZCgpLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
