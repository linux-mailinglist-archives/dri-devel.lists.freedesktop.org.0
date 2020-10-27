Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF629C91B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BF66E029;
	Tue, 27 Oct 2020 19:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CF86E029
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:39:35 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v19so2673918edx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=prGqBiI5JimrXFF/vzXUDQaJ2EGlRDSeqqtNy7sjrCk=;
 b=EhPldmRSRuT/Z/Zo0nGEIzcJXQkGXl42sPlFQ+PlzL7swXnY1Qpl3at9HErmLYfH+h
 eaRZ8VjF1aYM5AmqksV/q4BMkpHnpAr4Zy205g/otGWwSzrS2pdzLtAwXiK9//7Gk+GT
 e5aO6A7IXtqgpLFfy0yzQ8EnhMCNY1MaDVpeF6ssQ6IOtd127JHpXyoKD7ag4ULtJgQo
 /EU6VJcLLE3BQI7+q8w6oDQ8hQnFfniRMRB/Myl4ixLzl6Hl28XXYslfZY0R2o1fsQ/H
 l2/nKmRn7mxxGfhYVM4Lt6Iu2iKty4zv4R2tLogLYYAcKlitvEFcrEX+EXXsJ17nJ56a
 glug==
X-Gm-Message-State: AOAM531ANTNAs2pBGRMBJWgpv/0GWkkC9IbJFpqpbt9yU1HQx32B4f+m
 bqtjBhPJ0QGVSyOe0Orcrlk=
