Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF652483
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103F189FC9;
	Tue, 25 Jun 2019 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F1AA89F0B;
 Tue, 25 Jun 2019 05:06:42 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id A2C4A2DC005B;
 Tue, 25 Jun 2019 01:06:41 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5P56DR4022607
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 25 Jun 2019 15:06:29 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Tue, 25 Jun 2019 15:06:13 +1000
In-Reply-To: <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
 <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Tue, 25 Jun 2019 15:06:37 +1000 (AEST)
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1561439202;
 bh=ciUqZASdiG9qaTP/PKSFriQCA2JczzepFyCfhQPhnVk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=K4gLgQWu25eleaN8DIeSz5E82cI8K0smK5D3ZMpLjBFJrknUqV9V+eylalpbQXRAM
 nmEfhzWvgda7JuxTqo/SzkupuQp4odwSE5eKSMo5RCVBzSG9hQgA/2yqBEFIexBxOT
 i9vCKnVN9a9mDTxg3U1oNbYXq0GD4w40bt+gnrvVfRfHlUt7CzmQxv2ITaF01BU5v0
 qZonJ/jE4kiTWy7bQrfjqbazrpEygb0DU6gCobQX5qblC7fRwhvF4Sq1I5FxM2qyhg
 8GI0GBlW0Lvvwa7ilfXZ4x3AaZQNQL9XQbQNvJOLXG+h38c4UU6rLCHqjUeiUTV7I9
 9YOGia5GJedY1w/4Tr8d8CBihfAg/swFyuKTugjzhJ3nduRG/LNj+cPcUZRU9QpFNl
 2JMD91ZFIq08WBl0d90UMFWl7mSZfbGc4bFGkopV/6ReOk/vUtz69zueTfYfrFWzSU
 s+Er1jtAFNs/BmK+rQ0XkTqVSRlwAjaqyFZOLj6kw381sp7VTpaEupsP/8y3Je8A6v
 4UugchG2zDEWWEYN/tFyApbfSvLIe6pKK/LvgAQvjqkwlyRa0sBz8pzBqHKDxO1zyV
 JYMRMzTpGfe9MrWWhqER/P+y3YGfeX1gbEPw1Scpeut1XCY2CNUcsoDJlTQlBXKJk2
 DpMk176r7iASSHUrxiLPF0zo=
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

T24gTW9uLCAyMDE5LTA2LTI0IGF0IDIyOjAxIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDYtMjUgYXQgMTM6MTcgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEgd3JvdGU6
Cj4gPiBGcm9tOiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KPiA+IAo+
ID4gSW4gb3JkZXIgdG8gc3VwcG9ydCBhZGRpdGlvbmFsIGZlYXR1cmVzLCByZW5hbWUgaGV4X2R1
bXBfdG9fYnVmZmVyCj4gPiB0bwo+ID4gaGV4X2R1bXBfdG9fYnVmZmVyX2V4dCwgYW5kIHJlcGxh
Y2UgdGhlIGFzY2lpIGJvb2wgcGFyYW1ldGVyIHdpdGgKPiA+IGZsYWdzLgo+IFtdCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2NzLmMKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZW5naW5lX2NzLmMKPiBbXQo+ID4gQEAgLTEzMzgsOSAr
MTMzOCw4IEBAIHN0YXRpYyB2b2lkIGhleGR1bXAoc3RydWN0IGRybV9wcmludGVyICptLAo+ID4g
Y29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuKQo+ID4gIAkJfQo+ID4gIAo+ID4gIAkJV0FSTl9P
Tl9PTkNFKGhleF9kdW1wX3RvX2J1ZmZlcihidWYgKyBwb3MsIGxlbiAtIHBvcywKPiA+IC0JCQkJ
CQlyb3dzaXplLCBzaXplb2YodTMyKSwKPiA+IC0JCQkJCQlsaW5lLCBzaXplb2YobGluZSksCj4g
PiAtCQkJCQkJZmFsc2UpID49Cj4gPiBzaXplb2YobGluZSkpOwo+ID4gKwkJCQkJCXJvd3NpemUs
IHNpemVvZih1MzIpLAo+ID4gbGluZSwKPiA+ICsJCQkJCQlzaXplb2YobGluZSkpID49Cj4gPiBz
aXplb2YobGluZSkpOwo+IAo+IEh1aD8gIFdoeSBkbyB0aGlzPwo+IAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaXNkbi9oYXJkd2FyZS9tSVNETi9tSVNETmlzYXIuYwo+ID4gYi9kcml2ZXJzL2lz
ZG4vaGFyZHdhcmUvbUlTRE4vbUlTRE5pc2FyLmMKPiBbXQo+ID4gQEAgLTcwLDggKzcwLDkgQEAg
c2VuZF9tYm94KHN0cnVjdCBpc2FyX2h3ICppc2FyLCB1OCBoaXMsIHU4IGNyZWcsCj4gPiB1OCBs
ZW4sIHU4ICptc2cpCj4gPiAgCQkJaW50IGwgPSAwOwo+ID4gIAo+ID4gIAkJCXdoaWxlIChsIDwg
KGludClsZW4pIHsKPiA+IC0JCQkJaGV4X2R1bXBfdG9fYnVmZmVyKG1zZyArIGwsIGxlbiAtIGws
Cj4gPiAzMiwgMSwKPiA+IC0JCQkJCQkgICBpc2FyLT5sb2csIDI1NiwgMSk7Cj4gPiArCQkJCWhl
eF9kdW1wX3RvX2J1ZmZlcl9leHQobXNnICsgbCwgbGVuIC0KPiA+IGwsIDMyLCAxLAo+ID4gKwkJ
CQkJCSAgICAgICBpc2FyLT5sb2csIDI1NiwKPiA+ICsJCQkJCQkgICAgICAgSEVYRFVNUF9BU0NJ
SSk7Cj4gCj4gQWdhaW4sIHdoeSBkbyBhbnkgb2YgdGhlc2U/Cj4gCj4gVGhlIHBvaW50IG9mIHRo
ZSB3cmFwcGVyIGlzIHRvIGF2b2lkIGNoYW5naW5nIHRoZXNlLgo+IAo+IAoKVGhlIGNoYW5nZSBh
Y3Rpb25zIEphbmkncyBzdWdnZXN0aW9uOgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82LzIw
LzM0MwoKCi0tIApBbGFzdGFpciBEJ1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMgNzYyIDgxOQpz
a3lwZTogYWxhc3RhaXJfZHNpbHZhICAgIApUd2l0dGVyOiBARXZpbERlZWNlCmJsb2c6IGh0dHA6
Ly9hbGFzdGFpci5kLXNpbHZhLm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
