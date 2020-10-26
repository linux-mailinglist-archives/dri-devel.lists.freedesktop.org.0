Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D772729A640
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1266EB23;
	Tue, 27 Oct 2020 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3AF89E9B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 19:14:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x16so11520580ljh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 12:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dq2PzuCzxyYXjp7izV7Nz4V/toYcZjqA2m1mpqmQcWc=;
 b=a4A23VompEg7ZU78ZOB4AepZ1yz/UI086hDid7oIuoPSEr3Rt0l3y4puzGzQzMnB7E
 ulmHkfUh0H5mSv+9leZPOZ0nCacUo7tB6u3bFl0Vqr1CjPOVLLkYjGN0miH+IvFUdvI3
 QuTJG/Ut1u1hi4MxUWew1UOC9uB3rZni6HYQA/+d34UJNcEYVBQd2umMR2OcvF+v/L20
 6mYjK3YorWbMAXCk0Z/1+BfGaUW8D1h6sxfupIFpwxeHaYZv6fZhmAIoqomkNeM/9fdD
 9Qd8F9HXHVGAHJp1rV4zcj4BCeVTU5c+rcujkUM1tE0dsIdSkv2ElWLBn0QWyLbRQDyB
 FbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dq2PzuCzxyYXjp7izV7Nz4V/toYcZjqA2m1mpqmQcWc=;
 b=hAAp8kNDUIIA1+wvyssYwOhDTk/OyJk6sV4MMlM0jYC6x9xPXScF5tVnp3v0VPiF+7
 9d8oot1i4MB2Ak0HkkNeiRlXCHvu5cTk6kkLxf8llZW6Cz8tQMuBp3u5haU+O7sB0y5s
 Tz6ZSr0TY+xF2T9oUuP9l26lJotvJK2SEFVqB/dBeqtjncjkYgOXT9pzN7jecs7sSbMm
 U7R1UmhafiGk/We2KR8NufczqSWWFoQJvmVKaxsgw5zKEiqC2W+nYb96AHOMLkhefHCl
 KNKCuVDBgxVhC/G39g8DGrBWz3QnpoqH/s8L8Q2Uti7iDHgQcthkyF4kPdPnp3Dgut+U
 YPDg==
X-Gm-Message-State: AOAM533e5VkHbtLkTBgsvOAvNijFTUcnk73MBvAWMN0ltFkhHkZsXLC/
 MIPVQCzFVzaq6dd6d4b3S8A=
X-Google-Smtp-Source: ABdhPJyD0NDjbABoCatjn1w/Ey9Ef6HeuvvsweZ+aBXUAru5GebuoxfPUOebSAQ0Ivmfhv7NpHeadw==
X-Received: by 2002:a2e:9eca:: with SMTP id h10mr6129956ljk.352.1603739652647; 
 Mon, 26 Oct 2020 12:14:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id r19sm1280779ljn.73.2020.10.26.12.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 12:14:11 -0700 (PDT)
