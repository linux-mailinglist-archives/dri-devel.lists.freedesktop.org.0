Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FE29C8E9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3987F6EC24;
	Tue, 27 Oct 2020 19:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF196EC24
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:30:44 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id k9so550550edo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RBb2W6vnvr8BZ3JPOSPoABcC6/USapoO19wplu4GSWk=;
 b=nDr7Hit+C/Z/yobPmfI/v3ygzZ8ta4f5OZ5CwhDnwWaFlKyjAySyY88C5GW/CTmiO/
 a0qy1CCi8yOhq41yMnZGV+3Yb9wAK86i90rBDj6TgJpdt7uxh43t+rzPAb+C3moUW8DU
 15/V6eaEn9bio2cg2sp8z+HzwQdwc5+F3i33Y6BivzJz/vqHvschZewIT4E/iKAe9MbN
 rhrakKkw90VQ0wddIR0E003kMigRTIyZrEwGD8ZT0cEDebdIa4pmQaJrTDUI7gGyYlsy
 I9TZchAvT2WUxwnkUTKDf5bKZbE2zyYyLrheylGSSBBE9SpK9hch65AYZH/53y4PQyB+
 zk3Q==
X-Gm-Message-State: AOAM530l4u/akddU+BZkCK5CceBC+mi9JJ4l9bSFEaXRdL8D712bXIq+
 pG2SqMWj3Pvn6nO+NDkyYuI=
X-Google-Smtp-Source: ABdhPJyZ/rq/EC6GsN4s/PCybZFKTFwJikds6RvGuu7wY5AqoMWIc9Vxh43XdGRJGg8dsyUGVp5G3w==
X-Received: by 2002:a05:6402:1b1e:: with SMTP id
 by30mr3972107edb.369.1603827042919; 
 Tue, 27 Oct 2020 12:30:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id s12sm1518324edu.28.2020.10.27.12.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:30:41 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:30:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
Message-ID: <20201027193039.GA140636@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com>
 <20201027085417.GD4244@kozik-lap>
 <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
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

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTc6MTlQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTE6NTQsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjQ3QU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBUZWdyYTIwIEV4dGVybmFsIE1lbW9yeSBDb250cm9sbGVyIHRh
bGtzIHRvIERSQU0gY2hpcHMgYW5kIGl0IG5lZWRzIHRvIGJlCj4gPj4gcmVwcm9ncmFtbWVkIHdo
ZW4gbWVtb3J5IGZyZXF1ZW5jeSBjaGFuZ2VzLiBUZWdyYSBNZW1vcnkgQ29udHJvbGxlciBzaXRz
Cj4gPj4gYmVoaW5kIEVNQyBhbmQgdGhlc2UgY29udHJvbGxlcnMgYXJlIHRpZ2h0bHkgY291cGxl
ZC4gVGhpcyBwYXRjaCBhZGRzIHRoZQo+ID4+IG5ldyBwaGFuZGxlIHByb3BlcnR5IHdoaWNoIGFs
bG93cyB0byBwcm9wZXJseSBleHByZXNzIGNvbm5lY3Rpb24gb2YgRU1DCj4gPj4gYW5kIE1DIGhh
cmR3YXJlIGluIGEgZGV2aWNlLXRyZWUsIGl0IGFsc28gcHV0IHRoZSBUZWdyYTIwIEVNQyBiaW5k
aW5nIG9uCj4gPj4gcGFyIHdpdGggVGVncmEzMCsgRU1DIGJpbmRpbmdzLCB3aGljaCBpcyBoYW5k
eSB0byBoYXZlLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICAuLi4vYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xs
ZXJzL252aWRpYSx0ZWdyYTIwLWVtYy50eHQgICAgICAgICAgfCAyICsrCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTIw
LWVtYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL252aWRpYSx0ZWdyYTIwLWVtYy50eHQKPiA+PiBpbmRleCA1NjdjZmZkMzdmM2YuLjFi
MGQ0NDE3YWFkOCAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTIwLWVtYy50eHQKPiA+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL252
aWRpYSx0ZWdyYTIwLWVtYy50eHQKPiA+PiBAQCAtMTIsNiArMTIsNyBAQCBQcm9wZXJ0aWVzOgo+
ID4+ICAgIGlycmVzcGVjdGl2ZSBvZiByYW0tY29kZSBjb25maWd1cmF0aW9uLgo+ID4+ICAtIGlu
dGVycnVwdHMgOiBTaG91bGQgY29udGFpbiBFTUMgR2VuZXJhbCBpbnRlcnJ1cHQuCj4gPj4gIC0g
Y2xvY2tzIDogU2hvdWxkIGNvbnRhaW4gRU1DIGNsb2NrLgo+ID4+ICstIG52aWRpYSxtZW1vcnkt
Y29udHJvbGxlciA6IFBoYW5kbGUgb2YgdGhlIE1lbW9yeSBDb250cm9sbGVyIG5vZGUuCj4gPiAK
PiA+IEl0IGxvb2tzIGxpa2UgeW91IGFkZGluZyBhIHJlcXVpcmVkIHByb3BlcnR5IHdoaWNoIGlz
IGFuIEFCSSBicmVhay4KPiBUaGUgVDIwIEVNQyBkcml2ZXIgaXMgdW51c2VkIHNvIGZhciBpbiB1
cHN0cmVhbSBhbmQgaXQgd2lsbCBiZWNvbWUgdXNlZAo+IG9ubHkgb25jZSB0aGlzIHNlcmllcyBp
cyBhcHBsaWVkLiBIZW5jZSBpdCdzIGZpbmUgdG8gY2hhbmdlIHRoZSBBQkkuCgpUaGUgQUJJIGlz
IG5vdCBhYm91dCB1cHN0cmVhbSwgYnV0IGRvd25zdHJlYW0uIFRoZXJlIGFyZSBubyBvdGhlcgp1
cHN0cmVhbXMgdXNpbmcgdGhpcyBBQkkuIFVubGVzcyB5b3UgaGF2ZSBpbiBtaW5kIHRoYXQgZXhp
c3RpbmcgVDIwIEVNQwpkcml2ZXIgd2FzIGEgbm9vcCwgZG9pbmcgYWJzb2x1dGVseSBub3RoaW5n
LCB0aGVyZWZvcmUgdGhlcmUgaXMgbm8KYnJlYWthZ2Ugb2YgYW55IG90aGVyIHVzZXJzPwoKQmVz
dCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
