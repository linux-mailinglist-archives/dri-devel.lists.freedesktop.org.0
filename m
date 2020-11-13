Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6F2B26D1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 22:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F75F6E5C5;
	Fri, 13 Nov 2020 21:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4DF6E5C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 21:31:41 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n89so10246426otn.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9BLptiQOJHn9TYF3BunT2B46fuCTxdzlPaSexof02uk=;
 b=CJm2fsJcWHON+vb7H+mlrLgr+nW5HCOUwhuxsAorRua5qkHD0uJwnab1BTb/rYq62Q
 TmO2r5EeibqgInEKPyEqAvfQE6zt1zweXSkfKQkhEUwJTP558FVAGGRZQsPejW5761UK
 BslAtwbZaWTz8wVnyMrG/Rk9rLGt3tDHHNQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9BLptiQOJHn9TYF3BunT2B46fuCTxdzlPaSexof02uk=;
 b=iFutsjOPRxvyjUQvvIoSfDDt/Rvv1yIwSOY/ayRMIR8ApCFuAB1N2VwQzPxt+dEk/h
 jh3MiR9rtNIFwAz5LdAEK1jbR1ziWkc7MqjU/veL49ezvDQyzFiQDDGiruVIhz0QD4Dy
 2jfEscVLopoa3WeXUfKPtNds3J+jCN6ixRSVnuIKc7KtLbkCoUNzG483yaggMfUuXdua
 iLm9+OETwxZJBuLrn5AgsCIFYq6FrGz/gUJwX9TPAVG0IMwlqi7DLz8RpnsGXTltCeNG
 4nOCsK0fnzHWjnGGpw1fFRGI9R8A8CsE7HXU6gsfIGebNCh+k1/uuc/fj53BOXxEW3Ei
 iWiA==
X-Gm-Message-State: AOAM530qaL6XRVhOE78uu45UvZLoiPKn2aBvxjFK11yr18bWEXbz+pUr
 bUnXPL0xpi46gPgt01fB6of9qNt6OF2J8gXKkeLl0Q==
X-Google-Smtp-Source: ABdhPJyOcBx7Di3GK8BX+XCfjczSDp17aBUIy1Y+omg8mAjoGdwyKEUhvLMS8wIV/S8UL390wFXuY58QeB+/xm7j5U0=
X-Received: by 2002:a9d:27a5:: with SMTP id c34mr2873869otb.303.1605303100385; 
 Fri, 13 Nov 2020 13:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
In-Reply-To: <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 13 Nov 2020 22:31:29 +0100
Message-ID: <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgOTo1MyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiBGcmksIDEzIE5vdiAyMDIwLCAyMDo1MCBEYW5pZWwg
VmV0dGVyLCA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPj4KPj4gT24gVGh1LCBOb3YgMTIsIDIw
MjAgYXQgMDk6MjU6MTZQTSArMDEwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+PiA+IEhpIExlZSwK
Pj4gPgo+PiA+IE9uIFRodSwgTm92IDEyLCAyMDIwIGF0IDA3OjAwOjExUE0gKzAwMDAsIExlZSBK
b25lcyB3cm90ZToKPj4gPiA+IFRoZSBwcmVjZWRlbnQgaGFzIGFscmVhZHkgYmVlbiBzZXQgYnkg
b3RoZXIgbWFjcm9zIGluIHRoZSBzYW1lIGZpbGUuCj4+ID4gPgo+PiA+ID4gRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4+ID4gPgo+PiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmM6NTU6MTk6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGNy
dGPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4gPiA+
ICA1NSB8IHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPj4gPiA+ICB8IF5+fn4KPj4gPiA+Cj4+ID4g
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4+ID4gPiBD
YzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+ID4gPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+PiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPj4gPiA+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+
Cj4+ID4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiA+ID4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPj4gPgo+PiA+IEFsc28g
YXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lgo+PiA+IFRoaXMgd2FzIHRoZSBsYXN0IHBhdGNoIGZy
b20gdGhpcyBiYXRjaCBJIHdpbGwgcHJvY2Vzcy4KPj4gPiBUaGUgb3RoZXJzIGFyZSBsZWZ0IGZv
ciB0aGUgbWFpbnRhaW5lcnMgdG8gcGljayB1cC4KPj4KPj4gYnR3IGZvciBwYXRjaGVzIHRoYXQg
bWFpbnRhaW5lcnMgZG9uJ3QgcGljayB1cCwgdGhlIHVzdWFsIHByb2Nlc3MgaXMgdGhhdAo+PiB3
ZSBnaXZlIHRoZW0gMiB3ZWVrcywgdGhlbiBqdXN0IG1hc3MgYXBwbHkuIE5vdyB5b3UncmUgcHJv
ZHVjaW5nIGEgbG90IG9mCj4+IHBhdGNoZXMsIHRvbyBtdWNoIGZvciBtZSB0byBrZWVwIHRyYWNr
LCBzbyBwbGVhc2UganVzdCBwaW5nIG1lIHdpdGggYQo+PiByZXNlbmQgZm9yIHRob3NlIHRoYXQg
ZXhwaXJlZCBhbmQgSSdsbCBnbyB0aHJvdWdoIGFuZCBwaWNrIHRoZW0gYWxsIHVwLgo+Cj4KPiBU
aGF0J3MgZ3JlYXQgRGFuaWVsLiBUaGFua3MgZm9yIHlvdXIgc3VwcG9ydC4KPgo+IEkgY2FuIGRv
IG9uZSBiZXR0ZXIgdGhhbiB0aGF0Lgo+Cj4gV291bGQgYSBwdWxsLXJlcXVlc3Qgc3VpdCB5b3U/
CgpXZSBoYXZlIGEgZmV3IHRyZWVzIGdvaW5nIG9uLCBhbmQgeW91ciBwYXRjaGVzIGFyZSBsYW5k
aW5nIHRocm91Z2ggYWxsCmtpbmRzIG9mIHRoZW0uIFNvIHRoaXMgbWlnaHQgYmUgbW9yZSBjb29y
ZGluYXRpb24gcGFpbi4gSWYgeW91IGNhbgpleGNsdWRlIHBhdGNoZXMgZm9yIHRoZSBzZXBhcmF0
ZWx5IGFuZCB1c3VhbGx5IGZhaXJseSB3ZWxsIG1haW50YWluZWQKZHJpdmVycyBvdXQgb2YgdGhl
IHB1bGwgaXQgc2hvdWxkIHdvcmsgKGRybS9hbWQsIGRybS9yYWRlb24sIGRybS9pOTE1LApkcm0v
bm91dmVhdSwgZHJtL21zbSBhbmQgZHJtL29tYXBkcm0gcHJvYmFibHkgdGhlIHVzdWFsIG9uZXMp
LgoKT3IgeW91IGp1c3Qgc2VuZCB0aGUgbmV4dCBwaWxlIGFuZCB3ZSdsbCBzZWUuCgpBbHNvIEkg
Z3Vlc3MgSSBjYW4ndCByZWFsbHkgaW50ZXJlc3QgeW91IGluIGNvbW1pdCByaWdodHMgc28gdGhp
cwpwYXRjaCBib21icyBnZXQgb2ZmIG15IGJhY2sgYWdhaW4/IDotKQoKQ2hlZXJzLCBEYW5pZWwK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
