Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC7FBC1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6639D891D6;
	Tue, 30 Apr 2019 14:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09860891D5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:43:35 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m4so12529941edd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=yP6XwfLGp5JB0ZUY5dxfx55vYPkktC02l12QRiUGxkI=;
 b=NxZW1YiStxUh8de6vng5f9uYLar8t+z/3UiwKL//SspEuupnerFLvpiFT6ki1OoWmt
 jBR9TT51k7P9vmg7LN1kvXwEBrfCBI5ulshcEGiaPpCzQBSrOGqACM5JLuyqMYppFkMW
 OrJ9st6rlHo89/vXbJR0j/xtVIymSIhCZMMRv5xXq6JDtZFWQzLdxcGVdRNp8H9wfzbI
 rznhZYhjx761593w2z7WbV3HwHNX6hyqqSoZX+E6IyIIkC3ifvvny85YwJWmCpDm3Nu7
 miFWbf+4KkA5ljdIt8V/qBRAENyuCpTFOSPD+jzgnJevNITl1XiXE3yHLS8GsMYqog7N
 zcqw==
X-Gm-Message-State: APjAAAXKswjx90nbQy50ZUhKK5HM/RzSLB18z1If9NHbCgPSRowUaZHt
 dmLw3T/Rp9RDp/LZibbqvpVWpg==
X-Google-Smtp-Source: APXvYqy6hEs7I+byYKk7QOVUdeZpKfvvSUedU6VcZMDlgcMH1r/yNuFDhZUrq22hF8C14x7Oih1AQQ==
X-Received: by 2002:a50:c315:: with SMTP id a21mr4085284edb.158.1556635414693; 
 Tue, 30 Apr 2019 07:43:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 16sm2968979ejj.20.2019.04.30.07.43.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 07:43:33 -0700 (PDT)
