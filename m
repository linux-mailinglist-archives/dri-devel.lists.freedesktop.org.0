Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68346235
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BC989402;
	Fri, 14 Jun 2019 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91B789402
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:10:51 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so3979007edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ICHPjKZYIh5LzjgbWLdqrfD0NMZPEjYXFMNvE+SToGI=;
 b=sSOpZGzyk6VM1AqCEphohG6KicNMFEseKIqEfIO4l6ftaqcx6Tz0aSrIwURwye1S54
 H8IExv19YHPKhfsWCHt86XOBd69rGq1flaNHNGJsLjrRkVIsJ/Xpvn/suIR/WgjJW5c2
 15RgW+JYvCqrAjINlpdYpqqeKqVFKBcldHr6y8hVNGfo6O6PJN42mw1gBN9uNXWG4rlX
 V6frzg1eXsdqmT/wzQS2j1w1Muzq6vsHxYrP/hOSY8r+KtxnYfClkzuUtotiOnXrZRng
 4TN52q0Z1EfNE0G4gNVpKp/RoZE6107tNsjy0q+tRutblVE/nDDVUpcCLX579Y5hifdC
 yzRA==
X-Gm-Message-State: APjAAAXrpUmwBOcdTglfjjYamgfCcP4zD7olVHhUpdfkg3n/bX/iObVP
 PjELdbzOdRRtenO3XcpIGWSxpw==
X-Google-Smtp-Source: APXvYqwiUoUIi5LfU0PStY9S4OfA2GyIR1AZoUE/LT4vJqMsIiuC8H8Q+bNv7nEaEsxZo6U9DL6vOQ==
X-Received: by 2002:a17:906:6545:: with SMTP id
 u5mr84102776ejn.102.1560525050447; 
 Fri, 14 Jun 2019 08:10:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id hk1sm639832ejb.36.2019.06.14.08.10.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 08:10:49 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:10:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] drm: debugfs: make drm_debugfs_create_files() never
 fail
