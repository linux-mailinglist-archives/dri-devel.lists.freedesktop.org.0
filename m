Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A584B8EE5C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878F56E426;
	Thu, 15 Aug 2019 14:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB06E422
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:37:05 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 16so2229576oiq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IlFIaDmZ+sHHQP0mYa1mFOngV+vFJdYPAInzrgtIt0M=;
 b=JsPTEPnp4GACjE9iYCQoJcdub1FIt9fKupdE4FRcY/ZdYuxkFvz5emM0hOQqBkxsFj
 jJSx1XJjtXYcGQrAAZKxNthxI+e5VI2S3O7G69XVPIVvRuQ2YlQoePXitmgsdFHeenJk
 36IJFwuoSZkeZMvC5JclzQ/zpZyp0PwJ5jb6KZrQ+1cJnnaWX/Vbiu9YK0ITfAakRbmu
 bAjsvfNg/Fux+F0ixw56ootpRYXAOivj1t/YE7GwxDBq3yTfqnS3HKiheKy2LXXhEVQl
 3+yah/VzrpE+Lh43Km4gqfWYtTdMNLKx4htCAJ+VLqZpbfM4p7p2Y3Yo/YSjgnPBz30f
 Sawg==
X-Gm-Message-State: APjAAAWc1GlcEaAMxSwXAmhfzCdKpI0AQpMqH51Fh28T1dRqxY0a3Bat
 9DDUasApeT3qAemm1e7rArUwJc5N3j1p6D/7H0XXdA==
X-Google-Smtp-Source: APXvYqxgZqfNjbixzTHbLRjdTOD1wqqdFX6azztBPpwrX8nyQmZuIbb1CWjlCWpdontsW35jrvxftk//41Vlnhpur4Y=
X-Received: by 2002:a02:c487:: with SMTP id t7mr5232047jam.99.1565879825035;
 Thu, 15 Aug 2019 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
 <54add026bb6f45fd94a2dc2bae4adf9f@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <54add026bb6f45fd94a2dc2bae4adf9f@AUSX13MPC101.AMER.DELL.COM>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:36:54 +0200
