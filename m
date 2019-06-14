Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE846AFE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3DA898EE;
	Fri, 14 Jun 2019 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5868B892EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so5198763edr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jopVjs1ZtwLEDssKa/MvAYuS6CFFWIv9JYOhNrUAu0Y=;
 b=L8sQYzGXroJewUC52QYXd7OIRx+7Yrp95T1SbSt21iH1zAReL/0jSGffKq8NMlzR1M
 X+9ES4YXohKxjtvINykk+61chAQEunN7EP3Rv52oE2Zv7iPdM0BuhQWohCnZNgjyKiOm
 gfRS5grJx8Aer2CXDyOT2y5kBSUI+XXqW1QgHFiNrNX51jivsEFKB9+f77ojP10sp70/
 L4fqD1dkAxdR8ds+SWgkeaD9H1Sf0wG6EVGWUtbrRvjtrcfrIZJyOkWPfmp2kEoiJnfz
 ElVy27tsZLVTMcOD+lf8RX3M9IZJV1tBSapb22aleL2xwagWbkw7BikK6VSYg2SZADp1
 RcXw==
X-Gm-Message-State: APjAAAUsMt1iXu/jmRPWBWshbTHc3aJx0rpQY2/m6vOMsa/+UEuRXPqE
 l+QmoJDQm5oEMLbylR7L/wdgZ3GhfOM=
X-Google-Smtp-Source: APXvYqz/eHCh/fI/IDRTsxZ4di6x9GoO6XRexaYbfJeCSRxXatAlJlk/KtmZgGEvRDZgUUzZ3aSTow==
X-Received: by 2002:a50:aeaf:: with SMTP id
 e44mr105605594edd.239.1560544649148; 
 Fri, 14 Jun 2019 13:37:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 59/59] drm/doc: Document kapi doc expectations
Date: Fri, 14 Jun 2019 22:36:15 +0200
Message-Id: <20190614203615.12639-60-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jopVjs1ZtwLEDssKa/MvAYuS6CFFWIv9JYOhNrUAu0Y=;
 b=f/KKoY8xcVk1JrB/RknvvEKfXm0haUxGNsIstH9sTEHK8+DFRLgGvjNb2mktWge1qt
 +PN25RkKplS04b6HPXEfei5X85+7smbe9jldNacb7kIO55rS6/kOYlZvRoZNGGhSveuJ
 +ewds0W2YprbENsuRXk09sorRQuuqw50DNcFw=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UndmUgaGFkIHRoaXMgYWxyZWFkeSBmb3IgYW55dGhpbmcgbmV3LiBXaXRoIG15IGRybV9wcmlt
