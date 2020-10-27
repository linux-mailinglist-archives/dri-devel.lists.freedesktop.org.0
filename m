Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B429CEA3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75AF6EB34;
	Wed, 28 Oct 2020 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971B16EC1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:17:51 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so3095231ljk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ifIWTd3Ns3z5oJhEjPKk2k9PCzO7a2NWGp66DijjkQk=;
 b=Qijb1sXa3G16lZSKA+nEkMxTIFLBrOUy5Rr9ZwMWzohV066o4tDSKTy574Ssd2HZZh
 E2Fya2EazJhBeeVSaKb/aoec4Xjb3Sg/S4tal9lKtluK/G1J06H5EFvkpePIUcIIQP2g
 7U2rOnrH/qSw85t6v9OUvCjIUIQ04tUXCftdChd+osjOsMgsnvfxh4itMs3zC+xHgGvX
 gGzBF7NcJIdI8YEIfWlQDa//AsReWvaZGwbaNR+GAJoMmtu1Z14PmNoJrw8Oxw2vehJv
 M/QQl1LS3HTPuzC/JaB3lNxk9IX1y2oJeYxSq5skCG1eaUleaZv24CBcN51vTntgmiUu
 PvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ifIWTd3Ns3z5oJhEjPKk2k9PCzO7a2NWGp66DijjkQk=;
 b=es94hIw4hNGMxTGFu/YSPKCfAldWcFwKHHJcuwF/yNsYduaXCfiKBsmp+qV9mhz1FQ
 OqaQyZUsVsY8kQJALUWXYTQUmjRUT8FiblZo73pB57EmqctKxNHYimCJZQsncd3/f1xG
 7gipCfAQReUXjIwakIdbdqpD2bsR8zB/tFByl7P1t+6FXCG4KBp6yiNlwt7D9HSOfH0m
 K2YYg65gd2NbZGn81HO9IjSKs3gQMtUs0M6yKAUZ/0kWA6rWtJyCgRiyV/TrCyf1uEND
 tftx4H42qcNXWeGQog2xZzGK3SW6vGoJgKrIfTXDrhf2qVhf+252Xnj0lfbr91pdLvxk
 5+Lg==
X-Gm-Message-State: AOAM530rkWmfWTOuoTNFROsWoI6QXJ4M38b1Tgb3/jXTB2pBajpeltoJ
 dZMxeBlHeiDyo0a/x8nOD28=
X-Google-Smtp-Source: ABdhPJyPI9JpflgVqg2iXiOFHiXQeJRvyXlDI/bHczUvMHXIiq4h5JDmIqgByTyJAgr+vMgcI23YaA==
X-Received: by 2002:a2e:8985:: with SMTP id c5mr1866622lji.406.1603826269920; 
 Tue, 27 Oct 2020 12:17:49 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id y7sm151668lff.153.2020.10.27.12.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:17:49 -0700 (PDT)
Subject: Re: [PATCH v6 05/52] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-6-digetx@gmail.com> <20201027085548.GE4244@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <abf1df6c-3e45-209c-244e-356d88b454aa@gmail.com>
Date: Tue, 27 Oct 2020 22:17:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027085548.GE4244@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMTo1NSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQ4QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gTWVtb3J5IGNvbnRyb2xsZXIgaXMgaW50ZXJjb25uZWN0ZWQgd2l0aCBtZW1vcnkgY2xp
ZW50cyBhbmQgd2l0aCB0aGUKPj4gRXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIuIERvY3VtZW50
IG5ldyBpbnRlcmNvbm5lY3QgcHJvcGVydHkgd2hpY2gKPj4gdHVybnMgbWVtb3J5IGNvbnRyb2xs
ZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4+Cj4+IEFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVy
cy9udmlkaWEsdGVncmEyMC1tYy50eHQgICAgICAgICAgfCAzICsrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1tYy50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252
aWRpYSx0ZWdyYTIwLW1jLnR4dAo+PiBpbmRleCBlNTUzMjgyMzdkZjQuLjczOWI3YzZmMmUyNiAx
MDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9udmlkaWEsdGVncmEyMC1tYy50eHQKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1tYy50
eHQKPj4gQEAgLTE2LDYgKzE2LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gICAgSU9NTVUg
c3BlY2lmaWVyIG5lZWRlZCB0byBlbmNvZGUgYW4gYWRkcmVzcy4gR0FSVCBzdXBwb3J0cyBvbmx5
IGEgc2luZ2xlCj4+ICAgIGFkZHJlc3Mgc3BhY2UgdGhhdCBpcyBzaGFyZWQgYnkgYWxsIGRldmlj
ZXMsIHRoZXJlZm9yZSBubyBhZGRpdGlvbmFsCj4+ICAgIGluZm9ybWF0aW9uIG5lZWRlZCBmb3Ig
dGhlIGFkZHJlc3MgZW5jb2RpbmcuCj4+ICstICNpbnRlcmNvbm5lY3QtY2VsbHMgOiBTaG91bGQg
YmUgMS4gVGhpcyBjZWxsIHJlcHJlc2VudHMgbWVtb3J5IGNsaWVudC4KPj4gKyAgVGhlIGFzc2ln
bm1lbnRzIG1heSBiZSBmb3VuZCBpbiBoZWFkZXIgZmlsZSA8ZHQtYmluZGluZ3MvbWVtb3J5L3Rl
Z3JhMjAtbWMuaD4uCj4gCj4gVGhpcyBpcyBhIGxpc3Qgb2YgcmVxdWlyZWQgcHJvcGVydGllcyBz
byB5b3UgYnJlYWsgdGhlIEFCSS4gQWxsIGV4aXN0aW5nCj4gRFRCcyB3aWxsIGJlIGFmZmVjdGVk
LgoKVGhpcyBpcyBvcHRpb25hbCBwcm9wZXJ0eSBmb3IgdGhlIG9sZGVyIERUQnMsIGJ1dCBmb3Ig
bmV3ZXIgRFRzIGl0J3MKbWFuZGF0b3J5LiBJSVVDLCBpdCBzaG91bGQgYmUgZGVmaW5lZCBhcyBh
IHJlcXVpcmVkIHByb3BlcnR5IGluIHRoZQpiaW5kaW5nLgoKUGxlYXNlIHNlZSB0ZWdyYV9tY19p
bnRlcmNvbm5lY3Rfc2V0dXAoKSBpbiAibWVtb3J5OiB0ZWdyYS1tYzogQWRkCmludGVyY29ubmVj
dCBmcmFtZXdvcmsiLCB3aGljaCBjaGVjayBwcmVzZW5jZSBvZiB0aGUgSUNDIERUIHByb3BlcnR5
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
