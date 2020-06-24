Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46495209A8E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA006E524;
	Thu, 25 Jun 2020 07:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1166E2CC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 23:18:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 9so4427549ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N/dDcXBXWDwC4zyxlYEZ8P29kM4LWeAUwOY2s7cR5+s=;
 b=fqM00r7Whpw/s41yvxtsj7ZFnpeEirTMoXbgfkefjZDx6lV6bh/PJLDMEVgguxKCZj
 hHzU7dp3hhWnbebldN1402iG9BRwMGohjp0pKKpCiOWUITydWoAfQ+uc4ZTEo03xa0yl
 Ag5AdM7v5bIT5MAlny7lpTCICWIEApnXaKYtM1TYEVWg97Nqgzqhcgn4Qj2v6NOaZ9nZ
 8qnp0Dry5jXvS3fCiGfarER5mZpub8Ro7VxvQhhRp8u2Kc0RG29Xq6jAB6cw9qb9g814
 wyoRoEw7Byvxmu0bbSXMsUI/ARZGdupMbCnMXqCmbioJFDI/D+v4IfphUybO9bnY0w6+
 AByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/dDcXBXWDwC4zyxlYEZ8P29kM4LWeAUwOY2s7cR5+s=;
 b=k/BI10R/d51WBDwh26TswDPOwcVQwZMe/RHdpDH5L8pLHG1ePSxIPVaY5cR9FHXh7W
 X4c3mR7JigEFJvaAZBuV7NOgJ+JwACEtAesfFMPl4rUwNYEvNDRWHf8A3Ppev2Yz7srE
 jopxTR4wIY8tCyYvBj4Oy8XIgJcPvOk2k6qfECN2N8fgZg9MsAKpg5RhkWt9uVzMkLO7
 PJI9EHEYGLwFZok3Q0RBeQHnWEavkuNRtLd0/sWPW6RG5F1poQFjvQMCnsIpm5aWbNt3
 D66GtdQYLMTnHQRvFmxTcPHmzjOcI4GSK0eZ79X4GpYMPfnUaLUadXPmkDmsXhl3eOXc
 rY0Q==
X-Gm-Message-State: AOAM532sCjqkgsive82rRfnEWhiKd6h7vBOf5OJkVyQ/KTxoimb3smeZ
 CyATcTAVSIM8mqxJdEXZyzk=
X-Google-Smtp-Source: ABdhPJy9180N0f6oZuoxSax4qbvjlu8TUcc9a5AEolEiwH9y/uOercIBbtHsBwCCWZLoMuvHsrs0zg==
X-Received: by 2002:a2e:b0fa:: with SMTP id h26mr14657715ljl.148.1593040728541; 
 Wed, 24 Jun 2020 16:18:48 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id d6sm1640894lja.77.2020.06.24.16.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 16:18:47 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
Date: Thu, 25 Jun 2020 02:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gc3RydWN0IGRy
bV90ZWdyYV9jaGFubmVsX3N1Ym1pdCB7Cj4gwqDCoMKgwqDCoMKgwqAgX191MzIgY2hhbm5lbF9p
ZDsKPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBmbGFnczsKPiAKPiDCoMKgwqDCoMKgwqDCoCAvKioK
PiDCoMKgwqDCoMKgwqDCoMKgICogW2luXSBUaW1lb3V0IGluIG1pY3Jvc2Vjb25kcyBhZnRlciB3
aGljaCB0aGUga2VybmVsIG1heQo+IMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgY29uc2lkZXIgdGhl
IGpvYiB0byBoYXZlIGh1bmcgYW5kIG1heSByZWFwIGl0IGFuZAo+IMKgwqDCoMKgwqDCoMKgwqAg
KsKgwqAgZmFzdC1mb3J3YXJkIGl0cyBzeW5jcG9pbnQgaW5jcmVtZW50cy4KPiDCoMKgwqDCoMKg
wqDCoMKgICoKPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIFRoZSB2YWx1ZSBtYXkgYmUgY2FwcGVk
IGJ5IHRoZSBrZXJuZWwuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgIF9f
dTMyIHRpbWVvdXQ7Cj4gCj4gwqDCoMKgwqDCoMKgwqAgX191MzIgbnVtX3N5bmNwdF9pbmNyczsK
PiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBudW1fcmVsb2NhdGlvbnM7Cj4gwqDCoMKgwqDCoMKgwqAg
X191MzIgbnVtX2NvbW1hbmRzOwo+IAo+IMKgwqDCoMKgwqDCoMKgIF9fdTY0IHN5bmNwdF9pbmNy
czsKPiDCoMKgwqDCoMKgwqDCoCBfX3U2NCByZWxvY2F0aW9uczsKPiDCoMKgwqDCoMKgwqDCoCBf
X3U2NCBjb21tYW5kczsKCkRvIHdlIHJlYWxseSBuZWVkIHRvIHJldGFpbiB0aGUgbXVsdGktZ2F0
aGVyIHN1cHBvcnQ/IFRoZSBjb2RlLWJsb2F0Cihib3RoIHVzZXJzcGFjZSBhbmQga2VybmVsIGRy
aXZlcikgaXMgdmVyeSBzaWduaWZpY2FudCBqdXN0IGZvcgpwcmVwYXJpbmcgYW5kIHBhdGNoaW5n
IG9mIHRoZSBtdWx0aS1idWZmZXIgY21kc3RyZWFtcy4KCklmIHVzZXJzcGFjZSBydW5zIG91dCBv
ZiBhIGZyZWUgc3BhY2Ugd2l0aGluIHRoZSBwdXNoYnVmZmVyLCB0aGVuIGl0CnNob3VsZCBzaW1w
bHkgcmVhbGxvY2F0ZSBhIGxhcmdlciBwdXNoYnVmZmVyLgoKSSdtIHN1Z2dlc3RpbmcgdGhhdCB3
ZSBzaG91bGQgaGF2ZSBhIHNpbmdsZSBnYXRoZXIgcGVyLWpvYiwgYW55IG9iamVjdGlvbnM/Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
