Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA1DE70A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B478A89AA7;
	Mon, 21 Oct 2019 08:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8B89A8C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 08:48:42 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6067881F0E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 08:48:41 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id t25so13439370qtq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 01:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRqmfLWgWgklrhuIT0YEqcb3zcO5An3swDX6Xn5ZmWQ=;
 b=VqdhFl2Z2Sqob41F4rrfEPNSuvWtexoLVAs8MdX0i7+tvLYTt0wewkVTKXxo+Y5Ono
 seJqXRW2W612mtIV2lkBayyCyK7MRbsJXqNV7qf3YCb+MQeAYdK/fglbJ+Ex1pBYOC2A
 hg1ZIXvGeMXpzQ5n5ogBmccxbVC0ENRxI+xa9K3EwdF9ZcYmInL753L99vIN+Hatc9xD
 9/CKnsuUnkB+nPywKkeczvmL0FzXmBE1E1bE7vrOYMIVh7p75NPJZpkloQI+L190bRs0
 3678Km0VGRsM/G/FhE5lRzZ4W7cr0+GxsgtNyYIz8+OK3Z6Qs3ptoj61/I0VEvhzT47m
 EGBg==
X-Gm-Message-State: APjAAAXkENasUeta0dqfBmVo0gUEUaf9G3TKV7zVj377h5GGtoDzknKm
 VH/jUSc8/S+K5py2uwUtqMXenwQ9xk3/yGCFeUJVwy7DJzKuNoukvprEHJAn4snTUq/A/UADhAM
 NTHhF/cfa5D7Zs2d+dJOd7hFjRp7DpybU3ySHHLeQZmd8
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr21040846qkc.157.1571647720595; 
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMSJL3T6FDafLXsYkKHSRUn9ds4wEGZrqyrQwy1ZdVD37ycdGAVZNZ8hFxO2cMo4t/PkEIVrqxmsVkDYGB08g=
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr21040840qkc.157.1571647720291; 
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
 <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
 <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
In-Reply-To: <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 10:48:29 +0200
Message-ID: <CACO55tvAyE1t2Bm8J=Yb_Gi5PDAgof=mRsJAKHFxOvEZpV-qGg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: "Rafael J. Wysocki" <rafael@kernel.org>
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

ZnlpOiBJIGRlY2lkZWQgdG8gZ28gZm9yIGEgZGlmZmVyZW50IHdvcmthcm91bmQgdG8gZml4IHRo
ZSBydW5wbQppc3N1ZXMgb2JzZXJ2ZWQgd2l0aCBudmlkaWEgZ3B1cyB3aXRoIG5vdXZlYXUgaW4g
dGhlICJwY2k6IHByZXZlbnQKcHV0dGluZyBudmlkaWEgR1BVcyBpbnRvIGxvd2VyIGRldmljZSBz
dGF0ZXMgb24gY2VydGFpbiBpbnRlbCBicmlkZ2VzIgp0aHJlYWQKCnRoYXQncyBvbiB0aGUgcGNp
IGFuZCBwbSBtYWlsaW5nIGxpc3QuIE1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIHdhaXQKZm9yIHRo
YXQgdG8gbGFuZCBiZWZvcmUgYWN0dWFsbHkgcmVtb3ZpbmcgdGhlIEFDUEkgd29ya2Fyb3VuZHMg
aGVyZT8KVGhlIHdvcmthcm91bmQgSSBoYWQgaW4gdGhpcyBzZXJpZXMgZGlkbid0IHNlZW0gdG8g
YmUgcmVsaWFibGUgZW5vdWdoLApzbyBJIGRpdGNoZWQgdGhhdCBhcHByb2FjaGVkLgoKT24gTW9u
LCBPY3QgMjEsIDIwMTkgYXQgMTA6MTQgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDQ6MTQgQU0gQWxleCBI
dW5nIDxhbGV4Lmh1bmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2UgaGF2ZSBkb25l
IHNvbWUgdGVzdHMgb24gdGhyZWUgb2YgSW50ZWwgKyBuVmlkaWEgY29uZmlndXJhdGlvbgo+ID4g
c3lzdGVtcyB3aXRoIE9FTSBfT1NJIHN0cmluZ3MgcmVtb3ZlZCAtIHdoaWxlIHNvbWUgYnVncyBh
cmUgc3RpbGwKPiA+IG9ic2VydmVkLCBleC4gb25lIG91dCBvZiB0aHJlZSBoYXMgc3VzcGVuZC9y
ZXN1bWUgaXNzdWVzLCBubyBzeXN0ZW0KPiA+IGNyYXNoZXMgd2VyZSBvYnNlcnZlZCAtIHRoZSBi
aWdnZXN0IGlzc3VlIHRoYXQgd29ycmllcyB1cy4KPiA+Cj4gPiBUaGUgcG9zaXRpdmUgcmVzdWx0
cyBnaXZlIHVzIGNvbmZpZGVudCB0byBhY2sgdGhlIHJlbW92YWwgb2YgdGhlIE9FTQo+ID4gX09T
SSBzdHJpbmdzLiBXaGlsZSBvdXIgdGVzdHMgd2VyZSBub3QgYWJsZSB0byBjb3ZlciBhbGwgcG9z
c2libGUgSStOCj4gPiBzeXN0ZW1zLCB3ZSBhcmUgc3VyZSB3ZSBjYW4gZml4IGlzc3VlcyBhbG9u
ZyB0aGUgd2F5LiBJZiB0aGVyZSBhcmVuJ3QKPiA+IHN5c3RlbXMgdGhhdCBjYW5ub3QgYmUgZml4
ZWQgd2l0aG91dCB0aGVzZSBPRU0gX09TSSBzdHJpbmdzLCB0aGVzZQo+ID4gc3RyaW5ncyBzaG91
bGQgcHJvYmFibHkgZW5hYmxlIHdpdGggRE1JIHF1aXJrcyAocG9zc2libGUgZnV0dXJlCj4gPiBw
YXRjaGVzKSBzbyB0aGV5IHdvbid0IGFmZmVjdCBvdGhlcnMuCj4gPgo+ID4gQWNrZWQtYnk6IEFs
ZXggSHVuZyA8YWxleC5odW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBPSywgdGhhbmtzIQo+Cj4gSSBj
YW4gcXVldWUgdGhpcyB1cCBvciBpZiBpdCdzIGJldHRlciB0byByb3V0ZSBpdCB0aHJvdWdoIHRo
ZSBEUk0KPiB0cmVlLCBwbGVhc2UgZG8gdGhhdCAoYW5kIGxldCBtZSBrbm93KS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
