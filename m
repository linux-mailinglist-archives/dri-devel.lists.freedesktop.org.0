Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394A267CA
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E5789A77;
	Wed, 22 May 2019 16:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC689A77
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:13:03 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w11so4608047edl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=H9svHU931UiX9eMbbZmiUfF04cjDaXORe28ufQfzIpg=;
 b=DI6/ZKRS93pMT0sVY9sIebByqiF3SkjKiAFiXFJ4zIfvTG1rSqucNuRcTpgxhjrIaJ
 G2wkAEeMK18h0Is2gZwzVasheAShGuFbun0cVf6gYVpK/HvqrgCVyTB6D5yCk3eWLTfP
 FJnjKz8zYYfB0M5AEaaLYq4SSdlZldAniqQZuvDBuiUohp72Fa3iYuAPNc/dC/RZEg3i
 33kXc9rN1nk2Asi8Hnobcjr3uGoW67Kxa/oOm9JXFi70S/105gTYKiB8iup9paIH/ubT
 +jf+EaTS+nDYpwrz/sdpRznAtrE+It7zBY3ZwFWbsCqBmkrB/fmZ24rOF77lN0OKN0OM
 1gyg==
X-Gm-Message-State: APjAAAUZh1RJbUw0ac/a8x6UFvKxvKb/Rx+pcuVNcg/4w/K4hXUt2tC9
 YqzUI4L1PiVTwBJ4QrvmwWWj0g==
X-Google-Smtp-Source: APXvYqyxgffm5UBHdBWdnYIdeYcWKETiRhcJpsNijDtNOVVtjtb+YzjnHLmRmQv9UAWw9bfDKE5pqA==
X-Received: by 2002:a17:906:cd27:: with SMTP id
 oz39mr64688859ejb.73.1558541582419; 
 Wed, 22 May 2019 09:13:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c26sm7312236ede.32.2019.05.22.09.13.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 09:13:01 -0700 (PDT)
