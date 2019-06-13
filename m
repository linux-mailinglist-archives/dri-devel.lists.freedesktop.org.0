Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E844DBA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6030689294;
	Thu, 13 Jun 2019 20:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1122289295
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:45:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so157813edb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wPa6S3X8bH5/KJ1uof3zz85eJp8i42BSfv+bXOgdT5Y=;
 b=S5ydV3tilZknunyc+iQN41ioGbLNIDnwXY3HaFNIWF2vKmfjLnzkVewqdxG86UFJgC
 JlXSAW9t9l7OCwMNqeYAdUg/x85pPfFehoJ0IbAePL6oRmrAd0P3bTFeYjojsnmF32jA
 wrvRjftRH8TEREvQRP366EMd2IWLqJL8invHvy19M5KxRVooLx6YeHjwBVdP3W6es1Ek
 m78Nl3MSAfQcMnG8I6kUaeiBC7GiqJkfQZIIiOcH9rpGkzOrVYaSpT7HvvNAEjfwq0Cs
 vYRUUiqyGTKsUU0FCPqLihj8+uW63UQA/bNIIUVV4IPqcHthRfWhxClJm60UKEQuEa8e
 zq+A==
X-Gm-Message-State: APjAAAXRKykXni9j1CoKqSPwUICkoJ5KCjBR1FOCE/XSHth4HOxFaIxN
 8o2eb/n2Zlsr28idrkUZjA6HAw==
X-Google-Smtp-Source: APXvYqyOw3Jp07QqubQ9cJc2Wk9Gn16zn5yVtjAmvJKI1V/e5X48FoybktSftc/uT/Cpz/FIlritgQ==
X-Received: by 2002:a50:ad01:: with SMTP id y1mr74435488edc.180.1560458718607; 
 Thu, 13 Jun 2019 13:45:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id o22sm230209edc.37.2019.06.13.13.45.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 13:45:17 -0700 (PDT)
