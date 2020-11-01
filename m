Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA732A1F58
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 16:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157B6EAC8;
	Sun,  1 Nov 2020 15:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F230C6EAC8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:58:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so6238592ljj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9w5lqe/JTQMl14qtp1wqbV1q8PlicycEi9x7TwQ3O4I=;
 b=SrzcyTOQk7M4NCVfGsoyDQqZ6rFb3eZJcZzNQdiSNUT7txNNGhlL0NpT0+LOVda3Ih
 MiBUFAFrziuKtC1hCr5a+CEaEWrzgJICLO3UevGr9h71XEutrEV0cHH5XzfUCoDohH8E
 a45GiU+47GmYSJC5/FJSPBiNPS+BW+zygQuK/B9e8hXqfmnzMvhGZiFF4GdJVXlS3tet
 OXIAqAP/N5ThaauVK3L4z2MuyLnqwYL3XMOTewX8A7/1Tid7b0erQsFJ9lqKusNF0R4a
 YPiOTsbHK0dGj8R7DKeLodHLpNxXs+/ktqgRnbQMasDwrSlX/7YSgiQGBPol/B0k4Ama
 wPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9w5lqe/JTQMl14qtp1wqbV1q8PlicycEi9x7TwQ3O4I=;
 b=DWwHjBcKXpxevMiTTHNqRY+awx+1zL0BAAJhd7H0DA51j7haSrfS53zws17xwrgRaa
 Q+7ot5wnrhM40YpyPqnurxidwbpo8WWbrjEswdNG0W/KpuT8tlWsygjLfwuYBs70LuHJ
 W1VgV6vfvryMjsON8vUpscq3PsYn8pwWC7hnsyXmqME+/po606iV+Nhb3CBSyjsLmw/f
 QIccjG/XboVVnCzc31UCQU1SNcXW3eDeY8HkjiBFALiCXQN/33wgvPhvuLlLqEQlcX48
 nK7uaqsDaspeyQQcbCTuf1E/RZBhsIxRL/1LSNgI0PvUDBvinQhSgrTTE3rEAtGe6Un/
 pPnA==
X-Gm-Message-State: AOAM530kUg66UsqoU3uO3wifHPfrcF4Uokdd7PQ4or4DMEYwvHWeFibE
 6EQSBBCFJwlZQsXKBD6Kl4oV/4eDF4xCRnX21F8=
X-Google-Smtp-Source: ABdhPJxWcrG0gmpm+NAN1BZS7Iw6tgZ8ick38nOYLMklui1fLFdUIqBpA2BV8e/ASXPN+5HRZr3OVEYaeMhtvt6PCqE=
X-Received: by 2002:a2e:681a:: with SMTP id c26mr5169187lja.56.1604246311413; 
 Sun, 01 Nov 2020 07:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
 <2ebd184c-60e8-19e2-9965-19481ced1c70@gmail.com>
 <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
 <5f5a22b1-4d01-5698-1bca-6bcc66c55e6f@gmail.com>
In-Reply-To: <5f5a22b1-4d01-5698-1bca-6bcc66c55e6f@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Mon, 2 Nov 2020 00:57:55 +0900
Message-ID: <CAGTfZH3s-1cROd3_X2weBs6i1irgJQJZP+8G+rj9p3KZMUu2vQ@mail.gmail.com>
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: Dmitry Osipenko <digetx@gmail.com>
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

T24gTW9uLCBOb3YgMiwgMjAyMCBhdCAxMjo0OSBBTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMDEuMTEuMjAyMCAxODo0NCwgQ2hhbndvbyBDaG9pINC/0LjR
iNC10YI6Cj4gPj4gT1BQIGNvcmUgd2lsbCB0cnkgdG8gZ3JhYiB0aGUgY2xvY2sgcmVmZXJlbmNl
IGZvciB0aGUgdGFibGUgYW5kIGl0IG1heQo+ID4+IGNhdXNlIEVQUk9CRV9ERUZFUi4gQWx0aG91
Z2gsIGl0IHNob3VsZG4ndCBoYXBwZW4gaGVyZSBiZWNhdXNlIHdlIGhhdmUKPiA+PiBkZXZtX2Ns
a19nZXQoKSBiZWZvcmUgdGhlIGdldF9vcHBfdGFibGUoKSwgaGVuY2Ugc2VlbXMgdGhlIGRlZmVy
cmVkCj4gPj4gcHJvYmUgaW5kZWVkIHNob3VsZG4ndCBoYXBwZW4gaW4gdGhpcyBjYXNlLgo+ID4g
SXQgaXMgbXkgbWlzc2luZyBwb2ludC4gSWYgdGhlcmUsIHlvdSdyZSByaWdodC4KPiA+IENvdWxk
IHlvdSBwcm92aWRlIHRoZSBjb2RlIHBvaW50IHRvIGNoZWNrIHRoZSBjbG9jayByZWZlcmVuY2Ug
b24gdGhlIE9QUCBjb3JlPwo+Cj4gUGxlYXNlIHNlZSBpdCBoZXJlOgo+Cj4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTAtcmMxL3NvdXJjZS9kcml2ZXJzL29wcC9jb3JlLmMj
TDExMDEKClRoYW5rcy4gSXQgc2VlbXMgdGhhdCBpZiBkZXZpY2UgdHJlZSBub2RlIGNvbnRhaW5z
IHRoZSBhbnkgbm9kZSwKaXQgaXMgbm90IEVQUk9CRV9ERUZFUiBiZWNhdXNlIG9mIGp1c3QgdXNp
bmcgImNsa19nZXQoZGV2LCBOVUxMKSIuCgpUaGUgcGF0Y2hbMV0gdXNlZCB0aGUgJ2Rldl9lcnJf
cHJvYmUnIGZvciBnZXR0aW5nIHRoZSAiZW1jIiBjbG9jay4KRG8geW91IG5lZWQgdG8gY2hlY2sg
aXQgbW9yZT8KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaGFud29vL2xpbnV4LmdpdC9jb21taXQvP2g9ZGV2ZnJlcS1uZXh0JmlkPTA5ZDU2ZDky
YWQyNWI1ODExM2Y0ZWM2NzdlOWIxYWMxZTJjMzA3MmIKCgotLSAKQmVzdCBSZWdhcmRzLApDaGFu
d29vIENob2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
