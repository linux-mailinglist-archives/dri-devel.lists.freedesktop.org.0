Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A58532E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 20:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522666E75B;
	Wed,  7 Aug 2019 18:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDB6E75A;
 Wed,  7 Aug 2019 18:46:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3374360E3F; Wed,  7 Aug 2019 18:46:52 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E1D0B60A0A;
 Wed,  7 Aug 2019 18:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1D0B60A0A
Date: Wed, 7 Aug 2019 12:46:49 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
 <20190807173838.GB30025@ravnborg.org>
 <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565203612;
 bh=rsEXH2qa68Qo5lqAMtQMabxaQZa7nU/AWE5S0APaSZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NwMh1gwmE5zgFWdg0AZUvRfvK5RVaT2KWK9q3eo+tCOCGSLDIQPyozi7Jelu5cKim
 rDdj/Q7Tdo3HLZeohAgXyFCq8HupctEoL3SJGVR8gLdqp48iaHF9KQ5HSatgM1l1ac
 l2b9h5RiYqGOPr+hfm+HxqMbfa+y9VSDOVQMUC00=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565203611;
 bh=rsEXH2qa68Qo5lqAMtQMabxaQZa7nU/AWE5S0APaSZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwDckWat45TZ3snu3ZWqiEivSf2rJ6duxb1hBFhgawz2MeXhGSUHqcWz/1juGzqGm
 krB5zA0czpW/RjnCEKUzWb5FxeKwxZ8rrpnh7PCRqnv6XdwVs6P3971M702S4/nN9/
 DHD2i05d8IjtTyi24JXOOdhrW8DNnP5uErkUXSqQ=
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTE6MDg6NTNBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgQXVnIDcsIDIwMTkgYXQgMTA6MzggQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBKb3JkYW4uCj4gPiBPbiBXZWQsIEF1ZyAwNywg
MjAxOSBhdCAxMToyNDoyN0FNIC0wNjAwLCBKb3JkYW4gQ3JvdXNlIHdyb3RlOgo+ID4gPiBNb3N0
IHVzZSBjYXNlcyBmb3IgRFJNX01TTSB3aWxsIHByZWZlciB0byBidWlsZCBib3RoIERSTSBhbmQg
TVNNX0RSTSBhcwo+ID4gPiBtb2R1bGVzIGJ1dCB0aGVyZSBhcmUgc29tZSBjYXNlcyB3aGVyZSBE
Uk0gbWlnaHQgYmUgYnVpbHQgaW4gZm9yIHdoYXRldmVyCj4gPiA+IHJlYXNvbiBhbmQgaW4gdGhv
c2Ugc2l0dWF0aW9ucyBpdCBpcyBwcmVmZXJhYmxlIHRvIHN0aWxsIGtlZXAgTVNNIGFzIGEKPiA+
ID4gbW9kdWxlIGJ5IGRlZmF1bHQgYW5kIGxldCB0aGUgdXNlciBkZWNpZGUgaWYgdGhleSBfcmVh
bGx5XyB3YW50IHRvIGJ1aWxkCj4gPiA+IGl0IGluLgo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHkg
c2VsZWN0IFFDT01fQ09NTUFORF9EQiBmb3IgQVJDSF9RQ09NIHRhcmdldHMgdG8gbWFrZSBzdXJl
Cj4gPiA+IGl0IGRvZXNuJ3QgZ2V0IG1pc3NlZCB3aGVuIHdlIG5lZWQgaXQgZm9yIGE2eHggdGFy
ZXRzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
S2NvbmZpZyB8IDMgKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcKPiA+ID4gaW5kZXggOWMzN2U0
ZC4uM2IyMzM0YiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmln
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZwo+ID4gPiBAQCAtMTQsMTEg
KzE0LDEyIEBAIGNvbmZpZyBEUk1fTVNNCj4gPiA+ICAgICAgIHNlbGVjdCBTSE1FTQo+ID4gPiAg
ICAgICBzZWxlY3QgVE1QRlMKPiA+ID4gICAgICAgc2VsZWN0IFFDT01fU0NNIGlmIEFSQ0hfUUNP
TQo+ID4gPiArICAgICBzZWxlY3QgUUNPTV9DT01NQU5EX0RCIGlmIEFSQ0hfUUNPTQo+ID4gPiAg
ICAgICBzZWxlY3QgV0FOVF9ERVZfQ09SRURVTVAKPiA+ID4gICAgICAgc2VsZWN0IFNORF9TT0Nf
SERNSV9DT0RFQyBpZiBTTkRfU09DCj4gPiA+ICAgICAgIHNlbGVjdCBTWU5DX0ZJTEUKPiA+ID4g
ICAgICAgc2VsZWN0IFBNX09QUAo+ID4gPiAtICAgICBkZWZhdWx0IHkKPiA+ID4gKyAgICAgZGVm
YXVsdCBtCj4gPgo+ID4gQXMgYSBnZW5lcmFsIGNvbW1lbnQgdGhlIHJpZ2h0IHRoaW5nIHdvdWxk
IGJlIHRvIGRyb3AgdGhpcyBkZWZhdWx0Lgo+ID4gQXMgaXQgaXMgbm93IHRoZSBLY29uZmlnIHNh
eXMgdGhhdCB3aGVuIERSTSBpcyBzZWxlY3RlZCB0aGVuIGFsbCBvZiB0aGUKPiA+IHdvcmxkIHdv
dWxkIHRoZW4gYWxzbyBnZXQgRFJNX01TTSwgd2hpY2ggb25seSBhIHNtYWxsIHBhcnQgb2YgdGhp
cyB3b3JsZAo+ID4geW91IHNlZSBhbnkgYmVuZWZpdCBpbi4KPiA+IFNvIHRoZXkgbm93IGhhdmUg
dG8gZGUtc2VsZWN0IE1TTS4KPiAKPiBJZiB0aGUgZGVmYXVsdCBpcyBkcm9wcGVkLCBpdCBzaG91
bGQgcHJvYmFibHkgYmUgYWNjb21wYW5pZWQgYnkgYWRkaW5nCj4gQ09ORklHX0RSTV9NU009bSB0
byBkZWZjb25maWcncywgSSB0aGluawoKSW4gZ2VuZXJhbCBJIHByZWZlciB0byBub3QgdXNlIGEg
ZGVmYXVsdCBidXQgdGhpcyBpcyB0aGUgb25seSBHUFUgZHJpdmVyIGZvcgpBUkNIX1FDT00gYW5k
IEkgdGhpbmsgaXRzIHNhZmUgdG8gc3RheSB0aGF0IDk5JSBvZiBBUkNIX1FDT00gdXNlcnMgd291
bGQgc2VsZWN0CnRoaXMgbW9kdWxlIGFuZCB0aG9zZSB0aGF0IHdvdWxkbid0IHdpbGwgb21pdCBE
Uk0gZW50aXJlbHkuCgpJIGZlZWwgaXQgaXMgbmV0IG5lZ2F0aXZlIGlmIHdlIGRyb3BwZWQgdGhl
IGRlZmF1bHQgYnV0IHRoZW4gaGFkIHRvIHR1cm4gYXJvdW5kCmFuZCBlbmFibGUgaXQgaW4gZXZl
cnkgZGVmY29uZmlnLgoKSm9yZGFuCgo+IEJSLAo+IC1SCj4gCj4gPiBLY29uZmlnIGhhczoKPiA+
ICAgICBkZXBlbmRzIG9uIEFSQ0hfUUNPTSB8fCBTT0NfSU1YNSB8fCAoQVJNICYmIENPTVBJTEVf
VEVTVCkKPiA+Cj4gPiBTbyBtYXliZSBub3QgYWxsIG9mIHRoZSB3b3JsZCBidXQgYWxsIFFDT00g
b3IgSU1YNSB1c2Vycy4gTWF5YmUgdGhleSBhcmUgYWxsCj4gPiBpbnRlcmVzdGVkIGluIE1TTS4g
T3RoZXJ3aXNlIHRoZSBkZWZhdWx0IHNob3VsZCByYXRoZXIgYmUgZHJvcHBlZC4KPiA+IElmIHRo
ZXJlIGlzIGFueSBnb29kIGhpbnRzIHRoZW4gdGhlIGhlbHAgdGV4dCBjb3VsZCBhbnl3YXkgdXNl
IHNvbWUKPiA+IGxvdmUsIGFuZCB0aGVuIGFkZCB0aGUgaW5mbyB0aGVyZS4KPiA+Cj4gPiBUaGUg
b3RoZXIgY2hhbmdlIHdpdGggUUNPTV9DT01NQU5EX0RCIHNlZW1zIG9uIHRoZSBvdGhlciBoYW5k
IHRvIG1ha2UKPiA+IHNlbnNlIGJ1dCB0aGVuIHRoaXMgaXMgYW5vdGhlciBwYXRjaC4KPiA+Cj4g
PiAgICAgICAgIFNhbQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+IEZyZWVkcmVubyBtYWlsaW5nIGxpc3QKPiA+IEZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZnJlZWRyZW5vCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJ
bmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24g
Q29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
