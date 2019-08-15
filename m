Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1EB8EDA5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E516E9C0;
	Thu, 15 Aug 2019 14:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C986E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:04:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k18so6128194otr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zM3G1xWX3WogoYIxIH0si8CwpIiqkYLZ2hiihxpOqQ=;
 b=lGHjhmTqmCUdAzRbIVaxEH32Fa4LMG0KZQnJ/KQcu+cjRcJJ35CIvJQKAV3KWPxYjC
 5P7HP/LqVTEK0eto5t+3JmAMbUkDO8vCmyqx3DrwUD2f4yNRLWLCKCL17S0HN9v5kwQ4
 sLVFyeprgg4bKBuC9DOC4DgPljT5T7aZqM6WxUYPQhZTF2lme4v2h/Zaot0gPR3rLLzQ
 2YLB2aDMin0qbYcbUGbosSlFFwpnW3gAfohxF04U8KnT07iwhHet/fEw1qdgZwQ0L8XO
 DA5eUVlC9zJGS2ZQUbQMDc/H6iA5OkFwhVHokXbMeiGq7jxUGrBFV3xE9M0OylQNAFsf
 Oh2g==
X-Gm-Message-State: APjAAAU1mWShMtijP0XL7PxMK7522kUpzA4KrsypujW/W2ODETCelvYO
 PxmAru2zFGDuN8KHldX5GeFipc0WA6iM6wqIykjaTg==
X-Google-Smtp-Source: APXvYqzchRXgP4x789+GjQl+9hOyJZGL6tLjLzEJ8LcaNO1Yx6DCAmdlcRIEhnpH8KVHbuj5x4BhAACAIvjM27sfOC8=
X-Received: by 2002:a5d:8195:: with SMTP id u21mr5821290ion.260.1565877878036; 
 Thu, 15 Aug 2019 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:04:27 +0200
Message-ID: <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzo1NiBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5j
b20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogbGlu
dXgtYWNwaS1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWFjcGktb3duZXJAdmdlci5rZXJu
ZWwub3JnPiBPbgo+ID4gQmVoYWxmIE9mIERhdmUgQWlybGllCj4gPiBTZW50OiBXZWRuZXNkYXks
IEF1Z3VzdCAxNCwgMjAxOSA1OjQ4IFBNCj4gPiBUbzogS2Fyb2wgSGVyYnN0Cj4gPiBDYzogTEtN
TDsgTGludXggQUNQSTsgZHJpLWRldmVsOyBub3V2ZWF1OyBSYWZhZWwgSiAuIFd5c29ja2k7IEFs
ZXggSHVuZzsgQmVuCj4gPiBTa2VnZ3M7IERhdmUgQWlybGllCj4gPiBTdWJqZWN0OiBSZTogW05v
dXZlYXVdIFtQQVRDSCAxLzddIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9FTSBfT1NJIHN0cmlu
ZyB0bwo+ID4gZW5hYmxlIGRHUFUgZGlyZWN0IG91dHB1dCIKPiA+Cj4gPiBPbiBUaHUsIDE1IEF1
ZyAyMDE5IGF0IDA3OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjg1ODZhNTFlZWE2NjZkNTUzMWJjYWVm
MmY2OGU0YWJiZDg3MjQyYy4KPiA+ID4KPiA+ID4gVGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdl
IGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9lc18gc3VwcG9ydCBpdCBhbmQKPiA+ID4g
aXQgd29ya3Mgd2l0aCBOb3V2ZWF1IGFzIHdlbGwuCj4gPiA+Cj4gPiA+IEFsc28gd2hhdCB3YXMg
dGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVuY2VzIHRvIGFueSBidWdzIGFu
ZCBub3QKPiA+ID4gZXZlbiBleHBsYWluaW5nIGFueSBpc3N1ZSBhdCBhbGwgaXNuJ3QgdGhlIHdh
eSB3ZSBkbyB0aGluZ3MuCj4gPiA+Cj4gPiA+IEFuZCBldmVuIGlmIGl0IG1lYW5zIGEgbXV4ZWQg
ZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8gbWFrZSBpdCB3b3JrIGluc2lkZSB0aGUKPiA+ID4g
ZHJpdmVyLCBub3QgYWRkaW5nIHNvbWUgaGFja3kgd29ya2Fyb3VuZCB0aHJvdWdoIEFDUEkgdHJp
Y2tzLgo+ID4gPgo+ID4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRvIG5v
dCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXkuCj4gPiA+Cj4gPgo+ID4gSSB0
aGluayB0aGUgcmV2ZXJ0cyBzaG91bGQgYmUgbWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRo
ZSBvcmlnaW5hbAo+ID4gcGF0Y2hlcyB3ZW50IGluIHZpYSB0aGVyZSwgYW5kIHdlIHNob3VsZCBn
ZXQgdGhlbSBpbiBhc2FwLgo+ID4KPiA+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgo+ID4gRGF2ZS4KPgo+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJl
IHJlZ3Jlc3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZCB3aXRoIHRoZQo+IGluIHRyZWUg
ZHJpdmVycyBieSByZXZlcnRpbmcgdGhpcy4gIEkgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYW4gYW5z
d2VyIGZvciBhbGwgb2YgdGhvc2UKPiBiZWZvcmUgdGhpcyByZXZlcnQgaXMgYWNjZXB0ZWQuCj4K
PiBSZWdhcmRpbmcgc3lzdGVtcyB3aXRoIEludGVsK05WSURJQSwgd2UnbGwgaGF2ZSB0byB3b3Jr
IHdpdGggcGFydG5lcnMgdG8gY29sbGVjdAo+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFj
dCBvZiByZXZlcnRpbmcgdGhpcy4KPgo+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVtIHdp
dGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJlcyBBTUQgR1BVIHRvIHVzZQo+ICJIeWJyaWQg
R3JhcGhpY3MiIHdoZW4gb24gV2luZG93cyBhbmQgIlBvd2VyIEV4cHJlc3MiIGFuZCAiU3dpdGNo
YWJsZSBHcmFwaGljcyIKPiB3aGVuIG9uIExpbnV4LgoKYW5kIHdoYXQncyBleGFjdGx5IHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAppc3N1ZSBoZXJl
PwoKV2UgYWxyZWFkeSBoYXZlIHRoZSBQUklNRSBvZmZsb2FkaW5nIGluIHBsYWNlIGFuZCBpZiB0
aGF0J3Mgbm90CmVub3VnaCwgd2Ugc2hvdWxkIHdvcmsgb24gZXh0ZW5kaW5nIGl0LCBub3QgYWRk
aW5nIHNvbWUgQUNQSSBiYXNlZAp3b3JrYXJvdW5kcywgYmVjYXVzZSB0aGF0J3MgZXhhY3RseSBo
b3cgdGhhdCBsb29rcyBsaWtlLgoKQWxzbywgd2FzIHRoaXMgZGlzY3Vzc2VkIHdpdGggYW55Ym9k
eSBpbnZvbHZlZCBpbiB0aGUgZHJtIHN1YnN5c3RlbT8KCj4KPiBJIGZlZWwgd2UgbmVlZCBhIGtu
b2IgYW5kL29yIERNSSBkZXRlY3Rpb24gdG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRoYXQgdGhlIEFT
TAo+IG5vcm1hbGx5IHBlcmZvcm1zLgoKV2h5IGRvIHdlIGhhdmUgdG8gZG8gdGhhdCBvbiBhIGZp
cm13YXJlIGxldmVsIGF0IGFsbD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
