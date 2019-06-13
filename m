Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABD434E3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599489872;
	Thu, 13 Jun 2019 09:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D85489872
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:44:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34EFA8046D;
 Thu, 13 Jun 2019 09:44:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D74A52FDE;
 Thu, 13 Jun 2019 09:44:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E80F11AB8; Thu, 13 Jun 2019 11:44:04 +0200 (CEST)
Date: Thu, 13 Jun 2019 11:44:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/9] Remove explicit locking and kmap arguments from
 GEM VRAM interface
Message-ID: <20190613094404.2bk2g7a5pr5uhcvv@sirius.home.kraxel.org>
References: <20190613073041.29350-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613073041.29350-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 13 Jun 2019 09:44:23 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDk6MzA6MzJBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gRHJpdmVycyBzaG91bGQgbm90IGhhdmUgdG8gY2FyZSBhYm91dCBpbnRlcm5h
bCBsb2NraW5nIG9mIEdFTSBWUkFNIG9iamVjdHMKPiBhbmQgdGhlaXIgbWVtb3J5LW1hcHBpbmcg
c3RydWN0dXJlcy4gVGhpcyBwYXRjaCBzZXQgcmVtb3ZlcyBib3RoIGZyb20gdGhlCj4gR0VNIFZS
QU0gaW50ZXJmYWNlLgo+IAo+IFRoaXMgYWZmZWN0cyB0aGUgYXN0IGFuZCBtZ2FnMjAwIGRyaXZl
cnMuIEluIHBsYWNlcyB3aGVyZSBHRU0gb2JqZWN0cyBhcmUKPiBiZWluZyBsb2NrZWQgYnkgdGhl
IGRyaXZlciwgdGhlIHBhdGNoIGNvbnZlcnRzIHRoZSBsb2NrIG9wZXJhdGlvbiB0byBhIHBpbgo+
IG9wZXJhdGlvbi4gVGhlIGxvY2tpbmcgcHJldmVudGVkIHRoZSBtZW1vcnkgbWFuYWdlciBmcm9t
IG1vdmluZyB0aGUgb2JqZWN0LAo+IHNvIHBpbm5pbmcgaXMgbW9yZSBhcHByb3ByaWF0ZS4KPiAK
PiBGb3IgdGhlIG1lbW9yeSBtYXBwaW5ncywgYWxsIGJvb2sta2VlcGluZyBpcyBkb25lIGJ5IHRo
ZSBpbXBsZW1lbnRhdGlvbgo+IG9mIEdFTSBWUkFNLiBFeHBsaWNpdCBrbWFwIG9iamVjdHMgYXJl
IHJlbW92ZWQgZnJvbSB0aGUgbW9kdWxlJ3MgcHVibGljCj4gaW50ZXJmYWNlcy4gVGhpcyBjaGFu
Z2UgbW9zdGx5IGFmZmVjdHMgdGhlIGN1cnNvciBoYW5kbGluZyBpbiBhc3QgYW5kCj4gbWdhZzIw
MCwgd2hpY2ggaXMgYmVpbmcgc2ltcGxpZmllZCBieSB0aGlzIHBhdGNoIHNldC4KPiAKPiBGdXR1
cmUgZGlyZWN0aW9uczogd2l0aCB0aGVzZSBwYXRjaGVzIGluIHBsYWNlLCBtb3JlIGNvZGUgaW4g
bW9kZSBzZXR0aW5nCj4gYW5kIGZiZGV2IGVtdWxhdGlvbiBjYW4gYmUgc2hhcmVkIGJldHdlZW4g
YXN0IGFuZCBtZ2FnMjAwLgo+IAo+IFRoZSBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gYXN0
IGFuZCBtZ2FnMjAwIGhhcmR3YXJlLgo+IAo+IHYzOgo+IAkqIGRvY3VtZW50IFBSSU1FIHBpbiBm
bGFncwo+IAkqIHBpbiBjdXJzb3IgQk9zIGF0IGN1cnJlbnQgbG9jYXRpb24KPiB2MjoKPiAJKiBz
dXBwb3J0IHBpbm5pbmcgQk9zIGF0IGN1cnJlbnQgbG9jYXRpb24KPiAJKiBwaW4gUFJJTUUgYnVm
ZmVycyB0byBjdXJyZW50IGxvY2F0aW9uQQoKc2VyaWVzOgpBY2tlZC1ieTogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
