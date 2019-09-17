Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0228B47EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6986E339;
	Tue, 17 Sep 2019 07:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CBA6E339
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 07:15:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 24D9828D904;
 Tue, 17 Sep 2019 08:15:09 +0100 (BST)
Date: Tue, 17 Sep 2019 09:15:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] drm/panfrost: Allow passing extra information about
 BOs used by a job
Message-ID: <20190917091505.267b93d6@collabora.com>
In-Reply-To: <CAL_JsqLSStbn35SY9nE+SNZMnNyBZ2vP1KMH5aFjFxi6mBw2wQ@mail.gmail.com>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
 <CAL_JsqLSStbn35SY9nE+SNZMnNyBZ2vP1KMH5aFjFxi6mBw2wQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNiBTZXAgMjAxOSAxNzoyMDoyOCAtMDUwMApSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNjoxNyBBTSBCb3JpcyBC
cmV6aWxsb24KPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4KPiA+
IFRoZSBSRUFEL1dSSVRFIGZsYWdzIGFyZSBwYXJ0aWN1bGFybHkgdXNlZnVsIGlmIHdlIHdhbnQg
dG8gYXZvaWQKPiA+IHNlcmlhbGl6YXRpb24gb2Ygam9icyB0aGF0IHJlYWQgZnJvbSB0aGUgc2Ft
ZSBCTyBidXQgbmV2ZXIgd3JpdGUgdG8gaXQuICAKPiAKPiBBbnkgZGF0YSBvbiBwZXJmb3JtYW5j
ZSBkaWZmZXJlbmNlcz8KClVuZm9ydHVuYXRlbHkgbm8uIFdoZW4gSSBpbml0aWFsbHkgYWRkZWQg
c3VwcG9ydCBmb3IgQk8gZmxhZ3MgSSB0aG91Z2h0Cml0IHdvdWxkIGZpeCBhIHJlZ3Jlc3Npb24g
SSBoYWQgb24gb25lIGdsbWFyazIgdGVzdCAoaWRlYXMpLCBidXQgdGhlCnByb2JsZW0gZW5kZWQg
dXAgYmVpbmcgc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50IChvdmVyaGVhZCBvZgpjYWxs
aW5nIGlvY3RsKFdBSVRfQk8pIG9uIGFscmVhZHkgaWRsZSBCT3MpLgoKSSBqdXN0IHJhbiBnbG1h
cmsyIGFnYWluLCBhbmQgdGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGEgbm90aWNlYWJsZQppbXBy
b3ZlbWVudCB3aXRoIHRob3NlIDIgcGF0Y2hlcyBhcHBsaWVkIChhbmQgbWVzYSBwYXRjaGVkIHRv
IHVzZSB0aGUKbmV3IGZsYWdzKS4gVGhpcyBiZWluZyBzYWlkLCB0aGUgaW1wcm92ZW1lbnQgaXMg
bGlrZWx5IHRvIGJlIHdvcmtsb2FkCmRlcGVuZGVudCwgc28gSSB3b3VsZG4ndCBjb25zaWRlciB0
aGVzZSBwYXRjaGVzIGFzIHVzZWxlc3MsIGJ1dCBJJ20KZmluZSBwdXR0aW5nIHRoZW0gb24gaG9s
ZCB1bnRpbCB3ZSBzZWUgYSByZWFsIG5lZWQuCgpNYXliZSBTdGV2ZW4gaGFzIHNvbWUgcmVhbCB1
c2UgY2FzZXMgdGhhdCBjb3VsZCBoZWxwIG91dGxpbmUgdGhlCmJlbmVmaXQgb2YgdGhlc2UgcGF0
Y2hlcy4KCj4gCj4gPiBUaGUgTk9fSU1QTElDSVRfRkVOQ0UgbWlnaHQgYmUgdXNlZnVsIHdoZW4g
dGhlIHVzZXIga25vd3MgdGhlIEJPIGlzCj4gPiBzaGFyZWQgYnV0IGpvYnMgYXJlIHVzaW5nIGRp
ZmZlcmVudCBwb3J0aW9ucyBvZiB0aGUgYnVmZmVyLiAgCj4gCj4gV2h5IGRvbid0IHdlIGFkZCB0
aGlzIHdoZW4gaXQgaXMgdXNlZnVsIHJhdGhlciB0aGFuIG1pZ2h0IGJlPwoKSSBkb24ndCBoYXZl
IGEgbmVlZCBmb3IgdGhhdCBvbmUgeWV0LCBidXQgZXRhbnZpdiBoYXMgaXQgaW4gcGxhY2Ugc28g
SQp0aG91Z2h0IEknZCBhZGQgYm90aCBhdCB0aGUgc2FtZSB0aW1lLgpOb3RlIHRoYXQgaXQgY291
bGQgaGVscCB1cyByZWR1Y2UgdGhlIG51bWJlciBvZiBmZW5jZSByZXR1cm5lZCBieQpwYW5mcm9z
dF9qb2JfZGVwZW5kZW5jeSgpLCBidXQgSSdtIG5vdCBzdXJlIGl0IG1ha2VzIGEgZGlmZmVyZW5j
ZSBpbgp0ZXJtcyBvZiBwZXJmcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
