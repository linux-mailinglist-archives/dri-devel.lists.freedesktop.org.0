Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B1DADF5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B508F6EA78;
	Thu, 17 Oct 2019 13:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5255D6EA78
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:10:54 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id v1so659862ybo.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vS0J9MMiNPvloap1MkvqzEhnozB9ETsCGucSpEfpfEg=;
 b=J7J6M0jQY89VUkbFRyLpbymWvExs+REq4aRQMRF/mbCfpB3k87Xxv0oS/7uTubUsn9
 JONG/y72hAByqhhOshibAlkxj84KH1POUMqAR5gkMdORfIpdB0J1v6nY4NZCpbz3TWUi
 muJzT68XpMHipzTs7L9xU/Z4lA329p7HJ+njZ1zsBBKZqcVSx+Dv8QVrktx3gsleNuef
 vopVUb1e+ecruxNpPUENfdl4KazqhD2UELy2GzTlO5ECqRernzPK3yHFNVzzIgOsAYMu
 KSyrIRVZmxnDZRt1quxwbkR6NiELjGVjYkOlHBrBwUC8JgeKszj0kSbTricwsPiJS0IG
 /aSw==
X-Gm-Message-State: APjAAAWVu+a25fq06kX24dlYX8U6Q3yHT0PTc8dfVEbVKaUJF04o5yCc
 sUry4IUuvHGVYQdW5YzPxVXEnw==
X-Google-Smtp-Source: APXvYqzxJ//nQ4JPBtf9YYuhFmR6WWwTgZrOXfb4rm7cbQAMz9iCg4cRpCEyCtwxKedU5OT+Pm7KGQ==
X-Received: by 2002:a25:9cc5:: with SMTP id z5mr2075972ybo.82.1571317853239;
 Thu, 17 Oct 2019 06:10:53 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v143sm494967ywa.57.2019.10.17.06.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:10:52 -0700 (PDT)
Date: Thu, 17 Oct 2019 09:10:52 -0400
From: Sean Paul <sean@poorly.run>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] drm/mipi_dbi: Use simple right shift instead of
 double negation
Message-ID: <20191017131052.GA85762@art_vandelay>
References: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vS0J9MMiNPvloap1MkvqzEhnozB9ETsCGucSpEfpfEg=;
 b=WgBGspiEWQIpf1Cpa/m34xA5bYqTw3juwfP0asf4VPC2e5JnZ/KO546YjxrWFUsK7H
 CNHTz+6X28rgXXrnRMTbYCpyEY29uJ4SNGbJ/GINsmfMd6+oJRrA38xgOUp7KKjryvuP
 CoQPMCoHoUZtTT8OwgOCkKeRZwx8IwQyn6OhCIF3oS0gkNQVGlu+ixWSwToV5WK8cWq9
 +mvPcXvJqYIulYolOAzmaXEk14HWoGLMX8+vXNaXJZY6bRB+XpJ25lmo5fkkjaUyRDUn
 PvPTwrMd37Uxn+9mvA3x2L5VxxnuimKyLnuwa7FoEo586SkbpcRFAmZK7Rsu/VYbzacJ
 23sQ==
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDI6NDk6MTJQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IEdDQyBjb21wbGFpbnMgYWJvdXQgZHViaW91cyBiaXR3aXNlIE9SIG9wZXJhbmQ6
Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jOjEwMjQ6NDk6IHdhcm5pbmc6IGR1
YmlvdXM6IHggfCAheQo+ICAgQ0MgW01dICBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLm8K
PiAKPiBBcyBsb25nIGFzIGJ1ZmZlciBpcyBjb25zaXN0IG9mIGJ5dGUgKHU4KSB2YWx1ZXMsIHdl
IG1heSB1c2UKPiBzaW1wbGUgcmlnaHQgc2hpZnQgYW5kIHNhdGlzZnkgY29tcGlsZXIuIEl0IGFs
c28gcmVkdWNlcyBhbW91bnQgb2YKPiBvcGVyYXRpb25zIG5lZWRlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBp
X2RiaS5jCj4gaW5kZXggMTk2MWY3MTNhYWFiLi40NDVlODhiMWZjOWEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9taXBpX2RiaS5jCj4gQEAgLTEwMjEsNyArMTAyMSw3IEBAIHN0YXRpYyBpbnQgbWlwaV9kYmlf
dHlwZWMzX2NvbW1hbmRfcmVhZChzdHJ1Y3QgbWlwaV9kYmkgKmRiaSwgdTggKmNtZCwKPiAgCQl1
bnNpZ25lZCBpbnQgaTsKPiAgCj4gIAkJZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKQo+IC0JCQlk
YXRhW2ldID0gKGJ1ZltpXSA8PCAxKSB8ICEhKGJ1ZltpICsgMV0gJiBCSVQoNykpOwo+ICsJCQlk
YXRhW2ldID0gKGJ1ZltpXSA8PCAxKSB8IChidWZbaSArIDFdID4+IDcpOwoKWW91IHNob3VsZCBw
cm9iYWJseSBoYXZlICgoYnVmW2kgKyAxXSA+PiA3KSAmIDB4MSkgdG8gYmUgc3VwZXIgc2FmZS4K
CkRvIHlvdSBrbm93IGFueXRoaW5nIGFib3V0IHRoaXMgY29kZT8gSXQgc2VlbXMgbGlrZSBub3Ro
aW5nIGlzIHByb3RlY3RpbmcgdXMKZnJvbSBvdmVycnVubmluZyBidWYgaW4gdGhpcyBsb29wLiBX
ZSdyZSBqdXN0IGFzc3VtaW5nIHRoYXQgbGVuIDwgdHJbMV0ubGVuCnRocm91Z2ggdGhpcyBsb29w
IGFuZCBJJ20gbm90IHN1cmUgd2hhdCdzIHByb3RlY3RpbmcgdXMgZnJvbSBsb29raW5nIHdoZXJl
IHdlCnNob3VsZG4ndC4KClNlYW4KCj4gIAl9Cj4gIAo+ICAJTUlQSV9EQklfREVCVUdfQ09NTUFO
RCgqY21kLCBkYXRhLCBsZW4pOwo+IC0tIAo+IDIuMjMuMAo+IAoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
