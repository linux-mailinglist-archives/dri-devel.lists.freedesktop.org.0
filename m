Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F529A6FB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D207A6E1B2;
	Tue, 27 Oct 2020 08:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248C6E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:52:58 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l16so588002eds.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 01:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=miK2E28wkgKpBF1Fb19w02StT2/a3W+EFB25jg9SneM=;
 b=XLJimAi/ODuW+DWbnowHEfdvc5if7rtmGDTpD5p+k5GSIWaaPagGQYhKaUUIJntufT
 q9MOpnHrDfAEHkPa7uBcJ0a/31RaNTVWSYI7swT3ge6f/oSSgFic5LIKkNIxFOKPgXH3
 4axhkSQ+n0TDGyqnMjLXZsJ+FOypd8XMs8FyAs3yiA8oRmu/RrmPMRv7Qt6cdUur6Vdg
 MCapujVcDqxqMPbUnjpnqwQ8qC6brkPE3czGJG2Pg5i3KUYvM9BI3Ev+S3vfiN853FZU
 JTJLXOK0LHj8tsuaamIqVEu56VB7vmsZW9lp0CHybL24nsp8HZ5Q97SnfKugFzGW6IuC
 q2Pg==
X-Gm-Message-State: AOAM530S7KiTE0KdiuZy2/0XDacazLpcuMMlvFH1Ebfe9jmKGw1W9t3W
 HwhC070/lS5hcTcCa0wC0mGBLoLTuLKeap8A
X-Google-Smtp-Source: ABdhPJx3r/Ivqz3bC6fK7Dk3U50yBK7Yqy4j7oDemcQ7xJqnXXJr2+AP4pt/yaUfzlPS/UM2jTnfbg==
X-Received: by 2002:a05:6402:135a:: with SMTP id
 y26mr1113530edw.114.1603788776652; 
 Tue, 27 Oct 2020 01:52:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id m25sm503543edp.36.2020.10.27.01.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 01:52:55 -0700 (PDT)
Date: Tue, 27 Oct 2020 09:52:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/52] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20201027085253.GC4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201026150845.GA87050@kozik-lap>
 <48a5cfdd-c170-f6d3-001a-2d343ecb2c5e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48a5cfdd-c170-f6d3-001a-2d343ecb2c5e@gmail.com>
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

