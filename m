Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69D2A1771
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 13:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2296E214;
	Sat, 31 Oct 2020 12:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4DA6E214
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:44:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g12so9275522wrp.10
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 05:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IR5TWVh/PM8cmgKLWET7kM8jaE+hyDMzn6+0+c1GNUE=;
 b=fAB3SxCQNfEUCnjAgCWgm9CbtUy5Nd+3q0YPosvNkSHqVSdKSBHwB3/tny/avCZbut
 SiMkDFgciW5ZjfwJH7q5WLQiaITTlhWkL08oao8qL4CUsoOaKWwt4ETIqL5GlHk/CBq+
 zqPoIBS2otU+kMr22G2OOMA7oFiu4+/xLHZgqdu22WgrL1U4zyWmMdvj8sxKbHu33jYW
 M2LFBpBvoh0gvYzkxQfYNOBuz7i47blYsQd84ZXRKycKrPaUQEJKXfJaXb6qEDNg0SNJ
 KgxO9TygXCS24V5mTpJC2rrjQUzhzxOx1lnu/w1QH00/eBri8Pm3vYMNlRFQ97ha4sYX
 163Q==
X-Gm-Message-State: AOAM530de+nw8f7RmN9oNAjsy5z7O7GcUCZeq6uH7JrJXbBoRbpXFw6X
 WTOHYc7duX7a6YN4b1ssE5I=
X-Google-Smtp-Source: ABdhPJyNFPLhOwZHLatq0yb281uqv5It6hSSKp564zq6To39BLY7zNY0fFgwUyWFccY2+oiiolmIFw==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr8755737wro.381.1604148258750; 
 Sat, 31 Oct 2020 05:44:18 -0700 (PDT)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id g14sm14745459wrx.22.2020.10.31.05.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 05:44:16 -0700 (PDT)
Date: Sat, 31 Oct 2020 13:44:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v7 6/6] drm: exynos: mixer: Add interconnect support
Message-ID: <20201031124415.GD9399@kozik-lap>
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125308eucas1p14ae969ae1d5549d422c478aa54d3311e@eucas1p1.samsung.com>
 <20201030125149.8227-7-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030125149.8227-7-s.nawrocki@samsung.com>
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