X-Google-Smtp-Source: ABdhPJx/SLYaSJuvkdADGSTZROEQyUbm34KcNB5Cvm3aHaUVFHZ7v9Fg+sHR2VzYjZ1cuP6eGnu2Ow==
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr3879489edf.18.1603827573664; 
 Tue, 27 Oct 2020 12:39:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id n22sm1534573edr.11.2020.10.27.12.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:39:32 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:39:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/52] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Message-ID: <20201027193930.GC140636@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-10-digetx@gmail.com>
 <20201027090550.GI4244@kozik-lap>
 <7770b89e-f30b-3bfd-1e21-8ebbe905efcd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7770b89e-f30b-3bfd-1e21-8ebbe905efcd@gmail.com>
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

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTg6MzVQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTI6MDUsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE2OjUyQU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBNZW1vcnkgY29udHJvbGxlciBpcyBpbnRlcmNvbm5lY3RlZCB3
aXRoIG1lbW9yeSBjbGllbnRzIGFuZCB3aXRoIHRoZQo+ID4+IEV4dGVybmFsIE1lbW9yeSBDb250
cm9sbGVyLiBEb2N1bWVudCBuZXcgaW50ZXJjb25uZWN0IHByb3BlcnR5IHdoaWNoCj4gPj4gdHVy
bnMgbWVtb3J5IGNvbnRyb2xsZXIgaW50byBpbnRlcmNvbm5lY3QgcHJvdmlkZXIuCj4gPj4KPiA+
PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gIC4u
Li9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbCAgICAg
ICB8IDUgKysrKysKPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbAo+
ID4+IGluZGV4IDg0ZmQ1N2JjZjBkYy4uNTQzNmU2ZDQyMGJjIDEwMDY0NAo+ID4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlh
LHRlZ3JhMzAtbWMueWFtbAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZW1vcnktY29udHJvbGxlcnMvbnZpZGlhLHRlZ3JhMzAtbWMueWFtbAo+ID4+IEBAIC01
Nyw2ICs1Nyw5IEBAIHByb3BlcnRpZXM6Cj4gPj4gICAgIiNpb21tdS1jZWxscyI6Cj4gPj4gICAg
ICBjb25zdDogMQo+ID4+ICAKPiA+PiArICAiI2ludGVyY29ubmVjdC1jZWxscyI6Cj4gPj4gKyAg
ICBjb25zdDogMQo+ID4+ICsKPiA+PiAgcGF0dGVyblByb3BlcnRpZXM6Cj4gPj4gICAgIl5lbWMt
dGltaW5ncy1bMC05XSskIjoKPiA+PiAgICAgIHR5cGU6IG9iamVjdAo+ID4+IEBAIC0xMjAsNiAr
MTIzLDcgQEAgcmVxdWlyZWQ6Cj4gPj4gICAgLSBjbG9jay1uYW1lcwo+ID4+ICAgIC0gIiNyZXNl
dC1jZWxscyIKPiA+PiAgICAtICIjaW9tbXUtY2VsbHMiCj4gPj4gKyAgLSAiI2ludGVyY29ubmVj
dC1jZWxscyIKPiA+IAo+ID4gUm9iLAo+ID4gCj4gPiBZb3Ugd2VyZSBmaW5lIHdpdGggYWRkaW5n
IGEgbmV3IHJlcXVpcmVkIHByb3BlcnR5IHdoaWNoIGJyZWFrcyBhbGwKPiA+IGV4aXN0aW5nIERU
QnM/Cj4gCj4gVGhpcyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5IGZvciB0aGUgbmV3IGJpbmRpbmdz
IGFuZCBvcHRpb25hbCBmb3IgdGhlCj4gb2xkZXIuIERvZXMgaXQgcmVhbGx5IG5lZWQgdG8gYmUg
bWFkZSBvcHRpb25hbCBpbiB0aGUgYmluZGluZz8KCk1obW0uLi4gdGhhdCdzIGFuIGludGVyZXN0
aW5nIHBvaW50LiBJIGFzc3VtZWQgdGhhdCB0aGUgYmluZGluZ3Mgc2hvdWxkCnJlZmxlY3QgY3Vy
cmVudCBzdGF0dXMgb2YgdGhlIEFCSSwgYnV0IEkgY291bGQgaW1hZ2luZSB0aGF0IHlvdSB1cGRh
dGUKdGhlIGJpbmRpbmdzIHdoaWxlIGtlZXBpbmcgdGhlIGRyaXZlciB3b3JraW5nIHdpdGggb2xk
ZXIgRFRCcy4KCkhvdyBkbyB5b3UgYWN0dWFsbHkgdHJhY2sgdGhlbiB0aGUgQUJJPyBJZiBpbmNv
bXBhdGlibGUgY2hhbmdlIGNhbiBiZQphZGRlZCB0byB0aGUgYmluZGluZ3MsIGxhdGVyIGFueW9u
ZSBhbnl0aW1lIGNhbiBhbHNvIHVwZGF0ZSB0aGUgZHJpdmVyCnRvIGVuZm9yY2UgdGhlIGJpbmRp
bmdzLiBUbyByZXF1aXJlIHN1Y2ggcHJvcGVydHkuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoK
Cj4gCj4gPiBXZXJlIHRoZXNlIGJpbmRpbmdzIG1hcmtlZCBhcyB1bnN0YWJsZT8gVGhlIHBhdGNo
c2V0IGRvZXMgbm90IGV2ZW4KPiA+IHNheS9zY3JlYW0gdGhhdCBpdCBicmVha3MgdGhlIEFCSSwg
c28gdGhpcyBtaWdodCBiZSBxdWl0ZSBhIHN1cnByaXNlIGZvcgo+ID4gc29tZW9uZS4uLgo+IAo+
IFBsZWFzZSBzZWUgdGVncmFfbWNfaW50ZXJjb25uZWN0X3NldHVwKCkgaW4gIm1lbW9yeTogdGVn
cmEtbWM6IEFkZAo+IGludGVyY29ubmVjdCBmcmFtZXdvcmsiIHBhdGNoLCB3aGljaCBjaGVjayBw
cmVzZW5jZSBvZiB0aGUgbmV3IElDQyBEVAo+IHByb3BlcnR5LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
