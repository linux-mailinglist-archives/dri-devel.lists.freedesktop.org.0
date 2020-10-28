Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32DA29D0BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0866E580;
	Wed, 28 Oct 2020 15:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467186E47B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:35:31 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id p9so7887579eji.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tOzGuUmz353raLqizP2rvx4LkjDP5IM9PyiPt5zQsck=;
 b=QNCOgad//sya6/wBhzWMmc9jqGTzLBSPd8qxDwUzK239HHPQZJDc3IwQDFaR9pRP6c
 Ha9+IrL9aKZxBWpnf0D8Cd4JJHJ57VZU+OcbBf2PoSQZ2+mraanYYOW5n5mVB3WfqcYC
 BaqSfrIJQNNFJkWf051AGGBXsP3D8d1kR54OYDhocQt8l0Xv0ezwEjDV06ZMWyJ69oUn
 +FdxD6r22j1BNON/sR/v8oPS5e+Bz2hDQ7adc2wn/RZf1N8DpTucx9am6NaXkHXPQuSQ
 KVZr+jaJY5U04NwZ2S2QGCx+Wr/YHDo4muXXAbzADMC6s3xzeXRLXfMAKxZpJukGcW3C
 UvEw==
X-Gm-Message-State: AOAM533cZiaN+P7AsqfIKUpqnejWL2E6XjfTWlrAxMXxGf0Swk5ZdkH9
 YZMKxPEy4StlXByCLZ3U004=
X-Google-Smtp-Source: ABdhPJx7uTojdx8c4uChsolOHCfdvqUlE8lbp5QLK2dcQNvxdYAlOS/eER5VjqNvSaVQADiGzYDahA==
X-Received: by 2002:a17:906:52d5:: with SMTP id
 w21mr8600918ejn.501.1603899329605; 
 Wed, 28 Oct 2020 08:35:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id e2sm3163675edn.30.2020.10.28.08.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:35:27 -0700 (PDT)
Date: Wed, 28 Oct 2020 16:35:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 04/52] dt-bindings: memory: tegra20: emc: Document
 nvidia,memory-controller property
Message-ID: <20201028153525.GA133954@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-5-digetx@gmail.com>
 <20201027085417.GD4244@kozik-lap>
 <54191034-dcb9-7cab-333b-5bb2553f0ed1@gmail.com>
 <20201027193039.GA140636@kozik-lap>
 <20201028152303.GA4041470@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028152303.GA4041470@bogus>
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

