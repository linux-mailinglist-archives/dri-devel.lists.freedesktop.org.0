Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE96A66F1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 12:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F148945A;
	Tue,  3 Sep 2019 10:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481788945A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:58:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i8so4375596edn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 03:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=1fmMyGS0tNg2ZrUjMXrQHItun5hzN9B9+GAHYDnxm80=;
 b=bF1IYvrFIuDSX7aLjQAoCfpxGfOLK0RGLY9vQIbcG/gdBYWvsCRBrdBKUnBRtOxJww
 0YwrQqHSzW/svX3miHl9iykzefxD6vQRdlX/TwoVn4c82S2mhc3/EWhMFPZ9TKShSYBH
 4sYlkt+8LBD9eerM1s6jeuyLIkLedN6NYdVI0CZ9sVEyNPw1A1NSTbqC8LvabW+Qxhpq
 MuC27Zi3Owy9MKBY9+00Wpfp2C5o5yrwGIUfjD1+UozK8D+UvjsmHJGSMKm3ljWMdodE
 DzYA+V5xPT4VV5G1pw2H5z2JT4aBA7e0qOjHqFnxRT+QeHQ4fjAERYFZaMMQfcsWY16E
 sc/Q==
X-Gm-Message-State: APjAAAVsQqWFnO58a6JYY15bVfjinprJUfmDxIyghJc9RycbVzd3+4Ce
 g3Hbr0M/C+sN6DbnadLkidaOCQ==
X-Google-Smtp-Source: APXvYqw5isHmx06+1+EN3i1c9akHWdMgAFkS8ga2Hxp68Sh6sDTlsUNHiff4YPNE1vu4FjaDz+IcUQ==
X-Received: by 2002:a17:906:ce48:: with SMTP id
 se8mr22871363ejb.98.1567508310915; 
 Tue, 03 Sep 2019 03:58:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p11sm146389edh.77.2019.09.03.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:58:30 -0700 (PDT)
Date: Tue, 3 Sep 2019 12:58:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 3/6] drm/vram: use drm_gem_ttm_print_info
Message-ID: <20190903105828.GW2112@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20190903101248.12879-1-kraxel@redhat.com>
 <20190903101248.12879-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903101248.12879-4-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1fmMyGS0tNg2ZrUjMXrQHItun5hzN9B9+GAHYDnxm80=;
 b=UMkvzjLsCC2sjAxyLFkC+oxnIHOCVIrCP8LNWhgtHwHfHVoDJNqWNA1lb/Wtp8jGo2
 GCGAA8VSliVvR7CFYm9CMTgUUn06B+IoCzWE6JtVQRmjVzPXu3RQfegMMdsswRxHLQfT
 B+9IEE/xV2uvU/uuhS+1E9HVKQPPbYYMvBYLQ=
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTI6MTI6NDVQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
PiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCA0ICsrKy0KPiAgZHJp
dmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICB8IDEgKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYwo+IGluZGV4IGZkNzUxMDc4YmFlMS4uNzE1NTJmNzU3YjRhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4gQEAgLTEsNSArMSw2IEBACj4g
IC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4gIAo+ICsjaW5j
bHVkZSA8ZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX21vZGUuaD4KPiBAQCAtNjMzLDUgKzYzNCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV92cmFtX29iamVjdF9mdW5jcyA9IHsKPiAg
CS5waW4JPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3BpbiwKPiAgCS51bnBpbgk9IGRybV9nZW1fdnJh
bV9vYmplY3RfdW5waW4sCj4gIAkudm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3Rfdm1hcCwKPiAt
CS52dW5tYXAJPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X3Z1bm1hcAo+ICsJLnZ1bm1hcAk9IGRybV9n
ZW1fdnJhbV9vYmplY3RfdnVubWFwLAo+ICsJLnByaW50X2luZm8gPSBkcm1fZ2VtX3R0bV9wcmlu
dF9pbmZvLAoKWWVhaCBkZWZpbml0ZWx5IGxpbmsgdG8gdGhlIG5ldyB3YXkgb2YgZG9pbmcgc3R1
ZmYgaW4gdGhlIGtlcm5lbGRvYyBvZiB0aGUKcHJldmlvdXMgcGF0Y2guIEZvciB0aGlzLgoKUmV2
aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+ICB9Owo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnCj4gaW5kZXggZjdiMjU1MTlmOTVjLi4xYmU4YWQzMGQ4ZmUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwo+
IEBAIC0xNjksNiArMTY5LDcgQEAgY29uZmlnIERSTV9WUkFNX0hFTFBFUgo+ICAJdHJpc3RhdGUK
PiAgCWRlcGVuZHMgb24gRFJNCj4gIAlzZWxlY3QgRFJNX1RUTQo+ICsJc2VsZWN0IERSTV9UVE1f
SEVMUEVSCgpTZWxlY3QgaXNuJ3QgcmVjdXJzaXZlLCB3aGljaCBtZWFucyBhbnlvbmUgd2hvIHNl
bGVjdHMgdnJhbSBoZWxwZXJzIG5vdwphbHNvIG5lZWRzIHRvIHNlbGVjdCB0dG0gaGVscGVycy4g
VGhpcyBpcyBhbHJlYWR5IGJyb2tlbiB3aXRoIERSTV9UVE0gSQp0aGluayAuLi4KLURhbmllbAoK
Cj4gIAloZWxwCj4gIAkgIEhlbHBlcnMgZm9yIFZSQU0gbWVtb3J5IG1hbmFnZW1lbnQKPiAgCj4g
LS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
