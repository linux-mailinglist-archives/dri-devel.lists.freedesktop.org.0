Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7703BE3AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 19:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4C897F9;
	Wed, 25 Sep 2019 17:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889A897F9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 17:45:35 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id s6so2367824ywe.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 10:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OHVvzelA+uTT0vqtBbcthTQGTZf18Jq4ZMdyM4vKKZU=;
 b=MyZxgpnCU6Lvr+HU0zJPxrdTjWm2NoPfvOoIMB3cChWqik2VHVjNriN9W9r7L/Wyqj
 2JHnHhPzDauUoHalDdJ3aU42ccAhb87pffwz1MDyxhr2e55udd03XTQ+09u8oZ6THnxj
 38DHnZ7NwLyhQGh3Vl8q+myG3223AA/swRxvuJv6JewLztfB+XRF6AL2Q1R2a9gUmK2A
 PHvzV5d1fDQRpxreUSnvIr1aGNkjgHl0GAFLuAhdGTpnbiIemDiexI+STxL0Q9HNFZrA
 Hm/OE+8kFhE0CdsRNg4UtR2VuBP6x9AQ/tSrJkj2leDhNpSP6E8H1DuWB8ZgZvVXgchp
 jWpg==
X-Gm-Message-State: APjAAAXGDiHYLyWM+H9zOV4rb3LnJNm2x2cYG3NskrYZGOOBKWlzSZdw
 i1+CE1pbgo27hVogDcPuqGc0qA==
X-Google-Smtp-Source: APXvYqwdQF5TZmOn2Waf8wCW11wDqQSX9XejhvOETf2AyAc5oHiV2g3hW8Lg8NybKbf1QT554XdCIw==
X-Received: by 2002:a81:3b09:: with SMTP id i9mr6724791ywa.166.1569433534992; 
 Wed, 25 Sep 2019 10:45:34 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id a20sm1413804ywl.76.2019.09.25.10.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 10:45:34 -0700 (PDT)
Date: Wed, 25 Sep 2019 13:45:34 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 02/27] drm/dp_mst: Get rid of list clear in
 destroy_connector_work
Message-ID: <20190925174534.GC218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-3-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=OHVvzelA+uTT0vqtBbcthTQGTZf18Jq4ZMdyM4vKKZU=;
 b=Eoq43qJcz4SJgYYeUj+gyezjfjzs7Qm+Cu5GqJc716NpshVeHQnj9dI+LxTTuOEgGp
 bCjFNu6mP5Gep2i1UT4sEjF/PMjtC+ZvEyzZiVfwlu5tc1i11q+tj9hGgioti7PG6CY2
 mZkGUUb/SS+B/frYGIr25We6zLL1MpVt09xXtUathb+YXmb1WTJ8BMUbWKIb0kFx2H3/
 /U6F1n0zm3nhrWoBbUm4emctarTkSCMuA0Tp2Gp15VfvkuX7vzu5d6VLLcI/gOvEAsI1
 DnmPlOBm8SiNx+FU7evnY6IEc195qBCAfa6NneYJtmCAXy/daBA2dPWge4KZObulAKDi
 DuBA==
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDU6NDBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBUaGlzIHNlZW1zIHRvIGJlIHNvbWUgbGVmdG92ZXIgZGV0cml0dXMgZnJvbSBiZWZvcmUg
dGhlIHBvcnQvbXN0YiBrcmVmCj4gY2xlYW51cCBhbmQgZG9lc24ndCBkbyBhbnl0aGluZyBhbnlt
b3JlLCBzbyBnZXQgcmlkIG9mIGl0Lgo+IAo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRl
bC5jb20+Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2Vu
dGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyIC0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3Rf
dG9wb2xvZ3kuYwo+IGluZGV4IDM2ZGI2NmEwZGRiMS4uMzA1NGVjNjIyNTA2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAgLTM3NjAsOCArMzc2MCw2IEBAIHN0
YXRpYyB2b2lkIGRybV9kcF9kZXN0cm95X2Nvbm5lY3Rvcl93b3JrKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKPiAgCQlsaXN0X2RlbCgmcG9ydC0+bmV4dCk7Cj4gIAkJbXV0ZXhfdW5sb2NrKCZt
Z3ItPmRlc3Ryb3lfY29ubmVjdG9yX2xvY2spOwo+ICAKPiAtCQlJTklUX0xJU1RfSEVBRCgmcG9y
dC0+bmV4dCk7Cj4gLQo+ICAJCW1nci0+Y2JzLT5kZXN0cm95X2Nvbm5lY3RvcihtZ3IsIHBvcnQt
PmNvbm5lY3Rvcik7Cj4gIAo+ICAJCWRybV9kcF9wb3J0X3RlYXJkb3duX3BkdChwb3J0LCBwb3J0
LT5wZHQpOwo+IC0tIAo+IDIuMjEuMAo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