Date: Tue, 30 Apr 2019 16:43:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/atomic-helper: Bump vblank timeout to 100 ms
Message-ID: <20190430144329.GZ3271@phenom.ffwll.local>
References: <20190430093746.26485-1-linus.walleij@linaro.org>
 <20190430104419.GD24299@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430104419.GD24299@intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=yP6XwfLGp5JB0ZUY5dxfx55vYPkktC02l12QRiUGxkI=;
 b=Ue+VfUOx6dElAuf83yQmRytyV91gWAtgo/AjyAnsqpxrK+/6Bm7ZF30DPOEhjlr6tn
 iM81v5r4/3ckyQz2djfyya1AqlsUD71uzClimf3wMN/CR6lsm/gG0+Eks2ZkdlTOCxCS
 /V7taQetiruP+FEXvtNF0dVHbhq2H0WxbAdzE=
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
Cc: Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDE6NDQ6MTlQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0IDExOjM3OjQ2QU0gKzAyMDAsIExpbnVz
IFdhbGxlaWogd3JvdGU6Cj4gPiBUaGUgNTAgbXMgZGVmYXVsdCB0aW1lb3V0IHdhaXRpbmcgZm9y
IHZibGFua3MgaXMgdG9vIHNtYWxsCj4gPiBmb3IgdGhlIGZpcnN0IHZibGFuayBmcm9tIHRoZSBT
VC1Fcmljc3NvbiBNQ0RFIGRpc3BsYXkKPiA+IGNvbnRyb2xsZXIgb3ZlciBEU0kuIFByZXN1bWFi
bHkgdGhpcyBpcyBiZWNhdXNlIHRoZSBEU0kKPiA+IGRpc3BsYXkgaXMgY29tbWFuZC1tb2RlIG9u
bHkgYW5kIHRoZSBzdGF0ZSBtYWNoaW5lIHdpbGwKPiA+IHRha2Ugc29tZSB0aW1lIHNldHRpbmcg
dXAgaXRzIHN0YXRlIGZvciB0aGUgZmlyc3QgZGlzcGxheQo+ID4gdXBkYXRlLCBhbmQgd2UgaGl0
IGEgdGltZW91dC4gMTAwIG1zIG1ha2VzIGl0IHBhc3Mgd2l0aG91dAo+ID4gcHJvYmxlbXMuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJv
Lm9yZz4KPiA+IC0tLQo+ID4gQWZ0ZXIgYSBxdWl0ZSBwcm9sb25nZWQgaHVudGluZyBmb3IgdGhl
IGNhdXNlIG9mIG1pc3NlZAo+ID4gdmJsYW5rcyBpbiB0aGUgTUNERSBkcml2ZXIgSSBmaW5hbGx5
IHJlYWxpemVkIGl0IHRpbWVkCj4gPiBvdXQgYmVjYXVzZSBpdCB3YXMgc2ltcGx5IHRha2luZyBz
b21lIHRpbWUgb24gdGhlIGZpcnN0Cj4gPiB2YmxhbmsuIDUwIG1zIG1ha2VzIHNlbnNlIG9uIDYw
SHogbW9uaXRvcnMgZm9yIHN1cmUsCj4gPiBidXQgYW4gZW1iZWRkZWQgRFNJIHN0YXRlIG1hY2hp
bmUgY2FuIGJlIHNsb3csIGFzIGl0Cj4gPiB0dXJucyBvdXQuCj4gPiAKPiA+IFRlbGwgbWUgaWYg
dGhpcyBzaG91bGQgYmUgYSBwZXItZHJpdmVyIHZhcmlhYmxlIGFuZCBJCj4gPiB3aWxsIHRoaW5r
IG9mIHNvbWV0aGluZy4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gaW5kZXgg
NDBhYzE5ODQ4MDM0Li5mMGFhN2IxOTVkNzkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9t
aWNfaGVscGVyLmMKPiA+IEBAIC0xNDI0LDcgKzE0MjQsNyBAQCBkcm1fYXRvbWljX2hlbHBlcl93
YWl0X2Zvcl92YmxhbmtzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAgCQlyZXQgPSB3YWl0
X2V2ZW50X3RpbWVvdXQoZGV2LT52YmxhbmtbaV0ucXVldWUsCj4gPiAgCQkJCW9sZF9zdGF0ZS0+
Y3J0Y3NbaV0ubGFzdF92YmxhbmtfY291bnQgIT0KPiA+ICAJCQkJCWRybV9jcnRjX3ZibGFua19j
b3VudChjcnRjKSwKPiA+IC0JCQkJbXNlY3NfdG9famlmZmllcyg1MCkpOwo+ID4gKwkJCQltc2Vj
c190b19qaWZmaWVzKDEwMCkpOwo+IAo+IDUwbXMgaXMgcHJldHR5IHRpZ2h0IGZvciAyNEh6IGFz
IHdlbGwuIEkgc3VwcG9zZSB3ZSBjb3VsZCBtYWtlIHRoaXMKPiBkZXBlbmQgb24gdGhlIGV4cGVj
dGVkIGZyYW1lL2ZpZWxkIGR1cmF0aW9uLCBidXQgaXQncyBnZW5lcmFsbHkKPiBpbmRpY2F0aXZl
IG9mIGEgcHJvZ3JhbW1pbmcgZXJyb3Igb2Ygc29tZSBzb3J0LCBzbyBhcyBsb25nIGFzIGl0J3MK
PiBsb25nIGVub3VnaCBJIHRoaW5rIHdlJ3JlIGdvb2QuCj4gCj4gUmV2aWV3ZWQtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpZZWFoIG1ha2VzIHNl
bnNlIHRvIGJ1bXAgdGhpcyBhIGJpdC4gQW4gdWJlci1mYW5jeSB2ZXJzaW9uIHdvdWxkIGxvb2sg
YXQKdGhlIHByb2dyYW1tZWQgcmVmcmVzaCByYXRlIGFuZCBtYXliZSBnaXZlIHRoZSBkcml2ZXIg
ZXh0cmEgc2xhY2sgZm9yIHRoZQpmaXJzdCBmcmFtZSBhZnRlciBhIG1vZGVzZXQuIEJ1dCB0aGlz
IGlzIGdvb2QgZW5vdWdoLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cgo+IAo+ID4gIAo+ID4gIAkJV0FSTighcmV0LCAiW0NSVEM6JWQ6JXNdIHZi
bGFuayB3YWl0IHRpbWVkIG91dFxuIiwKPiA+ICAJCSAgICAgY3J0Yy0+YmFzZS5pZCwgY3J0Yy0+
bmFtZSk7Cj4gPiAtLSAKPiA+IDIuMjAuMQo+IAo+IC0tIAo+IFZpbGxlIFN5cmrDpGzDpAo+IElu
dGVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
