Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0962B5D1E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 11:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF2F6E198;
	Tue, 17 Nov 2020 10:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80A6E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 10:43:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so2769405wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=osy6pxkQVPDItsXbD8uQObD8sxPqWcKJrKxDFuP2CRo=;
 b=VctitzbicJkaHcJN6Or9BIV+nqX+/ENaocC6P5PhNt3RYi3dOw61X5Zz0e0EYNPE8r
 ixlIbKm0Go1VVuhle/glLsfFcUcKThHlTZ77X8fgLA1KqFrhAlopKo/xZdtghZbex8vM
 An+gfGg+RqAICDtuPV/NLrb36j1eZMOmpU6Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=osy6pxkQVPDItsXbD8uQObD8sxPqWcKJrKxDFuP2CRo=;
 b=jsVReqJeOemHFC8oW8AYw0/FY6U5yLE1zPuiZv8i1FyKKlbnzrfC8aE2kehrDzehc8
 icsZuN1f2jjL4+g/r7oNpZAqeCWk+mXgW1Z9X7wQRzflXqFFl9haaeXHZnRjamK0ccCV
 mjugXnf9yKNWQ4Pvu3p6o23KdY1TxA8Dgqp5X4bFj5jhT0ebt5TQNwxc0PT+Y+/zMWAo
 tPQ84/b39Ds6bH3942c27Jhclse4Ys5/9OU5zkHbRgRh8mLxNMUG1d2YvU7/eoIcE3Jy
 r90WUn2drJshmWNT8kfv+bkd5t8+QF0gK2imXMKrl2NZcgthrPbETjjohEO4CzW8XSum
 jCdA==
X-Gm-Message-State: AOAM5337nb5jRpX57PL/Sxr1TOn0cuM5f52XZxdfFxuNrC/TYsx1YI5x
 FDfYlp/bFeZ2QqeKacoXMTOrcQ==
X-Google-Smtp-Source: ABdhPJzEWHBluUkDhcVjqLuQrUUOs/GMyNmg/eBb8+6AUyBHVarVGItlkHrjVTcgOwf1/M/uumpZcA==
X-Received: by 2002:a1c:6043:: with SMTP id u64mr3521455wmb.166.1605609793857; 
 Tue, 17 Nov 2020 02:43:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w17sm2784038wru.82.2020.11.17.02.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 02:43:12 -0800 (PST)
Date: Tue, 17 Nov 2020 11:43:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/30] include: drm: drm_atomic: Artificially use 'crtc'
 to avoid 'not used' warning
Message-ID: <20201117104311.GK401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-3-lee.jones@linaro.org>
 <20201112202516.GA3340631@ravnborg.org>
 <20201113204959.GW401619@phenom.ffwll.local>
 <CAF2Aj3j6+fEFS66qg-a-0Z1XtNQ7EAEnu4ECZ9gLiH7buH=PLw@mail.gmail.com>
 <CAKMK7uEQwFLj+D4LfdQNfb+cQZCH34HZU7oJh8r=mjozuKmZGQ@mail.gmail.com>
 <CAF2Aj3jRFM95R7VaV_4Chi3Tr3ja31EjdVTeHeDkUWETweqCGA@mail.gmail.com>
 <20201117100509.GJ401619@phenom.ffwll.local>
 <20201117103404.GF1869941@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117103404.GF1869941@dell>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMTA6MzQ6MDRBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IERhbmllbCwKPiAKPiBGb3Igc29tZSByZWFzb24sIHlvdSdyZSBub3QgYXBwZWFyaW5nIGlu
