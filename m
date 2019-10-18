Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85CDCFCA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 22:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824656E09A;
	Fri, 18 Oct 2019 20:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ACC6E145
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 20:11:42 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id 4so2191322ybq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 13:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=of94xAh46G4tHpFykOfl5V1ZK7lE9OKv5y7rcTslIKM=;
 b=nDISQuF/773WPyDnMlDbWeJmgDNvhtCmapOBuK+nU+fliStsXsnbxRxG8Z7jB4B+mn
 gSbHxsd0Ojq1aRAbxx5CTPoBfY2lYzQnZhqwOMifbDBMjvqPZ+SVUWRhT9MjbGiAglD1
 iraRJwiUZBBLeA4IFUv85zwoJYTimJhCB3USV3kCKf47lHBY5CuEe0FdN7rVQMdCOK6J
 5fOKbvM5xS1JS+3zpQdKF3siYZG+P913tfr6QfWNWtA7pWyUKXG6bWClyYbS+7kiA9F6
 luP7jgxi9ioRRgOqt4+Cxpub1KWRUZmgWtBqIxyX1TbwhBiZTVirjMb72O59FQS1eVn5
 7jug==
X-Gm-Message-State: APjAAAU5dUiS3vw7ebMRjYSPh7hIY4vBJSjaOamDljpzRPmJL6o76Aue
 gNHIQmDmC6EHkUZvDhowXajkLUF8EcDOfJoaf6HFvA==
X-Google-Smtp-Source: APXvYqyuvw4KkTyguscwqk48Hmfq2vEbhv/xe8yiWGhcGYXg57ouH6ecqtfEUsF/0fZhpaqYBLczx6+L1vgOjc4IsYs=
X-Received: by 2002:a25:3508:: with SMTP id c8mr6379070yba.256.1571429500917; 
 Fri, 18 Oct 2019 13:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191017192601.GA215957@art_vandelay>
 <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
In-Reply-To: <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 18 Oct 2019 16:11:05 -0400
Message-ID: <CAMavQKKBUk+tXYE3Z4Q7mh+tRqQEZ+vsJaLYEhT95=e3i31AdQ@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=of94xAh46G4tHpFykOfl5V1ZK7lE9OKv5y7rcTslIKM=;
 b=RLnracYgVeJA5Muh53y2/LY1QO+RrZvktvAimeMEniXn0u+9v3PqmM4P9n2V/XQuG5
 urVUV0n/t1MDDFyEuocwXod65wsFJUM+LihCmuBJsk+12PCJc7KUUBsnhNYaJJVChwHS
 Lrs9TSXO1oCf2DdRYH27MpeMGtU94OHlGtKc/R5ky2w/0wHgYzhj2EZiamiYWUgu90uP
 vFbGYk03IZf2DZQgDeDVQI+d9oq/7fg5nGGctHtRf2khMu6CMflbtKH7wy+7DhfZQ/4i
 0oqJnkYcw74/ro6wV3/NjW/OHgG9VHrvlJMNdV2Sd+SmAH0TyOij9wSWFKPnIHrdzPV7
 uJ1A==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, "DRM maintainer tools announcements,
 discussion, and development" <dim-tools@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Steven Price <steven.price@arm.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Lowry Li <Lowry.Li@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Wen He <wen.he_1@nxp.com>,
 Oleg Vasilev <omrigann@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgOTo0NiBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IEhpIFNlYW4sCj4KPiBPbiAxNy8xMC8yMDE5IDIyOjI2
