Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE91A7443
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D036E46F;
	Tue, 14 Apr 2020 07:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE3089E5A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 15:18:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so9090512ljd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GdKC161+a5UeWpGOznjCxdPHuVYqeTMUmqQiY/jkoXQ=;
 b=TFN6Q/Qgniz7+QYsjrimIJAqCoe+peI4ByNh8FPtgWl+IxMFdtouuBQ3DdCfB3D8PN
 oFoEqruP2xgPxXpyoHNn7qkhyEfX/knBklwQHC5cEDT3c8wCkZh5Ant45cCoCf7L+MnY
 H9jUYnfTNe6PyAgtlZ+i/fuxbnZVf4Dbs1zi4RBwYbjaTw5yYEp0ctKxn78YOe65eoPN
 rx8ERcL3GJNubbv3oJRiJylWBD6nwN0AzKmhs876f815+Z0TA5E5rUylFvQ6uRI0yiFm
 WPyD5sUC/vewP9l6d/8A9aE7jafPavBULRPl6+/Xcp/ROcHhElXempcZia6FYjyLEN61
 iDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GdKC161+a5UeWpGOznjCxdPHuVYqeTMUmqQiY/jkoXQ=;
 b=FGeFAFu798b7xHgdliGPJ6oLUbU+SlBcb3SHSg8CkVLGPYNIIuh7bWYIekS42Nakgn
 gbD6NcPAQtEJKQmb7itc1FDRo+CleFVP/VOZmWT1yqY70Asg1QzBl4/g7G08m8NYgrPR
 1qW03Z8BEPCmdSSK8dmL6fWeybstOfzw+5w6jukAjjesYg+2yLa4PHZdRhoMk3qKz1eX
 zzYzi07wwvqyZXdq+VBMfqkhf63p5P0tUXzSnUeSOQzUtjddKAJPwTZkIhTtLcA40mpT
 B+0q57hM5VHfL8BqHNgJaAHVEkr8sXzB9OLUh4WW3z3/yhM19XyPeCXBF5Bb7KJUgHCf
 zZpQ==
X-Gm-Message-State: AGi0PuYc31NF1ZIV5R97idPuNIbde2xhQxaOpBO/qsZ0OKwX8mIysevc
 aFglawLCelR0Cn4RI6N8mkA=
X-Google-Smtp-Source: APiQypKxQ/EghHVYpg1HOEBLhbZ8HlHRew/LfP6ed1H+YL6pEvyGOKxv7C+tCEfvFdT33UG6L9Hk1g==
X-Received: by 2002:a05:651c:120e:: with SMTP id
 i14mr7500365lja.12.1586791083641; 
 Mon, 13 Apr 2020 08:18:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id 64sm8427382lfh.32.2020.04.13.08.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 08:18:02 -0700 (PDT)
Subject: Re: [PATCH v2 17/22] memory: tegra30-emc: Register as interconnect
 provider
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-18-digetx@gmail.com>
 <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8d072775-aec8-5a55-8fd7-7166e2a34c95@gmail.com>
Date: Mon, 13 Apr 2020 18:18:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMDQuMjAyMCAxNTo0NCwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgouLi4KPiBBbGwgdGhl
IGFib3ZlIHNlZW1zIGxpa2UgYSBkdXBsaWNhdGUgb2Ygd2hhdCB3ZSBhbHJlYWR5IGhhdmUgaW4g
dGhlIHByZXZpb3VzCj4gcGF0Y2ggZm9yIHRlZ3JhMjAtZW1jLiBDYW4gd2UgaGF2ZSBhIHNpbmds
ZSBkcml2ZXIgZm9yIGJvdGg/IE1heWJlIGV4dHJhY3QgdGhlCj4gYWJvdmUgYXMgYSBzZXBhcmF0
ZSBpbnRlcmNvbm5lY3QgcHJvdmlkZXIgZHJpdmVyLgoKUGVyaGFwcyB3ZSBjb3VsZCBkbyBpdCBs
YXRlciBvbiwgb25jZSB0aGUgd29yayBvbiB0aGUgZHJpdmVycyB3aWxsCnNldHRsZSBkb3duLiBJ
IHRoaW5rIGl0IHNob3VsZCBiZSBva2F5IHRvIGhhdmUgc29tZSBtaW5vciBkdXBsaWNhdGlvbgpm
b3Igbm93LCB3ZSBhbHJlYWR5IGhhdmUgc29tZSBvdGhlciBzbWFsbCB0aGluZ3MgZHVwbGljYXRl
ZCBpbiB0aGVzZQpkcml2ZXJzLgoKPj4gIHN0YXRpYyBpbnQgdGVncmFfZW1jX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICB7Cj4+ICAJc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqbWM7Cj4+IEBAIC0xMzQ0LDYgKzE0NTIsMTMgQEAgc3RhdGljIGludCB0ZWdyYV9lbWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBlbWMpOwo+PiAgCXRlZ3JhX2VtY19kZWJ1Z2ZzX2luaXQoZW1jKTsKPj4gIAo+PiAr
CWlmIChJU19FTkFCTEVEKENPTkZJR19JTlRFUkNPTk5FQ1QpKSB7Cj4+ICsJCWVyciA9IHRlZ3Jh
X2VtY19pbnRlcmNvbm5lY3RfaW5pdChlbWMpOwo+IAo+IEhvdyBhYm91dCByZWdpc3RlcmluZyBh
IHBsYXRmb3JtIGRldmljZSB0aGF0IHdpbGwgdXNlIHRoZSBzYW1lIGRyaXZlciB0byBoYW5kbGUK
PiB0aGUgaW50ZXJjb25uZWN0IGZ1bmN0aW9uYWxpdHkgZm9yIGJvdGggdGVncmEyMCBhbmQgdGVn
cmEzMD8KCkl0IHNob3VsZCBiZSBwb3NzaWJsZS4gQnV0IGl0IGFsc28gc2hvdWxkIGJlIHBvc3Np
YmxlIHRvIG1ha2UgYWxsIHRoZXNlCmRyaXZlcnMgbW9kdWxhciwgd2hpY2ggSSdtIGdvaW5nIHRv
IHRyeSBvdXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
