Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1AE14F9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 11:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB996E12F;
	Wed, 23 Oct 2019 09:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730786E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 09:00:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so13122624wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 02:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=PK//52CzqrPfZAfNYXJUinQO+7VTIBfv4Q/Lsx4fhdc=;
 b=Inh15wk0KiwvWX/Uj2XV2aXobFHfYjqt+ayIoz0S8qguyigIi5YRNWCPHm6UFD97Bp
 BOOo3Veg6fCnjTiyff56fRdbVwmQ1Ejysi0uVAJNI4wzkir9JyNnZUfHcSMlOxVVXC9m
 8As9EvAT6vXzjCBps30dFNNdf5fqPUjtTY91hsfcpIH2fTR7R4Stq2tlOiueCVxQPUAq
 cEoMv7fsp+gML5KTmBKoywQpkVjuM/lfovT4M/PU/BJpsqQVhBuRmA4JuUVftwV6IQda
 EMp8vx79NHygUd7agGGr+PVG74yNmZVd1qy29CP+ncaHmamVE1kG9oS8+gj03bkjSksf
 d5rA==
X-Gm-Message-State: APjAAAVe5tTW1kMwwEOtncYkpco0sT8fcqN57IDF+XJplPHAMIorkCBw
 RdcniPPoUmp94Ls/fxcg4EHZPA==
X-Google-Smtp-Source: APXvYqyCInCt+nKVnPE24EcNYONFvO+iEVBRYHONXzKkLCEIk/SnHzYwEkAZ2N95Ndb9b2c7w8l6ZA==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr6381552wmc.23.1571821257979; 
 Wed, 23 Oct 2019 02:00:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g5sm5550772wma.43.2019.10.23.02.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 02:00:57 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:00:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/2] drm/todo: Remove i915 device_link task
Message-ID: <20191023090055.GU11828@phenom.ffwll.local>
References: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
 <20191022170301.GF85762@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022170301.GF85762@art_vandelay>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PK//52CzqrPfZAfNYXJUinQO+7VTIBfv4Q/Lsx4fhdc=;
 b=Z7SWB3e/zcpYQDEs8N2KJAdBs58zTKo7r2NFWj3K5NqGhCgZEAE8OaHOBlQVnKO0CL
 LEWSiyrdLAjjuRw8HjueK+pfRZqCeH5DlHy3Kl5C0/zO/WlmBMgwbR4sf4bHnN9zcuTo
 UAhLodGo1GdbG/R7IPhFDOjIO+kj/Y9ocTriI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDE6MDM6MDFQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDA1OjI1OjI5UE0gKzAyMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPiBEb25lIHdpdGgKPiA+IAo+ID4gY29tbWl0IGFlZjlmMzNiNzY1OGE3NDg5
ZjcxZGY1ZDZlNmVjYjQ3ZjI1MjFlOGEKPiA+IEF1dGhvcjogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPgo+ID4gRGF0ZTogICBUdWUgT2N0IDIzIDE3OjQzOjEwIDIwMTggKzAzMDAKPiA+
IAo+ID4gICAgIGRybS9pOTE1OiBFbnN1cmUgcHJvcGVyIEhEQSBzdXNwZW5kL3Jlc3VtZSBvcmRl
cmluZyB3aXRoIGEgZGV2aWNlIGxpbmsKPiA+IAo+ID4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFr
QGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gCj4gUmV2aWV3ZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
PgoKQm90aCBwYXRjaGVzIGFwcGxpZWQsIHRoYW5rcyBmb3IgdGFraW5nIGEgbG9vay4KLURhbmll
bAoKPiAKPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgNyAtLS0tLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
Cj4gPiBpbmRleCAyM2IzYTY3Nzk0YmEuLjlhYzEwMjkyMjcxMiAxMDA2NDQKPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2Rv
LnJzdAo+ID4gQEAgLTQzOCwxMyArNDM4LDYgQEAgU2VlIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9UT0RPIGZvciB0YXNrcy4KPiA+ICAKPiA+ICBDb250YWN0OiBIYXJyeSBXZW50bGFuZCwg
QWxleCBEZXVjaGVyCj4gPiAgCj4gPiAtaTkxNQo+ID4gLS0tLS0KPiA+IC0KPiA+IC0tIE91ciBl
YXJseS9sYXRlIHBtIGNhbGxiYWNrcyBjb3VsZCBiZSByZW1vdmVkIGluIGZhdm91ciBvZiB1c2lu
Zwo+ID4gLSAgZGV2aWNlX2xpbmtfYWRkIHRvIG1vZGVsIHRoZSBkZXBlbmRlbmN5IGJldHdlZW4g
aTkxNSBhbmQgc25kX2hhZC4gU2VlCj4gPiAtICBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcv
ZG9jcy9kcm0vZHJpdmVyLWFwaS9kZXZpY2VfbGluay5odG1sCj4gPiAtCj4gPiAgQm9vdHNwbGFz
aAo+ID4gID09PT09PT09PT0KPiA+ICAKPiA+IC0tIAo+ID4gMi4yMy4wCj4gPiAKPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAo+
IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9T
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
