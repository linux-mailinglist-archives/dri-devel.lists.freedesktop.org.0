Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810529D0A6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5D6E57E;
	Wed, 28 Oct 2020 15:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC1D6E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:23:07 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id u5so1255441oot.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o6EwXQBfcMS/8hppO1O8Dg2kVJUq26B2UJyAmaDjbzk=;
 b=eIIvmliaHj7x2E1KM1F8FxqACpPDjhNeGq+Ub3EppKxmCVStO0uIWtVdfnhiOUl8vL
 PKicw+s/VFcOGqB9ANyQdyjDfvh9OccFvWDuZVDZD+3sgUvHq/XZ7lF3IafPaGIv9Zid
 trEwEXrimzlyAfiZ9DqXazJVknMcVR6SoRWnDoHzzQM3jD9CPmHG+dl2Njqnc+xbgbYj
 2ZobFDtqEEHzTukmDKFtMebqvYPVcRNouR+XNx7LNeZfeHM4UXEXkhStRLFuaKlsnYvb
 oqf8+CGK6N5TAcJzg0COaegM3rqRs8E/WePe9ghhMPSlj5JluvepXclJMCGcYYCZHCvv
 alVg==
X-Gm-Message-State: AOAM532RhR5AoroecKrX0gO+LOF7B0G0tE/10O055dcyQU9A+fl1bgpc
 N9RApLWMIRULlwOV8pGDDg==
X-Google-Smtp-Source: ABdhPJwj/TyDdKmqYTN4xYvs7B9zlCOZD1OUjrbHekbCo/ATjXWibtj5dLIGJwVVW7gCH9am8fXsDQ==
X-Received: by 2002:a4a:ea4b:: with SMTP id j11mr6145795ooe.56.1603898585153; 
 Wed, 28 Oct 2020 08:23:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c20sm2076568otm.49.2020.10.28.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:23:04 -0700 (PDT)
Received: (nullmailer pid 4050074 invoked by uid 1000);
 Wed, 28 Oct 2020 15:23:03 -0000