IHRoZSByZWNpcGVudHMgbGlzdCB3aGVuIEkKPiByZXBseSB0byBhbGwuICBZb3UncmUgbm90IGlu
IHRoZSBNYWlsLUZvbGxvd3VwLVRvIGhlYWRlci4gIEFueSBpZGVhCj4gd2h5IHRoaXMgbWlnaHQg
YmU/CgpObyBpZGVhIGVpdGhlciwgY291bGQgYmUgbXkgbXV0dCBub3Qgc2V0dGluZyB0aGUgcmVw
bHkgaGVhZGVycyBsaWtlIGl0CnNob3VsZC4gSSdtIGdlbmVyYWxseSBjb25mdXNlZCB3aXRoIGhv
dyBlbWFpbCB3b3JrcyAuLi4KPiAKPiBBbnl3YXksIHBsZWFzZSBzZWUgYmVsb3c6Cj4gCj4gT24g
VHVlLCAxNyBOb3YgMjAyMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDEz
LCAyMDIwIGF0IDEwOjAxOjU3UE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+ID4gT24gRnJp
LCAxMyBOb3YgMjAyMCwgMjE6MzEgRGFuaWVsIFZldHRlciwgPGRhbmllbEBmZndsbC5jaD4gd3Jv
dGU6Cj4gPiA+IAo+ID4gPiA+IE9uIEZyaSwgTm92IDEzLCAyMDIwIGF0IDk6NTMgUE0gTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmksIDEzIE5vdiAyMDIwLCAyMDo1MCBEYW5pZWwgVmV0dGVy
LCA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IE9uIFRodSwg
Tm92IDEyLCAyMDIwIGF0IDA5OjI1OjE2UE0gKzAxMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+
ID4gPiA+PiA+IEhpIExlZSwKPiA+ID4gPiA+PiA+Cj4gPiA+ID4gPj4gPiBPbiBUaHUsIE5vdiAx
MiwgMjAyMCBhdCAwNzowMDoxMVBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPj4g
PiA+IFRoZSBwcmVjZWRlbnQgaGFzIGFscmVhZHkgYmVlbiBzZXQgYnkgb3RoZXIgbWFjcm9zIGlu
IHRoZSBzYW1lIGZpbGUuCj4gPiA+ID4gPj4gPiA+Cj4gPiA+ID4gPj4gPiA+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4gPiA+ID4+ID4gPgo+ID4g
PiA+ID4+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYzo1NToxOTogd2Fybmlu
ZzogdmFyaWFibGUg4oCYY3J0Y+KAmQo+ID4gPiA+IHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCj4gPiA+ID4gPj4gPiA+ICA1NSB8IHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YzsKPiA+ID4gPiA+PiA+ID4gIHwgXn5+fgo+ID4gPiA+ID4+ID4gPgo+ID4gPiA+ID4+ID4g
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPiA+ID4gPiA+PiA+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiA+ID4gPiA+PiA+ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pgo+ID4gPiA+ID4+ID4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4g
PiA+ID4+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiA+ID4+
ID4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgo+ID4gPiA+ID4+ID4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+ID4+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiA+ID4+ID4KPiA+
ID4gPiA+PiA+IEFsc28gYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lgo+ID4gPiA+ID4+ID4gVGhp
cyB3YXMgdGhlIGxhc3QgcGF0Y2ggZnJvbSB0aGlzIGJhdGNoIEkgd2lsbCBwcm9jZXNzLgo+ID4g
PiA+ID4+ID4gVGhlIG90aGVycyBhcmUgbGVmdCBmb3IgdGhlIG1haW50YWluZXJzIHRvIHBpY2sg
dXAuCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBidHcgZm9yIHBhdGNoZXMgdGhhdCBtYWludGFpbmVy
cyBkb24ndCBwaWNrIHVwLCB0aGUgdXN1YWwgcHJvY2VzcyBpcwo+ID4gPiA+IHRoYXQKPiA+ID4g
PiA+PiB3ZSBnaXZlIHRoZW0gMiB3ZWVrcywgdGhlbiBqdXN0IG1hc3MgYXBwbHkuIE5vdyB5b3Un
cmUgcHJvZHVjaW5nIGEgbG90Cj4gPiA+ID4gb2YKPiA+ID4gPiA+PiBwYXRjaGVzLCB0b28gbXVj
aCBmb3IgbWUgdG8ga2VlcCB0cmFjaywgc28gcGxlYXNlIGp1c3QgcGluZyBtZSB3aXRoIGEKPiA+
ID4gPiA+PiByZXNlbmQgZm9yIHRob3NlIHRoYXQgZXhwaXJlZCBhbmQgSSdsbCBnbyB0aHJvdWdo
IGFuZCBwaWNrIHRoZW0gYWxsIHVwLgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGF0
J3MgZ3JlYXQgRGFuaWVsLiBUaGFua3MgZm9yIHlvdXIgc3VwcG9ydC4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJIGNhbiBkbyBvbmUgYmV0dGVyIHRoYW4gdGhhdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBX
b3VsZCBhIHB1bGwtcmVxdWVzdCBzdWl0IHlvdT8KPiA+ID4gPgo+ID4gPiA+IFdlIGhhdmUgYSBm
ZXcgdHJlZXMgZ29pbmcgb24sIGFuZCB5b3VyIHBhdGNoZXMgYXJlIGxhbmRpbmcgdGhyb3VnaCBh
bGwKPiA+ID4gPiBraW5kcyBvZiB0aGVtLiBTbyB0aGlzIG1pZ2h0IGJlIG1vcmUgY29vcmRpbmF0
aW9uIHBhaW4uIElmIHlvdSBjYW4KPiA+ID4gPiBleGNsdWRlIHBhdGNoZXMgZm9yIHRoZSBzZXBh
cmF0ZWx5IGFuZCB1c3VhbGx5IGZhaXJseSB3ZWxsIG1haW50YWluZWQKPiA+ID4gPiBkcml2ZXJz
IG91dCBvZiB0aGUgcHVsbCBpdCBzaG91bGQgd29yayAoZHJtL2FtZCwgZHJtL3JhZGVvbiwgZHJt
L2k5MTUsCj4gPiA+ID4gZHJtL25vdXZlYXUsIGRybS9tc20gYW5kIGRybS9vbWFwZHJtIHByb2Jh
Ymx5IHRoZSB1c3VhbCBvbmVzKS4KPiA+ID4gPgo+ID4gPiA+IE9yIHlvdSBqdXN0IHNlbmQgdGhl
IG5leHQgcGlsZSBhbmQgd2UnbGwgc2VlLgo+ID4gPiA+Cj4gPiA+ID4gQWxzbyBJIGd1ZXNzIEkg
Y2FuJ3QgcmVhbGx5IGludGVyZXN0IHlvdSBpbiBjb21taXQgcmlnaHRzIHNvIHRoaXMKPiA+ID4g
PiBwYXRjaCBib21icyBnZXQgb2ZmIG15IGJhY2sgYWdhaW4/IDotKQo+ID4gPiA+Cj4gPiA+IAo+
ID4gPiBXaGF0IGRvZXMgdGhhdCBtZWFuPyBNZXJnZSBteSBvd24gcGF0Y2hlcz8KPiA+ID4gCj4g
PiA+IE5vdCBzdXJlIGhvdyB0aGF0IHdvcmtzIHdpdGggeW91ciBncm91cCBtYWludGVuYW5jZSBz
ZXR1cC4KPiA+ID4gCj4gPiA+IElzIGl0IGp1c3QgYSBgZ2l0IHB1c2hgPwo+ID4gCj4gPiBJdCdz
IGEgYnVuY2ggb2Ygc2NyaXB0aW5nIGFuZCBzZXR1cCwgbWlnaHQgbm90IGJlIHdvcnRoIGl0IGZv
ciBqdXN0IG9uZQo+ID4gb2YuIFBsdXMgd2Ugc3RpbGwgdGFrZSBwdWxsIHJlcXVlc3RzIGZyb20g
c3VibWFpbnRhaW5lcnMgc28gaXQncyBhbGwganVzdAo+ID4gaWYgeW91IGZlZWwgbGlrZSBpdC4g
U29tZSBkb2NzIGlmIHlvdSdyZSBjdXJpb3VzOgo+ID4gCj4gPiBodHRwczovL2RybS5wYWdlcy5m
cmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9nZXR0aW5nLXN0YXJ0ZWQuaHRtbAo+IAo+
IEFzICpmdW4qIGFzIHRoYXQgbG9va3MsIEkgdGhpbmsgSSdsbCBnaXZlIGl0IGEgbWlzcywgdGhh
bmtzLiA6KQo+IAo+IFNvIGZvciB0aGUgZmluYWwgbWVyZ2Ugb2YgdGhlIG5vbi1SYWRlb24gc2V0
IFswXSB0byBkYXRlIChBbGV4IGp1c3QKPiBwdWxsZWQgaW4gYWxsIG9mIHRoZSBvdXRzdGFuZGlu
ZyBSYWRlb24gcGF0Y2hlcyksIHdlIGhhdmUgYSBmZXcKPiBvcHRpb25zOgo+IAo+ICAxLiBUYWtl
IHRoZW0gZGlyZWN0bHkgZnJvbSB0aGUgbW9zdCByZWNlbnQgc2V0IFswXQo+ICAyLiBJIGNhbiBy
ZWJhc2UgYW5kIHJlc3VibWl0IGFnYWluIGluIGEgZmV3IGRheXMKPiAgMy4gSSBjYW4gc3VibWl0
IGEgUFIKPiAKPiBXaGF0ZXZlciB3b3JrcyBmb3IgeW91Lgo+IAo+IFswXSAiW1BBVENIIHYyIDAw
LzQyXSBSaWQgVz0xIHdhcm5pbmdzIGZyb20gR1BVIChub24tUmFkZW9uKSIKCkkgcGxhbm5lZCB0
byBnbyB0aHJvdWdoIHRoYXQgdG9kYXkgYW5kIGFwcGx5IGl0IGFsbC4gV2FudGVkIHRvIHBpbmcg
YSBmZXcKbWFpbnRhaW5lcnMgZmlyc3Qgd2hldGhlciB0aGV5IHBpY2sgYW55dGhpbmcgdXAsIGJ1
dCBhc2lkZSBmcm9tIEFsZXgKdGhleSdyZSBub24tY29tbWl0dGFsIHNvIEkgdGhpbmsgSSBqdXN0
IHZhY3V1bSB0aGVtIGFsbCB1cCBzbyBpdCdzIGRvbmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xs
LmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
