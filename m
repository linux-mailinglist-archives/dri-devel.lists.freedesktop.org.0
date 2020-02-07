Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CC1558E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93546FCA7;
	Fri,  7 Feb 2020 13:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CFB6FCA7;
 Fri,  7 Feb 2020 13:59:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 05:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="312036456"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 07 Feb 2020 05:59:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 15:59:50 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm: Try to fix encoder possible_clones/crtc
Date: Fri,  7 Feb 2020 15:59:44 +0200
Message-Id: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
bWFpbmRlciBvZiBteSBwb3NzaWJsZV9jbG9uZXMvY3J0Y3MgY2xlYW51cC4gQWxsIHRoZSBpOTE1
IGJpdHMgYW5kIGEKZmV3IG90aGVyIGRyaXZlciBiaXRzIGdvdCBtZXJnZWQgYWxyZWFkeS4KClZp
bGxlIFN5cmrDpGzDpCAoNik6CiAgZHJtOiBJbmNsdWRlIHRoZSBlbmNvZGVyIGl0c2VsZiBpbiBw
b3NzaWJsZV9jbG9uZXMKICBkcm0vZ21hNTAwOiBTYW5pdGl6ZSBwb3NzaWJsZV9jbG9uZXMKICBk
cm0vZXh5bm9zOiBVc2UgZHJtX2VuY29kZXJfbWFzaygpCiAgZHJtL2lteDogUmVtb3ZlIHRoZSBi
b2d1cyBwb3NzaWJsZV9jbG9uZXMgc2V0dXAKICBkcm06IFZhbGlkYXRlIGVuY29kZXItPnBvc3Np
YmxlX2Nsb25lcwogIGRybTogVmFsaWRhdGUgZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyAgICAgICAgICAgfCA2MyArKysrKysrKysrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgfCAgNSAr
LQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZlci5jICAgIHwgMTYgKysrLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lfZHBpLmMgIHwgIDQgKy0KIGRyaXZlcnMv
Z3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMgICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQs
IDc2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
