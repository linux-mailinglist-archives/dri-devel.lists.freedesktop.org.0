Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B4E2B3AFB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4289E0C;
	Mon, 16 Nov 2020 01:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99A46E993
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:25:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 11so16147019ljf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1l1hwffIjqjNt9GhUbePPVmTyJTeUW4Yv+243TWcPf4=;
 b=lieK4LR33y1aZ1fap+D73ZumMoVL6M6468po+NR+gyGMCEQBUSJjgqTFMr6hER6WfB
 U/oEFvAuY+SrclwCLNpGUMrex3vA1wy59VOYYk7fZNpc57VlEVHtj6RKqpsAn80oM0Z2
 Mo+p0cSbnAnQGOau+OjoIyQFeCcrmmveBOMzHv5D/OCZhYZtF4Tc7TZgEQxqouMcvULn
 9V70vXKnmnjwHw412JpQiKAtzWYPr4LXwz6zZqCPP36mY4krJyjfujSJAeSH3zHMtpDB
 o+DUoAUq5Ry6GcotqKtVg31Q+MvRKmZQQ9QT2dV0mpmKH/sNPWbmqtXHpi8uf6Fg+n+S
 RYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1l1hwffIjqjNt9GhUbePPVmTyJTeUW4Yv+243TWcPf4=;
 b=BIMHO5QLfUbBa1d2sqUHEAjpxzK30CGb4+ZCQyTjlqbfQ0t0yZWFcvCbla2BNYXMCj
 BsnOuXsW9Bda88IW1pvdha8EOJYrwuBCFE0FgmLw4U6Bg+j/1jmy3zYpJ5ngmA540HoL
 a1JZLlCz86TmD4UTE9mnYjs15tP3fGXF2rEI2BV/ghf/SjhXr/+HvJvPexPpWuLQfqWO
 q7kkN9baMTYpel6BOUhvZ5iQyWo/GABLkO639Ogm759G0lYGv4EJFEohQOS4TjHySY42
 x7UDczTxdpWFYRKXD7kktGUZBHZ5l7x/zWELSAOsZGiHDxXwcxA/ihBYCJUAuZXlmYyJ
 L1nA==
X-Gm-Message-State: AOAM533qgIHrJONX43MOfOrkUYfYygP0V7MhtlcQEVKDVSU7qumV66kG
 Cvf8d27Vk5XGwOVDrxv+5/FFSLPhOl8=
X-Google-Smtp-Source: ABdhPJx1nXm+/KmGOYLgm50Vcu3V6KYIGD4YCXPL3AWVXb0ez8GMZN7O40WHA127zZg9J7ACD8dKCQ==
X-Received: by 2002:a2e:bc1a:: with SMTP id b26mr4226326ljf.359.1605432357253; 
 Sun, 15 Nov 2020 01:25:57 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id j25sm1170497lja.98.2020.11.15.01.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 01:25:56 -0800 (PST)
Subject: Re: [PATCH v8 08/26] memory: tegra30-emc: Continue probing if timings
 are missing in device-tree
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-9-digetx@gmail.com> <20201114154227.GB14208@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <90201243-b31e-29fc-a3e6-337f78afa9d2@gmail.com>
Date: Sun, 15 Nov 2020 12:25:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201114154227.GB14208@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMTEuMjAyMCAxODo0MiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFdl
ZCwgTm92IDExLCAyMDIwIGF0IDA0OjE0OjM4QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gRU1DIGRyaXZlciB3aWxsIGJlY29tZSBtYW5kYXRvcnkgYWZ0ZXIgdHVybmluZyBpdCBp
bnRvIGludGVyY29ubmVjdAo+PiBwcm92aWRlciBiZWNhdXNlIGludGVyY29ubmVjdCB1c2Vycywg
bGlrZSBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVyLCB3aWxsCj4+IGZhaWwgdG8gcHJvYmUgdXNp
bmcgbmV3ZXIgZGV2aWNlLXRyZWVzIHRoYXQgaGF2ZSBpbnRlcmNvbm5lY3QgcHJvcGVydGllcy4K
Pj4gVGh1cyBtYWtlIEVNQyBkcml2ZXIgdG8gcHJvYmUgZXZlbiBpZiB0aW1pbmdzIGFyZSBtaXNz
aW5nIGluIGRldmljZS10cmVlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28g
PGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEz
MC1lbWMuYyB8IDI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gVGhhbmtzLCBhcHBs
aWVkIDEtOC4gIEZvciB0aGUgcmVzdCBJIHNlZSBkaXNjdXNzaW9uIG9uIGdvaW5nLCBzbyBJIGd1
ZXNzCj4gdGhlcmUgd2lsbCBiZSBhIHY5LgoKVGhlIHY5IHdpbGwgYmUgcmVhZHkgc29vbiwgdGhh
bmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
