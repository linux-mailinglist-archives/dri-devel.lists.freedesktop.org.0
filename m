Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A4161A3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 12:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF5D89B00;
	Tue,  7 May 2019 10:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95DE89AA7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 10:05:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p27so3231169eda.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 03:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=UswE8rrHo9QpkEQ1cscUjaFrFCZrjR7SNVgDCehnvY4=;
 b=lV3EsLeLawBUmSKc2z0AvPU050a34HOYMgQvZOCiAqe4l9qFc3Z15iwEYMMdqit0Y0
 74XXLIhim1Ds1gmwyBRH6zxqTWqErADCa6mREi7MVcTm8cridCwHmRRqjr1YNNCo6nSC
 qvBHuw+ggdVNMKXVjbOlCvUJCj47CGTRgylExyO91kZGu5XPhCvJ8Qfa3ZqScgTJc959
 Ae4TuXIzBhyLCJLSjYYb8qZkLgBDt4lsgnHQeofu/YuiQEdLihDDaWxrQfBhzJF01gmK
 y688JpFPkxTzHjAX+lQjCl6NTQWeT91JQDroCTP3DFqfnQcivvEQusFszB/+B/qpqvkh
 jDBA==
X-Gm-Message-State: APjAAAUbj5Ywtpe/DOS+hToWP2aewKHkUItz/+f8JN0f8LCUFrPnBxtg
 ooFmKAwttQtu4zZIucvLjGkJig==
X-Google-Smtp-Source: APXvYqx10Oa/B2xszv1CzqJEyltgTlabbZu4UqLNgz7sqW1XDMCvuYWJUPrIGYjfWLlE2v4gSY7QxA==
X-Received: by 2002:a50:be05:: with SMTP id a5mr22512407edi.75.1557223536438; 
 Tue, 07 May 2019 03:05:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b48sm1072765edb.28.2019.05.07.03.05.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 03:05:35 -0700 (PDT)
Date: Tue, 7 May 2019 12:05:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: jagdsh.linux@gmail.com
Subject: Re: [PATCH] gpu/drm: Remove duplicate headers
Message-ID: <20190507100532.GP17751@phenom.ffwll.local>
Mail-Followup-To: jagdsh.linux@gmail.com, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, bskeggs@redhat.com,
 hierry.reding@gmail.com, jcrouse@codeaurora.org,
 jsanka@codeaurora.org, skolluku@codeaurora.org,
 paul.burton@mips.com, jrdr.linux@gmail.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
 <20190506144334.GH17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506144334.GH17751@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=UswE8rrHo9QpkEQ1cscUjaFrFCZrjR7SNVgDCehnvY4=;
 b=evcWe3qnR8Rs0GV0G6oQdOzN5VRQ17f1mfCNnZ9T5cwXYFQu5vI/OWowa9isuK8GqL
 QiGcByLmeamZ+oKRnXjqbUESbqdxOo9QEXFaGsfwcrbTH+NQXTgP9nJoGFTUpDLOyQfO
 eC1QYbRlJ3m1l2rTnX0em5lxT2P5wp6dw+Mik=
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, paul.burton@mips.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, hierry.reding@gmail.com, sean@poorly.run,
 skolluku@codeaurora.org, jrdr.linux@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDQ6NDM6MzRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE1heSAwMywgMjAxOSBhdCAxMToyODoxM1BNICswNTMwLCBqYWdkc2gu
