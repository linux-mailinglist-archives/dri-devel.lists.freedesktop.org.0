Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F084B461E1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DBB899D5;
	Fri, 14 Jun 2019 14:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA4899D4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:59:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e3so3882576edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 07:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hQMXPMhOHeLBad0cZmA+9yYTLsxwCZIp4hx9RJqu4Sc=;
 b=f3f0MA9eIO+RVaSljZaH3pQmcy5d6fpd2mrN7P1Kd4XUPcC8kcKMGm+kMMAkJOCXT0
 0eXoyiCfBeWO8UNk2/OS7Oe6K+s+PxedoZ2d6j0YR240iYiMXVY6PgMYAqVOQAN11FMQ
 147Fl/RTLBzd9PYx+edeDI+M6YCrYWjRov8KcXRjaRxvBn8Vpkf2+v63J59U0wvIiJyV
 MwgjI7Fzn+Keu4F9liLcmVcZe+WVdpy+tdQEvyXKzgxmk1jBn6trMD0YJy2B2/+Noxep
 b4+r9luD0ZZD2sbnkiYpbNtapfkrAGeemBbnlCoARcJkk8x73+lSs9JByyDPXA54Pr7y
 FSYA==
X-Gm-Message-State: APjAAAUob0RhXvZn0RpSaPJ4VsGlG3nJArxc390s6z50xzDuLx5I+iIn
 ZSUMsgO58t1L495VGVakYhymTQ==
X-Google-Smtp-Source: APXvYqzOybxM8WUaepBv/Fp3hXlSaN1jP+07BuIMHqXcBwY83cMbfpWyLynYnyWUCubT7mXdmLzLOg==
X-Received: by 2002:a50:8828:: with SMTP id b37mr59823279edb.266.1560524351237; 
 Fri, 14 Jun 2019 07:59:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m6sm928099ede.2.2019.06.14.07.59.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 07:59:10 -0700 (PDT)
Date: Fri, 14 Jun 2019 16:59:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] drm: debugfs: make drm_debugfs_remove_files() a void
 function
Message-ID: <20190614145908.GZ23020@phenom.ffwll.local>
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614095110.3716-1-gregkh@linuxfoundation.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hQMXPMhOHeLBad0cZmA+9yYTLsxwCZIp4hx9RJqu4Sc=;
 b=fMX55Ctw/YjiSeMACJegA/gwBOe8KdOX5pgOiNdyXFm/JwSaTF+r/AfvkmIV5v3Ned
 aADXqqb+68aabcJ+bfMFLfPjG/yUWP54jUemwkgeFQAtbY0CKTLZAcb9LHO4oFHcfU20
 OT+PhJ9dvh7/Ff8H8kFjaF59pe2aoN/ZEoIyo=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6NTE6MDlBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBjYW4gbm90IGZhaWwsIGFuZCBubyBvbmUgY2hlY2tz
