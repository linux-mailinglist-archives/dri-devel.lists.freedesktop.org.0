Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAEDAA91E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CC96E07B;
	Thu,  5 Sep 2019 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B60B6E07B;
 Thu,  5 Sep 2019 16:36:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q12so3861566wmj.4;
 Thu, 05 Sep 2019 09:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkGp5CuoZ7+DBs4HS2vxktRn4TIDGSJOXm8qEsfnCug=;
 b=CeJBC3PbHh1I9El3KizaWMGfcR4usGM9TCsBcuLxEBKxgGcObb3QeWq4msv6p+o3+E
 UdMbOWNR7ZBvd0I5K1eLkjDyytp3d31NbLQ3FoHmvEaA9Zadbdnzk05LB8u55WwZ02DY
 m+3fBIGTmVKcD5cwT03ZXbffNSmKqCW4/mCAI7qLbCDKOdEls2rYKCpiv20dV0GHlzFD
 Xgxg01ydT4W/Kx1BEvLRJq7fOq+4JHcHPs9bYHOiTDq/jB5iJmojB2Yk/L9gI3ib7lyE
 Ci6FG0XFJhU+mmNEe6O6JPl+ZmNubbtlTlXCXRhIZ0H8HVqmHjA4VviMZe4G3C4XLCAY
 PSUw==
X-Gm-Message-State: APjAAAWnXDPq3o9vPRVSnxwL00o3pqHNC6YDvMS4diN557AJbMIpLWli
 CcsOal8VKdrR7f3JFlsuHmXrCtufzMRNUllui+w=
X-Google-Smtp-Source: APXvYqz9hFfnXxS5LgTBQz7g+RYOpjxUXfn5LexEg3DPsbwv7ynAv2O9TVtk+V6OTPQbyewJo1sVCMTYFV0YBT0Qo5E=
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr2086098wml.67.1567701400749; 
 Thu, 05 Sep 2019 09:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
