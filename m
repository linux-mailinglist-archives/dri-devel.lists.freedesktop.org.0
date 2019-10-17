Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DE0DAE4A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71EC6EA9B;
	Thu, 17 Oct 2019 13:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE70D6EA96;
 Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8C30A10F0E;
 Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B52C1001B28;
 Thu, 17 Oct 2019 13:26:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AA7C4998A; Thu, 17 Oct 2019 15:26:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/qxl: drop verify_access
Date: Thu, 17 Oct 2019 15:26:36 +0200
Message-Id: <20191017132638.9693-4-kraxel@redhat.com>
In-Reply-To: <20191017132638.9693-1-kraxel@redhat.com>
References: <20191017132638.9693-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
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
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIHwgOSAtLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMK
aW5kZXggNjI5YWM4ZTc3YTIxLi41NGNjNWE1YjYwN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCkBA
IC0xMTAsMTQgKzExMCw2IEBAIHN0YXRpYyB2b2lkIHF4bF9ldmljdF9mbGFncyhzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvLAogCSpwbGFjZW1lbnQgPSBxYm8tPnBsYWNlbWVudDsKIH0KIAot
c3RhdGljIGludCBxeGxfdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LCBzdHJ1Y3QgZmlsZSAqZmlscCkKLXsKLQlzdHJ1Y3QgcXhsX2JvICpxYm8gPSB0b19xeGxfYm8o
Ym8pOwotCi0JcmV0dXJuIGRybV92bWFfbm9kZV92ZXJpZnlfYWNjZXNzKCZxYm8tPnRiby5iYXNl
LnZtYV9ub2RlLAotCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7Ci19Ci0KIHN0YXRpYyBpbnQg
cXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCQkg
IHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQogewpAQCAtMjY5LDcgKzI2MSw2IEBAIHN0YXRpYyBz
dHJ1Y3QgdHRtX2JvX2RyaXZlciBxeGxfYm9fZHJpdmVyID0gewogCS5ldmljdGlvbl92YWx1YWJs
ZSA9IHR0bV9ib19ldmljdGlvbl92YWx1YWJsZSwKIAkuZXZpY3RfZmxhZ3MgPSAmcXhsX2V2aWN0
X2ZsYWdzLAogCS5tb3ZlID0gJnF4bF9ib19tb3ZlLAotCS52ZXJpZnlfYWNjZXNzID0gJnF4bF92
ZXJpZnlfYWNjZXNzLAogCS5pb19tZW1fcmVzZXJ2ZSA9ICZxeGxfdHRtX2lvX21lbV9yZXNlcnZl
LAogCS5pb19tZW1fZnJlZSA9ICZxeGxfdHRtX2lvX21lbV9mcmVlLAogCS5tb3ZlX25vdGlmeSA9
ICZxeGxfYm9fbW92ZV9ub3RpZnksCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
