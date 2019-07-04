Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DA5F4B0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058F96E30B;
	Thu,  4 Jul 2019 08:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14FA88FE1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:39:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so4662601edq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 01:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=cXA4gOqJAKmgOxYJW5OltkUG/QUTh+OQz3lCdf383IM=;
 b=pkJxgbgm1dMFZVbrDrhqkYqqDjBbBD5GMyvp2BGROcfAwmk8+EZMvStIzT/3LcHsvD
 CCpDXzU4i00WIacp+tH7hHXGdoSrcROMnC27Spet0l4fgbUR2kMUPpip7eRJI4VaUetb
 QoSPLCFIke7U2RdUw7ufvvjayGZyK6VoJZ4fQgXz1dnYStnuEW+O55mJ7+juLpo85aqf
 2mJLLcRye1EQlAZ1EDtMDEGCHlivdmz5VPk+jI+Ofso8L/+uI3qxzDu7+Pf6JCoP313Y
 p732wqApz5EwfU2bo/XhOwO/FfDCsKPFLTkEaKDPRT50ztC8ShNqoo23drLL+njmjogU
 vuGA==
X-Gm-Message-State: APjAAAUZ+SS64JYnMVY99WfE8zuXDn/AHDVObtkfPz4oe0YTCWtjRcaw
 aAr8pB/4OUtwbwAIFAxbgq4btD4LiJM=
X-Google-Smtp-Source: APXvYqwFCfDY8EhfQHoxQuKpl9fRFCKjfFqAmudxXRF2b5IN/4qeLoAiZQMntWPASxErG2pD3ZthTQ==
X-Received: by 2002:a50:8ba8:: with SMTP id m37mr47606457edm.29.1562229555121; 
 Thu, 04 Jul 2019 01:39:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id m32sm1453343edc.89.2019.07.04.01.39.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 01:39:14 -0700 (PDT)
