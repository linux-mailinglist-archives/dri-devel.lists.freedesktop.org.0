Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED89265CED
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26776E9F9;
	Fri, 11 Sep 2020 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB226E248
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 21:57:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r24so10205735ljm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jpYDX2OjS7paAMEd9EjcA05DN6iDvcdY5rzCc83mWx4=;
 b=G1eGHB4NEkb59dJz2WYINX4Ex2JzL4QmyUd/4++h7e2gluJ5F/pmxfkLgppuemfPjK
 dSraaDOIs041+gggf4l07sgYex0Zpr442DCmACpv+gb01iul+tXraQ5rePu9yaOLXzv6
 fjbZ1ZfEqF8JJg78C+inRz5PZtYOwHhR4hHwgKRbbScVS6VBNdKbe4SzizufMvrchXJa
 K9DXkzpW4uRj/kdSneing6lxZq0a000nax6SCohlYwdNlGe/z2XajO0e/0+Mk4d2XgV4
 2+XBiNd/niBaV1IGiSKTWQe0UqhktixdCxD7H9QM6X/pvyur5UbEcQFNUOXyeDXIucSw
 mizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jpYDX2OjS7paAMEd9EjcA05DN6iDvcdY5rzCc83mWx4=;
 b=qofqBqYy191Fwc64ScQ7n3bhjjyi4uwPhKZZ7E8x1RMTXaTCsS9rM/++WEbyioEqry
 +SikJoNSBioTJv6NJDXERTCtQDriQz+KJUf64Pky9acWve8uPBuEut+wg7Rl5/wOUsKw
 yPWGQkc0wGbn4LHkm5iSwK/vzb/W1eBoIKvcaw66bd6zBLK7tpZ5dw6Tob6+ko+WNtw2
 vT7bXTbQdXnDatLTlYIAXXK/RDpODEIf6/cs30d6n9XvoQj7oJY9GVvteDFRvEUTKeBp
 6NBfuxD64DLDSvaN/HEX4D2XffZxceo7iCiw1cs8JkPNQJW5foI2TrjbEmo+M+9UHHTS
 Hr1w==
X-Gm-Message-State: AOAM53007ulKCebBpVrjUluDEg5gZO6lCCS5HDpqyb8PL1xDhyW7cPxk
 UoiulkKLu0dsVrTCXnHFolA=
X-Google-Smtp-Source: ABdhPJwEZOeIwmXX8f7KVk4QSSgpS1qoF8EPcLgSkPwTXpEeQpN55vuQeq7sNqL63ShVf7UprJwIuQ==
X-Received: by 2002:a2e:7119:: with SMTP id m25mr5894867ljc.365.1599775056494; 
 Thu, 10 Sep 2020 14:57:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id g6sm23030lfh.18.2020.09.10.14.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 14:57:35 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
Date: Fri, 11 Sep 2020 00:57:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMTozNiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+Pgo+PiBE
b2VzIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcz8KPj4KPiAK
PiBOb3Qgc3VyZSwgYnV0IGJldHRlciBoYXZlIGl0IGEgYml0IG1vcmUgZmluZS1ncmFpbmVkIHJh
dGhlciB0aGFuCj4gY29hcnNlLWdyYWluZWQuIFRoaXMgc3RpbGwgZ2l2ZXMgYSBtYXhpbXVtIHRp
bWVvdXQgb2YgNzEgbWludXRlcyBzbyBJCj4gZG9uJ3QgdGhpbmsgaXQgaGFzIGFueSBuZWdhdGl2
ZXMgY29tcGFyZWQgdG8gbWlsbGlzZWNvbmRzLgoKSWYgdGhlcmUgaXMgbm8gZ29vZCByZWFzb24g
dG8gdXNlIG1pY3Jvc2Vjb25kcyByaWdodCBub3csIHRoZW4gc2hvdWxkIGJlCmJldHRlciB0byBk
ZWZhdWx0IHRvIG1pbGxpc2Vjb25kcywgSU1PLiBJdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIHRv
CmV4dGVuZCB0aGUgSU9DTFQgd2l0aCBhIG1pY3Jvc2Vjb25kcyBlbnRyeSwgaWYgZXZlciBiZSBu
ZWVkZWQuCgp7CglfX3UzMiB0aW1lb3V0X21zOwouLi4KCV9fdTMyIHRpbWVvdXRfdXM7Cn0KCnRp
bWVvdXQgPSB0aW1lb3V0X21zICsgMTAwMCAqIHRpbWVvdXRfdXM7CgpUaGVyZSBzaG91bGRuJ3Qg
YmUgYSBuZWVkIGZvciBhIGxvbmcgdGltZW91dHMsIHNpbmNlIGEgam9iIHRoYXQgdGFrZXMKb3Zl
ciAxMDBtcyBpcyBwcm9iYWJseSB0b28gdW5wcmFjdGljYWwuIEl0IGFsc28gc2hvdWxkIGJlIHBv
c3NpYmxlIHRvCmRldGVjdCBhIHByb2dyZXNzaW5nIGpvYiBhbmQgdGhlbiBkZWZlciB0aW1lb3V0
IGluIHRoZSBkcml2ZXIuIEF0IGxlYXN0CnRoaXMgaXMgd2hhdCBvdGhlciBkcml2ZXJzIGRvLCBs
aWtlIGV0bmF2aXYgZHJpdmVyIGZvciBleGFtcGxlOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjUuOS1yYzQvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
c2NoZWQuYyNMMTA3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
