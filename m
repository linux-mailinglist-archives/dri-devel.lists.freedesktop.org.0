Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CB4D0BA0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF0B6E951;
	Wed,  9 Oct 2019 09:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8B276E951
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:45:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F6021000;
 Wed,  9 Oct 2019 02:45:03 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61D243F68E;
 Wed,  9 Oct 2019 02:45:02 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 2/2] drm/panfrost: Remove commented out call to
 panfrost_core_dump
Date: Wed,  9 Oct 2019 10:44:56 +0100
Message-Id: <20191009094456.9704-2-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191009094456.9704-1-steven.price@arm.com>
References: <20191009094456.9704-1-steven.price@arm.com>
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
Cc: linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGFuZnJvc3RfY29yZV9kdW1wKCkgaGFzIG5ldmVyIGV4aXN0ZWQgaW4gbWFpbmxpbmUsIHNvIHJl
bW92ZSBpdCBhbmQgYWRkCmEgVE9ETyBlbnRyeSB0aGF0IGNvcmUgZHVtcCBzdXBwb3J0IGlzIGN1
cnJlbnRseSBsYWNraW5nLgoKU2lnbmVkLW9mZi1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4KLS0tCnYyOgogKiBOZXcgcGF0Y2gKCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvVE9ETyAgICAgICAgICAgfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3Rfam9iLmMgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPCmluZGV4IDUzNmEwZDRmOGQyOS4uOGM4MTFhOWU2
ODNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETwpAQCAtMTAsMyArMTAsNSBAQAogCiAtIENvbXB1dGUg
am9iIHN1cHBvcnQuIFNvIGNhbGxlZCAnY29tcHV0ZSBvbmx5JyBqb2JzIG5lZWQgdG8gYmUgcGx1
bWJlZCB1cCB0bwogICB1c2Vyc3BhY2UuCisKKy0gU3VwcG9ydCBjb3JlIGR1bXAgb24gam9iIGZh
aWx1cmUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwppbmRleCAyMWYzNGQ0
NGFhYzIuLjMzYmYyNWJhNTA2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9q
b2IuYwpAQCAtNDA0LDggKzQwNCw2IEBAIHN0YXRpYyB2b2lkIHBhbmZyb3N0X2pvYl90aW1lZG91
dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCX0KIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZwZmRldi0+anMtPmpvYl9sb2NrLCBmbGFncyk7CiAKLQkvKiBwYW5mcm9zdF9jb3Jl
X2R1bXAocGZkZXYpOyAqLwotCiAJcGFuZnJvc3RfZGV2ZnJlcV9yZWNvcmRfdHJhbnNpdGlvbihw
ZmRldiwganMpOwogCXBhbmZyb3N0X2RldmljZV9yZXNldChwZmRldik7CiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
