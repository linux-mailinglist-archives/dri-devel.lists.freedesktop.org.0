Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8301385F75
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 12:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221C86E811;
	Thu,  8 Aug 2019 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC316E811
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 10:23:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EDDEC08EC1A;
 Thu,  8 Aug 2019 10:23:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DD8D1001955;
 Thu,  8 Aug 2019 10:23:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 582B316E08; Thu,  8 Aug 2019 12:23:19 +0200 (CEST)
Date: Thu, 8 Aug 2019 12:23:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/8] scsi: core: fix the dma_max_mapping_size call
Message-ID: <20190808102319.d4wdcp3sfcjqdk44@sirius.home.kraxel.org>
References: <20190808093702.29512-1-kraxel@redhat.com>
 <20190808093702.29512-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808093702.29512-2-kraxel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 10:23:20 +0000 (UTC)
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, tzimmermann@suse.de,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6MzY6NTVBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBGcm9tOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAKPiBXZSBzaG91
bGQgb25seSBjYWxsIGRtYV9tYXhfbWFwcGluZ19zaXplIGZvciBkZXZpY2VzIHRoYXQgaGF2ZSBh
IERNQSBtYXNrCj4gc2V0LCBvdGhlcndpc2Ugd2UgY2FuIHJ1biBpbnRvIGEgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIHRoYXQgd2lsbCBjcmFzaAo+IHRoZSBzeXN0ZW0uCj4gCj4gQWxzbyB3ZSBu
ZWVkIHRvIGRvIHJpZ2h0IHNoaWZ0IHRvIGdldCB0aGUgc2VjdG9ycyBmcm9tIHRoZSBzaXplIGlu
IGJ5dGVzLAo+IG5vdCBhIGxlZnQgc2hpZnQuCgpPb3BzLCB0aGF0IHdhc24ndCBtZWFudCB0byBi
ZSByZS1zZW50LCBzb3JyeS4KCmRybS1taXNjLW5leHQgbWFpbnRhaW5lcnM6IGFueSBjaGFuY2Ug
Zm9yIGEgYmFja21lcmdlIHRvIHBpY2sgdXAgdGhpcyBmaXgsCnNvIEkgZG9uJ3QgaGF2ZSB0byBj
YXJyeSBpdCBpbiBteSBicmFuY2hlcz8KCnRoYW5rcywKICBHZXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
