Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230870776
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DF989D5C;
	Mon, 22 Jul 2019 17:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3884789D58;
 Mon, 22 Jul 2019 17:37:36 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so75819565iot.1;
 Mon, 22 Jul 2019 10:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VpXpDXWGUnEbnNjbvmDik4XWZT/z/T8Q2obmm5H0VtU=;
 b=RhM3oNih1M8+88MQMC139zj/31ItctEchgdqOgpTYsumdnkAvVH4xWNvF6UDxxJewC
 TBO4WOz42Smnt2b0fn1K58Dj1RpGhEUdCz+nM8RGr7e1ldgdZ6Pz52ZDwD2CyTU/gig2
 saJVJCR+hJWQDvNkUYBT1lBnFpemM3VwjRmGB9bPQUFAQQzzINTfpz3nQYzV2BRsC1KF
 u1Bmv0gNhXXC46gJ5DBhBU+i/3Az5Hmk+KA11sVdZ75mXysTUZYukYaYVh8Cwym5NMNE
 j+/6Mi0F5cbQH9vLKDNkt/uAfsW7QW4YxbfZXD0XgkzymggkZ4ZSCES3vvv5vk0zOcbA
 iXAg==
X-Gm-Message-State: APjAAAXHosrrcb4vXEVaGEcMXnZN5pCwKsxEMlXT4LzaLdLwsMnTIkDN
 sQqX1En2c4YCavf1NAgH/Q==
X-Google-Smtp-Source: APXvYqwmek+vXZCcjsZgE1r3YOhwQ19LnhrG4EPPZJhMevq/DibD43eSIH25v+qNGRvRGiYaMF1ALA==
X-Received: by 2002:a02:340d:: with SMTP id x13mr74999304jae.125.1563817055355; 
 Mon, 22 Jul 2019 10:37:35 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id x22sm28803813ioh.87.2019.07.22.10.37.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:37:34 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:37:34 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: msm: gmu: add optional
 ocmem property
Message-ID: <20190722173734.GA20285@bogus>
References: <20190626022148.23712-1-masneyb@onstation.org>
 <20190626022148.23712-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626022148.23712-3-masneyb@onstation.org>
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MjE6NDRQTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IFNvbWUgQTN4eCBhbmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGlu
c2lkZSB0aGUgR1BVIGNvcmUgYW5kCj4gbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01F
TSkgaW4gb3JkZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQo+IG9wdGlvbmFsIG9jbWVtIHBy
b3BlcnR5IHRvIHRoZSBBZHJlbm8gR3JhcGhpY3MgTWFuYWdlbWVudCBVbml0IGJpbmRpbmdzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+
IC0tLQo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBBZGQgYTN4eCBleGFtcGxlIHdpdGggT0NNRU0K
PiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gTm9uZQo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21zbS9nbXUudHh0ICAgfCA1MCArKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKPiBpbmRleCA5MGFm
NWIwYTU2YTkuLmU1NTk2OTk0ZGY3YiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0Cj4gQEAgLTMxLDYgKzMxLDEw
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gaW9tbXVzOiBwaGFuZGxlIHRvIHRoZSBhZHJl
bm8gaW9tbXUKPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyOiBwaGFuZGxlIHRvIHRoZSBPUFAgb3Bl
cmF0aW5nIHBvaW50cwo+ICAKPiArT3B0aW9uYWwgcHJvcGVydGllczoKPiArLSBvY21lbTogcGhh
bmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0J3MgcHJlc2VudCBvbiBzb21l
IFNuYXBkcmFnb24KPiArICAgICAgICAgU29Dcy4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwuCgpZb3UgbWlzc2VkIG15IGNvbW1l
bnQgb24gdjEgYWJvdXQgdXNpbmcgJ3NyYW0nLi4uCgo+ICsKPiAgRXhhbXBsZToKPiAgCj4gIC8g
ewo+IEBAIC02MywzICs2Nyw0OSBAQCBFeGFtcGxlOgo+ICAJCW9wZXJhdGluZy1wb2ludHMtdjIg
PSA8JmdtdV9vcHBfdGFibGU+Owo+ICAJfTsKPiAgfTsKPiArCj4gK2EzeHggZXhhbXBsZSB3aXRo
IE9DTUVNIHN1cHBvcnQ6Cj4gKwo+ICsvIHsKPiArCS4uLgo+ICsKPiArCWdwdTogYWRyZW5vQGZk
YjAwMDAwIHsKPiArCQljb21wYXRpYmxlID0gInFjb20sYWRyZW5vLTMzMC4yIiwKPiArCQkgICAg
ICAgICAgICAgInFjb20sYWRyZW5vIjsKPiArCQlyZWcgPSA8MHhmZGIwMDAwMCAweDEwMDAwPjsK
PiArCQlyZWctbmFtZXMgPSAia2dzbF8zZDBfcmVnX21lbW9yeSI7Cj4gKwkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDMzIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCWludGVycnVwdC1uYW1lcyA9
ICJrZ3NsXzNkMF9pcnEiOwo+ICsJCWNsb2NrLW5hbWVzID0gImNvcmUiLAo+ICsJCSAgICAgICAg
ICAgICAgImlmYWNlIiwKPiArCQkgICAgICAgICAgICAgICJtZW1faWZhY2UiOwo+ICsJCWNsb2Nr
cyA9IDwmbW1jYyBPWElMSV9HRlgzRF9DTEs+LAo+ICsJCSAgICAgICAgIDwmbW1jYyBPWElMSUNY
X0FIQl9DTEs+LAo+ICsJCSAgICAgICAgIDwmbW1jYyBPWElMSUNYX0FYSV9DTEs+Owo+ICsJCW9j
bWVtID0gPCZvY21lbT47Cj4gKwkJcG93ZXItZG9tYWlucyA9IDwmbW1jYyBPWElMSUNYX0dEU0M+
Owo+ICsJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdwdV9vcHBfdGFibGU+Owo+ICsJCWlvbW11
cyA9IDwmZ3B1X2lvbW11IDA+Owo+ICsJfTsKPiArCj4gKwlvY21lbTogb2NtZW1AZmRkMDAwMDAg
ewo+ICsJCWNvbXBhdGlibGUgPSAicWNvbSxtc204OTc0LW9jbWVtIjsKPiArCj4gKwkJcmVnID0g
PDB4ZmRkMDAwMDAgMHgyMDAwPiwKPiArCQkgICAgICA8MHhmZWMwMDAwMCAweDE4MDAwMD47Cj4g
KwkJcmVnLW5hbWVzID0gImN0cmwiLAo+ICsJCSAgICAgICAgICAgICAibWVtIjsKPiArCj4gKwkJ
Y2xvY2tzID0gPCZycG1jYyBSUE1fU01EX09DTUVNR1hfQ0xLPiwKPiArCQkgICAgICAgICA8Jm1t
Y2MgT0NNRU1DWF9PQ01FTU5PQ19DTEs+Owo+ICsJCWNsb2NrLW5hbWVzID0gImNvcmUiLAo+ICsJ
CSAgICAgICAgICAgICAgImlmYWNlIjsKPiArCj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
KwkJI3NpemUtY2VsbHMgPSA8MT47Cj4gKwo+ICsJCWdtdS1zcmFtQDAgewo+ICsJCQlyZWcgPSA8
MHgwIDB4MTAwMDAwPjsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiAtLSAKPiAyLjIwLjEKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
