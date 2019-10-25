Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C7E574D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 01:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E1889760;
	Fri, 25 Oct 2019 23:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3B89760
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 23:55:48 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 53so3223701otv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bavwoMbGp2ZbOAShRh7tu/QewKhCcWH09wWdF5PAI4Q=;
 b=XAstAm2BEgpzlm8duYHhgU34q0ZG5/7Tgsj2/jK4++3A3fqTQvBz2xBLudsnYdwOt0
 FxMPcRaCfvHpn5SA7OZY5T/1JiOm+unYoi9bhYUOvErFtFtAHwDHj75r7i9WTSShl6vE
 ZYYGFsDio7WaAgkbAnyvZXfzJOR7IkoiATzkcfL4UW1HksD0SdrwGc8D4p9c3tc+8kJN
 oafHyaXLlLGW42o5GGDSUPlTKwEDYjWEJAz1qwLYr+i+FYcge2OjiD8NCPLqKM/pJIcg
 qwjoOYHi0uvJtyw0fcRgVx+eYMJLBGoQ5zllgdGWHJlyKgZc8rmwxgdw2FO2i+bJTAAJ
 5mxA==
X-Gm-Message-State: APjAAAWmVy6Yj7plOC1n23qghZihNnqn3Znb5Cz2L8JbW7U2ijBmXRAu
 ZrDg/l+ccg1pP5GMIgQYs3FQlKcrkPlN1MLU2sFkDA==
X-Google-Smtp-Source: APXvYqzmWunWZWTVqRSjMMjfEk3yr/qNebANIiJ/fhlGDJs30pR3QtZm9HsSzRsTtyD3E8yDfpqiMxINqquNJ5NEpR8=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr4918230otk.332.1572047747538; 
 Fri, 25 Oct 2019 16:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191025225009.50305-1-john.stultz@linaro.org>
 <20191025225009.50305-2-john.stultz@linaro.org>
 <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
In-Reply-To: <CAC=3eda3sCMjCQbFX2Y0-6iVt-YRR7P_Y1ksJOsLw9CmJJRxbA@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 25 Oct 2019 16:55:35 -0700
Message-ID: <CALAqxLXG8LrWAQevEyj7BJ00CiAkodfgFMdCbuMRucO5w5yhKg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] dt-bindings: dma-buf: heaps: Describe CMA
 regions to be added to dmabuf heaps interface.
