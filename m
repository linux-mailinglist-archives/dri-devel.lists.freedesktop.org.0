Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F771E611F
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BF86E513;
	Thu, 28 May 2020 12:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0136E513
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:41:15 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id k3so2637343vsg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u1MJ3BAJSqo5TPA+ajs5HcPNPErOcboD5ojFdYMufhI=;
 b=A7w3bkrieZ06HqPuXLMBqVK+TZXAReAHetKzaIwUEcH7HoZacoBBSgp1MRr9X6NKsM
 fNVTysALuDc24DewTyIZbgEFqT1tqwDsvorcKY7TMv+3h0V5D7xo5BWOwbUvDyxotGlb
 k8VCf9A0Zwu5NYMtv50lBTUljcgGeSyQ5S5lj/oWcB9kweWYwlELh8BGU/7DepCGDzJl
 8xVMPeWtJu4ILgEfrM6SB5qBkuyeXSgIQVEkqLt2s4WlQRks3VAmFdrRf9LWHqFZDmkv
 z9osgkxPcz+jgmZDIRicC95mwFWPJ+rplCEmOUkulVsPdz+k73F0iinyq0O2m70UF+4H
 cRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u1MJ3BAJSqo5TPA+ajs5HcPNPErOcboD5ojFdYMufhI=;
 b=t/6Ih7h4DbMJfv6oIb13aOdGZuxEZTJsF+C6kckRXR5nSWIGlbsmzFoEjeqsMzwRls
 xJf28lWnaQyzA0xP+auV25LaA+w6L8Y94qredR7wj0ZpNuzgEk4PEftF6DXOkG0zsQra
 ePk6CueXFcCtIjWud3N1UX9Un6Y0ebHkTdDThIShk2W8/FMFRTKOG2/4cf2qmMcjlErk
 t31u1u+LBZu/F77jrKH7m8tul8Ndpx3afWuFMojqBlerDgBP3IwLfKqP9gcn6AukdOW9
 JnO3yXpITaNfKjNJX0SVUlXpn2pQrsQ7Dy4LrBKvdBgDNeDCno7eYLfEY/MsCsLwMG6C
 6PKw==
X-Gm-Message-State: AOAM533btCc7glFOjT0zM+TcyWN/zYW/oR2b5CforDA6i0M34O8IOUJe
 Ytjs526GhrsFJhGWdgkL0wlTRdY6CQ20yrbGnd0=
X-Google-Smtp-Source: ABdhPJx+ERqxCsirvtlgt51bxJTXTlw72jDRUlgZDQNHj6MZvPku22TVtfsAd8xerUKZU+u2JfdHUZwtq6BjKmN64Ag=
X-Received: by 2002:a67:be19:: with SMTP id x25mr1744519vsq.37.1590669674608; 
 Thu, 28 May 2020 05:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
 <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
 <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
 <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
