Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4C25439
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 17:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17698937C;
	Tue, 21 May 2019 15:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67B89363;
 Tue, 21 May 2019 15:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7524F30BB532;
 Tue, 21 May 2019 15:41:05 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE28453786;
 Tue, 21 May 2019 15:41:00 +0000 (UTC)
Date: Tue, 21 May 2019 11:40:59 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/4] mm, notifier: Add a lockdep map for
 invalidate_range_start
Message-ID: <20190521154059.GC3836@redhat.com>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
 <20190520213945.17046-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520213945.17046-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 21 May 2019 15:41:10 +0000 (UTC)
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6Mzk6NDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIGlzIGEgc2ltaWxhciBpZGVhIHRvIHRoZSBmc19yZWNsYWltIGZha2UgbG9j
a2RlcCBsb2NrLiBJdCdzCj4gZmFpcmx5IGVhc3kgdG8gcHJvdm9rZSBhIHNwZWNpZmljIG5vdGlm
aWVyIHRvIGJlIHJ1biBvbiBhIHNwZWNpZmljCj4gcmFuZ2U6IEp1c3QgcHJlcCBpdCwgYW5kIHRo
ZW4gbXVubWFwKCkgaXQuCj4gCj4gQSBiaXQgaGFyZGVyLCBidXQgc3RpbGwgZG9hYmxlLCBpcyB0
byBwcm92b2tlIHRoZSBtbXUgbm90aWZpZXJzIGZvcgo+IGFsbCB0aGUgdmFyaW91cyBjYWxsY2hh
aW5zIHRoYXQgbWlnaHQgbGVhZCB0byB0aGVtLiBCdXQgYm90aCBhdCB0aGUKPiBzYW1lIHRpbWUg
aXMgcmVhbGx5IGhhcmQgdG8gcmVsaWFibGUgaGl0LCBlc3BlY2lhbGx5IHdoZW4geW91IHdhbnQg
dG8KPiBleGVyY2lzZSBwYXRocyBsaWtlIGRpcmVjdCByZWNsYWltIG9yIGNvbXBhY3Rpb24sIHdo
ZXJlIGl0J3Mgbm90Cj4gZWFzeSB0byBjb250cm9sIHdoYXQgZXhhY3RseSB3aWxsIGJlIHVubWFw
cGVkLgo+IAo+IEJ5IGludHJvZHVjaW5nIGEgbG9ja2RlcCBtYXAgdG8gdGllIHRoZW0gYWxsIHRv
Z2V0aGVyIHdlIGFsbG93IGxvY2tkZXAKPiB0byBzZWUgYSBsb3QgbW9yZSBkZXBlbmRlbmNpZXMs
IHdpdGhvdXQgaGF2aW5nIHRvIGFjdHVhbGx5IGhpdCB0aGVtCj4gaW4gYSBzaW5nbGUgY2hhbGxj
aGFpbiB3aGlsZSB0ZXN0aW5nLgo+IAo+IEFzaWRlOiBTaW5jZSBJIHR5cGVkIHRoaXMgdG8gdGVz
dCBpOTE1IG1tdSBub3RpZmllcnMgSSd2ZSBvbmx5IHJvbGxlZAo+IHRoaXMgb3V0IGZvciB0aGUg
aW52YWxpYXRlX3JhbmdlX3N0YXJ0IGNhbGxiYWNrLiBJZiB0aGVyZSdzCj4gaW50ZXJlc3QsIHdl
IHNob3VsZCBwcm9iYWJseSByb2xsIHRoaXMgb3V0IHRvIGFsbCBvZiB0aGVtLiBCdXQgbXkKPiB1
bmRlc3RhbmRpbmcgb2YgY29yZSBtbSBpcyBzZXJpb3VzbHkgbGFja2luZywgYW5kIEknbSBub3Qg
Y2xlYXIgb24KPiB3aGV0aGVyIHdlIG5lZWQgYSBsb2NrZGVwIG1hcCBmb3IgZWFjaCBjYWxsYmFj
aywgb3Igd2hldGhlciBzb21lIGNhbgo+IGJlIHNoYXJlZC4KCkkgbmVlZCB0byByZWFkIG1vcmUg
b24gbG9ja2RlcCBidXQgaXQgaXMgbGVnYWwgdG8gaGF2ZSBtbXUgbm90aWZpZXIKaW52YWxpZGF0
aW9uIHdpdGhpbiBlYWNoIG90aGVyLiBGb3IgaW5zdGFuY2Ugd2hlbiB5b3UgbXVubWFwIHlvdQpt
aWdodCBzcGxpdCBhIGh1Z2UgcG1kIGFuZCBpdCB3aWxsIHRyaWdnZXIgYSBzZWNvbmQgaW52YWxp
ZGF0ZSByYW5nZQp3aGlsZSB0aGUgbXVubWFwIG9uZSBpcyBub3QgZG9uZSB5ZXQuIFdvdWxkIHRo
YXQgdHJpZ2dlciB0aGUgbG9ja2RlcApoZXJlID8KCldvcnN0IGNhc2UgaSBjYW4gdGhpbmsgb2Yg
aXMgMiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0IGNoYWluIG9uZSBhZnRlcgp0aGUgb3RoZXIuIEkg
ZG9uJ3QgdGhpbmsgeW91IGNhbiB0cmlnZ2VycyBhIDMgbGV2ZWxzIG5lc3RpbmcgYnV0IG1heWJl
LgoKQ2hlZXJzLApKw6lyw7RtZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
