Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060149A08
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC90D6E0F0;
	Tue, 18 Jun 2019 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id D67926E0B9;
 Tue, 18 Jun 2019 00:57:32 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 2797C2DC0096;
 Mon, 17 Jun 2019 20:57:31 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5I0v17n063106
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 Jun 2019 10:57:17 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <b2651117ca8a55d94b7e14e273d25199515039c3.camel@d-silva.org>
Subject: Re: [PATCH v3 2/7] lib/hexdump.c: Relax rowsize checks in
 hex_dump_to_buffer
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 18 Jun 2019 10:57:00 +1000
In-Reply-To: <94413756-c927-a4ca-dd59-47e3cc87d58d@infradead.org>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <20190617020430.8708-3-alastair@au1.ibm.com>
 <94413756-c927-a4ca-dd59-47e3cc87d58d@infradead.org>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Tue, 18 Jun 2019 10:57:27 +1000 (AEST)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1560819452;
 bh=u7VpYNn8JpTLdyHPUljh2Z7wehVtDH+n9nHQNgN6N2A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jvSabEdrNHOl7NlBGL5YcdZQfi+fpB9BO+GaqBWlR/PP+V/1JX3MOC/vdfprE+d4q
 W0UTx/depws8/q6fCe4qsmxzaHqtVkUa+v+Mp2PYjaUrKq1XeKLKJ3TPmwKDKYb7Ix
 tm9Ggg2c204E7SWf1Kzm3b7UURvQRUF+YtE1qaFXWb7M1bSsECs2dxPGyAy4TwdTwu
 YrzjrIAdGWVZDKXuSQHyDOqmmePgS4sV2lw+tlA9IZJRT1DXVvYEFcSGBy5FTId/0l
 fqkDcrBYmDhMWn+3CZbnwx7qgnLFWM0LDHsbAyxHAnRZtM+pOmK0XpTf0aiYcsAURz
 JAHTKkLHxAgXWfC3qIJOHW9mN0wLp5AYzfNmMC3C5ks7bZYsWq3PGnPXMMgDkMzyop
 xeuPVBo2+37GGuWiHd1PVStu6wl0eKfSBJgyWJvhXbnAdDsbuqzYFH9Boz+O6C1oWT
 2Stkwa1MvSezs7en91awfFUNUzrvwbjOv/IZIK0ZFoGni+dz4kIbQSJzdLLHGKQkgV
 TVlkQn6TAJU90DRRiC92kuMldKfElutBjDwzhohJifPcEvF9T9IrE1SS4Zaz3ft2Rz
 ho6zF2/9j+ouJCRd5AcHglBo4L8CMDItufZhI5pCGZ7PhbKy0bPXekMmqRlgelk8er
 vDFIJF20+9ye5cMw79l/tHxg=
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