IHRoZSBjdXJyZW50IHJldHVybiB2YWx1ZSwKPiBzbyBqdXN0IG1hcmsgaXQgYXMgYSB2b2lkIGZ1
bmN0aW9uIHNvIG5vIG9uZSBnZXRzIGNvbmZ1c2VkLgo+IAo+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyB8IDUg
KystLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RlYnVnZnMuaCAgICAgfCA5ICsrKystLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RlYnVnZnMuYwo+IGluZGV4IDZmMjgwMmU5YmZiNS4uNTE1NTY5MDAyYzg2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kZWJ1Z2ZzLmMKPiBAQCAtMjcwLDggKzI3MCw4IEBAIGludCBkcm1fZGVidWdmc19p
bml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yLCBpbnQgbWlub3JfaWQsCj4gIH0KPiAgCj4gIAo+
IC1pbnQgZHJtX2RlYnVnZnNfcmVtb3ZlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0
ICpmaWxlcywgaW50IGNvdW50LAo+IC0JCQkgICAgIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+
ICt2b2lkIGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlz
dCAqZmlsZXMsIGludCBjb3VudCwKPiArCQkJICAgICAgc3RydWN0IGRybV9taW5vciAqbWlub3Ip
CgpXZSdyZSB0cnlpbmcgdG8gZW50aXJlbHkgbnVrZSB0aGlzIGZ1bmN0aW9uIGhlcmUsIHNlZSB0
aGUga2VybmVsZG9jIGZvcgpkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKS4gT25seSB1c2VyIGxl
ZnQgaXMgdGVncmEsIGFuZCB3ZSBjYWxsIHRoZQoicmVtb3ZlIGFsbCBkZWJ1Z2ZzIGZpbGVzIiBh
bmQgdGhlIC0+ZWFybHlfdW5yZWdpc3RlciBob29rcyBhbGwgZnJvbSB0aGUKc2FtZSBwbGFjZS4g
U28gdGhpcyBjYW4gYWxsIGJlIGdhcmJhZ2UgY29sbGVjdGVkLiBJdCdzIG1pbGRseSBhbm5veWlu
ZwpiZWNhdXNlIHdlJ2QgbmVlZCB0byBtb3ZlIHRoZSBrZnJlZSBmcm9tIC0+ZWFybHlfdW5yZWdp
c3RlciBpbnRvIC0+ZGVzdHJveQpjYWxsYmFja3MsIGJlY2F1c2UgY29ubmVjdG9ycyBhcmUgdW5y
ZWdpc3RlciBiZWZvcmUgd2UgdGhyb3cgYXdheSBhbGwgdGhlCmRlYnVnZnMgZmlsZXMgaW4gZHJt
X2Rldl91bnJlZ2lzdGVyKCkuIEJ1dCBpbW8gdGhhdCdzIGNsZWFuZXIgYW53YXkuCgpVcCBmb3Ig
dGhhdD8KCkNoZWVycywgRGFuaWVsCj4gIHsKPiAgCXN0cnVjdCBsaXN0X2hlYWQgKnBvcywgKnE7
Cj4gIAlzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqdG1wOwo+IEBAIC0yODksNyArMjg5LDYgQEAgaW50
IGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmls
ZXMsIGludCBjb3VudCwKPiAgCQl9Cj4gIAl9Cj4gIAltdXRleF91bmxvY2soJm1pbm9yLT5kZWJ1
Z2ZzX2xvY2spOwo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZGVidWdm
c19yZW1vdmVfZmlsZXMpOwo+ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RlYnVn
ZnMuaCBiL2luY2x1ZGUvZHJtL2RybV9kZWJ1Z2ZzLmgKPiBpbmRleCBhYzBmNzVkZjFhYzkuLjQy
MmQwZDIwMWMwYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZGVidWdmcy5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2RlYnVnZnMuaAo+IEBAIC04MSw4ICs4MSw4IEBAIHN0cnVjdCBk
cm1faW5mb19ub2RlIHsKPiAgaW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhjb25zdCBzdHJ1
Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMsCj4gIAkJCSAgICAgaW50IGNvdW50LCBzdHJ1Y3QgZGVu
dHJ5ICpyb290LAo+ICAJCQkgICAgIHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKTsKPiAtaW50IGRy
bV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMs
Cj4gLQkJCSAgICAgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7Cj4gK3ZvaWQg
ZHJtX2RlYnVnZnNfcmVtb3ZlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxl
cywKPiArCQkJICAgICAgaW50IGNvdW50LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcik7Cj4gICNl
bHNlCj4gIHN0YXRpYyBpbmxpbmUgaW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhjb25zdCBz
dHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMsCj4gIAkJCQkJICAgaW50IGNvdW50LCBzdHJ1Y3Qg
ZGVudHJ5ICpyb290LAo+IEBAIC05MSwxMCArOTEsOSBAQCBzdGF0aWMgaW5saW5lIGludCBkcm1f
ZGVidWdmc19jcmVhdGVfZmlsZXMoY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgKmZpbGVzLAo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbmxpbmUgaW50IGRybV9kZWJ1Z2ZzX3Jl
bW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmlsZXMsCj4gLQkJCQkJICAg
aW50IGNvdW50LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPiArc3RhdGljIGlubGluZSB2b2lk
IGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAqZmls
ZXMsCj4gKwkJCQkJICAgIGludCBjb3VudCwgc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4gIHsK
PiAtCXJldHVybiAwOwo+ICB9Cj4gICNlbmRpZgo+ICAKPiAtLSAKPiAyLjIyLjAKPiAKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
