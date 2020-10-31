Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9362A1742
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 13:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E4D6E20F;
	Sat, 31 Oct 2020 12:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA0F6E20F
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:17:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w23so5110677wmi.4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 05:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WKzF1aaYbnVmrdWhOCJIvuCVQXHEwFndydQ7LCQLM48=;
 b=itrPa9nR6XosHTVZUuvJlqegggME6ZTxn7UPMZY6licJhcNmJ3AhqpUN8dmkqkYgPE
 Sc82tR2ZtcfDllkmN5v3lAJps/LBXlyvlLLYS8zbr+G9VRuTwZ3AEr+si+yyKlDcPeWi
 P5tu6c4WCZLE+Ht9t8PKiHCLfDAIOm7hLyYqaU5d5TR8WVRZV4PSb1qt7GF/3mRy1T0w
 giAV5sjO48pBYA4cuIlh0VdzcXZpdADlMR/xsZ0Wl+rOkoqR3IdfcMZd6+V1sES8PyFS
 Q9J3j2tChEGwmtt6ABP/M8Oo/M7Fi5vFwofseMT3xpoeM3m+ZgzcPKWTRvls0akwsACa
 hDUA==
X-Gm-Message-State: AOAM530VWhmoaGnnf7A65tkFK48sCvQ6D4Tfj/BGv95llEwy3KM2jk30
 cTnyVUB36NA/tdOatUkLpTI=
X-Google-Smtp-Source: ABdhPJxtVxlOWJenfMblp90f/+WbEdzV8cTky1eQNG/79J3aKlrJViN3Ma99nExe5hJCGVj0D/9hNw==
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr2090447wma.91.1604146670479; 
 Sat, 31 Oct 2020 05:17:50 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id r18sm15981833wrj.50.2020.10.31.05.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 05:17:49 -0700 (PDT)
Date: Sat, 31 Oct 2020 13:17:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 2/6] interconnect: Add generic interconnect driver for
 Exynos SoCs
Message-ID: <20201031121747.GB9399@kozik-lap>
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9@eucas1p2.samsung.com>
 <20201030125149.8227-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030125149.8227-3-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMDE6NTE6NDVQTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIGdlbmVyaWMgaW50ZXJjb25uZWN0IGRyaXZl
