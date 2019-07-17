Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA56C2E2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 00:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C626E2B2;
	Wed, 17 Jul 2019 22:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5176E2A9;
 Wed, 17 Jul 2019 22:01:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i11so27823057edq.0;
 Wed, 17 Jul 2019 15:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFb+F89wb7hJSMQiJHwk7hej5OffexidUMya9XbA7hk=;
 b=eoaqNRbEld6d12mbjZWASbuSOpxawI+hs2AtrGOG8yZG+pHxs6Jh0ewltLn/kwErXV
 aFKRBXblVZVmAYURLXKpYgK6U+3+AZH0kWbKf+VKDHyyej9gSeZvFJy1QjCwdRQJp2C8
 r3ajnSfz+BhnRwlTsj4ZwWt88B35WEmeVoDVuVaUsczlG7RqVdEHa0GzeFOEKHXdTQHu
 Xn4jEvwDy/pWHi9NIf1NyoqYNri9s1zpjAIjgw36fLRT6exP9k/oc+c5cq+Mf6y8k/Ou
 lKxvuZpvHB5ZesEr/wQeJdMNW95tc26LP/v8a6qmbwr3vtybrL3XAh4mIddzFCBIkb0k
 fA9w==
X-Gm-Message-State: APjAAAXwVjNP1KUI2/p0sE4R//ET5BNk2za2ta/IouqK7AyJex4KnFnp
 EAWOMcrYpTC0sD3O9AhYUfsiTmP77iaW82n10hw=
X-Google-Smtp-Source: APXvYqxOAb62gP6sqSSMuNm8xnIBPbG9G8d5bXEYaqpixv6l9xNpJqCvvczP1b0HDVKm9l8TsPv/yUL7Iez4jU/cNLw=
X-Received: by 2002:a50:a544:: with SMTP id z4mr36784507edb.71.1563400871020; 
 Wed, 17 Jul 2019 15:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <5d2f063c.1c69fb81.69fe8.9d45@mx.google.com>
 <20190717121002.GD4459@sirena.org.uk>
In-Reply-To: <20190717121002.GD4459@sirena.org.uk>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Jul 2019 15:00:59 -0700
Message-ID: <CAF6AEGv0xjUD17-4=EHe=xOnMnkQgmtp94g473tTr2fDH0aa0A@mail.gmail.com>
Subject: Re: next/master boot: 265 boots: 17 failed, 243 passed with 4
 offline, 1 conflict (next-20190717)
To: Mark Brown <broonie@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FFb+F89wb7hJSMQiJHwk7hej5OffexidUMya9XbA7hk=;
 b=oOO4HCySfdifrLOFYEtyfSEuKfjxMIFRyMI8fT/5OdTEpF7FBFdmqAO/U14jAVGyJs
 ol/8VhuynlOXcSYginVwm/AA1KPANThLMlWhsK5gYQEAxxnx1WsksfASUevRzWFLTPqS
 dgg6ztBunGG4vHcdj/eQJvwHWeXjb0FqcZo2i81Dmldi5r59CLwsWZJ8bf1UhOzY1ORL
 xC+WVbLsPeRxgAmYpvH2ObpmymYkF43iV/SpQBz5PujA885rxkpK7Mtjt4ub9TKi0SHw
 jhUnuIO1cu+8D9DhSuzh8dTVE7srb0lu1aPo9wgtiIhfF0F3kdcQWf8cmpZf37FJ44Hi
 Q2Nw==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 kernel-build-reports@lists.linaro.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgNToxMCBBTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDQ6Mjc6NTZBTSAtMDcw
