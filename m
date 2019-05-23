Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00B28126
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 17:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD29C89F99;
	Thu, 23 May 2019 15:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCDF89F8B;
 Thu, 23 May 2019 15:27:44 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 748FE206BA;
 Thu, 23 May 2019 15:27:42 +0000 (UTC)
Date: Thu, 23 May 2019 11:27:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
Message-ID: <20190523112740.7167aba4@gandalf.local.home>
In-Reply-To: <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMyBNYXkgMjAxOSAwODoxMDo0NCAtMDcwMApMaW51cyBUb3J2YWxkcyA8dG9ydmFs
ZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgoKPiBPbiBUaHUsIE1heSAyMywgMjAxOSBh
dCA3OjAwIEFNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToKPiA+
Cj4gPiArIyBkZWZpbmUgcm91bmR1cF82NCh4LCB5KSAoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ICt7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgICB0eXBlb2YoeSkgX195ID0geTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiArICAgICAgIHR5cGVvZih4KSBfX3ggPSAoeCkgKyAoX195IC0g
MSk7ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgZG9fZGl2KF9feCwgX195KTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICBfX3ggKiBfX3k7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArfSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBUaGUgdGhpbmcgYWJvdXQg
dGhpcyBpcyB0aGF0IGl0IGFic29sdXRlbHkgc3Vja3MgZm9yIHBvd2VyLW9mLXR3byBhcmd1bWVu
dHMuCj4gCj4gVGhlIHJlZ3VsYXIgcm91bmR1cCgpIHRoYXQgdXNlcyBkaXZpc2lvbiBoYXMgdGhl
IGNvbXBpbGVyIGF0IGxlYXN0Cj4gb3B0aW1pemUgdGhlbSB0byBzaGlmdHMgLSBhdCBsZWFzdCBm
b3IgY29uc3RhbnQgY2FzZXMuIEJ1dCBkb19kaXYoKSBpcwo+IG1lYW50IGZvciAid2UgYWxyZWFk
eSBrbm93IGl0J3Mgbm90IGEgcG93ZXIgb2YgdHdvIiwgYW5kIHRoZSBjb21waWxlcgo+IGRvZXNu
J3QgaGF2ZSBhbnkgdW5kZXJzdGFuZGluZyBvZiB0aGUgaW50ZXJuYWxzLgo+IAo+IEFuZCBpdCBs
b29rcyB0byBtZSBsaWtlIHRoZSB1c2UgY2FzZSB5b3Ugd2FudCB0aGlzIGZvciBpcyB2ZXJ5IG11
Y2gKPiBwcm9iYWJseSBhIHBvd2VyIG9mIHR3by4gSW4gd2hpY2ggY2FzZSBkaXZpc2lvbiBpcyBh
bGwga2luZHMgb2YganVzdAo+IHN0dXBpZC4KPiAKPiBBbmQgd2UgYWxyZWFkeSBoYXZlIGEgcG93
ZXItb2YtdHdvIHJvdW5kIHVwIGZ1bmN0aW9uIHRoYXQgd29ya3Mgb24KPiB1NjQuIEl0J3MgY2Fs
bGVkICJyb3VuZF91cCgpIi4KPiAKPiBJIHdpc2ggd2UgaGFkIGEgYmV0dGVyIHZpc3VhbCB3YXJu
aW5nIGFib3V0IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuCj4gInJvdW5kX3VwKCkiIChsaW1pdGVk
IHRvIHBvd2Vycy1vZi10d28sIGJ1dCBlZmZpY2llbnQsIGFuZCB3b3JrcyB3aXRoCj4gYW55IHNp
emUpIGFuZCAicm91bmR1cCgpIiAoZ2VuZXJpYywgcG90ZW50aWFsbHkgaG9ycmlibHkgc2xvdywg
YW5kCj4gZG9lc24ndCB3b3JrIGZvciA2NC1iaXQgb24gMzItYml0KS4KPiAKPiBTaWRlIG5vdGU6
ICJyb3VuZF91cCgpIiBoYXMgdGhlIHByb2JsZW0gdGhhdCBpdCB1c2VzICJ4IiB0d2ljZS4KPiAK
PiBFbmQgcmVzdWx0OiBzb21lYm9keSBzaG91bGQgbG9vayBhdCB0aGlzLCBidXQgSSByZWFsbHkg
ZG9uJ3QgbGlrZSB0aGUKPiAiZm9yY2UgZGl2aXNpb24iIGNhc2UgdGhhdCBpcyBsaWtlbHkgaG9y
cmlibHkgc2xvdyBhbmQgbmFzdHkuCgpJIGhhdmVuJ3QgeWV0IHRlc3RlZCB0aGlzLCBidXQgd2hh
dCBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgoKIyBkZWZpbmUgcm91bmR1cF82
NCh4LCB5KSAoCQkJCVwKewkJCQkJCQlcCgl0eXBlb2YoeSkgX195OwkJCQkJXAoJdHlwZW9mKHgp
IF9feDsJCQkJCVwKCQkJCQkJCVwKCWlmIChfX2J1aWx0aW5fY29uc3RhbnRfcCh5KSAmJgkJCVwK
CSAgICAhKHkgJiAoeSA+PiAxKSkpIHsJCQkJXAoJCV9feCA9IHJvdW5kX3VwKHgsIHkpOwkJCVwK
CX0gZWxzZSB7CQkJCQlcCgkJX195ID0geTsJCQkJXAoJCV9feCA9ICh4KSArIChfX3kgLSAxKTsJ
CQlcCgkJZG9fZGl2KF9feCwgX195KTsJCQlcCgkJX194ID0gX194ICogX195OwkJCVwKCX0JCQkJ
CQlcCglfX3g7CQkJCQkJXAp9CQkJCQkJCVwKKQoKSWYgdGhlIGNvbXBpbGVyIGtub3dzIGVub3Vn
aCB0aGF0IHkgaXMgYSBwb3dlciBvZiB0d28sIGl0IHdpbGwgdXNlIHRoZQpzaGlmdCB2ZXJzaW9u
LiBPdGhlcndpc2UsIGl0IGRvZXNuJ3Qga25vdyBlbm91Z2ggYW5kIHdvdWxkIGRpdmlkZQpyZWdh
cmRsZXNzLiBPciBwZXJoYXBzIGZvcmdldCBhYm91dCB0aGUgY29uc3RhbnQgY2hlY2ssIGFuZCBq
dXN0IGZvcmNlCnRoZSBwb3dlciBvZiB0d28gY2hlY2s6CgojIGRlZmluZSByb3VuZHVwXzY0KHgs
IHkpICgJCQkJXAp7CQkJCQkJCVwKCXR5cGVvZih5KSBfX3kgPSB5OwkJCQlcCgl0eXBlb2YoeCkg
X194OwkJCQkJXAoJCQkJCQkJXAoJaWYgKCEoX195ICYgKF9feSA+PiAxKSkpIHsJCQlcCgkJX194
ID0gcm91bmRfdXAoeCwgeSk7CQkJXAoJfSBlbHNlIHsJCQkJCVwKCQlfX3ggPSAoeCkgKyAoX195
IC0gMSk7CQkJXAoJCWRvX2RpdihfX3gsIF9feSk7CQkJXAoJCV9feCA9IF9feCAqIF9feTsJCQlc
Cgl9CQkJCQkJXAoJX194OwkJCQkJCVwKfQkJCQkJCQlcCikKClRoaXMgd2F5IGV2ZW4gaWYgdGhl
IGNvbXBpbGVyIGRvZXNuJ3Qga25vdyB0aGF0IHRoaXMgaXMgYSBwb3dlciBvZiB0d28sCml0IHdp
bGwgc3RpbGwgZG8gdGhlIHNoaWZ0IGlmIHkgZW5kcyB1cCBiZWluZyBvbmUuCgotLSBTdGV2ZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