Date: Wed, 22 May 2019 18:12:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/4] drm/TODO: add a task to kill DRM_UNLOCKED
Message-ID: <20190522161259.GV21222@phenom.ffwll.local>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190522154702.16269-4-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522154702.16269-4-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H9svHU931UiX9eMbbZmiUfF04cjDaXORe28ufQfzIpg=;
 b=Y/vfci6WoKajzYv4hef7rvAi6coBjkBvDf/Z3yZ2t3xtzA3m9vlGSphnoOpYZQmObx
 3nBkm6lvU9dh4RX3XD4eoSgEejYasQq69UcmXS1ujZdON7DxDdQluc0O+BOrG6TWnY8C
 wZEPxHp+HNb5cuQgZjaVPeKcUZMi+MbdJf7Zg=
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDQ6NDc6MDJQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gU2hvdWxkIG1pbmltaXNlIHRoZSBjb3B5L3Bhc3RlIG1pc3Rha2VzLCBmaXhlZCB3aXRoIHBy
ZXZpb3VzIHBhdGNoZXMuCj4gCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
Pgo+IC0tLQo+IERhbmllbCwgbm90IDEwMCUgc29sZCBvbiB0aGUgaWRlYS4gVGhhdCBwbHVzIGxp
c3RpbmcgeW91IGFzIGEgY29udGFjdAo+IHBvaW50IDstKQo+IAo+IFdoYXQgZG8geW91IHRoaW5n
Pwo+IEVtaWwKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAxOSArKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QKPiBpbmRleCA2NmYwNWY0ZTQ2OWYuLjllNjdkMTI1ZjJmZCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3Rv
ZG8ucnN0Cj4gQEAgLTM5Nyw2ICszOTcsMjUgQEAgU29tZSBvZiB0aGVzZSBkYXRlIGZyb20gdGhl
IHZlcnkgaW50cm9kdWN0aW9uIG9mIEtNUyBpbiAyMDA4IC4uLgo+ICAgIGVuZCwgZm9yIHdoaWNo
IHdlIGNvdWxkIGFkZCBkcm1fKl9jbGVhbnVwX2tmcmVlKCkuIEFuZCB0aGVuIHRoZXJlJ3MgdGhl
IChmb3IKPiAgICBoaXN0b3JpY2FsIHJlYXNvbnMpIG1pc25hbWVkIGRybV9wcmltYXJ5X2hlbHBl
cl9kZXN0cm95KCkgZnVuY3Rpb24uCj4gIAo+ICtVc2UgRFJNX0xPQ0tFRCBpbnN0ZWFkIG9mIERS
TV9VTkxPQ0tFRAo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsK
PiArRFJNX1VOTE9DS0VEIGlzIGEgcmVtYWluZGVyIGZyb20gdGhlIGxlZ2FjeSBEUk0gZHJpdmVy
cy4gU2VlbWluZ2x5IGRyaXZlcnMgZ2V0Cj4gK3RyaWNrZWQgYnkgaXQgYW5kIGl0IGVuZHMgdXAg
aW4gdGhlIGRyaXZlciBwcml2YXRlIGlvY3Rscy4KPiArCj4gK1RvZGF5IG5vIG1vcmUgbGVnYWN5
IGRyaXZlcnMgYXJlIGFsbG93ZWQgYW5kIG1vc3QgY29yZSBEUk0gaW9jdGxzIGFyZSB1bmxvY2tl
ZC4KPiArCj4gK0ludHJvZHVjZSBEUk1fTE9DS0VELCB1c2UgaXQgdG8gYW5ub3RhdGUgb25seSB0
aGUgcmVsZXZhbnQgaW9jdGxzIGFuZCBraWxsIHRoZQo+ICtvbGQgRFJNX1VOTE9DS0VELgo+ICsK
PiArUGF0Y2ggc2VyaWVzIHNob3VsZCBiZSBzcGxpdCBhcyBmb2xsb3dzOgo+ICsgLSBQYXRjaCAx
OiBkcm06IGFkZCB0aGUgbmV3IERSTV9MT0NLRUQgZmxhZyBhbmQgaG9ub3VyIGl0Cj4gKyAtIFBh
dGNoIDI6IGRybTogY29udmVydCBjb3JlIGlvY3RscyBmcm9tIERSTV9VTkxPQ0tFRCB0byBEUk1f
TE9DS0VECj4gKyAtIFBhdGNoIDMtLi4uOiBkcm0vZHJpdmVyWDogY29udmVydCBkcml2ZXIgaW9j
dGxzIGZyb20gLi4uCj4gKyAtIFBhdGNoIFg6IGRybTogcmVtb3ZlIG5vIGxvbmdlciB1c2VkIERS
TV9VTkxPQ0tFRCwgZHJvcCB0b2RvIGl0ZW0KClNlZW1zIGxpa2UgdG9vIG11Y2ggYm90aGVyIGZv
ciBsZWdhY3kgZHJpdmVycyAuLi4gV2hhdCBJJ2QgZG8gaXMgc29tZXRoaW5nCmEgbG90IGNoZWFw
ZXIsIHNpbmNlIGFsbCB3ZSdyZSB0b3VjaGluZyBoZXJlIGFyZSBsZWdhY3kgZHJpdmVyczoKClJl
bW92ZSBEUk1fVU5MT0NLRUQgZnJvbSBldmVyeXRoaW5nIGV4Y2VwdCB0aGUgb2xkIHZibGFuayBp
b2N0bC4gVGhhdCBvbmUKd2UgbmVlZCB0byBrZWVwLCBiZWNhdXNlIGl0IGZyZWV6ZXMgWDoKCmNv
bW1pdCA4ZjRmZjJiMDZhZmNkNmYxNTE4Njg0NzRhNDMyYzYwMzA1N2VhZjU2CkF1dGhvcjogSWxp
amEgSGFkemljIDxpaGFkemljQHJlc2VhcmNoLmJlbGwtbGFicy5jb20+CkRhdGU6ICAgTW9uIE9j
dCAzMSAxNzo0NjoxOCAyMDExIC0wNDAwCgogICAgZHJtOiBkbyBub3Qgc2xlZXAgb24gdmJsYW5r
IHdoaWxlIGhvbGRpbmcgYSBtdXRleAoKQW55dGhpbmcgZWxzZSBJIHRoaW5rIGlzIGVpdGhlciBu
ZXZlciB1c2VkIGJ5IGxlZ2FjeSB1c2Vyc3BhY2UsIG9yIGp1c3QKZG9lc24ndCBtYXR0ZXIuIFRo
YXQncyBzaW1wbGUgZW5vdWdoIHRoYXQgSSBkb24ndCB0aGluayB3ZSByZWFsbHkgbmVlZCBhCnRv
ZG8gZm9yIGl0IDotKSBJIGd1ZXNzIGlmIHlvdSB3YW50IHRvIGtpbGwgRFJNX1VOTE9DS0VEIHlv
dSBjb3VsZCByZXBsYWNlCnRoZSBjaGVjayB3aXRoIGlvY3RsLT5mdW5jID09IGRybV92Ymxhbmtf
aW9jdGwsIG9mYyBvbmx5IGluIHRoZQpEUklWRVJfTEVHQUNZIHBhdGguCgpPbiBwYXRjaGVzIDEt
MyBpbiB5b3VyIHNlcmllczoKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgoKQ2hlZXJzLCBEYW5pZWwKCgoKPiArCj4gK0NvbnRhY3Q6IEVtaWwgVmVs
aWtvdiwgRGFuaWVsIFZldHRlcgo+ICsKPiAgQmV0dGVyIFRlc3RpbmcKPiAgPT09PT09PT09PT09
PT0KPiAgCj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
