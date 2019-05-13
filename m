Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33461C413
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39386892C0;
	Tue, 14 May 2019 07:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13C0D896C4;
 Mon, 13 May 2019 07:35:59 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 231832DC0069;
 Mon, 13 May 2019 03:35:57 -0400 (EDT)
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x4D7ZjC4057687
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 13 May 2019 17:35:46 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Geert Uytterhoeven'" <geert@linux-m68k.org>,
 "'Alastair D'Silva'" <alastair@au1.ibm.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
 <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVefYTgHzGKBc0ebku1z8V3wsM0ydN+6-S2nFKaB8eH_Q@mail.gmail.com>
Subject: RE: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
Date: Mon, 13 May 2019 17:35:47 +1000
Message-ID: <04de01d5095e$7f6af730$7e40e590$@d-silva.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQGz7QD7bMLLz3XdMyQiMIIzLY+D4AJkmwv+AXBy99KmjDiokA==
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Mon, 13 May 2019 17:35:53 +1000 (AEST)
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1557732958;
 bh=aa+i95blYOSxhGwoRx9zFnMo5oG4XUfXT748BNmFJIU=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=aSet9rLYykQxcyXFS2GF9u8JjdaPfKwlu1qpX3Ek5B3X+zmGgF+1WtmJH8QDHUKVR
 POJW18jnNWqKlc9WV/y9wswfLzQAdORTjoBGt6wbLb+XQzz+YSA8YT8exQIamI1hKA
 NgBZZqdAOIFcj5X4mKMcpOALzVECo4ayuE60g+CPH7CvPt6lSOfmFpWRNnpn+wYPF4
 P6SqYrz3uRsFocaNWbLb6GRXp8TE8CKtYMYUEeB/QfMAnGJ7U/FZrL/hYqxDE0ryBG
 /8/mtlXRqGs0pBJCO5WKEQDm1lzWRXt40l8YPyEBjUBm/McmvG1Iafbx2EfRhysC43
 vKIF2BpJNTxkposUCWaXgJuoNekulC6f7wlHUlNkNooeQHpAKXYuClI/ikmvCrnCff
 Vy/fK7azMrun4S9M5k0UdX9IUayiM9Y1AVv1iAHjIJrMhP8ELgeNkTypKa35MyJMjx
 LmIQVy3zVwlAOW1mMnZhrLapo90FKO26dOcJq140LOTx0ZahhIuR6KISKy+FuwYBfp
 cNemDFNeNEkfGRWxw0VhCsOArzkI9iJJSDwhVYx2DI4O1xJX2kFEObBeq4rx25ClRK
 PDCjVeuymuPU3aUBQKrJtdTxur1fcbH6SvSnl3OKtvCVGly9Za8zstBXG1KdRUNuvp
 kOJclMVcOxeDGLfkA1Mcr7AQ=
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
Cc: 'Linux Fbdev development list' <linux-fbdev@vger.kernel.org>,
 'Stanislaw Gruszka' <sgruszka@redhat.com>, 'Petr Mladek' <pmladek@suse.com>,
 'David Airlie' <airlied@linux.ie>,
 'DRI Development' <dri-devel@lists.freedesktop.org>,
 'driverdevel' <devel@driverdev.osuosl.org>,
 'scsi' <linux-scsi@vger.kernel.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org,
 'Intel Graphics Development' <intel-gfx@lists.freedesktop.org>,
 'Dan Carpenter' <dan.carpenter@oracle.com>,
 'Jose Abreu' <Jose.Abreu@synopsys.com>,
 'Tom Lendacky' <thomas.lendacky@amd.com>,
 "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
 'Linux FS Devel' <linux-fsdevel@vger.kernel.org>,
 'Steven Rostedt' <rostedt@goodmis.org>,
 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Kalle Valo' <kvalo@codeaurora.org>,
 'Karsten Keil' <isdn@linux-pingi.de>,
 "'Martin K. Petersen'" <martin.petersen@oracle.com>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 'linux-wireless' <linux-wireless@vger.kernel.org>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>,
 'David Laight' <David.Laight@aculab.com>, 'netdev' <netdev@vger.kernel.org>,
 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Alexander Viro' <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gU2VudDogTW9uZGF5LCAxMyBNYXkgMjAxOSA1OjAxIFBN
