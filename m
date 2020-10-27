Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52629C907
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8A089870;
	Tue, 27 Oct 2020 19:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859C89870
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:34:22 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p9so3920788eji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nHvaL4wmpHKYi5m3WZBTUj9Yr645AuMpS/Lwjl+uNoA=;
 b=IhG2BKFAyvrqAhFypgGh8vWasA+qO1fv/nufuMusUNc9a+4KaWnslbiMMI8CXzUbcn
 td93GoPlbz8ZsHY2RH+awKjr9B5Wxi9ySH26aBe8QV1Tq38JHQSi1B7gB0LEvgdrf3Dv
 8efwDDzxGUpNJngyLurQqXnQ+a9gc5ZGLnL9cSvBcsdhuTcKY81b3QoTPo9eZJutbMdT
 pm5a3VPkmVpO6BcmflirsrhABzilIZk4iXF7b6ic4Tw5ubIsVWm5d7YhPIZj9ELH67h8
 jsLg1mLlyUZ7LxgB6bwRHEnZFefytJSBJzTS5wefjgN1M+FFNEKQ7zOGl0sqynaa0M3T
 ZzRQ==
X-Gm-Message-State: AOAM5313BOTZLPDG2Bhk6/FcNrkxQWTYgzy2V4NbQhWHGvYcGwHF9Pa0
 KF3Q95QQAtcmpxDF0dIINKI=
X-Google-Smtp-Source: ABdhPJzSfsy7j2DNep0zqEKUKGZS6bAlWA30JvZmU2UWtQoUwNW/pB7XvrPTG1y6Gt14VNHQQIvGHQ==
X-Received: by 2002:a17:906:b204:: with SMTP id
 p4mr4185530ejz.214.1603827260969; 
 Tue, 27 Oct 2020 12:34:20 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id r24sm1487476eds.67.2020.10.27.12.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:34:19 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:34:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 05/52] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Message-ID: <20201027193417.GB140636@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-6-digetx@gmail.com>
 <20201027085548.GE4244@kozik-lap>
 <abf1df6c-3e45-209c-244e-356d88b454aa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abf1df6c-3e45-209c-244e-356d88b454aa@gmail.com>
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

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTc6NDhQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTE6NTUsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQ4QU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBNZW1vcnkgY29udHJvbGxlciBpcyBpbnRlcmNvbm5lY3RlZCB3
aXRoIG1lbW9yeSBjbGllbnRzIGFuZCB3aXRoIHRoZQo+ID4+IEV4dGVybmFsIE1lbW9yeSBDb250
cm9sbGVyLiBEb2N1bWVudCBuZXcgaW50ZXJjb25uZWN0IHByb3BlcnR5IHdoaWNoCj4gPj4gdHVy
bnMgbWVtb3J5IGNvbnRyb2xsZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4gPj4KPiA+
PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gIC4u
Li9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtbWMudHh0ICAgICAg
ICAgIHwgMyArKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtbWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1tYy50eHQKPiA+
PiBpbmRleCBlNTUzMjgyMzdkZjQuLjczOWI3YzZmMmUyNiAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0
ZWdyYTIwLW1jLnR4dAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtbWMudHh0Cj4gPj4gQEAgLTE2LDYg
KzE2LDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiA+PiAgICBJT01NVSBzcGVjaWZpZXIgbmVl
ZGVkIHRvIGVuY29kZSBhbiBhZGRyZXNzLiBHQVJUIHN1cHBvcnRzIG9ubHkgYSBzaW5nbGUKPiA+
PiAgICBhZGRyZXNzIHNwYWNlIHRoYXQgaXMgc2hhcmVkIGJ5IGFsbCBkZXZpY2VzLCB0aGVyZWZv
cmUgbm8gYWRkaXRpb25hbAo+ID4+ICAgIGluZm9ybWF0aW9uIG5lZWRlZCBmb3IgdGhlIGFkZHJl
c3MgZW5jb2RpbmcuCj4gPj4gKy0gI2ludGVyY29ubmVjdC1jZWxscyA6IFNob3VsZCBiZSAxLiBU
aGlzIGNlbGwgcmVwcmVzZW50cyBtZW1vcnkgY2xpZW50Lgo+ID4+ICsgIFRoZSBhc3NpZ25tZW50
cyBtYXkgYmUgZm91bmQgaW4gaGVhZGVyIGZpbGUgPGR0LWJpbmRpbmdzL21lbW9yeS90ZWdyYTIw
LW1jLmg+Lgo+ID4gCj4gPiBUaGlzIGlzIGEgbGlzdCBvZiByZXF1aXJlZCBwcm9wZXJ0aWVzIHNv
IHlvdSBicmVhayB0aGUgQUJJLiBBbGwgZXhpc3RpbmcKPiA+IERUQnMgd2lsbCBiZSBhZmZlY3Rl
ZC4KPiAKPiBUaGlzIGlzIG9wdGlvbmFsIHByb3BlcnR5IGZvciB0aGUgb2xkZXIgRFRCcywgYnV0
IGZvciBuZXdlciBEVHMgaXQncwo+IG1hbmRhdG9yeS4KCldlIGRvIG5vdCBjb25zaWRlciBoZXJl
ICJvbGRlciIgb3IgIm5ld2VyIiBEVEJzLCBidXQgZXhpc3Rpbmcgb25lcyBpbgp0aGUgd29ybGQg
dXNpbmcgdGhpcyBiaW5kaW5nLgoKSWYgaXQgd2FzIG9wdGlvbmFsIHNvIGZhciwgaXQgY2Fubm90
IGJlIG1hZGUgbWFuZGF0b3J5IHdpdGhvdXQgY2hhbmdpbmcKdGhlIEFCSS4gV2hpY2ggaXMgYW4g
QUJJIGJyZWFrLgoKPiBJSVVDLCBpdCBzaG91bGQgYmUgZGVmaW5lZCBhcyBhIHJlcXVpcmVkIHBy
b3BlcnR5IGluIHRoZQo+IGJpbmRpbmcuCj4gCj4gUGxlYXNlIHNlZSB0ZWdyYV9tY19pbnRlcmNv
bm5lY3Rfc2V0dXAoKSBpbiAibWVtb3J5OiB0ZWdyYS1tYzogQWRkCj4gaW50ZXJjb25uZWN0IGZy
YW1ld29yayIsIHdoaWNoIGNoZWNrIHByZXNlbmNlIG9mIHRoZSBJQ0MgRFQgcHJvcGVydHkuCgpU
aGUgaW1wbGVtZW50YXRpb24gaW5kZWVkIGRvZXMgbm90IGVuZm9yY2UgaXQgKGV4Y2VwdCBhZGRp
bmcgZXJyb3IgbXNnLAphYm91dCB3aGljaCBJIGNvbW1lbnRlZCkuIFRoZXJlZm9yZSBpdCBzaG91
bGQgYmUgYW4gb3B0aW9uYWwgcHJvcGVydHkuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