T24gTW9uLCBPY3QgMjYsIDIwMjAgYXQgMTA6MTQ6MTBQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI2LjEwLjIwMjAgMTg6MDgsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQzQU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBIZWxsbywKPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIGJyaW5ncyBp
bml0aWFsIHN1cHBvcnQgZm9yIG1lbW9yeSBpbnRlcmNvbm5lY3QgdG8gVGVncmEyMCwKPiA+PiBU
ZWdyYTMwIGFuZCBUZWdyYTEyNCBTb0NzLgo+ID4+Cj4gPj4gRm9yIHRoZSBzdGFydGVyIG9ubHkg
ZGlzcGxheSBjb250cm9sbGVycyBhbmQgZGV2ZnJlcSBkZXZpY2VzIGFyZSBnZXR0aW5nCj4gPj4g
aW50ZXJjb25uZWN0IEFQSSBzdXBwb3J0LCBvdGhlcnMgY291bGQgYmUgc3VwcG9ydGVkIGxhdGVy
IG9uLiBUaGUgZGlzcGxheQo+ID4+IGNvbnRyb2xsZXJzIGhhdmUgdGhlIGJpZ2dlc3QgZGVtYW5k
IGZvciBpbnRlcmNvbm5lY3QgQVBJIHJpZ2h0IG5vdyBiZWNhdXNlCj4gPj4gZHluYW1pYyBtZW1v
cnkgZnJlcXVlbmN5IHNjYWxpbmcgY2FuJ3QgYmUgZG9uZSBzYWZlbHkgd2l0aG91dCB0YWtpbmcg
aW50bwo+ID4+IGFjY291bnQgYmFuZHdpZHRoIHJlcXVpcmVtZW50IGZyb20gdGhlIGRpc3BsYXlz
LiBJbiBwYXJ0aWN1bGFyIHRoaXMgc2VyaWVzCj4gPj4gZml4ZXMgZGlzdG9ydGVkIGRpc3BsYXkg
b3V0cHV0IG9uIFQzMCBPdXlhIGFuZCBUMTI0IFRLMSBkZXZpY2VzLgo+ID4gCj4gPiBIaSwKPiA+
IAo+ID4gWW91IGludHJvZHVjZWQgaW4gdjYgbXVsdGlwbGUgbmV3IHBhdGNoZXMuIENvdWxkIHlv
dSBkZXNjcmliZSB0aGUKPiA+IGRlcGVuZGVuY2llcywgaWYgYW55Pwo+IAo+IEhlbGxvLAo+IAo+
IFRoZSB2NiBkcm9wcGVkIHNvbWUgb2xkZXIgcGF0Y2hlcyBhbmQgcmVwbGFjZWQgdGhlbSB3aXRo
IHRoZSBuZXcKPiBwYXRjaGVzLiBQcmV2aW91c2x5IEkgd2FudGVkIHRvIHBvc3Rwb25lIHRoZSBt
b3JlIGNvbXBsZXggY2hhbmdlcyBmb3IKPiBsYXRlciB0aW1lcywgbGlrZSBzdXBwb3J0aW5nIE9Q
UCB0YWJsZXMgYW5kIERWRlMsIGJ1dCB0aGVuIHRoZSByZXZpZXcKPiBzdGFydGVkIHRvIHRha2Ug
bW9yZSB0aW1lIHRoYW4gd2FzIGV4cGVjdGVkIGFuZCB0aGVyZSB3YXMgZW5vdWdoIHRpbWUgdG8K
PiBjb21wbGV0ZSB0aG9zZSBmZWF0dXJlcy4KPiAKPiBUaGVyZSBhcmUgZml2ZSBiYXNpYyBzZXRz
IG9mIHBhdGNoZXM6Cj4gCj4gCTEuIERUIGJpbmRpbmdzCj4gCTIuIERUIGNoYW5nZXMKPiAJMy4g
U29DLCBjbGsgYW5kIG1lbW9yeQo+IAk0LiBkZXZmcmVxCj4gCTUuIERSTQo+IAo+IEVhY2ggc2V0
IGNvdWxkIGJlIGFwcGxpZWQgc2VwYXJhdGVseS4KPiAKPiBNZW1vcnkgcGF0Y2hlcyBoYXZlIGEg
YnVpbGQgZGVwZW5kZW5jeSBvbiB0aGUgU29DIGFuZCBjbGsgcGF0Y2hlcy4KPiAKPiBUaGUgInRl
Z3JhLW1jOiBBZGQgaW50ZXJjb25uZWN0IGZyYW1ld29yayIgYW5kICJBZGQgYW5kIHVzZQo+IGRl
dm1fdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKCkiIGFyZSB0aGUgcm9vdCBidWlsZCBkZXBl
bmRlbmNpZXMgZm9yCj4gYWxsIG1lbW9yeS8gcGF0Y2hlcy4gT3RoZXIgcGF0Y2hlcyBhcmUgZ3Jv
dXBlZCBwZXIgU29DIGdlbmVyYXRpb24KPiAoVGVncmEyMC8zMC8xMjQpLCBwYXRjaGVzIHdpdGhp
biBhIFNvQy1nZW4gZ3JvdXAgYXJlIGludGVyZGVwZW5kZW50Lgo+IAo+IEkgc3VwcG9zZSB0aGUg
YmVzdCB2YXJpYW50IHdvdWxkIGJlIHRvIG1lcmdlIHRoZSB3aG9sZSBzZXJpZXMgdmlhCj4gdGVn
cmEtdHJlZSBpbiBvcmRlciB0byBwcmVzZXJ2ZSBsb2dpY2FsIG9yZGVyIG9mIHRoZSBwYXRjaGVz
LiBBbHRob3VnaCwKPiBtZXJnaW5nIGVhY2ggc2V0IG9mIHBhdGNoZXMgc2VwYXJhdGVseSBhbHNv
IHNob3VsZCBiZSBva2F5IHRvIGRvLgoKVGhhbmtzIGZvciBleHBsYW5hdGlvbi4gSSBhbHJlYWR5
IGhhdmUgdGhyZWUgcGF0Y2hlcyBmb3IgVGVncmEgTUMgKGFuZApwcm9iYWJseSB0d28gbW9yZSB3
aWxsIGJlIHJlc3B1bikgc28gdGhpcyBtaWdodCBiZSBjb25mbGljdC1wcm9uZS4gVGhlCmVhc2ll
c3QgaW4gc3VjaCBjYXNlIGlzIHRvIHByb3ZpZGUgbWUgc29jIGFuZCBjbGsgcGF0Y2hlcyBvbiB0
aGUgYnJhbmNoLApzbyBJIGNvdWxkIGtlZXAgYWxsIFRlZ3JhIE1DIHRvZ2V0aGVyLgoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