Cj4gVG86IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGF1MS5pYm0uY29tPgo+IENjOiBhbGFz
dGFpckBkLXNpbHZhLm9yZzsgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNv
bT47IEpvb25hcwo+IExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsg
Um9kcmlnbyBWaXZpCj4gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyCj4gPGRhbmllbEBmZndsbC5jaD47IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT47IEthcnN0ZW4KPiBLZWlsIDxpc2Ru
QGxpbnV4LXBpbmdpLmRlPjsgSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPjsg
VG9tCj4gTGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQuY29tPjsgRGF2aWQgUy4gTWlsbGVy
Cj4gPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBKb3NlIEFicmV1IDxKb3NlLkFicmV1QHN5bm9wc3lz
LmNvbT47IEthbGxlCj4gVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+OyBTdGFuaXNsYXcgR3J1
c3prYSA8c2dydXN6a2FAcmVkaGF0LmNvbT47Cj4gQmVuc29uIExldW5nIDxibGV1bmdAY2hyb21p
dW0ub3JnPjsgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYQo+IDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPjsgSmFtZXMgRS5KLiBCb3R0b21sZXkKPiA8amVqYkBsaW51eC5pYm0uY29tPjsgTWFy
dGluIEsuIFBldGVyc2VuIDxtYXJ0aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT47Cj4gR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEFsZXhhbmRlciBWaXJvCj4g
PHZpcm9AemVuaXYubGludXgub3JnLnVrPjsgUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+
OyBTZXJnZXkKPiBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbT47IFN0
ZXZlbiBSb3N0ZWR0Cj4gPHJvc3RlZHRAZ29vZG1pcy5vcmc+OyBEYXZpZCBMYWlnaHQgPERhdmlk
LkxhaWdodEBhY3VsYWIuY29tPjsgQW5kcmV3Cj4gTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPjsgSW50ZWwgR3JhcGhpY3MgRGV2ZWxvcG1lbnQgPGludGVsLQo+IGdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBEUkkgRGV2ZWxvcG1lbnQgPGRyaS0KPiBkZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnPjsgbmV0ZGV2IDxuZXRkZXZAdmdlci5rZXJuZWwub3JnPjsKPiBhdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtd2lyZWxlc3MgPGxpbnV4LXdpcmVsZXNzQHZn
ZXIua2VybmVsLm9yZz47Cj4gc2NzaSA8bGludXgtc2NzaUB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51
eCBGYmRldiBkZXZlbG9wbWVudCBsaXN0IDxsaW51eC0KPiBmYmRldkB2Z2VyLmtlcm5lbC5vcmc+
OyBkcml2ZXJkZXZlbCA8ZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmc+OyBMaW51eAo+IEZTIERl
dmVsIDxsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDMvN10gbGliL2hleGR1bXAuYzogT3B0aW9uYWxseSBzdXBwcmVzcyBsaW5lcyBvZgo+IHJl
cGVhdGVkIGJ5dGVzCj4gCj4gSGkgQWxhc3RhaXIsCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQoKQW5kIHRoYW5rcyBmb3IgeW91ciBwb2xpdGVuZXNzIDopCgo+IAo+IE9uIFdlZCwgTWF5IDgs
IDIwMTkgYXQgOTowNCBBTSBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBhdTEuaWJtLmNvbT4K
PiB3cm90ZToKPiA+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3Jn
Pgo+ID4KPiA+IFNvbWUgYnVmZmVycyBtYXkgb25seSBiZSBwYXJ0aWFsbHkgZmlsbGVkIHdpdGgg
dXNlZnVsIGRhdGEsIHdoaWxlIHRoZQo+ID4gcmVzdCBpcyBwYWRkZWQgKHR5cGljYWxseSB3aXRo
IDB4MDAgb3IgMHhmZikuCj4gPgo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgZmxhZyB0byBh
bGxvdyB0aGUgc3VwcmVzc2lvbiBvZiBsaW5lcyBvZgo+ID4gcmVwZWF0ZWQgYnl0ZXMsCj4gCj4g
R2l2ZW4gcHJpbnRfaGV4X2R1bXAoKSBvcGVyYXRlcyBvbiBlbnRpdGllcyBvZiBncm91cHNpemUg
KDEsIDIsIDQsIG9yIDgpCj4gYnl0ZXMsIHdvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBj
b25zaWRlciByZXBlYXRlZCBncm91cHMgaW5zdGVhZCBvZgo+IHJlcGVhdGVkIGJ5dGVzPwoKTWF5
YmUsIGl0IHdvdWxkIG1lYW4gdGhhdCBzdWJzZXF1ZW50IGFkZHJlc3NlcyBtYXkgbm90IGJlIGEg
bXVsdGlwbGUgb2Ygcm93c2l6ZSB0aG91Z2gsIHdoaWNoIGlzIHVzZWZ1bC4KCj4gPiB3aGljaCBh
cmUgcmVwbGFjZWQgd2l0aCAnKiogU2tpcHBlZCAldSBieXRlcyBvZiB2YWx1ZSAweCV4ICoqJwo+
IAo+IFVzaW5nIGEgY3VzdG9tIG1lc3NhZ2UgaW5zdGVhZCBvZiBqdXN0ICIqIiwgbGlrZSAiaGV4
ZHVtcCIgdXNlcywgd2lsbCByZXF1aXJlCj4gcHJlcHJvY2Vzc2luZyB0aGUgb3V0cHV0IHdoZW4g
cmVjb3ZlcmluZyB0aGUgb3JpZ2luYWwgYmluYXJ5IGRhdGEgYnkKPiBmZWVkaW5nIGl0IHRvIGUu
Zy4gInh4ZCIuCj4gVGhpcyBtYXkgc291bmQgd29yc2UgdGhhbiBpdCBpcywgdGhvdWdoLCBhcyBJ
IG5ldmVyIGdvdCAieHhkIiB0byB3b3JrIHdpdGhvdXQKPiBwcmVwcm9jZXNzaW5nIGFueXdheSA7
LSkKCkkgdGhpbmsgc2hvd2luZyB0aGUgZGV0YWlscyBvZiB0aGUgc2tpcHBlZCB2YWx1ZXMgaXMg
dXNlZnVsIHdoZW4gcmVhZGluZyB0aGUgb3V0cHV0IGRpcmVjdGx5LiBJbiBzaXR1YXRpb25zIHdo
ZXJlIGJpbmFyeSBleHRyYWN0cyBhcmUgZGVzaXJlZCwgdGhlIGZlYXR1cmUgY2FuIGFsd2F5cyBi
ZSBkaXNhYmxlZC4KCi0tIApBbGFzdGFpciBEJ1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMgNzYy
IDgxOQpza3lwZTogYWxhc3RhaXJfZHNpbHZhICAgICBtc246IGFsYXN0YWlyQGQtc2lsdmEub3Jn
CmJsb2c6IGh0dHA6Ly9hbGFzdGFpci5kLXNpbHZhLm9yZyAgICBUd2l0dGVyOiBARXZpbERlZWNl
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
