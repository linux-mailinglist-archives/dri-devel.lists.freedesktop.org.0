Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E2F1C53
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38CC6EE09;
	Wed,  6 Nov 2019 17:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62D06EE09;
 Wed,  6 Nov 2019 17:21:20 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 15431607C6; Wed,  6 Nov 2019 17:21:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 45D836063A;
 Wed,  6 Nov 2019 17:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45D836063A
Date: Wed, 6 Nov 2019 10:21:16 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm: msm: a6xx: fix debug bus register
 configuration
Message-ID: <20191106172116.GA12872@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
 <CAF6AEGtdEDAYg9bqKREv34aWiXR+uwEg+xsyJS_ySs4+-sFumg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtdEDAYg9bqKREv34aWiXR+uwEg+xsyJS_ySs4+-sFumg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573060880;
 bh=lIdKuIB1t60YjOmFaeZGgfs4tDLYQnqztGQvbk3zep8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QzBmLZgDtZwM7U2VC0CBSeou+gsTNqn2d+ZR05YYBg8CZOD3i+Ti1QcxtBGxtKlnh
 95k3lubqSrEu8j/MroR8ClSAUYxvcMD2hGYE3nvH54IchVEyXK6yhA4kkrd9xrXLTu
 /RumDmleoU299OX1DubHBsnc4m2MIkHOTWpWpwPs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573060879;
 bh=lIdKuIB1t60YjOmFaeZGgfs4tDLYQnqztGQvbk3zep8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMu5wC6O8scrFQ/Db+RVyfETKpNF5L9ZUMqkGF5KAXTVYDT6Y7MgBrWwKNB+XKesi
 N1k6S+pVS8mFAuwjnHC83mwOUcF0h5ogupdnv8YVYtrFWsZj43iJdsrk/H1EO+wQ9d
 pbmaZauTXAtlZCfbc/2R1uR1bhotXcvofKv9kDXE=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDg6MTg6NTlBTSAtMDgwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgMzo0OSBBTSBTaGFyYXQgTWFzZXR0eSA8c21hc2V0
