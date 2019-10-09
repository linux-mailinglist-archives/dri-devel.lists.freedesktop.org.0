Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F93FD11A8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 16:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606206E9C5;
	Wed,  9 Oct 2019 14:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABAB6E9C5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 14:45:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r16so2254086edq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 07:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=c31+ISYmwKjHrNu5FUeZag9v4Y+jPYfc58XsFxtWGho=;
 b=NvV7hAdQsuYqkB/f/ECqjM2aGw20t15BK7/P2OyUOcSzfM1qM0qiikDJBi2jfdooXy
 JDeAUKvUmRSOvs3W1vlQCoaem2uPMedZjnOjklhl59ApBdec0YO1HGVH1kMUZbeIsZYK
 CaTLCM/9Es3yMNcEym5f2L3pD6EZEq3hNIiNfB7a0L3KSZ/4KMVR4AU+0QsEIT0YyFPH
 gUg/OXqCSscUyuJd2gJz1HERiMEb9rFOJ6GQgFGttdpgxMhRmHBK9PQn3w0FfEK8i0B6
 XYu25DRnBjRAiK3FO+LjewuNn9LEdZT7PPP6/sYJRhRUY4Ai6AJ0GSBWYWFwQ/yoDKDd
 FF+A==
X-Gm-Message-State: APjAAAXXji7a1opCgmTJZc0hdZCrYnR5+23OPLVwQ9pP/Ek0V5kc2zR7
 06xAnj6Ecky4rMLts/394rXFyA==
X-Google-Smtp-Source: APXvYqwM9gxlpuAlbZrBfmaUSQv7XIs94YOR8Zif0xueL/B0FHjLQBO49ZuUR6aC+NJy0eUREE5oxg==
X-Received: by 2002:a17:906:e108:: with SMTP id
 gj8mr3293961ejb.1.1570632320733; 
 Wed, 09 Oct 2019 07:45:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r18sm390032edl.6.2019.10.09.07.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:45:19 -0700 (PDT)
