Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D48994A3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005A6EB27;
	Thu, 22 Aug 2019 13:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9736EB27
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:13:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g8so7867165edm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HtLk3oxaM4om7ygPK/B5gozFUJvrA2yuG3PFg2GOfj8=;
 b=GGamS9vxQTpP8h/Dn89mtRO7OXZQRm1nRW9GytrNAe6txNUYrEeomg27viCPnIzumW
 BGFNCPwAJQsIogUfH32oRBYCiNPrLLphg010BTHOdxJfvU4SoyaVo48tPlWhupxwCH6R
 50C/bXEbcR6h5Yf3B3ZcaPP2ApSi21A20R6K7H1Qny30IS7T6ujc1oBDpePwuRdis3Mq
 yrveoxsg7CYuUd0aW68xhyCmVwJ5AMbp4cBSdBhRtyqm9hyjmRhTp7LjBoaKIupFPC0g
 3AwArMy5NYUxSxenHKMBlgPsj75oF+A8LJXDjiXJCivohr+Y6pTdwXkcDtU7u1bFt3yu
 boYA==
X-Gm-Message-State: APjAAAXFc4BM9j8q30WE6FXoj2vbf1lLuJ1QxD/QefyOFfbeFHkfPD8W
 m7zaxNkJXFTMCyOQbYLbSX45QA==
X-Google-Smtp-Source: APXvYqyZwbWEcsIVzY0o5kFX6A167joXQO30dOKmM8cQdDNHQAave2j5y3jaELAJK4kXgD2dFR7WLA==
X-Received: by 2002:a50:f052:: with SMTP id u18mr41318254edl.275.1566479597644; 
 Thu, 22 Aug 2019 06:13:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id rl6sm3664971ejb.64.2019.08.22.06.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 06:13:16 -0700 (PDT)
Date: Thu, 22 Aug 2019 15:13:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
Message-ID: <20190822131314.GX11147@phenom.ffwll.local>
References: <20190822090645.25410-1-kraxel@redhat.com>
 <20190822090645.25410-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822090645.25410-4-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HtLk3oxaM4om7ygPK/B5gozFUJvrA2yuG3PFg2GOfj8=;
 b=agwjFJzIXcV8cgTMRZmFFlH+ECnCAUJakVr/CtaCUyDGXQSwlu9vMk6atsgVbnSt1G
 c+wz7LH4auYk/gMbktk/onq0XXcMZCmgBrDAvKZ04apOJUry/c44WS80eVF1mQOIPfvn
 Ki1PXiW7nYD4dI0IiyRB1nPZiHlqfcj9ACip8=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTE6MDY6NDVBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBObyBuZWVkIGZvciBhIGhvbWUtZ3Jvd24gdmVyc2lvbiwgdGhlIGdlbmVyaWMgaGVs
