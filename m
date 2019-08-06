Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F382F0B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7450289C98;
	Tue,  6 Aug 2019 09:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670508992E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 09:49:39 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o101so90943769ota.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 02:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8iepA3mdEGdJPuSIYYGht7F/IA2R0c7T2n2hJk47IEA=;
 b=G7LKRauIdp9KsyVTB3U08/LP0g3YWV2H1tWweVRMwYwjTYTpy0OfXk9eyRluEt3Zue
 HI5x40tFqP0Zh1ToGc8JHGU5Z9Z34ZRqKHM92S56JbQqYuemiLpAmh/hhUAAxJr3mU62
 L86AQCe6SLIlBegaFeLC2yw0aaPbct1pC7ULOp8SRz4YrLD4gdzRnhbf26N6JubMIeN/
 +FmG7EqN8LJiyHrcEochet0KZV3lAvo6c7F2HPz0iIvt6E4WvVttygy1maYU9sqHz/4I
 65+ED06Id06dLHepbKd04uHFjAtipbw5qDkGqShblD3Ayyp5Xb7cD+wsS/svygDQuNkY
 QAVw==
X-Gm-Message-State: APjAAAWlZho1wfAqxoX8JlMJW8MR8Bwy2W4WdSpTp3JAAVdCcFFHxPGw
 mQrz6WmChZIczEgn05uu0zffXXqKxXJV8y/b2ugjvg==
X-Google-Smtp-Source: APXvYqzV2bTrctNup66XSVTDvRww680IMEIeHeISDjZnQ/CMiVuTqEw8hTVwuaW5NwFjAqllh97Hw8PFlyRDakaTKk4=
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr2375764otr.303.1565084978615; 
 Tue, 06 Aug 2019 02:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
 <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