T24gV2VkLCBPY3QgMjgsIDIwMjAgYXQgMTA6MjM6MDNBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMDg6MzA6MzlQTSArMDEwMCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjE3OjE5UE0g
KzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+ID4gMjcuMTAuMjAyMCAxMTo1NCwgS3J6
eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+ID4gPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIw
IGF0IDAxOjE2OjQ3QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+ID4gPj4gVGVn
cmEyMCBFeHRlcm5hbCBNZW1vcnkgQ29udHJvbGxlciB0YWxrcyB0byBEUkFNIGNoaXBzIGFuZCBp
dCBuZWVkcyB0byBiZQo+ID4gPiA+PiByZXByb2dyYW1tZWQgd2hlbiBtZW1vcnkgZnJlcXVlbmN5
IGNoYW5nZXMuIFRlZ3JhIE1lbW9yeSBDb250cm9sbGVyIHNpdHMKPiA+ID4gPj4gYmVoaW5kIEVN
QyBhbmQgdGhlc2UgY29udHJvbGxlcnMgYXJlIHRpZ2h0bHkgY291cGxlZC4gVGhpcyBwYXRjaCBh
ZGRzIHRoZQo+ID4gPiA+PiBuZXcgcGhhbmRsZSBwcm9wZXJ0eSB3aGljaCBhbGxvd3MgdG8gcHJv
cGVybHkgZXhwcmVzcyBjb25uZWN0aW9uIG9mIEVNQwo+ID4gPiA+PiBhbmQgTUMgaGFyZHdhcmUg
aW4gYSBkZXZpY2UtdHJlZSwgaXQgYWxzbyBwdXQgdGhlIFRlZ3JhMjAgRU1DIGJpbmRpbmcgb24K
PiA+ID4gPj4gcGFyIHdpdGggVGVncmEzMCsgRU1DIGJpbmRpbmdzLCB3aGljaCBpcyBoYW5keSB0
byBoYXZlLgo+ID4gPiA+Pgo+ID4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28g
PGRpZ2V0eEBnbWFpbC5jb20+Cj4gPiA+ID4+IC0tLQo+ID4gPiA+PiAgLi4uL2JpbmRpbmdzL21l
bW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0ICAgICAgICAgIHwgMiArKwo+
ID4gPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Pgo+ID4gPiA+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0Cj4g
PiA+ID4+IGluZGV4IDU2N2NmZmQzN2YzZi4uMWIwZDQ0MTdhYWQ4IDEwMDY0NAo+ID4gPiA+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJz
L252aWRpYSx0ZWdyYTIwLWVtYy50eHQKPiA+ID4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0
Cj4gPiA+ID4+IEBAIC0xMiw2ICsxMiw3IEBAIFByb3BlcnRpZXM6Cj4gPiA+ID4+ICAgIGlycmVz
cGVjdGl2ZSBvZiByYW0tY29kZSBjb25maWd1cmF0aW9uLgo+ID4gPiA+PiAgLSBpbnRlcnJ1cHRz
IDogU2hvdWxkIGNvbnRhaW4gRU1DIEdlbmVyYWwgaW50ZXJydXB0Lgo+ID4gPiA+PiAgLSBjbG9j
a3MgOiBTaG91bGQgY29udGFpbiBFTUMgY2xvY2suCj4gPiA+ID4+ICstIG52aWRpYSxtZW1vcnkt
Y29udHJvbGxlciA6IFBoYW5kbGUgb2YgdGhlIE1lbW9yeSBDb250cm9sbGVyIG5vZGUuCj4gPiA+
ID4gCj4gPiA+ID4gSXQgbG9va3MgbGlrZSB5b3UgYWRkaW5nIGEgcmVxdWlyZWQgcHJvcGVydHkg
d2hpY2ggaXMgYW4gQUJJIGJyZWFrLgo+ID4gPiBUaGUgVDIwIEVNQyBkcml2ZXIgaXMgdW51c2Vk
IHNvIGZhciBpbiB1cHN0cmVhbSBhbmQgaXQgd2lsbCBiZWNvbWUgdXNlZAo+ID4gPiBvbmx5IG9u
Y2UgdGhpcyBzZXJpZXMgaXMgYXBwbGllZC4gSGVuY2UgaXQncyBmaW5lIHRvIGNoYW5nZSB0aGUg
QUJJLgo+ID4gCj4gPiBUaGUgQUJJIGlzIG5vdCBhYm91dCB1cHN0cmVhbSwgYnV0IGRvd25zdHJl
YW0uIAo+IAo+ICJJZiBpdCdzIG5vdCB1cHN0cmVhbSwgaXQgZG9lc24ndCBleGlzdC4iCj4gCj4g
VGhvdWdoIHdlIGRvIGhhdmUgdG8gYWNjb3VudCBmb3Igb3V0IG9mIHRyZWUgdXNlcnMgd2hlcmUg
dGhlIERUIGlzIG5vdCAKPiBpbiB0cmVlLCBidXQgdXBzdHJlYW0gZHJpdmVycyBhcmUgdXNlZC4g
RG93bnN0cmVhbSBhcyBpbiB2ZW5kb3Iga2VybmVscyAKPiB0eXBpY2FsbHkgaGFzIGxvYWRzIG9m
IG90aGVyIGNyYXAuCgpUaGF0J3MgdGhlIGNhc2UgSSBhbSByZWZlcnJpbmcgdG8uIE1heWJlIG5v
dCBpbiBjYXNlIG9mIFRlZ3JhLCBidXQKbXVsdGlwbGUgb3RoZXIgZGVzaWducyBhcmUgcXVpdGUg
cG9wdWxhciBpbiBpbmR1c3RyaWFsIHVzZXMgYW5kIHRoZWlyCkRUU2VzIHdlcmUgbm90IHVwc3Ry
ZWFtZWQuCgpUaGlzIGlzIGFueXdheSBkaWZmZXJlbnQgY2FzZSwgYXMgRG1pdHJ5IGV4cGxhaW5l
ZCAtIG5vdGhpbmcgZ290IGJyb2tlbgpiZWNhdXNlIG5vdCBtdWNoIHdhcyB3b3JraW5nIGJlZm9y
ZSBhcm91bmQgdGhpcy4KCj4gCj4gPiBUaGVyZSBhcmUgbm8gb3RoZXIKPiA+IHVwc3RyZWFtcyB1
c2luZyB0aGlzIEFCSS4gVW5sZXNzIHlvdSBoYXZlIGluIG1pbmQgdGhhdCBleGlzdGluZyBUMjAg
RU1DCj4gPiBkcml2ZXIgd2FzIGEgbm9vcCwgZG9pbmcgYWJzb2x1dGVseSBub3RoaW5nLCB0aGVy
ZWZvcmUgdGhlcmUgaXMgbm8KPiA+IGJyZWFrYWdlIG9mIGFueSBvdGhlciB1c2Vycz8KPiAKPiBB
QkkgYnJlYWtzIGFyZSB1bHRpbWF0ZWx5IHVwIHRvIHRoZSBwbGF0Zm9ybSBtYWludGFpbmVycyB0
byBkZWNpZGUuCgpDb29sISBUaGF0IHJlc2hhcGVzIHNpZ25pZmljYW50bHkgbXkgZXhpc3Rpbmcg
cG9pbnQgb2YgdmlldywgZXNwZWNpYWxseQphYm91dCBkaXNjdXNzaW9ucyBvbiBFeHlub3MgYmlu
ZGluZ3MgKGxvbmcgdGltZSBhZ28pLiBUaGFua3MgZm9yCmNsYXJpZmljYXRpb24uCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