Date: Thu, 13 Jun 2019 22:45:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20190613204515.GS23020@phenom.ffwll.local>
References: <20190613143946.GA24233@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613143946.GA24233@art_vandelay>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wPa6S3X8bH5/KJ1uof3zz85eJp8i42BSfv+bXOgdT5Y=;
 b=eVqqBq61womgsnl1Nxwb09Y35/F6WSlQvMnU9DEVB90jHjoaOCcrd4CZW0qZk4wt4q
 0ND2+mgO8LEftlwvb4o0tA7AITX1HYX73GFbIu5jch6jLzbt6QGTuVXqFz2tYDMr+SY2
 OCufs/cx5neoCntaVz8uxc7Ue36SxlKsVYA9A=
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
Cc: Jani Nikula <jani.nikula@intel.com>, dim-tools@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Hans de Goede <hdegoede@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6Mzk6NDZBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IAo+IEhpIERhLiosCj4gQSBiaXQgbW9yZSBtZWF0IG9uIHRoaXMgUFIsIHdoaWNoIHNob3Vs
ZCBwcm9iYWJseSBiZSBleHBlY3RlZCBnaXZlbiBob3cgbGlnaHQgd2UKPiBoYXZlIGJlZW4gb24g
dGhlIGxhc3QgNC4KPiAKPiAKPiBkcm0tbWlzYy1maXhlcy0yMDE5LTA2LTEzOgo+IG1lc29uOiBB
IGZldyBHMTJBIGZpeGVzIGFjcm9zcyB0aGUgZHJpdmVyIChOZWlsKQo+IHF1aXJrczogQSBjb3Vw
bGUgcXVpcmtzIGZvciBHUEQgZGV2aWNlcyAoSGFucykKPiBnZW1fc2htZW06IFVzZSB3cml0ZWNv
bWJpbmUgd2hlbiB2bWFwcGluZyBub24tZG1hYnVmIEJPcyAoQm9yaXMpCj4gcGFuZnJvc3Q6IEEg
Y291cGxlIHR3ZWFrcyB0byByZXF1aXJpbmcgZGV2ZnJlcSAoTmVpbCAmIEV6ZXF1aWVsKQo+IGVk
aWQ6IEVuc3VyZSB3ZSByZXR1cm4gdGhlIG92ZXJyaWRlIG1vZGUgd2hlbiBkZGMgcHJvYmUgZmFp
bHMgKEphbmkpCj4gCj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4g
Q2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBDYzogRXplcXVpZWwg
R2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAaW50ZWwuY29tPgo+IAo+IENoZWVycywgU2Vhbgo+IAo+IAo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgMjgzZjFlMzgzZTkxZDk2ZmU2NTJmYWQ1NDk1MzdhZTE1Y2Yz
MWQ2MDoKPiAKPiAgIHVkbWFidWY6IGFjdHVhbGx5IHVubWFwIHRoZSBzY2F0dGVybGlzdCAoMjAx
OS0wNi0wNSAxMDo0MToxNyArMDIwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoKPiAKPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
bWlzYyB0YWdzL2RybS1taXNjLWZpeGVzLTIwMTktMDYtMTMKPiAKPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gNDhlYWViNzY2NGM3NjEzOTQzODcyNGQ1MjBhMWVhNGE4NGEzZWQ5MjoK
PiAKPiAgIGRybTogYWRkIGZhbGxiYWNrIG92ZXJyaWRlL2Zpcm13YXJlIEVESUQgbW9kZXMgd29y
a2Fyb3VuZCAoMjAxOS0wNi0xMiAxMzoyNjoyNSArMDMwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gbWVzb246
IEEgZmV3IEcxMkEgZml4ZXMgYWNyb3NzIHRoZSBkcml2ZXIgKE5laWwpCj4gcXVpcmtzOiBBIGNv
dXBsZSBxdWlya3MgZm9yIEdQRCBkZXZpY2VzIChIYW5zKQo+IGdlbV9zaG1lbTogVXNlIHdyaXRl
Y29tYmluZSB3aGVuIHZtYXBwaW5nIG5vbi1kbWFidWYgQk9zIChCb3JpcykKPiBwYW5mcm9zdDog
QSBjb3VwbGUgdHdlYWtzIHRvIHJlcXVpcmluZyBkZXZmcmVxIChOZWlsICYgRXplcXVpZWwpCj4g
ZWRpZDogRW5zdXJlIHdlIHJldHVybiB0aGUgb3ZlcnJpZGUgbW9kZSB3aGVuIGRkYyBwcm9iZSBm
YWlscyAoSmFuaSkKPiAKPiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
PiBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBFemVxdWll
bCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+CgpUaGFua3MsIHB1bGxlZC4KLURhbmllbAoKPiAKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gQm9yaXMgQnJlemlsbG9uICgxKToKPiAgICAgICBkcm0vZ2VtX3NobWVtOiBVc2UgYSB3cml0
ZWNvbWJpbmUgbWFwcGluZyBmb3IgLT52YWRkcgo+IAo+IEV6ZXF1aWVsIEdhcmNpYSAoMSk6Cj4g
ICAgICAgZHJtL3BhbmZyb3N0OiBSZXF1aXJlIHRoZSBzaW1wbGVfb25kZW1hbmQgZ292ZXJub3IK
PiAKPiBIYW5zIGRlIEdvZWRlICgyKToKPiAgICAgICBkcm06IHBhbmVsLW9yaWVudGF0aW9uLXF1
aXJrczogQWRkIHF1aXJrIGZvciBHUEQgcG9ja2V0Mgo+ICAgICAgIGRybTogcGFuZWwtb3JpZW50
YXRpb24tcXVpcmtzOiBBZGQgcXVpcmsgZm9yIEdQRCBNaWNyb1BDCj4gCj4gSmFuaSBOaWt1bGEg
KDIpOgo+ICAgICAgIGRybS9lZGlkOiBhYnN0cmFjdCBvdmVycmlkZS9maXJtd2FyZSBFRElEIHJl
dHJpZXZhbAo+ICAgICAgIGRybTogYWRkIGZhbGxiYWNrIG92ZXJyaWRlL2Zpcm13YXJlIEVESUQg
bW9kZXMgd29ya2Fyb3VuZAo+IAo+IE5laWwgQXJtc3Ryb25nICg0KToKPiAgICAgICBkcm0vbWVz
b246IGZpeCBHMTJBIEhETUkgUExMIHNldHRpbmdzIGZvciA0SzYwIDEwMDAvMTAwMSB2YXJpYXRp
b25zCj4gICAgICAgZHJtL21lc29uOiBmaXggcHJpbWFyeSBwbGFuZSBkaXNhYmxpbmcKPiAgICAg
ICBkcm0vbWVzb246IGZpeCBHMTJBIHByaW1hcnkgcGxhbmUgZGlzYWJsaW5nCj4gICAgICAgZHJt
L3BhbmZyb3N0OiBtYWtlIGRldmZyZXEgb3B0aW9uYWwgYWdhaW4KPiAKPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAgICAgICAgICB8IDU1ICsrKysrKysrKysrKysrKysr
KysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICAgICAg
ICAgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJr
cy5jIHwgMzIgKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVs
cGVyLmMgICAgICAgICAgICAgfCAgNyArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9jcnRjLmMgICAgICAgICAgICAgfCAgNiArLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3BsYW5lLmMgICAgICAgICAgICB8ICA4ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX3ZjbGsuYyAgICAgICAgICAgICB8IDEzICsrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdml1LmMgICAgICAgICAgICAgIHwgIDMgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L0tjb25maWcgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyAgICB8IDEzICsrKysrLQo+ICBpbmNsdWRlL2Ry
bS9kcm1fZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAxMSBmaWxlcyBj
aGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gU2Vh
biBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
