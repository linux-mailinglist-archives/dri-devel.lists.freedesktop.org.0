Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03CF18F4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC86E22E;
	Wed,  6 Nov 2019 14:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01BD6E22E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:43:06 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id r9so5333547ilq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 06:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UgbtTe5dfKDfjSAPPMs/EABl+5bwJ2fJ35WEQgISza0=;
 b=UKlQ9k9dEHPvRzI7KL1SfByYJLuN0Z0F1O6sud2W9so8Mmeh659rOZvYjc/zMeiriV
 N8UBAJBqKdDOLW/x+Xa3jQiO5wbfnenmX7boTJvkRp1+WPaDWEAWesJO9kYjESSFEayo
 Xm2tXGuNejQj16ZSvrGQZVxWEk52sExTVs5oSQCtdYeAnTkDa2sJ//4zQJW12vMKPqF9
 S2WGxwN607LNVIeuCzp2ceOK/2upA8nHHMb6hDscIvjsLHlyoS09Ror1KygDY+Ka69Xy
 qqLgSMdhXiiAi1QtWxO3P/LxcrLIlozp06h0i0K8W0CZeIqA81Y9ViDtUqcof55h7rwb
 0nDg==
X-Gm-Message-State: APjAAAVJn3j5df/U5cYLwR5oYPfIyCJRxdCMa2aSgJ71Nf0X3zooSnxO
 KuJUnz6+pveSyRiEo+1iOV44IEVHPREWkxpNr4EDoA==
X-Google-Smtp-Source: APXvYqxrvorcUxqto/zT7qnrJ74yhghH4wbgzwgyazlJSpgoqiDGrdIhp+fcXb3osgPdsezRxHND7qjelFPlg9cKvkY=
X-Received: by 2002:a92:c152:: with SMTP id b18mr3052785ilh.71.1573051386198; 
 Wed, 06 Nov 2019 06:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20191105211034.123937-1-sean@poorly.run>
 <20191105211034.123937-8-sean@poorly.run>
 <1573031243.15410.2.camel@mtksdaap41>
In-Reply-To: <1573031243.15410.2.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 09:42:30 -0500
Message-ID: <CAMavQKJ+_+fytidjp4WvMwSrytJO_aU+57a54h1ACAqPHp3e7A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UgbtTe5dfKDfjSAPPMs/EABl+5bwJ2fJ35WEQgISza0=;
 b=DJ7GRoQwtoJVvxh25wjbOVxrGXKnOfZUfCfrccd998QNYDbeEbmI9jR+5Yf1CUA4MI
 U91L4xMXytJAtCx+r6/SK7Wc7mC5bpryeamAr+BD28yJ/ss41ilPO0FBhsBdc8NNwHTO
 pI6ajBoiiX1590yszT2CLjXcxRFL1BcAEK09Wr/xHZphiCaetD8mNRraZB0dInanLbeJ
 7EzcAgk3/SvyIkRdH+o0e93JbZzUC0KgRFYNXsQmNZUC3dr85fE5jSgX+rrKafPlo2qG
 beuQ/XbnZb8Rmo2s3OpSGsIBVGMvdCnCJgt7toEGxv518Hqq+sC7Avs9oZ3aZpaRDC/I
 rzEw==
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
Cc: Daniele Castagna <dcastagna@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fritz Koenig <frkoenig@chromium.org>, Miguel Casas <mcasas@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA0OjA3IEFNIENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
IHdyb3RlOgo+Cj4gSGksIFNlYW46Cj4KPiBPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTY6MTAgLTA1
MDAsIFNlYW4gUGF1bCB3cm90ZToKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPgo+ID4KPiA+IE5vdyB0aGF0IHdlIHN1cHBvcnQgYm90aCByZWZsZWN0aW9ucywgd2Ug
Y2FuIGV4cG9zZSAxODAgZGVncmVlIHJvdGF0aW9uCj4gPiBhbmQgcmVseSBvbiB0aGUgc2ltcGxp
Znkgcm91dGluZSB0byBjb252ZXJ0IHRoYXQgaW50byBSRUZMRUNUX1ggfAo+ID4gUkVGTEVDVF9Z
Cj4gPgo+Cj4gUGF0Y2ggMSB+IDYgb2YgdGhpcyBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4KPiBG
b3IgdGhpcyBvbmUsIEkgdGhpbmsgdGhlIHJvdGF0aW9uIGNoZWNrIGluIG10a19vdmxfbGF5ZXJf
Y2hlY2soKSBzaG91bGQKPiBiZSBtb2RpZmllZC4KPgoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2
aWV3cywgQ0shCgpJbiB3aGF0IHdheSB3b3VsZCB5b3UgbGlrZSB0aGUgY2hlY2sgdG8gYmUgbW9k
aWZpZWQ/IEknbSBndWVzc2luZwp5b3UncmUgYXNraW5nIHRoYXQgSSBhZGQgaXQgdG8gdGhlIGJp
dG1hc2sgcGFzc2VkIHRvIHRoZQpzaW1wbGlmeV9yb3RhdGlvbiBmdW5jdGlvbj8KCklmIHRoYXQn
cyB0aGUgY2FzZSwgd2UgZG9uJ3QgYWN0dWFsbHkgd2FudCB0byBtb2RpZnkgdGhlCnNpbXBsaWZ5
X3JvdGF0aW9uIGJpdG1hc2sgc2luY2UgdGhhdCBiaXRtYXNrIGlzIHN1cHBvc2VkIHRvIGJlIG9u
bHkKdGhlIHJvdGF0aW9ucyB0aGF0IHRoZSBoYXJkd2FyZSBjYW4gYWNoaWV2ZS4gU28gaWYgeW91
IHBhc3MgUk9UQVRFXzE4MAppbnRvIHNpbXBsaWZ5X3JvdGF0aW9uLCBpdCB3aWxsIHJldHVybiBS
RUZMRUNUX1ggfCBSRUZMRUNUX1ksIHdoaWNoIGlzCndoYXQgd2Ugd2FudC4gRG9lcyB0aGF0IG1h
a2Ugc2Vuc2UsIG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpUaGFua3MsCgpTZWFuCgo+IFJl
Z2FyZHMsCj4gQ0sKPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMK
PiA+IGluZGV4IGY0YzRkM2ZlZGM1Zi4uNGE1NWJiNmUyMjEzIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiA+IEBAIC0xNDMsOCArMTQzLDggQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBtdGtfb3ZsX2xheWVyX25yKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNv
bXApCj4gPgo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX292bF9zdXBwb3J0ZWRfcm90YXRp
b25zKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gPiAgewo+ID4gLSAgICAgcmV0dXJuIERS
TV9NT0RFX1JPVEFURV8wIHwgRFJNX01PREVfUkVGTEVDVF9ZIHwKPiA+IC0gICAgICAgICAgICBE
Uk1fTU9ERV9SRUZMRUNUX1g7Cj4gPiArICAgICByZXR1cm4gRFJNX01PREVfUk9UQVRFXzAgfCBE
Uk1fTU9ERV9ST1RBVEVfMTgwIHwKPiA+ICsgICAgICAgICAgICBEUk1fTU9ERV9SRUZMRUNUX1gg
fCBEUk1fTU9ERV9SRUZMRUNUX1k7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgaW50IG10a19vdmxf
bGF5ZXJfY2hlY2soc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwK
Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