LCBTZWFuIFBhdWwgd3JvdGU6Cj4KPiA+IGNvbmNlcm4gZm9yIHRob3NlLiBUaGUgb21hcCBPTUFQ
X0JPX01FTV8qIGNoYW5nZXMgdGhvdWdoIEkgZG9uJ3QgdGhpbmsgaGF2ZQo+ID4gcmVhbGx5IHJl
YWNoZWQgbm9uLVRJIGV5ZXMuIFRoZXJlJ3Mgbm8gbGluayBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
dG8gYSBVQVBJCj4gPiBpbXBsZW1lbnRhdGlvbiBhbmQgdGhlIG9ubHkgcmVmZXJlbmNlIEkgY291
bGQgZmluZCBpcyBsaWJrbXN4eCB3aGljaCBjYW4gc2V0Cj4gPiB0aGVtIHRocm91Z2ggdGhlIHB5
dGhvbiBiaW5kaW5ncy4gU2luY2UgdGhpcyBpcyBUSS1zcGVjaWZpYyBndW5rIGluIFRJLXNwZWNp
ZmljCj4gPiBoZWFkZXJzIEknbSBpbmNsaW5lZCB0byBsZXQgaXQgcGFzcywgYnV0IEkgd291bGQg
aGF2ZSBsaWtlZCB0byBoYXZlIHRoaXMKPiA+IGNvbnZlcnNhdGlvbiB1cGZyb250LiBJIGZpZ3Vy
ZWQgSSdkIGNhbGwgdGhpcyBvdXQgc28geW91IGhhdmUgZmluYWwgc2F5Lgo+Cj4gVGhlcmUgd2Fz
IHNvbWUgZGlzY3Vzc2lvbiBhYm91dCB0aGF0IGEgZmV3IHllYXJzIGJhY2sgd2hlbiBJIGluaXRp
YWxseQo+IHNlbnQgdGhlIHBhdGNoZXMsIGJ1dCBub3cgdGhhdCBJIGxvb2ssIHRoZSBkaXNjdXNz
aW9uIGRpZWQgYmVmb3JlIHJlYWxseQo+IGV2ZW4gc3RhcnRpbmcuCj4KPiBUaGlzIGlzIHdoYXQg
SSBzYWlkIGFib3V0IHVzZXJzcGFjZSBpbXBsZW1lbnRhdGlvbjoKPgo+ID4gWWVzLCB1bmZvcnR1
bmF0ZWx5IHRoYXQgaXMgbm90IGdvaW5nIHRvIGhhcHBlbi4gSSBkb24ndCBzZWUgaG93IHRoaXMK
PiA+IGNvdWxkIGJlIHVzZWQgaW4gYSBnZW5lcmljIHN5c3RlbSBsaWtlIFdlc3RvbiBvciBYLiBJ
dCdzIG1lYW50IGZvciB2ZXJ5Cj4gPiBzcGVjaWZpYyB1c2UgY2FzZXMsIHdoZXJlIHlvdSBrbm93
IGV4YWN0bHkgdGhlIHJlcXVpcmVtZW50cyBvZiB5b3VyCj4gPiBhcHBsaWNhdGlvbiBhbmQgdGhl
IGNhcGFiaWxpdGllcyBvZiB0aGUgd2hvbGUgc3lzdGVtLCBhbmQgb3B0aW1pemUgYmFzZWQKPiA+
IG9uIHRoYXQuCgpUaGFua3MgZm9yIHRoZSBjb250ZXh0LCBUb21pLgoKSW5kZWVkIGl0IGxvb2tz
IGxpa2UgdGhlIGRpc2N1c3Npb24gZGllZCwgYnV0IExhdXJlbnQgc3RpbGwgYnJvdWdodCB1cAp0
aGUgdS9zIHJlcXVpcmVtZW50IGFuZCB0aGUgcGF0Y2ggd2FzIGVmZmVjdGl2ZWx5IGRlYWQgdW50
aWwgRGFuaWVsIG9yCkRhdmUgd2VpZ2hlZCBpbi4gSSdkIGV4cGVjdCBhdCBsZWFzdCBzb21lIG91
dHJlYWNoIGJlZm9yZSBwdXNoaW5nIHRoZQpwYXRjaCBkaXJlY3RseSAyKyB5ZWFycyBsYXRlci4g
SGFzIGFueXRoaW5nIGNoYW5nZWQgc2luY2UgdGhlbj8KCgo+IEkga25vdyB0aGlzIGZlYXR1cmUg
aXMgdXNlZCBieSBjdXN0b21lcnMsIGJ1dCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvCj4gdGhlaXIg
YXBwbGljYXRpb25zLgoKVW5mb3J0dW5hdGVseSwgYW5kIGFzIHlvdSBrbm93LCB0aGF0IGlzIGlu
c3VmZmljaWVudC9pcnJlbGV2YW50IGZvcgppbnRyb2R1Y2luZyBuZXcgVUFQSS4gU28gdGhlIHF1
ZXN0aW9uIGlzIGlmIHRoZSBsaWJrbXN4eCBiaW5kaW5ncwpjb25zdGl0dXRlIG9wZW5zb3VyY2Ug
dXNlcnNwYWNlLCBpdCdzIHJlYWxseSB0aGluIElNTy4KClNlYW4KCgo+Cj4gICBUb21pCj4KPiAt
LQo+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgw
IEhlbHNpbmtpLgo+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