Date: Wed, 9 Oct 2019 16:45:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 00/11] drm: rework mmap() workflow
Message-ID: <20191009144517.GA16989@phenom.ffwll.local>
References: <20190919100223.13309-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919100223.13309-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c31+ISYmwKjHrNu5FUeZag9v4Y+jPYfc58XsFxtWGho=;
 b=FcdunfKS/mRtH3xCy/yo7Oh+QCkGZiXi06TJQv4L7PxviOYq4/W0m3A3tE9UNxbo92
 UVi8ziGbKLZAbWdHWI3I48yeG1RM172enbJMUuAFYt+K2YP6ZRRJ+jVYzlNJ2Fmd/mxf
 TU4fcx9HJ5nYdSDljWJ7uqjpYx84CXgdJrYzo=
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTI6MDI6MTJQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBZGQgbW1hcCBjYWxsYmFjayB0byBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3Ms
IHdoaWNoIGlzIHN1cHBvc2VkIHRvCj4gaGFuZGxlIHRoZSB2bWEgc2V0dXAuICBJdCB3aWxsIGJl
IHVzZWQgYnkgYm90aCBub3JtYWwgZm9wcy0+bW1hcCAodmlhCj4gZHJtX2dlbV9tbWFwX29iaigp
KSBhbmQgcHJpbWUgbW1hcCAodmlhIGRybV9nZW1fcHJpbWVfbW1hcCgpKS4KPiAKPiBGb3Igc3Rh
cnRlcnMgdGhlIHNobWVtIGFuZCB2cmFtIGhlbHBlcnMgYXJlIHN3aXRjaGVkIG92ZXIgdG8gdGhl
IG5ldwo+IHdvcmtmbG93LCB0byBzaG93IHRoaW5ncyBpbiBhY3Rpb24gZm9yIHJldmlldy4KCkkn
bSBjb25mdXNlZCBhIGJpdCBoZXJlLCBzaW5jZSB5b3UncmUgcmVzZW5kaW5nIHBhdGNoZXMgYnV0
OgotIG5vIHBlci1wYXRjaCBjaGFuZ2Vsb2cgKG1ha2luZyBpdCByZWFsIGhhcmQgZm9yIHJldmll
d2VycyB0byBjYXRjaCB1cAogIGFuZCByZXZpZXcganVzdCB3aGF0J3MgY2hhbmdlZCkKLSBub25l
IG9mIHRoZSByLWIvYS1iIHRhZ3MgeW91J3ZlIHNjb3JlZCBhbHJlYWR5IGFkZGVkIHRvIHRoZSBy
ZXNwZWN0aXZlCiAgcGF0Y2hlcwoKSSdkIHJlYWxseSBsaWtlIHRvIHNlZSB0aGlzIGxhbmRlZCwg
YnV0IHRoaXMgd2F5IGl0J3Mgbm90IHJlYWxseSBnb2luZyB0bwptb3ZlIGZvcndhcmQgOi0vCgpD
YW4geW91IHBscyByZXNlbmQgd2l0aCBhbGwgdGhhdCBmaXhlZCwgYW5kIHRoZW4gSSBjYW4gZG8g
YSBmaW5hbCBwYXNzIGZvcgp0aGUgbWlzc2luZyBiaXRzIGFuZCB3ZSBjYW4gZ2V0IHRoaXMgbWVy
Z2VkPwoKVGhhbmtzLCBEYW5pZWwKCj4gCj4gR2VyZCBIb2ZmbWFubiAoMTEpOgo+ICAgZHJtOiBh
ZGQgbW1hcCgpIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzCj4gICBkcm0vc2htZW06IHN3aXRjaCBz
aG1lbSBoZWxwZXIgdG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAKPiAgIGRybS9zaG1lbTog
ZHJvcCBWTV9ET05URFVNUAo+ICAgZHJtL3NobWVtOiBkcm9wIFZNX0lPCj4gICBkcm0vc2htZW06
IGRyb3AgREVGSU5FX0RSTV9HRU1fU0hNRU1fRk9QUwo+ICAgZHJtL3R0bTogZmFjdG9yIG91dCB0
dG1fYm9fbW1hcF92bWFfc2V0dXAKPiAgIGRybS90dG06IHJlbmFtZSB0dG1fZmJkZXZfbW1hcAo+
ICAgZHJtL3R0bTogYWRkIGRybV9nZW1fdHRtX21tYXAoKQo+ICAgZHJtL3ZyYW06IHN3aXRjaCB2
cmFtIGhlbHBlciB0byAmZHJtX2dlbV9vYmplY3RfZnVuY3MubW1hcCgpCj4gICBkcm0vdnJhbTog
ZHJvcCB2ZXJpZnlfYWNjZXNzCj4gICBkcm0vdnJhbTogZHJvcCBEUk1fVlJBTV9NTV9GSUxFX09Q
RVJBVElPTlMKPiAKPiAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTQgKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAgICAg
ICAgICAgIHwgMzAgKy0tLS0tLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIu
aCAgICAgICAgICAgICAgfCAgMiArCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIu
aCAgICAgICAgICAgICB8IDI1IC0tLS0tLS0tLQo+ICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oICAgICAgICAgICAgICAgICAgfCAxMCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYyAgICB8ICA1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5jICAgICAgICAgICAgICAgICB8ICA1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19kcnYuYyAgICAgICAgICAgICB8ICA1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMv
Y2lycnVzLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
LmMgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrKysrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyAgICAgICAgfCAyOCArKysrLS0tLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyAgICAgICAgICB8IDE3ICsrKysrKwo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jICAgICAgICAgfCA1NiArLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICAgICAgICAgICAgICAg
ICB8ICA5ICsrKwo+ICAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5j
ICAgfCAgNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jICAgICAg
ICAgfCAgNSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgICAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jICAgICAgICAgICAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jICAgICAgICAgICAg
ICAgfCA1NCArKysrKysrKystLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfYm8u
YyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZHJ2
LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92
Ym94X2Rydi5jICAgICAgICAgIHwgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rydi5jICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X29iamVjdC5jICAgICAgIHwgIDIgKy0KPiAgMjUgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2Vy
dGlvbnMoKyksIDE5OSBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiAyLjE4LjEKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