Subject: Re: [PATCH v6 00/52] Introduce memory interconnect for NVIDIA Tegra
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201026150845.GA87050@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48a5cfdd-c170-f6d3-001a-2d343ecb2c5e@gmail.com>
Date: Mon, 26 Oct 2020 22:14:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026150845.GA87050@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:12:06 +0000
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMTAuMjAyMCAxODowOCwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQzQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gSGVsbG8sCj4+Cj4+IFRoaXMgc2VyaWVzIGJyaW5ncyBpbml0aWFsIHN1cHBvcnQgZm9y
IG1lbW9yeSBpbnRlcmNvbm5lY3QgdG8gVGVncmEyMCwKPj4gVGVncmEzMCBhbmQgVGVncmExMjQg
U29Dcy4KPj4KPj4gRm9yIHRoZSBzdGFydGVyIG9ubHkgZGlzcGxheSBjb250cm9sbGVycyBhbmQg
ZGV2ZnJlcSBkZXZpY2VzIGFyZSBnZXR0aW5nCj4+IGludGVyY29ubmVjdCBBUEkgc3VwcG9ydCwg
b3RoZXJzIGNvdWxkIGJlIHN1cHBvcnRlZCBsYXRlciBvbi4gVGhlIGRpc3BsYXkKPj4gY29udHJv
bGxlcnMgaGF2ZSB0aGUgYmlnZ2VzdCBkZW1hbmQgZm9yIGludGVyY29ubmVjdCBBUEkgcmlnaHQg
bm93IGJlY2F1c2UKPj4gZHluYW1pYyBtZW1vcnkgZnJlcXVlbmN5IHNjYWxpbmcgY2FuJ3QgYmUg
ZG9uZSBzYWZlbHkgd2l0aG91dCB0YWtpbmcgaW50bwo+PiBhY2NvdW50IGJhbmR3aWR0aCByZXF1
aXJlbWVudCBmcm9tIHRoZSBkaXNwbGF5cy4gSW4gcGFydGljdWxhciB0aGlzIHNlcmllcwo+PiBm
aXhlcyBkaXN0b3J0ZWQgZGlzcGxheSBvdXRwdXQgb24gVDMwIE91eWEgYW5kIFQxMjQgVEsxIGRl
dmljZXMuCj4gCj4gSGksCj4gCj4gWW91IGludHJvZHVjZWQgaW4gdjYgbXVsdGlwbGUgbmV3IHBh
dGNoZXMuIENvdWxkIHlvdSBkZXNjcmliZSB0aGUKPiBkZXBlbmRlbmNpZXMsIGlmIGFueT8KCkhl
bGxvLAoKVGhlIHY2IGRyb3BwZWQgc29tZSBvbGRlciBwYXRjaGVzIGFuZCByZXBsYWNlZCB0aGVt
IHdpdGggdGhlIG5ldwpwYXRjaGVzLiBQcmV2aW91c2x5IEkgd2FudGVkIHRvIHBvc3Rwb25lIHRo
ZSBtb3JlIGNvbXBsZXggY2hhbmdlcyBmb3IKbGF0ZXIgdGltZXMsIGxpa2Ugc3VwcG9ydGluZyBP
UFAgdGFibGVzIGFuZCBEVkZTLCBidXQgdGhlbiB0aGUgcmV2aWV3CnN0YXJ0ZWQgdG8gdGFrZSBt
b3JlIHRpbWUgdGhhbiB3YXMgZXhwZWN0ZWQgYW5kIHRoZXJlIHdhcyBlbm91Z2ggdGltZSB0bwpj
b21wbGV0ZSB0aG9zZSBmZWF0dXJlcy4KClRoZXJlIGFyZSBmaXZlIGJhc2ljIHNldHMgb2YgcGF0
Y2hlczoKCgkxLiBEVCBiaW5kaW5ncwoJMi4gRFQgY2hhbmdlcwoJMy4gU29DLCBjbGsgYW5kIG1l
bW9yeQoJNC4gZGV2ZnJlcQoJNS4gRFJNCgpFYWNoIHNldCBjb3VsZCBiZSBhcHBsaWVkIHNlcGFy
YXRlbHkuCgpNZW1vcnkgcGF0Y2hlcyBoYXZlIGEgYnVpbGQgZGVwZW5kZW5jeSBvbiB0aGUgU29D
IGFuZCBjbGsgcGF0Y2hlcy4KClRoZSAidGVncmEtbWM6IEFkZCBpbnRlcmNvbm5lY3QgZnJhbWV3
b3JrIiBhbmQgIkFkZCBhbmQgdXNlCmRldm1fdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKCki
IGFyZSB0aGUgcm9vdCBidWlsZCBkZXBlbmRlbmNpZXMgZm9yCmFsbCBtZW1vcnkvIHBhdGNoZXMu
IE90aGVyIHBhdGNoZXMgYXJlIGdyb3VwZWQgcGVyIFNvQyBnZW5lcmF0aW9uCihUZWdyYTIwLzMw
LzEyNCksIHBhdGNoZXMgd2l0aGluIGEgU29DLWdlbiBncm91cCBhcmUgaW50ZXJkZXBlbmRlbnQu
CgpJIHN1cHBvc2UgdGhlIGJlc3QgdmFyaWFudCB3b3VsZCBiZSB0byBtZXJnZSB0aGUgd2hvbGUg
c2VyaWVzIHZpYQp0ZWdyYS10cmVlIGluIG9yZGVyIHRvIHByZXNlcnZlIGxvZ2ljYWwgb3JkZXIg
b2YgdGhlIHBhdGNoZXMuIEFsdGhvdWdoLAptZXJnaW5nIGVhY2ggc2V0IG9mIHBhdGNoZXMgc2Vw
YXJhdGVseSBhbHNvIHNob3VsZCBiZSBva2F5IHRvIGRvLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
