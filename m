Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B9209A7C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CC26E2D6;
	Thu, 25 Jun 2020 07:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66216E882
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 20:55:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m26so1998751lfo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uljzMwIMUdV28HeqfJEN+MMwQIO6SPsln7k0ye+kk70=;
 b=ELvHL0QiC5+98ZO5ErWB1f/+OHtBcdQkeit5tV37WfkqwXE+TZZMZQwj7rj+VSUoif
 RNJaiGITgpf0DYbqKzwEwDj634NRbTOaQkGOlLBLlUj/zBAhmEW1kZOazWDJTmQSTb6X
 eTsivmS2y1EMGJ9slMmGcCpAjlqpBVg7v6w0T/KtFTUgon0eB2BcyKRDbeBKBchIa4g1
 JA4E8vVhPpOe90OnRN1Pm8ApLoHSRYd531YWRgCE3B9LgBSJVAfLGYwBSdg9JaUUBbrh
 EN2YK/sf4Px+8zNkFiO995SQvbQFOQCvyHQ2sr2IMPbNulkmAZ0gqQEAL6qFLDWFuJC6
 1zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uljzMwIMUdV28HeqfJEN+MMwQIO6SPsln7k0ye+kk70=;
 b=PZ1njn0ZmHQxfyvT6dQ7MqzQlUAoz9/lck8g/NruYR8XtL0eUBmRaw7KLZJxdl4IiW
 Xas8v2+F8TrSxjXK3bMKxjR5hT7iMaIVLxpLRB3W0u38hN56s9lP5N/D3AaxO6Iokki6
 QOgwRzRWJBfp40DbRdYDQF81FFuMIaibczKGh7UA9MlmcN2wT40PDegX32BfmgErR7uS
 Gn0Em7Xtkg1mNSy4BjPrqAfGF0R+00Vw93FwFuvkfJlzY9q9Lo1HCB89emeQ+Msu/mP9
 ZMzKl4nE820yO/ooNHRfDu8wdzYVhy2mm/MJ+e1yHE3RQToS8Wqzny0DrphPzNOwzaZ4
 Yspg==
X-Gm-Message-State: AOAM533ioW2F754K8yAVirZgkLsnRwgrqFNoN3NohGRWHhCkniYD7P8T
 Na3LHMF5ogjBLuDqC/JTatA=
X-Google-Smtp-Source: ABdhPJzVWOdfyF0uWQM9JarZS964cWaAihuCUlSNH9CqRhSfPvlGgScpS3MEYjHjidLShJmjibfLcw==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr16783760lfn.182.1593032127070; 
 Wed, 24 Jun 2020 13:55:27 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id g7sm3477478lfe.62.2020.06.24.13.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 13:55:26 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
Date: Wed, 24 Jun 2020 23:55:25 +0300
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

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+ICogUHJl
dmlvdXNseSBwcmVzZW50IEdFTSBJT0NUTHMgKEdFTV9DUkVBVEUsIEdFTV9NTUFQKSBhcmUgbm90
IHByZXNlbnQuCj4gTm90IHN1cmUgaWYgdGhleSBhcmUgc3RpbGwgbmVlZGVkLgoKSGVsbG8gTWlr
a28hCgpBIHF1aWNrIGNvbW1lbnQgZm9yIHRoZSBzdGFydGVyLiBTd2l0Y2hpbmcgYXdheSBmcm9t
IHRoZSBUZWdyYS1zcGVjaWZpYwpHRU0gSU9DVExzIHRvIHRoZSBkbWEtYnVmIGhlYXBzIGlzIGEg
c3VjaCByYWRpY2FsIGNoYW5nZSEgQnV0IEkgbGlrZSBpdCEKClByZXZpb3VzbHkgSSB3YXMgY3Vy
aW91cyBhYm91dCB3aGV0aGVyIHdlIGNvdWxkIGhhdmUgbXVsdGlwbGUgQ01BCnJlZ2lvbnMgKG9u
ZSBzaGFyZWQvcmV1c2FibGUgYW5kIG90aGVyIHByaXZhdGUsIGZvciBleGFtcGxlKSBmb3IgdGhl
ClRlZ3JhIERSTSBkcml2ZXIgYW5kIGF0IGEgcXVpY2sgZ2xhbmNlIHRoZSBkbWEtYnVmIGhlYXBz
IGNvdWxkIGJlIGEgbmljZQpzb2x1dGlvbiB0aGF0IGF2b2lkcyByZS1pbnZlbnRpbmcgYSBkcml2
ZXItc3BlY2lmaWMgdGhpbmdzIGZvciB0aGF0LgoKSSdtIGluc3RhbnRseSBmb3Jlc2VlaW5nIHRo
ZXNlIHR5cGVzIG9mIGhlYXBzOgoKMS4gTGFyZ2UgcmV1c2FibGUgQ01BIGhlYXAuCjIuIFNtYWxs
ZXIgbm9uLXJldXNhYmxlIGNvbW1vbiBDTUEgdGhhdCBjb3VsZCBiZSB1c2VkIHdoZW4gYWxsb2Nh
dGlvbgpmcm9tIGEgcmV1c2FibGUgQ01BIGZhaWxzLiBPciB2aWNlIHZlcnNhLCB3aGVuIHdlIHdh
bnQgdG8gcmVkdWNlIHRoZQpjaGFuY2UgdG8gYmxvY2sgZm9yIGEgbG9uZyB0aW1lIG9uIGFsbG9j
YXRpb24sIGZvciBleGFtcGxlLgozLiBTcGFyc2UgKHN5c3RlbSkgbWVtb3J5IGhlYXAuCgpJdCdz
IHRoZSBmaXJzdCB0aW1lIEknbSBsb29raW5nIGF0IHRoZSBkbWEtYnVmIGhlYXBzIGFuZCBpdCBz
b3VuZHMgbGlrZQphIHZlcnkgbmljZSBpZGVhIHRvIHV0aWxpemUgdGhlbSEKClRoZSBodHRwczov
L2xrbWwub3JnL2xrbWwvMjAxOS8xMS8xOC83ODcgc2F5cyB0aGF0IHRoZSBzeXN0ZW0tY29udGln
dW91cwphbmQgY2FydmVvdXQgaGVhcHMgd2Ugbm90IGFkZGVkIGJlY2F1c2UgdGhleSB3ZXJlIG5v
dCBuZWVkZWQsIGJ1dCB0aGV5CndpbGwgYmUgbmVlZGVkIGZvciB0aGUgVGVncmEyMCBkcml2ZXJz
IGFuZCBmb3IgdGhlIGNhc2Ugd2hlcmUgSU9NTVUgaXMKZGlzYWJsZWQuIEl0IHNob3VsZG4ndCBi
ZSBkaWZmaWN1bHQgdG8gYWRkIHRoZXNlIHR5cGVzIG9mIGhlYXBzLgoKSSdsbCBjb250aW51ZSB0
byBleGFtaW5lIHRoZSBkbWEtYnVmIGhlYXBzIGluIGEgbW9yZSBkZXRhaWxzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
