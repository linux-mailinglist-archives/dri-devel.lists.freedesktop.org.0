Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2509F8AB22
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8227C6E02C;
	Mon, 12 Aug 2019 23:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343A86E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:29:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id q20so12696549otl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4yxOmFc8mjrzQ7FT1CRXemmXNTDbbde5+76CCWY9y9w=;
 b=k2DzRvG12YD3gnr3c0DDUVySZqw88ufYsa5LZLB3UTBITEXwUb0+z/te2CpIhzi+VU
 zHrJ9MPRTpM/UzTfopaI7jKspgLU8cQcNjWM42PkXwi5hrWt76TW5aV0GgpI2QVuwLas
 vijAi1lOfstStFD6NYlc7SC5XiuWF2OzA/kB3lL1NXZFocyCPnf6mwldU5H8b/lXH7zd
 smuYN/cj27hrO+lwbNz85RK2+fKwUCzzp8GK3oM1oMf1PaliRikX6ZfBw1XI/bva7OxH
 9H7X5CsCNo8e3Rzb7AZHsAQduAqinxpALlPvCV6zBC6FZghq1pRhjmL8WKrdGxbmfy3T
 flPw==
X-Gm-Message-State: APjAAAX6+LnWjr9dbq1dtCuScuD/9QRoFUkFJUxB0mDSAhRMsiKuKWx1
 Lq6cujKXeEZompgZhr8niw==
X-Google-Smtp-Source: APXvYqwMVgFEMJqzgRQCjE77n0TRXXJZ+evINUqzU+d3BirD/mE1ZLx1bMt8mhMDISlggMrsS6Hamw==
X-Received: by 2002:a6b:7619:: with SMTP id g25mr631364iom.92.1565652575408;
 Mon, 12 Aug 2019 16:29:35 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id j25sm151097051ioj.67.2019.08.12.16.29.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:29:34 -0700 (PDT)
Date: Mon, 12 Aug 2019 17:29:34 -0600
From: Rob Herring <robh@kernel.org>
To: Wen He <wen.he_1@nxp.com>
Subject: Re: [v2 1/4] dt-bindings: display: Add DT bindings for LS1028A
 HDP-TX PHY.
