Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAC210A88
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 13:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935C189AEA;
	Wed,  1 Jul 2020 11:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8789AEA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 11:50:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 76so6735456otu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NVob0ht+U8pNgfjDQrHBX34FcQW437wfU3ZeV7D0RuA=;
 b=bhcwQHJMxAGtFPyBQ5eY/2DzNvMQZ0gxJz25nmeWyZhHFQeXbzw7I1tU9yMrBSwbhq
 GpXzmc2d77jan86WU3lnLC/f37XAhq7I3nj/Ud5MxR2NsU+8qqrrenSJ8QT3PS3Yd2HO
 WZDJOl5abIE63DpXZWrwLlb1GWcV+wM/Xxc7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NVob0ht+U8pNgfjDQrHBX34FcQW437wfU3ZeV7D0RuA=;
 b=MhJK0/Dawf5pgrFsLo7JPG5q3jrXdJJ4HLO4BS/XsEfjBqqxoY7/KL0RGd5Og2GSDS
 uncrCeAYcuZc5bvFL5SDYsIwSiwwgz7PEDBTVNsXd4CZTl40XjsLsJNb6MBU31zfDTVJ
 ecxn61QL7Wud6pNKpQ7jay9dLwUHB+q4r8a9+GCZerCg67HPoPATRDQTqrXdos8aw9rS
 /xgIdsvyXjw2vtPo7EIcpU1sCAnaCrHRJg78VVVA2hxp3JkPWKlTSszBt3fzutHjLT0f
 /+YN5UHRe04rtQdzXouv+vR7ChWy16u6p50N2BrX34z2BIssztPMZc3hM9PdomyHiLtf
 nREg==
X-Gm-Message-State: AOAM533f+HlhdbnSW2CSRG4CqFvPsf4vnbLo8VcT2DWczgTpLRpC46Mj
 GhdswNHBdMI6Nwx1HwiMqmvKQxFYooQ/4t7yJ7x0rA==
X-Google-Smtp-Source: ABdhPJzuhUYDGzoVqw7VfT6QA2g0y9nFhCw6PsVYMQvjENJx18Q3x1ONVY7LMMFKkczWIhYx3VaIrBiizht+fmKEFm8=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr22087629oti.281.1593604252854; 
 Wed, 01 Jul 2020 04:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200701112559.22669-1-christian.koenig@amd.com>
In-Reply-To: <20200701112559.22669-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 1 Jul 2020 13:50:41 +0200
Message-ID: <CAKMK7uHqNaQPwATQf=Jfs6oQ=YEemHSHTEtC2=VqvNf+bMh_sQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as DMA-buf maintainer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMSwgMjAyMCBhdCAxOjI2IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFzIGRpc2N1c3NlZCBvbiB0aGUg
bGlzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5k
ZXggNDA0NzQ5ODJhMjFkLi41ZDcxMzBmOGQzNDIgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMK
PiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC01MDg5LDYgKzUwODksNyBAQCBGOiAgICAgICAgZnMv
ZGxtLwo+Cj4gIERNQSBCVUZGRVIgU0hBUklORyBGUkFNRVdPUksKPiAgTTogICAgIFN1bWl0IFNl
bXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gK006ICAgICBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gIEw6ICAgICBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKPiAgTDogICAgIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAgTDog
ICAgIGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vi
c2NyaWJlcnMpCj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
