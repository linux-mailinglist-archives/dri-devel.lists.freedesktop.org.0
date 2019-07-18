Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB66C480
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14E66E2DA;
	Thu, 18 Jul 2019 01:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720BC6E2DC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0403483F51;
 Thu, 18 Jul 2019 01:44:49 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7728219C67;
 Thu, 18 Jul 2019 01:44:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/26] drm/dp_mst: Remove lies in {up,
 down}_rep_recv documentation
Date: Wed, 17 Jul 2019 21:42:40 -0400
Message-Id: <20190718014329.8107-18-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 18 Jul 2019 01:44:49 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIG1vc3QgY2VydGFpbmx5IGFjY2Vzc2VkIGZyb20gZmFyIG1vcmUgdGhhbiB0aGUg
bWdyIHdvcmsuIEluCmZhY3QsIHVwX3JlcV9yZWN2IGlzIC1vbmx5LSBldmVyIGFjY2Vzc2VkIGZy
b20gb3V0c2lkZSB0aGUgbWdyIHdvcmsuCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwu
Y29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
d2VudGxhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggfCA4ICsrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBf
bXN0X2hlbHBlci5oCmluZGV4IGY3MDRkMjE3YzllMC4uOGUwNGExYmQyZTlkIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9k
cF9tc3RfaGVscGVyLmgKQEAgLTQ4OSwxNSArNDg5LDExIEBAIHN0cnVjdCBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21nciB7CiAJaW50IGNvbm5fYmFzZV9pZDsKIAogCS8qKgotCSAqIEBkb3duX3JlcF9y
ZWN2OiBNZXNzYWdlIHJlY2VpdmVyIHN0YXRlIGZvciBkb3duIHJlcGxpZXMuIFRoaXMgYW5kCi0J
ICogQHVwX3JlcV9yZWN2IGFyZSBvbmx5IGV2ZXIgYWNjZXNzIGZyb20gdGhlIHdvcmsgaXRlbSwg
d2hpY2ggaXMKLQkgKiBzZXJpYWxpc2VkLgorCSAqIEBkb3duX3JlcF9yZWN2OiBNZXNzYWdlIHJl
Y2VpdmVyIHN0YXRlIGZvciBkb3duIHJlcGxpZXMuCiAJICovCiAJc3RydWN0IGRybV9kcF9zaWRl
YmFuZF9tc2dfcnggZG93bl9yZXBfcmVjdjsKIAkvKioKLQkgKiBAdXBfcmVxX3JlY3Y6IE1lc3Nh
Z2UgcmVjZWl2ZXIgc3RhdGUgZm9yIHVwIHJlcXVlc3RzLiBUaGlzIGFuZAotCSAqIEBkb3duX3Jl
cF9yZWN2IGFyZSBvbmx5IGV2ZXIgYWNjZXNzIGZyb20gdGhlIHdvcmsgaXRlbSwgd2hpY2ggaXMK
LQkgKiBzZXJpYWxpc2VkLgorCSAqIEB1cF9yZXFfcmVjdjogTWVzc2FnZSByZWNlaXZlciBzdGF0
ZSBmb3IgdXAgcmVxdWVzdHMuCiAJICovCiAJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcngg
dXBfcmVxX3JlY3Y7CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
