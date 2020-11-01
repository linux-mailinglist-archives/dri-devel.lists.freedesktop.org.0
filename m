Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E573C2A2061
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584A6EB24;
	Sun,  1 Nov 2020 17:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DDA6EABC
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:23:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m16so12234364ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UJWXSV/byzpJ/dAkzSzpKv1rnP3tZ95JumBWaAzgzVg=;
 b=dpBXaXhAye4AWtxNEU3nOqfpMAPeRpRWW1Tq0vRsTxGXBIlfA8RcBVx8XJbgPhwyb/
 EE+fbcVeOhDL1N7EFXRtu+Y4g+nI0hdZHyoDHsrT8mTj3RVyR3q7wbFKTo48t85Y9rS4
 4/SYK54PJtZyaSyyNMsJ7ftkmXRy5TIBZ/rGClDrolOczWxfDeicXrvFmJPx4z7jvCop
 lu0QvvjIFdhEcOqUPqPo6+GcY0EwEDlB4SbTCFymaMHR/stKQKbhjsqx/iWEHz319hX7
 lLmwP2IRHe+fLs2jhD4nIGHinFhT5rdC3dj2FwZVHJJX3XgnwTw2MsEnxMljvxzJ+QeW
 JhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UJWXSV/byzpJ/dAkzSzpKv1rnP3tZ95JumBWaAzgzVg=;
 b=B3yGYTxPkDXRrBOKcfi1MVfXhevCkrmiJy1B8rekRxLZWV3bWCZ+rFpS4f/+YIVmLx
 ixCJn7/vG06Mjfu1DXQ6k5dt5aqA91tk/RubeF/MZS5EuGOlR/HVwRlmrIMEqblKHqbW
 rdXpRp9P8uFesq4wlogIjK5E/ymwTGwKVL0nekaM+ikHhdh4NF5oMTQkrsDUPzOIMxdv
 C88jOOFhJ+hg5aUfzCJq+HawtPOrrVz9s4nGw0si16NFxgzeieslovRK3FIKr9m8oReU
 kGK3ckr6nlImQI9oG6wT+twek2JRM/hsvm2o2j76SpwZ/6LRqsobUHLwhI3C80ouayUv
 jyJQ==
X-Gm-Message-State: AOAM532h9JIud29OX/835Mcm+7We2x6dZG+1g+i3wUK6zObzmiMYvpl7
 4RQrhWLzb4zpPprKN1ooAe4=
