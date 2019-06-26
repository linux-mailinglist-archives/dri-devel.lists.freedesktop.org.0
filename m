Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6256442
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D616E313;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C5896E1BB;
 Wed, 26 Jun 2019 01:28:44 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id E68172DC0076;
 Tue, 25 Jun 2019 21:28:43 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5Q1SOP1029666
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2019 11:28:39 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <ef3aac0cb37fd7bb421db313e839809fd7649d05.camel@d-silva.org>
Subject: Re: [PATCH v4 5/7] lib/hexdump.c: Allow multiple groups to be
 separated by lines '|'
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Wed, 26 Jun 2019 11:28:01 +1000
In-Reply-To: <c364c36338d385eba60c523828ad8995c792ae4d.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-6-alastair@au1.ibm.com>
 <c364c36338d385eba60c523828ad8995c792ae4d.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 26 Jun 2019 11:28:40 +1000 (AEST)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1561512524;
 bh=8vdGphBYIKXv89awGOAQ/cgWRG22AyeDg2eeDYLZ3zI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=alSxZcqu57hfIi9j9AhbXS8R6Sp8P9EIyLX38MQJ9PvxVXzIuDLw+GMwM5K31tSbM
 gzdS9k+A1COhdwdvmxUTT7neeouLyzPVXBbbQIUqbYpng9jjLKSTVkUtfCzbM2traV
 66aBsJesrmb2pquAr+ikAnlFtIz2MX8COw6xImMdDzX7cORTSmL/7suBd2fWgHGcSa
 CSgtsbZsT6q7z1xworHDg8t0cQqtep34bRKMyEiFivuEsvS7KvfT0XDE+ir1QbaFpe
 qNJCJvTwUWvEm1B+kFjLaSMS3n+SpewSyAwVWdMioky2aZjNRxFrSlIwEMfnHy7fKu
 37248Myte0LZ3cwEfXQtWD4I3ropVT1011THvyQlNqoj5HYjPxJXzQS6TEePLg55il
 d1e10RdRKAs0H649v7SEHnGTaG5XhEUbgoBfaN+rXX2kxC+uvk3GCCKHYYkcJZAAgv
 0NREGULbA9C+5QStsPe8IqzAuUhhWmKLguptMEYpWMMi4DrZ/q7woDAkIOBtw70S9z
 xBmgxWDEVL3pwhhtGcpR0yZETTuHII506PHFURlIBdSloaX9GFdyV5O/4o4dYbggD2
 FPLHvHF+9fk1N7j7sdJKzKIP2EWISpMCfTv7hDzkRR1480DJuZxLGr/YfvYJtT2cBa
 aQ8Wmv3nDA7FqMwj0k32Ebg8=
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

