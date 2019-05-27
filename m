Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E960C2B41B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7A89B78;
	Mon, 27 May 2019 12:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Mon, 27 May 2019 11:31:25 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 332F888E34
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:31:25 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E292C80F3;
 Mon, 27 May 2019 11:21:44 +0000 (UTC)
Date: Mon, 27 May 2019 04:21:22 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190527112122.GJ5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwNTI3IDEwOjUxXToK
PiBIaSwKPiAKPiBPbiAyMy8wNS8yMDE5IDIzOjA3LCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90ZToK
PiA+IEhpLAo+ID4gCj4gPiBIZXJlIGlzIGFub3RoZXIgcm91bmQgb2YgdGhlIERTSSBjb21tYW5k
IG1vZGUgcGFuZWwgcGF0Y2hzZXQKPiA+IGludGVncmF0aW5nIHRoZSBmZWVkYmFjayBmcm9tIFBB
VENIdjUuIFRoZSBwYXRjaGVzIGFyZSBiYXNlZAo+ID4gb24gdjUuMi1yYzEgdGFnLiBJdCBkb2Vz
IG5vdCBjb250YWluIHRoZSBwYXRjaGVzIHJlcXVpcmVkIGZvcgo+ID4gT01BUDMgc3VwcG9ydCAo
aXQgbmVlZHMgYSB3b3JrYXJvdW5kIGZvciBhIGhhcmR3YXJlIGJ1ZykgYW5kCj4gPiBmb3IgYXV0
b21hdGljIGRpc3BsYXkgcm90YXRpb24uIFRoZXkgc2hvdWxkIGdldCB0aGVpciBvd24gc2VyaWVz
LAo+ID4gb25jZSBhZnRlciBldmVyeXRoaW5nIGhhcyBiZWVuIG1vdmVkIHRvIERSTSBwYW5lbCBB
UEkuIEkgdGhpbmsKPiA+IERSTSBwYW5lbCBjb252ZXJzaW9uIHNob3VsZCBoYXBwZW4gX2FmdGVy
XyB0aGlzIHNlcmllcywgc2luY2UKPiA+IG90aGVyd2lzZSB0aGVyZSBpcyBhIGhpZ2ggcmlzayBv
ZiBicmlja2luZyBEU0kgc3VwcG9ydCBjb21wbGV0ZWx5Lgo+ID4gSSBhbHJlYWR5IHN0YXJ0ZWQg
YSBXSVAgYnJhbmNoIGZvciBjb252ZXJ0aW5nIERTSSB0byB0aGUgRFJNIHBhbmVsCj4gPiBBUEkg
b24gdG9wIG9mIHRoaXMgcGF0Y2hzZXQuCj4gCj4gTG9va3MgZ29vZCB0byBtZS4gRm9yIHNvbWUg
cmVhc29uIEkgY2FuJ3QgYm9vdCA1LjItcmMyIChvbiB4MTUpIHNvIEkgaGF2ZW4ndAo+IGJlZW4g
YWJsZSB0byB0ZXN0IHlldC4gSSdsbCBwaWNrIHRoZSBzZXJpZXMgdXAgaW4gYW55IGNhc2UsIGFu
ZCBJJ2xsIHRlc3QgaXQKPiB3aGVuIEkgZ2V0IHRoZSBrZXJuZWwgYm9vdGluZy4KCkdyZWF0IGdv
b2QgdG8gaGF2ZSB0aGVzZSBtZXJnZWQgZmluYWxseSA6KQoKSG1tIEkgd29uZGVyIGlmIHNvbWUg
eDE1IG1vZGVscyBhcmUgYWZmZWN0ZWQgYnkgdGhlIFNvQyB2YXJpYW50CmNoYW5nZXMgcXVldWVk
IGluIG15IGZpeGVzIGJyYW5jaD8KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