MCwga2VybmVsY2kub3JnIGJvdCB3cm90ZToKPgo+IFRvZGF5J3MgLW5leHQgZmFpbHMgdG8gYm9v
dCBvbiBhIGNvdXBsZSBvZiBhcHE4MDY0IGJvYXJkczoKPgo+ID4gYXJtOgo+ID4gICAgIHFjb21f
ZGVmY29uZmlnOgo+ID4gICAgICAgICBnY2MtODoKPiA+ICAgICAgICAgICAgIHFjb20tYXBxODA2
NC1jbS1xczYwMDogMSBmYWlsZWQgbGFiCj4gPiAgICAgICAgICAgICBxY29tLWFwcTgwNjQtaWZj
NjQxMDogMSBmYWlsZWQgbGFiCj4KPiBJbiBib3RoIGNhc2VzIGl0IGxvb2tzIGxpa2UgdGhlIGVy
cm9yIGhhbmRsaW5nIHdoZW4gd2UgZmFpbCB0byBnZXQgdGhlCj4gZmlybXdhcmUgZm9yIHRoZSBH
UFUgaXMgYnJva2VuLCB3ZSBnZXQgYSBjcmFzaCBpbiB0aGUgaW5pdGlhbGl6YXRpb24KPiBjb2Rl
IHNob3J0bHkgYWZ0ZXIgZmFpbGluZyB0byBsb2FkIHNvbWUgZmlybXdhcmU6Cj4KPiBbICAgIDQu
NjA4Mjc5XSBtc20gNTEwMDAwMC5tZHA6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciBxY29tL2Ez
MDBfcG00LmZ3IGZhaWxlZCB3aXRoIGVycm9yIC0yCj4gWyAgICA0LjYxNDkxNl0gbXNtIDUxMDAw
MDAubWRwOiBbZHJtOmFkcmVub19yZXF1ZXN0X2Z3XSAqRVJST1IqIGZhaWxlZCB0byBsb2FkIGEz
MDBfcG00LmZ3Cj4gWyAgICA0LjYyMzIyOV0gODwtLS0gY3V0IGhlcmUgLS0tCj4gWyAgICA0LjYz
MTExMV0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0
IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDA4OAo+Cj4gLi4uCj4KPiBbICAgIDQuNjY1OTQ3XSBXb3Jr
cXVldWU6IGV2ZW50cyBkZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMKPiBbICAgIDQuNjcwNTMyXSBQ
QyBpcyBhdCBtc21fb3BlbisweDY0LzB4OTAKPiBbICAgIDQuNjc1NjU2XSBMUiBpcyBhdCBfcmF3
X3dyaXRlX3VubG9jaysweDIwLzB4NGMKPgo+IC4uLgo+Cj4gWyAgICA0Ljk0OTU1M10gW10gKG1z
bV9vcGVuKSBmcm9tIFtdIChkcm1fZmlsZV9hbGxvYysweDEzNC8weDIxYykKPiBbICAgIDQuOTU3
NzAzXSBbXSAoZHJtX2ZpbGVfYWxsb2MpIGZyb20gW10gKGRybV9jbGllbnRfaW5pdCsweGE4LzB4
MTI0KQo+IFsgICAgNC45NjUxNjJdIFtdIChkcm1fY2xpZW50X2luaXQpIGZyb20gW10gKGRybV9m
Yl9oZWxwZXJfaW5pdC5wYXJ0LjArMHgzMC8weDNjKQo+IFsgICAgNC45NzM0MTFdIFtdIChkcm1f
ZmJfaGVscGVyX2luaXQucGFydC4wKSBmcm9tIFtdIChtc21fZmJkZXZfaW5pdCsweDUwLzB4YjQp
Cj4gWyAgICA0Ljk4MjE3M10gW10gKG1zbV9mYmRldl9pbml0KSBmcm9tIFtdIChtc21fZHJtX2Jp
bmQrMHg1NjAvMHg2MzgpCj4KPiBGdWxsIGRldGFpbHMgKGluY2x1ZGluZyBmdWxsIGJvb3QgbG9n
cykgYXQ6Cj4KPiAgICAgICAgIGh0dHBzOi8va2VybmVsY2kub3JnL2Jvb3QvaWQvNWQyZWRlMjM1
OWI1MTRhNTRiNDllOTFiLwo+ICAgICAgICAgaHR0cHM6Ly9rZXJuZWxjaS5vcmcvYm9vdC9pZC81
ZDJlZGUyNzU5YjUxNGE1NDc0OWU5MWQvCgoKamZ5aSwgSm9yZGFuIHRyYWNrZWQgdGhpcyBkb3du
IHRvIG5lZWRpbmc6Cmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMTQz
OTcvCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
