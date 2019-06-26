Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DB56444
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6C6E314;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1540C6E17F;
 Wed, 26 Jun 2019 01:28:12 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 723DA2DC0076;
 Tue, 25 Jun 2019 21:28:11 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5Q1RmGQ029656
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2019 11:28:04 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <1166c97d5f0ff750e5871937eb1d7e3c0423bbdd.camel@d-silva.org>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Wed, 26 Jun 2019 11:27:48 +1000
In-Reply-To: <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
 <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 26 Jun 2019 11:28:07 +1000 (AEST)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1561512491;
 bh=97Ya+I+vpFl+/ylzKO5YVmt37vPd4AhTqo0+iiUyHFE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=EAancEyWaLZKLsqaXUD4dxjOqzDLwe4lEdFjaUlTi0IPpwEjhV2Lo5HHFrHoHBh2g
 3MDeWki71oPJXdWUsJWNMYOx8NwJHQt5G3pmWQB5uPepknhUpUhYU0mYJXOBwDiK6A
 ODDQvsJyAK0AIfYDx3e+IsOTOY7NiAdvATlbPxipbpKq304o7wbTnKpJt0EUaWhn8e
 sMrKgGepRlTB2n1hCKRdNLkJgZVLQXBGvgA/XI9Z7Mk4SODNPlWoH7HUbrUbYB6t3a
 DzLfo/OgyaAE08wRoYauv2h+LD5rQhqPCF0v+stxxp4hq5ugyHWnh7GEew5OQPKnTX
 cIRx/ZrPOQMxal2eJ1J79ak9/Xqc95+dEEj2W5TlCayJ6qdDL1Luzk9j5siHQakecd
 HlisONDRWhssRGUxa/YJ7248r7KMIi1R6WNO955WFW68WlcZaaAQNvRo+WkbKhnqqd
 PHbBrJM22zjhIfonkwMmksCc4pycRvJe5PH/jpbbdnhui2wrG6A0Q/ay6ewcb3v+XY
 s9pyCYwZuY2K1S6TQriWyXgPwBvVkkOZhQIx35frrWoBacHJeNXHSSACxRRi0VdV8h
 o7ttOA5+FQFRd6i5TqT/JpwzhNRyf2qBzskdYrlE2qP+idDjNSR2mvltiXOnrL51ff
 OIl4Mj+FZzR5JoYFtWTWvI/U=
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
aXplb2YobGluZSkpOwo+IAo+IEh1aD8gIFdoeSBkbyB0aGlzPwoKVGhlIGFzY2lpIHBhcmFtZXRl
ciB3YXMgcmVtb3ZlZCBmcm9tIHRoZSBzaW1wbGUgQVBJIGFzIHBlciBKYW5pJ3MKc3VnZ2VzdGlv
bi4gVGhlIHJlbWFpbmRlciB3YXMgcmVmb3JtYXR0ZWQgdG8gYXZvaWQgZXhjZWVkaW5nIHRoZSBs
aW5lCmxlbmd0aCBsaW1pdHMuCgo+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXNkbi9oYXJk
d2FyZS9tSVNETi9tSVNETmlzYXIuYwo+ID4gYi9kcml2ZXJzL2lzZG4vaGFyZHdhcmUvbUlTRE4v
bUlTRE5pc2FyLmMKPiBbXQo+ID4gQEAgLTcwLDggKzcwLDkgQEAgc2VuZF9tYm94KHN0cnVjdCBp
c2FyX2h3ICppc2FyLCB1OCBoaXMsIHU4IGNyZWcsCj4gPiB1OCBsZW4sIHU4ICptc2cpCj4gPiAg
CQkJaW50IGwgPSAwOwo+ID4gIAo+ID4gIAkJCXdoaWxlIChsIDwgKGludClsZW4pIHsKPiA+IC0J
CQkJaGV4X2R1bXBfdG9fYnVmZmVyKG1zZyArIGwsIGxlbiAtIGwsCj4gPiAzMiwgMSwKPiA+IC0J
CQkJCQkgICBpc2FyLT5sb2csIDI1NiwgMSk7Cj4gPiArCQkJCWhleF9kdW1wX3RvX2J1ZmZlcl9l
eHQobXNnICsgbCwgbGVuIC0KPiA+IGwsIDMyLCAxLAo+ID4gKwkJCQkJCSAgICAgICBpc2FyLT5s
b2csIDI1NiwKPiA+ICsJCQkJCQkgICAgICAgSEVYRFVNUF9BU0NJSSk7Cj4gCj4gQWdhaW4sIHdo
eSBkbyBhbnkgb2YgdGhlc2U/Cj4gCj4gVGhlIHBvaW50IG9mIHRoZSB3cmFwcGVyIGlzIHRvIGF2
b2lkIGNoYW5naW5nIHRoZXNlLgoKSmFuaSBtYWRlIGEgcHJldHR5IGdvb2QgcG9pbnQgdGhhdCBh
Ym91dCBoYWxmIHRoZSBjYWxsZXJzIGRpZG4ndCB3YW50CmFuIEFTQ0lJIGR1bXAsIGFuZCBwcmVz
ZW50aW5nIGEgc2ltcGxpZmllZCBBUEkgbWFrZXMgc2Vuc2UuCgpJIHdvdWxkIGFjdHVhbGx5IHB1
dCBmb3J3YXJkIHRoYXQgd2UgY29uc2lkZXIgZHJvcHBpbmcgcm93c2l6ZSBmcm9tIHRoZQpzaW1w
bGlmaWVkIEFQSSB0b28sIGFzIG1vc3QgY2FsbGVycyB1c2UgMzIsIGFuZCB0aG9zZSB0aGF0IHVz
ZSAxNiB3b3VsZApwcm9iYWJseSBiZSBPSyB3aXRoIDMyLgoKWW91ciBwcm9wb3NhbCwgb24gdGhl
IG90aGVyIGhhbmQsIG9ubHkgbWFrZXMgc2Vuc2UgaWYgdGhlcmUgd2VyZSBtYW55CmNhbGxlcnMs
IGFuZCBldmVuIHNvLCBub3QgaW4gdGhlIGZvcm0gdGhhdCB5b3UgcHJlc2VudGVkLCBzaW5jZSB0
aGF0CnJlc3VsdCBpbiBhIG1peCBvZiBib29sZWFucyAmIGJpdGZpZWxkcyB0aGF0IHlvdSB3ZXJl
IGNyaXRpY2FsIG9mLgoKLS0gCkFsYXN0YWlyIEQnU2lsdmEgICAgICAgICAgIG1vYjogMDQyMyA3
NjIgODE5CnNreXBlOiBhbGFzdGFpcl9kc2lsdmEgICAgClR3aXR0ZXI6IEBFdmlsRGVlY2UKYmxv
ZzogaHR0cDovL2FsYXN0YWlyLmQtc2lsdmEub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
