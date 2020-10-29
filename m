Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AEF29F0B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992ED6E8C4;
	Thu, 29 Oct 2020 16:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C515C6E8B4;
 Thu, 29 Oct 2020 16:01:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22838702-1500050 for multiple; Thu, 29 Oct 2020 16:01:25 +0000
MIME-Version: 1.0
In-Reply-To: <20201029140746.GD6112@intel.com>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
 <20201029140746.GD6112@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm: Silence zero EDID carping
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date: Thu, 29 Oct 2020 16:01:23 +0000
Message-ID: <160398728309.7048.13594460258034679908@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMjAtMTAtMjkgMTQ6MDc6NDYpCj4gT24gVGh1LCBP
Y3QgMjksIDIwMjAgYXQgMTE6MDA6MzBBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
V2UgaGF2ZSBhIGZldyBkaXNwbGF5cyBpbiBDSSB0aGF0IGFsd2F5cyByZXBvcnQgdGhlaXIgRURJ
RCBhcyBhIGJ1bmNoIG9mCj4gPiB6ZXJvZXMuIFRoaXMgaXMgY29uc2lzdGVudCBiZWhhdmlvdWQs
IHNvIG9uZSBhc3N1bWVzIGludGVudGlvbmFsCj4gPiBpbmRpY2F0aW9uIG9mIGFuICJhYnNlbnQi
IEVESUQuIExldCB1cyB0cmVhdCBpcyBhcyBzdWNoIGJ5IHNpbGVudGx5Cj4gPiByZXBvcnRpbmcg
dGhlIHplcm8gZWRpZCB1c2luZyBjb25uZWN0b3ItPm51bGxfZWRpZF9jb3VudGVyLCBsZWF2aW5n
IHRoZQo+ID4gbG91ZCBjYXJwIHRvIEVESUQgdGhhdCB2aW9sYXRlIHRoZWlyIGNoZWNrc3VtcyBv
ciBvdGhlcndpc2UgcmV0dXJuCj4gPiB1bmV4cGVjdGVkIGlsbGVnYWwgZGF0YSB1cG9uIHJlYWRp
bmcuIFRoZXNlIGFyZSBtb3JlIGxpa2VseSB0byBiZQo+ID4gaW5jb25zaXN0ZW50IGJhZCBjb25u
ZWN0aW9ucyByYXRoZXIgdGhhbiBiZWluZyBpbnRlbmRlZC4KPiAKPiBJIGRvbid0IHRoaW5rIG51
bGxfZWRpZF9jb3VudGVyIGlzIGFjdHVhbGx5IHVzZWQgYnkgYW55dGhpbmcuCj4gU28gYXBhcnQg
ZnJvbSB3b25kZXJpbmcgd2h5IHRoZSBtb2RlIGxpc3QgaGFzIHR1cm5lZCBzdHJhbmdlCj4gaXMg
dGhlcmUgc29tZSB3YXkgSSBjYW4gc3RpbGwgc2VlIGZyb20gdGhlIGxvZ3MgdGhhdCB0aGUKPiBF
RElEIGhhcyBiZWNvbWUgYWxsIHplcm9lcz8KClRoZSBvbmVzIGluIHF1ZXN0aW9uLCBpdCdzIGV2
ZXJ5IHRpbWUgd2UgcmVhZCB0aGUgRURJRCBpdCBjb21lcyBiYWNrCnplcm8uIEkgYW0gYmV0dGlu
ZyB0aGF0IHRyYW5zaWVudCBldmVyeXRoaW5nLWlzLXplcm8gcmF0aGVyIHRoYW4Kc3B1cmlvdXMg
ZGF0YSBpcyByYXJlIGVub3VnaCBub3QgdG8gd29ycnkgYWJvdXQuCgpBbiBhbHRlcm5hdGl2ZSB3
b3VsZCBiZSB0byBwYXNzIHRoZSBsb2cgbGV2ZWwgdG8gdGhlIGJhZF9lZGlkIGR1bXBlciwgb3IK
anVzdCBtYWtlIGl0IGRlYnVnIGZvciBldmVuIGdpYmJlcmlzaCBlZGlkcz8KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
