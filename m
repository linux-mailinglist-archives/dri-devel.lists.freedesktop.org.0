Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD24C01FF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97236EECE;
	Fri, 27 Sep 2019 09:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961FA6EEC6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16C41AE7F;
 Fri, 27 Sep 2019 09:13:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com,
	sam@ravnborg.org
Subject: [PATCH v3 0/7] drm/mgag200: Place cursor BOs at VRAM high-end
Date: Fri, 27 Sep 2019 11:12:54 +0200
Message-Id: <20190927091301.10574-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KHdhczogZHJtL2FzdC9tZ2FnMjAwOiBQbGFjZSBjdXJzb3IgQk9zIGF0IFZSQU0gaGlnaC1lbmQp
CgpUaGlzIHBhdGNoc2V0IGNsZWFucyB1cCB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgb2YgSFcgY3Vy
c29ycyBpbiBtZ2FnMjAwLiBJdApmdXJ0aGVyIG1vdmVzIHRoZSBhbGxvY2F0ZWQgY3Vyc29yIEJP
cyB0byB0aGUgb2YgdGhlIHZpZGVvIFJBTSB0byByZWR1Y2UKbWVtb3J5IGZyYWdtZW50YXRpb24u
CgpUaGUgbWdhZzIwMCBkcml2ZXIgbWFuYWdlcyBjdXJzb3IgbWVtb3J5IGluIGRlZGljYXRlZCBH
RU0gVlJBTSBidWZmZXIKb2JqZWN0cy4gSXQgdXNlcyBhIGRvdWJsZS1idWZmZXJpbmcgc2NoZW1l
IG9mIGFsdGVybmF0aW5nIGJldHdlZW4gdHdvIEdFTQpCT3MgVGhlIGNvZGUgaXMgY29udm9sdXRl
ZCBhbmQgY2FuIGxlYWQgdG8gbWVtb3J5IGZyYWdtZW50YXRpb24gaWYgYSBCTwppcyBzdG9yZWQg
dGhlIG1pZGRsZSBvZiBWUkFNLiBUaGlzIGlzIGVzcGVjaWFsbHkgYSBwcm9ibGVtIGFzIG1nYWcy
MDAKZGV2aWNlcyBvbmx5IGNvbnRhaW4gYSBzbWFsbCBhbW91bnQgb2YgdmlkZW8gbWVtb3J5IChl
LmcuLCAxNiBNaUIpLgoKV2l0aCB0aGlzIHBhdGNoc2V0LCB0aGUgY3Vyc29yIGhhbmRsaW5nIGlu
IG1nYWcyMDAgaXMgZmlyc3Qgc3BsaXQgdXAgaW50bwpzZXBhcmF0ZSBmdW5jdGlvbnMgZm9yIGNv
cHlpbmcgY3Vyc29yIGltYWdlcywgbWFuYWdpbmcgYnVmZmVyIG9iamVjdHMsCnNldHRpbmcgc2Nh
bm91dCBhZGRyZXNzZXMsIGFuZCBtb3ZpbmcgYW5kIGhpZGluZyB0aGUgY3Vyc29yLiBGdXJ0aGVy
bW9yZSwKdGhlIGRyaXZlciBkZWRpY2F0ZXMgYSBmZXcgS2lCIGF0IHRoZSBoaWdoIGVuZCBvZiBh
IGRldmljZSdzIHZpZGVvIG1lbW9yeQp0byBzdG9yaW5nIHRoZSBjdXJzb3IncyBidWZmZXIgb2Jq
ZWN0cy4gVGhpcyBwcmV2ZW50cyBtZW1vcnkgZnJhZ21lbnRhdGlvbi4KClRoZSBwYXRjaHNldCBo
YXMgYmVlbiB0ZXN0ZWQgb24gbWdhZzIwMCBoYXJkd2FyZS4KCnYzOgoJKiBzcGxpdC1vZmYgbWdh
ZzIwMCBwYXRjaGVzIGludG8gc2VwYXJhdGUgc2VyaWVzCnYyOgoJKiByZW1vdmUgVlJBTSBidWZm
ZXJzIGluIGZhdm9yIG9mIEdFTSBCT3MKCSogbWFuYWdlIEJPIHBsYWNlbWVudCB3aXRoIHBpbiBm
bGFnCgpUaG9tYXMgWmltbWVybWFubiAoNyk6CiAgZHJtL21nYWcyMDA6IFJlbmFtZSBjdXJzb3Ig
ZnVuY3Rpb25zIHRvIHVzZSBtZ2FnMjAwXyBwcmVmaXgKICBkcm0vbWdhZzIwMDogQWRkIGluaXQg
YW5kIGZpbmkgZnVuY3Rpb25zIGZvciBjdXJzb3IgaGFuZGxpbmcKICBkcm0vbWdhZzIwMDogQWRk
IHNlcGFyYXRlIG1vdmUtY3Vyc29yIGZ1bmN0aW9uCiAgZHJtL21nYWcyMDA6IE1vdmUgY3Vyc29y
LWltYWdlIHVwZGF0ZSB0byBtZ2FnMjAwX3Nob3dfY3Vyc29yKCkKICBkcm0vbWdhZzIwMDogTW92
ZSBjdXJzb3IgQk8gc3dhcHBpbmcgaW50byBtZ2FnMjAwX3Nob3dfY3Vyc29yKCkKICBkcm0vbWdh
ZzIwMDogUmVzZXJ2ZSB2aWRlbyBtZW1vcnkgZm9yIGN1cnNvciBwbGFuZQogIGRybS9tZ2FnMjAw
OiBBbGxvY2F0ZSBjdXJzb3IgQk9zIGF0IGhpZ2ggZW5kIG9mIHZpZGVvIG1lbW9yeQoKIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCAzMTMgKysrKysrKysrKysrKyst
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmggICAgfCAgMjIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jICAgfCAgMjAgKy0KIGRy
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jICAgfCAgIDYgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfdHRtLmMgICAgfCAgIDQgKwogNSBmaWxlcyBjaGFuZ2Vk
LCAyMTYgaW5zZXJ0aW9ucygrKSwgMTQ5IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
