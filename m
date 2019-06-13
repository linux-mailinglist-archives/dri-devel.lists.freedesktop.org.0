Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE244AE9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB9E8976D;
	Thu, 13 Jun 2019 18:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581278973E;
 Thu, 13 Jun 2019 18:42:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5943E20024;
 Thu, 13 Jun 2019 20:42:23 +0200 (CEST)
Date: Thu, 13 Jun 2019 20:42:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix compilation error
Message-ID: <20190613184217.GA2385@ravnborg.org>
References: <20190613023208.GA29690@hari-Inspiron-1545>
 <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PU_jvOskC-=+oRQdvYXZvu_n26ogoWTxLRxnW+ke4wDw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=4PFS9l_RyDpw6E2KiyoA:9 a=QEXdDO2ut3YA:10
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
Cc: Charlene Liu <charlene.liu@amd.com>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Tony Cheng <tony.cheng@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Gloria Li <geling.li@amd.com>,
 David Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleC4KCk9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDEwOjM1OjI2UE0gLTA0MDAsIEFsZXgg
RGV1Y2hlciB3cm90ZToKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxMDozNCBQTSBIYXJpcHJh
c2FkIEtlbGFtCj4gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiB0
aGlzIHBhdGNoIGZpeGVzIGJlbG93IGNvbXBpbGF0aW9uIGVycm9yCj4gPgo+ID4gZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIu
YzogSW4KPiA+IGZ1bmN0aW9uIOKAmGRjbjEwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZeKAmToKPiA+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdf
c2VxdWVuY2VyLmM6MjM3ODozOgo+ID4gZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmHVkZWxheeKAmQo+ID4gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4gPiAgICB1ZGVsYXkodW5kZXJmbG93X2NoZWNrX2RlbGF5X3VzKTsKPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJhc2FkLmtlbGFtQGdtYWlsLmNv
bT4KCkFtIEkgcmlnaHQgaW4gYXNzdW1pbmcgeW91IHRvb2sgdGhpcyBwYXRjaD8KCkkgZXhwZWN0
IHRoYXQgbmV3IGNvZGUgdXNpbmcgdWRlbGF5IHdhcyBhZGRlZCB0byB0aGUgYW1kIHRyZWUsCmFu
ZCB3aGVuIG1lcmdlZCB3aXRoIGRybS1taXNjLW5leHQgaXQgZmFpbGVkLCBiZWNhdXNlIGRybS1t
aXNjLW5leHQgbm8KbG9uZ2VyIGhhZCBkcm1QLmggaW5jbHVkZWQgc28gbm8gaW1wbGljaXQgaW5j
bHVkZSBvZiBkZWxheS5oCgpUaGUgcm9vdCBjYXVzZSB3YXMgdGhhdCBteSBvcmlnaW5hbCBwYXRj
aHNldCBzaG91bGQgaGF2ZSBiZWVuIGJhc2VkCm9uIHRoZSBhbWQgdHJlZSwgYW5kIGFwcGxpZWQg
dGhlcmUgOi0oCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
