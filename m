Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5317737F2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A02E6E63C;
	Wed, 24 Jul 2019 19:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4996E63C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:24:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so48133458wru.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lfXxMsdfj3/069jvw/iy7OsZv8+UN7ABTGl62C7QKYA=;
 b=APLFBvBK/5AVCrnIFg60AdiTDWYnOUU9pcfb9fpXx+tebiD494njyKoY42b7RWWdd5
 1WF0yyz76n56kTiFM68ybfksolZtISqiNicjaqYKPjDwWTnDXTPtgXOYqY4oHTxfIoFf
 CtodVVymSxFArv8Fnvfg4uV162WBEKO92fkByqaUDColyrRH7uBlcCb5bVPy2mQfT6OE
 lrOXqafKQxav0B4hP/TH2RkI4LX7e4rKQ2fjWokIkozan5iA++U14S7KhbweE64dcE/v
 gTvohYhHglPEgD8DnCgd2PM9RfM+z6yjWl/DS0eD1pWEtTEwWdxlWZ3cTHtd74HrdTWO
 YERw==
X-Gm-Message-State: APjAAAVBWOZxKseKsZVZqvXtTNASxiAzZRX63HVDblpbhJP+a1BXxm3B
 dkZNcZt5YHAixBUcVz8CfBU=
X-Google-Smtp-Source: APXvYqxsoh43HV2OpAyo0WN3mesXUKeJis1EeqQpdnzoRNCOZlfiNYz32Xds+Ra9u+/5tu5G/kpe4w==
X-Received: by 2002:adf:80e6:: with SMTP id 93mr51827758wrl.298.1563996269437; 
 Wed, 24 Jul 2019 12:24:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id o6sm91244088wra.27.2019.07.24.12.24.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:24:28 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:24:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
Message-ID: <20190724192426.GJ14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98@eucas1p2.samsung.com>
 <20190723122016.30279-9-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-9-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MTNQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIHR3byBmaWVsZHMgdHAgdGhlIEV4eW5vczQ0MTIgRFRT
OgoKdHAtPnRvCgo+ICAgLSBwYXJlbnQ6IHRvIGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2VlbiBu
b2RlcyB0aGF0IGFyZSBub3QgaW4gYQo+ICAgICBwYXJlbnQtY2hpbGQgcmVsYXRpb24gaW4gZGV2
ZnJlcTsKCklzIGl0IGEgc3RhbmRhcmQgcHJvcGVydHk/ClRoZSBleHBsYW5hdGlvbiBuZWVkcyBz
b21lIGltcHJvdmVtZW50Li4uIHdoeSBhcmUgeW91IGFkZGluZyBwYXJlbnQgdG8gYQpkZXZpY2Vz
IHdoaWNoIGFyZSBub3QgY2hpbGQtcGFyZW50PwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCj4g
ICAtICNpbnRlcmNvbm5lY3QtY2VsbHM6IHJlcXVpcmVkIGJ5IHRoZSBpbnRlcmNvbm5lY3QgZnJh
bWV3b3JrLgo+IAo+IFBsZWFzZSBub3RlIHRoYXQgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdh
eXMgemVybyBhbmQgbm9kZSBJRHMgYXJlIG5vdAo+IGhhcmRjb2RlZCBhbnl3aGVyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5zYW1zdW5nLmNv
bT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0
c2kgfCAxICsKPiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpICAgICAgICAgICAg
ICAgfCA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9u
LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+
IGluZGV4IGVhNTVmMzc3ZDE3Yy4uYmRkNjFhZTg2MTAzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpCj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiBAQCAtMTA2LDYgKzEwNiw3
IEBACj4gICZidXNfbGVmdGJ1cyB7Cj4gIAlkZXZmcmVxLWV2ZW50cyA9IDwmcHBtdV9sZWZ0YnVz
XzM+LCA8JnBwbXVfcmlnaHRidXNfMz47Cj4gIAl2ZGQtc3VwcGx5ID0gPCZidWNrM19yZWc+Owo+
ICsJcGFyZW50ID0gPCZidXNfZG1jPjsKPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPiAgCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+IGluZGV4IGQyMGRiMmRmZThlMi4uYTcwYTY3MWFj
YWNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQo+IEBAIC0zOTAsNiArMzkwLDcg
QEAKPiAgCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0RNQz47Cj4gIAkJCWNsb2NrLW5hbWVz
ID0gImJ1cyI7Cj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxl
PjsKPiArCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiAgCQl9Owo+ICAKPiBAQCAtMzk4LDYgKzM5OSw3IEBACj4gIAkJCWNsb2NrcyA9IDwm
Y2xvY2sgQ0xLX0RJVl9BQ1A+Owo+ICAJCQljbG9jay1uYW1lcyA9ICJidXMiOwo+ICAJCQlvcGVy
YXRpbmctcG9pbnRzLXYyID0gPCZidXNfYWNwX29wcF90YWJsZT47Cj4gKwkJCSNpbnRlcmNvbm5l
Y3QtY2VsbHMgPSA8MD47Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJfTsKPiAgCj4g
QEAgLTQwNiw2ICs0MDgsNyBAQAo+ICAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfQzJDPjsK
PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwm
YnVzX2RtY19vcHBfdGFibGU+Owo+ICsJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ICAJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJCX07Cj4gIAo+IEBAIC00NTksNiArNDYyLDcgQEAK
PiAgCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0dETD47Cj4gIAkJCWNsb2NrLW5hbWVzID0g
ImJ1cyI7Cj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19sZWZ0YnVzX29wcF90YWJs
ZT47Cj4gKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gIAkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gIAkJfTsKPiAgCj4gQEAgLTQ2Nyw2ICs0NzEsNyBAQAo+ICAJCQljbG9ja3MgPSA8
JmNsb2NrIENMS19ESVZfR0RSPjsKPiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3Bl
cmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2xlZnRidXNfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVy
Y29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+
ICAKPiBAQCAtNDc1LDYgKzQ4MCw3IEBACj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0FDTEsx
NjA+Owo+ICAJCQljbG9jay1uYW1lcyA9ICJidXMiOwo+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYy
ID0gPCZidXNfZGlzcGxheV9vcHBfdGFibGU+Owo+ICsJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0g
PDA+Owo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJCX07Cj4gIAo+IEBAIC00ODMsNiAr
NDg5LDcgQEAKPiAgCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzEzMz47Cj4gIAkJCWNsb2Nr
LW5hbWVzID0gImJ1cyI7Cj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19mc3lzX29w
cF90YWJsZT47Cj4gKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gIAkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7Cj4gIAkJfTsKPiAgCj4gQEAgLTQ5MSw2ICs0OTgsNyBAQAo+ICAJCQljbG9j
a3MgPSA8JmNsb2NrIENMS19BQ0xLMTAwPjsKPiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAg
CQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX3Blcmlfb3BwX3RhYmxlPjsKPiArCQkJI2lu
dGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9
Owo+ICAKPiBAQCAtNDk5LDYgKzUwNyw3IEBACj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX1ND
TEtfTUZDPjsKPiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPiAgCQkJb3BlcmF0aW5nLXBvaW50
cy12MiA9IDwmYnVzX2xlZnRidXNfb3BwX3RhYmxlPjsKPiArCQkJI2ludGVyY29ubmVjdC1jZWxs
cyA9IDwwPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+ICAKPiAtLSAKPiAy
LjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
