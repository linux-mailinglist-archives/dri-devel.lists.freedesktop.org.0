Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8662B0108
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C546E1B2;
	Thu, 12 Nov 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6931089E52
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:54:06 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b3so546304pls.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=BR1T4epV+HHBrX5I3Lx7g9aCKzjxl36+gayU6Vo90zk=;
 b=SeyOkpJ8VAnb9K1v6QHwyuE+XDQ7Xb5qgsNsN17V6pSCy+q1aUZltHVrwUB6hoVNUJ
 kyi1hz3GZB0PUzYnYm5NHuDH4DtZLQ6r7LinuCTWmBnv++Pcns6Z44NLADK8nCUPq+2Z
 lUAZJJD/ofBTydNaZsP70StUTV3P14W4YTnOf2MmHlIO00RSoHGw/LnoMgUFva/t02jt
 Cq7ItmcBBwiJsCiFGCnQ6OwdXO7K2pdOTRCxVVRlJlC9Ivp6OLV2wqZm0q7JGzPRVz7B
 ewCJe+iAbFC6PK7GZk/6Vnj4udyUn6bTmvaD+GiJHFydjtBRGzYuyAAJkgFvEKUueX/h
 fT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BR1T4epV+HHBrX5I3Lx7g9aCKzjxl36+gayU6Vo90zk=;
 b=maYNgiPQjx/BS5ZIfEm3Qh6iUglezjdWGINhd3nZONKeDfM8M/ZqloDTLonJdDKTXs
 wML1kWILyTW+U36gsxXs1w1GOLT2mtSE+uDMBlhZ+j495rQYpk3vyUy921zeXhygOFYr
 fNNxlSc/6u+f/JHGJBVCGJSDriFHxf0xHVs+I5zHm7elhNgUvR2BMXcZWBk02GcT1fbe
 b7Mj4SpbQHUd6tbQtuNA2sUgAvmg3RrJLv/oWJJX0xnM6LuevqUO5UL0CNj9n7llJDPJ
 pAO2hLH3dxd3Yf3e1AIt/92l17Js6YrSzK7fNXq0tOtXZGGrDRM7Vk4V3zp56gwGvk2A
 NCLg==
X-Gm-Message-State: AOAM531jJuXBvX+sWcJLPXXfXm/LoCESzWzdaDZnivv08U7u56ZJv2cS
 m4yYuDBA/aCQi2DB9QYiPfsTlA==
X-Google-Smtp-Source: ABdhPJxOHg/sWON4ePkTuSAP4y8SzDQlWRi72cjAP6aV88j0N4jbC+I/d/e9bu0uQlLakGN5MNj7pg==
X-Received: by 2002:a17:902:82c3:b029:d6:c377:c87d with SMTP id
 u3-20020a17090282c3b02900d6c377c87dmr19915711plz.37.1605081245903; 
 Tue, 10 Nov 2020 23:54:05 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id v18sm1450609pfn.35.2020.11.10.23.54.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 23:54:04 -0800 (PST)
Date: Wed, 11 Nov 2020 13:24:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 09/26] memory: tegra30: Support interconnect framework
Message-ID: <20201111075402.y52c2zwcw74eeyko@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-10-digetx@gmail.com>
 <20201111055313.tefidnmc7f4yb3jk@vireshk-i7>
 <185e9140-fdce-29ef-68c3-aa7da02b249d@gmail.com>
 <20201111061855.2azilyhfoxwzpoir@vireshk-i7>
 <7f5c15c6-44d2-c997-442c-8f6670794f0e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f5c15c6-44d2-c997-442c-8f6670794f0e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEtMTEtMjAsIDEwOjMyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTEuMTEuMjAyMCAw
OToxOCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAxMS0xMS0yMCwgMDk6MTQsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiBUaGUgZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSB3
aWxsIHByb2R1Y2UgYSBlcnJvciBtZXNzYWdlIHdoaWNoIGRvZXNuJ3QKPiA+PiBnaXZlIGEgY2x1
ZSBhYm91dCB3aGF0J3Mgd3JvbmcsIGkuZS4gdGhhdCBkZXZpY2UtdHJlZSBuZWVkcyB0byBiZSB1
cGRhdGVkLgo+ID4gCj4gPiBJZiB5b3UgdGhpbmsgdGhhdCB5b3UgbmVlZCB0byBwcmludCBzb21l
dGhpbmcgbW9yZSwgdGhlbiB5b3UgY2FuIGRvCj4gPiB0aGF0IGluIHRoZSBlcnJvciBtZXNzYWdl
IHlvdSBwcmludCB3aGVuIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkKPiA+IGZhaWxzLiBJIHdv
dWxkIHN1Z2dlc3QgdG8gZHJvcCB0aGlzIHJlZHVuZGFudCBjaGVjayBoZXJlLgo+ID4gCj4gCj4g
UGxlYXNlIGdpdmUgdGhlIHJhdGlvbmFsZS4KClRoZSByYXRpb25hbGUgaXMgdGhhdCB0aGUgY2hl
Y2sgaXMgYWxyZWFkeSBwZXJmb3JtZWQgYnkKZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSBhbmQg
aXQgaXNuJ3QgZ29pbmcgdG8gYWRkICphbnkqIGJlbmVmaXQgdG8KY2hlY2sgaXQgYWdhaW4gaGVy
ZS4gU3VjaCBhIGNoZWNrIGZvciBtYXRjaGluZyBjb21wYXRpYmxlIHBsYXRmb3JtcyBpcwpub3Jt
YWxseSBmaW5lLCBidXQgbm90IGZvciB0aGlzLiBUaGlzIGlzIGxpa2Ugb3BlbiBjb2RpbmcgcGFy
dCBvZgpkZXZfcG1fb3BwX29mX2FkZF90YWJsZSgpLCBhbmQgc28gaXMgcmVkdW5kYW50LiBUaGUK
ZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKSBoZWxwZXIgYWxzbyBjaGVja3MgZm9yIE9QUHYxIGJp
bmRpbmdzIGluIHRoZQpEVCAoeWVzIHlvdSB3b24ndCBiZSB1c2luZyB0aGVtIG9uIHlvdXIgcGxh
dGZvcm0pIGFuZCBzbyByZWx5aW5nIG9uCnRoYXQgQVBJIGlzIGEgYmV0dGVyIHRoaW5nIHRvIGRv
LgoKQXMgeW91IGFscmVhZHkgc2FpZCwgeW91IGp1c3Qgd2FudGVkIGEgYmV0dGVyIHByaW50IG1l
c3NhZ2UgYW5kIHNvIHlvdQpoYXZlIGFkZGVkIHRoaXMgY2hlY2suIElmIHlvdSByZWFsbHkgY2Fy
ZSBvbmx5IGFib3V0IHRoZSBwcmludAptZXNzYWdlLCB0aGVuIHlvdSBjYW4gYWRkIGEgcHJpbnQg
b2YgeW91ciBjaG9pY2UgaW4gdGhlIGRyaXZlciBidXQKb3RoZXJ3aXNlIHRoaXMgY2hlY2sgaXMg
bm90IGdvaW5nIHRvIGJlbmVmaXQgeW91IG11Y2ggSSBhbSBhZnJhaWQuCgpIYXZpbmcgc2FpZCB0
aGF0LCB0aGlzIGlzbid0IHRoZSBjb2RlIEkgbWFpbnRhaW4uIEkgbmVlZCB0byBndWFyYW50ZWUK
dGhhdCB0aGUgT1BQIGNvcmUgQVBJcyBhcmUgdXNlZCBwcm9wZXJseSBhbmQgYXJlIG5vdCBtaXN1
c2VkIGFuZCBzbyBJCmhhdmUgYSBoaWdoZXIgc2F5IHRoZXJlLiBCdXQgaW4gdGhpcyBjYXNlIGFs
bCBJIGNhbiBkbyBpcyBfc3VnZ2VzdF8KYW5kIG5vdCBlbmZvcmNlLiBBbmQgYXMgSSBzYWlkIGVh
cmxpZXIsIEkgc3VnZ2VzdCB0byBkcm9wIHRoaXMKcmVkdW5kYW50IGNoZWNrIGluIG9yZGVyIHRv
IG1ha2UgeW91ciBjb2RlIGJldHRlciBhbmQgZmFzdGVyLgoKVGhhbmtzLgoKLS0gCnZpcmVzaApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
