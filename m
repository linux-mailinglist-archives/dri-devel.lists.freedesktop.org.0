Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39132767B1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45E76ED66;
	Fri, 26 Jul 2019 13:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3126ED66;
 Fri, 26 Jul 2019 13:39:18 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6DA722CB9;
 Fri, 26 Jul 2019 13:39:18 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id d15so39005162qkl.4;
 Fri, 26 Jul 2019 06:39:18 -0700 (PDT)
X-Gm-Message-State: APjAAAWMaHdvqhDTBSYrKXX1UWUhUMyrI3mO8m4K/V0iyKxq5Drtak2O
 UDMaCr+Q40XW6fjRCpXtEYcKuHtuJ7TrQ6ykOA==
X-Google-Smtp-Source: APXvYqzhBza9pj3SowLzantGidYXQb0v3bHq3zBvGpW/aOSHvVcNfjjZmWPHJV99VCWEmtQzrTcG1eAC8aP1SNXctxY=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr64196243qke.223.1564148357873; 
 Fri, 26 Jul 2019 06:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190725035239.1192-1-zbestahu@gmail.com>
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Jul 2019 07:39:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5L_BGQskXDv+2Z-38Zd+BO9AfrsPcqbFcjTwE1qMOaA@mail.gmail.com>
Message-ID: <CAL_Jsq+5L_BGQskXDv+2Z-38Zd+BO9AfrsPcqbFcjTwE1qMOaA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
To: Yue Hu <zbestahu@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564148358;
 bh=oJrBFnXRYQDkNefhYi2mCPxF4BmcIHCJKvNESPKoXNY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EXdbLSoMI0MUSooaTZSEhpDJ3w4iuVWgQHpB/QelC+JzLU4b+MS44O4MUcumzPrPT
 mNS6im1H6i27FL14XUi9oLOPQVNZNlTMQ8KyjHVp3vzAZhqkBw6Pe6tEegFfYDXqas
 WmT11N3TR3etU6ZD7q4/rKnd2rxZFoqmFQkQ9Emw=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, huyue2@yulong.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 zhangwen@yulong.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgOTo1MyBQTSBZdWUgSHUgPHpiZXN0YWh1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBZdWUgSHUgPGh1eXVlMkB5dWxvbmcuY29tPgo+Cj4gU2luY2Ug
Z292ZXJub3IgbmFtZSBpcyBkZWZpbmVkIGJ5IERFVkZSRVEgZnJhbWV3b3JrIGludGVybmFsbHks
IHVzZSB0aGUKPiBtYWNybyBkZWZpbml0aW9uIGluc3RlYWQgb2YgdXNpbmcgdGhlIG5hbWUgZGly
ZWN0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWUgSHUgPGh1eXVlMkB5dWxvbmcuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYyAgICAgICAgICAgICAgIHwgMyArKy0K
PiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDMgKystCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKSSd2ZSBh
cHBsaWVkIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
