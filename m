Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B2AD609
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 11:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CC89ADC;
	Mon,  9 Sep 2019 09:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628B189ADC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 09:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E133E9B29A;
 Mon,  9 Sep 2019 09:47:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
 [10.36.117.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7066061E;
 Mon,  9 Sep 2019 09:47:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D806816E19; Mon,  9 Sep 2019 11:47:46 +0200 (CEST)
Date: Mon, 9 Sep 2019 11:47:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/4] Implement lazy unmapping for GEM VRAM buffers
Message-ID: <20190909094746.o5q6iiu6gnaogsvl@sirius.home.kraxel.org>
References: <20190906122056.32018-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906122056.32018-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 09 Sep 2019 09:47:49 +0000 (UTC)
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 ying.huang@intel.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDI6MjA6NTJQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gR2VuZXJpYyBmYmRldiBlbXVsYXRpb24gbWFwcyBhbmQgdW5tYXBzIHRoZSBj
b25zb2xlIEJPIGZvciB1cGRhdGluZyBpdCdzCj4gY29udGVudCBmcm9tIHRoZSBzaGFkb3cgYnVm
ZmVyLiBJZiB0aGlzIGludm9sdmVzIGFuIGFjdHVhbCBtYXBwaW5nCj4gb3BlcmF0aW9uIChpbnN0
ZWFkIG9mIHJldXNpbmcgYW4gZXhpc3RpbmcgbWFwcGluZyksIGxvdHMgb2YgZGVidWcgbWVzc2Fn
ZXMKPiBtYXkgYmUgcHJpbnRlZCwgc3VjaCBhcwo+IAo+ICAgeDg2L1BBVDogT3ZlcmxhcCBhdCAw
eGQwMDAwMDAwLTB4ZDEwMDAwMDAKPiAgIHg4Ni9QQVQ6IHJlc2VydmVfbWVtdHlwZSBhZGRlZCBb
bWVtIDB4ZDAwMDAwMDAtMHhkMDJmZmZmZl0sIHRyYWNrIHdyaXRlLWNvbWJpbmluZywgcmVxIHdy
aXRlLWNvbWJpbmluZywgcmV0IHdyaXRlLWNvbWJpbmluZwo+ICAgeDg2L1BBVDogZnJlZV9tZW10
eXBlIHJlcXVlc3QgW21lbSAweGQwMDAwMDAwLTB4ZDAyZmZmZmZdCj4gCj4gYXMgcmVwb3J0ZWQg
YXQgWzFdLiBEcml2ZXJzIHVzaW5nIFZSQU0gaGVscGVycyBtYXkgYWxzbyBzZWUgcmVkdWNlZAo+
IHBlcmZvcm1hbmNlIGFzIHRoZSBtYXBwaW5nIG9wZXJhdGlvbnMgY2FuIGNyZWF0ZSBvdmVyaGVh
ZC4KPiAKPiBJbiB2MyBhbmQgbGF0ZXIgb2YgdGhlIHBhdGNoIHNldCwgdGhpcyBwcm9ibGVtIGlz
IGJlaW5nIHNvbHZlZCBieSBsYXppbHkKPiB1bm1hcHBpbmcgdGhlIGJ1ZmZlciBhcyBzdWdnZXN0
ZWQgYnkgR2VyZC4gVW5tYXBwaW5nIHdpdGggZHJtX2dlbV92cmFtX2t1bm1hcCgpCj4gb25seSBj
aGFuZ2VzIGEgcmVmZXJlbmNlIGNvdW50ZXIuIFZSQU0gaGVscGVycyBsYXRlciBwZXJmb3JtIHRo
ZSB1bm1hcHBpbmcKPiBvcGVyYXRpb24gd2hlbiBUVE0gZXZpY3RzIHRoZSBidWZmZXIgb2JqZWN0
IGZyb20gaXRzIGN1cnJlbnQgbG9jYXRpb24uIElmCj4gdGhlIGJ1ZmZlciBpcyBuZXZlciBldmlj
dGVkLCB0aGUgZXhpc3RpbmcgbWFwcGluZyBpcyByZXVzZWQgYnkgbGF0ZXIgY2FsbHMKPiB0byBk
cm1fZ2VtX3ZyYW1fa21hcCgpLgo+IAo+IHY0Ogo+IAkqIGxvY2sga21hcCB3aXRoIHR0bV9ib19y
ZXNlcnZlKCkKPiAJKiBhY3F1aXJlIGxvY2sgb25seSBvbmNlIGZvciB2bWFwKCkKPiAJKiB3YXJu
IGFib3V0IHN0YWxlIG1hcHBpbmdzIGR1cmluZyBidWZmZXIgY2xlYW51cAo+IHYzOgo+ICAgICAg
IAkqIGltcGxlbWVudCBsYXp5IHVubWFwcGluZwo+IHYyOgo+IAkqIGZpeGVkIGNvbW1lbnQgdHlw
b3MKPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRl
dmVsLzIwMTktU2VwdGVtYmVyLzIzNDMwOC5odG1sCj4gCj4gVGhvbWFzIFppbW1lcm1hbm4gKDQp
Ogo+ICAgZHJtL3ZyYW06IEFkZCBrbWFwIHJlZi1jb3VudGluZyB0byBHRU0gVlJBTSBvYmplY3Rz
Cj4gICBkcm0vdnJhbTogQWNxdWlyZSBsb2NrIG9ubHkgb25jZSBwZXIgY2FsbCB0byB2bWFwKCkv
dnVubWFwKCkKPiAgIGRybS92cmFtOiBBZGQgaW5mcmFzdHJ1Y3R1cmUgZm9yIG1vdmVfbm90aWZ5
KCkKPiAgIGRybS92cmFtOiBJbXBsZW1lbnQgbGF6eSB1bm1hcHBpbmcgZm9yIEdFTSBWUkFNIGJ1
ZmZlcnMKClJldmlld2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCmNo
ZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