In-Reply-To: <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 13:38:06 +0100
Message-ID: <CACvgo5209ymx5cMz7WODBLfCSBuVLXGCY+h2qFyB6_t_HLiZug@mail.gmail.com>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
To: Chih-Wei Huang <cwhuang@linux.org.tw>
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOCBNYXkgMjAyMCBhdCAxMDo0NiwgL3dyb3RlOgo+Cj4gU2ltb24gU2VyIDxjb250
YWN0QGVtZXJzaW9uLmZyPiDmlrwgMjAyMOW5tDXmnIgyNeaXpSDpgLHkuIAg5LiK5Y2IMzoyNeWv
q+mBk++8mgo+ID4gT24gU3VuZGF5LCBNYXkgMjQsIDIwMjAgODo1MyBQTSwgRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+ID4gT24gU2F0LCBNYXkgMjMsIDIwMjAgYXQg
NTo0NCBQTSBNYXVybyBSb3NzaSBpc3Nvci5vcnVhbUBnbWFpbC5jb20gd3JvdGU6Cj4gPiA+Cj4g
PiA+ID4gT3BlbkJ5RkIgaXMgaW50cm9kdWNlZCB0byBvdmVyY29tZSBHUFUgZHJpdmVyIGxvYWRp
bmcgb3JkZXIgaXNzdWUKPiA+ID4gPiBvbiBhIGRldmljZSB3aXRoIG11bHRpcGxlIEdQVXMsIGUu
Zy4gSW50ZWwgaUdQVSBhbmQgTnZpZGlhIGRHUFUKPiA+ID4gPiB3aGVyZSB0aGUgZmlyc3QgZHJt
ZmIga2VybmVsIG1vZHVsZSBsb2FkZWQgd2lsbCBiZWNvbWUgZGV2aWNlIGZpbGUKPiA+ID4gPiAv
ZGV2L2RyaS9jYXJkMCBhbmQgdGhlIHNlY29uZCB3aWxsIGJlY29tZSAvZGV2L2RyaS9jYXJkMQo+
ID4gPiA+IFRoZSB1c2UgY2FzZSBpcyB0byBwcmVmZXIgSW50ZWwgaUdQVSBvdmVyIGRHUFUsIG9y
IHZpY2V2ZXJzYSwKPiA+ID4gPiBpbiBhIGRldGVybWluaXN0aWMgYW5kIHJlbGlhYmxlIG1hbm5l
ci4KPiA+ID4gPiBPcGVuQnlGQiBmdW5jdGlvbiBvcGVucyB0aGUgRFJNIGRldmljZSB3aXRoIHNw
ZWNpZmllZCBmYiBhbmQgbm9kZSB0eXBlLAo+ID4gPiA+IHRodXMgZW5hYmxpbmcgZ3JhbGxvYyB0
byBvcGVuIHRoZSBjb3JyZWN0IGRldmljZSBub2RlIG9mIHRoZSBwcmltYXJ5IGZiLAo+ID4gPiA+
IHJlZ2FyZGxlc3Mgb2YgdGhlIEdQVSBkcml2ZXIgbG9hZGluZyBvcmRlci4KPiA+ID4KPiA+ID4g
VGhlIGZiZGV2IGxvYWQgb3JkZXJpbmcgaXMgYXMgaW5jb25zaXN0ZW50L3JhbmRvbSBhcyB0aGUg
ZHJpIG5vZGUKPiA+ID4gbG9hZGluZy4gV2VsbCBtb3JlIHNvLCBiZWNhdXNlIHlvdSBtaWdodCBo
YXZlIHJhbmRvbSBmaXJtd2FyZSBmYmRldgo+ID4gPiBkcml2ZXJzIGhhbmdpbmcgb3V0IHRoZXJl
LiBIZW5jZSBJJ20gbm90IGZvbGxvd2luZyBob3cgdGhpcyBzb2x2ZXMKPiA+ID4gYW55dGhpbmcg
Zm9yIHlvdXIgcHJvYmxlbS4KPiA+ID4KPiA+ID4gSSB0aGluayB1c3VhbGx5IHdoYXQgdXNlcnNw
YWNlIGRvZXMgaXQgbG9vayBhdCB0aGUgYm9vdF92Z2EgcHJvcGVydHkKPiA+ID4gb2YgdGhlIHVu
ZGVybHlpbmcgZGV2aWNlIGluIHN5c2ZzLCBhbmQgcHJlZmVyIHRoYXQgb25lLgo+Cj4gVGhhbmsg
eW91IGZvciB0aGUgcmVwbHkuCj4gSSdtIG5vdCB0aGUgZXhwZXJ0IHNvCj4gSSBjYW4ndCBmdWxs
eSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uCj4gV2hhdCBkb2VzICdib290X3ZnYScgbWVhbiBh
bmQgaG93IGNvdWxkIGl0IGhlbHAgb3VyIHByb2JsZW0/Cj4KVGhlIGJvb3RfdmdhIGlzIGEgZmxh
ZyB3aGljaCBpbmRpY2F0aW5nIHdoaWNoIFZHQSAoZ3JhcGhpY3MpIGRldmljZQp0aGUgc3lzdGVt
IGJvb3RlZCBmcm9tLgoKPiBUaGUgbWFpbiBwcm9ibGVtIHdlJ3JlIHRyeWluZyB0byBzb2x2ZSBp
cyB0bwo+IGZpbmQgdGhlIERSTSBkZXZpY2Ugb2YgdGhlIHByaW1hcnkgZnJhbWVidWZmZXIgKGZi
MCkuCj4gSSBiZWxpZXZlIC9zeXMvY2xhc3MvZ3JhcGhpY3MvZmIwL2RldmljZS9kcm0KPiBpcyB0
aGUgY29ycmVjdCBvbmUgd2UgY291bGQgdXNlLgo+IEF0IGxlYXN0IGl0IHdvcmtzIG9uIGFsbCBk
ZXZpY2VzIEkndmUgdGVzdGVkCj4gaW5jbHVkaW5nIG52aWRpYSBvcHRpbXVzIG5vdGVib29rcy4K
PiBJZiB0aGVyZSBpcyBhIHNpbXBsZXIgd2F5IHRvIGdldCB0aGUgRFJNIGRldmljZSBvZiBmYjAK
PiBJJ20gaGFwcHkgdG8gbGVhcm4uCj4KPiA+IFllcy4gU2VlIFsxXSBmb3IgYW4gZXhhbXBsZSBv
ZiBob3cgdG8gZG8gdGhpcy4KPiA+Cj4gPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9zd2F5d20v
d2xyb290cy9ibG9iLzVjOTQyYmQ1OTcyYWZlZTlhNjhjYjE1YzE0YWE4M2I0YjBhYWY4MmQvYmFj
a2VuZC9zZXNzaW9uL3Nlc3Npb24uYyNMMzMxCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBleGFtcGxl
Lgo+IEhvd2V2ZXIsIG91ciB0YXJnZXQgcGxhdGZvcm0gaXMgQW5kcm9pZCBhbmQKPiBBbmRyb2lk
IGRvZXNuJ3QgaGF2ZSB1ZGV2LiBTbyBJJ20gYWZyYWlkIHdlIGNhbid0IHVzZSBpdC4KCkluZGVl
ZCAtIHVkZXYgaXNuJ3QgYXMgd2lkZS1zcHJlYWQgYXMgaXQgY291bGQgaGF2ZSBiZWVuLiBBIHF1
aWNrIFdJUApzaG91bGQgYmUgaW4geW91ciBpbmJveC4KSXQgaW1wbGVtZW50cyBib290X3ZnYSBz
dXBwb3J0IGZvciBkcm1EZXZpY2UuCgpEbyBnaXZlIGl0IHNvbWUgdGVzdC9sb3ZlIGFuZCByZXN1
Ym1pdCBvbmNlIGl0IHdvcmtzIG9uIHlvdXIgZW5kLgoKLUVtaWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