In-Reply-To: <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Sep 2019 12:35:56 -0400
Message-ID: <CADnq5_NSY=usXHcX8UqBiTbenPE8K3+yZ5Ujnu3vSWziVTr_QQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AkGp5CuoZ7+DBs4HS2vxktRn4TIDGSJOXm8qEsfnCug=;
 b=CHYo7f5m6VPqE9QLpkVzXSD6hkAvDyeC6o/nT2cG/NAlupPoCvxlSNJ9WJ/fCabKX+
 RuCXNuBcezQ3NyxM5dr4EGNeqH/Vr7iq4+1Uv9WVYVP7jiMVUHSG/lNjw3yToh3SUGfA
 pkQRvFNI0bmaECFdIGhrz40A/qnK6in/WB92eNHldOZL75D89eby2AKCD7fM75DwJdM0
 CxrozoYT5B6FvgVgeGrmDS83v474qTxvRsSWPmmz0NZpSJxEZKaIRVE1sPyabVSxZO3k
 P185atT0E4KK2sM9dbue//XvVONoE9Re9KIcvwJUbAtowkAHQT8dvSVjS+7Z/H6zhMU5
 a1gA==
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
Cc: Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxMTo1MSBBTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBpcyB0aGVyZSBhbnkgdXBkYXRlIG9uIHRoZSB0ZXN0aW5nIHdp
dGggbXkgcGF0Y2hlcz8gT24gdGhlIGhhcmR3YXJlIEkKPiBoYWQgYWNjZXNzIHRvIHRob3NlIHBh
dGNoZXMgaGVscGVkLCBidXQgSSBjYW4ndCBrbm93IGlmIGl0IGFsc28gaGVscGVkCj4gb24gdGhl
IGhhcmR3YXJlIGZvciB3aGljaCB0aG9zZSB3b3JrYXJvdW5kcyB3aGVyZSBhY3R1YWxseSBhZGRl
ZC4KPgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDExOjUyIEFNIFJhZmFlbCBKLiBXeXNvY2tp
IDxyandAcmp3eXNvY2tpLm5ldD4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1cnNkYXksIEF1Z3VzdCAx
NSwgMjAxOSAxMjo0NzozNSBBTSBDRVNUIERhdmUgQWlybGllIHdyb3RlOgo+ID4gPiBPbiBUaHUs
IDE1IEF1ZyAyMDE5IGF0IDA3OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2YTUxZWVhNjY2
ZDU1MzFiY2FlZjJmNjhlNGFiYmQ4NzI0MmMuCj4gPiA+ID4KPiA+ID4gPiBUaGUgb3JpZ2luYWwg
Y29tbWl0IG1lc3NhZ2UgZGlkbid0IGV2ZW4gbWFrZSBzZW5zZS4gQU1EIF9kb2VzXyBzdXBwb3J0
IGl0IGFuZAo+ID4gPiA+IGl0IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxsLgo+ID4gPiA+Cj4g
PiA+ID4gQWxzbyB3aGF0IHdhcyB0aGUgaXNzdWUgYmVpbmcgc29sdmVkIGhlcmU/IE5vIHJlZmVy
ZW5jZXMgdG8gYW55IGJ1Z3MgYW5kIG5vdAo+ID4gPiA+IGV2ZW4gZXhwbGFpbmluZyBhbnkgaXNz
dWUgYXQgYWxsIGlzbid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+ID4gPiA+Cj4gPiA+ID4gQW5k
IGV2ZW4gaWYgaXQgbWVhbnMgYSBtdXhlZCBkZXNpZ24sIHRoZW4gdGhlIGZpeCBpcyB0byBtYWtl
IGl0IHdvcmsgaW5zaWRlIHRoZQo+ID4gPiA+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5
IHdvcmthcm91bmQgdGhyb3VnaCBBQ1BJIHRyaWNrcy4KPiA+ID4gPgo+ID4gPiA+IEFuZCB3aGF0
IG91dCBvZiB0cmVlIGRyaXZlcnMgZG8gb3IgZG8gbm90IHN1cHBvcnQgd2UgZG9uJ3QgY2FyZSBv
bmUgYml0IGFueXdheS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoZSByZXZlcnRzIHNo
b3VsZCBiZSBtZXJnZWQgdmlhIFJhZmFlbCdzIHRyZWUgYXMgdGhlIG9yaWdpbmFsCj4gPiA+IHBh
dGNoZXMgd2VudCBpbiB2aWEgdGhlcmUsIGFuZCB3ZSBzaG91bGQgZ2V0IHRoZW0gaW4gYXNhcC4K
PiA+ID4KPiA+ID4gQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
Pgo+ID4gVGhlIF9PU0kgc3RyaW5ncyBhcmUgdG8gYmUgZHJvcHBlZCB3aGVuIGFsbCBvZiB0aGUg
bmVlZGVkIHN1cHBvcnQgaXMgdGhlcmUgaW4KPiA+IGRyaXZlcnMsIHNvIHRoZXkgc2hvdWxkIGdv
IGF3YXkgYWxvbmcgd2l0aCB0aGUgcmVxdWlzaXRlIGRyaXZlciBjaGFuZ2VzLgo+ID4KPgo+IHRo
YXQgZ29lcyBiZXNpZGUgdGhlIHBvaW50LiBmaXJtd2FyZSBsZXZlbCB3b3JrYXJvdW5kcyBmb3Ig
R1BVIGRyaXZlcgo+IGlzc3VlcyB3ZXJlIHB1c2hlZCB3aXRob3V0IGNvbnN1bHRpbmcgd2l0aCB1
cHN0cmVhbSBHUFUgZGV2ZWxvcGVycy4KPiBUaGF0J3Mgc29tZXRoaW5nIHdoaWNoIHNob3VsZG4n
dCBoYXZlIGhhcHBlbmVkIGluIHRoZSBmaXJzdCBwbGFjZS4gQW5kCj4geWVzLCBJIGFtIHBlcnNv
bmFsbHkgYW5ub3llZCBieSB0aGUgZmFjdCwgdGhhdCBwZW9wbGUga25vdyBhYm91dAo+IGlzc3Vl
cywgYnV0IGluc3RlYWQgb2YgY29udGFjdGluZyB0aGUgcHJvcGVyIHBlcnNvbnMgYW5kIHdvcmtp
bmcgb24gYQo+IHByb3BlciBmaXgsIHdlIGVuZCB1cCB3aXRoIHN0dXBpZCBmaXJtd2FyZSBsZXZl
bCB3b3JrYXJvdW5kcy4gSSBjYW4ndAo+IHNlZSB3aHkgd2UgZXZlciB3b3VsZCBoYXZlIHdhbnRl
ZCBzdWNoIHdvcmthcm91bmRzIGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IEFuZCBJIHdvdWxkIGJl
IG11Y2ggaGFwcGllciBpZiB0aGUgbmV4dCB0aW1lIHNvbWV0aGluZyBsaWtlIHRoYXQgY29tZXMK
PiB1cCwgdGhhdCB0aGUgZHJtIG1haWxpbmcgbGlzdCB3aWxsIGJlIGNvbnRhY3RlZCBhcyB3ZWxs
IG9yIHNvbWVib2R5Cj4gaW52b2x2ZWQuCj4KPiBXZSBjb3VsZCBoYXZlIGFsc28ganVzdCBkaXNh
YmxlIHRoZSBmZWF0dXJlIGluc2lkZSB0aGUgZHJpdmVyIChhbmQKPiBwcm9iYWJseSB3ZSBzaG91
bGQgaGF2ZSBkb25lIHRoYXQgYSBsb25nIHRpbWUgYWdvLCBzbyB0aGF0IGlzCj4gZXNzZW50aWFs
bHkgb3VyIGZhdWx0LCBidXQgc3RpbGwuLi4uKQoKR2VuZXJhbGx5IHRoZXNlIGNvbnZlcnNhdGlv
bnMgaGFwcGVuIGJldHdlZW4gdGhlIE9FTSwgdGhlIHJlbGV2YW50CmRpc3RybywgYW5kIGh3IHZl
bmRvciBwcmlvciB0byBwcm9kdWN0aW9uIHNvIHRoZXkgY2FuJ3QgYWx3YXlzIGJlCmRpc2N1c3Nl
ZCBpbiBwdWJsaWMuICBUaGVzZSBwcm9ncmFtcyBoYXZlIHBvd2VyLCBmZWF0dXJlLCBhbmQgZGlz
dHJvCnRhcmdldHMgYW5kIG5vdCBhbGwgb2YgdGhvc2UgYWxpZ24uICBTb21ldGltZXMgZml4aW5n
IHRoaXMgYXQgdGhlCmZpcm13YXJlIGxldmVsIGlzIHRoZSBiZXN0IHdheSB0byBtYWtlIHRoZSBw
cm9kdWN0IHdvcmsgd2VsbCBhdCBsYXVuY2gKZ2l2ZW4gdGhlIHN0YXRlIG9mIExpbnV4IGF0IGEg
cGFydGljdWxhciB0aW1lLiAgV2luZG93cyBhbHJlYWR5IGRvZXMKc2ltaWxhciBzdHVmZiBzbyB0
aGF0IG9sZGVyIHZlcnNpb25zIG9mIHdpbmRvd3Mgd2lsbCB3b3JrIHByb3Blcmx5IG9uCm5ld2Vy
IGhhcmR3YXJlLiAgSSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBhbGwgc3RyaXZlIHRvIGZpeCBzdHVm
Zgpwcm9wZXJseSwgYnV0IHRoYXQncyBub3QgYWx3YXlzIHBvc3NpYmxlLgoKQWxleAoKPgo+ID4g
SSdtIGFsbCBmb3IgZHJvcHBpbmcgdGhlbiB3aGVuIHRoYXQncyB0aGUgY2FzZSwgc28gcGxlYXNl
IGZlZWwgZnJlZSB0byBhZGQgQUNLcwo+ID4gZnJvbSBtZSB0byB0aGUgcGF0Y2hlcyBpbiBxdWVz
dGlvbiBhdCB0aGF0IHBvaW50Lgo+ID4KPiA+IENoZWVycywKPiA+IFJhZmFlbAo+ID4KPiA+Cj4g
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
