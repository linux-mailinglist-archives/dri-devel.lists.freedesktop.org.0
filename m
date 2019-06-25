Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70F522B3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 07:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D3989F19;
	Tue, 25 Jun 2019 05:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0060.hostedemail.com
 [216.40.44.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE4889F19;
 Tue, 25 Jun 2019 05:17:50 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 9E83B837F24C;
 Tue, 25 Jun 2019 05:17:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: spade50_7d8321185044f
X-Filterd-Recvd-Size: 3418
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 05:17:42 +0000 (UTC)
Message-ID: <45177fdaff2bf2a2538e34dab175488d2ba9a46c.camel@perches.com>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@d-silva.org>
Date: Mon, 24 Jun 2019 22:17:40 -0700
In-Reply-To: <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
 <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
 <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDE1OjA2ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IE9uIE1vbiwgMjAxOS0wNi0yNCBhdCAyMjowMSAtMDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6
Cj4gPiBPbiBUdWUsIDIwMTktMDYtMjUgYXQgMTM6MTcgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEg
d3JvdGU6Cj4gPiA+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3Jn
Pgo+ID4gPiAKPiA+ID4gSW4gb3JkZXIgdG8gc3VwcG9ydCBhZGRpdGlvbmFsIGZlYXR1cmVzLCBy
ZW5hbWUgaGV4X2R1bXBfdG9fYnVmZmVyCj4gPiA+IHRvCj4gPiA+IGhleF9kdW1wX3RvX2J1ZmZl
cl9leHQsIGFuZCByZXBsYWNlIHRoZSBhc2NpaSBib29sIHBhcmFtZXRlciB3aXRoCj4gPiA+IGZs
YWdzLgo+ID4gW10KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2VuZ2luZV9jcy5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2Nz
LmMKPiA+IFtdCj4gPiA+IEBAIC0xMzM4LDkgKzEzMzgsOCBAQCBzdGF0aWMgdm9pZCBoZXhkdW1w
KHN0cnVjdCBkcm1fcHJpbnRlciAqbSwKPiA+ID4gY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVu
KQo+ID4gPiAgCQl9Cj4gPiA+ICAKPiA+ID4gIAkJV0FSTl9PTl9PTkNFKGhleF9kdW1wX3RvX2J1
ZmZlcihidWYgKyBwb3MsIGxlbiAtIHBvcywKPiA+ID4gLQkJCQkJCXJvd3NpemUsIHNpemVvZih1
MzIpLAo+ID4gPiAtCQkJCQkJbGluZSwgc2l6ZW9mKGxpbmUpLAo+ID4gPiAtCQkJCQkJZmFsc2Up
ID49Cj4gPiA+IHNpemVvZihsaW5lKSk7Cj4gPiA+ICsJCQkJCQlyb3dzaXplLCBzaXplb2YodTMy
KSwKPiA+ID4gbGluZSwKPiA+ID4gKwkJCQkJCXNpemVvZihsaW5lKSkgPj0KPiA+ID4gc2l6ZW9m
KGxpbmUpKTsKPiA+IAo+ID4gSHVoPyAgV2h5IGRvIHRoaXM/CltdCj4gVGhlIGNoYW5nZSBhY3Rp
b25zIEphbmkncyBzdWdnZXN0aW9uOgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzYvMjAv
MzQzCgpJIHRoaW5rIHlvdSBuZWVkIHRvIHJlYWQgdGhpcyBjaGFuZ2UgYWdhaW4uCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
