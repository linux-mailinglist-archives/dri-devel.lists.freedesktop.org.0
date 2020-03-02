Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6FE175B42
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD2F6E314;
	Mon,  2 Mar 2020 13:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562DB6E314;
 Mon,  2 Mar 2020 13:09:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 05:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="319059485"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga001.jf.intel.com with ESMTP; 02 Mar 2020 05:09:30 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 7/9] drm/bridge: remove unused variable warning in
 tc358764_detach
Date: Mon,  2 Mar 2020 18:26:47 +0530
Message-Id: <20200302125649.61443-8-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2RldmljZSBwb2ludGVyIGlzIG5vdCBnZXR0aW5nIHVzZWQgaW4gdGMzNTg3NjRfZGV0YWNo
KCkgYW55bW9yZSwKaGVuY2UgcmVtb3ZlIGl0LgoKVGhpcyBmaXhlcyBiZWxvdyB3YXJuaW5nLgoK
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jOiBJbiBmdW5jdGlvbiDigJh0YzM1ODc2
NF9kZXRhY2jigJk6CmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQuYzozODY6MjE6IHdh
cm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhkcm3igJkgWy1XdW51c2VkLXZhcmlhYmxlXQogIHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBicmlkZ2UtPmRldjsKICAgICAgICAgICAgICAgICAgICAg
Xn5+CgpTaWduZWQtb2ZmLWJ5OiBQYW5rYWogQmhhcmFkaXlhIDxwYW5rYWoubGF4bWluYXJheWFu
LmJoYXJhZGl5YUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
NC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjQuYwppbmRleCA1MzAzNDJkZDRhMzQuLjVhYzE0MzBmYWIwNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjQuYwpAQCAtMzgzLDcgKzM4Myw2IEBAIHN0YXRpYyBpbnQgdGMzNTg3NjRf
YXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiBzdGF0aWMgdm9pZCB0YzM1ODc2NF9k
ZXRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIHsKIAlzdHJ1Y3QgdGMzNTg3NjQgKmN0
eCA9IGJyaWRnZV90b190YzM1ODc2NChicmlkZ2UpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0g
PSBicmlkZ2UtPmRldjsKIAogCWRybV9jb25uZWN0b3JfdW5yZWdpc3RlcigmY3R4LT5jb25uZWN0
b3IpOwogCWRybV9wYW5lbF9kZXRhY2goY3R4LT5wYW5lbCk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
