Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA60185E6
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43837898E1;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Wed, 08 May 2019 11:49:11 UTC
Received: from ushosting.nmnhosting.com (unknown [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 644A8895E1;
 Wed,  8 May 2019 11:49:11 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id DDDBC2DC005C;
 Wed,  8 May 2019 07:41:31 -0400 (EDT)
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x48BfEeD017421
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 8 May 2019 21:41:15 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'David Laight'" <David.Laight@ACULAB.COM>,
 "'Alastair D'Silva'" <alastair@au1.ibm.com>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-5-alastair@au1.ibm.com>
 <c98a499a4e824bcd824d5ad53d037c67@AcuMS.aculab.com>
In-Reply-To: <c98a499a4e824bcd824d5ad53d037c67@AcuMS.aculab.com>
Subject: RE: [PATCH v2 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
Date: Wed, 8 May 2019 21:41:15 +1000
Message-ID: <0a1c01d50592$f90f6f00$eb2e4d00$@d-silva.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGz7QD7bMLLz3XdMyQiMIIzLY+D4AHts+RHAcfZVGymhZij0A==
Content-Language: en-au
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 08 May 2019 21:41:26 +1000 (AEST)
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1557315692;
 bh=qGJ1gft/kRGbomR5Gk2AnhkGNE1jEj5BAJb5oyv/unk=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=D+zmQJifkhs/X6hPId/5NOett9ofrnDtUcWmjqgDQKc3MmGh9k5veKFfjfUsCtBRf
 FZFf+wE05oyytQb7I5QSxpb8YxDDNMe6ras9l+lOOdI2I4wiVfcvVdJcxhmp074fZd
 eRfG22Mm+p4YPGTk3H20/tVbabqxfxaCBFrcWbKEadAx4wluAml+keUbhh37xxzXH1
 jtnTkpsPpKimyEG7DXFY/jeFQeaJwfUkTK4Y4DMRUEvIV24VAnYN4wKYIXpQo7fIGQ
 VGyU0Ocndb2O+pHLhMLiHTXnhHlfJTLiOr/fkcrymF6eMLuTxDHq2RU1TzLj/TXOk3
 0DHxjm3K4DlaD2QfxJxOwBDRpmGvsUA8eIUifWm1Sn5HQZJb+LlRhYErwP2ZYDV3+C
 49RUeWCn3gF4iQu8ftb0irqDnHSyUrWFqyq4nWWgrsBOv2CSo+ZX1rkDkY6YAan0OZ
 R5UsEzcVLiOBK726gA7kr8p0v149w9/LtDfcs4XWO4JVXsDJSNWwTjckKovyK9ONYa
 5CpWuRo7c7nrXNmuqkuBSzsJddB0icDr3C5q9J7R5hsEiM6ZjPf1kRCxaGMNO/56Lw
 6LX/sDBs5uEivJwatqdQjgbEIoWnyCHietGWGP4y8wVI8SHGxaoZVonCIdFTE8Jl3v
 W7xdnNfZrPNxEU3wwX3/F4u4=
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
Cc: linux-fbdev@vger.kernel.org, 'Stanislaw Gruszka' <sgruszka@redhat.com>,
 'Petr Mladek' <pmladek@suse.com>, 'David Airlie' <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, 'Jassi Brar' <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 'Dan Carpenter' <dan.carpenter@oracle.com>,
 'Jose Abreu' <Jose.Abreu@synopsys.com>,
 'Tom Lendacky' <thomas.lendacky@amd.com>,
 "'James E.J. Bottomley'" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 'Steven Rostedt' <rostedt@goodmis.org>,
 'Rodrigo Vivi' <rodrigo.vivi@intel.com>, 'Kalle Valo' <kvalo@codeaurora.org>,
 'Karsten Keil' <isdn@linux-pingi.de>,
 "'Martin K. Petersen'" <martin.petersen@oracle.com>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 'Sergey Senozhatsky' <sergey.senozhatsky@gmail.com>, netdev@vger.kernel.org,
 'Enric Balletbo i Serra' <enric.balletbo@collabora.com>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Alexander Viro' <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IERhdmlkIExhaWdodCA8RGF2aWQu
TGFpZ2h0QEFDVUxBQi5DT00+Cj4gU2VudDogV2VkbmVzZGF5LCA4IE1heSAyMDE5IDc6MjAgUE0K
PiBUbzogJ0FsYXN0YWlyIEQnU2lsdmEnIDxhbGFzdGFpckBhdTEuaWJtLmNvbT47IGFsYXN0YWly
QGQtc2lsdmEub3JnCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5j
b20+OyBKb29uYXMgTGFodGluZW4KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47
IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT47Cj4gRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgRGFuCj4g
Q2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+OyBLYXJzdGVuIEtlaWwgPGlzZG5A
bGludXgtCj4gcGluZ2kuZGU+OyBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+
OyBUb20gTGVuZGFja3kKPiA8dGhvbWFzLmxlbmRhY2t5QGFtZC5jb20+OyBEYXZpZCBTLiBNaWxs
ZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Owo+IEpvc2UgQWJyZXUgPEpvc2UuQWJyZXVAc3lub3Bz
eXMuY29tPjsgS2FsbGUgVmFsbwo+IDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz47IFN0YW5pc2xhdyBH
cnVzemthIDxzZ3J1c3prYUByZWRoYXQuY29tPjsKPiBCZW5zb24gTGV1bmcgPGJsZXVuZ0BjaHJv
bWl1bS5vcmc+OyBFbnJpYyBCYWxsZXRibyBpIFNlcnJhCj4gPGVucmljLmJhbGxldGJvQGNvbGxh
Ym9yYS5jb20+OyBKYW1lcyBFLkouIEJvdHRvbWxleQo+IDxqZWpiQGxpbnV4LmlibS5jb20+OyBN
YXJ0aW4gSy4gUGV0ZXJzZW4gPG1hcnRpbi5wZXRlcnNlbkBvcmFjbGUuY29tPjsKPiBHcmVnIEty
b2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgQWxleGFuZGVyIFZpcm8K
PiA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+OyBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNv
bT47IFNlcmdleQo+IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPjsg
U3RldmVuIFJvc3RlZHQKPiA8cm9zdGVkdEBnb29kbWlzLm9yZz47IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+Owo+IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQo+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7Cj4gYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4gc2NzaUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZzsKPiBkZXZlbEBkcml2
ZXJkZXYub3N1b3NsLm9yZzsgbGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0
OiBSRTogW1BBVENIIHYyIDQvN10gbGliL2hleGR1bXAuYzogUmVwbGFjZSBhc2NpaSBib29sIGlu
Cj4gaGV4X2R1bXBfdG9fYnVmZmVyIHdpdGggZmxhZ3MKPiAKPiBGcm9tOiBBbGFzdGFpciBEJ1Np
bHZhCj4gPiBTZW50OiAwOCBNYXkgMjAxOSAwODowMgo+ID4gVG86IGFsYXN0YWlyQGQtc2lsdmEu
b3JnCj4gLi4uCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ByaW50ay5oCj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L3ByaW50ay5oCj4gPiBAQCAtNDgwLDEzICs0ODAsMTMgQEAgZW51bSB7Cj4gPiAg
CURVTVBfUFJFRklYX09GRlNFVAo+ID4gIH07Cj4gPgo+ID4gLWV4dGVybiBpbnQgaGV4X2R1bXBf
dG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwgaW50IHJvd3NpemUsCj4gPiAt
CQkJICAgICAgaW50IGdyb3Vwc2l6ZSwgY2hhciAqbGluZWJ1Ziwgc2l6ZV90IGxpbmVidWZsZW4s
Cj4gPiAtCQkJICAgICAgYm9vbCBhc2NpaSk7Cj4gPiAtCj4gPiAgI2RlZmluZSBIRVhEVU1QX0FT
Q0lJCQkJKDEgPDwgMCkKPiA+ICAjZGVmaW5lIEhFWERVTVBfU1VQUFJFU1NfUkVQRUFURUQJKDEg
PDwgMSkKPiAKPiBUaGVzZSBvdWdodCB0byBiZSBCSVQoMCkgYW5kIEJJVCgxKQoKVGhhbmtzLCBJ
J2xsIGFkZHJlc3MgdGhhdC4KCj4gCj4gPiArZXh0ZXJuIGludCBoZXhfZHVtcF90b19idWZmZXIo
Y29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVuLCBpbnQgcm93c2l6ZSwKPiA+ICsJCQkgICAgICBp
bnQgZ3JvdXBzaXplLCBjaGFyICpsaW5lYnVmLCBzaXplX3QgbGluZWJ1ZmxlbiwKPiA+ICsJCQkg
ICAgICB1NjQgZmxhZ3MpOwo+IAo+IFdoeSAndTY0IGZsYWdzJyA/Cj4gSG93IG1hbnkgZmxhZ3Mg
ZG8geW91IGVudmlzYWdlID8/Cj4gWW91ciBIRVhEVU1QX0FTQ0lJIChldGMpIGZsYWdzIGFyZSBj
dXJyZW50bHkgc2lnbmVkIHZhbHVlcyBhbmQgbWlnaHQgZ2V0Cj4gc2lnbiBleHRlbmRlZCBjYXVz
aW5nIGdyaWVmLgo+ICd1bnNpZ25lZCBpbnQgZmxhZ3MnIGlzIHByb2JhYmx5IHN1ZmZpY2llbnQu
CgpJIHdhcyB0cnlpbmcgdG8gYXZvaWQgaGF2aW5nIHRvIGNoYW5nZSB0aGUgcHJvdG90eXBlIGFn
YWluIGluIHRoZSBmdXR1cmUsIGJ1dCBpdCdzIG5vdCBhIGJpZyBkZWFsLCBpZiBlbm91Z2ggd29y
ayBnb2VzIGluIHRvIHJlcXVpcmUgbW9yZSB0aGFuIDMyIGJpdHMsIGl0IGNhbiBiZSB1cGRhdGVk
IGF0IHRoYXQgcG9pbnQuCgo+IAo+IEkndmUgbm90IHJlYWxseSBsb29rZWQgYXQgdGhlIGNvZGUs
IGl0IHNlZW1zIE9UVCBpbiBwbGFjZXMgdGhvdWdoLgoKSSdsbCB3YWl0IGZvciBtb3JlIGNvbmNy
ZXRlIGNyaXRpY2lzbXMgaGVyZSwgdGhpcyBpdCBhIGJpdCB0b28gdmFndWUgdG8gdGFrZSBhbnkg
YWN0aW9uIG9uLgoKPiBJZiBzb21lb25lIGNvcGllcyBpdCBzb21ld2hlcmUgd2hlcmUgdGhlIHBl
cmZvcm1hbmNlIG1hdHRlcnMgKEkndmUgdXNlcgo+IHNwYWNlIGNvZGUgd2hpY2ggaXMgZG9taW5h
dGVkIGJ5IGl0cyB0cmFjaW5nISkgdGhlbiB5b3UgZG9uJ3Qgd2FudCBhbGwgdGhlCj4gZnVuY3Rp
b24gY2FsbHMgYW5kIGNvbmRpdGlvbmFscyBldmVuIGlmIHlvdSB3YW50IHNvbWUgb2YgdGhlIGZ1
bmN0aW9uYWxpdHkuCgpDYWxsaW5nIGhleGR1bXAgKGV2ZW4gaW4gaXQncyB1bmFsdGVyZWQgZm9y
bSkgaW4gcGVyZm9ybWFuY2UgY3JpdGljYWwgY29kZSBpcyBhbHdheXMgZ29pbmcgdG8gc3Vjay4g
QXMgeW91IG1lbnRpb25lZCBiZWZvcmUsIGl0J3MgYWxsIGJhc2VkIGFyb3VuZCBwcmludGYuIEEg
cGVyZm9ybWFuY2UgY29uc2Npb3VzIHVzZXIgd291bGQgYmUgYmV0dGVyIG9mZiBidWlsZGluZyB0
aGVpciBjb2RlIGFyb3VuZCBoZXhfYXNjX2hpL2xvIGluc3RlYWQgKHNlZSBsaWIvdnNwcmludGYu
YzpoZXhfc3RyaW5nKS4KCi0tIApBbGFzdGFpciBEJ1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMg
NzYyIDgxOQpza3lwZTogYWxhc3RhaXJfZHNpbHZhICAgICBtc246IGFsYXN0YWlyQGQtc2lsdmEu
b3JnCmJsb2c6IGh0dHA6Ly9hbGFzdGFpci5kLXNpbHZhLm9yZyAgICBUd2l0dGVyOiBARXZpbERl
ZWNlCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