In-Reply-To: <CACvgo51Do4XDY9wRku-0v5B+mRRzV2+SgD=dvFT3J9TMf8RK9Q@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Aug 2019 11:49:26 +0200
Message-ID: <CAKMK7uEcoQK+y6y2wW6GJzKDjtPZZ5gads3JY6xL+JiP+2QABQ@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8iepA3mdEGdJPuSIYYGht7F/IA2R0c7T2n2hJk47IEA=;
 b=F7UU2BiO7FxsM+/LuiViv/ve5EHgW7paYe8trHdpQ3pGswoWGNArKpE3g6dFB2DFlg
 PBfebr838Quf2wmFy2glMz1VXY02zrFVs02Of9sTY+132EhGbn5FXL+orCJ+yuOa1sth
 oc+aGZZO4KcIf77lOCh88szZ2a0oEOml0MINU=
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

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMTo0MCBBTSBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxp
a292QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCA2IEF1ZyAyMDE5IGF0IDA4OjM0LCBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IEF1ZyA2LCAyMDE5IGF0IDI6MzQgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gU2F0LCAzIEF1ZyAyMDE5IGF0IDIwOjQ3LCBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhp
IERhbmllbCwgRGF2ZSwKPiA+ID4gPgo+ID4gPiA+IEhlcmUgaXMgdGhlIGZpcnN0IChhbmQgcHJl
dHR5IGxhdGUpIGRybS1taXNjLW5leHQgUFIuCj4gPiA+ID4KPiA+ID4gPiBJdCdzIHByZXR0eSBi
aWcgZHVlIHRvIHRoZSBsYXRlbmVzcywgYnV0IHRoZXJlJ3Mgbm90aGluZyByZWFsbHkgbWFqb3IK
PiA+ID4gPiBzaG93aW5nIHVwLiBJdCdzIHByZXR0eSBtdWNoIHRoZSB1c3VhbCBidW5jaCBvZiBy
ZXdvcmtzLCBmaXhlcywgYW5kCj4gPiA+ID4gbmV3IGhlbHBlcnMgYmVpbmcgaW50cm9kdWNlZC4K
PiA+ID4gPgo+ID4gPgo+ID4gPiBkaW06IDQxNWQyZTllMDc1NyAoIlJldmVydCAiZHJtL2dlbTog
UmVuYW1lIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkKPiA+ID4gdG8gZHJtX2dlbV9tYXBfb2Zm
c2V0KCkiIik6IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiBiZTg1NTM4MmJh
Y2IgKCJSZXZlcnQgImRybS9wYW5mcm9zdDogVXNlIGRybV9nZW1fbWFwX29mZnNldCgpIiIpOgo+
ID4gPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4gPiA+IGRpbTogZTRlZWU5M2QyNTc3ICgi
ZHJtL3ZnZW06IGRyb3AgRFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiA+IG1h
bmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+ID4gZGltOiA4ODIwOWQyYzUwMzUgKCJkcm0vbXNt
OiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIpOgo+ID4gPiBtYW5kYXRvcnkg
cmV2aWV3IG1pc3NpbmcuCj4gPiA+IGRpbTogY2NkYWU0MjU3NTY5ICgiZHJtL25vdXZlYXU6IHJl
bW92ZSBvcGVuLWNvZGVkIGRybV9pbnZhbGlkX29wKCkiKToKPiA+ID4gbWFuZGF0b3J5IHJldmll
dyBtaXNzaW5nLgo+ID4gPgo+ID4gPiBQcmV0dHkgc3VyZSByZXZpZXcgaW4gZHJtLW1pc2MtbmV4
dCBpcyBhIHJ1bGUuIEkgZG9uJ3QgZXZlbiBzZWUgYWNrcwo+ID4gPiBvbiBtb3N0IG9mIHRoZXNl
Lgo+ID4KPiA+IFllcy4gSSBndWVzcyBmb3IgcmV2ZXJ0cyBpdCdzIG5vdCBjb29sLCBidXQgYWxz
byBub3QgdGhlIHdvcnN0LiBTdGlsbAo+ID4gYmV0dGVyIHRvIGdldCBzb21lb25lIHRvIGFjaywg
aGVjayBJIGNhbiBwdWxsIHRoYXQgb2ZmIGZvciBlbWVyZ2VuY3kKPiA+IHJldmVydHMgd2l0aCBh
IGZldyBwaW5ncyBvbiBpcmMsIGFuZCB0aGUgMiByZXZlcnRzIGxhbmRlZCBtdWNoIGxhdGVyLgo+
ID4gQnV0IGZvciBub3JtYWwgcGF0Y2hlcyBpdCdzIGRlZmluaXRlbHkgbm90IG9rIGF0IGFsbC4g
QWxzbyBvbmx5Cj4gPiBwb3NzaWJsZSBpZiBwZW9wbGUgYnlwYXNzIHRoZSB0b29saW5nLCBvciBv
dmVycmlkZSB0aGUgdG9vbGluZyB3aXRoCj4gPiB0aGUgLWYgZmxhZyB0byBmb3JjZSBhIHB1c2gu
Cj4gPgo+ID4gUm9iLCBFbWlsLCB3aGF0J3MgdXAgaGVyZT8KPiA+Cj4gSSd2ZSBnb3Qgd2FzIGFu
ICJUaGFua3MiIFsxXSBmcm9tIEJlbiBvbiB0aGUgbm91dmVhdSBwYXRjaCAtIHNvIEkgbWVyZ2Vk
IGl0Lgo+IFRoZSBtc20gYW5kIHZnZW0gb25lcyBhcmUgbXkgYmFkIC0gbXVzdCBoYXZlIG1pc3Nl
ZCB0aG9zZSBvbmUKPiBpbmJldHdlZW4gdGhlIG90aGVyIHBhdGNoZXMuCgpUaGUgdGhpbmcgaXMs
IGRpbSBwdXNoIHNob3VsZG4ndCBhbGxvdyB5b3UgdG8gZG8gdGhhdC4gQW5kIHRoZSBwYXRjaGVz
CmhhdmUgY2xlYXJseSBiZWVuIGFwcGxpZWQgd2l0aCBkaW0gYXBwbHkgKG9yIGF0IGxlYXN0IHlv
dSBhZGRlZCB0aGUKTGluayksIHVubGlrZSBSb2Igd2hvIHNlZW1zIHRvIGp1c3QgaGF2ZSBwdXNo
ZWQgdGhlIHJldmVydC4KCklmIHlvdSB1c2VkIGdpdCBwdXNoIGRpcmVjdGx5LCB0aGVuIEkgZ3Vl
c3MgeW91IGp1c3Qgdm9sdW50ZWVyZWQgdG8KaW1wbGVtZW50IERhbmllbCBTdG9uZSdzIGlkZWEg
dG8gZW5mb3JjZSBkaW0gdG9vbGluZy4gQWRkaW5nIERhbmllbCwKc2luY2UgSSBndWVzcyB0aGF0
IHdhcyBqdXN0IGFuIGlyYyBjaGF0LgotRGFuaWVsCgo+IFdpbGwgZG91YmxlLWNoZWNrIGFuZCBm
b2xsb3ctdXAgb24gYWxsIG9mIHRob3NlLgo+Cj4gLUVtaWwKPiBbMV0gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktTWF5LzIxODgyMy5odG1sCgoK
LS0KRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
