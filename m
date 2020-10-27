Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8129CECC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F47D6EC62;
	Wed, 28 Oct 2020 08:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755626EC44
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:18:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f9so3175005lfq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iG/wxNmrUdXtLSeVT1BtnHJN9pkzBgnU00RG8GJ2snU=;
 b=CE39HJkOpz2gh5sSV++llTcun5s4wsCEeOrpAt219rLrkt/gR+YlD7apWOk00qLXXX
 //xUxQYChPEUJug1xtm8TEyvEqbhx0bvzSOuKPzlvtu6ArUr5qm2Uh6BBF9c6G1dw/tW
 P1PITxHBNTSs2O1kBNSerqAcJ8ohi2wgWGmBS3BmO0k4NCY2cPMLjCnXA4KfwwTyC3CJ
 2Q+unoIRJ9o5M0lqlTQb8gIiGYoRU2ElUMM5fApr/fYcNC52x77V6A7ezZSbG261zc5x
 PQ4ysbeaZvBAkAcRFbkKd5IhHXRnke2+8JNnbJUItIox/ug2zFqx6sTnLHzXc5GtSaXF
 rSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iG/wxNmrUdXtLSeVT1BtnHJN9pkzBgnU00RG8GJ2snU=;
 b=qkjzHqQQE9pF17VCRNJDk7a1VP4x4HQFpsY+fT/1IwbDGbgSPwwAcQfqy7oQcX6AaO
 PB/TB7h1hsUSmYFxPVkagy/RPnnwirWOfkplnek0hpTtaxA2xBOMcxwZx7oVSVJgSkBF
 kQf2wb7kDNpsOV37q5Xax+FMQQKCXt+R2smeqU3dUen7khINV6tiz8j5ZF4zMdnNCA7V
 bDV7i5iyspL6uWy4DD9TPNBOKBO8h+cufuKM8dbIm81IfxE6cv2CrI9cLY3YNUauFzDj
 5EqRQhSizcC4JY0NzPsPuRcQ2F4q5tb9PzaqE8RYFTqhEcUpt2uHUpoeK6b4JsFkd8RY
 MPTg==
X-Gm-Message-State: AOAM532Y86z5FS2hPK26PLTjYBOXjvkkhfUvJmrYM3I5TIyM8n7CAevk
 pzK7qHRY+fRs/FF46/Tl9go=
X-Google-Smtp-Source: ABdhPJw9WJsmI7CULR1MTFdVBn/kaz/1gHvAddqFoYIwlPvZrFmUfk5szzCImECUAzccEo8eqaCT6A==
X-Received: by 2002:a05:6512:32a4:: with SMTP id
 q4mr1559859lfe.477.1603829915945; 
 Tue, 27 Oct 2020 13:18:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id y3sm304031ljn.6.2020.10.27.13.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:18:35 -0700 (PDT)
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com> <20201027090212.GG4244@kozik-lap>
 <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
 <20201027194457.GD140636@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae06bd70-93f5-abe8-64d9-e5e991cd8ff8@gmail.com>
Date: Tue, 27 Oct 2020 23:18:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027194457.GD140636@kozik-lap>
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

MjcuMTAuMjAyMCAyMjo0NCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFR1
ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjIyOjE5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gMjcuMTAuMjAyMCAxMjowMiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+
Pj4+IEBAIC0zMSwxNyArMzIsMzQgQEAgRXhhbXBsZToKPj4+PiAgCQkuLi4KPj4+PiAgCX07Cj4+
Pj4gIAo+Pj4+ICsJZW1jX2J3X2Rmc19vcHBfdGFibGU6IGVtY19vcHBfdGFibGUxIHsKPj4+IEh5
cGhlbnMgZm9yIG5vZGUgbmFtZS4KPj4KPj4gV2UgYWxyZWFkeSB1c2UgdW5kZXJzY29yZXMgZm9y
IHRoZSBUZWdyYSBDUFUgT1BQIHRhYmxlLgo+Pgo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4xMC1yYzEvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMjAtY3B1LW9w
cC5kdHNpI0w0Cj4+Cj4+IFdoYXQgbWFrZXMgeW91IHRoaW5rIHRoYXQgaHlwaGVucyB3aWxsIGJl
IGEgYmV0dGVyIGNob2ljZT8gSXMgaXQgYQo+PiBkb2N1bWVudGVkIG5hbWluZyBjb252ZW50aW9u
Pwo+IAo+IFVuZm9ydHVuYXRlbHkgdGhhdCdzIHRoZSBzb3VyY2Ugb2YgY29uZnVzaW9uIGFsc28g
Zm9yIG1lIGJlY2F1c2UKPiBEZXZpY2V0cmVlIHNwZWMgbWVudGlvbnMgYm90aCBvZiB0aGVtIChh
bmQgZG9lcyBub3Qgc3BlY2lmeSBwcmVmZXJlbmNlcykuCj4gCj4gVGhlIGNob2ljZSBvZiBkYXNo
ZXMvaHlwaGVucyBjb21lcyBub3cgZXhwbGljaXRseSBmcm9tIGFsbCBkdHNjaGVtYQo+IGZpbGVz
LiAgUHJldmlvdXNseSwgdGhlIGRvY3VtZW50YXRpb24gd2VyZSBlbWFpbHMgZnJvbSBSb2IuIDop
CgpPa2F5LCBJJ2xsIGNoYW5nZSBpdCBpbiB2Ny4gU28gZmFyIEkgaGF2ZW4ndCBzZWVuIHdhcm5p
bmdzIGFib3V0IGl0IGZyb20KdGhlIHNjaGVtYS1jaGVja2VyLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