To: Rob Herring <rob.e.herring@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bavwoMbGp2ZbOAShRh7tu/QewKhCcWH09wWdF5PAI4Q=;
 b=dy6jrNNY1ljVcgOEysmnZ19k98bGr6k/qPsdysnwzwj0v4jrIUgmKmS5A/9AXik0Gn
 BLKBRrjkH/AG/p3Twxee5BF9UI7RQc35moYMrNhHTCkMMf4K8Dq8AYh+bm1wjpRktiM6
 e5jqk4vh2rqn2QwRDoiHKB75EWhb+XkK49jMZB8Qu+wPLVozmaW/uv2Amk7UT+ZuzU1X
 Ze2axCzDMbB+jhKur1SPDuG8S6uNcfdLfDlF28l499RRgbPndwJ1lCyO9J57EQEOB22E
 wa9Nh+ogc6fOXFT2FVAWWLs1s6plIKyItnA0gVgNFjLZPtZXauBJH/K367FvNuwrFW4g
 +16A==
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
 devicetree <devicetree@vger.kernel.org>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgNDozMiBQTSBSb2IgSGVycmluZyA8cm9iLmUuaGVycmlu
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgNTo1MSBQTSBK
b2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBi
aW5kaW5nIHNwZWNpZmllcyB3aGljaCBDTUEgcmVnaW9ucyBzaG91bGQgYmUgYWRkZWQgdG8gdGhl
Cj4gPiBkbWFidWYgaGVhcHMgaW50ZXJmYWNlLgo+Cj4gSXMgdGhpcyBhbiBJT04gRFQgYmluZGlu
ZyBpbiBkaXNndWlzZT8gSSB0aG91Z2h0IEkga2lsbGVkIHRoYXQuIDspCgpNYXliZT8gSSBtYXkg
bm90IGhhdmUgYmVlbiBwYXlpbmcgYXR0ZW50aW9uIGJhY2sgdGhlbi4gIDopCgo+ID4gK0V4YW1w
bGU6Cj4gPiArVGhpcyBleGFtcGxlIGhhcyBhIGNhbWVyYSBDTUEgbm9kZSBpbiByZXNlcnZlZCBt
ZW1vcnksIHdoaWNoIGlzIHRoZW4KPiA+ICtyZWZlcmVuY2VkIGJ5IHRoZSBkbWFidWYtaGVhcC1j
bWEgbm9kZS4KPiA+ICsKPiA+ICsKPiA+ICsgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiA+ICsg
ICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAgICByYW5nZXM7Cj4gPiArICAgICAg
ICAgICAgICAgLi4uCj4gPiArICAgICAgICAgICAgICAgY21hX2NhbWVyYTogY21hLWNhbWVyYSB7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9v
bCI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MjRDMDAwMDAgMHgw
IDB4NDAwMDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXVzYWJsZTsKPiA+ICsg
ICAgICAgICAgICAgICB9Owo+ID4gKyAgICAgICAgICAgICAgIC4uLgo+ID4gKyAgICAgICB9Owo+
ID4gKwo+ID4gKyAgICAgICBjbWFfaGVhcCB7Cj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJkbWFidWYtaGVhcC1jbWEiOwo+ID4gKyAgICAgICAgICAgICAgIG1lbW9yeS1yZWdpb24g
PSA8JmNtYV9jYW1lcmE+Owo+Cj4gV2h5IHRoZSBpbmRpcmVjdGlvbiBoZXJlPyBDYW4ndCB5b3Ug
anVzdCBhZGQgYSBmbGFnIHByb3BlcnR5IHRvCj4gcmVzZXJ2ZWQtbWVtb3J5IG5vZGVzIGxpa2Ug
d2UgZG8gdG8gZmxhZyBDTUEgbm9kZXM/CgpIYXBweSB0byB0cnkuIERvIHlvdSBtZWFuIGxpa2Ug
d2l0aCB0aGUgInJldWFzYWJsZSIgdGFnPyAgT3IgbW9yZSBsaWtlCnRoZSAibGludXgsY21hLWRl
ZmF1bHQiIHRhZz8KCkRvIHlvdSBoYXZlIGEgcHJlZmVyZW5jZSBmb3IgdGhlIGZsYWcgbmFtZSBo
ZXJlPwoKPiBBcyBJIHN1c3BlY3RlZCwgaXQncyBiZWNhdXNlIGluIHBhdGNoIDIgeW91J3JlIGp1
c3QgYWJ1c2luZyBEVCB0bwo+IGluc3RhbnRpYXRlIHBsYXRmb3JtIGRldmljZXMuIFdlIGFscmVh
ZHkgc3VwcG9ydCBiaW5kaW5nIGRyaXZlcnMgdG8KPiByZXNlcnZlZC1tZW1vcnkgbm9kZXMgZGly
ZWN0bHkuCgpTb3JyeSwgb25lIG9mIHRob3NlICJ3aGVuIGFsbCB5b3Uga25vdyBob3cgdG8gZG8g
aXMgaGFtbWVyLCBldmVyeXRoaW5nCmxvb2tzIGxpa2UgYSBuYWlsIiBpc3N1ZXMuCklzIHRoZXJl
IGEgc3BlY2lmaWMgZXhhbXBsZSBmb3IgYmluZGluZyBkcml2ZXJzIHRvIHJlc2VydmVkLW1lbW9y
eQpub2RlcyBJIGNhbiB0cnkgdG8gZm9sbG93PwoKQXBwcmVjaWF0ZSB0aGUgcmV2aWV3IGFuZCBm
ZWVkYmFjayEKCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
