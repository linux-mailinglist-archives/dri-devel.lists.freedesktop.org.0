Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6E4C74E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12D76E47C;
	Thu, 20 Jun 2019 06:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEED06E47C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:15:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2533A4627A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:15:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CEA7608A5;
 Thu, 20 Jun 2019 06:15:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6279216E19; Thu, 20 Jun 2019 08:15:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: add mmap() to drm_gem_object_funcs
Date: Thu, 20 Jun 2019 08:15:44 +0200
Message-Id: <20190620061547.8664-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 20 Jun 2019 06:15:51 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGNhbGxiYWNrIHdoZXJlIGRyaXZlcnMgY2FuIGhhbmRsZSBtbWFwIHNldHVwCndp
dGhvdXQgaGF2aW5nIHRvIG92ZXJyaWRlIGdlbV9kcml2ZXItPmZvcHMtPm1tYXAuCgpTd2l0Y2gg
c2htZW0gaGVscGVyIG92ZXIgYXMgZGVtby4KCmNoZWVycywKICBHZXJkCgpHZXJkIEhvZmZtYW5u
ICgzKToKICBkcm06IGFkZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MKICBkcm06IHN3
aXRjaCBzaG1lbSBoZWxwZXIgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MtPm1tYXAKICBkcm06IGRy
b3AgREVGSU5FX0RSTV9HRU1fU0hNRU1fRk9QUwoKIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAg
ICAgICAgICAgICAgICB8ICA5ICsrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5oICAgICAgfCAyOCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYyAgICAgICAgICAgICAgIHwgIDQgKysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1faGVscGVyLmMgIHwgMTggKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2Rydi5jIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9nZW0uYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2JvLmMgICAgICAgICAg
ICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2Rydi5jICAgICAgICAgICB8ICAyICst
CiA5IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoKLS0g
CjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
