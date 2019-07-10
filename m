Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CACD649DD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DEA6E0BF;
	Wed, 10 Jul 2019 15:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FFA6E0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:41:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so2599981edr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=lMe6kVx66RdhX1xB1vTfyq0dtk66JEEqhmZYRc6zOt0=;
 b=Qbp3N9widIzU8/6LGVLpkcecv1AEbiHn7a0QAacQE1jcHh/ZfVmdnssfg+xevJOzK6
 m98HrMUGrjt4C9m81mK0/sKp0W7L7HlK6OGIvGtuW8VLdwVb2eWEEGvfsSYs9rc/mL65
 POgEUB2PLfotBQm/7GFv/zidQDX86R1Sf2LzYKgXr2Q1v/qkRDOmSOjlgo8wqr2SXWca
 wwoqpGBRPd2COABYFGkAEqU7w0p1TNMKzUErQ1c4z23ITa53/NQ0u5Lh/+WYLdUpJX8s
 Q5XOKB3mXhizHdFbahBb4qGvtnMXGv0yGEcrcroJpDauL9LuyWEnpZTBAAaAgYlXh0dX
 uQiA==
X-Gm-Message-State: APjAAAUWPr3EHlfrCTKgI57v4s2FRtkaV/1/5S+a082zgtUfSb/rpsBf
 jFLf2y335jdZrt4Eh0Y0u/KPSw==
X-Google-Smtp-Source: APXvYqxdVw4XHXaumGcQmY/BJ6KChmY1TXBfjSZztgIPmfL+vCggJU43Fcfi8sUsmc+MPaRtre1tOA==
X-Received: by 2002:a50:9965:: with SMTP id l34mr33407249edb.152.1562773302777; 
 Wed, 10 Jul 2019 08:41:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id uz27sm588010ejb.24.2019.07.10.08.41.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:41:41 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:41:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 01/60] drm/edid: Add flag to drm_display_info to identify
 HDMI sinks
Message-ID: <20190710154139.GW15868@phenom.ffwll.local>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707181031epcas2p4275031dfdb38afff6f357e3c227efec9@epcas2p4.samsung.com>
 <20190707180852.5512-2-laurent.pinchart@ideasonboard.com>
 <1b609054-cf4f-fafc-8b76-6cb50a03f4ff@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b609054-cf4f-fafc-8b76-6cb50a03f4ff@samsung.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=lMe6kVx66RdhX1xB1vTfyq0dtk66JEEqhmZYRc6zOt0=;
 b=Zoa4ohOVwbZ4amoFoiHlDSBh9iZQeViKg9Xt6GEIaA/fbFukvsq4EO9eTbBRm205Il
 flkWW1l74gmEmyptlX99Hx2GbTU+ZNEkj8ed1jFcNJYyrllOnYkH/aOwwghDqOVnxyqs
 9MRpmrtX6Rq7oPBsbN56Kf6hs6aRo6YkinrlI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMDM6MjA6NThQTSArMDIwMCwgQW5kcnplaiBIYWpkYSB3
