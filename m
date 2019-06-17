Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD347B1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985388D18;
	Mon, 17 Jun 2019 07:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1488D18;
 Mon, 17 Jun 2019 07:37:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 00:37:06 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 00:36:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Subject: Re: [PATCH v3 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
In-Reply-To: <20190617020430.8708-5-alastair@au1.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <20190617020430.8708-5-alastair@au1.ibm.com>
Date: Mon, 17 Jun 2019 10:39:53 +0300
Message-ID: <87imt4vewm.fsf@intel.com>
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
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNyBKdW4gMjAxOSwgIkFsYXN0YWlyIEQnU2lsdmEiIDxhbGFzdGFpckBhdTEuaWJt
LmNvbT4gd3JvdGU6Cj4gRnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5v
cmc+Cj4KPiBJbiBvcmRlciB0byBzdXBwb3J0IGFkZGl0aW9uYWwgZmVhdHVyZXMgaW4gaGV4X2R1
bXBfdG9fYnVmZmVyLCByZXBsYWNlCj4gdGhlIGFzY2lpIGJvb2wgcGFyYW1ldGVyIHdpdGggZmxh
Z3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZh
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2NzLmMgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvaXNkbi9oYXJkd2FyZS9tSVNETi9tSVNETmlzYXIu
YyAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9tYWlsYm94L21haWxib3gtdGVzdC5j
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2FtZC94
Z2JlL3hnYmUtZHJ2LmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
eW5vcHN5cy9kd2MteGxnbWFjLWNvbW1vbi5jIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9kZWJ1Zy5jICAgICAgICAgICB8ICAzICsrLQo+ICBkcml2ZXJzL25ldC93
aXJlbGVzcy9pbnRlbC9pd2xlZ2FjeS8zOTQ1LW1hYy5jICAgIHwgIDIgKy0KPiAgZHJpdmVycy9w
bGF0Zm9ybS9jaHJvbWUvd2lsY29fZWMvZGVidWdmcy5jICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvc2NzaS9zY3NpX2xvZ2dpbmcuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKystLS0t
LQo+ICBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgZnMvc2VxX2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAzICsrLQo+ICBpbmNsdWRlL2xpbnV4L3ByaW50ay5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDggKysrKy0tLS0KPiAgbGliL2hleGR1bXAuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrLS0tLS0tLQo+ICBsaWIvdGVzdF9oZXhkdW1w
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrLS0KPiAgMTQgZmlsZXMg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2NzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9lbmdpbmVfY3MuYwo+IGluZGV4IGVlYTliZWMwNGYxYi4uNWRmNWZmZmRi
ODQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2VuZ2luZV9jcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2NzLmMKPiBAQCAtMTM0
MCw3ICsxMzQwLDcgQEAgc3RhdGljIHZvaWQgaGV4ZHVtcChzdHJ1Y3QgZHJtX3ByaW50ZXIgKm0s
IGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbikKPiAgCQlXQVJOX09OX09OQ0UoaGV4X2R1bXBf
dG9fYnVmZmVyKGJ1ZiArIHBvcywgbGVuIC0gcG9zLAo+ICAJCQkJCQlyb3dzaXplLCBzaXplb2Yo
dTMyKSwKPiAgCQkJCQkJbGluZSwgc2l6ZW9mKGxpbmUpLAo+IC0JCQkJCQlmYWxzZSkgPj0gc2l6
ZW9mKGxpbmUpKTsKPiArCQkJCQkJMCkgPj0gc2l6ZW9mKGxpbmUpKTsKPiAgCQlkcm1fcHJpbnRm
KG0sICJbJTA0enhdICVzXG4iLCBwb3MsIGxpbmUpOwo+ICAKPiAgCQlwcmV2ID0gYnVmICsgcG9z
OwoKT24gaTkxNSwKCkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
PgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