ciBmb3IgRXh5bm9zIFNvQ3MgaW4gb3JkZXIKPiB0byBwcm92aWRlIGludGVyY29ubmVjdCBmdW5j
dGlvbmFsaXR5IGZvciBlYWNoICJzYW1zdW5nLGV4eW5vcy1idXMiCj4gY29tcGF0aWJsZSBkZXZp
Y2UuCj4gCj4gVGhlIFNvQyB0b3BvbG9neSBpcyBhIGdyYXBoIChvciBtb3JlIHNwZWNpZmljYWxs
eSwgYSB0cmVlKSBhbmQgaXRzCj4gZWRnZXMgYXJlIHNwZWNpZmllZCB1c2luZyB0aGUgJ3NhbXN1
bmcsaW50ZXJjb25uZWN0LXBhcmVudCcgaW4gdGhlCj4gRFQuIER1ZSB0byB1bnNwZWNpZmllZCBy
ZWxhdGl2ZSBwcm9iaW5nIG9yZGVyLCAtRVBST0JFX0RFRkVSIG1heSBiZQo+IHByb3BhZ2F0ZWQg
dG8gZW5zdXJlIHRoYXQgdGhlIHBhcmVudCBpcyBwcm9iZWQgYmVmb3JlIGl0cyBjaGlsZHJlbi4K
PiAKPiBFYWNoIGJ1cyBpcyBub3cgYW4gaW50ZXJjb25uZWN0IHByb3ZpZGVyIGFuZCBhbiBpbnRl
cmNvbm5lY3Qgbm9kZSBhcwo+IHdlbGwgKGNmLiBEb2N1bWVudGF0aW9uL2ludGVyY29ubmVjdC9p
bnRlcmNvbm5lY3QucnN0KSwgaS5lLiBldmVyeSBidXMKPiByZWdpc3RlcnMgaXRzZWxmIGFzIGEg
bm9kZS4gTm9kZSBJRHMgYXJlIG5vdCBoYXJkY29kZWQgYnV0IHJhdGhlcgo+IGFzc2lnbmVkIGR5
bmFtaWNhbGx5IGF0IHJ1bnRpbWUuIFRoaXMgYXBwcm9hY2ggYWxsb3dzIGZvciB1c2luZyB0aGlz
Cj4gZHJpdmVyIHdpdGggdmFyaW91cyBFeHlub3MgU29Dcy4KPiAKPiBGcmVxdWVuY2llcyByZXF1
ZXN0ZWQgdmlhIHRoZSBpbnRlcmNvbm5lY3QgQVBJIGZvciBhIGdpdmVuIG5vZGUgYXJlCj4gcHJv
cGFnYXRlZCB0byBkZXZmcmVxIHVzaW5nIGRldl9wbV9xb3NfdXBkYXRlX3JlcXVlc3QoKS4gUGxl
YXNlIG5vdGUKPiB0aGF0IGl0IGlzIG5vdCBhbiBlcnJvciB3aGVuIENPTkZJR19JTlRFUkNPTk5F
Q1QgaXMgJ24nLCBpbiB3aGljaAo+IGNhc2UgYWxsIGludGVyY29ubmVjdCBBUEkgZnVuY3Rpb25z
IGFyZSBuby1vcC4KPiAKPiBUaGUgYnVzLXdpZHRoIERUIHByb3BlcnR5IGlzIHRvIGRldGVybWlu
ZSB0aGUgaW50ZXJjb25uZWN0IGRhdGEKPiB3aWR0aCBhbmQgdHJhc2xhdGUgcmVxdWVzdGVkIGJh
bmR3aWR0aCB0byBjbG9jayBmcmVxdWVuY3kgZm9yIGVhY2gKPiBidXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFN5bHdlc3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiBD
aGFuZ2VzIGZvciB2NzoKPiAgLSBhZGp1c3RlZCB0byB0aGUgRFQgcHJvcGVydHkgY2hhbmdlczog
ImludGVyY29ubmVjdHMiIGluc3RlYWQKPiAgICBvZiAic2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFy
ZW50IiwgInNhbXN1bmcsZGF0YS1jbGstcmF0aW8iCj4gICAgaW5zdGVhZCBvZiAiYnVzLXdpZHRo
IiwKPiAgLSBhZGFwdGF0aW9uIHRvIG9mX2ljY19nZXRfZnJvbV9wcm92aWRlcigpIGZ1bmN0aW9u
IGNoYW5nZXMKPiAgICBpbiB2NS4xMC1yYzEuCj4gCj4gQ2hhbmdlcyBmb3IgdjY6Cj4gIC0gY29y
cmVjdGVkIG9mX25vZGUgZGVyZWZlcmVuY2luZyBpbiBleHlub3NfaWNjX2dldF9wYXJlbnQoKQo+
ICAgIGZ1bmN0aW9uLAo+ICAtIGNvcnJlY3RlZCBpbml0aWFsaXphdGlvbiBvZiBpY2Nfbm9kZS0+
bmFtZSBzbyBhcyB0byBhdm9pZAo+ICAgIGRpcmVjdCBvZl9ub2RlLT5uYW1lIGRlcmVmZXJlbmNp
bmcsCj4gIC0gYWRkZWQgcGFyc2luZyBvZiBidXMtd2lkdGggRFQgcHJvcGVydHkuCj4gCj4gQ2hh
bmdlcyBmb3IgdjU6Cj4gIC0gYWRqdXN0IHRvIHJlbmFtZWQgZXh5bm9zLGludGVyY29ubmVjdC1w
YXJlbnQtbm9kZSBwcm9wZXJ0eSwKPiAgLSB1c2UgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgcGxh
dGZvcm0gZGV2aWNlIGlkIGFzIHRoZSBpbnRlcmNvbmVjdAo+ICAgIG5vZGUgaWQgaW5zdGVhZCBv
ZiBhIG5vdyB1bmF2YWlsYWJsZSBkZXZmcmVxLT5pZCBmaWVsZCwKPiAgLSBhZGQgaWNjXyBwcmVm
aXggdG8gc29tZSB2YXJpYWJsZXMgdG8gbWFrZSB0aGUgY29kZSBtb3JlIHNlbGYtY29tbWVudGlu
ZywKPiAgLSB1c2UgaWNjX25vZGVzX3JlbW92ZSgpIGluc3RlYWQgb2YgaWNjX25vZGVfZGVsKCkg
KyBpY2Nfbm9kZV9kZXN0cm95KCksCj4gIC0gYWRqdXN0IHRvIGV4eW5vcyxpbnRlcmNvbm5lY3Qt
cGFyZW50LW5vZGUgcHJvcGVydHkgcmVuYW1lIHRvCj4gICAgc2Ftc3VuZyxpbnRlcmNvbm5lY3Qt
cGFyZW50LAo+ICAtIGNvbnZlcnRlZCB0byBhIHNlcGFyYXRlIHBsYXRmb3JtIGRyaXZlciBpbiBk
cml2ZXJzL2ludGVyY29ubmVjdC4KPiAKPiAtLS0KPiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvS2Nv
bmZpZyAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvTWFrZWZpbGUgICAg
ICAgIHwgICAxICsKPiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvZXh5bm9zL0tjb25maWcgIHwgICA2
ICsrCj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L2V4eW5vcy9NYWtlZmlsZSB8ICAgNCArCj4gIGRy
aXZlcnMvaW50ZXJjb25uZWN0L2V4eW5vcy9leHlub3MuYyB8IDE5OCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwoKSG93IGFib3V0IG5hbWluZyB0aGUgZGlyZWN0b3J5IGFzICJz
YW1zdW5nIj8gSSBkb24ndCBleHBlY3QgaW50ZXJjb25uZWN0CmRyaXZlcnMgZm9yIHRoZSBvbGQg
U2Ftc3VuZyBTM0Mgb3IgUzVQIHBsYXRmb3JtcywgYnV0IGl0IHdvdWxkIGJlCmNvbnNpc3Rlbnkg
d2l0aCBvdGhlciBuYW1lcyAobWVtb3J5LCBjbGssIHBpbmN0cmwpLgoKSG93IGFib3V0IGFkZGlu
ZyBzZXBhcmF0ZSBtYWludGFpbmVycyBlbnRyeSBmb3IgdGhlIGRyaXZlciB3aXRoIHlvdSBhbmQK
QXJ0dXIgKGlmIGhlIHN0aWxsIHdvcmtzIG9uIHRoaXMpPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
