Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DB2A3E90
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131676EC46;
	Tue,  3 Nov 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511F6E33F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 19:58:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 23so16338659ljv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 11:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1JXbVMJB6iZDvFn2TYFYjVdXtMc5N33ypKmnpsnfwcw=;
 b=GvSuHE002gQYaHK6//lYRoOM8iWIiSv4gpl/5TT86pgpNMgJSYE95NrdAYllly3GCV
 NtqNKOo0iOAOZAGl1kccGHUkeoahEHnlwlFki7SVINZzbOJLUiBGHeQycvKYr8RCXQXR
 ua0qQV3Yg73dUVMtm+f/hjXdCnKv62cGSyT9WCUyI2c3S0U9K6xX9+/KJxTozePW/Fdj
 RjO0IYdL0vtZbedhzNaTkEeJ6Zo8S7CZFrnoc5A2ciH1TQS41z9yG2FdR+Gvq9GRy/wz
 rQh+FKmGENoIhBIqebP2Lbm+IaPNld+cxb9Htqdx0k9LEMh7YmNwTOhxR8qOD25mAtna
 SwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1JXbVMJB6iZDvFn2TYFYjVdXtMc5N33ypKmnpsnfwcw=;
 b=q5T++iJDMlVFCpFMpFdMk+tkHRUiEWWyZpsVh8KYqYmPeJwbLrLvJm0k5bkf9uFn4o
 TJL4w85zWLdj1uHCngR9YMfirDfMz6yLDNpYSlEbbrxJ4KG6eqg77CQfM661hh6NY38m
 hvhX1wQCmHwwLiGwQEorugo1hDg2NK9sGw81aTK/hlRUZmoqbjnGjNx6YwSmbASj78Fw
 FyyzehqanG41fjJnMQ/xo0fuPf/FGaJa2hIgXYhY+VlbRxRhMetIB/XsEmgjnlfqVYwF
 BmctpGI2+wWPHPGbgQVltjvSTMhTAKOPslnYXVPhGUVxAtDe8xfsQ5iu7yk/MZbtg1ZE
 mLiA==
X-Gm-Message-State: AOAM530HNWBu16t7cEoah06FHwtIOOtRDWDbgwo6HMB0gLsNLoxzfPkz
 iudSo7fa1MwWRPWXbja/Dn4=
X-Google-Smtp-Source: ABdhPJwh3UXwcgYRQlHhUY52Pf+LJUUHKC6w8/ZHkmXQQZvyOevxaLyiaDuXzsNb/9BlpQcIXJ1gYA==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr6756565ljj.58.1604347100787;
 Mon, 02 Nov 2020 11:58:20 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id j14sm2641536lfm.192.2020.11.02.11.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 11:58:20 -0800 (PST)
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
 <2ebd184c-60e8-19e2-9965-19481ced1c70@gmail.com>
 <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
 <5f5a22b1-4d01-5698-1bca-6bcc66c55e6f@gmail.com>
 <CAGTfZH3s-1cROd3_X2weBs6i1irgJQJZP+8G+rj9p3KZMUu2vQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d8803971-1af7-0934-3f4c-8a9222623957@gmail.com>
Date: Mon, 2 Nov 2020 22:58:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH3s-1cROd3_X2weBs6i1irgJQJZP+8G+rj9p3KZMUu2vQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTEuMjAyMCAxODo1NywgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gT24gTW9uLCBOb3Yg
MiwgMjAyMCBhdCAxMjo0OSBBTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiAwMS4xMS4yMDIwIDE4OjQ0LCBDaGFud29vIENob2kg0L/QuNGI0LXRgjoKPj4+
PiBPUFAgY29yZSB3aWxsIHRyeSB0byBncmFiIHRoZSBjbG9jayByZWZlcmVuY2UgZm9yIHRoZSB0
YWJsZSBhbmQgaXQgbWF5Cj4+Pj4gY2F1c2UgRVBST0JFX0RFRkVSLiBBbHRob3VnaCwgaXQgc2hv
dWxkbid0IGhhcHBlbiBoZXJlIGJlY2F1c2Ugd2UgaGF2ZQo+Pj4+IGRldm1fY2xrX2dldCgpIGJl
Zm9yZSB0aGUgZ2V0X29wcF90YWJsZSgpLCBoZW5jZSBzZWVtcyB0aGUgZGVmZXJyZWQKPj4+PiBw
cm9iZSBpbmRlZWQgc2hvdWxkbid0IGhhcHBlbiBpbiB0aGlzIGNhc2UuCj4+PiBJdCBpcyBteSBt
aXNzaW5nIHBvaW50LiBJZiB0aGVyZSwgeW91J3JlIHJpZ2h0Lgo+Pj4gQ291bGQgeW91IHByb3Zp
ZGUgdGhlIGNvZGUgcG9pbnQgdG8gY2hlY2sgdGhlIGNsb2NrIHJlZmVyZW5jZSBvbiB0aGUgT1BQ
IGNvcmU/Cj4+Cj4+IFBsZWFzZSBzZWUgaXQgaGVyZToKPj4KPj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuMTAtcmMxL3NvdXJjZS9kcml2ZXJzL29wcC9jb3JlLmMjTDExMDEK
PiAKPiBUaGFua3MuIEl0IHNlZW1zIHRoYXQgaWYgZGV2aWNlIHRyZWUgbm9kZSBjb250YWlucyB0
aGUgYW55IG5vZGUsCj4gaXQgaXMgbm90IEVQUk9CRV9ERUZFUiBiZWNhdXNlIG9mIGp1c3QgdXNp
bmcgImNsa19nZXQoZGV2LCBOVUxMKSIuCj4gCj4gVGhlIHBhdGNoWzFdIHVzZWQgdGhlICdkZXZf
ZXJyX3Byb2JlJyBmb3IgZ2V0dGluZyB0aGUgImVtYyIgY2xvY2suCj4gRG8geW91IG5lZWQgdG8g
Y2hlY2sgaXQgbW9yZT8KPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvY2hhbndvby9saW51eC5naXQvY29tbWl0Lz9oPWRldmZyZXEtbmV4dCZp
ZD0wOWQ1NmQ5MmFkMjViNTgxMTNmNGVjNjc3ZTliMWFjMWUyYzMwNzJiCgpJdCBzaG91bGQgYmUg
c2FmZSB0byBhc3N1bWUgdGhhdCB0aGUgRVBST0JFX0RFRkVSIHdvbid0IGhhcHBlbiBmb3IKZGV2
X3BtX29wcF9nZXRfb3BwX3RhYmxlKCkuIEknbGwgaW1wcm92ZSBpdCBpbiB2NywgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
