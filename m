Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247B929D0AE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD32C6E0C6;
	Wed, 28 Oct 2020 15:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0426E110
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:26:35 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id c25so1252554ooe.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QX0ENcNCRgqoRwA+YusJr6c818KTH5LROqERQdCNVs8=;
 b=P5ikFM/oFaIEZf3YlHfsl7TTu1jbxzZtkVSwGJ5Y321rKC409PO/rJXirk6mLDfkvC
 D+RbGyRwmSDaxezghOOx3UtfzWTaHyXvE5SiRsQMTNgfTrCTAptHp3JNp4bd+ix622Dc
 uqZpTeJbqEgWwvC3jQUA7EhvAkLd8Iaco7Gnby3+h8NrfHWUJC1XCdrwU2BkzW3t/lfy
 ByeNsI/uYflftUGzZhScLFGktToDuoDuw1gjRAAQ8La4r+T6kgLLM6bAsszsMS+CN3+p
 rUN4x9t4MQ/i9UEI3s7sEtuBPs96FQAtBWjPPozIKWhu619D9v9FhGlmzBfCB6t549xR
 Dpsg==
X-Gm-Message-State: AOAM5321TV3T45ixRkXCIoC+Mngz7+hrbHIISHSjoO75E09oRyWxf4ke
 Asv+4clvLnOJiZc7sJW1Ag==
X-Google-Smtp-Source: ABdhPJyYAHXqPlvZ5xX1GDoTkHk3tTpQd2ChQUyWIgVIOlXap+r02KTeFGDxbyhKGUnxb6HGIN5QrQ==
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr6136474ooq.64.1603898794592; 
 Wed, 28 Oct 2020 08:26:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f13sm2572772oij.0.2020.10.28.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:26:33 -0700 (PDT)
Received: (nullmailer pid 4054817 invoked by uid 1000);
 Wed, 28 Oct 2020 15:26:32 -0000
Date: Wed, 28 Oct 2020 10:26:32 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
Message-ID: <20201028152632.GA4051913@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com>
 <20201027090212.GG4244@kozik-lap>
 <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
 <20201027194457.GD140636@kozik-lap>
 <ae06bd70-93f5-abe8-64d9-e5e991cd8ff8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae06bd70-93f5-abe8-64d9-e5e991cd8ff8@gmail.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTE6MTg6MzRQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMjI6NDQsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIFR1ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjIyOjE5UE0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiAyNy4xMC4yMDIwIDEyOjAyLCBLcnp5c3p0b2YgS296bG93c2tp
INC/0LjRiNC10YI6Cj4gPj4+PiBAQCAtMzEsMTcgKzMyLDM0IEBAIEV4YW1wbGU6Cj4gPj4+PiAg
CQkuLi4KPiA+Pj4+ICAJfTsKPiA+Pj4+ICAKPiA+Pj4+ICsJZW1jX2J3X2Rmc19vcHBfdGFibGU6
IGVtY19vcHBfdGFibGUxIHsKPiA+Pj4gSHlwaGVucyBmb3Igbm9kZSBuYW1lLgo+ID4+Cj4gPj4g
V2UgYWxyZWFkeSB1c2UgdW5kZXJzY29yZXMgZm9yIHRoZSBUZWdyYSBDUFUgT1BQIHRhYmxlLgo+
ID4+Cj4gPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTAtcmMxL3NvdXJj
ZS9hcmNoL2FybS9ib290L2R0cy90ZWdyYTIwLWNwdS1vcHAuZHRzaSNMNAo+ID4+Cj4gPj4gV2hh
dCBtYWtlcyB5b3UgdGhpbmsgdGhhdCBoeXBoZW5zIHdpbGwgYmUgYSBiZXR0ZXIgY2hvaWNlPyBJ
cyBpdCBhCj4gPj4gZG9jdW1lbnRlZCBuYW1pbmcgY29udmVudGlvbj8KPiA+IAo+ID4gVW5mb3J0
dW5hdGVseSB0aGF0J3MgdGhlIHNvdXJjZSBvZiBjb25mdXNpb24gYWxzbyBmb3IgbWUgYmVjYXVz
ZQo+ID4gRGV2aWNldHJlZSBzcGVjIG1lbnRpb25zIGJvdGggb2YgdGhlbSAoYW5kIGRvZXMgbm90
IHNwZWNpZnkgcHJlZmVyZW5jZXMpLgo+ID4gCj4gPiBUaGUgY2hvaWNlIG9mIGRhc2hlcy9oeXBo
ZW5zIGNvbWVzIG5vdyBleHBsaWNpdGx5IGZyb20gYWxsIGR0c2NoZW1hCj4gPiBmaWxlcy4gIFBy
ZXZpb3VzbHksIHRoZSBkb2N1bWVudGF0aW9uIHdlcmUgZW1haWxzIGZyb20gUm9iLiA6KQo+IAo+
IE9rYXksIEknbGwgY2hhbmdlIGl0IGluIHY3LiBTbyBmYXIgSSBoYXZlbid0IHNlZW4gd2Fybmlu
Z3MgYWJvdXQgaXQgZnJvbQo+IHRoZSBzY2hlbWEtY2hlY2tlci4KCmR0YyB3aXRoIFc9MiB3aWxs
IHdhcm4uCgpUaGUgYmlnZ2VyIGlzc3VlIGlzIHRoZSBuYW1lIHNob3VsZCBiZSBnZW5lcmljLgoK
Um9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
