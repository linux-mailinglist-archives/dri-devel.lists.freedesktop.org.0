Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF582ED8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3BC6E346;
	Tue,  6 Aug 2019 09:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF7A6E346;
 Tue,  6 Aug 2019 09:40:54 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id o19so33395972uap.13;
 Tue, 06 Aug 2019 02:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2bydWqICUXQDshDSq7NvPQmbtpl4E+KMso2LUv31ks=;
 b=eJsegNEIW3Qy+S3+OMz0gJJBufJLykIoYG++GRPSV23QAHZjFZjkEbCvE8Tvr3395M
 sl7deuNxCdvLUXWVizSntrPsAhxHX1ZhSUdPSYWY0OWY/gK85n0s6jjl3H6EWi4/OJuh
 J5uhfwj4xunKpWP/vaGi/z8RXMtb4YH80pttQQkY+CWMuJYjzbDEAzHoNcS+Us6EhVPt
 0v/ofX6tMdIHZsTd6AL35B1TEYA004Lu98vjSkv64ovn4ioNNBNAyANhD8QYzff8nntD
 9eOH3BroIX9Ie2g/+WTgdHYXDQHcn6cunPAdvW9TfWqxDGIEDsgVWA87PbRjHQyQk2l1
 t6uQ==
X-Gm-Message-State: APjAAAXKXGxtzwq5IQTcwWtR3tyMAuXFIqHyeC50SgP3GD12aKkxm8u/
 QH204X3GbYc1NgE/c8yBejMNiDFpZoQ88rBP6IU=
X-Google-Smtp-Source: APXvYqy6i1ysKGXbVsRoN/KbEIp+8Xt57FHDOX3/Jo2l2I3atKaXRz9pzz+Oeu4V7eP7vlPe0M5eJOLkeLffDAwwduI=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr1599889uap.69.1565084453309;
 Tue, 06 Aug 2019 02:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
