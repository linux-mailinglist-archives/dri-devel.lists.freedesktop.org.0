Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3329C934
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320556EC2D;
	Tue, 27 Oct 2020 19:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D196EC2D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:48:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id o18so2720259edq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DCnp21W838z3J54dqoT+LPZURnglQ0VUhiX4g0DgzEM=;
 b=plMlC+t2zXpjNHdDfklukPJD1+vZFcJXYwhlpWgsEdeluTi3iq+SVr4TMNYo1oB5e4
 0i1WiFjRAT60Y1L/E44/xzupmxX7ALO2/Kwu+DuJrQRnNsPspVMVJcfmY2FtEjSebur6
 XQHVUHV8gxSD9o9RVUewnof2Ry7M0Z8LWX97B4ylG7ATaPsE1EabcNHCTvmRi2H0ld0/
 2W9nFtiNii6Zym8S/ijXayGB2CSxIVgfCTsoZmrbpQLOApZBDLzzayv0QQGmGfXcpAmp
 SJIoQ6q2tczmxWRG4HTTHS9Xbuicz8WgqC8XiA+6HR7G7OJsfSMEVxMsG6fuyjalm2JR
 xY9g==
X-Gm-Message-State: AOAM530aHKfTsc304DxUosM20d5Amr9USdqI00QFhb+YDGK1VmOr7Qkr
 ZH1GyJOKDbU+5p8QSKLlSMs=
X-Google-Smtp-Source: ABdhPJyGc94tfyRFl9VLzlaneyVsIYgUVM3YkjJxfOPWRF2V8kbYt5rWKEKhzQ7H5M62+MCIviirCw==
X-Received: by 2002:a50:e447:: with SMTP id e7mr4040757edm.263.1603828117108; 
 Tue, 27 Oct 2020 12:48:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id ss7sm1615086ejb.28.2020.10.27.12.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:48:35 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:48:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 13/52] dt-bindings: memory: tegra124: emc: Document
 new interconnect property
Message-ID: <20201027194833.GE140636@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-14-digetx@gmail.com>
 <20201027102506.GB17089@kozik-lap>
 <f38984b6-d53f-a43d-0387-e787b3c1924d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f38984b6-d53f-a43d-0387-e787b3c1924d@gmail.com>
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

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTk6MjhQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTM6MjUsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjU2QU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBFeHRlcm5hbCBtZW1vcnkgY29udHJvbGxlciBpcyBpbnRlcmNv
bm5lY3RlZCB3aXRoIG1lbW9yeSBjb250cm9sbGVyIGFuZAo+ID4+IHdpdGggZXh0ZXJuYWwgbWVt
b3J5LiBEb2N1bWVudCBuZXcgaW50ZXJjb25uZWN0IHByb3BlcnR5IHdoaWNoIHR1cm5zCj4gPj4g
RXh0ZXJuYWwgTWVtb3J5IENvbnRyb2xsZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+
Cj4gPj4gLS0tCj4gPj4gIC4uLi9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRl
Z3JhMTI0LWVtYy55YW1sICAgfCA3ICsrKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMTI0LWVtYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9udmlk
aWEsdGVncmExMjQtZW1jLnlhbWwKPiA+PiBpbmRleCAyNzg1NDlmOWUwNTEuLmFjMDA4MzJjZWFj
MSAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL252aWRpYSx0ZWdyYTEyNC1lbWMueWFtbAo+ID4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRl
Z3JhMTI0LWVtYy55YW1sCj4gPj4gQEAgLTI5LDYgKzI5LDkgQEAgcHJvcGVydGllczoKPiA+PiAg
ICAgIGl0ZW1zOgo+ID4+ICAgICAgICAtIGNvbnN0OiBlbWMKPiA+PiAgCj4gPj4gKyAgIiNpbnRl
cmNvbm5lY3QtY2VsbHMiOgo+ID4+ICsgICAgY29uc3Q6IDAKPiA+PiArCj4gPj4gICAgbnZpZGlh
LG1lbW9yeS1jb250cm9sbGVyOgo+ID4+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZQo+ID4+ICAgICAgZGVzY3JpcHRpb246Cj4gPj4gQEAgLTMyNyw2
ICszMzAsNyBAQCByZXF1aXJlZDoKPiA+PiAgICAtIGNsb2Nrcwo+ID4+ICAgIC0gY2xvY2stbmFt
ZXMKPiA+PiAgICAtIG52aWRpYSxtZW1vcnktY29udHJvbGxlcgo+ID4+ICsgIC0gIiNpbnRlcmNv
bm5lY3QtY2VsbHMiCj4gPiAKPiA+IEFub3RoZXIgcmVxdWlyZWQgcHJvcGVydHksIHdoYXQgYWJv
dXQgYWxsIGV4aXN0aW5nIHVzZXJzIG9mIHRoaXMgYmluZGluZz8KPiAKPiBFTUMvZGV2ZnJlcSBk
cml2ZXJzIGNoZWNrIHByZXNlbmNlIG9mIHRoZSBuZXcgcHJvcGVydGllcyBhbmQgYXNrIHVzZXJz
Cj4gdG8gdXBncmFkZSB0aGUgRFQuIFRoZSBrZXJuZWwgd2lsbCBjb250aW51ZSB0byB3b3JrIGZp
bmUgdXNpbmcgb2xkZXIKPiBEVEJzLCBidXQgZGV2ZnJlcSBkcml2ZXIgd29uJ3QgbG9hZC4KCklm
IHRoZSBkZXZmcmVxIHdhcyB3b3JraW5nIGZpbmUgYmVmb3JlICh3aXRoIHRoZXNlIG9sZGVyIERU
QnMgYW5kIG9sZGVyCmtlcm5lbCkgdGhlbiB5b3UgYnJlYWsgdGhlIGZlYXR1cmUuCgpJZiBkZXZm
cmVxIHdhcyBub3Qgd29ya2luZyBvciB3YXMgbm90IHN0YWJsZSBlbm91Z2gsIHRoZW4gbm90aGlu
ZyBpcwpicm9rZW4gc28gc3VjaCBjaGFuZ2UgaXMgYWNjZXB0ZWQuCgpXaGljaCBvbmUgaXMgdGhl
bj8KCj4gCj4gPj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4+ICAKPiA+PiBAQCAt
MzQ1LDYgKzM0OSw3IEBAIGV4YW1wbGVzOgo+ID4+ICAKPiA+PiAgICAgICAgICAjaW9tbXUtY2Vs
bHMgPSA8MT47Cj4gPj4gICAgICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Owo+ID4+ICsgICAgICAg
ICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MT47Cj4gPiAKPiA+IFlvdSBtZWFudCAnMCc/Cj4gCj4g
JzEnIGlzIGZvciB0aGUgIm1jIiBub2RlIGluIHRoZSBleGFtcGxlIChub3QgImVtYyIgbm9kZSku
Cj4gCj4gQW55d2F5cywgSSdsbCBtb3ZlIHRoaXMgaHVuayB0byB0aGUgcHJldmlvdXMgcGF0Y2gg
aW4gb3JkZXIgdG8gZml4IHRoZQo+IGtlcm5lbCBib3Qgd2FybmluZy4KClJpZ2h0LCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
