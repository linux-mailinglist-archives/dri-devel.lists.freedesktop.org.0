Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A7711028F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF8E6E9FB;
	Tue,  3 Dec 2019 16:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C76A6E9F5;
 Tue,  3 Dec 2019 16:39:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="385380689"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 05/12] video: fbdev: make fbops member of struct fb_info a
 const pointer
Date: Tue,  3 Dec 2019 18:38:47 +0200
Message-Id: <700c6b52c39c6e7babaa921f583eac354714d9fc.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2Ugbm8gbG9uZ2VyIG1vZGlmeSB0aGUgZmJvcHMsIG9yIGhvbGQgbm9uLWNvbnN0
IHBvaW50ZXJzIHRvCml0LCB3ZSBjYW4gbWFrZSBpdCBjb25zdC4gQWZ0ZXIgdGhpcywgd2UgY2Fu
IHN0YXJ0IG1ha2luZyB0aGUgZmJvcHMKY29uc3QgYWxsIG92ZXIgdGhlIHBsYWNlLgoKQ2M6IGxp
bnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2ZiLmggfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgKaW5kZXggYTZhZDUyODk5MGRlLi42NTU3
ZmFiZGVhNjIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZmIuaAorKysgYi9pbmNsdWRlL2xp
bnV4L2ZiLmgKQEAgLTQ3Miw3ICs0NzIsNyBAQCBzdHJ1Y3QgZmJfaW5mbyB7CiAJc3RydWN0IGZi
X2RlZmVycmVkX2lvICpmYmRlZmlvOwogI2VuZGlmCiAKLQlzdHJ1Y3QgZmJfb3BzICpmYm9wczsK
Kwljb25zdCBzdHJ1Y3QgZmJfb3BzICpmYm9wczsKIAlzdHJ1Y3QgZGV2aWNlICpkZXZpY2U7CQkv
KiBUaGlzIGlzIHRoZSBwYXJlbnQgKi8KIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CQkvKiBUaGlzIGlz
IHRoaXMgZmIgZGV2aWNlICovCiAJaW50IGNsYXNzX2ZsYWc7ICAgICAgICAgICAgICAgICAgICAv
KiBwcml2YXRlIHN5c2ZzIGZsYWdzICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
