Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3E29D1B2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B32A6E321;
	Wed, 28 Oct 2020 19:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814046E321
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 19:27:34 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id t11so605099edj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9qMkACaxgBFGgp14/y74BYPbOoZe+yAscejmhiaaiHI=;
 b=kfbVePos94K/T9H+CK+6Xm4t4CIDGxsfNn+wPwNcYk1kYTLjgfjZ7/ZXhOEULPSWWp
 me2NlIR7RQKAqhzGeSjKfzw8qWgENK0FcxSPnmoSuSEtfWHOvBqNczTJChhaPDicRQtm
 K301eSRf1prBNmEeInPfBPz15nrq0Hkw8apbd983I3ROnYkWhgY3TvMoyx9ZyOG7UNS9
 LS0kUJL4NklmUI2o9zJXCO2dJBjO38G6M+uqvvwfOC35VoqKxOWPoe9+wao7CIGb+/ZO
 +ecNT/lkEliPXrGDI6i1/4cHejeUJEP0H5oMTWHHn8FHtReQUj/rxqwQfCJlXCFMSxnu
 iq/w==
X-Gm-Message-State: AOAM531C9nQqJLE1eBCJAoMQOVULD7+FHbTuWZXlZ0LeJIrhGYSRT/YO
 KbAaaayfeWMDh0l2qNyv6PA=
X-Google-Smtp-Source: ABdhPJzFsqaQeMhmEXSs9UrGO3Kmxrx9OhwqKP85Emfcv2bhHljDeQGLFfXI3feKDEwi+e1eh+cN1w==
X-Received: by 2002:a50:d987:: with SMTP id w7mr441293edj.113.1603913252990;
 Wed, 28 Oct 2020 12:27:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id y14sm205006edo.69.2020.10.28.12.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 12:27:31 -0700 (PDT)
Date: Wed, 28 Oct 2020 20:27:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document
 new interconnect property
