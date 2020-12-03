Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E02CDFD9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 21:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB666EC18;
	Thu,  3 Dec 2020 20:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165C6E098
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 20:45:25 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id f11so3667378oij.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JO4RUAACbLv+6KDnn27+ghVYDGu5U0qipfoGAUDZYlo=;
 b=cMVBQOa6nDo9zE6vQtPTJIR9kabv5519ZOsYVzcOEIpBqOG6YBPDzsFDLkXVx9yZMt
 QQkQ4o2nNedVHIrkWfwvl1NfMLIbFkkKSHoXnNvp6YXhEH0mcCmL/plM2mAhAr7u3ZQn
 pkxp6OqhduH7xVeBOUmJEd/8ofheJbgUCi1W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JO4RUAACbLv+6KDnn27+ghVYDGu5U0qipfoGAUDZYlo=;
 b=fZFN6lCVs6yShrR+1kpLm1KfbeyQGKxxrqmd/ZBuaocFeTV0gDf9spXK4UmhQgpokM
 KPEDBBa3iuTz6NU69Ozujn9S1HXW6mRsz6ezfElJDloQJQECyhxLqHdo1zNfq1b7dJ3x
 67FU1E148LTwY5YEIouNwb4iM/xaYp8eYXjtyPsL+ugylq6DsmLAO+VKZK9Y1yLJg7K/
 3bh8V/hiUs4IYBEZlRORrM4YZTG37Iinf/N7l0bAYW76CF6sCMql4jW9oioe5VtLyevZ
 W2v5cNFgllCdsw+q6fKzTeYfQwafgnR2oyYuSKyO8FNa/Ce6UPUs3kWOJkeM52cTPGdL
 oVvA==
X-Gm-Message-State: AOAM530GMQ0euoYUD3KzXFnaSyCc0Gy2bFBzV/KQh7+BArcz54XPGdg/
 NAP7avRQ/29VAMVEs3EDgru9kcJVKdqx/pXWQgeMFQ==
X-Google-Smtp-Source: ABdhPJw/nA5kG7CB0iGnQMiGQcefNOCXhEhC3e7Kzy4R70CfK/ITAfy5pPVarz4Yq6+9lYtQc0EI9OPTo57dLGAWsic=
X-Received: by 2002:aca:47cf:: with SMTP id u198mr688196oia.14.1607028325214; 
 Thu, 03 Dec 2020 12:45:25 -0800 (PST)
MIME-Version: 1.0
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <c68d121c-ead2-dbe9-cb26-8b18ccb86011@daenzer.net>
 <CAKMK7uHZGAT6qUc1AbOHar0h=q0uJKOHuNL_HdiOgLx+iiy-kg@mail.gmail.com>
 <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