Message-ID: <20190614151047.GB23020@phenom.ffwll.local>
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
 <20190614095110.3716-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614095110.3716-2-gregkh@linuxfoundation.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ICHPjKZYIh5LzjgbWLdqrfD0NMZPEjYXFMNvE+SToGI=;
 b=Xp7Z94cPw+3nga1LcpKhLaWzVK0hsskFoS8lCDMpD2umllJcu1gKAo5eCVE8N88Bja
 Iw1uKGS0Gd4Xx1i7p25YYoHJoGKUdG2kbVgUeblDfdFoVpqq50fAogIpWfPpjZBTXbqr
 7VdjV2eEO6Q8GD1ZsBdq1oZMdYCgGad9f1cj0=
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

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6NTE6MTBBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IEFzIHN0YXRlZCBiZWZvcmUsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2FyZSBp
ZiBhIGRlYnVnZnMgZnVuY3Rpb24KPiBzdWNjZWVkcyBvciBub3QsIGFuZCBubyBjb2RlIGxvZ2lj
IGluIHRoZSBrZXJuZWwgc2hvdWxkIGV2ZXIgY2hhbmdlCj4gYmFzZWQgb24gYSBkZWJ1Z2ZzIGZ1
bmN0aW9uIHJldHVybiB2YWx1ZSwgc28gbWFrZQo+IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcygp
IG5ldmVyIGZhaWwuICBJZiBpdCBlbmNvdW50ZXJzIGFuCj4gb2RkL3JhcmUvaW1wb3NzaWJsZSBl
cnJvciAoaS5lLiBvdXQgb2YgbWVtb3J5LCBvciBhIGR1cGxpY2F0ZSBkZWJ1Z2ZzCj4gZmlsZW5h
bWUgdG8gYmUgY3JlYXRlZCksIGp1c3Qga2VlcCBvbiBtb3ZpbmcgYXMgaWYgbm90aGluZyBpbXBy
b3BlciBoYWQKPiBoYXBwZW5lZC4KPiAKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2ln
bmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KCkFwcGxpZWQgdGhpcyBvbmUgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtzLgotRGFuaWVsCgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyB8IDI2ICsrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCj4gaW5kZXggNTE1NTY5MDAyYzg2Li4wMDll
MWMwYWM3YjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwo+IEBAIC0xNzMsOSArMTczLDggQEAg
aW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9fbGlzdCAq
ZmlsZXMsIGludCBjb3VudCwKPiAgCQkJICAgICBzdHJ1Y3QgZGVudHJ5ICpyb290LCBzdHJ1Y3Qg
ZHJtX21pbm9yICptaW5vcikKPiAgewo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1pbm9y
LT5kZXY7Cj4gLQlzdHJ1Y3QgZGVudHJ5ICplbnQ7Cj4gIAlzdHJ1Y3QgZHJtX2luZm9fbm9kZSAq
dG1wOwo+IC0JaW50IGksIHJldDsKPiArCWludCBpOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBj
b3VudDsgaSsrKSB7Cj4gIAkJdTMyIGZlYXR1cmVzID0gZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVz
Owo+IEBAIC0xODUsMjIgKzE4NCwxMyBAQCBpbnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNv
bnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50IGNvdW50LAo+ICAJCQljb250aW51
ZTsKPiAgCj4gIAkJdG1wID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGRybV9pbmZvX25vZGUpLCBH
RlBfS0VSTkVMKTsKPiAtCQlpZiAodG1wID09IE5VTEwpIHsKPiAtCQkJcmV0ID0gLTE7Cj4gLQkJ
CWdvdG8gZmFpbDsKPiAtCQl9Cj4gLQkJZW50ID0gZGVidWdmc19jcmVhdGVfZmlsZShmaWxlc1tp
XS5uYW1lLCBTX0lGUkVHIHwgU19JUlVHTywKPiAtCQkJCQkgIHJvb3QsIHRtcCwgJmRybV9kZWJ1
Z2ZzX2ZvcHMpOwo+IC0JCWlmICghZW50KSB7Cj4gLQkJCURSTV9FUlJPUigiQ2Fubm90IGNyZWF0
ZSAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvJXBkLyVzXG4iLAo+IC0JCQkJICByb290LCBmaWxlc1tp
XS5uYW1lKTsKPiAtCQkJa2ZyZWUodG1wKTsKPiAtCQkJcmV0ID0gLTE7Cj4gLQkJCWdvdG8gZmFp
bDsKPiAtCQl9Cj4gKwkJaWYgKHRtcCA9PSBOVUxMKQo+ICsJCQljb250aW51ZTsKPiAgCj4gIAkJ
dG1wLT5taW5vciA9IG1pbm9yOwo+IC0JCXRtcC0+ZGVudCA9IGVudDsKPiArCQl0bXAtPmRlbnQg
PSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKGZpbGVzW2ldLm5hbWUsCj4gKwkJCQkJCVNfSUZSRUcgfCBT
X0lSVUdPLCByb290LCB0bXAsCj4gKwkJCQkJCSZkcm1fZGVidWdmc19mb3BzKTsKPiAgCQl0bXAt
PmluZm9fZW50ID0gJmZpbGVzW2ldOwo+ICAKPiAgCQltdXRleF9sb2NrKCZtaW5vci0+ZGVidWdm
c19sb2NrKTsKPiBAQCAtMjA4LDEwICsxOTgsNiBAQCBpbnQgZHJtX2RlYnVnZnNfY3JlYXRlX2Zp
bGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50IGNvdW50LAo+ICAJCW11
dGV4X3VubG9jaygmbWlub3ItPmRlYnVnZnNfbG9jayk7Cj4gIAl9Cj4gIAlyZXR1cm4gMDsKPiAt
Cj4gLWZhaWw6Cj4gLQlkcm1fZGVidWdmc19yZW1vdmVfZmlsZXMoZmlsZXMsIGNvdW50LCBtaW5v
cik7Cj4gLQlyZXR1cm4gcmV0Owo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2RlYnVnZnNfY3Jl
YXRlX2ZpbGVzKTsKPiAgCj4gLS0gCj4gMi4yMi4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