dHlAY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+ID4KPiA+IEZpeCB0aGUgY3ggZGVidWdidXMgcmVs
YXRlZCByZWdpc3RlciBjb25maWd1cmF0aW9uLCB0byBjb2xsZWN0IGFjY3VyYXRlCj4gPiBidXMg
ZGF0YSBkdXJpbmcgZ3B1IHNuYXBzaG90LiBUaGlzIGhlbHBzIHdpdGggY29tcGxldGUgc25hcHNo
b3QgZHVtcAo+ID4gYW5kIGFsc28gY29tcGxldGUgcHJvcGVyIEdQVSByZWNvdmVyeS4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaGFyYXQgTWFzZXR0eSA8c21hc2V0dHlAY29kZWF1cm9yYS5vcmc+
CgpUaGlzIGNvbW1pdCBzdW1tYXJ5IGlzIGZhciB0b28gcG9saXRlLiBUaGUgd29yZCBib25laGVh
ZGVkIHNob3VsZCBoYXZlIGFwcGVhcmVkCnNldmVyYWwgdGltZXMuIFRoYW5rcyBmb3IgdGhpcyBw
YXRjaC4KCj4gKGFkZGluZyBmaXhlcyB0YWcgZm9yIGJlbmVmaXQgb2Ygc3RhYmxlIGtlcm5lbHMp
Cj4gCj4gRml4ZXM6IDE3MDdhZGQ4MTU1MSAoImRybS9tc20vYTZ4eDogQWRkIGE2eHggZ3B1IHN0
YXRlIikKClRoYW5rcywgSSB3YXMgZ29pbmcgdG8gc3VnZ2VzdCB0aGlzIGFzIHdlbGwuCgo+IFJl
dmlld2VkLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTog
Sm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KCj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jIHwgMjQgKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVf
c3RhdGUuYwo+ID4gaW5kZXggNDgzZTEwMC4uYzU3NjRiNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMKPiA+IEBAIC0zNTMsMjYgKzM1Mywy
NiBAQCBzdGF0aWMgdm9pZCBhNnh4X2dldF9kZWJ1Z2J1cyhzdHJ1Y3QgbXNtX2dwdSAqZ3B1LAo+
ID4gICAgICAgICAgICAgICAgIGN4ZGJnID0gaW9yZW1hcChyZXMtPnN0YXJ0LCByZXNvdXJjZV9z
aXplKHJlcykpOwo+ID4KPiA+ICAgICAgICAgaWYgKGN4ZGJnKSB7Cj4gPiAtICAgICAgICAgICAg
ICAgY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMVCwKPiA+
ICsgICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdf
REJHQlVTX0NOVExULAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgQTZYWF9EQkdDX0NGR19E
QkdCVVNfQ05UTFRfU0VHVCgweGYpKTsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgY3hkYmdfd3Jp
dGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKPiA+ICsgICAgICAgICAg
ICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0NOVExN
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgQTZYWF9EQkdDX0NGR19EQkdCVVNfQ05UTE1f
RU5BQkxFKDB4ZikpOwo+ID4KPiA+IC0gICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywg
UkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMCwgMCk7Cj4gPiAtICAgICAgICAgICAgICAg
Y3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzEsIDApOwo+
ID4gLSAgICAgICAgICAgICAgIGN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19E
QkdCVVNfSVZUTF8yLCAwKTsKPiA+IC0gICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywg
UkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMywgMCk7Cj4gPiArICAgICAgICAgICAgICAg
Y3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzAsIDAp
Owo+ID4gKyAgICAgICAgICAgICAgIGN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdD
X0NGR19EQkdCVVNfSVZUTF8xLCAwKTsKPiA+ICsgICAgICAgICAgICAgICBjeGRiZ193cml0ZShj
eGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMiwgMCk7Cj4gPiArICAgICAg
ICAgICAgICAgY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19J
VlRMXzMsIDApOwo+ID4KPiA+IC0gICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVH
X0E2WFhfREJHQ19DRkdfREJHQlVTX0JZVEVMXzAsCj4gPiArICAgICAgICAgICAgICAgY3hkYmdf
d3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8wLAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgMHg3NjU0MzIxMCk7Cj4gPiAtICAgICAgICAgICAgICAgY3hk
Ymdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8xLAo+ID4gKyAg
ICAgICAgICAgICAgIGN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdC
VVNfQllURUxfMSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIDB4RkVEQ0JBOTgpOwo+ID4K
PiA+IC0gICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19DRkdf
REJHQlVTX01BU0tMXzAsIDApOwo+ID4gLSAgICAgICAgICAgICAgIGN4ZGJnX3dyaXRlKGN4ZGJn
LCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMSwgMCk7Cj4gPiAtICAgICAgICAgICAg
ICAgY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19NQVNLTF8yLCAw
KTsKPiA+IC0gICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19D
RkdfREJHQlVTX01BU0tMXzMsIDApOwo+ID4gKyAgICAgICAgICAgICAgIGN4ZGJnX3dyaXRlKGN4
ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7Cj4gPiArICAgICAg
ICAgICAgICAgY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19N
QVNLTF8xLCAwKTsKPiA+ICsgICAgICAgICAgICAgICBjeGRiZ193cml0ZShjeGRiZywgUkVHX0E2
WFhfQ1hfREJHQ19DRkdfREJHQlVTX01BU0tMXzIsIDApOwo+ID4gKyAgICAgICAgICAgICAgIGN4
ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMywgMCk7
Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIG5yX2RlYnVnYnVzX2Jsb2NrcyA9IEFSUkFZ
X1NJWkUoYTZ4eF9kZWJ1Z2J1c19ibG9ja3MpICsKPiA+IC0tCj4gPiAxLjkuMQo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBGcmVlZHJl
bm8gbWFpbGluZyBsaXN0Cj4gPiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0g
ClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2Rl
IEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