In-Reply-To: <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 10:40:04 +0100
Message-ID: <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=W2bydWqICUXQDshDSq7NvPQmbtpl4E+KMso2LUv31ks=;
 b=nJBrIZjCaT8aqvBTm9PXE+filrvUeID4DE6QR8jbsuQpqCst8qMMQpV2S21kVhjYi/
 L8pbPWy8xUZrAy9qyrUrkTIRuzHutzwXHYKoz256Sooe/YT5mUoOZaym67eFyb6Sh8bn
 WzbyNHEcvNDiVo6ssSwL3llxpzbIXV/mNEGU2+Tk3G+A4D8Ztu5XU9xXs6aMZaU4MaNp
 gJzocKy1zdFGIb7WiWtQ1YcCxcAMO58J+urc4y6ukfMBZVzvn8xsYtYEjh8bmmsiYWix
 WQmB8xvV0MJHpmVVNm5JKIu/nRgmmcG74qozW8pGIbYzJAmfJ21+BPSJFmXQ9EmheyAu
 hqOg==
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA2IEF1ZyAyMDE5IGF0IDA4OjM0LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDYsIDIwMTkgYXQgMjozNCBBTSBEYXZl
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgMyBBdWcg
MjAxOSBhdCAyMDo0NywgTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIERhbmllbCwgRGF2ZSwKPiA+ID4KPiA+ID4gSGVyZSBpcyB0
aGUgZmlyc3QgKGFuZCBwcmV0dHkgbGF0ZSkgZHJtLW1pc2MtbmV4dCBQUi4KPiA+ID4KPiA+ID4g
SXQncyBwcmV0dHkgYmlnIGR1ZSB0byB0aGUgbGF0ZW5lc3MsIGJ1dCB0aGVyZSdzIG5vdGhpbmcg
cmVhbGx5IG1ham9yCj4gPiA+IHNob3dpbmcgdXAuIEl0J3MgcHJldHR5IG11Y2ggdGhlIHVzdWFs
IGJ1bmNoIG9mIHJld29ya3MsIGZpeGVzLCBhbmQKPiA+ID4gbmV3IGhlbHBlcnMgYmVpbmcgaW50
cm9kdWNlZC4KPiA+ID4KPiA+Cj4gPiBkaW06IDQxNWQyZTllMDc1NyAoIlJldmVydCAiZHJtL2dl
bTogUmVuYW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkKPiA+IHRvIGRybV9nZW1fbWFwX29m
ZnNldCgpIiIpOiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiBkaW06IGJlODU1MzgyYmFj
YiAoIlJldmVydCAiZHJtL3BhbmZyb3N0OiBVc2UgZHJtX2dlbV9tYXBfb2Zmc2V0KCkiIik6Cj4g
PiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiBkaW06IGU0ZWVlOTNkMjU3NyAoImRybS92
Z2VtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+ID4gbWFuZGF0b3J5
IHJldmlldyBtaXNzaW5nLgo+ID4gZGltOiA4ODIwOWQyYzUwMzUgKCJkcm0vbXNtOiBkcm9wIERS
TV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+ID4gbWFuZGF0b3J5IHJldmlldyBtaXNz
aW5nLgo+ID4gZGltOiBjY2RhZTQyNTc1NjkgKCJkcm0vbm91dmVhdTogcmVtb3ZlIG9wZW4tY29k
ZWQgZHJtX2ludmFsaWRfb3AoKSIpOgo+ID4gbWFuZGF0b3J5IHJldmlldyBtaXNzaW5nLgo+ID4K
PiA+IFByZXR0eSBzdXJlIHJldmlldyBpbiBkcm0tbWlzYy1uZXh0IGlzIGEgcnVsZS4gSSBkb24n
dCBldmVuIHNlZSBhY2tzCj4gPiBvbiBtb3N0IG9mIHRoZXNlLgo+Cj4gWWVzLiBJIGd1ZXNzIGZv
ciByZXZlcnRzIGl0J3Mgbm90IGNvb2wsIGJ1dCBhbHNvIG5vdCB0aGUgd29yc3QuIFN0aWxsCj4g
YmV0dGVyIHRvIGdldCBzb21lb25lIHRvIGFjaywgaGVjayBJIGNhbiBwdWxsIHRoYXQgb2ZmIGZv
ciBlbWVyZ2VuY3kKPiByZXZlcnRzIHdpdGggYSBmZXcgcGluZ3Mgb24gaXJjLCBhbmQgdGhlIDIg
cmV2ZXJ0cyBsYW5kZWQgbXVjaCBsYXRlci4KPiBCdXQgZm9yIG5vcm1hbCBwYXRjaGVzIGl0J3Mg
ZGVmaW5pdGVseSBub3Qgb2sgYXQgYWxsLiBBbHNvIG9ubHkKPiBwb3NzaWJsZSBpZiBwZW9wbGUg
YnlwYXNzIHRoZSB0b29saW5nLCBvciBvdmVycmlkZSB0aGUgdG9vbGluZyB3aXRoCj4gdGhlIC1m
IGZsYWcgdG8gZm9yY2UgYSBwdXNoLgo+Cj4gUm9iLCBFbWlsLCB3aGF0J3MgdXAgaGVyZT8KPgpJ
J3ZlIGdvdCB3YXMgYW4gIlRoYW5rcyIgWzFdIGZyb20gQmVuIG9uIHRoZSBub3V2ZWF1IHBhdGNo
IC0gc28gSSBtZXJnZWQgaXQuClRoZSBtc20gYW5kIHZnZW0gb25lcyBhcmUgbXkgYmFkIC0gbXVz
dCBoYXZlIG1pc3NlZCB0aG9zZSBvbmUKaW5iZXR3ZWVuIHRoZSBvdGhlciBwYXRjaGVzLgoKV2ls
bCBkb3VibGUtY2hlY2sgYW5kIGZvbGxvdy11cCBvbiBhbGwgb2YgdGhvc2UuCgotRW1pbApbMV0g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5
LzIxODgyMy5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
