Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAA32AB4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 10:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBD8891FA;
	Mon,  3 Jun 2019 08:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58249891EF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 08:24:36 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id h10so10288669edi.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 01:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HE9MrYWk0LwOZ6ZhU7UYpiJ/R36kzKVGkvtKKkNs/QA=;
 b=hhZK7ArVcLSG5eueikMU4YNXo6Pa/kaugFx1F0OiLUSGj07MxloSOoCO9c5WPrXEiF
 zTYOEZrGPkmH1hyfvwWLQ9a+sU8v2zBe6un3aOahiWOQwZDjCf+6OftbN5s43dfe8HPE
 9U0FGs0Gm0HH9+/wdeqKrOHoXfj6aksDDWXrzMvzR/E64evSiP9S7nyfGV/SQnWLEM32
 G6CBzv7BmA5KmkM8+4tpv8tvkGrI9ezUdISAFhFE9CkSDEqhTM+Hvl+qMSdUEdJP8os7
 NCKy4C+xX/nOLWfr1lQ0jAXHAfHDnsPj38tkOC56wMNc6ED9MVGpw1e14oN5qPbru0XV
 uiDg==
X-Gm-Message-State: APjAAAVJOstBw799RlPSz/KvYKTwqsW7cEK238DHgn/C2DMSVR8zgkUU
 dvzix7dSLS8dhBaJAmrEglGK7g==
X-Google-Smtp-Source: APXvYqxJ/wAlk43GpRnV3PV5gXHHLDDhkUM038SKU6uDuQU9SIeBaTDO6XQ/DC/CcsjreVBz++xa8w==
X-Received: by 2002:aa7:d401:: with SMTP id z1mr27727697edq.129.1559550275278; 
 Mon, 03 Jun 2019 01:24:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f22sm2491026eja.16.2019.06.03.01.24.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 01:24:34 -0700 (PDT)