T24gRnJpLCBPY3QgMzAsIDIwMjAgYXQgMDE6NTE6NDlQTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBpbnRlcmNvbm5lY3Qgc3VwcG9ydCB0byBleHlu
b3MtbWl4ZXIuIFRoZSBtaXhlciB3b3Jrcwo+IHRoZSBzYW1lIGFzIGJlZm9yZSB3aGVuIENPTkZJ
R19JTlRFUkNPTk5FQ1QgaXMgJ24nLgo+IAo+IEZvciBwcm9wZXIgb3BlcmF0aW9uIG9mIHRoZSB2
aWRlbyBtaXhlciBibG9jayB3ZSBuZWVkIHRvIGVuc3VyZSB0aGUKPiBpbnRlcmNvbm5lY3QgYnVz
c2VzIGxpa2UgRE1DIG9yIExFRlRCVVMgcHJvdmlkZSBlbm91Z2ggYmFuZHdpZHRoIHNvCj4gYXMg
dG8gYXZvaWQgRE1BIGJ1ZmZlciB1bmRlcnJ1bnMgaW4gdGhlIG1peGVyIGJsb2NrLiBJLmUgd2Ug
bmVlZCB0bwo+IHByZXZlbnQgdGhvc2UgYnVzc2VzIGZyb20gb3BlcmF0aW5nIGluIGxvdyBwZXJm
b21hbmNlIE9QUHMgd2hlbgo+IHRoZSBtaXhlciBpcyBydW5uaW5nLgo+IEluIHRoaXMgcGF0Y2gg
dGhlIGJ1cyBiYW5kd2lkdGggcmVxdWVzdCBpcyBkb25lIHRocm91Z2ggdGhlIGludGVyY29ubmVj
dAo+IEFQSSwgdGhlIGJhbmR3aWR0aCB2YWx1ZSBpcyBjYWxjdWxhdGVkIGZyb20gc2VsZWN0ZWQg
RFJNIG1vZGUsIGkuZS4KPiB2aWRlbyBwbGFuZSB3aWR0aCwgaGVpZ2h0LCByZWZyZXNoIHJhdGUg
YW5kIHBpeGVsIGZvcm1hdC4KPiAKPiBUaGUgYmFuZHdpZHRoIHNldHRpbmcgaXMgc3luY2hyb25p
emVkIHdpdGggVlNZTkMgd2hlbiB3ZSBhcmUgc3dpdGNoaW5nCj4gdG8gbG93ZXIgYmFuZHdpZHRo
LiBUaGlzIGlzIHJlcXVpcmVkIHRvIGVuc3VyZSBlbm91Z2ggYmFuZHdpZHRoIGZvcgo+IHRoZSBk
ZXZpY2Ugc2luY2UgbmV3IHNldHRpbmdzIGFyZSBub3JtYWxseSBiZWluZyBhcHBsaWVkIGluIHRo
ZSBoYXJkd2FyZQo+IHN5bmNocm9ub3VzbHkgd2l0aCBWU1lOQy4KPiAKPiBDby1kZXZlbG9wZWQt
Ynk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+
IENoYW5nZXMgZm9yIHY3Ogo+ICAtIGZpeGVkIGluY29ycmVjdCBzZXR0aW5nIG9mIHRoZSBJQ0Mg
YmFuZHdpZHRoIHdoZW4gdGhlIG1peGVyIGlzCj4gICAgZGlzYWJsZWQsIG5vdyB0aGUgYmFuZHdp
ZHRoIGlzIHNldCBleHBsaWNpdGx5IHRvIDAgaW4gc3VjaCBjYXNlLgo+IAo+IENoYW5nZXMgZm9y
IHY2Ogo+ICAtIHRoZSBpY2Nfc2V0X2J3KCkgY2FsbCBpcyBub3cgb25seSBkb25lIHdoZW4gY2Fs
Y3VsYXRlZCB2YWx1ZSBmb3IKPiAgICBhIGNydGMgY2hhbmdlcywgdGhpcyBhdm9pZHMgdW5uZWNl
c3NhcnkgY2FsbHMgcGVyIGVhY2ggdmlkZW8gZnJhbWUKPiAgLSBhZGRlZCBzeW5jaHJvbml6YXRp
b24gb2YgdGhlIGludGVyY29ubmVjdCBiYW5kd2lkdGggc2V0dGluZyB3aXRoCj4gICAgdGhlIG1p
eGVyIFZTWU5DIGluIG9yZGVyIHRvIGF2b2lkIGJ1ZmZlciB1bmRlcmZsb3cgd2hlbiB3ZSBsb3dl
cgo+ICAgIHRoZSBpbnRlcmNvbm5lY3QgYmFuZHdpZHRoIHdoZW4gdGhlIGhhcmR3YXJlIHN0aWxs
IG9wZXJhdGVzIHdpdGgKPiAgICBwcmV2aW91cyBtb2RlIHNldHRpbmdzIHRoYXQgcmVxdWlyZSBo
aWdoZXIgYmFuZHdpZHRoLiBUaGlzIGZpeGVkCj4gICAgSU9NTVUgZmF1bHRzIG9ic2VydmVkIGUu
Zy4gZHVyaW5nIHN3aXRjaGluZyBmcm9tIHR3byBwbGFuZXMgdG8KPiAgICBhIHNpbmdsZSBwbGFu
ZSBvcGVyYXRpb24uCj4gCj4gQ2hhbmdlcyBmb3IgdjU6Cj4gIC0gcmVuYW1lZCBzb2NfcGF0aCB2
YXJpYWJsZSB0byBpY2NfcGF0aAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19taXhlci5jIHwgMTQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAoKQWNrZWQt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
