Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0FA264C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 20:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E576E129;
	Thu, 29 Aug 2019 18:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EFF6E129
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:44:17 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id n69so1487794ywd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 11:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y0CIg3NVlgXeInnLw0PrlDfAySS6GEabvcH9ZTG2R7Q=;
 b=WwBBHPTL9L4Vd1V+8lNEhgBjUy6A48u9uaauIuCrF62MbJiMR+3Zmr/phSqaiGzG3T
 M/gCaRKHc3gb1Lb/E2POamEOR1f14HU4U2hh/u8AelT5QmQsROIjDGZEIm53Dn2UNFwx
 lKm1GPS4S6HB3wP74YT7jBU4ELlbuS6zFnkFxbxGR/6YaFdlABDQWo4Ej5OEnTI0DEwD
 YVMIli0pBEG7TIFkIUyOHK1ORjxjgOh4vdPtAhkiU8gO2b8CsCn+LsXf6gNyRxX5Z8/S
 MczOagsoD2aScxRMDcwEp6T+IZ/2WGyMrWDTKiMEUsxH6a2SNQcCgn16Qhzd9oNpgMHo
 EMEA==
X-Gm-Message-State: APjAAAXYqqmGtp0r44xBFobNx+BM0PTYT+eRDyhzAWYATAEyflULYp9n
 uIXBEAHUPyCEraL6kbWv1t02Rg==
X-Google-Smtp-Source: APXvYqwfHTKwJ0mIS2bakEIGWA+OzHB1IgmPpfPQ6tDR80PPpVr+YxxDwDw0znbrJvYqp9p71/hDrQ==
X-Received: by 2002:a81:70c7:: with SMTP id l190mr7946781ywc.280.1567104256441; 
 Thu, 29 Aug 2019 11:44:16 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i20sm638407ywg.96.2019.08.29.11.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 11:44:15 -0700 (PDT)
Date: Thu, 29 Aug 2019 14:44:15 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm: mst: Fix query_payload ack reply struct
Message-ID: <20190829184415.GI218215@art_vandelay>
References: <20190829165223.129662-1-sean@poorly.run>
 <9927a099fc5f0140ea92e34f017186d9ffe0bb13.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9927a099fc5f0140ea92e34f017186d9ffe0bb13.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y0CIg3NVlgXeInnLw0PrlDfAySS6GEabvcH9ZTG2R7Q=;
 b=InpYZstdqbCIKyy+HjlkWYc66380kSdA6vXpPRrTKq4uXw9ekphazbrnIw6bwbzBzb
 7edoejK/7waY8exYn+JrLpcXUC2lSmNFM1G9y6iGb1z9Y2tDGJD/fpFffCEHzOT1YPDh
 u4ZXGF0g7yb7uvNEERKYPHPeyYqNOXNTpuDnNUuXwS7bLp6hVJMHIU6a8sJUgwNtx6SR
 rH5qehF9L9u75OwlCesmid2/lULlpcmdw9ICLW7lWBN/KjJHiEButiMjcjFjVIxUyG0a
 n7tEiYKvEfKsu0WMQmS6JFBZKWCOkGqONRs40SENLqdV0xvsR0k9gctaGL5Mwp4nvjyl
 OOUQ==
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
Cc: Todd Previte <tprevite@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDE6MDY6NThQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBJcyBpdCB3b3J0aCBhY3R1YWxseSBDQ2luZyBzdGFibGUgb24gdGhpcz8gVGhpcyBwYXRj
aCBpcyBjZXJ0YWlubHkgY29ycmVjdCBidXQKPiBJIGRvbid0IHRoaW5rIHdlIHVzZSB0aGlzIHN0
cnVjdCBmb3IgYW55dGhpbmcgcXVpdGUgeWV0Lgo+IAo+IE90aGVyd2lzZTogUmV2aWV3ZWQtYnk6
IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpUaGFua3MgZm9yIHRoZSByZXZpZXchIEkn
dmUgc3RyaXBwZWQgdGhlIGNjIHN0YWJsZSB0YWcgYW5kIHB1c2hlZCB0bwpkcm0tbWlzYy1uZXh0
LiBXZSdsbCBoYXZlIHRvIGtlZXAgYW4gZXllIG91dCBmb3IgU2FzaGEncyBzdGFibGUgQUkgYm90
LCBJJ20KZ3Vlc3NpbmcgaXQnbGwgdHJ5IHRvIGJhY2twb3J0IHRoaXMgdG8gc3RhYmxlIHJlZ2Fy
ZGxlc3MuCgpTZWFuCgo+IAo+IE9uIFRodSwgMjAxOS0wOC0yOSBhdCAxMjo1MiAtMDQwMCwgU2Vh
biBQYXVsIHdyb3RlOgo+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+
Cj4gPiAKPiA+IFNwZWMgc2F5c1sxXSBBbGxvY2F0ZWRfUEJOIGlzIDE2IGJpdHMKPiA+IAo+ID4g
WzFdLSBEaXNwbGF5UG9ydCAxLjIgU3BlYywgU2VjdGlvbiAyLjExLjkuOCwgVGFibGUgMi05OAo+
ID4gCj4gPiBGaXhlczogYWQ3ZjhhMWY5Y2VkICgiZHJtL2hlbHBlcjogYWRkIERpc3BsYXlwb3J0
IG11bHRpLXN0cmVhbSBoZWxwZXIKPiA+ICh2MC42KSIpCj4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KPiA+IENjOiBUb2RkIFByZXZpdGUgPHRwcmV2aXRlQGdtYWlsLmNvbT4K
PiA+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+ID4gQ2M6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyB2My4xNysKPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0u
b3JnPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaCB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKPiA+IGIvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAo+ID4gaW5kZXggMmJhNjI1M2VhNmQzLi5mYzM0
OTIwNGE3MWIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
Cj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCj4gPiBAQCAtMzM0LDcg
KzMzNCw3IEBAIHN0cnVjdCBkcm1fZHBfcmVzb3VyY2Vfc3RhdHVzX25vdGlmeSB7Cj4gPiAgCj4g
PiAgc3RydWN0IGRybV9kcF9xdWVyeV9wYXlsb2FkX2Fja19yZXBseSB7Cj4gPiAgCXU4IHBvcnRf
bnVtYmVyOwo+ID4gLQl1OCBhbGxvY2F0ZWRfcGJuOwo+ID4gKwl1MTYgYWxsb2NhdGVkX3BibjsK
PiA+ICB9Owo+ID4gIAo+ID4gIHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5IHsK
PiAtLSAKPiBDaGVlcnMsCj4gCUx5dWRlIFBhdWwKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJl
IEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
