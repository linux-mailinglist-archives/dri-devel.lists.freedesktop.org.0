Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04596175B40
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8C6E3EB;
	Mon,  2 Mar 2020 13:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C989C6E2F3;
 Mon,  2 Mar 2020 13:09:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 05:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="319059477"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga001.jf.intel.com with ESMTP; 02 Mar 2020 05:09:26 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Lyude Paul <lyude@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6/9] drm/nouveau: Fix unused variable warning
Date: Mon,  2 Mar 2020 18:26:46 +0530
Message-Id: <20200302125649.61443-7-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bm91dmVhdV9kcm0gcG9pbnRlciBpcyBub3QgZ2V0dGluZyB1c2VkIGFueW1vcmUgaW4KbnY1MF9t
c3RtX3tyZWdpc3RlcixkZXN0cm95fV9jb25uZWN0b3IgZnVuY3Rpb25zLCBoZW5jZSByZW1vdmUg
aXQuCgpUaGlzIGZpeGVzIGJlbG93IHdhcm5pbmcuCgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6IEluIGZ1bmN0aW9uIOKAmG52NTBfbXN0bV9kZXN0cm95X2Nvbm5lY3Rv
cuKAmToKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEyNjM6MjI6IHdh
cm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhkcm3igJkgWy1XdW51c2VkLXZhcmlhYmxlXQogIHN0
cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oY29ubmVjdG9yLT5kZXYpOwogICAg
ICAgICAgICAgICAgICAgICAgXn5+CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYzogSW4gZnVuY3Rpb24g4oCYbnY1MF9tc3RtX3JlZ2lzdGVyX2Nvbm5lY3RvcuKAmToKZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEyNzQ6MjI6IHdhcm5pbmc6IHVu
dXNlZCB2YXJpYWJsZSDigJhkcm3igJkgWy1XdW51c2VkLXZhcmlhYmxlXQogIHN0cnVjdCBub3V2
ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0oY29ubmVjdG9yLT5kZXYpOwogICAgICAgICAgICAg
ICAgICAgICAgXn5+CgpTaWduZWQtb2ZmLWJ5OiBQYW5rYWogQmhhcmFkaXlhIDxwYW5rYWoubGF4
bWluYXJheWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCA5N2RkNTBlMjkx
N2QuLjRlMTY0YWQ4MDAzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YwpAQCAtMTI2MCw3ICsxMjYwLDYgQEAgc3RhdGljIHZvaWQKIG52NTBfbXN0bV9kZXN0cm95X2Nv
bm5lY3RvcihzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAkJCSAgICBzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewotCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
ID0gbm91dmVhdV9kcm0oY29ubmVjdG9yLT5kZXYpOwogCXN0cnVjdCBudjUwX21zdGMgKm1zdGMg
PSBudjUwX21zdGMoY29ubmVjdG9yKTsKIAogCWRybV9jb25uZWN0b3JfdW5yZWdpc3RlcigmbXN0
Yy0+Y29ubmVjdG9yKTsKQEAgLTEyNzEsOCArMTI3MCw2IEBAIG52NTBfbXN0bV9kZXN0cm95X2Nv
bm5lY3RvcihzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIHN0YXRpYyB2b2lk
CiBudjUwX21zdG1fcmVnaXN0ZXJfY29ubmVjdG9yKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCiB7Ci0Jc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShjb25uZWN0
b3ItPmRldik7Ci0KIAlkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7CiB9CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