Message-ID: <20201028192729.GA170285@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com>
 <20201027102506.GB17089@kozik-lap>
 <f38984b6-d53f-a43d-0387-e787b3c1924d@gmail.com>
 <20201027194833.GE140636@kozik-lap>
 <0a7aeebf-c5ab-13ea-3927-fa39512afd87@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a7aeebf-c5ab-13ea-3927-fa39512afd87@gmail.com>
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTE6MTY6MjlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMjI6NDgsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIFR1ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjE5OjI4UE0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiAyNy4xMC4yMDIwIDEzOjI1LCBLcnp5c3p0b2YgS296bG93c2tp
INC/0LjRiNC10YI6Cj4gPj4+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjU2QU0gKzAz
MDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+Pj4+IEV4dGVybmFsIG1lbW9yeSBjb250cm9s
bGVyIGlzIGludGVyY29ubmVjdGVkIHdpdGggbWVtb3J5IGNvbnRyb2xsZXIgYW5kCj4gPj4+PiB3
aXRoIGV4dGVybmFsIG1lbW9yeS4gRG9jdW1lbnQgbmV3IGludGVyY29ubmVjdCBwcm9wZXJ0eSB3
aGljaCB0dXJucwo+ID4+Pj4gRXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIgaW50byBpbnRlcmNv
bm5lY3QgcHJvdmlkZXIuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBl
bmtvIDxkaWdldHhAZ21haWwuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgLi4uL2JpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmExMjQtZW1jLnlhbWwgICB8IDcgKysrKysrKwo+
ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+Pj4+Cj4gPj4+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9s
bGVycy9udmlkaWEsdGVncmExMjQtZW1jLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTEyNC1lbWMueWFtbAo+ID4+
Pj4gaW5kZXggMjc4NTQ5ZjllMDUxLi5hYzAwODMyY2VhYzEgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRp
YSx0ZWdyYTEyNC1lbWMueWFtbAo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmExMjQtZW1jLnlhbWwKPiA+
Pj4+IEBAIC0yOSw2ICsyOSw5IEBAIHByb3BlcnRpZXM6Cj4gPj4+PiAgICAgIGl0ZW1zOgo+ID4+
Pj4gICAgICAgIC0gY29uc3Q6IGVtYwo+ID4+Pj4gIAo+ID4+Pj4gKyAgIiNpbnRlcmNvbm5lY3Qt
Y2VsbHMiOgo+ID4+Pj4gKyAgICBjb25zdDogMAo+ID4+Pj4gKwo+ID4+Pj4gICAgbnZpZGlhLG1l
bW9yeS1jb250cm9sbGVyOgo+ID4+Pj4gICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy9waGFuZGxlCj4gPj4+PiAgICAgIGRlc2NyaXB0aW9uOgo+ID4+Pj4gQEAgLTMy
Nyw2ICszMzAsNyBAQCByZXF1aXJlZDoKPiA+Pj4+ICAgIC0gY2xvY2tzCj4gPj4+PiAgICAtIGNs
b2NrLW5hbWVzCj4gPj4+PiAgICAtIG52aWRpYSxtZW1vcnktY29udHJvbGxlcgo+ID4+Pj4gKyAg
LSAiI2ludGVyY29ubmVjdC1jZWxscyIKPiA+Pj4KPiA+Pj4gQW5vdGhlciByZXF1aXJlZCBwcm9w
ZXJ0eSwgd2hhdCBhYm91dCBhbGwgZXhpc3RpbmcgdXNlcnMgb2YgdGhpcyBiaW5kaW5nPwo+ID4+
Cj4gPj4gRU1DL2RldmZyZXEgZHJpdmVycyBjaGVjayBwcmVzZW5jZSBvZiB0aGUgbmV3IHByb3Bl
cnRpZXMgYW5kIGFzayB1c2Vycwo+ID4+IHRvIHVwZ3JhZGUgdGhlIERULiBUaGUga2VybmVsIHdp
bGwgY29udGludWUgdG8gd29yayBmaW5lIHVzaW5nIG9sZGVyCj4gPj4gRFRCcywgYnV0IGRldmZy
ZXEgZHJpdmVyIHdvbid0IGxvYWQuCj4gPiAKPiA+IElmIHRoZSBkZXZmcmVxIHdhcyB3b3JraW5n
IGZpbmUgYmVmb3JlICh3aXRoIHRoZXNlIG9sZGVyIERUQnMgYW5kIG9sZGVyCj4gPiBrZXJuZWwp
IHRoZW4geW91IGJyZWFrIHRoZSBmZWF0dXJlLgo+ID4gCj4gPiBJZiBkZXZmcmVxIHdhcyBub3Qg
d29ya2luZyBvciB3YXMgbm90IHN0YWJsZSBlbm91Z2gsIHRoZW4gbm90aGluZyBpcwo+ID4gYnJv
a2VuIHNvIHN1Y2ggY2hhbmdlIGlzIGFjY2VwdGVkLgo+ID4gCj4gPiBXaGljaCBvbmUgaXMgdGhl
bj8KPiAKPiBEZWZpbml0ZWx5IHRoZSBsYXR0ZXIuIFRoZSBjdXJyZW50IGRldmZyZXEgd29ya3Mg
b2theSdpc2gsIGJ1dCB3ZSByZWx5Cj4gb24gaGFyZHdhcmUgdG8gcmVjb3ZlciBmcm9tIHRlbXBv
cmFsIEZJRk8gdW5kZXJmbG93cyBhbmQgaXQncyBhCj4gdXNlci12aXNpYmxlIHByb2JsZW0gd2hp
Y2ggdGhpcyBzZXJpZXMgYWRkcmVzc2VzLgoKSSB1bmRlcnN0YW5kLiBGaW5lIHdpdGggbWUsIHRo
YW5rcyBmb3IgZXhwbGFuYXRpb24uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