cm90ZToKPiBPbiAwNy4wNy4yMDE5IDIwOjA3LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4g
VGhlIGRybV9kaXNwbGF5X2luZm8gc3RydWN0dXJlIGNvbnRhaW5zIG1hbnkgZmllbGRzIHJlbGF0
ZWQgdG8gSERNSQo+ID4gc2lua3MsIGJ1dCBub25lIHRoYXQgaWRlbnRpZmllcyBpZiBhIHNpbmsg
Y29tcGxpYW50IHdpdGggQ0VBLTg2MSAoRURJRCkKPiA+IHNoYWxsIGJlIHRyZWF0ZWQgYXMgYW4g
SERNSSBzaW5rIG9yIGEgRFZJIHNpbmsuIEFkZCBzdWNoIGEgZmxhZywgYW5kCj4gPiBwb3B1bGF0
ZSBpdCBhY2NvcmRpbmcgdG8gc2VjdGlvbiA4LjMuMyAoIkRWSS9IRE1JIERldmljZQo+ID4gRGlz
Y3JpbWluYXRpb24iKSBvZiB0aGUgSERNSSB2MS4zIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgo+IAo+IAo+IEl0IGxvb2tzIGxpa2UgaXQgY2FuIHJlcGxhY2UgZHJtX2RldGVjdF9o
ZG1pX21vbml0b3IgdXNhZ2UgaW4gbW9zdCBjYXNlcy4KClllYWggSSB0aGluayBrZXJuZWxkb2Mg
c2hvdWxkIGF0IGxlYXN0IGJldHdlZW4gdGhlc2UgdG9vLCBpLmUuIGZyb20KaW5mby5pc19oZG1p
IHRvIGRybV9kZXRlY3RfaGRtaV9tb25pdG9yKCkgYW5kIGJhY2suCgpQbHVzIGlkZWFsbHkgYSBy
ZWZhY3RvciB0YXNrIGluIHRvZG8ucnN0LCB0aGlzIGlzIGlkZWFsIGdldHRpbmcgc3RhcnRlZApm
b2RkZXIgSSB0aGluay4gQW5kIEkgbGlrZSBpZiB3ZSBzdGFuZGFyZGl6ZSBhcyBtdWNoIGFzIHBv
c3NpYmxlIG9uCmRybV9kaXNwbGF5X2luZm8uCgpXaXRoIHRoYXQ6IFJldmlld2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IAo+IFJldmlld2VkLWJ5OiBBbmRy
emVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IAo+IMKgLS0KPiBSZWdhcmRzCj4gQW5k
cnplago+IAo+IAo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgIHwg
MyArKysKPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCA1ICsrKysrCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gaW5k
ZXggODJhNGNlZWQzZmNmLi5kMmU3YTUzMzRjM2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+
IEBAIC00NTU5LDYgKzQ1NTksOCBAQCBkcm1fcGFyc2VfaGRtaV92c2RiX3ZpZGVvKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGNvbnN0IHU4ICpkYikKPiA+ICAJc3RydWN0IGRybV9k
aXNwbGF5X2luZm8gKmluZm8gPSAmY29ubmVjdG9yLT5kaXNwbGF5X2luZm87Cj4gPiAgCXU4IGxl
biA9IGNlYV9kYl9wYXlsb2FkX2xlbihkYik7Cj4gPiAgCj4gPiArCWluZm8tPmlzX2hkbWkgPSB0
cnVlOwo+ID4gKwo+ID4gIAlpZiAobGVuID49IDYpCj4gPiAgCQlpbmZvLT5kdmlfZHVhbCA9IGRi
WzZdICYgMTsKPiA+ICAJaWYgKGxlbiA+PSA3KQo+ID4gQEAgLTQ2MjcsNiArNDYyOSw3IEBAIGRy
bV9yZXNldF9kaXNwbGF5X2luZm8oc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiA+
ICAJaW5mby0+Y2VhX3JldiA9IDA7Cj4gPiAgCWluZm8tPm1heF90bWRzX2Nsb2NrID0gMDsKPiA+
ICAJaW5mby0+ZHZpX2R1YWwgPSBmYWxzZTsKPiA+ICsJaW5mby0+aXNfaGRtaSA9IGZhbHNlOwo+
ID4gIAlpbmZvLT5oYXNfaGRtaV9pbmZvZnJhbWUgPSBmYWxzZTsKPiA+ICAJaW5mby0+cmdiX3F1
YW50X3JhbmdlX3NlbGVjdGFibGUgPSBmYWxzZTsKPiA+ICAJbWVtc2V0KCZpbmZvLT5oZG1pLCAw
LCBzaXplb2YoaW5mby0+aGRtaSkpOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gaW5kZXggY2E3NDVk
OWZlYWY1Li5lODBjYTBkMTQ5ZTUgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gQEAgLTQy
Niw2ICs0MjYsMTEgQEAgc3RydWN0IGRybV9kaXNwbGF5X2luZm8gewo+ID4gIAkgKi8KPiA+ICAJ
Ym9vbCBkdmlfZHVhbDsKPiA+ICAKPiA+ICsJLyoqCj4gPiArCSAqIEBpc19oZG1pOiBUcnVlIGlm
IHRoZSBzaW5rIGlzIGFuIEhETUkgZGV2aWNlLgo+ID4gKwkgKi8KPiA+ICsJYm9vbCBpc19oZG1p
Owo+ID4gKwo+ID4gIAkvKioKPiA+ICAJICogQGhhc19oZG1pX2luZm9mcmFtZTogRG9lcyB0aGUg
c2luayBzdXBwb3J0IHRoZSBIRE1JIGluZm9mcmFtZT8KPiA+ICAJICovCj4gCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