X-Google-Smtp-Source: ABdhPJxCwsQlLUEFvF+PCd4/pydRuDnXNRIL971/glUN01Nke41XdCmtnxxMDqozuQVO6vhbZQb5DQ==
X-Received: by 2002:a2e:9a43:: with SMTP id k3mr5306932ljj.69.1604244211796;
 Sun, 01 Nov 2020 07:23:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id x13sm93101lfr.26.2020.11.01.07.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 07:23:31 -0800 (PST)
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ebd184c-60e8-19e2-9965-19481ced1c70@gmail.com>
Date: Sun, 1 Nov 2020 18:23:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTEuMjAyMCAxNzozOSwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDc6MjIgQU0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBwYXRjaCBtb3ZlcyBBQ1RNT04gZHJpdmVy
IGF3YXkgZnJvbSBnZW5lcmF0aW5nIE9QUCB0YWJsZSBieSBpdHNlbGYsCj4+IHRyYW5zaXRpb25p
bmcgaXQgdG8gdXNlIHRoZSB0YWJsZSB3aGljaCBjb21lcyBmcm9tIGRldmljZS10cmVlLiBUaGlz
Cj4+IGNoYW5nZSBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIGRldmljZS10cmVlcyBp
biBvcmRlciB0byBicmluZwo+PiBzdXBwb3J0IGZvciB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29y
ayB0byB0aGUgZHJpdmVyLiBUaGlzIGlzIGEgbWFuZGF0b3J5Cj4+IGNoYW5nZSB3aGljaCBuZWVk
cyB0byBiZSBkb25lIGluIG9yZGVyIHRvIGltcGxlbWVudCBpbnRlcmNvbm5lY3QtYmFzZWQKPj4g
bWVtb3J5IERWRlMuIFVzZXJzIG9mIGxlZ2FjeSBkZXZpY2UtdHJlZXMgd2lsbCBnZXQgYSBtZXNz
YWdlIHRlbGxpbmcgdGhhdAo+PiB0aGVpcnMgRFQgbmVlZHMgdG8gYmUgdXBncmFkZWQuIE5vdyBB
Q1RNT04gaXNzdWVzIG1lbW9yeSBiYW5kd2lkdGggcmVxdWVzdAo+PiB1c2luZyBkZXZfcG1fb3Bw
X3NldF9idygpLCBpbnN0ZWFkIG9mIGRyaXZpbmcgRU1DIGNsb2NrIHJhdGUgZGlyZWN0bHkuCj4+
Cj4+IFRlc3RlZC1ieTogUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4KPj4gVGVzdGVk
LWJ5OiBOaWNvbGFzIENoYXV2ZXQgPGt3aXphcnRAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQouLi4KPj4gIHN0YXRp
YyBpbnQgdGVncmFfZGV2ZnJlcV9nZXRfZGV2X3N0YXR1cyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+
IEBAIC02NTUsNyArNjQzLDcgQEAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX2dldF9kZXZfc3Rh
dHVzKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gICAgICAgICBzdGF0LT5wcml2YXRlX2RhdGEgPSB0
ZWdyYTsKPj4KPj4gICAgICAgICAvKiBUaGUgYmVsb3cgYXJlIHRvIGJlIHVzZWQgYnkgdGhlIG90
aGVyIGdvdmVybm9ycyAqLwo+PiAtICAgICAgIHN0YXQtPmN1cnJlbnRfZnJlcXVlbmN5ID0gY3Vy
X2ZyZXE7Cj4+ICsgICAgICAgc3RhdC0+Y3VycmVudF9mcmVxdWVuY3kgPSBjdXJfZnJlcSAqIEtI
WjsKPiAKPiBJIGNhbid0IGZpbmQgYW55IGNoYW5nZSByZWxhdGVkIHRvIHRoZSBmcmVxdWVuY3kg
dW5pdCBvbiB0aGlzIHBhdGNoLgo+IERvIHlvdSBmaXggdGhlIHByZXZpb3VzIGJ1ZyBvZiB0aGUg
ZnJlcXVlbmN5IHVuaXQ/CgpQcmV2aW91c2x5LCBPUFAgZW50cmllcyB0aGF0IHdlcmUgZ2VuZXJh
dGVkIGJ5IHRoZSBkcml2ZXIgdXNlZCBLSHoKdW5pdHMuIE5vdywgT1BQIGVudHJpZXMgYXJlIGNv
bWluZyBmcm9tIGEgZGV2aWNlLXRyZWUgYW5kIHRoZXkgaGF2ZSBIegp1bml0cy4gVGhpcyBkcml2
ZXIgb3BlcmF0ZXMgd2l0aCBLSHogaW50ZXJuYWxseSwgaGVuY2Ugd2UgbmVlZCB0bwpjb252ZXJ0
IHRoZSB1bml0cyBub3cuCgo+Pgo+PiAgICAgICAgIGFjdG1vbl9kZXYgPSAmdGVncmEtPmRldmlj
ZXNbTUNBTExdOwo+Pgo+PiBAQCAtNzA1LDcgKzY5Myw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZ292
ZXJub3JfZ2V0X3RhcmdldChzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcSwKPj4gICAgICAgICAgICAg
ICAgIHRhcmdldF9mcmVxID0gbWF4KHRhcmdldF9mcmVxLCBkZXYtPnRhcmdldF9mcmVxKTsKPj4g
ICAgICAgICB9Cj4+Cj4+IC0gICAgICAgKmZyZXEgPSB0YXJnZXRfZnJlcTsKPj4gKyAgICAgICAq
ZnJlcSA9IHRhcmdldF9mcmVxICogS0haOwo+IAo+IGRpdHRvLgo+IAo+Pgo+PiAgICAgICAgIHJl
dHVybiAwOwo+PiAgfQo+PiBAQCAtNzczLDEzICs3NjEsMjIgQEAgc3RhdGljIHN0cnVjdCBkZXZm
cmVxX2dvdmVybm9yIHRlZ3JhX2RldmZyZXFfZ292ZXJub3IgPSB7Cj4+Cj4+ICBzdGF0aWMgaW50
IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gIHsK
Pj4gKyAgICAgICB1MzIgaHdfdmVyc2lvbiA9IEJJVCh0ZWdyYV9za3VfaW5mby5zb2Nfc3BlZWRv
X2lkKTsKPj4gICAgICAgICBzdHJ1Y3QgdGVncmFfZGV2ZnJlcV9kZXZpY2UgKmRldjsKPj4gICAg
ICAgICBzdHJ1Y3QgdGVncmFfZGV2ZnJlcSAqdGVncmE7Cj4+ICsgICAgICAgc3RydWN0IG9wcF90
YWJsZSAqb3BwX3RhYmxlOwo+PiAgICAgICAgIHN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwo+PiAg
ICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiAgICAgICAgIGxvbmcgcmF0ZTsKPj4gICAgICAgICBp
bnQgZXJyOwo+Pgo+PiArICAgICAgIC8qIGxlZ2FjeSBkZXZpY2UtdHJlZXMgZG9uJ3QgaGF2ZSBP
UFAgdGFibGUgYW5kIG11c3QgYmUgdXBkYXRlZCAqLwo+PiArICAgICAgIGlmICghZGV2aWNlX3By
b3BlcnR5X3ByZXNlbnQoJnBkZXYtPmRldiwgIm9wZXJhdGluZy1wb2ludHMtdjIiKSkgewo+PiAr
ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiT1BQIHRhYmxlIG5vdCBmb3VuZCwg
Y2Fubm90IGNvbnRpbnVlXG4iKTsKPj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRl
diwgInBsZWFzZSB1cGRhdGUgeW91ciBkZXZpY2UgdHJlZVxuIik7Cj4+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsKPj4gKyAgICAgICB9Cj4gCj4gQXMgeW91IG1lbnRpb25lZCwgaXQg
YnJlYWtzIHRoZSBvbGQgZHRiLiBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIGltcHJvdmluZwo+IHRo
ZSBkcml2ZXIuIEluc3RlYWQsIHlvdSBuZWVkIGNvbmZpcm1hdGlvbiBmcm9tIHRoZSBEZXZpY2V0
cmVlIG1haW50YWluZXIuCgpPbGRlciBEVEJzIHdpbGwgY29udGludWUgdG8gd29yaywgYnV0IGRl
dmZyZXEgZHJpdmVyIHdvbid0LiBXZSBhbHJlYWR5CmRpZCB0aGlzIGZvciBvdGhlciBUZWdyYSBk
cml2ZXJzIGJlZm9yZSAoQ1BVRlJFUSBkcml2ZXIgZm9yIGV4YW1wbGUpIGFuZApSb2IgSGVycmlu
ZyBjb25maXJtZWQgdGhhdCB0aGVyZSBpcyBubyBwcm9ibGVtIGhlcmUuCgo+IEFuZCwKPiBJIHJl
Y29tbWVuZCB0aGF0IHlvdSB1c2UgZGV2X3BtX29wcF9vZl9nZXRfb3BwX2Rlc2Nfbm9kZSgmcGRl
di0+ZGV2KQo+IHRvIGNoZWNrIHdoZXRoZXIgYSBkZXZpY2UgY29udGFpbnMgb3BwLXRhYmxlIG9y
IG5vdC4KCkknbSBub3Qgc3VyZSB3aGF0IGFyZSB0aGUgYmVuZWZpdHMsIHRoaXMgd2lsbCBtYWtl
IGNvZGUgbGVzcwpleHByZXNzaXZlL3JlYWRhYmxlIGFuZCB3ZSB3aWxsIG5lZWQgdG8gYWRkIGV4
dHJhIG9mX25vZGVfcHV0KCksIHdoaWNoCmRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCkgaGFuZGxl
cyBmb3IgdXMuCgpDb3VsZCB5b3UgcGxlYXNlIGdpdmUgdGhlIHJhdGlvbmFsZT8KCj4+ICsKPj4g
ICAgICAgICB0ZWdyYSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnRlZ3JhKSwg
R0ZQX0tFUk5FTCk7Cj4+ICAgICAgICAgaWYgKCF0ZWdyYSkKPj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOwo+PiBAQCAtODIxLDExICs4MTgsMjkgQEAgc3RhdGljIGludCB0ZWdyYV9k
ZXZmcmVxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgICAgICAgICAg
ICAgICByZXR1cm4gZXJyOwo+PiAgICAgICAgIH0KPj4KPj4gKyAgICAgICB0ZWdyYS0+b3BwX3Rh
YmxlID0gZGV2X3BtX29wcF9nZXRfb3BwX3RhYmxlKCZwZGV2LT5kZXYpOwo+PiArICAgICAgIGlm
IChJU19FUlIodGVncmEtPm9wcF90YWJsZSkpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHRlZ3JhLT5vcHBfdGFibGUpLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBwcmVwYXJlIE9QUCB0
YWJsZVxuIik7Cj4gCj4gQXMgSSBrbmV3LCBlYWNoIGRldmljZSBjYW4gY29udGFpbiB0aGUgb3Bw
X3RhYmxlIG9uIGRldmljZXRyZWUuCj4gSXQgbWVhbnMgdGhhdCBvcHBfdGFibGUgaGFzIG5vdCBk
ZXBlbmRlZCB0byBhbm90aGVyIGRldmljZSBkcml2ZXIuCj4gRGlkIHlvdSBzZWUgdGhpcyBleGNl
cHRpb24gY2FzZSB3aXRoIEVQUk9CRV9ERUZFUiBlcnJvcj8KCk9QUCBjb3JlIHdpbGwgdHJ5IHRv
IGdyYWIgdGhlIGNsb2NrIHJlZmVyZW5jZSBmb3IgdGhlIHRhYmxlIGFuZCBpdCBtYXkKY2F1c2Ug
RVBST0JFX0RFRkVSLiBBbHRob3VnaCwgaXQgc2hvdWxkbid0IGhhcHBlbiBoZXJlIGJlY2F1c2Ug
d2UgaGF2ZQpkZXZtX2Nsa19nZXQoKSBiZWZvcmUgdGhlIGdldF9vcHBfdGFibGUoKSwgaGVuY2Ug
c2VlbXMgdGhlIGRlZmVycmVkCnByb2JlIGluZGVlZCBzaG91bGRuJ3QgaGFwcGVuIGluIHRoaXMg
Y2FzZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
