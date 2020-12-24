Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0262E2AEF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC8289BAF;
	Fri, 25 Dec 2020 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AB089D84
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 06:43:42 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b8so885926plx.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EggZlPNaFVNouUQNpMn4xGppTh9DzckHE4NrKj3sjKU=;
 b=Oh3/knrLmICSN2Z3rwKTSyV0rZAdC95C5D83OrFtERU6Bx2ojcAX/s8nBJJNKbvkSv
 BfQYGy1zC8m1ZuYadonmShwKsEssyRaQOZBAyphCdJD8hE380Ft5/TXEmY6MO3GlJasq
 RrkhWNQEmgh/GsGttqWcNfZ71NVDkNEYwWsjuqkP8VdwJTCX2vdDpxVwsnQ5HNEweh0M
 An3fXfg9/d0G0+FuPk0ByAahetYKeSmx82mAoRUPnE+BrNipzngY1IzLAgLZrzjOCrN5
 irhxwHDc5mBc6s5RnM5iXO8Nlvm9QXzBmJqpuOPmEAQFWdjKY9j2t4sfjZzWKZOQDh3R
 twCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EggZlPNaFVNouUQNpMn4xGppTh9DzckHE4NrKj3sjKU=;
 b=DA+QpYU3FcztikbdqvnXTvTFU4K2YA3gfpyWDM35LQooN8O4yQdLT5rzeaYABqU2CT
 2qAOzgrA0lfxyvlGfq6rVuGMMai1z8UX5eChi7EQDXJVurpqEmIAaDMbtsAeA/Fh38OR
 5OTemYL7Dy2RXU9bmyf6z5hT53pgicmtIpH7HCz3K8/MRM/mhgBT8eOVe/Xfx9ehitoJ
 Re3Klefp3tqZglNZdAkDhaWs8NETVKXTCOs98EGnd2rKwSt+XZ74FHGEjtIPKyb0HY//
 QrLuu+j/ScCSkMIVOITL8sE6HU9lRXbSK2c0pItrbZzbWwuPRZUViD8nKYj3Dwj+wIqZ
 2wTw==
X-Gm-Message-State: AOAM533p8+9svBQRk5GSCpX6rC+8wWwfZjal3z9t23wd1zRopnRPnbHT
 tjEYHy9RAkXUQCzpYwPTyfoesg==
X-Google-Smtp-Source: ABdhPJzvXFDg0AOs/T4jYpQbUFp8mqlvGxAfA/7keO1x94rQjdeak+7MJF5KZ9Mxu1T0gEblsk2C9g==
X-Received: by 2002:a17:90b:60b:: with SMTP id
 gb11mr3193035pjb.122.1608792222393; 
 Wed, 23 Dec 2020 22:43:42 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id c14sm24658375pfd.37.2020.12.23.22.43.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 22:43:41 -0800 (PST)
Date: Thu, 24 Dec 2020 12:13:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201224064339.zngidobhstnlu2a3@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMtMTItMjAsIDIzOjM3LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMTIuMjAyMCAw
NzoxOSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAyMi0xMi0yMCwgMjI6MTUsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiAyMi4xMi4yMDIwIDA5OjQyLCBWaXJlc2ggS3VtYXIg
0L/QuNGI0LXRgjoKPiA+Pj4gT24gMTctMTItMjAsIDIxOjA2LCBEbWl0cnkgT3NpcGVua28gd3Jv
dGU6Cj4gPj4+PiBBZGQgYSBjZWlsIHZlcnNpb24gb2YgdGhlIGRldl9wbV9vcHBfZmluZF9sZXZl
bCgpLiBJdCdzIGhhbmR5IHRvIGhhdmUgaWYKPiA+Pj4+IGxldmVscyBkb24ndCBzdGFydCBmcm9t
IDAgaW4gT1BQIHRhYmxlIGFuZCB6ZXJvIHVzdWFsbHkgbWVhbnMgYSBtaW5pbWFsCj4gPj4+PiBs
ZXZlbC4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cj4gPj4+Cj4gPj4+IFdoeSBkb2Vzbid0IHRoZSBleGFjdCB2ZXJzaW9uIHdv
cmsgZm9yIHlvdSBoZXJlID8KPiA+Pj4KPiA+Pgo+ID4+IFRoZSBleGFjdCB2ZXJzaW9uIHdvbid0
IGZpbmQgT1BQIGZvciBsZXZlbD0wIGlmIGxldmVscyBkb24ndCBzdGFydCB3aXRoCj4gPj4gMCwg
d2hlcmUgMCBtZWFucyB0aGF0IG1pbmltYWwgbGV2ZWwgaXMgZGVzaXJlZC4KPiA+IAo+ID4gUmln
aHQsIGJ1dCB3aHkgZG8geW91IG5lZWQgdG8gc2VuZCAwIGZvciB5b3VyIHBsYXRmb3JtID8KPiA+
IAo+IAo+IFRvIHB1dCBwb3dlciBkb21haW4gaW50byB0aGUgbG93ZXN0IHBlcmZvcm1hbmNlIHN0
YXRlIHdoZW4gZGV2aWNlIGlzIGlkbGluZy4KCkkgc2VlLiBTbyB5b3UgcmVhbGx5IHdhbnQgdG8g
c2V0IGl0IHRvIHRoZSBsb3dlc3Qgc3RhdGUgb3IganVzdCB0YWtlIHRoZSB2b3RlCm91dCA/IFdo
aWNoIG1heSBlbmQgdXAgcG93ZXJpbmcgb2ZmIHRoZSBkb21haW4gaW4gdGhlIHdvcnN0IGNhc2Ug
PwoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
