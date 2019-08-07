Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1F85082
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 18:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19196E731;
	Wed,  7 Aug 2019 16:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EFB6E730
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 16:01:25 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id f187so32591869ywa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 09:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eeiP51FcFmoX/NLw2zyGixAKenkZHfpToaXmnoZImPg=;
 b=OW909oi8W5sERHH2doxq6IlkCortnR8I+JmO3Y1HteAVSfHaiW45jKKP/Nw9apwcG6
 xwdEZJG+KElk751cM48BtloTimmhQQKHxoRWoTSxNmtqSGXqVTqz6R6kqTZUgzeEDZSy
 /nP9js1Gc94dWTBZ1taY3SGWszEcRWHPi/Ldsf7pFRN8eZIZPCZjMQ7m1JRbmjm0j1dE
 ymSgc9/s3+uOGMzJ5KgcgM1jkw5zLluug4nCTvggdFRUBmFYCrWVHg0EH6wPg4VXB3eX
 vCpqLWBaI23cLB2EscmHru8jSX7/QuNL2Z6FDXnsgrAby0CoxlU5ixkQvwIkWCiTXhP1
 kGYA==
X-Gm-Message-State: APjAAAVE548ZXiVoVA5jlrP78zsSc4qVlWoF7celfxu5k6eEgzsHnmzA
 aWyy134pCbR9Uc2OyNs6ys6AaTEUOsw=
X-Google-Smtp-Source: APXvYqyTqH6sT6giN3uYXYjnmbQnWegWZlH+q63mLmOoeebZurplwai4/4wVAUWbECG0PsiVVtegTQ==
X-Received: by 2002:a81:7b02:: with SMTP id w2mr6825562ywc.436.1565193684586; 
 Wed, 07 Aug 2019 09:01:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k64sm20548672ywk.77.2019.08.07.09.01.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 09:01:23 -0700 (PDT)
Date: Wed, 7 Aug 2019 12:01:23 -0400
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: Re: [PATCH 0/5] drm-misc-next: Revert patches missing reviews
Message-ID: <20190807160123.GC104440@art_vandelay>
References: <20190807142101.251400-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eeiP51FcFmoX/NLw2zyGixAKenkZHfpToaXmnoZImPg=;
 b=WwGe3z35ROWlcJlIyo3zL71q9nYiAhdFH+AN+gKKsYWmIeX+zQxufi/0mvJakrpruq
 51c7PXqBP90Kt7YLs3uZSmBsd79Rnnp33L1P7/Bsbt3MjAQZ4D7oz10a14Y1pzFW7xmD
 joWHyxNkTDZb0TS6z2e+j8PEvY1dNb4ISnbDe9eg4Q9vN9BUiupZ38gDdgdFfyNAW/os
 lNH8H1B6+RKYtnWySf/9IAuw/hDZzzjPFPQL5Dm6AZvK9zMYf8Uf6sKZo9ElnjiztSwU
 JP/MfJgqmA3Ud9M7UmXihkgZu1zafR4dMTgGATTDHrmxKpqp9zq2LnRKDU+Nqk43Ye8+
 YT2Q==
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
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6MjA6NTNBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IEhlbGxvb28s
Cj4gVGhpcyBoYXMgYmVlbiBjb3ZlcmVkIGFkIG5hdXNlYW0gb24gdGhlIG0tbCBhbmQgaXJjLCBi
dXQgZm9yIHRoZSByZWNvcmQ6Cj4gCj4gUmV2aWV3cyBhcmUgYSBtYW5kYXRvcnkgcmVxdWlyZW1l
bnQgZm9yIHBhdGNoZXMgaW4gZHJtLW1pc2MtbmV4dCwgaXQncwo+IHdoYXQga2VlcHMgdXMgYWxs
IGhvbmVzdCBpbiB0aGUgY29tbWl0dGVyIG1vZGVsLiBUaGUgbW9zdCByZWNlbnQKPiBkcm0tbWlz
Yy1uZXh0IHB1bGwgaW5jbHVkZWQgYSBoYW5kZnVsIG9mIHBhdGNoZXMgdGhhdCB3ZXJlIG1pc3Np
bmcKPiByZXZpZXdzLiBUaGVyZSB3YXMgYWJzb2x1dGVseSB6ZXJvIG5lZmFyaW91cyBpbnRlbnQs
IGJ1dCBydWxlcyBhcmUKPiBydWxlcywgc28gd2UncmUgcmV2ZXJ0aW5nIHRoZW0uCj4gCj4gSSBm
ZWVsIGNvbmZpZGVudCByZS1hcHBseWluZyBhbGwgb2YgdGhlc2Ugd2l0aCBteSBTb0IsIHNvIEkg
cGxhbiBvbgo+IGRvaW5nIHRoYXQgaW4gdGhlIHNhbWUgcHVzaC4KCkFwcGxpZWQgdG8gZHJtLW1p
c2MtbmV4dCB3aXRoIGFsbCBwYXRjaGVzIHJlLWFwcGxpZWQuCgpTZWFuCgo+IAo+IFRoYW5rcyB0
byBldmVyeW9uZSBmb3IgaGFuZGxpbmcgdGhpcyBzbyB3ZWxsLCBzZXJpb3VzbHkgYXdlc29tZSB0
aGF0Cj4gd2UgY2FuIHN0YXkgY29uc3RydWN0aXZlIGFzIGEgY29tbXVuaXR5IFxvLy4KPiAKPiBM
YXN0bHksIHRoaXMgd2lsbCBiZSBjYXVnaHQgYnkgb3VyIHRvb2xpbmcgaW4gdGhlIGZ1dHVyZSBz
byB0aGlzIHNob3VsZAo+IGJlIHRoZSBsYXN0IHRpbWUgdGhpcyBoYXBwZW5zIChvbiBhY2NpZGVu
dCkuCj4gCj4gU2Vhbgo+IAo+IFNlYW4gUGF1bCAoNSk6Cj4gICBSZXZlcnQgIlJldmVydCAiZHJt
L2dlbTogUmVuYW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkgdG8KPiAgICAgZHJtX2dlbV9t
YXBfb2Zmc2V0KCkiIgo+ICAgUmV2ZXJ0ICJSZXZlcnQgImRybS9wYW5mcm9zdDogVXNlIGRybV9n
ZW1fbWFwX29mZnNldCgpIiIKPiAgIFJldmVydCAiZHJtL3ZnZW06IGRyb3AgRFJNX0FVVEggdXNh
Z2UgZnJvbSB0aGUgZHJpdmVyIgo+ICAgUmV2ZXJ0ICJkcm0vbXNtOiBkcm9wIERSTV9BVVRIIHVz
YWdlIGZyb20gdGhlIGRyaXZlciIKPiAgIFJldmVydCAiZHJtL25vdXZlYXU6IHJlbW92ZSBvcGVu
LWNvZGVkIGRybV9pbnZhbGlkX29wKCkiCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9i
dWZmZXJzLmMgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAg
ICAgICAgICAgIHwgMTAgKysrKysrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZ2VtLmMgfCAgMyArLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgICAg
ICAgICAgIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2FiaTE2LmMgfCAgNiArKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9hYmkxNi5oIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RybS5jICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMgfCAxNiArKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1f
ZHJ2LmMgICAgICAgICB8ICA0ICsrLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgICAg
ICAgICAgICAgIHwgIDQgKystLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCsp
LCAzNyBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