Date: Mon, 3 Jun 2019 10:24:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 4/4] video/hdmi: Dropped static functions from kernel doc
Message-ID: <20190603082432.GJ21222@phenom.ffwll.local>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
 <1559159944-21103-5-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559159944-21103-5-git-send-email-uma.shankar@intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HE9MrYWk0LwOZ6ZhU7UYpiJ/R36kzKVGkvtKKkNs/QA=;
 b=OV5Bpa5gdwyJ4k+zQCpLjxuAGAOUSWdTsmVq0xjy5xgbXwd4xjp1ckZ0tqEHR6T9c7
 Ebpw+LA09/83cmem1xfQgxB1szzNG35e14Y7cVvAIwQfedK51BZndr4raWTFOXa1qZCW
 JZuhKeAKtGARqoOGolY1INJRCE9bq39oN7+zg=
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDE6Mjk6MDRBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gRHJvcHBlZCBzdGF0aWMgZnVuY3Rpb25zIGZyb20ga2VybmVsIGRvY3VtZW50YXRpb24u
Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2ln
bmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy92aWRlby9oZG1pLmMgfCAzMiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9oZG1p
LmMKPiBpbmRleCBiOTliYTAxLi43MmM2NTRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
aGRtaS5jCj4gKysrIGIvZHJpdmVycy92aWRlby9oZG1pLmMKPiBAQCAtMTE5MSwxMSArMTE5MSwx
MSBAQCBzdGF0aWMgY29uc3QgY2hhciAqaGRtaV9udXBzX2dldF9uYW1lKGVudW0gaGRtaV9udXBz
IG51cHMpCj4gIAlyZXR1cm4gIkludmFsaWQiOwo+ICB9Cj4gIAo+IC0vKioKPiArLyoKPiAgICog
aGRtaV9hdmlfaW5mb2ZyYW1lX2xvZygpIC0gbG9nIGluZm8gb2YgSERNSSBBVkkgaW5mb2ZyYW1l
Cj4gLSAqIEBsZXZlbDogbG9nZ2luZyBsZXZlbAo+IC0gKiBAZGV2OiBkZXZpY2UKPiAtICogQGZy
YW1lOiBIRE1JIEFWSSBpbmZvZnJhbWUKPiArICogbGV2ZWw6IGxvZ2dpbmcgbGV2ZWwKPiArICog
ZGV2OiBkZXZpY2UKPiArICogZnJhbWU6IEhETUkgQVZJIGluZm9mcmFtZQo+ICAgKi8KPiAgc3Rh
dGljIHZvaWQgaGRtaV9hdmlfaW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKPiAgCQkJ
CSAgIHN0cnVjdCBkZXZpY2UgKmRldiwKPiBAQCAtMTI2OCwxMSArMTI2OCwxMSBAQCBzdGF0aWMg
Y29uc3QgY2hhciAqaGRtaV9zcGRfc2RpX2dldF9uYW1lKGVudW0gaGRtaV9zcGRfc2RpIHNkaSkK
PiAgCXJldHVybiAiUmVzZXJ2ZWQiOwo+ICB9Cj4gIAo+IC0vKioKPiArLyoKPiAgICogaGRtaV9z
cGRfaW5mb2ZyYW1lX2xvZygpIC0gbG9nIGluZm8gb2YgSERNSSBTUEQgaW5mb2ZyYW1lCj4gLSAq
IEBsZXZlbDogbG9nZ2luZyBsZXZlbAo+IC0gKiBAZGV2OiBkZXZpY2UKPiAtICogQGZyYW1lOiBI
RE1JIFNQRCBpbmZvZnJhbWUKPiArICogbGV2ZWw6IGxvZ2dpbmcgbGV2ZWwKPiArICogZGV2OiBk
ZXZpY2UKPiArICogZnJhbWU6IEhETUkgU1BEIGluZm9mcmFtZQo+ICAgKi8KCkZvciBpbnRlcm5h
bCBmdW5jdGlvbnMgSSB0aGluayB0aGVyZSdzIG5vdCByZWFsbHkgYW55IHZhbHVlIGluIGRvY3Vt
ZW50aW5nCnRoaXMuIFRoZSB2YXJpYWJsZSBuYW1lcyBhcmUgb2J2aW91cyBlbm91Z2guIEltbyBi
ZXR0ZXIgdG8gZGl0Y2ggdGhpcwpvdXRyaWdodC4KLURhbmllbAoKPiAgc3RhdGljIHZvaWQgaGRt
aV9zcGRfaW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKPiAgCQkJCSAgIHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiBAQCAtMTQwNCwxMSArMTQwNCwxMSBAQCBzdGF0aWMgdm9pZCBoZG1pX3Nw
ZF9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+ICAJcmV0dXJuICJSZXNlcnZlZCI7
Cj4gIH0KPiAgCj4gLS8qKgo+ICsvKgo+ICAgKiBoZG1pX2F1ZGlvX2luZm9mcmFtZV9sb2coKSAt
IGxvZyBpbmZvIG9mIEhETUkgQVVESU8gaW5mb2ZyYW1lCj4gLSAqIEBsZXZlbDogbG9nZ2luZyBs
ZXZlbAo+IC0gKiBAZGV2OiBkZXZpY2UKPiAtICogQGZyYW1lOiBIRE1JIEFVRElPIGluZm9mcmFt
ZQo+ICsgKiBsZXZlbDogbG9nZ2luZyBsZXZlbAo+ICsgKiBkZXY6IGRldmljZQo+ICsgKiBmcmFt
ZTogSERNSSBBVURJTyBpbmZvZnJhbWUKPiAgICovCj4gIHN0YXRpYyB2b2lkIGhkbWlfYXVkaW9f
aW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKPiAgCQkJCSAgICAgc3RydWN0IGRldmlj
ZSAqZGV2LAo+IEBAIC0xNDM3LDExICsxNDM3LDExIEBAIHN0YXRpYyB2b2lkIGhkbWlfYXVkaW9f
aW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICpsZXZlbCwKPiAgCQkJZnJhbWUtPmRvd25taXhfaW5o
aWJpdCA/ICJZZXMiIDogIk5vIik7Cj4gIH0KPiAgCj4gLS8qKgo+ICsvKgo+ICAgKiBoZG1pX2Ry
bV9pbmZvZnJhbWVfbG9nKCkgLSBsb2cgaW5mbyBvZiBIRE1JIERSTSBpbmZvZnJhbWUKPiAtICog
QGxldmVsOiBsb2dnaW5nIGxldmVsCj4gLSAqIEBkZXY6IGRldmljZQo+IC0gKiBAZnJhbWU6IEhE
TUkgRFJNIGluZm9mcmFtZQo+ICsgKiBsZXZlbDogbG9nZ2luZyBsZXZlbAo+ICsgKiBkZXY6IGRl
dmljZQo+ICsgKiBmcmFtZTogSERNSSBEUk0gaW5mb2ZyYW1lCj4gICAqLwo+ICBzdGF0aWMgdm9p
ZCBoZG1pX2RybV9pbmZvZnJhbWVfbG9nKGNvbnN0IGNoYXIgKmxldmVsLAo+ICAJCQkJICAgc3Ry
dWN0IGRldmljZSAqZGV2LAo+IC0tIAo+IDEuOS4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
