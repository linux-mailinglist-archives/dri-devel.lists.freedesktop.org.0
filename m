Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370195226F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 07:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B249189F2A;
	Tue, 25 Jun 2019 05:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0008.hostedemail.com
 [216.40.44.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5C89F27;
 Tue, 25 Jun 2019 05:01:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 8D503180295A0;
 Tue, 25 Jun 2019 05:01:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: line56_832b716e87755
X-Filterd-Recvd-Size: 3467
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 05:01:41 +0000 (UTC)
Message-ID: <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Date: Mon, 24 Jun 2019 22:01:40 -0700
In-Reply-To: <20190625031726.12173-5-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
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

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDEzOjE3ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IAo+IElu
IG9yZGVyIHRvIHN1cHBvcnQgYWRkaXRpb25hbCBmZWF0dXJlcywgcmVuYW1lIGhleF9kdW1wX3Rv
X2J1ZmZlciB0bwo+IGhleF9kdW1wX3RvX2J1ZmZlcl9leHQsIGFuZCByZXBsYWNlIHRoZSBhc2Np
aSBib29sIHBhcmFtZXRlciB3aXRoIGZsYWdzLgpbXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9lbmdpbmVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2VuZ2luZV9jcy5jCltdCj4gQEAgLTEzMzgsOSArMTMzOCw4IEBAIHN0YXRpYyB2b2lkIGhleGR1
bXAoc3RydWN0IGRybV9wcmludGVyICptLCBjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4pCj4g
IAkJfQo+ICAKPiAgCQlXQVJOX09OX09OQ0UoaGV4X2R1bXBfdG9fYnVmZmVyKGJ1ZiArIHBvcywg
bGVuIC0gcG9zLAo+IC0JCQkJCQlyb3dzaXplLCBzaXplb2YodTMyKSwKPiAtCQkJCQkJbGluZSwg
c2l6ZW9mKGxpbmUpLAo+IC0JCQkJCQlmYWxzZSkgPj0gc2l6ZW9mKGxpbmUpKTsKPiArCQkJCQkJ
cm93c2l6ZSwgc2l6ZW9mKHUzMiksIGxpbmUsCj4gKwkJCQkJCXNpemVvZihsaW5lKSkgPj0gc2l6
ZW9mKGxpbmUpKTsKCkh1aD8gIFdoeSBkbyB0aGlzPwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
c2RuL2hhcmR3YXJlL21JU0ROL21JU0ROaXNhci5jIGIvZHJpdmVycy9pc2RuL2hhcmR3YXJlL21J
U0ROL21JU0ROaXNhci5jCltdCj4gQEAgLTcwLDggKzcwLDkgQEAgc2VuZF9tYm94KHN0cnVjdCBp
c2FyX2h3ICppc2FyLCB1OCBoaXMsIHU4IGNyZWcsIHU4IGxlbiwgdTggKm1zZykKPiAgCQkJaW50
IGwgPSAwOwo+ICAKPiAgCQkJd2hpbGUgKGwgPCAoaW50KWxlbikgewo+IC0JCQkJaGV4X2R1bXBf
dG9fYnVmZmVyKG1zZyArIGwsIGxlbiAtIGwsIDMyLCAxLAo+IC0JCQkJCQkgICBpc2FyLT5sb2cs
IDI1NiwgMSk7Cj4gKwkJCQloZXhfZHVtcF90b19idWZmZXJfZXh0KG1zZyArIGwsIGxlbiAtIGws
IDMyLCAxLAo+ICsJCQkJCQkgICAgICAgaXNhci0+bG9nLCAyNTYsCj4gKwkJCQkJCSAgICAgICBI
RVhEVU1QX0FTQ0lJKTsKCkFnYWluLCB3aHkgZG8gYW55IG9mIHRoZXNlPwoKVGhlIHBvaW50IG9m
IHRoZSB3cmFwcGVyIGlzIHRvIGF2b2lkIGNoYW5naW5nIHRoZXNlLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
