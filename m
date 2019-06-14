Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50B46378
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46989A9B;
	Fri, 14 Jun 2019 15:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC8189A62
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:57:08 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id a127so1640031oii.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rr8QmmVDqm9g7vtLPQo76/1AeQyKO2Brlqd+/s/CNAk=;
 b=oFduLcUJX6jA4PuWYrCALUXpS1n3lwvkwugcFhqJQLpMLdICZv/QAFPKQrUUAsTNrl
 VJw/M1RUHJXC0luEUCQ/EvqjpOquTCBNg+IDflA62R/2WdnmUd3fPMaxrcLyrFxXQc/v
 ATvL2HPT8N9AJsZb4GZWkdKh96YJIHYse1bSpkir9TuweQc7pimSNNBviWdaBFs1JQtI
 i3maEy0trJz6ZIA3xhRlNwZt7a+bx1o7G0lcKgVXKZNzbow6TKEo/VrHDY57oKZfa8Bg
 7Z5466XER28kGg7vGirnvzWRA+FSLkTLbkIWUF8z0Ahwtr28CRqyFrwPgThAPj+NSxDs
 cRdw==
X-Gm-Message-State: APjAAAX8wVO36Leg4wcGybq2BhUkd0Zq16fY85D9bjjswmqc1v5AcKzJ
 HxRwQKB6TlcHtokfaoPnTj5XCkj14gU34g2+ybSI5g==
X-Google-Smtp-Source: APXvYqzT1JjH8zQAgA+n7UWH/BJuUVpDrXEv/twamsRgKEc+SVqcRV+GVIVVoCgNo6kGViniNwjULXHFYqwXIZ46Ko0=
X-Received: by 2002:aca:6208:: with SMTP id w8mr2350122oib.128.1560527827419; 
 Fri, 14 Jun 2019 08:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190613021856.3307-1-alexander.deucher@amd.com>
 <20190614154909.GD23020@phenom.ffwll.local>
In-Reply-To: <20190614154909.GD23020@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 14 Jun 2019 17:56:55 +0200
Message-ID: <CAKMK7uE6_k8jC+nLoG=zto4tuqM2JXzR3yOv1ccVSfm34h=79A@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.2
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rr8QmmVDqm9g7vtLPQo76/1AeQyKO2Brlqd+/s/CNAk=;
 b=FQrV2qrq/wPoLvySvROQJT50Vkvl4FFDoXZ/cHsYZWwBk9tBSUW4YR1Ik1/9CzJIAB
 UGL5iPrbBbLqZ45YQsF9Mhh+cCusKJrnwnAF89ZPROb+/gLemTTCIMiRH0bo78oRBNAU
 uIqKFnRWJdEbdYPVz3n2X8ADY+XkbussGz9Es=
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNTo0OSBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6MTg6NTZQTSAtMDUw
MCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+ID4gSGkgRGF2ZSwgRGFuaWVsLAo+ID4KPiA+IEZpeGVz
IGZvciA1LjI6Cj4gPiAtIEV4dGVuZCBwcmV2aW91cyB2Y2UgZml4IGZvciByZXN1bWUgdG8gdXZk
IGFuZCB2Y24KPiA+IC0gRml4IGJvdW5kcyBjaGVja2luZyBpbiByYXMgZGVidWdmcyBpbnRlcmZh
Y2UKPiA+IC0gRml4IGEgcmVncmVzc2lvbiBvbiBTSSB1c2luZyBhbWRncHUKPiA+Cj4gPiBUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDY3MWUyZWU1ZWUyMTI3MTc5Y2E4ODRiNDM5
YWI2MDAxYTYyM2VkZDY6Cj4gPgo+ID4gICBNZXJnZSBicmFuY2ggJ2xpbnV4LTUuMicgb2YgZ2l0
Oi8vZ2l0aHViLmNvbS9za2VnZ3NiL2xpbnV4IGludG8gZHJtLWZpeGVzICgyMDE5LTA2LTA3IDE3
OjE2OjAwICsxMDAwKQo+Cj4gU29tZWhvdyBtaXNzZWQgdGhpcyBvbmUsIGJ1dCBqdXN0IGZvdW5k
IGl0IGJlZm9yZSBJIHdhbnRlZCB0byBwdXNoIG91dCB0aGUKPiAtZml4ZXMgcHVsbCB0byBMaW51
cyAuLi4KPgo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gPgo+
ID4gICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBkcm0tZml4ZXMt
NS4yCj4KPiBQdWxsZWQsIHRoYW5rcy4KCldhcyBhIGJpdCBhIGxpZSwgdGhlIHNjcmlwdCB3YXMg
c3RpbGwgcnVubmluZywgYW5kIGNvbXBsYWluZWQgdGhhdCBJCmRpZG4ndCBhZGQgYSBwcm9wZXIg
bWVyZ2UgY29tbWl0IG1lc3NhZ2UuIENhbiB5b3UgcGxzIHVzZSBhbm5vdGF0ZWQKdGFncywgdGhl
biB0aGUgdG9vbGluZyB3ZSB1c2UgbWFrZXMgdGhpcyBoYXBwZW4gYXV0b21hdGljYWxseT8gZGlt
CnB1bGwtcmVxdWVzdCBmb3IgY2hlYXRzaGVldCwgaWYgeW91IG5lZWQgb25lLgoKQ2hlZXJzLCBE
YW5pZWwKCj4gLURhbmllbAo+Cj4gPgo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGYzYTUyMzFjOGYxNGFjZDQyODQ1ZTllNjBmNTA2YjRlOTQ4ZjBlNjg6Cj4gPgo+ID4gICBkcm0v
YW1kZ3B1OiByZXR1cm4gMCBieSBkZWZhdWx0IGluIGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2Fy
ZSAoMjAxOS0wNi0xMiAyMDozOTo0OSAtMDUwMCkKPiA+Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBBbGV4IERl
dWNoZXIgKDEpOgo+ID4gICAgICAgZHJtL2FtZGdwdTogcmV0dXJuIDAgYnkgZGVmYXVsdCBpbiBh
bWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUKPiA+Cj4gPiBEYW4gQ2FycGVudGVyICgxKToKPiA+
ICAgICAgIGRybS9hbWRncHU6IEZpeCBib3VuZHMgY2hlY2tpbmcgaW4gYW1kZ3B1X3Jhc19pc19z
dXBwb3J0ZWQoKQo+ID4KPiA+IFNoaXJpc2ggUyAoMSk6Cj4gPiAgICAgICBkcm0vYW1kZ3B1L3t1
dmQsdmNufTogZmV0Y2ggcmluZydzIHJlYWRfcHRyIGFmdGVyIGFsbG9jCj4gPgo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICB8IDQgKystLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDIgKysKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA0ICsrKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jICAgfCA1ICsrKystCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdXZkX3Y3XzAuYyAgIHwgNSArKysrLQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNv
ZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNo
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