In-Reply-To: <CABjik9dFoGSaxOouXsMdNgeFK57-RP28dhrPi4EXX81OswgeSw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Dec 2020 21:45:14 +0100
Message-ID: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
To: James Park <james.park@lagfreegames.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 James Park <jpark37@lagfreegames.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMywgMjAyMCBhdCA3OjU1IFBNIEphbWVzIFBhcmsgPGphbWVzLnBhcmtAbGFn
ZnJlZWdhbWVzLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdHJhaWxpbmcgdW5kZXJzY29yZSBmb3IgIERS
TV9GT1VSQ0NfU1RBTkRBTE9ORV8gaXNuJ3QgaW50ZW50aW9uYWwsIHJpZ2h0PyBTaG91bGQgSSBw
dXQgYWxsIHRoZSBpbnRlZ2VyIHR5cGVzLCBvciBqdXN0IHRoZSBvbmVzIHRoYXQgYXJlIHVzZWQg
aW4gdGhhdCBmaWxlPwoKWWVhaCB0aGF0IHRyYWlsaW5nIF8ganVzdCBzbGlwcGVkIGluLiBBbmQg
SSdkIGp1c3QgZG8gdGhlIHR5cGVzCmFscmVhZHkgdXNlZC4gSSBkb24ndCB0aGluayBhbnl0aGlu
ZyBlbHNlIHRoYW4gX191MzIgKGZvciBkcm0gZm91cmNjKQphbmQgX191NjQgKGZvciBkcm0gbW9k
aWZpZXIpIGlzIG5lZWRlZC4KLURhbmllbAoKPgo+IFRoYW5rcywKPiBKYW1lcwo+Cj4gT24gVGh1
LCBEZWMgMywgMjAyMCBhdCA2OjUyIEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4g
d3JvdGU6Cj4+Cj4+IE9uIFRodSwgRGVjIDMsIDIwMjAgYXQgOToxOCBBTSBNaWNoZWwgRMOkbnpl
ciA8bWljaGVsQGRhZW56ZXIubmV0PiB3cm90ZToKPj4gPgo+PiA+IE9uIDIwMjAtMTItMDIgODo0
NyBwLm0uLCBKYW1lcyBQYXJrIHdyb3RlOgo+PiA+ID4KPj4gPiA+IElmIHdlJ3JlIHRyeWluZyB0
byBjdXQgdGllcyB3aXRoIHRoZSBkcm0tdWFwaSBmb2xkZXIgZW50aXJlbHksIHRoZSBzdHVmZgo+
PiA+ID4gYWNfc3VyZmFjZS5jIG5lZWQgaW5jbHVkZXMgdGhlIEFNRF9GTVRfTU9EIHN0dWZmIGlu
IGRybV9mb3VyY2MuaCwKPj4gPiA+IGFuZCBBTURHUFVfVElMSU5HXyogdW5kZXIgYW1kZ3B1X2Ry
bS5oLiBJcyB0aGVyZSBhIGJldHRlciBzcG90IGZvciB0aGVzZQo+PiA+ID4gZGVmaW5pdGlvbnM/
Cj4+ID4KPj4gPiBUaGUgTWVzYSBzcmMvYW1kLyBjb2RlIHNob3VsZCB1c2UgcGxhdGZvcm0tbmV1
dHJhbCBhYnN0cmFjdGlvbnMgZm9yCj4+ID4gdGhlc2UuIFRoaXMgd2Fzbid0IGRlZW1lZCBuZWNl
c3NhcnkgYmVmb3JlLCBiZWNhdXNlIG5vYm9keSB3YXMgdHJ5aW5nIHRvCj4+ID4gYnVpbGQgdGhl
c2UgZHJpdmVycyBmb3Igbm9uLVVOSVggT1Nlcy4gQnV0IG5vdyB5b3UgYXJlLgo+Pgo+PiBJIHRo
aW5rIHRoYXQncyBhIGJpdCBtdWNoIGJ1c3kgd29yayBmb3Igbm90IG11Y2ggZ2Fpbi4gZHJtX2Zv
dXJjYy5oIGlzCj4+IGV2ZW4gaW5jbHVkZWQgYXMgdGhlIG9mZmljaWFsIHNvdXJjZSBvZiB0cnV0
aCBvZiBzb21lIGtociBleHRlbnNpb25zLAo+PiBtYWtpbmcgdGhhdCBoZWFkZXIgc3RhbmQtYWxv
bmUgYW5kIHVzZWFibGUgY3Jvc3MtcGxhdGZvcm0gc291bmRzIGxpa2UKPj4gYSBnb29kIGlkZWEg
dG8gbWUuIFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyBpcyBpbW8gcGVyZmVjdGx5IGZpbmU6Cj4+
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+IGluZGV4IGNhNDhlZDBlNmJjMS4uMGExMjFiM2VmYjU4
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiArKysgYi9p
bmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiBAQCAtMjQsNyArMjQsMTEgQEAKPj4gI2lm
bmRlZiBEUk1fRk9VUkNDX0gKPj4gI2RlZmluZSBEUk1fRk9VUkNDX0gKPj4KPj4gKyNpZm5kZWYg
RFJNX0ZPVVJDQ19TVEFOREFMT05FXwo+PiArLyogaW5jbHVkZSB0aGUgbGludXggdWFwaSB0eXBl
cyBoZXJlICovCj4+ICsjZWxzZQo+PiAjaW5jbHVkZSAiZHJtLmgiCj4+ICsjZW5kaWYKPj4KPj4g
I2lmIGRlZmluZWQoX19jcGx1c3BsdXMpCj4+IGV4dGVybiAiQyIgewo+Pgo+Pgo+PiBDaGVlcnMs
IERhbmllbAo+Pgo+PiA+Cj4+ID4KPj4gPiAtLQo+PiA+IEVhcnRobGluZyBNaWNoZWwgRMOkbnpl
ciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KPj4gPiBM
aWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBh
bmQgWCBkZXZlbG9wZXIKPj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPj4KPj4KPj4KPj4gLS0KPj4gRGFuaWVsIFZldHRlcgo+
PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4gaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
