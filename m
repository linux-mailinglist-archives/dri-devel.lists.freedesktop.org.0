Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78736E327E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9C6E39B;
	Thu, 24 Oct 2019 12:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E6B6E39B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:37:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r1so16096455wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=jw0UwEiD6meNVOWcQIYVCpHM6IqW40S0DNnk3BY+yYQ=;
 b=gKrzkqaXsY4jqDKS7KtQN9wNAJr2rOiCb6ZeLcyffl8tGri2NdOrYaHDyAeuRtxwPh
 VMVD+SlppdLlHOO8IJPhksYh8Qi9Kf/O6vwAtn6JOQdJcBDKwtF2MC0lYpxlZfJxJK3H
 y67niTxh3zLYpBgU1wsFdFzN9VuYzJzksYia//WQ+9VBBzojQI7wpQXOKRBGlRG46kbE
 Bn3vOYndL9UjiPjzaxRZTqu/T5iXPjcQn9nj7zR1ph5ScNgvqMavsgXIdtPArHROjCa/
 zF1/CAel+ejZO9nq+CWXAme9T0Nbb2InijxqsMMiUQAHmm8y1TMp4fOSiRr14GwoOoTk
 6dOw==
X-Gm-Message-State: APjAAAUhxbk06X3xwvJ3TVaRAMtMeo27yvQ/ylmZ/C3/dYfMCS3xAquf
 zXCeP/gHe41myz78BIzfpTQD4A==
X-Google-Smtp-Source: APXvYqws8DIHzZHjSjQfOUt7PTSWvfCU/nY5mCDUb+L3yrUQp/OVL5CTx9Oq7rg3MrBA8I/vuASNGg==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr3558646wro.234.1571920637261; 
 Thu, 24 Oct 2019 05:37:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 74sm36163576wrm.92.2019.10.24.05.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:37:16 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:37:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/4] drm/vram: Provide helpers for prepare_fb() and
 cleanup_fb()
Message-ID: <20191024123714.GG11828@phenom.ffwll.local>
References: <20191024081404.6978-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024081404.6978-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jw0UwEiD6meNVOWcQIYVCpHM6IqW40S0DNnk3BY+yYQ=;
 b=RoSZWJ5eDKhkEccdlJO71G2ujsVK0E2Y0922uf1hu+UvxnhpjUFjIs1M391ddtvlV6
 DL0lQeJuVdIUw1sBHpIA/xwjMZA+Cno+i+QudnZCaxFj4d008EAJR65PT9UGFOURfGJ/
 Bom4n7bIGw4QzRxbagO+A4+6QapCpOmtzpvgA=
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTA6MTQ6MDBBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBwbGFuZSdzIGNhbGwtYmFjayBm
dW5jdGlvbnMgcHJlcGFyZV9mYigpIGFuZAo+IGNsZWFudXBfZmIoKSBmb3IgR0VNIFZSQU0gaGVs
cGVycyBhcmUgc2hhcmFibGUgYW1vbmcgZHJpdmVycy4KPiAKPiBQYXRjaCAjMyBhbHNvIGZpeGVz
IHR3byBidWdzIHRoYXQgaGF2ZSBiZWVuIHByZXNlbnQgaW4gaGlibWMgc2luY2UgaXQgd2FzCj4g
Zmlyc3QgYWRkZWQuIFRoZSBwcmltYXJ5IHBsYW5lJ3MgYXRvbWljX3VwZGF0ZSgpIGlzIG5vdCBy
ZXNwb25zaWJsZSBmb3IKPiBwaW5uaW5nIEJPcy4gQW5kIGl0IG5ldmVyIHVucGlubmVkIHVudXNl
ZCBCT3MuIFZSQU0gaXMgYmVpbmcgZXhhdXN0ZWQKPiBvdmVyIHRpbWUuCj4gCj4gVGhlIG5ldyBo
ZWxwZXJzIGhhdmUgYmVlbiB0ZXN0ZWQgdG8gd29yay4KPiAKPiB2MjoKPiAJKiBwcm92aWRlIGhl
bHBlcnMgZm9yIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcywgYW5kLi4uCj4g
CSogLi4udXNlIHRoZW0gaW4gYm9jaHMKCk9oIEkgdGhvdWdodCB3ZSBhZ3JlZWQgb24gY2hhbmdp
bmcgdGhlIHNpbXBsZV9waXBlIHR5cGUgZm9yCnByZXBhcmUvY2xlYW51cF9mYiAuLi4gQnV0IHRo
aXMgd29ya3MgdG9vIG9mYy4gT24gdGhlIHNlcmllczoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAKPiBUaG9tYXMgWmltbWVybWFubiAoNCk6
Cj4gICBkcm0vdnJhbS1oZWxwZXJzOiBBZGQgaGVscGVycyBmb3IgcHJlcGFyZV9mYigpIGFuZCBj
bGVhbnVwX2ZiKCkKPiAgIGRybS9ib2NoczogUmVwbGFjZSBwcmVwYXJlX2ZiKCkvY2xlYW51cF9m
YigpIHdpdGggR0VNIFZSQU0gaGVscGVycwo+ICAgZHJtL2hpc2lsaWNvbi9oaWJtYzogVXNlIEdF
TSBWUkFNJ3MgcHJlcGFyZV9mYigpIGFuZCBjbGVhbnVwX2ZiKCkKPiAgICAgaGVscGVycwo+ICAg
ZHJtL3Zib3h2aWRlbzogUmVwbGFjZSBwcmVwYXJlX2ZiKCkvY2xlYW51cF9mYigpIHdpdGggR0VN
IFZSQU0gaGVscGVycwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgICAg
ICAgICAgICAgfCAgMjYgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jICAgICAgICAgfCAxMjYgKysrKysrKysrKysrKysrKysrCj4gIC4uLi9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY19kcm1fZGUuYyAgICB8ICAxNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfbW9kZS5jICAgICAgICAgfCAgNjEgKy0tLS0tLS0tCj4gIGluY2x1ZGUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgICAgICB8ICAyNSArKysrCj4gIDUgZmls
ZXMgY2hhbmdlZCwgMTYxIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQo+IAo+IC0tCj4g
Mi4yMy4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