Message-ID: <20190812232934.GA1219@bogus>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 leoyang.li@nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDY6MDk6MzlQTSArMDgwMCwgV2VuIEhlIHdyb3RlOgo+
IEFkZCBEVCBiaW5kaW5ncyBkb2N1bWVudG1hdGlvbiBmb3IgdGhlIEhEUC1UWCBQSFkgY29udHJv
bGxlci4gVGhlIGRlc2NyaWJlcwo+IHdoaWNoIGNvdWxkIGJlIGZvdW5kIG9uIE5YUCBMYXllcnNj
YXBlIGxzMTAyOGEgcGxhdGZvcm0uCgpOb3QgcmVxdWlyZWQsIGJ1dCBwbGVhc2UgY29uc2lkZXIg
Y29udmVydGluZyB0byBEVCBzY2hlbWEgKFlBTUwpIGZvcm1hdC4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgo+IC0tLQo+IGNoYW5nZSBpbiB2MjoKPiAgICAg
ICAgIC0gY29ycmVjdGlvbiB0aGUgbm9kZSBuYW1lLgo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2ZzbCxoZHAudHh0ICAgfCA1NiArKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9mc2wsaGRwLnR4dAo+IAo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9mc2ws
aGRwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2ZzbCxo
ZHAudHh0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUzY2Ew
ODMzNzU4Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9mc2wsaGRwLnR4dAo+IEBAIC0wLDAgKzEsNTYgQEAKPiArTlhQIExh
eWVyc2NwYWUgbHMxMDI4YSBIRFAtVFggUEhZIENvbnRyb2xsZXIKCnR5cG8KCj4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtUaGUgZm9sbG93aW5n
IGJpbmRpbmdzIGRlc2NyaWJlIHRoZSBDYWRlbmNlIEhEUCBUWCBQSFkgb24gbHMxMDI4YSB0aGF0
Cj4gK29mZmVyIG11bHRpLXByb3RvY29sIHN1cHBvcnQgb2Ygc3RhbmRhcnMgc3VjaCBhcyBlRFAg
YW5kIERpc3BsYXlwb3J0LAoKcy9vZmZlci9vZmZlcnMvCgphbmQgYW5vdGhlciB0eXBvLgoKPiAr
c3VwcG9ydHMgZm9yIDI1LTYwME1IeiBwaXhlbCBjbG9jayBhbmQgdXAgdG8gNGsyayBhdCA2ME1I
eiByZXNvbHV0aW9uLgo+ICtUaGUgSERQIHRyYW5zbWl0dGVyIGlzIGEgQ2FkZW5jZSBIRFAgVFgg
Y29udHJvbGxlciBJUCB3aXRoIGEgY29tcGFuaW9uCj4gK1BIWSBJUC4KPiArCj4gK1JlcXVpcmVk
IHByb3BlcnRpZXM6Cj4gKyAgLSBjb21wYXRpYmxlOiAgIFNob3VsZCBiZSAiZnNsLGxzMTAyOGEt
ZHAiIGZvciBsczEwMjhhLgo+ICsgIC0gcmVnOiAgICAgICAgICBQaHlzaWNhbCBiYXNlIGFkZHJl
c3MgYW5kIHNpemUgb2YgdGhlIGJsb2NrIG9mIHJlZ2lzdGVycyB1c2VkCj4gKyAgYnkgdGhlIHBy
b2Nlc3Nvci4KClRoZSBleGFtcGxlIHNob3dzIDIgcmVnaW9ucywgd2hhdCBhcmUgdGhleT8KCj4g
KyAgLSBpbnRlcnJ1cHRzOiAgIEhEUCBob3RwbHVnIGluL291dCBkZXRlY3QgaW50ZXJydXB0IG51
bWJlcgo+ICsgIC0gY2xvY2tzOiAgICAgICBBIGxpc3Qgb2YgcGhhbmRsZSArIGNsb2NrLXNwZWNp
ZmllciBwYWlycywgb25lIGZvciBlYWNoIGVudHJ5Cj4gKyAgaW4gJ2Nsb2NrLW5hbWVzJwo+ICsg
IC0gY2xvY2stbmFtZXM6ICBBIGxpc3Qgb2YgY2xvY2sgbmFtZXMuIEl0IHNob3VsZCBjb250YWlu
Ogo+ICsgICAgICAtICJjbGtfaXBnIjogaW50ZXItSW50ZWdyYXRlZCBjaXJjdWl0IGNsb2NrCj4g
KyAgICAgIC0gImNsa19jb3JlIjogZm9yIHRoZSBNYWluIERpc3BsYXkgVFggY29udHJvbGxlciBj
bG9jawo+ICsgICAgICAtICJjbGtfcHhsIjogZm9yIHRoZSBwaXhlbCBjbG9jayBmZWVkaW5nIHRo
ZSBvdXRwdXQgUExMIG9mIHRoZSBwcm9jZXNzb3IKPiArICAgICAgLSAiY2xrX3B4bF9tdXgiOiBm
b3IgdGhlIGhpZ2ggUGVyZlBMTCBieXBhc3MgY2xvY2sKPiArICAgICAgLSAiY2xrX3B4bF9saW5r
IjogZm9yIHRoZSBsaW5rIHJhdGUgcGl4ZWwgY2xvY2sKPiArICAgICAgLSAiY2xrX2FwYiI6IGZv
ciB0aGUgQVBCIGludGVyZmFjZSBjbG9jawo+ICsgICAgICAtICJjbGtfdmlmIjogZm9yIHRoZSBW
aWRlbyBwaXhlbCBjbG9jawoKJ2Nsa18nIGlzIHJlZHVuZGFudC4KCj4gKwo+ICtSZXF1aXJlZCBz
dWItbm9kZXM6Cj4gKyAgLSBwb3J0OiBUaGUgSERQIGNvbm5lY3Rpb24gdG8gYW4gZW5jb2RlciBv
dXRwdXQgcG9ydC4gVGhlIGNvbm5lY3Rpb24KPiArICAgIGlzIG1vZGVsbGVkIHVzaW5nIHRoZSBP
RiBncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4KPiArICAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ncmFwaC50eHQKCkknbSBzdGlsbCBjb25mdXNlZCBhcyB0byB3aGF0IHRo
aXMgYmxvY2sgZG9lcz8gVGhlICdlbmNvZGVyIG91dHB1dCcgaXMgCkRpc3BsYXlQb3J0PyBJZiB0
aGlzIGlzIGp1c3QgYSBwaHksIHRoZW4gdXNlIHRoZSBwaHkgYmluZGluZy4KCk5vcm1hbGx5LCBh
IERpc3BsYXlQb3J0IGVuY29kZXIvYnJpZGdlIE9GIGdyYXBoIG91dHB1dCB3b3VsZCBiZSAKY29u
bmVjdGVkIHRvIGEgRFAgY29ubmVjdG9yIG5vZGUgb3IgYSBwYW5lbC4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
