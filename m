Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB30479C2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 07:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92089166;
	Mon, 17 Jun 2019 05:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FE689166
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 05:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D02C83F45;
 Mon, 17 Jun 2019 05:45:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 031907BE7A;
 Mon, 17 Jun 2019 05:45:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB88B11AAF; Mon, 17 Jun 2019 07:45:00 +0200 (CEST)
Date: Mon, 17 Jun 2019 07:45:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [EXTERNAL] Re: [PATCH 1/1] drm/bochs: Fix connector leak during
 driver unload
Message-ID: <20190617054500.73am3e5yv5uzpga7@sirius.home.kraxel.org>
References: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
 <20190521081029.dexgf7e7d3b7wxdw@sirius.home.kraxel.org>
 <20190617012033.GA1151@tungsten.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617012033.GA1151@tungsten.ozlabs.ibm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 05:45:05 +0000 (UTC)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTE6MjA6MzRBTSArMTAwMCwgU2FtIEJvYnJvZmYgd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTA6MTA6MjlBTSArMDIwMCwgR2VyZCBIb2Zm
bWFubiB3cm90ZToKPiA+ICAgSGksCj4gPiAKPiA+IFRoZSBidWcgaXMgaW4gdGhlIGRyaXZlciwg
c28gLi4uCj4gPiAKPiA+ID4gQmlzZWN0aW5nIHRoZSBpc3N1ZSBmb3IgY29tbWl0cyB0byBkcml2
ZXJzL2dwdS9kcm0vYm9jaHMvIHBvaW50cyB0bzoKPiA+ID4gNjU3OWMzOTU5NGFlICgiZHJtL2Jv
Y2hzOiBhdG9taWM6IHN3aXRjaCBwbGFuZXMgdG8gYXRvbWljLCB3aXJlIHVwIGhlbHBlcnMuIikK
PiA+ID4gLi4uIGJ1dCB0aGUgaXNzdWUgYWxzbyBzZWVtcyB0byBiZSBkdWUgdG8gYSBjaGFuZ2Ug
aW4gdGhlIGdlbmVyaWMgZHJtIGNvZGUKPiA+IAo+ID4gLi4uIHRoaXMgb25lIGlzIHRoZSBjdWxw
cml0IGFuZCBzaG91bGQgYmUgbGlzdGVkLgo+ID4gCj4gPiA+IChyZXZlcnRpbmcgaXQgc2VwYXJh
dGVseSBmaXhlcyB0aGUgaXNzdWUpOgo+ID4gPiA4NDZjN2RmYzExOTMgKCJkcm0vYXRvbWljOiBU
cnkgdG8gcHJlc2VydmUgdGhlIGNydGMgZW5hYmxlZCBzdGF0ZSBpbiBkcm1fYXRvbWljX3JlbW92
ZV9mYiwgdjIuIikKPiA+ID4gLi4uIHNvIEkndmUgaW5jbHVkZWQgYm90aCBpbiB0aGUgY29tbWl0
LiAgSXMgdGhhdCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8/Cj4gPiAKPiA+IFRoYXQgb25seSB0cmln
Z2VycyB0aGUgZHJpdmVyIGJ1Zy4KPiA+IAo+ID4gSSdsbCBmaXggaXQgdXAgb24gY29tbWl0LAo+
ID4gICBHZXJkCj4gCj4gU29ycnkgaWYgSSBtaXN1bmRlcnN0b29kLCBidXQgd2VyZSB5b3UgZ29p
bmcgdG8gdGFrZSB0aGUgcGF0Y2ggYW5kIGZpeAo+IGl0IHVwIG9yIHdvdWxkIHlvdSBsaWtlIG1l
IHRvIHBvc3QgYSB2Mj8KClBhdGNoIGlzIGluIGRybS1taXNjLW5leHQsIEkgZml4ZWQgaXQgb24g
Y29tbWl0LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