cGVyIHNob3VsZCB3b3JrIGp1c3QKPiBmaW5lLiAgSXQgYWxzbyBoYW5kbGVzIHZnYWNvbiByZW1v
dmFsIHRoZXNlIGRheXMsIHNlZSBjb21taXQKPiAxYzc0Y2E3YTFhOWEgKCJkcm0vZmItaGVscGVy
OiBjYWxsIHZnYV9yZW1vdmVfdmdhY29uIGF1dG9tYXRpY2FsbHkuIiksCj4gc28gdGhhdCBjYW4g
YmUgcmVtb3ZlZCB0b28uCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KCkkgdGhpbmsgSSdkIHN0aWxsIHdhaXQgdW50aWwgNS40LXJjMSB3aXRoIG1lcmdp
bmcgdGhpcyBvbmUsIGp1c3QgdG8gZ2l2ZQphbm90aGVyIGZ1bGwgcmVsZWFzZSBhbmQgcGVvcGxl
IHRvIHRlc3QgaXQgYmVmb3JlIHdlIHB1bGwgdGhlIHRyaWdnZXIuCk92ZXJhYnVuZGFuY2Ugb2Yg
Y2F1dGlvbiBhbmQgYWxsIHRoYXQuCgpUaGFua3MgYSBsb3QgZm9yIGRvaW5nIHRoaXMhCi1EYW5p
ZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgfCA0MSArKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMzkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCj4gaW5kZXgg
Yjk5ZDczYzFjNGRiLi5kZGMzMTdjZWI4ZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMK
PiBAQCAtNzY2LDMxICs3NjYsNiBAQCBzdGF0aWMgaW50IGk5MTVfbG9hZF9tb2Rlc2V0X2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRp
YyBpbnQgaTkxNV9raWNrX291dF9maXJtd2FyZV9mYihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYpCj4gLXsKPiAtCXN0cnVjdCBhcGVydHVyZXNfc3RydWN0ICphcDsKPiAtCXN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gZGV2X3ByaXYtPmRybS5wZGV2Owo+IC0Jc3RydWN0IGk5MTVfZ2d0
dCAqZ2d0dCA9ICZkZXZfcHJpdi0+Z2d0dDsKPiAtCWJvb2wgcHJpbWFyeTsKPiAtCWludCByZXQ7
Cj4gLQo+IC0JYXAgPSBhbGxvY19hcGVydHVyZXMoMSk7Cj4gLQlpZiAoIWFwKQo+IC0JCXJldHVy
biAtRU5PTUVNOwo+IC0KPiAtCWFwLT5yYW5nZXNbMF0uYmFzZSA9IGdndHQtPmdtYWRyLnN0YXJ0
Owo+IC0JYXAtPnJhbmdlc1swXS5zaXplID0gZ2d0dC0+bWFwcGFibGVfZW5kOwo+IC0KPiAtCXBy
aW1hcnkgPQo+IC0JCXBkZXYtPnJlc291cmNlW1BDSV9ST01fUkVTT1VSQ0VdLmZsYWdzICYgSU9S
RVNPVVJDRV9ST01fU0hBRE9XOwo+IC0KPiAtCXJldCA9IGRybV9mYl9oZWxwZXJfcmVtb3ZlX2Nv
bmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhhcCwgImludGVsZHJtZmIiLCBwcmltYXJ5KTsKPiAtCj4g
LQlrZnJlZShhcCk7Cj4gLQo+IC0JcmV0dXJuIHJldDsKPiAtfQo+IC0KPiAgc3RhdGljIHZvaWQg
aW50ZWxfaW5pdF9kcGlvKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiAgewo+
ICAJLyoKPiBAQCAtMTU3MCwyMSArMTU0NSw5IEBAIHN0YXRpYyBpbnQgaTkxNV9kcml2ZXJfaW5p
dF9odyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCj4gIAlpZiAocmV0KQo+ICAJ
CWdvdG8gZXJyX3BlcmY7Cj4gIAo+IC0JLyoKPiAtCSAqIFdBUk5JTkc6IEFwcGFyZW50bHkgd2Ug
bXVzdCBraWNrIGZiZGV2IGRyaXZlcnMgYmVmb3JlIHZnYWNvbiwKPiAtCSAqIG90aGVyd2lzZSB0
aGUgdmdhIGZiZGV2IGRyaXZlciBmYWxscyBvdmVyLgo+IC0JICovCj4gLQlyZXQgPSBpOTE1X2tp
Y2tfb3V0X2Zpcm13YXJlX2ZiKGRldl9wcml2KTsKPiAtCWlmIChyZXQpIHsKPiAtCQlEUk1fRVJS
T1IoImZhaWxlZCB0byByZW1vdmUgY29uZmxpY3RpbmcgZnJhbWVidWZmZXIgZHJpdmVyc1xuIik7
Cj4gKwlyZXQgPSBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZm
ZXJzKHBkZXYsICJpbnRlbGRybWZiIik7Cj4gKwlpZiAocmV0KQo+ICAJCWdvdG8gZXJyX2dndHQ7
Cj4gLQl9Cj4gLQo+IC0JcmV0ID0gdmdhX3JlbW92ZV92Z2Fjb24ocGRldik7Cj4gLQlpZiAocmV0
KSB7Cj4gLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gcmVtb3ZlIGNvbmZsaWN0aW5nIFZHQSBjb25z
b2xlXG4iKTsKPiAtCQlnb3RvIGVycl9nZ3R0Owo+IC0JfQo+ICAKPiAgCXJldCA9IGk5MTVfZ2d0
dF9pbml0X2h3KGRldl9wcml2KTsKPiAgCWlmIChyZXQpCj4gLS0gCj4gMi4xOC4xCj4gCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
