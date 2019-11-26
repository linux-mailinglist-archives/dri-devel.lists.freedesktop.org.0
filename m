Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45E109B5D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5822F6E2A5;
	Tue, 26 Nov 2019 09:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873F06E2A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:38:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u18so2402768wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5fCL1hI7/C4IchOTw3xAw7B4dtYepf6RSieurqxUcQ8=;
 b=per+kgntSaF+cTMQRn7KQHRHBWHsikUEKMev2TDch4MZU3z48IYH/cTWFIOY/FijW+
 1uu+qBSo3MX0GgEZ4NHSYM7zf1hCdVTYWM3sop5dIpN6iZLdaImMeA823Cq0qhjb9DlK
 +aYCeo1sJ81CJ0C/QE2xoZBjFAIbhsEi15z6s/KK7G9I3GPIl7i3TTmNN9iltK8CtmWL
 NVL+CfOYC6guOZbh+n4BIYlzJjc1T3SVSrGAw5CrqbmreCRYd7zJBjO28BCDRmesf8kW
 sXypEH/P2FL9nMC0J9bWqZlAznFEYRiqkzY+PRDCN0zm0yCefT67qcS+2HKpvFugdS/a
 7VzQ==
X-Gm-Message-State: APjAAAUGWmIxJQTOT7Ryaz+EYcyEZs+PIJlcozQAs84IAiGbdPI9ciKC
 FweBdZ7goSEIc1zw6oDkzHt0Sw==
X-Google-Smtp-Source: APXvYqzo0jQU/fovSuLdI7OYcpMkl7SAULJ3z2R8nONllYJKNf+yXbKLqYlT5KkBpu+3CltW2XayCA==
X-Received: by 2002:a7b:cf05:: with SMTP id l5mr3491292wmg.44.1574761128166;
 Tue, 26 Nov 2019 01:38:48 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b10sm14251046wrw.53.2019.11.26.01.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:38:47 -0800 (PST)
Date: Tue, 26 Nov 2019 10:38:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm/mgag200: Add module parameter to pin all buffers
 at offset 0
Message-ID: <20191126093845.GS29965@phenom.ffwll.local>
References: <20191126072545.22663-1-tzimmermann@suse.de>
 <20191126072545.22663-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126072545.22663-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5fCL1hI7/C4IchOTw3xAw7B4dtYepf6RSieurqxUcQ8=;
 b=RPy/PocgAAS9msO7amPUCMLv8bA7SIyqxgtJ/DsraOrxyfLSyB02241bZFv5MZoOYz
 BqbjW7mVKVNnTTv1q9UpzqjWJJ/jvBoN3WHh7ot7USODdcr9dzR9Arox3mvLNtPo29sL
 3Ht3CIwtW6FxjOF9kA/uYXEFzN7isu5Q0yPWc=
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDg6MjU6NDVBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gRm9yIGhhcmR3YXJlIHRoYXQgZG9lcyBub3QgaW50ZXJwcmV0IHRoZSBzdGFy
dGFkZCBmaWVsZCBjb3JyZWN0bHksCj4gYWRkIHRoZSBtb2R1bGUgcGFyYW1ldGVyICdod19idWdf
bm9fc3RhcnRhZGQnLCB3aGljaCBlbmFibGVzIHRoZQo+IHdvcmthcm91bmQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgfCA4ICsrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfZHJ2LmMKPiBpbmRleCBkNDM5NTFjYWVlYTAuLjc5ODM2YjA5YTU0YSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+IEBAIC0yNyw2ICsyNywxMCBAQCBpbnQg
bWdhZzIwMF9tb2Rlc2V0ID0gLTE7Cj4gIE1PRFVMRV9QQVJNX0RFU0MobW9kZXNldCwgIkRpc2Fi
bGUvRW5hYmxlIG1vZGVzZXR0aW5nIik7Cj4gIG1vZHVsZV9wYXJhbV9uYW1lZChtb2Rlc2V0LCBt
Z2FnMjAwX21vZGVzZXQsIGludCwgMDQwMCk7Cj4gIAo+ICtpbnQgbWdhZzIwMF9od19idWdfbm9f
c3RhcnRhZGQgPSAtMTsKPiArTU9EVUxFX1BBUk1fREVTQyhtb2Rlc2V0LCAiSFcgZG9lcyBub3Qg
aW50ZXJwcmV0IHNjYW5vdXQtYnVmZmVyIHN0YXJ0IGFkZHJlc3MgY29ycmVjdGx5Iik7Cj4gK21v
ZHVsZV9wYXJhbV9uYW1lZChod19idWdfbm9fc3RhcnRhZGQsIG1nYWcyMDBfaHdfYnVnX25vX3N0
YXJ0YWRkLCBpbnQsIDA0MDApOwo+ICsKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZl
cjsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9
IHsKPiBAQCAtNjQsNiArNjgsMTAgQEAgREVGSU5FX0RSTV9HRU1fRk9QUyhtZ2FnMjAwX2RyaXZl
cl9mb3BzKTsKPiAgCj4gIHN0YXRpYyBib29sIG1nYWcyMDBfcGluX2JvX2F0XzAoY29uc3Qgc3Ry
dWN0IG1nYV9kZXZpY2UgKm1kZXYpCj4gIHsKCkknZCBhZGQgYSBpbmZvciBwcmludGluZyBpZiB0
aGUgbW9kdWxlIG9wdGlvbiBpcyBub24temVybyB0aGF0IHBlb3BsZQpzaG91bGQgc3VibWl0IGEg
YnVnIHJlcG9ydCBpZiB0aGlzIGZpeGVzIHRoZWlyIGlzc3VlLiBXZSBkb24ndCB3YW50IHBlb3Bs
ZQpmaXhpbmcgYnVncyB3aXRoIG1vZHVsZSBvcHRpb25zLCBzdHVmZiBzaG91bGQgd29yayBieSBk
ZWZhdWx0LgoKV2l0aCB0aGF0IGFkZHJlc3NlZDoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiArCWlmICghbWdhZzIwMF9od19idWdfbm9fc3Rh
cnRhZGQpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJZWxzZSBpZiAobWdhZzIwMF9od19idWdfbm9f
c3RhcnRhZGQgPiAwKQo+ICsJCXJldHVybiB0cnVlOwo+ICAJcmV0dXJuIG1kZXYtPmZsYWdzICYg
TUdBRzIwMF9GTEFHX0hXX0JVR19OT19TVEFSVEFERDsKPiAgfQo+ICAKPiAtLSAKPiAyLjIzLjAK
PiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
