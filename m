Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D76198738
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 00:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4CF6E4C7;
	Mon, 30 Mar 2020 22:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9536E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585606618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFxQ6sa3As6Jtugci2z3HRdxNU4LPCC1zzYUuabLxUU=;
 b=T+AivKsihWBfEzf81uYR3lgay9073n72UnvuNpWxuDKcTzWDeyh1o5rOYVUCiYvGGJ27sA
 tQ/10hC/C7IOOJWKadf09cPMc4Q4J3eP+xBenLmtRD9nR1dgiI35Dm02QRSP3QGXicG7Ua
 dcjGhGGDY9SovvT7rw0DpprsAuF9LH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-L_lh2rRnM8uuiqNlMRll3Q-1; Mon, 30 Mar 2020 18:16:51 -0400
X-MC-Unique: L_lh2rRnM8uuiqNlMRll3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB1A18A5500;
 Mon, 30 Mar 2020 22:16:49 +0000 (UTC)
Received: from elisabeth (unknown [10.36.110.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 180CF5C1BB;
 Mon, 30 Mar 2020 22:16:43 +0000 (UTC)
Date: Tue, 31 Mar 2020 00:16:37 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: fbtft: Replace udelay with
 preferred usleep_range
Message-ID: <20200331001637.6bf108ed@elisabeth>
In-Reply-To: <53befe00af657428b591200b31b5349a4a462eb1.camel@gmail.com>
References: <20200329092204.770405-1-jbwyatt4@gmail.com>
 <alpine.DEB.2.21.2003291127230.2990@hadrien>
 <2fccf96c3754e6319797a10856e438e023f734a7.camel@gmail.com>
 <alpine.DEB.2.21.2003291144460.2990@hadrien>
 <CAMS7mKBEhqFat8fWi=QiFwfLV9+skwi1hE-swg=XxU48zk=_tQ@mail.gmail.com>
 <alpine.DEB.2.21.2003291235590.2990@hadrien>
 <20200330194043.56c79bb8@elisabeth>
 <53befe00af657428b591200b31b5349a4a462eb1.camel@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@inria.fr>,
 outreachy-kernel@googlegroups.com,
 Payal Kshirsagar <payal.s.kshirsagar.98@gmail.com>,
 Soumyajit Deb <debsoumyajit100@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzMCBNYXIgMjAyMCAxNTowMzo1NSAtMDcwMAoiSm9obiBCLiBXeWF0dCBJViIgPGpi
d3lhdHQ0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgMjAyMC0wMy0zMCBhdCAxOTo0MCAr
MDIwMCwgU3RlZmFubyBCcml2aW8gd3JvdGU6Cj4gPiBPbiBTdW4sIDI5IE1hciAyMDIwIDEyOjM3
OjE4ICswMjAwIChDRVNUKQo+ID4gSnVsaWEgTGF3YWxsIDxqdWxpYS5sYXdhbGxAaW5yaWEuZnI+
IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gU3VuLCAyOSBNYXIgMjAyMCwgU291bXlhaml0IERlYiB3
cm90ZToKPiA+ID4gICAKPiA+ID4gPiBJIGhhZCB0aGUgc2FtZSBkb3VidCB0aGUgb3RoZXIgZGF5
IGFib3V0IHRoZSByZXBsYWNlbWVudCBvZgo+ID4gPiA+IHVkZWxheSgpIHdpdGgKPiA+ID4gPiB1
c2xlZXBfcmFuZ2UoKS4gVGhlIGNvcnJlc3BvbmRpbmcgcmFuZ2UgZm9yIHRoZSBzaW5nbGUgYXJn
dW1lbnQKPiA+ID4gPiB2YWx1ZSBvZgo+ID4gPiA+IHVkZWxheSgpIGlzIHF1aXRlIGNvbmZ1c2lu
ZyBhcyBJIGNvdWxkbid0IGRlY2lkZSB0aGUgcmFuZ2UuIEJ1dAo+ID4gPiA+IGFzIG11Y2ggYXMg
SQo+ID4gPiA+IG5vdGljZWQgY2hlY2twYXRjaC5wbCBnaXZlcyB3YXJuaW5nIGZvciByZXBsYWNp
bmcgdWRlbGF5KCkgd2l0aAo+ID4gPiA+IHVzbGVlcF9yYW5nZSgpIGJ5IGNoZWNraW5nIHRoZSBh
cmd1bWVudCB2YWx1ZSBvZiB1ZGVsYXkoKS4gSW4gdGhlCj4gPiA+ID4gZG9jdW1lbnRhdGlvbiwg
aXQgaXMgd3JpdHRlbiB1ZGVsYXkoKSBzaG91bGQgYmUgdXNlZCBmb3IgYSBzbGVlcAo+ID4gPiA+
IHRpbWUgb2YgYXQKPiA+ID4gPiBtb3N0IDEwIG1pY3Jvc2Vjb25kcyBidXQgYmV0d2VlbiAxMCBt
aWNyb3NlY29uZHMgYW5kIDIwCj4gPiA+ID4gbWlsbGlzZWNvbmRzLAo+ID4gPiA+IHVzbGVlcF9y
YW5nZSgpIHNob3VsZCBiZSB1c2VkLiAKPiA+ID4gPiBJIHRoaW5rIHRoZSByYW5nZSBpcyBjb2Rl
IHNwZWNpZmljIGFuZCB3aWxsIGRlcGVuZCBvbiB3aGF0IHJhbmdlCj4gPiA+ID4gaXMKPiA+ID4g
PiBhY2NlcHRhYmxlIGFuZCBkb2Vzbid0IGJyZWFrIHRoZSBjb2RlLgo+ID4gPiA+ICBQbGVhc2Ug
Y29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLiAgICAKPiA+ID4gCj4gPiA+IFRoZSByYW5nZSBkZXBl
bmRzIG9uIHRoZSBhc3NvY2lhdGVkIGhhcmR3YXJlLiAgCj4gPiAKPiA+IEpvaG4sIGJ5IHRoZSB3
YXksIGhlcmUgeW91IGNvdWxkIGhhdmUgY2hlY2tlZCB0aGUgZGF0YXNoZWV0IG9mIHRoaXMKPiA+
IExDRAo+ID4gY29udHJvbGxlci4gSXQncyBhIHBhaXIgb2YgdGhvc2U6Cj4gPiAJaHR0cHM6Ly93
d3cuc3BhcmtmdW4uY29tL2RhdGFzaGVldHMvTENEL2tzMDEwOGIucGRmCj4gCj4gTm8gSSBoYXZl
IG5vdC4gVGhpcyBkYXRhc2hlZXQgaXMgYSBsaXR0bGUgb3ZlciBteSBoZWFkIGhvbmVzdGx5Lgo+
IAo+IFdoYXQgd291bGQgeW91IHJlY29tbWVuZCB0byBnZXQgZmFtaWxpYXIgd2l0aCBkYXRhc2hl
ZXRzIGxpa2UgdGhpcz8KCldlbGwsIHlvdSBkb24ndCBuZWNlc3NhcmlseSBoYXZlIHRvLCB0aGVy
ZSBhcmUgbWFueSBzdWJzeXN0ZW1zIGluIHRoZQprZXJuZWwgd2hpY2ggYXJlIGFsbW9zdCBjb21w
bGV0ZWx5IGFic3RyYWN0ZWQgYXdheSBmcm9tIGhhcmR3YXJlLgoKSWYgeW91J3JlIGludGVyZXN0
ZWQsIGxvb2sgYXJvdW5kIHlvdXJzZWxmIGZvciBzb21ldGhpbmcgc2ltcGxlIGNoaXAsCm9yIGdl
dCBzb21ldGhpbmcgdGhhdCB5b3UgY2FuIGVhc2lseSBwbHVnIG9uIGEgIm1ha2VyIGJvYXJkIiwg
UmFzcGJlcnJ5ClBpLCBzb21ldGhpbmcgbGlrZSB0aGF0LiBQZXJoYXBzIHZpYSBJwrJDIG9yIFNQ
SS4KClNvbWUgdHlwZXMgb2Ygc2Vuc29ycyAodGVtcGVyYXR1cmUsIHByZXNzdXJlKSBoYXZlIHZl
cnkgc2ltcGxlCmRhdGFzaGVldHMuIElmIHlvdSBhcmUgYWxsZXJnaWMgdG8gaGFyZHdhcmUsIHRy
eToKCSQgbHMgLVNzbCBkcml2ZXJzL2lpby8qCgpwaWNrIHRoZSBzbWFsbGVzdCBzZW5zb3IgZHJp
dmVyIGluIHRoZSBjYXRlZ29yeSB0aGF0IGlzIHRoZSBtb3N0IGxpa2VseQp0byBzcGFyayB5b3Vy
IGludGVyZXN0LCBhbmQgZ28gdGhyb3VnaCBpdCwgY2hlY2tpbmcgaXQgYWdhaW5zdCB0aGUKZGF0
YXNoZWV0LCBhdCBzb21lIHBvaW50IGl0IHdpbGwgbWFrZSBzZW5zZS4KCi0tIApTdGVmYW5vCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
