Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57E2D2602
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EA16E978;
	Tue,  8 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DD06E8EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 22:11:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j10so16776997lja.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MJm4yFBoOOG0Zxihy7qPEaeoKuVX+MClzRO8u7W5XUg=;
 b=tbSwwhqIuNQzd6L+D2wv6DP3s10F3sQjGFbz9OZUiX32KC7DgE1gCLimps3ZYKpw1O
 btb4gSIDwLmF8DfMaR7t1MJmpGW3up9U8Yg4lnvwjKc2f1ionNYGvK9aJqwWNCh84DzI
 Wn2yeourqvFLQWyNQaL4qnZyP2G4GCcOOBP4a7WwMlSWL0o6WD3rO7w9x9d7F06HnH3S
 3LTCVfnD1bicCQawdSIduxCNwCe31R3Mp6nNjJP+9Cl6TbtPvoTpDB6s8XlH+vWU7/DL
 H+D8y86H6LXu6eMIf1FL9uRO0Nqqf6mVn9Mgfih/V4T0M3CSd6zTcQAO0PXofQPfWg+C
 gXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJm4yFBoOOG0Zxihy7qPEaeoKuVX+MClzRO8u7W5XUg=;
 b=PFCjw9wwweDYDEujEfC/RcjTUpWuAiKkkI4bydozQbfDCB++20eKlaOUuo62NZxd/H
 E2NKKsEmIZ68vkLMcX0+ojFd2AdpgOejxa9pFkjFi6jmwLY8pQKFZT1VzInPOUOVAhTR
 uMP9WCeS6WKnvLGDAxwTuxIwcZWed8a+ZVsLP90jXrKLde/cYenO0qA1jQOqyrrFWyA7
 C+tthapr2RlnmM41qMnj7Vb6xWZBWRJ2JjNciszWZ7+h7DdhMuW5xFNYAFDJcfCwWZ9i
 XI6Z+5JTziXCmTYf1c7HJI90C+vpzWrEOo3OlaBMXhaHCBjMPcSzvgqGkzau4WCWxI24
 YfnA==
X-Gm-Message-State: AOAM531MIhuxXRwGBWB0rfuoIpNaOTY2lVtArJu2/ri3MEvrWvgAXsyF
 YelxxDT+KR++pgPcvoSptd0=
X-Google-Smtp-Source: ABdhPJwHEfUeaYEY6cBzpP/Ij0Zo7ypjRgpkG3KdpX0TNEunlTBMvM1jIpO0BRfGMx711+SK5PytMA==
X-Received: by 2002:a2e:2a83:: with SMTP id q125mr5672403ljq.436.1607379082627; 
 Mon, 07 Dec 2020 14:11:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru.
 [109.252.192.53])
 by smtp.googlemail.com with ESMTPSA id x25sm3062664lfn.99.2020.12.07.14.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:11:22 -0800 (PST)
Subject: Re: [PATCH v11 09/10] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20201203192439.16177-1-digetx@gmail.com>
 <CGME20201203192723epcas1p372e53c3e1443b7cd3010c44faff735ec@epcas1p3.samsung.com>
 <20201203192439.16177-10-digetx@gmail.com>
 <42927892-d4a7-9368-480b-14c0d06e7116@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6ab55ef7-87bb-9f10-c262-b02430fe7d12@gmail.com>
Date: Tue, 8 Dec 2020 01:11:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <42927892-d4a7-9368-480b-14c0d06e7116@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDcuMTIuMjAyMCAwNDozMiwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gT24gMTIvNC8yMCA0
OjI0IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggbW92ZXMgQUNUTU9O
IGRyaXZlciBhd2F5IGZyb20gZ2VuZXJhdGluZyBPUFAgdGFibGUgYnkgaXRzZWxmLAo+PiB0cmFu
c2l0aW9uaW5nIGl0IHRvIHVzZSB0aGUgdGFibGUgd2hpY2ggY29tZXMgZnJvbSBkZXZpY2UtdHJl
ZS4gVGhpcwo+PiBjaGFuZ2UgYnJlYWtzIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBkZXZpY2Ut
dHJlZXMgYW5kIGJyaW5ncyBzdXBwb3J0Cj4+IGZvciB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29y
ayB0byB0aGUgZHJpdmVyLiBUaGlzIGlzIGEgbWFuZGF0b3J5IGNoYW5nZQo+PiB3aGljaCBuZWVk
cyB0byBiZSBkb25lIGluIG9yZGVyIHRvIGltcGxlbWVudCBpbnRlcmNvbm5lY3QtYmFzZWQgbWVt
b3J5Cj4+IERWRlMsIGkuZS4gZGV2aWNlLXRyZWVzIG5lZWQgdG8gYmUgdXBkYXRlZC4gTm93IEFD
VE1PTiBpc3N1ZXMgYSBtZW1vcnkKPj4gYmFuZHdpZHRoIHJlcXVlc3RzIHVzaW5nIGRldl9wbV9v
cHBfc2V0X2J3KCkgaW5zdGVhZCBvZiBkcml2aW5nIEVNQyBjbG9jawo+PiByYXRlIGRpcmVjdGx5
Lgo+Pgo+PiBUZXN0ZWQtYnk6IFBldGVyIEdlaXMgPHBnd2lwZW91dEBnbWFpbC5jb20+Cj4+IFRl
c3RlZC1ieTogTmljb2xhcyBDaGF1dmV0IDxrd2l6YXJ0QGdtYWlsLmNvbT4KPj4gQWNrZWQtYnk6
IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBE
bWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQouLi4KPiAKPiBBcHBsaWVk
IGl0LiBUaGFua3MgZm9yIHlvdXIgd29yayBmb3IgYSBsb25nIHRpbWUuCj4gCgpUaGFuayB5b3Uh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
