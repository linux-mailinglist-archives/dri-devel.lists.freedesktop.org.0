Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD34B4CEF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 13:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04376EBD6;
	Tue, 17 Sep 2019 11:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FAB6EBD7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 11:32:18 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g19so2668006otg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 04:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=srfvIZE2C6vknX7C8LNOTxWs3SgOe3bCYJbTdVyQaVw=;
 b=nYgmhmwI+sly7Faq2BbH3P2uyl22jxz0AA4hsZQbjhm3csTZpu8BOEcEIRiYzmTseF
 re9tW/Ajt6eLZLyyzHhMFt+y9zPUfCSHev9vQ3woetwJnYUO+qVCV9+7ZH6S2d48NYDf
 MLbSuLQxeV945JDKHHvFjdPfTZnaLPSEfhIHNeiXeas8FnU4WVEavNmOD0LgJZJbBMBr
 qSvtCrghG7RDRThOLqQ3s4d+qmlAVp1Lkw1UPM5zEwg8zOFi4CfQPeEJ+vIlZwEAAzAy
 oMwwaTNxbaCKcO3ZsEchwoSZfevzrGs8WMMWK1j8rl7tsJjFOiK+tYgoTkSaHP+nlZkT
 jAkw==
X-Gm-Message-State: APjAAAXyl/iSC8x7KcO31jtpwKhsuOxfk6c1CJsifk9iNRC7xdmZ5h0w
 z4loq+/YtA9FwhYLCjuN5tbGg/UObmOhmO5Na8T94Q==
X-Google-Smtp-Source: APXvYqw0wB4kmmLmnQJy5Gp1VssyuW4W4xZvqitBQ6YjbvhYZuLgSlM/HbQs5T4CztHl9797g+GmZ7d05v5WIR1Bl7g=
X-Received: by 2002:a05:6830:1185:: with SMTP id
 u5mr2177910otq.106.1568719937772; 
 Tue, 17 Sep 2019 04:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
 <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
 <7535dcf4-413f-f06f-b3d1-dcffc86b43e0@daenzer.net>
 <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
