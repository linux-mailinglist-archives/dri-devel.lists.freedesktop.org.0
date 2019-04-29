Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5400DD37
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10E589225;
	Mon, 29 Apr 2019 07:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4AD8921E;
 Mon, 29 Apr 2019 07:54:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5AD6F309266F;
 Mon, 29 Apr 2019 07:54:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D21FD600C2;
 Mon, 29 Apr 2019 07:54:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F157311AAA; Mon, 29 Apr 2019 09:54:13 +0200 (CEST)
Date: Mon, 29 Apr 2019 09:54:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
 callbacks"
Message-ID: <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
References: <20190426053324.26443-1-kraxel@redhat.com>
 <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 29 Apr 2019 07:54:15 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, David Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDQ6MjE6MzdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCA3OjMzIEFNIEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGY0YzM0
YjFlMmEzN2Q1Njc2MTgwOTAxZmE2ZmYxODhiY2I2MzcxZjguCj4gPgo+ID4gU2ltbGlhciB0byBj
b21taXQgYTBjZWNjMjNjZmNiIFJldmVydCAiZHJtL3ZpcnRpbzogZHJvcCBwcmltZQo+ID4gaW1w
b3J0L2V4cG9ydCBjYWxsYmFja3MiLiAgV2UgaGF2ZSB0byBkbyB0aGUgc2FtZSB3aXRoIHF4bCwK
PiA+IGZvciB0aGUgc2FtZSByZWFzb25zIChpdCBicmVha3MgRFJJMykuCj4gPgo+ID4gRHJvcCB0
aGUgV0FSTl9PTl9PTkNFKCkuCj4gPgo+ID4gRml4ZXM6IGY0YzM0YjFlMmEzN2Q1Njc2MTgwOTAx
ZmE2ZmYxODhiY2I2MzcxZjgKPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgo+IAo+IE1heWJlIHdlIG5lZWQgc29tZSBoZWxwZXJzIGZvciB2aXJ0dWFs
IGRyaXZlcnMgd2hpY2ggb25seSBhbGxvdwo+IHNlbGYtcmVpbXBvcnQgYW5kIG5vdGhpbmcgZWxz
ZSBhdCBhbGw/CgpUaGUgY3VycmVudCBnZW0gcHJpbWUgaGVscGVycyBoYW5kbGUgdGhpcyByZWFz
b25hYmxlIHdlbGwsCkkgZG9uJ3Qgc2VlIGEgbmVlZCBmb3IgdGhhdC4KCk1vcmUgdXNlZnVsIHdv
dWxkIGJlIHNvbWUgd2F5IHRvIHNpZ25hbCB0aGlzIHNlbGYtcmVpbXBvcnQgY2FwYWJpbGl0eQp0
byB1c2Vyc3BhY2Ugc29tZWhvdy4gIFNlZSBEUk1fUFJJTUVfQ0FQX0xPQ0FMIHBhdGNoLgoKUmln
aHQgbm93IEkgaGF2ZSB0aGUgY2hvaWNlIHRvIHNldCBEUk1fUFJJTUVfQ0FQX3tJTVBPUlQsRVhQ
T1JUfSwgaW4Kd2hpY2ggY2FzZSBzb21lIHVzZXJzcGFjZSBhc3N1bWVzIGl0IGNhbiBkbyBjcm9z
cy1kcml2ZXIgZXhwb3J0L2ltcG9ydAphbmQgdHJpcHMgb3ZlciB0aGF0IG5vdCB3b3JraW5nLiAg
T3IgSSBkbyBub3Qgc2V0CkRSTV9QUklNRV9DQVBfe0lNUE9SVCxFWFBPUlR9LCB3aGljaCBicmVh
a3MgRFJJMyAuLi4KCj4gSSB0aGluayB0aGVyZSdzIHF4bCwgdmlyZ2wsCgpleHBvcnQgaXMgaW1w
bGVtZW50ZWQgZm9yIHZpcmdsLCBhbmQgaW1wb3J0IHNob3VsZCBiZSBwb3NzaWJsZSB0b28uCgpx
eGwvYm9jaHMgaXMgc2ltbGlhciB0byB2bWdmeCwgaXQgY291bGQgYmUgZG9uZSBidXQgZG1hLWJ1
ZnMgd291bGQKYmFzaWNhbGx5IGJlIGJvdW5jZSBidWZmZXJzIChuZWVkIGNvcHkgZnJvbS90byB2
cmFtKSBzbyBwcm9iYWJseSBub3QKd29ydGggdGhlIGVmZm9ydC4KCmNoZWVycywKICBHZXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
