Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B9E9C43
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 14:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827156E9E1;
	Wed, 30 Oct 2019 13:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9965C6E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 13:29:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id z6so2111417otb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 06:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2PIp3nuujjbVDTCQlERuQPPmNS4hMz6vAUUQvwn05Tc=;
 b=FPLvmstzQsrgo24soyrObkc9YrsROlC1IF4n6f6eKXdB8bND3awLRmsURwB80c/UNy
 H6UZ6N2xoE9tacsIlQZyUidoC8+ySssNuDsjhsuQ5TCf/FOWuqJ7S2qxCGRobbK9BWi3
 1/rELVM+0AjJa0hzXl0k8xFj+mS91icNm2XiHZLX5ub5+303pEt63ObYEJxjY3p42CS7
 nFFp3xcbyxvuYvfc8tT1vVySfdfTS2t0YbFyH37GcUNYMdM8hz1E664E4B7GiE/PFPAm
 NwnolvgMpAAHNNrtiAI2A10QN8GMFPaU7kiqgsueOtt7J7JMd59ZAEEVLDTaysovcCYu
 nKOg==
X-Gm-Message-State: APjAAAX/ZmaJssFbDSEC7wwNJh8rF8eeIdNXJZfkCgcWjtAAdCVGmYla
 U6/5Hi2F0ic2utTfDrgp4Q==
X-Google-Smtp-Source: APXvYqxZ/cduY/57uFpVQbDA+dzUHNgNL7l4CUKcqiu/GlyrSfqJ4CfvFx7pOS+ityjeM2CS6IH5vA==
X-Received: by 2002:a05:6830:1e65:: with SMTP id
 m5mr13647806otr.41.1572442173786; 
 Wed, 30 Oct 2019 06:29:33 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm9804oie.37.2019.10.30.06.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 06:29:33 -0700 (PDT)
Date: Wed, 30 Oct 2019 08:29:32 -0500
From: Rob Herring <robh@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: dma-buf: heaps: Describe CMA
 regions to be added to dmabuf heaps interface.
Message-ID: <20191030132932.GA7292@bogus>
References: <20191025225009.50305-1-john.stultz@linaro.org>
 <20191025225009.50305-2-john.stultz@linaro.org>
 <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
 <CALAqxLXG8LrWAQevEyj7BJ00CiAkodfgFMdCbuMRucO5w5yhKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLXG8LrWAQevEyj7BJ00CiAkodfgFMdCbuMRucO5w5yhKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <rob.e.herring@gmail.com>,
 Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDQ6NTU6MzVQTSAtMDcwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgNDozMiBQTSBSb2IgSGVycmluZyA8cm9iLmUu
aGVycmluZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0
IDU6NTEgUE0gSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBUaGlzIGJpbmRpbmcgc3BlY2lmaWVzIHdoaWNoIENNQSByZWdpb25zIHNob3VsZCBi
ZSBhZGRlZCB0byB0aGUKPiA+ID4gZG1hYnVmIGhlYXBzIGludGVyZmFjZS4KPiA+Cj4gPiBJcyB0
aGlzIGFuIElPTiBEVCBiaW5kaW5nIGluIGRpc2d1aXNlPyBJIHRob3VnaHQgSSBraWxsZWQgdGhh
dC4gOykKPiAKPiBNYXliZT8gSSBtYXkgbm90IGhhdmUgYmVlbiBwYXlpbmcgYXR0ZW50aW9uIGJh
Y2sgdGhlbi4gIDopCj4gCj4gPiA+ICtFeGFtcGxlOgo+ID4gPiArVGhpcyBleGFtcGxlIGhhcyBh
IGNhbWVyYSBDTUEgbm9kZSBpbiByZXNlcnZlZCBtZW1vcnksIHdoaWNoIGlzIHRoZW4KPiA+ID4g
K3JlZmVyZW5jZWQgYnkgdGhlIGRtYWJ1Zi1oZWFwLWNtYSBub2RlLgo+ID4gPiArCj4gPiA+ICsK
PiA+ID4gKyAgICAgICByZXNlcnZlZC1tZW1vcnkgewo+ID4gPiArICAgICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwy
PjsKPiA+ID4gKyAgICAgICAgICAgICAgIHJhbmdlczsKPiA+ID4gKyAgICAgICAgICAgICAgIC4u
Lgo+ID4gPiArICAgICAgICAgICAgICAgY21hX2NhbWVyYTogY21hLWNhbWVyYSB7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDI0QzAwMDAwIDB4MCAweDQw
MDAwMDA+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXVzYWJsZTsKPiA+ID4gKyAg
ICAgICAgICAgICAgIH07Cj4gPiA+ICsgICAgICAgICAgICAgICAuLi4KPiA+ID4gKyAgICAgICB9
Owo+ID4gPiArCj4gPiA+ICsgICAgICAgY21hX2hlYXAgewo+ID4gPiArICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJkbWFidWYtaGVhcC1jbWEiOwo+ID4gPiArICAgICAgICAgICAgICAgbWVt
b3J5LXJlZ2lvbiA9IDwmY21hX2NhbWVyYT47Cj4gPgo+ID4gV2h5IHRoZSBpbmRpcmVjdGlvbiBo
ZXJlPyBDYW4ndCB5b3UganVzdCBhZGQgYSBmbGFnIHByb3BlcnR5IHRvCj4gPiByZXNlcnZlZC1t
ZW1vcnkgbm9kZXMgbGlrZSB3ZSBkbyB0byBmbGFnIENNQSBub2Rlcz8KPiAKPiBIYXBweSB0byB0
cnkuIERvIHlvdSBtZWFuIGxpa2Ugd2l0aCB0aGUgInJldWFzYWJsZSIgdGFnPyAgT3IgbW9yZSBs
aWtlCj4gdGhlICJsaW51eCxjbWEtZGVmYXVsdCIgdGFnPwoKUHJvYmFibHkgbGlrZSAibGludXgs
Y21hLWRlZmF1bHQiIGFzIGl0IGlzIGEgaGludCBmb3Igd2hvIHRvIG1hbmFnZSBpdCAKcmF0aGVy
IHRoYW4gYSBjaGFyYWN0ZXJpc3RpYyBvZiB0aGUgcmVnaW9uLgogCj4gRG8geW91IGhhdmUgYSBw
cmVmZXJlbmNlIGZvciB0aGUgZmxhZyBuYW1lIGhlcmU/CgpOb3QgcmVhbGx5LgoKCj4gPiBBcyBJ
IHN1c3BlY3RlZCwgaXQncyBiZWNhdXNlIGluIHBhdGNoIDIgeW91J3JlIGp1c3QgYWJ1c2luZyBE
VCB0bwo+ID4gaW5zdGFudGlhdGUgcGxhdGZvcm0gZGV2aWNlcy4gV2UgYWxyZWFkeSBzdXBwb3J0
IGJpbmRpbmcgZHJpdmVycyB0bwo+ID4gcmVzZXJ2ZWQtbWVtb3J5IG5vZGVzIGRpcmVjdGx5Lgo+
IAo+IFNvcnJ5LCBvbmUgb2YgdGhvc2UgIndoZW4gYWxsIHlvdSBrbm93IGhvdyB0byBkbyBpcyBo
YW1tZXIsIGV2ZXJ5dGhpbmcKPiBsb29rcyBsaWtlIGEgbmFpbCIgaXNzdWVzLgo+IElzIHRoZXJl
IGEgc3BlY2lmaWMgZXhhbXBsZSBmb3IgYmluZGluZyBkcml2ZXJzIHRvIHJlc2VydmVkLW1lbW9y
eQo+IG5vZGVzIEkgY2FuIHRyeSB0byBmb2xsb3c/CgpyYW1vb3BzIGFuZCBJIHRoaW5rIHRoZXJl
J3MgYSBRQ29tIGRyaXZlci4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