bGludXhAZ21haWwuY29tIHdyb3RlOgo+ID4gRnJvbTogSmFnYWRlZXNoIFBhZ2FkYWxhIDxqYWdk
c2gubGludXhAZ21haWwuY29tPgo+ID4gCj4gPiBSZW1vdmUgZHVwbGljYXRlIGhlYWRlcnMgd2hp
Y2ggYXJlIGluY2x1ZGVkIHR3aWNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWdhZGVlc2gg
UGFnYWRhbGEgPGphZ2RzaC5saW51eEBnbWFpbC5jb20+Cj4gCj4gSSBjb2xsZWN0ZWQgc29tZSBh
Y2tzIGZvciB0aGUgbXNtIGFuZCBub3V2ZWF1IHBhcnRzIGFuZCBwdXNoZWQgdGhpcy4gRm9yCj4g
bmV4dCB0aW1lIGFyb3VuZCB3b3VsZCBiZSBncmVhdCBpZiB5b3Ugc3BsaXQgdGhlc2UgdXAgYWxv
bmcgZHJpdmVyL21vZHVsZQo+IGJvdW5kYXJpZXMsIHNvIHRoYXQgZWFjaCBtYWludGFpbmVyIGNh
biBwaWNrIHRoaXMgdXAgZGlyZWN0bHkuCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IC1E
YW5pZWwKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9o
d19sbS5jICAgICAgICAgICAgIHwgMSAtCj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvYnVzL252MDQuYyAgICAgICAgfCAyIC0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMgfCAxIC0KCkNvcnJlY3Rpb24sIHRo
aXMgZGlkbid0IGNvbXBpbGUsIHNvIEkgZHJvcHBlZCB0aGUgY2hhbmdlcyB0byBwYW5lbC1ycGku
CkFub3RoZXIgcmVhc29uIHRvIHNwbGl0IHBhdGNoZXMgbW9yZSBmb3IgbmV4dCB0aW1lIGFyb3Vu
ZC4gQWxzbywgbmVlZHMKbW9yZSBjb21waWxlIHRlc3RpbmcgKHlvdSBuZWVkIGNyb3NzIGNvbXBp
bGVycyBmb3IgYXQgbGVhc3QgYXJtIHRvIHRlc3QKdGhpcyBzdHVmZikuCi1EYW5pZWwKCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYwo+ID4gaW5kZXggMDE4ZGYyYy4uNDVhNWJjNiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfbG0uYwo+ID4gQEAg
LTE1LDcgKzE1LDYgQEAKPiA+ICAjaW5jbHVkZSAiZHB1X2h3aW8uaCIKPiA+ICAjaW5jbHVkZSAi
ZHB1X2h3X2xtLmgiCj4gPiAgI2luY2x1ZGUgImRwdV9od19tZHNzLmgiCj4gPiAtI2luY2x1ZGUg
ImRwdV9rbXMuaCIKPiA+ICAKPiA+ICAjZGVmaW5lIExNX09QX01PREUgICAgICAgICAgICAgICAg
ICAgICAgICAweDAwCj4gPiAgI2RlZmluZSBMTV9PVVRfU0laRSAgICAgICAgICAgICAgICAgICAg
ICAgMHgwNAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2J1cy9udjA0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9idXMv
bnYwNC5jCj4gPiBpbmRleCBjODBiOTY3Li4yYjQ0YmE1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL252MDQuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYnVzL252MDQuYwo+ID4gQEAgLTI2LDggKzI2
LDYgQEAKPiA+ICAKPiA+ICAjaW5jbHVkZSA8c3ViZGV2L2dwaW8uaD4KPiA+ICAKPiA+IC0jaW5j
bHVkZSA8c3ViZGV2L2dwaW8uaD4KPiA+IC0KPiA+ICBzdGF0aWMgdm9pZAo+ID4gIG52MDRfYnVz
X2ludHIoc3RydWN0IG52a21fYnVzICpidXMpCj4gPiAgewo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiA+IGluZGV4
IDJjOWM5NzIuLmNhY2YyZTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiA+IEBAIC01Myw3ICs1Myw2
IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3BtLmg+Cj4gPiAgCj4gPiAtI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybVAuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjLmg+Cj4gPiAgI2luY2x1
ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPiA+IC0tIAo+ID4gMS44LjMuMQo+ID4gCj4gCj4gLS0g
Cj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
