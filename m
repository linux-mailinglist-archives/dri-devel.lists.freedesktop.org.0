Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4C91039B1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406166E4AF;
	Wed, 20 Nov 2019 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B4B6E4BB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:12:05 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-zn0Mev-6OpWaBOaSwgqv8g-1; Wed, 20 Nov 2019 07:12:03 -0500
Received: by mail-qk1-f200.google.com with SMTP id q125so15730131qka.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 04:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VF+bQZFHPewNnM9aH9KyZQntlM8F2dUwAxVJVb/6oKY=;
 b=huAk1qkijlXhPOP4nUL9aLE2C+9P5r7sD0L6r69Um2o8r1kMketBiXxjK0NyM1F5Bw
 87HBFQv269nISKGo1/1HvDvofB+0m2wsK3N/P1weS1+YwKGHRsoynwllWPLp7ILaUDB0
 JWQv5cDtrZbXyXU9P2YFYN5eMWxGHpo4Cm6oi9SZ+HAB2Hvp0rPDbtb8xJO9sRhO774F
 dOdFwI7DnXkBw/61m7WvwoM8q9THK7gYjgP9D8/KGMUuel/nmL/RHDWLyI4KzsoszlB3
 5uqN1fempRCBX36Lg21irNF1e7H+07iinCLuSPxb/3XMfebKJkl8tuJJ7hBrwViezv+6
 BjSQ==
X-Gm-Message-State: APjAAAVjL5IsOgnAvpxcPrScHkbSwhRXfy11KgNVubD41qj5cfzwpFxN
 W06sNINbYckI4ySjwNVYQC5Yrq8+urc9dg3DUO3nCauyyTGjjMJVB75XiommWTtFDikKpt20Ki3
 mL/tetFoV9nmxhHRMBqf0rWSR8ntx0zvQa+XKBcm91XfM
X-Received: by 2002:a37:9083:: with SMTP id s125mr2044113qkd.192.1574251923301; 
 Wed, 20 Nov 2019 04:12:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBAA4TCCMTkJLA3fk7uQ/livSO00sZJsFKKfFUtKcydvGnjFRyWiHk4b/E6hpfbS10eFj88YdwU+FKUdPz0cI=
X-Received: by 2002:a37:9083:: with SMTP id s125mr2044079qkd.192.1574251923040; 
 Wed, 20 Nov 2019 04:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
In-Reply-To: <20191120120913.GE11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 13:11:52 +0100
Message-ID: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: zn0Mev-6OpWaBOaSwgqv8g-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574251924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VF+bQZFHPewNnM9aH9KyZQntlM8F2dUwAxVJVb/6oKY=;
 b=BRMvBy0jr6Cl7DF+3UNGZo3rjEa3ndIOh44ahtijq+vY8thtK4qQKQG/adR0rb5RqFX2La
 j/FCO8gVonNnmDnprlVcE7/k11Xgg7+hbuXhiDlo5dhNxTOEebod66yjSqYxZUtV+RXigH
 GjJmuXTdJUzUwwhwtOfEsy8BByTm7dI=
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowOSBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6
NTg6MDBQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gb3ZlcmFsbCwgd2hhdCBJIHJl
YWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29yayBvbiB3aW5kb3dzPwo+Cj4g
U28gZG8gSSA7LSkKPgo+ID4gT3Igd2hhdCBhcmUgd2UgZG9pbmcgZGlmZmVyZW50bHkgb24gTGlu
dXggc28gdGhhdCBpdCBkb2Vzbid0IHdvcms/IElmCj4gPiBhbnlib2R5IGhhcyBhbnkgaWRlYSBv
biBob3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJlIGl0IG91dAo+ID4gb24gdGhp
cyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRo
ZSByb290Cj4gPiBjYXVzZT8gbm8/Cj4KPiBIYXZlIHlvdSB0cmllZCB0byB1c2UgdGhlIGFjcGlf
cmV2X292ZXJyaWRlIHBhcmFtZXRlciBpbiB5b3VyIHN5c3RlbSBhbmQKPiBkb2VzIGl0IGhhdmUg
YW55IGVmZmVjdD8KPgo+IEFsc28gZGlkIHlvdSB0cnkgdG8gdHJhY2UgdGhlIEFDUEkgX09OL19P
RkYoKSBtZXRob2RzPyBJIHRoaW5rIHRoYXQKPiBzaG91bGQgaG9wZWZ1bGx5IHJldmVhbCBzb21l
dGhpbmcuCj4KCkkgdGhpbmsgSSBkaWQgaW4gdGhlIHBhc3QgYW5kIGl0IHNlZW1lZCB0byBoYXZl
IHdvcmtlZCwgdGhlcmUgaXMganVzdApvbmUgYmlnIGlzc3VlIHdpdGggdGhpczogaXQncyBhIERl
bGwgc3BlY2lmaWMgd29ya2Fyb3VuZCBhZmFpaywgYW5kCnRoaXMgaXNzdWUgcGxhZ3VlcyBub3Qg
anVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3ZvCmxhcHRvcHMgYXMg
d2VsbCwgYW5kIEkndmUgaGVhcmQgYWJvdXQgdXNlcnMgaGF2aW5nIHRoZSBzYW1lIGlzc3VlcyBv
bgpBc3VzIGFuZCBNU0kgbGFwdG9wcyBhcyB3ZWxsLgoKSSB3aWxsIHNwZW5kIHNvbWUgdGltZSB0
byBjb2xsZWN0IGFsbCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uLApjcmVhdGUgYSBidWcgdG8g
cHV0IGl0IGFsbCBpbiB0aGVyZSBhbmQgc2VuZCBvdXQgYSB2NSB3aXRoIHRoZSB1cGRhdGVkCmlu
Zm9ybWF0aW9uIGFuZCByZWZlcmVuY2VzIHRvIHRoaXMgYnVnLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
