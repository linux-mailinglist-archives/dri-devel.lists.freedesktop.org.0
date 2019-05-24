Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1429AFD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1036E110;
	Fri, 24 May 2019 15:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138466E112;
 Fri, 24 May 2019 15:26:59 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 899612133D;
 Fri, 24 May 2019 15:26:57 +0000 (UTC)
Date: Fri, 24 May 2019 11:26:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Roger Willcocks <roger@filmlight.ltd.uk>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
Message-ID: <20190524112656.5ef67c6c@gandalf.local.home>
In-Reply-To: <e4e875f0-2aa5-89f4-f462-78bedb9c5cde@filmlight.ltd.uk>
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
 <e4e875f0-2aa5-89f4-f462-78bedb9c5cde@filmlight.ltd.uk>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBNYXkgMjAxOSAxNjoxMToxNCArMDEwMApSb2dlciBXaWxsY29ja3MgPHJvZ2Vy
QGZpbG1saWdodC5sdGQudWs+IHdyb3RlOgoKPiBPbiAyMy8wNS8yMDE5IDE2OjI3LCBTdGV2ZW4g
Um9zdGVkdCB3cm90ZToKPiA+Cj4gPiBJIGhhdmVuJ3QgeWV0IHRlc3RlZCB0aGlzLCBidXQgd2hh
dCBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOgo+ID4KPiA+IC4uLnBlcmhhcHMg
Zm9yZ2V0IGFib3V0IHRoZSBjb25zdGFudCBjaGVjaywgYW5kIGp1c3QgZm9yY2UKPiA+IHRoZSBw
b3dlciBvZiB0d28gY2hlY2s6Cj4gPgo+ID4gCQkJCQkJCVwKPiA+IAlpZiAoIShfX3kgJiAoX195
ID4+IDEpKSkgewkJCVwKPiA+IAkJX194ID0gcm91bmRfdXAoeCwgeSk7CQkJXAo+ID4gCX0gZWxz
ZSB7CQkJCQlcICAKPiAKPiBZb3UgcHJvYmFibHkgd2FudAo+IAo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIShfX3kgJiAoX195IC0gMSkpCj4gCj4gLS0KClllcyBJIGRvLiBJIGNvcnJlY3Rl
ZCBpdCBpbiBteSBuZXh0IGVtYWlsLgoKIGh0dHA6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDUy
MzEzMzY0OC41OTFmOWU3OEBnYW5kYWxmLmxvY2FsLmhvbWUKCj4gI2RlZmluZSByb3VuZHVwKHgs
IHkpICgJCQkJCVwKPiB7CQkJCQkJCVwKPiAJdHlwZW9mKHkpIF9feSA9IHk7CQkJCVwKPiAJdHlw
ZW9mKHgpIF9feDsJCQkJCVwKPiAJCQkJCQkJXAo+IAlpZiAoX195ICYgKF9feSAtIDEpKQkJCQlc
Cj4gCQlfX3ggPSByb3VuZF91cCh4LCBfX3kpOwkJCVwKPiAJZWxzZQkJCQkJCVwKPiAJCV9feCA9
ICgoKHgpICsgKF9feSAtIDEpKSAvIF9feSkgKiBfX3k7CVwKPiAJX194OwkJCQkJCVwKPiB9KQoK
Ci0tIFN0ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