T24gTW9uLCAyMDE5LTA2LTE3IGF0IDE1OjQ3IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4g
SGksCj4gSnVzdCBhIGNvbW1lbnQgc3R5bGUgbml0IGJlbG93Li4uCj4gCj4gT24gNi8xNi8xOSA3
OjA0IFBNLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3RlOgo+ID4gRnJvbTogQWxhc3RhaXIgRCdTaWx2
YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUg
aGFyZGNvZGVkIHJvdyBsaW1pdHMgYW5kIGFsbG93cyBmb3IKPiA+IG90aGVyIGxlbmd0aHMuIFRo
ZXNlIGxlbmd0aHMgbXVzdCBzdGlsbCBiZSBhIG11bHRpcGxlIG9mCj4gPiBncm91cHNpemUuCj4g
PiAKPiA+IFRoaXMgYWxsb3dzIHN0cnVjdHMgdGhhdCBhcmUgbm90IDE2LzMyIGJ5dGVzIHRvIGRp
c3BsYXkgb24KPiA+IGEgc2luZ2xlIGxpbmUuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggYWxzbyBleHBh
bmRzIHRoZSBzZWxmLXRlc3RzIHRvIHRlc3Qgcm93IHNpemVzCj4gPiB1cCB0byA2NCBieXRlcyAo
dGhvdWdoIHRoZXkgY2FuIG5vdyBiZSBhcmJpdHJhcmlseSBsb25nKS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+Cj4gPiAtLS0K
PiA+ICBsaWIvaGV4ZHVtcC5jICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KPiA+ICBsaWIvdGVzdF9oZXhkdW1wLmMgfCA1MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiAtLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDc1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvbGliL2hleGR1bXAuYyBiL2xpYi9oZXhkdW1wLmMKPiA+IGluZGV4IDgxYjcwZWQzNzIwOS4u
Mzk0MzUwN2JjMGU5IDEwMDY0NAo+ID4gLS0tIGEvbGliL2hleGR1bXAuYwo+ID4gKysrIGIvbGli
L2hleGR1bXAuYwo+ID4gQEAgLTI0NiwxNyArMjQ4LDI5IEBAIHZvaWQgcHJpbnRfaGV4X2R1bXAo
Y29uc3QgY2hhciAqbGV2ZWwsIGNvbnN0Cj4gPiBjaGFyICpwcmVmaXhfc3RyLCBpbnQgcHJlZml4
X3R5cGUsCj4gPiAgewo+ID4gIAljb25zdCB1OCAqcHRyID0gYnVmOwo+ID4gIAlpbnQgaSwgbGlu
ZWxlbiwgcmVtYWluaW5nID0gbGVuOwo+ID4gLQl1bnNpZ25lZCBjaGFyIGxpbmVidWZbMzIgKiAz
ICsgMiArIDMyICsgMV07Cj4gPiArCXVuc2lnbmVkIGNoYXIgKmxpbmVidWY7Cj4gPiArCXVuc2ln
bmVkIGludCBsaW5lYnVmX2xlbjsKPiA+ICAKPiA+IC0JaWYgKHJvd3NpemUgIT0gMTYgJiYgcm93
c2l6ZSAhPSAzMikKPiA+IC0JCXJvd3NpemUgPSAxNjsKPiA+ICsJaWYgKHJvd3NpemUgJSBncm91
cHNpemUpCj4gPiArCQlyb3dzaXplIC09IHJvd3NpemUgJSBncm91cHNpemU7Cj4gPiArCj4gPiAr
CS8qIFdvcnN0IGNhc2UgbGluZSBsZW5ndGg6Cj4gPiArCSAqIDIgaGV4IGNoYXJzICsgc3BhY2Ug
cGVyIGJ5dGUgaW4sIDIgc3BhY2VzLCAxIGNoYXIgcGVyIGJ5dGUKPiA+IGluLCBOVUxMCj4gPiAr
CSAqLwo+IAo+IEFjY29yZGluZyB0byBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxl
LnJzdDoKPiAKPiBUaGUgcHJlZmVycmVkIHN0eWxlIGZvciBsb25nIChtdWx0aS1saW5lKSBjb21t
ZW50cyBpczoKPiAKPiAuLiBjb2RlLWJsb2NrOjogYwo+IAo+IAkvKgo+IAkgKiBUaGlzIGlzIHRo
ZSBwcmVmZXJyZWQgc3R5bGUgZm9yIG11bHRpLWxpbmUKPiAJICogY29tbWVudHMgaW4gdGhlIExp
bnV4IGtlcm5lbCBzb3VyY2UgY29kZS4KPiAJICogUGxlYXNlIHVzZSBpdCBjb25zaXN0ZW50bHku
Cj4gCSAqCj4gCSAqIERlc2NyaXB0aW9uOiAgQSBjb2x1bW4gb2YgYXN0ZXJpc2tzIG9uIHRoZSBs
ZWZ0IHNpZGUsCj4gCSAqIHdpdGggYmVnaW5uaW5nIGFuZCBlbmRpbmcgYWxtb3N0LWJsYW5rIGxp
bmVzLgo+IAkgKi8KPiAKClRoYW5rcyBSYW5keSwgSSdsbCBhZGRyZXNzIHRoaXMuCgoKLS0gCkFs
YXN0YWlyIEQnU2lsdmEgICAgICAgICAgIG1vYjogMDQyMyA3NjIgODE5CnNreXBlOiBhbGFzdGFp
cl9kc2lsdmEgICAgClR3aXR0ZXI6IEBFdmlsRGVlY2UKYmxvZzogaHR0cDovL2FsYXN0YWlyLmQt
c2lsdmEub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