Message-ID: <CACO55tthEUVKJN_yCuGU95e8Zc+q-sJEsxML+ZYz7rpU9zDGCg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Mario.Limonciello@dell.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDozNCBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5j
b20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogS2Fy
b2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gPiBTZW50OiBUaHVyc2RheSwgQXVndXN0
IDE1LCAyMDE5IDk6MjUgQU0KPiA+IFRvOiBMaW1vbmNpZWxsbywgTWFyaW8KPiA+IENjOiBEYXZl
IEFpcmxpZTsgTEtNTDsgTGludXggQUNQSSBNYWlsaW5nIExpc3Q7IGRyaS1kZXZlbDsgbm91dmVh
dTsgUmFmYWVsIEogLgo+ID4gV3lzb2NraTsgQWxleCBIdW5nOyBCZW4gU2tlZ2dzOyBEYXZpZCBB
aXJsaWUKPiA+IFN1YmplY3Q6IFJlOiBbTm91dmVhdV0gW1BBVENIIDEvN10gUmV2ZXJ0ICJBQ1BJ
IC8gT1NJOiBBZGQgT0VNIF9PU0kgc3RyaW5nIHRvCj4gPiBlbmFibGUgZEdQVSBkaXJlY3Qgb3V0
cHV0Igo+ID4KPiA+Cj4gPiBbRVhURVJOQUwgRU1BSUxdCj4gPgo+ID4gT24gVGh1LCBBdWcgMTUs
IDIwMTkgYXQgNDoyMCBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiA+ID4gVGhlcmUgYXJlIGRlZmluaXRlbHkgZ29pbmcgdG8gYmUgcmVncmVzc2lvbnMg
b24gbWFjaGluZXMgaW4gdGhlIGZpZWxkIHdpdGgKPiA+IHRoZQo+ID4gPiA+ID4gaW4gdHJlZSBk
cml2ZXJzIGJ5IHJldmVydGluZyB0aGlzLiAgSSB0aGluayB3ZSBzaG91bGQgaGF2ZSBhbiBhbnN3
ZXIgZm9yIGFsbCBvZgo+ID4gPiA+IHRob3NlCj4gPiA+ID4gPiBiZWZvcmUgdGhpcyByZXZlcnQg
aXMgYWNjZXB0ZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVnYXJkaW5nIHN5c3RlbXMgd2l0aCBJ
bnRlbCtOVklESUEsIHdlJ2xsIGhhdmUgdG8gd29yayB3aXRoIHBhcnRuZXJzIHRvCj4gPiA+ID4g
Y29sbGVjdAo+ID4gPiA+ID4gc29tZSBpbmZvcm1hdGlvbiBvbiB0aGUgaW1wYWN0IG9mIHJldmVy
dGluZyB0aGlzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lz
dGVtIHdpdGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJlcyBBTUQKPiA+IEdQVSB0bwo+ID4g
PiA+IHVzZQo+ID4gPiA+ID4gIkh5YnJpZCBHcmFwaGljcyIgd2hlbiBvbiBXaW5kb3dzIGFuZCAi
UG93ZXIgRXhwcmVzcyIgYW5kICJTd2l0Y2hhYmxlCj4gPiA+ID4gR3JhcGhpY3MiCj4gPiA+ID4g
PiB3aGVuIG9uIExpbnV4Lgo+ID4gPiA+Cj4gPiA+ID4gYW5kIHdoYXQncyBleGFjdGx5IHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAo+ID4gPiA+IGlz
c3VlIGhlcmU/Cj4gPiA+Cj4gPiA+IERQL0hETUkgaXMgbm90IGRldGVjdGVkIHVubGVzcyBwbHVn
Z2VkIGluIGF0IGJvb3R1cC4gIEl0J3MgZHVlIHRvIG1pc3NpbmcgSFBECj4gPiA+IGV2ZW50cy4K
PiA+ID4KPiA+Cj4gPiBhZmFpayBMeXVkZSB3YXMgd29ya2luZyBvbiBmaXhpbmcgYWxsIHRoYXQs
IGF0IGxlYXN0IGZvciBzb21lIGRyaXZlcnMuCj4gPiBJZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jv
bmcsIHdlIHN0aWxsIHNob3VsZCBmaXggdGhlIGRyaXZlcnMsIG5vdAo+ID4gYWRkaW5nIEFDUEkg
d29ya2Fyb3VuZHMuCj4KPiBJIGRvbid0IGRpc2FncmVlLCBidXQgdGltaW5nIGlzIGZyZXF1ZW50
bHkgYSBsaW1pdGF0aW9uIGlmIHlvdSB3YW50IHRoZSBoYXJkd2FyZSB0bwo+IHdvcmsgd2hlbiB5
b3UgcHV0IGl0IG9uIHRoZSBtYXJrZXQuCj4KPiBUaGUgd2hvbGUgaWRlYSBiZWhpbmQgdGhlIE9T
SSBzdHJpbmcgd2FzIHRoYXQgaXQgY291bGQgYmUgcmV2ZXJ0ZWQgd2hlbiB0aGUgdGltZQo+IHdh
cyByaWdodC4gIEZyb20gdGhpcyBkaXNjdXNzaW9uIGl0IHZlcnkgd2VsbCBtYXkgYmUgZm9yIHN5
c3RlbXMgd2l0aCBBTUQgR1BVLCBidXQKPiBpdCBuZWVkcyB0byBiZSBjaGVja2VkIGFnYWluLgo+
Cj4gPgo+ID4gQWxleDogZG8geW91IGtub3cgaWYgdGhlcmUgYXJlIHJlbWFpbmluZyBpc3N1ZXMg
cmVnYXJkaW5nIHRoYXQgd2l0aCBhbWRncHU/Cj4gPgo+ID4gPiA+Cj4gPiA+ID4gV2UgYWxyZWFk
eSBoYXZlIHRoZSBQUklNRSBvZmZsb2FkaW5nIGluIHBsYWNlIGFuZCBpZiB0aGF0J3Mgbm90Cj4g
PiA+ID4gZW5vdWdoLCB3ZSBzaG91bGQgd29yayBvbiBleHRlbmRpbmcgaXQsIG5vdCBhZGRpbmcg
c29tZSBBQ1BJIGJhc2VkCj4gPiA+ID4gd29ya2Fyb3VuZHMsIGJlY2F1c2UgdGhhdCdzIGV4YWN0
bHkgaG93IHRoYXQgbG9va3MgbGlrZS4KPiA+ID4gPgo+ID4gPiA+IEFsc28sIHdhcyB0aGlzIGRp
c2N1c3NlZCB3aXRoIGFueWJvZHkgaW52b2x2ZWQgaW4gdGhlIGRybSBzdWJzeXN0ZW0/Cj4gPiA+
ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGZlZWwgd2UgbmVlZCBhIGtub2IgYW5kL29yIERNSSBk
ZXRlY3Rpb24gdG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRoYXQgdGhlCj4gPiBBU0wKPiA+ID4gPiA+
IG5vcm1hbGx5IHBlcmZvcm1zLgo+ID4gPiA+Cj4gPiA+ID4gV2h5IGRvIHdlIGhhdmUgdG8gZG8g
dGhhdCBvbiBhIGZpcm13YXJlIGxldmVsIGF0IGFsbD8KPiA+ID4KPiA+ID4gRm9sa3MgZnJvbSBB
TUQgR3JhcGhpY3MgdGVhbSByZWNvbW1lbmRlZCB0aGlzIGFwcHJvYWNoLgo+Cj4gSSBzaG91bGQg
Y2xhcmlmeSB0aGlzIGlzIGZyb20gdGhlIGZvbGtzIG9uIEFNRCBncmFwaGljcyB0ZWFtIHRoYXQg
aW50ZXJhY3QgdG8gT0VNcwo+IGxpa2UgRGVsbCB3aGljaCBhcmUgbm90IG5lY2Vzc2FyaWx5IHRo
ZSBzYW1lIGZvbGtzIHdobyB3b3JrIG9uIHRoZSBkcml2ZXJzIGRpcmVjdGx5Lgo+Cgp5ZWFoLCBJ
IHVuZGVyc3RhbmQgdGhlIHByZXNzdXJlLCBhbmQgaXQgbWlnaHQgaGF2ZSBiZWVuIGZpbmUgaWYg
d2UKd291bGQgaGF2ZSB0aGlzIGRpc2N1c3Npb24gdXBzdHJlYW0sIGlmIGl0J3MgYWJvdXQgcHVz
aGluZyB0aGluZ3MKdXBzdHJlYW0uIFRoZSBjb21taXRzIGl0c2VsZiBkaWRuJ3QgZXZlbiBtYWtl
IHRoZSBpbXByZXNzaW9uIHRoYXQKYW55Ym9keSB3aXRoIHRoZSBkcm0gZHJpdmVycyBpbnZvbHZl
ZCBldmVuIGxvb2tlZCBhdCB0aG9zZSBwYXRjaGVzIGFuZAp0aGlzIGlzIHRoZSB3b3JzdCBwYXJ0
IG9mIHRob3NlIGNvbW1pdHMuCgo+ID4gRnJvbSB0aGVpciBwZXJzcGVjdGl2ZQo+ID4gPiBpdCdz
IG5vdCBhIHdvcmthcm91bmQuICBUaGV5IHZpZXcgdGhpcyBhcyBhIGRpZmZlcmVudCBhcmNoaXRl
Y3R1cmUgZm9yIEFNRAo+ID4gZ3JhcGhpY3MgZHJpdmVyIG9uCj4gPiA+IFdpbmRvd3MgYW5kIEFN
RCBncmFwaGljcyB3LyBhbWRncHUgZHJpdmVyLiAgVGhleSBoYXZlIGRpZmZlcmVudCBBU0wgcGF0
aHMKPiA+IHVzZWQgZm9yCj4gPiA+IGVhY2guCj4gPgo+ID4gQGFsZXg6IGlzIHRoaXMgdHJ1ZT8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
