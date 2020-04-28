Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E21BC679
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6086E88D;
	Tue, 28 Apr 2020 17:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEEC6E88C;
 Tue, 28 Apr 2020 17:20:45 +0000 (UTC)
IronPort-SDR: mu4ECsZl8faYHFZbPjG62mrmVQA/8fGPtaLmFhD8rabZ3vjiR4ysbA1lV5lKHvupE8VSjcKH71
 7G8C4BBCO6cw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 10:20:44 -0700
IronPort-SDR: 0iiomrif2rVbPvnyQEokmnk8WiVYQs8/NPtt845kTzlP2Wbv/bmm8P0w+oHeOMGKrly13GohxQ
 u0OEYQHG9slg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="336693335"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 28 Apr 2020 10:20:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Apr 2020 20:20:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/16] drm: Nuke mode->private_flags
Date: Tue, 28 Apr 2020 20:19:39 +0300
Message-Id: <20200428171940.19552-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBsYXN0IHR3byB1c2VzIG9mIG1vZGUtPnByaXZhdGVfZmxhZ3MgKGluIGk5MTUgYW5kIGdtYTUw
MCkKYXJlIG5vdyBnb25lLiBTbyBsZXQncyByZW1vdmUgbW9kZS0+cHJpdmF0ZV9mbGFncyBlbnRp
cmVseS4KCnYyOiBEcm9wIHRoZSBlYXJsaWVyIGludC0+dTggY29udmVyc2lvbgoKQ0M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4K
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBp
bmNsdWRlL2RybS9kcm1fbW9kZXMuaCB8IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9tb2Rlcy5oCmluZGV4IGI4MWI4MjlhYjM1Yi4uMWU5NzEzOGE5YjhjIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaAorKysgYi9pbmNsdWRlL2RybS9kcm1f
bW9kZXMuaApAQCAtMzQ4LDE2ICszNDgsNiBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB7CiAJ
ICovCiAJdTggdHlwZTsKIAotCS8qKgotCSAqIEBwcml2YXRlX2ZsYWdzOgotCSAqCi0JICogRHJp
dmVyIHByaXZhdGUgZmxhZ3MuIHByaXZhdGVfZmxhZ3MgY2FuIG9ubHkgYmUgdXNlZCBmb3IgbW9k
ZQotCSAqIG9iamVjdHMgcGFzc2VkIHRvIGRyaXZlcnMgaW4gbW9kZXNldCBvcGVyYXRpb25zLiBJ
dCBzaG91bGRuJ3QgYmUgdXNlZAotCSAqIGJ5IGF0b21pYyBkcml2ZXJzIHNpbmNlIHRoZXkgY2Fu
IHN0b3JlIGFueSBhZGRpdGlvbmFsIGRhdGEgYnkKLQkgKiBzdWJjbGFzc2luZyBzdGF0ZSBzdHJ1
Y3R1cmVzLgotCSAqLwotCWludCBwcml2YXRlX2ZsYWdzOwotCiAJLyoqCiAJICogQGhlYWQ6CiAJ
ICoKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
