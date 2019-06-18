Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93B4A2F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147A26E192;
	Tue, 18 Jun 2019 13:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E02F6E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:09 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z25so21860662edq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=5R+NHLt8PsIXt8anR6pHPXfCo/6c3mgcVEHW0Oc9gbQ=;
 b=cj7rQYn5Dwn9G2gmvLtC3c6swufpP03bUf6B9QApXmZMTL/nLhyU5999EGVQPAPW3I
 wbemgS0EmoD7f//Gg3b/c7kn6bZ0kIPXS58S4qBjpL1YJ1MQHzzbbgTmK93ASBH9gZbE
 3298U986/5hfQX1ZtRXk+U62Q4JJCAZPRtJSQj30M3rmFBA0hSBqfk3fXi81U3s8XfXg
 bGvnJ+nN7PRwVhnjqy2OKMCxETfZkT8tvhLGdM6TS0yde6KHjezmTCQLbjxNuCVKq0/u
 goxuIln4olkPDLszqgnwXFu2I5Rh7UqFw0MKMcHFwL/DMgjQuiOa0gy/ydURLFwIGe2f
 qQEQ==
X-Gm-Message-State: APjAAAV93HTfRTzLbejj5HATOiJKVPz/naxsl5y40DuT+spbTh/h5/SH
 Q6f6KLKGYMAW+kMMiqDpNMzDsA==
X-Google-Smtp-Source: APXvYqyBb0v30F83VtHb2y9yPf5YE3kiCupaF4YgpnDXka6VJj+7GT+WSSudOjww3CuybbgcAiEZ8g==
X-Received: by 2002:a17:906:2415:: with SMTP id
 z21mr82019805eja.211.1560866288249; 
 Tue, 18 Jun 2019 06:58:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id o22sm4776392edc.37.2019.06.18.06.58.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 06:58:07 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:58:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] docs: fix some broken references due to txt->rst renames
Message-ID: <20190618135804.GZ12905@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Ajay Gupta <ajayg@nvidia.com>,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Otto Sabart <ottosabart@seberm.com>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org
References: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5R+NHLt8PsIXt8anR6pHPXfCo/6c3mgcVEHW0Oc9gbQ=;
 b=IomabLXyUSPmgwDNcXRKvVrUMuM5eZ/qFxhM5kHvyjpENaInZNJNgpWS2VXKwHAf8l
 NEYfD3/Cknpfi5MEzA9EZaX9F2yCLM3CKUM7IF4wGm/S5BpJNzl8Jsl5PsP0DTT3/X1D
 dmpJqayomyio9iJpF1/FYtElgLw9pM2lZeCXI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ajay Gupta <ajayg@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Li Yang <leoyang.li@nxp.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Otto Sabart <ottosabart@seberm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTA6MzM6NThBTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IFRoZXJlIGFyZSB0aHJlZSBsZWZ0LW92ZXJzIGZyb20gdGhlIHJlY2Vu
dCBmaWxlIHJlbmFtZXMsCj4gcHJvYmFibHkgZHVlIHRvIHNvbWUgb3RoZXIgY29uZmxpY3Rpbmcg
cGF0Y2guCj4gCj4gRml4IHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiAtLS0KPiAKPiBUaGlzIHBhdGNo
IGlzIGFnYWluc3QgdG9kYXkncyBuZXh0LTIwMTkwNjE3IGJyYW5jaC4gTm90IHN1cmUgaWYgaXQK
PiB3aWxsIGFwcGx5IGNsZWFubHkgYXQgLWRvY3MgdHJlZS4gSWYgbm90LCAgUGxlYXNlIGxldCBt
ZSBrbm93IGZvciBtZSB0bwo+IHNwbGl0LgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vaWRsZS1zdGF0ZXMudHh0IHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9ydW50aW1lX3BtLmggICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1udmlkaWEtZ3B1LmMgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vaWRsZS1zdGF0ZXMudHh0Cj4gaW5k
ZXggM2JkYmU2NzViOWU2Li5kOGQ5YWE3MTY3ZTggMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9pZGxlLXN0YXRlcy50eHQKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dAo+IEBAIC03MDMs
NCArNzAzLDQgQEAgY3B1cyB7Cj4gICAgICBodHRwczovL3d3dy5kZXZpY2V0cmVlLm9yZy9zcGVj
aWZpY2F0aW9ucy8KPiAgCj4gIFs2XSBBUk0gTGludXggS2VybmVsIGRvY3VtZW50YXRpb24gLSBC
b290aW5nIEFBcmNoNjQgTGludXgKPiAtICAgIERvY3VtZW50YXRpb24vYXJtNjQvYm9vdGluZy50
eHQKPiArICAgIERvY3VtZW50YXRpb24vYXJtNjQvYm9vdGluZy5yc3QKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfcnVudGltZV9wbS5oCj4gaW5kZXggZjJkNjI5OWE4MTYxLi4zY2IzOTFjZDgx
YzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5oCj4gQEAgLTQ0
LDcgKzQ0LDcgQEAgZW51bSBpOTE1X2RybV9zdXNwZW5kX21vZGUgewo+ICAgKiB0byBiZSBkaXNh
YmxlZC4gVGhpcyBzaG91bGRuJ3QgaGFwcGVuIGFuZCB3ZSdsbCBwcmludCBzb21lIGVycm9yIG1l
c3NhZ2VzIGluCj4gICAqIGNhc2UgaXQgaGFwcGVucy4KPiAgICoKPiAtICogRm9yIG1vcmUsIHJl
YWQgdGhlIERvY3VtZW50YXRpb24vcG93ZXIvcnVudGltZV9wbS50eHQuCj4gKyAqIEZvciBtb3Jl
LCByZWFkIHRoZSBEb2N1bWVudGF0aW9uL3Bvd2VyL3J1bnRpbWVfcG0ucnN0Lgo+ICAgKi8KPiAg
c3RydWN0IGludGVsX3J1bnRpbWVfcG0gewo+ICAJYXRvbWljX3Qgd2FrZXJlZl9jb3VudDsKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW52aWRpYS1ncHUuYwo+IGluZGV4IGNmYzc2YjVkZTcyNi4uNWExMjM1
ZmQ4NmJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnZpZGlhLWdwdS5j
Cj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMKPiBAQCAtMzY0LDcg
KzM2NCw3IEBAIHN0YXRpYyB2b2lkIGdwdV9pMmNfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQo+ICAvKgo+ICAgKiBXZSBuZWVkIGdwdV9pMmNfc3VzcGVuZCgpIGV2ZW4gaWYgaXQgaXMgc3R1
YiwgZm9yIHJ1bnRpbWUgcG0gdG8gd29yawo+ICAgKiBjb3JyZWN0bHkuIFdpdGhvdXQgaXQsIGxz
cGNpIHNob3dzIHJ1bnRpbWUgcG0gc3RhdHVzIGFzICJEMCIgZm9yIHRoZSBjYXJkLgo+IC0gKiBE
b2N1bWVudGF0aW9uL3Bvd2VyL3BjaS50eHQgYWxzbyBpbnNpc3RzIGZvciBkcml2ZXIgdG8gcHJv
dmlkZSB0aGlzLgo+ICsgKiBEb2N1bWVudGF0aW9uL3Bvd2VyL3BjaS5yc3QgYWxzbyBpbnNpc3Rz
IGZvciBkcml2ZXIgdG8gcHJvdmlkZSB0aGlzLgo+ICAgKi8KPiAgc3RhdGljIF9fbWF5YmVfdW51
c2VkIGludCBncHVfaTJjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gLS0gCj4g
Mi4yMS4wCj4gCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
