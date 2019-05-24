Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D335C29C69
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70F56E10E;
	Fri, 24 May 2019 16:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537F6E10E;
 Fri, 24 May 2019 16:36:05 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 610462133D;
 Fri, 24 May 2019 16:36:04 +0000 (UTC)
Date: Fri, 24 May 2019 12:36:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nikolay Borisov <nborisov@suse.com>
Subject: Re: [RFC][PATCH] kernel.h: Add generic roundup_64() macro
Message-ID: <20190524123602.402c01b4@gandalf.local.home>
In-Reply-To: <bd4a85fc-dc56-aae0-4986-003ad4a11ef4@suse.com>
References: <20190523100013.52a8d2a6@gandalf.local.home>
 <CAHk-=wg5HqJ2Kfgpub+tCWQ2_FiFwEW9H1Rm+an-BLGaGvDDXw@mail.gmail.com>
 <20190523112740.7167aba4@gandalf.local.home>
 <e4e875f0-2aa5-89f4-f462-78bedb9c5cde@filmlight.ltd.uk>
 <20190524112656.5ef67c6c@gandalf.local.home>
 <bd4a85fc-dc56-aae0-4986-003ad4a11ef4@suse.com>
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
 Roger Willcocks <roger@filmlight.ltd.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBNYXkgMjAxOSAxOTozMDo0NSArMDMwMApOaWtvbGF5IEJvcmlzb3YgPG5ib3Jp
c292QHN1c2UuY29tPiB3cm90ZToKCgo+ID4gWWVzIEkgZG8uIEkgY29ycmVjdGVkIGl0IGluIG15
IG5leHQgZW1haWwuCj4gPiAKPiA+ICBodHRwOi8vbGttbC5rZXJuZWwub3JnL3IvMjAxOTA1MjMx
MzM2NDguNTkxZjllNzhAZ2FuZGFsZi5sb2NhbC5ob21lICAKPiAKPiBPciBwZXJoYXBzIGp1c3Qg
dXNpbmcgaXNfcG93ZXJfb2ZfMiBmcm9tIGluY2x1ZGUvbGludXgvbG9nMi5oID8KCkV2ZW4gYmV0
dGVyLiBUaGFua3MsCgotLSBTdGV2ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
