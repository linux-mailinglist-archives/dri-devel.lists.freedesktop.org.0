Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F536D33E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627216EAB0;
	Wed, 28 Apr 2021 07:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787066EAB0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:34:15 +0000 (UTC)
IronPort-SDR: FQbzA0RRHpiPxQq2RSzTu8WPr3CIWSCIZN/3aFs4vEUoPWJQ4Gwkf/nIiOz2rysbx9urp/Kqy2
 cRODAWsGTKCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="193489298"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="193489298"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 00:27:14 -0700
IronPort-SDR: tR9xIFfrlHKMLSXo4QTPjbAn1aIp7Ors5wVZq1YqZAbml0aQMrY2sHxI/fXWWVPGNsgzaFCTCS
 mocmMIogr7Kw==
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="430170642"
Received: from ajalsove-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.247])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 00:27:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Subject: Re: New warnings with gcc-11
In-Reply-To: <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
 <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
Date: Wed, 28 Apr 2021 10:27:07 +0300
Message-ID: <87bl9y50ok.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBcHIgMjAyMSwgTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5k
YXRpb24ub3JnPiB3cm90ZToKPiBJJ3ZlIHVwZGF0ZWQgdG8gRmVkb3JhIDM0IG9uIG9uZSBvZiBt
eSBtYWNoaW5lcywgYW5kIGl0IGNhdXNlcyBhIGxvdAo+IG9mIGk5MTUgd2FybmluZ3MgbGlrZQo+
Cj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOiBJbiBmdW5jdGlvbiDigJhpbGtf
c2V0dXBfd21fbGF0ZW5jeeKAmToKPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6
MzA1OTo5OiBub3RlOiByZWZlcmVuY2luZyBhcmd1bWVudCAzCj4gb2YgdHlwZSDigJhjb25zdCB1
MTYgKuKAmSB7YWthIOKAmGNvbnN0IHNob3J0IHVuc2lnbmVkIGludCAq4oCZfQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzoyOTk0OjEzOiBub3RlOiBpbiBhIGNhbGwgdG8gZnVu
Y3Rpb24KPiDigJhpbnRlbF9wcmludF93bV9sYXRlbmN54oCZCj4KPiBhbmQgdGhlIHJlYXNvbiBp
cyB0aGF0IGdjYyBub3cgc2VlbXMgdG8gbG9vayBhdCB0aGUgYXJndW1lbnQgYXJyYXkKPiBzaXpl
IG1vcmUsIGFuZCBub3RpY2VzIHRoYXQKCkFybmQgQmVyZ21hbm4gcmVwb3J0ZWQgc29tZSBvZiB0
aGVzZSBhIHdoaWxlIGJhY2suIEkgdGhpbmsgd2UgaGF2ZSBzb21lCm9mIHRoZW0gZml4ZWQgaW4g
b3VyIC1uZXh0IGFscmVhZHksIGJ1dCBub3QgYWxsLiBUaGFua3MgZm9yIHRoZQpyZW1pbmRlci4K
CkJSLApKYW5pLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