T24gTW9uLCAyMDE5LTA2LTI0IGF0IDIyOjM3IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDYtMjUgYXQgMTM6MTcgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEgd3JvdGU6
Cj4gPiBGcm9tOiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KPiA+IAo+
ID4gV2l0aCB0aGUgd2lkZXIgZGlzcGxheSBmb3JtYXQsIGl0IGNhbiBiZWNvbWUgaGFyZCB0byBp
ZGVudGlmeSBob3cKPiA+IG1hbnkKPiA+IGJ5dGVzIGludG8gdGhlIGxpbmUgeW91IGFyZSBsb29r
aW5nIGF0Lgo+ID4gCj4gPiBUaGUgcGF0Y2ggYWRkcyBuZXcgZmxhZ3MgdG8gaGV4X2R1bXBfdG9f
YnVmZmVyKCkgYW5kCj4gPiBwcmludF9oZXhfZHVtcCgpIHRvCj4gPiBwcmludCB2ZXJ0aWNhbCBs
aW5lcyB0byBzZXBhcmF0ZSBldmVyeSBOIGdyb3VwcyBvZiBieXRlcy4KPiA+IAo+ID4gZWcuCj4g
PiBidWY6MDAwMDAwMDA6IDQ1NGQ0MTRlIDQzNDE1MDUzfDRlNDk1ZjQ1Cj4gPiAwMDU4NDU0NCAg
TkFNRVNQQUN8RV9JTkRFWC4KPiA+IGJ1ZjowMDAwMDAxMDogMDAwMDAwMDAgMDAwMDAwMDJ8MDAw
MDAwMDAKPiA+IDAwMDAwMDAwICAuLi4uLi4uLnwuLi4uLi4uLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KPiA+IC0tLQo+ID4g
IGluY2x1ZGUvbGludXgvcHJpbnRrLmggfCAgMyArKysKPiA+ICBsaWIvaGV4ZHVtcC5jICAgICAg
ICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAtLS0tLS0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ByaW50ay5oIGIvaW5jbHVkZS9saW51
eC9wcmludGsuaAo+IFtdCj4gPiBAQCAtNDg1LDYgKzQ4NSw5IEBAIGVudW0gewo+ID4gIAo+ID4g
ICNkZWZpbmUgSEVYRFVNUF9BU0NJSQkJCUJJVCgwKQo+ID4gICNkZWZpbmUgSEVYRFVNUF9TVVBQ
UkVTU19SRVBFQVRFRAlCSVQoMSkKPiA+ICsjZGVmaW5lIEhFWERVTVBfMl9HUlBfTElORVMJCUJJ
VCgyKQo+ID4gKyNkZWZpbmUgSEVYRFVNUF80X0dSUF9MSU5FUwkJQklUKDMpCj4gPiArI2RlZmlu
ZSBIRVhEVU1QXzhfR1JQX0xJTkVTCQlCSVQoNCkKPiAKPiBUaGVzZSBhcmVuJ3QgcmVhbGx5IGJp
dHMgYXMgb25seSBvbmUgdmFsdWUgc2hvdWxkIGJlIHNldAo+IGFzIDggb3ZlcnJpZGVzIDQgYW5k
IDQgb3ZlcnJpZGVzIDIuCgpUaGlzIHNob3VsZCBiZSB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgYXMg
d2Ugc2hvdWxkIGJlIGVtaXR0aW5nIGFsdGVybmF0ZQpzZXBlcmF0b3JzIGJhc2VkIG9uIHRoZSBz
bWFsbGVzdCBncm91cGluZyAoMiBpbXBsaWVzIDQgYW5kIDgsIGFuZCA0CmltcGxpZXMgOCkuIEkn
bGwgZml4IHRoZSBsb2dpYy4KCkkgY2FuJ3QgY29tZSB1cCB3aXRoIGEgYmV0dGVyIHdheSB0byBy
ZXByZXNlbnQgdGhlc2Ugd2l0aG91dCBtYWtpbmcgdGhlCkFQSSBtb3JlIGNvbXBsZXgsIGlmIHlv
dSBoYXZlIGEgc3VnZ2VzdGlvbiwgSSdtIGhhcHB5IHRvIGhlYXIgaXQuCgo+IAo+IEkgd291bGQg
YWxzbyBleHBlY3QgdGhpcyB0byBiZSBhIHZhbHVlIG9mIDIgaW4geW91ciBhYm92ZQo+IGV4YW1w
bGUsIHJhdGhlciB0aGFuIDguICBJdCdzIGRlc2NyaWJlZCBhcyBncm91cHMgbm90IGJ5dGVzLgo+
IAo+IFRoZSBleGFtcGxlIGlzIHNob3dpbmcgYSB3aGF0IHdvdWxkIG5vcm1hbGx5IGJlIGEgc3Bh
Y2UgJyAnCj4gc2VwYXJhdG9yIGFzIGEgdmVydGljYWwgYmFyICd8JyBldmVyeSAybmQgZ3JvdXBp
bmcuCj4gCgpUaGUgYWJvdmUgZXhhbXBsZSBzaG93cyBhIGdyb3VwIHNpemUgb2YgNCBieXRlcywg
YW5kCkhFWERVTVBfMl9HUlBfTElORVMgc2V0LCB3aXRoIDIgZ3JvdXBzIGJlaW5nIDggYnl0ZXMu
CgpJJ2xsIG1ha2UgdGhhdCBjbGVhcmVyIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCi0tIApBbGFz
dGFpciBEJ1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMgNzYyIDgxOQpza3lwZTogYWxhc3RhaXJf
ZHNpbHZhICAgIApUd2l0dGVyOiBARXZpbERlZWNlCmJsb2c6IGh0dHA6Ly9hbGFzdGFpci5kLXNp
bHZhLm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
