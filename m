Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C871FC3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 21:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822E26E39C;
	Tue, 23 Jul 2019 19:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A856E39C;
 Tue, 23 Jul 2019 19:01:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3865D8061F;
 Tue, 23 Jul 2019 21:01:31 +0200 (CEST)
Date: Tue, 23 Jul 2019 21:01:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
Message-ID: <20190723190129.GA26326@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
 <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
 <20190722161720.GA14638@ravnborg.org>
 <CACvgo51_T1rcTnK7dYtQVdRTtcEd8am04THidD-CrHwdS3hk9w@mail.gmail.com>
 <20190722182731.GA791@ravnborg.org>
 <20190723114928.GA12807@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723114928.GA12807@arch-x1c3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=yrcXj6c5op7j3zj1RmUA:9 a=CjuIK1q_8ugA:10
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbC4KCj4gPiAKPiA+IExpa2UgdGhpczoKPiA+IAo+ID4gc3RhdGljIGlubGluZSB2b2lk
IHZpYV93cml0ZThfbWFza19vcihzdHJ1Y3QgZHJtX3ZpYV9wcml2YXRlICpkZXZfcHJpdiwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHJlZywgdTMyIG1hc2sp
Cj4gPiB7Cj4gPiAgICAgICAgIHUzMiB2YWw7Cj4gPiAKPiA+ICAgICAgICAgdmFsID0gcmVhZGIo
KHZvaWQgX19pb21lbSAqKShkZXZfcHJpdi0+bW1pby0+aGFuZGxlICsgcmVnKSk7Cj4gPiAgICAg
ICAgIHdyaXRlYih2YWwgfCBtYXNrLCAodm9pZCBfX2lvbWVtICopKGRldl9wcml2LT5tbWlvLT5o
YW5kbGUgKyByZWcpKTsKPiA+IH0KPiA+IAo+ID4gc3RhdGljIGlubGluZSB2b2lkIHZpYV93cml0
ZThfbWFza19hbmQoc3RydWN0IGRybV92aWFfcHJpdmF0ZSAqZGV2X3ByaXYsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgcmVnLCB1MzIgbWFzaykKPiA+IHsK
PiA+ICAgICAgICAgdTMyIHZhbDsKPiA+IAo+ID4gICAgICAgICB2YWwgPSByZWFkYigodm9pZCBf
X2lvbWVtICopKGRldl9wcml2LT5tbWlvLT5oYW5kbGUgKyByZWcpKTsKPiA+ICAgICAgICAgd3Jp
dGViKHZhbCAmIG1hc2ssICh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhhbmRsZSAr
IHJlZykpOwo+ID4gfQo+ID4gCj4gPiBQYXRjaGVzIGFyZSBhbG1vc3QgcmVhZHksIGJ1dCBpZiB0
aGVyZSBpcyBhbnkgcXVpY2sgZmVlZGJhY2sgbGV0IG1lCj4gPiBrbm93Lgo+ID4gCj4gCj4gRG9u
J3QgdGhpbmsgSSd2ZSBzZWVuIGFueSAibWFza19hbmQiICJtYXNrX29yIiBBUEkgaW4gRFJNLiBU
aGUgY29tbW9uCj4gdGhlbWUgc2VlbXMgdG8gYmU6Cj4gCj4gbXRrX2NlY19tYXNrKGRyaXZlcl9w
cml2LCBvZmZzZXQsIHZhbHVlLCBtYXNrKQo+IG1hbGlkcF93cml0ZTMyX21hc2soZHJpdmVyX3By
aXYsIG9mZnNldCwgbWFzaywgdmFsdWUpCj4gbnZpZl9tYXNrKGRyaXZlcl9wcml2LCBhZGRyZXNz
LCBtYXNrLCB2YWx1ZSkKWWVwLCB0aGlzIGlzIGJldHRlci4gV2lsbCBzZW5kIG91dCBhbiB1cGRh
dGVkIHZlcnNpb24uCgpIbW0sIHNvbWUgaW5jb25zaXN0ZW5jeSBpbiBvcmRlciBvZiBwYXJhbWV0
ZXJzLgpEZWNpZGVkIGZvciBtYXNrLCB2YWx1ZSAtIHNlZW1zIGEgbGl0dGxlIGJpdCBtb3JlIGxv
Z2ljYWwgdG8gbWUuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