Date: Wed, 28 Oct 2020 10:23:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
Message-ID: <20201028152303.GA4041470@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com>
 <20201027085417.GD4244@kozik-lap>
 <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
 <20201027193039.GA140636@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027193039.GA140636@kozik-lap>
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
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMDg6MzA6MzlQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiBUdWUsIE9jdCAyNywgMjAyMCBhdCAxMDoxNzoxOVBNICswMzAwLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPiAyNy4xMC4yMDIwIDExOjU0LCBLcnp5c3p0b2YgS296
bG93c2tpINC/0LjRiNC10YI6Cj4gPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQ3
QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+ID4+IFRlZ3JhMjAgRXh0ZXJuYWwg
TWVtb3J5IENvbnRyb2xsZXIgdGFsa3MgdG8gRFJBTSBjaGlwcyBhbmQgaXQgbmVlZHMgdG8gYmUK
PiA+ID4+IHJlcHJvZ3JhbW1lZCB3aGVuIG1lbW9yeSBmcmVxdWVuY3kgY2hhbmdlcy4gVGVncmEg
TWVtb3J5IENvbnRyb2xsZXIgc2l0cwo+ID4gPj4gYmVoaW5kIEVNQyBhbmQgdGhlc2UgY29udHJv
bGxlcnMgYXJlIHRpZ2h0bHkgY291cGxlZC4gVGhpcyBwYXRjaCBhZGRzIHRoZQo+ID4gPj4gbmV3
IHBoYW5kbGUgcHJvcGVydHkgd2hpY2ggYWxsb3dzIHRvIHByb3Blcmx5IGV4cHJlc3MgY29ubmVj
dGlvbiBvZiBFTUMKPiA+ID4+IGFuZCBNQyBoYXJkd2FyZSBpbiBhIGRldmljZS10cmVlLCBpdCBh
bHNvIHB1dCB0aGUgVGVncmEyMCBFTUMgYmluZGluZyBvbgo+ID4gPj4gcGFyIHdpdGggVGVncmEz
MCsgRU1DIGJpbmRpbmdzLCB3aGljaCBpcyBoYW5keSB0byBoYXZlLgo+ID4gPj4KPiA+ID4+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiA+ID4+IC0t
LQo+ID4gPj4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAt
ZW1jLnR4dCAgICAgICAgICB8IDIgKysKPiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMjAtZW1jLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlh
LHRlZ3JhMjAtZW1jLnR4dAo+ID4gPj4gaW5kZXggNTY3Y2ZmZDM3ZjNmLi4xYjBkNDQxN2FhZDgg
MTAwNjQ0Cj4gPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTIwLWVtYy50eHQKPiA+ID4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRl
Z3JhMjAtZW1jLnR4dAo+ID4gPj4gQEAgLTEyLDYgKzEyLDcgQEAgUHJvcGVydGllczoKPiA+ID4+
ICAgIGlycmVzcGVjdGl2ZSBvZiByYW0tY29kZSBjb25maWd1cmF0aW9uLgo+ID4gPj4gIC0gaW50
ZXJydXB0cyA6IFNob3VsZCBjb250YWluIEVNQyBHZW5lcmFsIGludGVycnVwdC4KPiA+ID4+ICAt
IGNsb2NrcyA6IFNob3VsZCBjb250YWluIEVNQyBjbG9jay4KPiA+ID4+ICstIG52aWRpYSxtZW1v
cnktY29udHJvbGxlciA6IFBoYW5kbGUgb2YgdGhlIE1lbW9yeSBDb250cm9sbGVyIG5vZGUuCj4g
PiA+IAo+ID4gPiBJdCBsb29rcyBsaWtlIHlvdSBhZGRpbmcgYSByZXF1aXJlZCBwcm9wZXJ0eSB3
aGljaCBpcyBhbiBBQkkgYnJlYWsuCj4gPiBUaGUgVDIwIEVNQyBkcml2ZXIgaXMgdW51c2VkIHNv
IGZhciBpbiB1cHN0cmVhbSBhbmQgaXQgd2lsbCBiZWNvbWUgdXNlZAo+ID4gb25seSBvbmNlIHRo
aXMgc2VyaWVzIGlzIGFwcGxpZWQuIEhlbmNlIGl0J3MgZmluZSB0byBjaGFuZ2UgdGhlIEFCSS4K
PiAKPiBUaGUgQUJJIGlzIG5vdCBhYm91dCB1cHN0cmVhbSwgYnV0IGRvd25zdHJlYW0uIAoKIklm
IGl0J3Mgbm90IHVwc3RyZWFtLCBpdCBkb2Vzbid0IGV4aXN0LiIKClRob3VnaCB3ZSBkbyBoYXZl
IHRvIGFjY291bnQgZm9yIG91dCBvZiB0cmVlIHVzZXJzIHdoZXJlIHRoZSBEVCBpcyBub3QgCmlu
IHRyZWUsIGJ1dCB1cHN0cmVhbSBkcml2ZXJzIGFyZSB1c2VkLiBEb3duc3RyZWFtIGFzIGluIHZl
bmRvciBrZXJuZWxzIAp0eXBpY2FsbHkgaGFzIGxvYWRzIG9mIG90aGVyIGNyYXAuCgo+IFRoZXJl
IGFyZSBubyBvdGhlcgo+IHVwc3RyZWFtcyB1c2luZyB0aGlzIEFCSS4gVW5sZXNzIHlvdSBoYXZl
IGluIG1pbmQgdGhhdCBleGlzdGluZyBUMjAgRU1DCj4gZHJpdmVyIHdhcyBhIG5vb3AsIGRvaW5n
IGFic29sdXRlbHkgbm90aGluZywgdGhlcmVmb3JlIHRoZXJlIGlzIG5vCj4gYnJlYWthZ2Ugb2Yg
YW55IG90aGVyIHVzZXJzPwoKQUJJIGJyZWFrcyBhcmUgdWx0aW1hdGVseSB1cCB0byB0aGUgcGxh
dGZvcm0gbWFpbnRhaW5lcnMgdG8gZGVjaWRlLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
