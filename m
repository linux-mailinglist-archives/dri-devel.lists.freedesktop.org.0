Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA20CFF08
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D815F6E864;
	Tue,  8 Oct 2019 16:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545406E864
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 16:36:43 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h2so16239180edn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 09:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=s6yXwSMgj/HSDluu0jjb1fIynHkpdwJEi83t8MXH8nE=;
 b=P6LIoSA82hsCcBMhq7D1LBWIGq0qJYVXBdFHDKQ4t2LF4l3RJ/Z0n/UT7lPPPTX/LP
 9qk50ldqVL4SctzwTrEtE4J2jY+MBhWraokq9vhygr7aLGq2e9rRshCui/HMk/ekdDxu
 xv114Soi2+gcxirVbWbEjnoXxKZd0Xs63wQk39RlpUpJhEH76jNJOHHqkioymzQyTd2h
 grmqmBdO+Y52DcrWSEjsqjkZejFhhQ+bXfJCe7Ren7B/2Q27G22lsLM/qvbTCu5HPwSX
 1qWlXlWKmKlqdOHCt5wFNE/qoHvsRRNOnGyliQypn0jfDPjJZtCQZ+wYqoPK26NCi1SF
 ND7g==
X-Gm-Message-State: APjAAAWYD0BjJdOmXsB5tY+pIdfE/wuZYEYE/SOgAb3tnlxQYnrMhafU
 xdAj/F7zmU7n09TfeZQCi2GyAw==
X-Google-Smtp-Source: APXvYqw4CmruMdho1djBzsuB0cxptSjoeGCxeI7AQjG8SwwZmnZhDTbjl2CcNzkP4WKWyomH4JCMaw==
X-Received: by 2002:a17:906:18a1:: with SMTP id
 c1mr29899819ejf.4.1570552601049; 
 Tue, 08 Oct 2019 09:36:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z65sm4048809ede.86.2019.10.08.09.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 09:36:40 -0700 (PDT)
Date: Tue, 8 Oct 2019 18:36:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] Documentation/gpu: Fix no structured comments
 warning for drm_gem_ttm_helper.h
Message-ID: <20191008163638.GS16989@phenom.ffwll.local>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190920193558.89815-2-sean@poorly.run>
 <229f1017-cb74-18e3-bff0-f2a3ce7520b7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <229f1017-cb74-18e3-bff0-f2a3ce7520b7@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=s6yXwSMgj/HSDluu0jjb1fIynHkpdwJEi83t8MXH8nE=;
 b=BdqYlBj/te+Av4OapSD2UH9hoWKJCqoQlUXNj27WAi70dy3Ig82VO+sdYQ3EmCwm61
 TRug5RVmA3TY4amthFSaBOdCRU0ynXC6GtCNkDk2L2Z4pnGYzc6+51DQr5q769atGoIx
 FQMIhztoLNfFmYTuM58kDqE7+4wHvJmS/qty8=
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDk6MDM6MDFBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyMC4wOS4xOSB1bSAyMTozNSBzY2hyaWViIFNlYW4gUGF1
bDoKPiA+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gCj4gPiBG
aXhlcwo+ID4gaW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmg6MTogd2FybmluZzogbm8g
c3RydWN0dXJlZCBjb21tZW50cyBmb3VuZAo+IAo+IFRoYXQgbWlzc2luZyBkb2N1bWVudGF0aW9u
IGxvb2tzIGxpa2UgYW4gb3ZlcnNpZ2h0IHRvIG1lLgo+IAo+IEFja2VkLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKPiB1bmRlciB0aGUgcHJlbWlzZSB0aGF0
IHRoZXJlJ3Mgbm90IGN1cnJlbnRseSBzb21lIHBhdGNoIHdpdGggdGhlIG1pc3NpbmcKPiBkb2N1
bWVudGF0aW9uIGZsb2F0aW5nIGFyb3VuZC4KClRoZXJlJ3Mgbm8gc3RydWN0IG9yIGlubGluZSBm
dW5jdGlvbnMgaW4gdGhhdCBoZWFkZXIgZmlsZSwgc28gcmVhbGx5Cm5vdGhpbmcgdG8gZG9jdW1l
bnQuIEp1c3QgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBpZiB3ZSBhZGQgYW55dGhpbmcsIHdlCnJl
LWFkZCB0aGUgaW5jbHVkZSBkaXJlY3RpdmUuCi1EYW5pZWwKCj4gCj4gQmVzdCByZWdhcmRzCj4g
VGhvbWFzCj4gCj4gPiBGaXhlczogZmY1NDBiNzZmMTRhICgiZHJtL3R0bTogYWRkIGRybSBnZW0g
dHRtIGhlbHBlcnMsIHN0YXJ0aW5nIHdpdGggZHJtX2dlbV90dG1fcHJpbnRfaW5mbygpIikKPiA+
IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IENjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+
ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdCB8IDMgLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2dwdS9kcm0tbW0ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdAo+ID4g
aW5kZXggOTlkNTYwMTVlMDc3Li41OTYxOTI5NmM4NGIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2dwdS9kcm0tbW0ucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0u
cnN0Cj4gPiBAQCAtNDA2LDkgKzQwNiw2IEBAIEdFTSBUVE0gSGVscGVyIEZ1bmN0aW9ucyBSZWZl
cmVuY2UKPiA+ICAuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hl
bHBlci5jCj4gPiAgICAgOmRvYzogb3ZlcnZpZXcKPiA+ICAKPiA+IC0uLiBrZXJuZWwtZG9jOjog
aW5jbHVkZS9kcm0vZHJtX2dlbV90dG1faGVscGVyLmgKPiA+IC0gICA6aW50ZXJuYWw6Cj4gPiAt
Cj4gPiAgLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIu
Ywo+ID4gICAgIDpleHBvcnQ6Cj4gPiAgCj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFu
bgo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRz
dHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZm
ZXIsIE1hcnkgSGlnZ2lucywgU3JpIFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+
IAoKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