ZS5jIGNsZWFudXAgSQphbHNvIHRoaW5rIGRvY3VtZW50YXRpb25zIGZvciBldmVyeXRoaW5nIGFs
cmVhZHkgZXhpc3RpbmcgaXMgY29tcGxldGUsCmFuZCB3ZSBjYW4gYmFrZSB0aGlzIGluIGFzIGEg
cmVxdWlyZW1lbnRzIHN1YnN5c3RlbSB3aWRlLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KLS0t
CiBEb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IHwgMTMgKysrKysrKysrKysrKwog
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICB8IDEzIC0tLS0tLS0tLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdCBiL0RvY3VtZW50YXRpb24v
Z3B1L2ludHJvZHVjdGlvbi5yc3QKaW5kZXggZmNjYmUzNzUyNDRkLi5hOTRhZDZhZDFmNTQgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2ludHJvZHVjdGlvbi5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdApAQCAtNTEsNiArNTEsMTkgQEAgYW5kICJGSVhN
RSIgd2hlcmUgdGhlIGludGVyZmFjZSBjb3VsZCBiZSBjbGVhbmVkIHVwLgogCiBBbHNvIHJlYWQg
dGhlIDpyZWY6YGd1aWRlbGluZXMgZm9yIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlvbiBhdCBsYXJn
ZSA8ZG9jX2d1aWRlPmAuCiAKK0RvY3VtZW50YXRpb24gUmVxdWlyZW1lbnRzIGZvciBrQVBJCist
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitBbGwga2VybmVsIEFQSXMgZXhw
b3J0ZWQgdG8gb3RoZXIgbW9kdWxlcyBtdXN0IGJlIGRvY3VtZW50ZWQsIGluY2x1ZGluZyB0aGVp
cgorZGF0YXN0cnVjdHVyZXMgYW5kIGF0IGxlYXN0IGEgc2hvcnQgaW50cm9kdWN0b3J5IHNlY3Rp
b24gZXhwbGFpbmluZyB0aGUgb3ZlcmFsbAorY29uY2VwdHMuIERvY3VtZW50YXRpb24gc2hvdWxk
IGJlIHB1dCBpbnRvIHRoZSBjb2RlIGl0c2VsZiBhcyBrZXJuZWxkb2MgY29tbWVudHMKK2FzIG11
Y2ggYXMgcmVhc29uYWJsZS4gRG8gbm90IGJsaW5kbHkgZG9jdW1lbnQgZXZlcnl0aGluZywgYnV0
IGRvY3VtZW50IG9ubHkKK3doYXQncyByZWxldmFudCBmb3IgZHJpdmVyIGF1dGhvcnM6IEludGVy
bmFsIGZ1bmN0aW9ucyBvZiBkcm0ua28gYW5kIGRlZmluaXRlbHkKK3N0YXRpYyBmdW5jdGlvbnMg
c2hvdWxkIG5vdCBoYXZlIGZvcm1hbCBrZXJuZWxkb2MgY29tbWVudHMuIFVzZSBub3JtYWwgQwor
Y29tbWVudHMgaWYgeW91IGZlZWwgbGlrZSBhIGNvbW1lbnQgaXMgd2FycmFudGVkLiBTaW1pbGFy
IGZvciBkYXRhIHN0cnVjdHVyZXMsCithbm5vdGF0ZSBhbnl0aGluZyBlbnRpcmVseSBwcml2YXRl
IHdpdGggYGAvKiBwcml2YXRlOiAqL2BgIGNvbW1lbnRzIGFzIHBlciB0aGUKK2RvY3VtZW50YXRp
b24gZ3VpZGUuCisKIEdldHRpbmcgU3RhcnRlZAogPT09PT09PT09PT09PT09CiAKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5y
c3QKaW5kZXggMDI2ZTU1YzUxN2UxLi4yNTg3OGRkMDQ4ZmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZ3B1L3RvZG8ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CkBAIC0y
OTksMTkgKzI5OSw2IEBAIEluIHRoZSBlbmQgbm8gLmMgZmlsZSBzaG91bGQgbmVlZCB0byBpbmNs
dWRlIGBgZHJtUC5oYGAgYW55bW9yZS4KIAogQ29udGFjdDogRGFuaWVsIFZldHRlcgogCi1BZGQg
bWlzc2luZyBrZXJuZWxkb2MgZm9yIGV4cG9ydGVkIGZ1bmN0aW9ucwotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLQotVGhlIERSTSByZWZlcmVuY2UgZG9jdW1l
bnRhdGlvbiBpcyBzdGlsbCBsYWNraW5nIGtlcm5lbGRvYyBpbiBhIGZldyBhcmVhcy4gVGhlCi10
YXNrIHdvdWxkIGJlIHRvIGNsZWFuIHVwIGludGVyZmFjZXMgbGlrZSBtb3ZpbmcgZnVuY3Rpb25z
IGFyb3VuZCBiZXR3ZWVuCi1maWxlcyB0byBiZXR0ZXIgZ3JvdXAgdGhlbSBhbmQgaW1wcm92aW5n
IHRoZSBpbnRlcmZhY2VzIGxpa2UgZHJvcHBpbmcgcmV0dXJuCi12YWx1ZXMgZm9yIGZ1bmN0aW9u
cyB0aGF0IG5ldmVyIGZhaWwuIFRoZW4gd3JpdGUga2VybmVsZG9jIGZvciBhbGwgZXhwb3J0ZWQK
LWZ1bmN0aW9ucyBhbmQgYW4gb3ZlcnZpZXcgc2VjdGlvbiBhbmQgaW50ZWdyYXRlIGl0IGFsbCBp
bnRvIHRoZSBkcm0gYm9vay4KLQotU2VlIGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9kb2Nz
L2RybS8gZm9yIHdoYXQncyB0aGVyZSBhbHJlYWR5LgotCi1Db250YWN0OiBEYW5pZWwgVmV0dGVy
Ci0KIE1ha2UgcGFuaWMgaGFuZGxpbmcgd29yawogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