In-Reply-To: <5d0a8619-7073-fac2-cdd6-83b55221140b@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 Sep 2019 13:32:05 +0200
Message-ID: <CAKMK7uG54Fa__KR3ytM0h5FTesp=t-eo5Z+E9d5YnFJyjLGaPA@mail.gmail.com>
Subject: Re: [PATCH] drm: add drm device name
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=srfvIZE2C6vknX7C8LNOTxWs3SgOe3bCYJbTdVyQaVw=;
 b=OJvooQVsgeuZrTL8XyaKSzitUzxm86yX9gx5csfBi2I9BDmJivafM4/qv1g6iH8DER
 iHDrt0M/pW6ZSTRV4E5dbEBRCLBXgQ3afR2FgBx1JAyIdERdhMaKfN8iQLL1B0Jy2KVK
 WzYo2phu6IMhUDWDAPSKvLudkD46mvVqOwOIM=
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6MjcgQU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA5LTE3IDExOjIzIGEubS4sIE1pY2hlbCBE
w6RuemVyIHdyb3RlOgo+ID4gT24gMjAxOS0wOS0xNyAxMDoyMyBhLm0uLCBLb2VuaWcsIENocmlz
dGlhbiB3cm90ZToKPiA+PiBBbSAxNy4wOS4xOSB1bSAxMDoxNyBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4gPj4+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDEwOjEyIEFNIENocmlzdGlhbiBLw7Zu
aWcKPiA+Pj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+
IEFtIDE3LjA5LjE5IHVtIDA3OjQ3IHNjaHJpZWIgSmFuaSBOaWt1bGE6Cj4gPj4+Pj4gT24gTW9u
LCAxNiBTZXAgMjAxOSwgTWFyZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pj4+Pj4+IFRoZSBwdXJwb3NlIGlzIHRvIGdldCByaWQgb2YgYWxsIFBDSSBJRCB0YWJsZXMgZm9y
IGFsbCBkcml2ZXJzIGluCj4gPj4+Pj4+IHVzZXJzcGFjZS4gKG9yIGF0IGxlYXN0IHN0b3AgdXBk
YXRpbmcgdGhlbSkKPiA+Pj4+Pj4KPiA+Pj4+Pj4gTWVzYSBjb21tb24gY29kZSBhbmQgbW9kZXNl
dHRpbmcgd2lsbCB1c2UgdGhpcy4KPiA+Pj4+PiBJJ2QgdGhpbmsgdGhpcyB3b3VsZCB3YXJyYW50
IGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB3aGF0IHlvdSB3YW50Cj4gPj4+Pj4gdG8gYWNo
aWV2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gPj4+PiBBbmQgbWF5YmUgZXhwbGljaXRseSBj
YWxsIGl0IHVhcGlfbmFtZSBvciBldmVuIHVhcGlfZHJpdmVyX25hbWUuCj4gPj4+IElmIGl0J3Mg
dWFwaV9uYW1lLCB0aGVuIHdoeSBkbyB3ZSBuZWVkIGEgbmV3IG9uZSBmb3IgZXZlcnkgZ2VuZXJh
dGlvbj8KPiA+Pj4gVXNlcnNwYWNlIGRyaXZlcnMgdGVuZCB0byBzcGFuIGEgbG90IG1vcmUgdGhh
biBqdXN0IDEgZ2VuZXJhdGlvbi4gQW5kCj4gPj4+IGlmIHlvdSB3YW50IHRvIGhhdmUgcGVyLWdl
bmVyYXRpb24gZGF0YSBmcm9tIHRoZSBrZXJuZWwgdG8gdXNlcnNwYWNlLAo+ID4+PiB0aGVuIGlt
byB0aGF0J3MgbXVjaCBiZXR0ZXIgc3VpdGVkIGluIHNvbWUgYW1kZ3B1IGlvY3RsLCBpbnN0ZWFk
IG9mCj4gPj4+IHRyeWluZyB0byBlbmNvZGUgdGhhdCBpbnRvIHRoZSBkcml2ZXIgbmFtZS4KPiA+
Pgo+ID4+IFdlbGwgd2UgYWxyZWFkeSBoYXZlIGFuIElPQ1RMIGZvciB0aGF0LCBidXQgSSB0aG91
Z2h0IHRoZSBpbnRlbnRpb24gaGVyZQo+ID4+IHdhcyB0byBnZXQgcmlkIG9mIHRoZSBQQ0ktSUQg
dGFibGVzIGluIHVzZXJzcGFjZSB0byBmaWd1cmUgb3V0IHdoaWNoCj4gPj4gZHJpdmVyIHRvIGxv
YWQuCj4gPgo+ID4gVGhhdCdzIGp1c3QgdW5yZWFsaXN0aWMgaW4gZ2VuZXJhbCwgSSdtIGFmcmFp
ZC4gU2VlIGUuZy4gdGhlIG9uZ29pbmcKPiA+IHRyYW5zaXRpb24gZnJvbSBpOTY1IHRvIGlyaXMg
Zm9yIHJlY2VudCBJbnRlbCBoYXJkd2FyZS4gSG93IGlzIHRoZQo+ID4ga2VybmVsIHN1cHBvc2Vk
IHRvIGtub3cgd2hpY2ggZHJpdmVyIGlzIHRvIGJlIHVzZWQ/Cj4gPgo+ID4KPiA+IEZvciB0aGUg
WG9yZyBtb2Rlc2V0dGluZyBkcml2ZXIsIHRoZXJlJ3MgYSBzaW1wbGUgc29sdXRpb24sIHNlZQo+
ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9tZXJnZV9yZXF1
ZXN0cy8yNzggLgo+ID4gU29tZXRoaW5nIHNpbWlsYXIgY2FuIHByb2JhYmx5IGJlIGRvbmUgaW4g
TWVzYSBhcyB3ZWxsLgo+Cj4gQW5vdGhlciBwb3NzaWJpbGl0eSBtaWdodCBiZSBmb3IgWG9yZyB0
byB1c2UKPiBodHRwczovL3d3dy5raHJvbm9zLm9yZy9yZWdpc3RyeS9FR0wvZXh0ZW5zaW9ucy9N
RVNBL0VHTF9NRVNBX3F1ZXJ5X2RyaXZlci50eHQKPiB0byBkZXRlcm1pbmUgdGhlIGRyaXZlciBu
YW1lLiBUaGVuIG9ubHkgTWVzYSBtaWdodCBuZWVkIGFueSBIVyBzcGVjaWZpYwo+IGNvZGUuCgpI
b3cgYXJlIG90aGVyIGNvbXBvc2l0b3JzIHNvbHZpbmcgdGhpcz8gSSBkb24ndCBleHBlY3QgdGhl
eSBoYXZlIGEKcGNpaWQgdGFibGUgbGlrZSBtb2Rlc2V0dGluZyBjb3BpZWQgdG8gYWxsIG9mIHRo
ZW0gLi4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
