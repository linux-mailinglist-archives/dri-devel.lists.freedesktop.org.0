Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E914E83B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BD76E8A0;
	Fri, 21 Jun 2019 12:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9A46E8A0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:45:49 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1heIvL-0001sG-Tt; Fri, 21 Jun 2019 14:45:47 +0200
Message-ID: <1561121145.3149.7.camel@pengutronix.de>
Subject: Re: linux-next: Fixes tags need some work in the drm-fixes tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Date: Fri, 21 Jun 2019 14:45:45 +0200
In-Reply-To: <20190621214125.6fb68eee@canb.auug.org.au>
References: <20190621214125.6fb68eee@canb.auug.org.au>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA2LTIxIGF0IDIxOjQxICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Ogo+IEhpIGFsbCwKPiAKPiBJbiBjb21taXQKPiAKPiAgIDkxMmJiZjdlOWNhNCAoImdwdTogaXB1
LXYzOiBpbWFnZS1jb252ZXJ0OiBGaXggaW1hZ2UgZG93bnNpemUgY29lZmZpY2llbnRzIikKPiAK
PiBGaXhlcyB0YWcKPiAKPiAgIEZpeGVzOiA3MGI5YjZiM2JjYjIxICgiZ3B1OiBpcHUtdjM6IGlt
YWdlLWNvbnZlcnQ6IGNhbGN1bGF0ZSBwZXItdGlsZQo+IAo+IGhhcyB0aGVzZSBwcm9ibGVtKHMp
Ogo+IAo+ICAgLSBQbGVhc2UgZG9uJ3Qgc3BsaXQgRml4ZXMgdGFncyBhY3Jvc3MgbW9yZSB0aGFu
IG9uZSBsaW5lCj4gCj4gSW4gY29tbWl0Cj4gCj4gICBiY2E0ZDcwY2YxYjggKCJncHU6IGlwdS12
MzogaW1hZ2UtY29udmVydDogRml4IGlucHV0IGJ5dGVzcGVybGluZSBmb3IgcGFja2VkIGZvcm1h
dHMiKQo+IAo+IEZpeGVzIHRhZwo+IAo+ICAgRml4ZXM6IGQ5NjZlMjNkNjFhMmMgKCJncHU6IGlw
dS12MzogaW1hZ2UtY29udmVydDogZml4IGJ5dGVzcGVybGluZQo+IAo+IGhhcyB0aGVzZSBwcm9i
bGVtKHMpOgo+IAo+ICAgLSBQbGVhc2UgZG9uJ3Qgc3BsaXQgRml4ZXMgdGFncyBhY3Jvc3MgbW9y
ZSB0aGFuIG9uZSBsaW5lCj4gCj4gSW4gY29tbWl0Cj4gCj4gICBmZjM5MWVjZDY1YTEgKCJncHU6
IGlwdS12MzogaW1hZ2UtY29udmVydDogRml4IGlucHV0IGJ5dGVzcGVybGluZSB3aWR0aC9oZWln
aHQgYWxpZ24iKQo+IAo+IEZpeGVzIHRhZwo+IAo+ICAgRml4ZXM6IGQ5NjZlMjNkNjFhMmMgKCJn
cHU6IGlwdS12MzogaW1hZ2UtY29udmVydDogZml4IGJ5dGVzcGVybGluZQo+IAo+IGhhcyB0aGVz
ZSBwcm9ibGVtKHMpOgo+IAo+ICAgLSBQbGVhc2UgZG9uJ3Qgc3BsaXQgRml4ZXMgdGFncyBhY3Jv
c3MgbW9yZSB0aGFuIG9uZSBsaW5lCj4gCgpJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0
IGRpbSB3b3VsZCBoYXZlIGZvdW5kIHRob3NlLCBidXQgSSBvbmx5Cmp1c3QgcmVhbGl6ZWQgdGhh
dCAiZGltIGNoZWNrcGF0Y2giIGRvZXNuJ3QgYWN0dWFsbHkgZG8gYW55IGFkZGl0aW9uYWwKY2hl
Y2tzIGJleW9uZCBzY3JpcHRzL2NoZWNrcGF0Y2gucGwuIEZpeGVzIHRhZ3MgYXJlIGNoZWNrZWQg
b25seSBhcyBhCnBhcnQgb2YgImRpbSBwdXNoIi4gSSB3b25kZXIgaWYgdGhpcyBjb3VsZCBiZSBj
aGFuZ2VkIFsxXS4KClsxXSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21haW50
YWluZXItdG9vbHMvbWVyZ2VfcmVxdWVzdHMvNQoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