Date: Thu, 4 Jul 2019 10:39:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
Message-ID: <20190704083912.GL15868@phenom.ffwll.local>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cXA4gOqJAKmgOxYJW5OltkUG/QUTh+OQz3lCdf383IM=;
 b=OtXItA68AbvIo7LR0Z4r9fXbZJ3gRinJNq756ApJTG7/j3UQyT8vCbT0R5dVikdRUS
 1DX6uOtDQ1OrANvZUqAS4+HiAkUAD5WXP77oztJP/f/BPGE+T8Zn44YUgTob5umc4bLB
 O7pR28qjGFwO2i3+oYJSeOvbxtCujwNyRjXVM=
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
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MzY6NDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSd2ZSBoYWQgdGhpcyBhbHJlYWR5IGZvciBhbnl0aGluZyBuZXcuIFdpdGggbXkg
ZHJtX3ByaW1lLmMgY2xlYW51cCBJCj4gYWxzbyB0aGluayBkb2N1bWVudGF0aW9ucyBmb3IgZXZl
cnl0aGluZyBhbHJlYWR5IGV4aXN0aW5nIGlzIGNvbXBsZXRlLAo+IGFuZCB3ZSBjYW4gYmFrZSB0
aGlzIGluIGFzIGEgcmVxdWlyZW1lbnRzIHN1YnN5c3RlbSB3aWRlLgo+IAo+IEFja2VkLWJ5OiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KCkZyb20gaXJjOgoKQWNrZWQtYnk6IE1heGltZSBSaXBhcmQgPG1h
eGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cgo+IC0tLQo+IHJlc2VuZGluZyBzdGFuZC1hbG9uZSBm
b3IgbW9yZSB2aXNpYmlsaXR5IGFuZCBhLWIgZ2F0aGVyaW5nLgo+IC1EYW5pZWwKPiAtLS0KPiAg
RG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdCB8IDEzICsrKysrKysrKysrKysKPiAg
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICB8IDEzIC0tLS0tLS0tLS0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdCBiL0RvY3VtZW50
YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QKPiBpbmRleCBmY2NiZTM3NTI0NGQuLmE5NGFkNmFk
MWY1NCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0Cj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdAo+IEBAIC01MSw2ICs1MSwx
OSBAQCBhbmQgIkZJWE1FIiB3aGVyZSB0aGUgaW50ZXJmYWNlIGNvdWxkIGJlIGNsZWFuZWQgdXAu
Cj4gIAo+ICBBbHNvIHJlYWQgdGhlIDpyZWY6YGd1aWRlbGluZXMgZm9yIHRoZSBrZXJuZWwgZG9j
dW1lbnRhdGlvbiBhdCBsYXJnZSA8ZG9jX2d1aWRlPmAuCj4gIAo+ICtEb2N1bWVudGF0aW9uIFJl
cXVpcmVtZW50cyBmb3Iga0FQSQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICsKPiArQWxsIGtlcm5lbCBBUElzIGV4cG9ydGVkIHRvIG90aGVyIG1vZHVsZXMgbXVzdCBi
ZSBkb2N1bWVudGVkLCBpbmNsdWRpbmcgdGhlaXIKPiArZGF0YXN0cnVjdHVyZXMgYW5kIGF0IGxl
YXN0IGEgc2hvcnQgaW50cm9kdWN0b3J5IHNlY3Rpb24gZXhwbGFpbmluZyB0aGUgb3ZlcmFsbAo+
ICtjb25jZXB0cy4gRG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgcHV0IGludG8gdGhlIGNvZGUgaXRz
ZWxmIGFzIGtlcm5lbGRvYyBjb21tZW50cwo+ICthcyBtdWNoIGFzIHJlYXNvbmFibGUuIERvIG5v
dCBibGluZGx5IGRvY3VtZW50IGV2ZXJ5dGhpbmcsIGJ1dCBkb2N1bWVudCBvbmx5Cj4gK3doYXQn
cyByZWxldmFudCBmb3IgZHJpdmVyIGF1dGhvcnM6IEludGVybmFsIGZ1bmN0aW9ucyBvZiBkcm0u
a28gYW5kIGRlZmluaXRlbHkKPiArc3RhdGljIGZ1bmN0aW9ucyBzaG91bGQgbm90IGhhdmUgZm9y
bWFsIGtlcm5lbGRvYyBjb21tZW50cy4gVXNlIG5vcm1hbCBDCj4gK2NvbW1lbnRzIGlmIHlvdSBm
ZWVsIGxpa2UgYSBjb21tZW50IGlzIHdhcnJhbnRlZC4gU2ltaWxhciBmb3IgZGF0YSBzdHJ1Y3R1
cmVzLAo+ICthbm5vdGF0ZSBhbnl0aGluZyBlbnRpcmVseSBwcml2YXRlIHdpdGggYGAvKiBwcml2
YXRlOiAqL2BgIGNvbW1lbnRzIGFzIHBlciB0aGUKPiArZG9jdW1lbnRhdGlvbiBndWlkZS4KPiAr
Cj4gIEdldHRpbmcgU3RhcnRlZAo+ICA9PT09PT09PT09PT09PT0KPiAgCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QK
PiBpbmRleCBlNzE3ZjI4MGY5YWUuLmRiODg5NjlhNTZlZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4g
QEAgLTMwMSwxOSArMzAxLDYgQEAgSW4gdGhlIGVuZCBubyAuYyBmaWxlIHNob3VsZCBuZWVkIHRv
IGluY2x1ZGUgYGBkcm1QLmhgYCBhbnltb3JlLgo+ICAKPiAgQ29udGFjdDogRGFuaWVsIFZldHRl
cgo+ICAKPiAtQWRkIG1pc3Npbmcga2VybmVsZG9jIGZvciBleHBvcnRlZCBmdW5jdGlvbnMKPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtCj4gLVRoZSBE
Uk0gcmVmZXJlbmNlIGRvY3VtZW50YXRpb24gaXMgc3RpbGwgbGFja2luZyBrZXJuZWxkb2MgaW4g
YSBmZXcgYXJlYXMuIFRoZQo+IC10YXNrIHdvdWxkIGJlIHRvIGNsZWFuIHVwIGludGVyZmFjZXMg
bGlrZSBtb3ZpbmcgZnVuY3Rpb25zIGFyb3VuZCBiZXR3ZWVuCj4gLWZpbGVzIHRvIGJldHRlciBn
cm91cCB0aGVtIGFuZCBpbXByb3ZpbmcgdGhlIGludGVyZmFjZXMgbGlrZSBkcm9wcGluZyByZXR1
cm4KPiAtdmFsdWVzIGZvciBmdW5jdGlvbnMgdGhhdCBuZXZlciBmYWlsLiBUaGVuIHdyaXRlIGtl
cm5lbGRvYyBmb3IgYWxsIGV4cG9ydGVkCj4gLWZ1bmN0aW9ucyBhbmQgYW4gb3ZlcnZpZXcgc2Vj
dGlvbiBhbmQgaW50ZWdyYXRlIGl0IGFsbCBpbnRvIHRoZSBkcm0gYm9vay4KPiAtCj4gLVNlZSBo
dHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvZG9jcy9kcm0vIGZvciB3aGF0J3MgdGhlcmUgYWxy
ZWFkeS4KPiAtCj4gLUNvbnRhY3Q6IERhbmllbCBWZXR0ZXIKPiAtCj4gIE1ha2UgcGFuaWMgaGFu
ZGxpbmcgd29yawo+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgCj4gLS0gCj4gMi4yMC4x
Cj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
