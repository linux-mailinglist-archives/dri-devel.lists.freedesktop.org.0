Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F44C7F8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DDD6E503;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 067156E48D;
 Thu, 20 Jun 2019 01:14:37 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 69B9C2DC005B;
 Wed, 19 Jun 2019 21:14:36 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5K1E6f4079317
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 20 Jun 2019 11:14:22 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <9456ca2a4ae827635bb6d864e5095a9e51f2ac45.camel@d-silva.org>
Subject: Re: [PATCH v3 0/7] Hexdump Enhancements
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Thu, 20 Jun 2019 11:14:06 +1000
In-Reply-To: <d8316be322f33ea67640ff83f2248fe433078407.camel@perches.com>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
 <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
 <d8316be322f33ea67640ff83f2248fe433078407.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Thu, 20 Jun 2019 11:14:32 +1000 (AEST)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1560993276;
 bh=BpBuDfxeeGKTRli558OgjbbAAYwjKMdDNWO/akOC738=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=RF6v98lSsz7mEeMkL6nYM26bVYiaYsE5nhDTdpSgsSqeX/3zMCjAr4TqNQp9WIfv/
 86CC6Ye1PnKU2tVcKzoHi6p0ci6zxBOVgFO9n72C5iQz9+SB6K7/0nVDP/VyFCPlaY
 FLUcpUGGdTZdApXoRPpCqgMDcOcjY474Zn0XLgaGITdvorfwpUXmZDgQ6EAv2KEeeH
 hsDlwa55rOWcmyBEG1gJiqQFoKwd4vtesVH2ev+sFIs/P0K4fN8rAnPULx/aKlaW55
 Xog4yR0aT8p5wNoiqCRJwH2iN+YfSZ4AvcdM+Q0rEd7JLhL6sB0ezZLT7TOwH1n+XN
 ppi/I6nDq4fWTCfaHlyIa6RXgMwHcCEeDMWqSuoySrahrXRNJvfvsk6ZLNMGqTQCf6
 /Gw1UfiMqZwrY6h2/n+W7N7emw8D5oHjLS525cWVe0UaUk81hSiabY8yyHmHomHnoM
 AUP20jID/hZwCVjTNxW4G4AF+ve+rXXutokOzrxmk8TxeEt2H6fZk0j+hMnp6xmgCo
 ztA+5Y0Fln5ESkL9ZxaDLBIEGtIwITdDACn777F9Dh8IZerMjjbxrfAodkiKBcMQdq
 w+lJnV2rMVuDBufsyxzwpAWwXFQZuqAV7brmmdY/sAB+Gtg/np4gGpFCjb5kY2UnjQ
 glkSIphnG+gk/TjO0eDg5rys=
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

T24gV2VkLCAyMDE5LTA2LTE5IGF0IDE3OjM1IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBUaHUsIDIwMTktMDYtMjAgYXQgMDk6MTUgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEgd3JvdGU6
Cj4gPiBPbiBXZWQsIDIwMTktMDYtMTkgYXQgMDk6MzEgLTA3MDAsIEpvZSBQZXJjaGVzIHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIDIwMTktMDYtMTcgYXQgMTI6MDQgKzEwMDAsIEFsYXN0YWlyIEQnU2ls
dmEgd3JvdGU6Cj4gPiA+ID4gRnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2
YS5vcmc+Cj4gPiA+ID4gCj4gPiA+ID4gQXBvbG9naWVzIGZvciB0aGUgbGFyZ2UgQ0MgbGlzdCwg
aXQncyBhIGhlYWRzIHVwIGZvciB0aG9zZQo+ID4gPiA+IHJlc3BvbnNpYmxlCj4gPiA+ID4gZm9y
IHN1YnN5c3RlbXMgd2hlcmUgYSBwcm90b3R5cGUgY2hhbmdlIGluIGdlbmVyaWMgY29kZSBjYXVz
ZXMKPiA+ID4gPiBhCj4gPiA+ID4gY2hhbmdlCj4gPiA+ID4gaW4gdGhvc2Ugc3Vic3lzdGVtcy4K
PiA+ID4gPiAKPiA+ID4gPiBUaGlzIHNlcmllcyBlbmhhbmNlcyBoZXhkdW1wLgo+ID4gPiAKPiA+
ID4gU3RpbGwgbm90IGEgZmFuIG9mIHRoZXNlIHBhdGNoZXMuCj4gPiAKPiA+IEknbSBhZnJhaWQg
dGhlcmUncyBub3QgdG9vIG11Y2ggYWN0aW9uIEkgY2FuIHRha2Ugb24gdGhhdCwgSSdtCj4gPiBo
YXBweSB0bwo+ID4gYWRkcmVzcyBzcGVjaWZpYyBpc3N1ZXMgdGhvdWdoLgo+ID4gCj4gPiA+ID4g
VGhlc2UgaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHkgb2YgdGhlIGR1bXBlZCBkYXRhIGluIGNlcnRh
aW4KPiA+ID4gPiBzaXR1YXRpb25zCj4gPiA+ID4gKGVnLiB3aWRlIHRlcm1pbmFscyBhcmUgYXZh
aWxhYmxlLCBtYW55IGxpbmVzIG9mIGVtcHR5IGJ5dGVzCj4gPiA+ID4gZXhpc3QsCj4gPiA+ID4g
ZXRjKS4KPiAKPiBJIHRoaW5rIGl0J3MgZ2VuZXJhbGx5IG92ZXJraWxsIGZvciB0aGUgZGVzaXJl
ZCB1c2VzLgoKSSB1bmRlcnN0YW5kIHdoZXJlIHlvdSdyZSBjb21pbmcgZnJvbSwgaG93ZXZlciwg
dGhlc2UgcGF0Y2hlcyBtYWtlIGl0IGEKbG90IGVhc2llciB0byB3b3JrIHdpdGggbGFyZ2UgY2h1
Y2tzIG9mIGJpbmFyeSBkYXRhLiBJIHRoaW5rIGl0IG1ha2VzCm1vcmUgc2Vuc2UgdG8gaGF2ZSB0
aGVzZSBwYXRjaGVzIHVwc3RyZWFtLCBldmVuIHRob3VnaCBjb21taXR0ZWQgY29kZQptYXkgbm90
IG5lY2Vzc2FyaWx5IGhhdmUgYWxsIHRoZSBmZWF0dXJlcyBlbmFibGVkLCBhcyBpdCBtZWFucyB0
aGF0CmRldnMgd29uJ3QgaGF2ZSB0byBhcHBseSBvdXQtb2YtdHJlZSBwYXRjaGVzIGR1cmluZyBk
ZXZlbG9wbWVudCB0byBtYWtlCmxhcmdlciBkdW1wcyBtYW5hZ2VhYmxlLgoKPiAKPiA+ID4gQ2hh
bmdpbmcgaGV4ZHVtcCdzIGxhc3QgYXJndW1lbnQgZnJvbSBib29sIHRvIGludCBpcyBvZGQuCj4g
PiA+IAo+ID4gCj4gPiBUaGluayBvZiBpdCBhcyByZXBsYWNpbmcgYSBzaW5nbGUgYm9vbGVhbiB3
aXRoIG1hbnkgYm9vbGVhbnMuCj4gCj4gSSB1bmRlcnN0YW5kIGl0LiAgSXQncyBvZGQuCj4gCj4g
SSB3b3VsZCByYXRoZXIgbm90IGhhdmUgYSBtaXh0dXJlIG9mIHRydWUsIGZhbHNlLCBhbmQgYXBw
YXJlbnRseQo+IHJhbmRvbSBjb2xsZWN0aW9ucyBvZiBiaXRmaWVsZHMgbGlrZSAweGQgb3IgMGIx
MDExIG9yIHRoZWlyCj4gZXF1aXZhbGVudCBvcidkIGRlZmluZXMuCj4gCgpXaGVyZSdzIHRoZSBt
aXh0dXJlPyBXaGF0IHdvdWxkIHlvdSBwcm9wb3NlIGluc3RlYWQ/CgotLSAKQWxhc3RhaXIgRCdT
aWx2YSAgICAgICAgICAgbW9iOiAwNDIzIDc2MiA4MTkKc2t5cGU6IGFsYXN0YWlyX2RzaWx2YSAg
ICAKVHdpdHRlcjogQEV2aWxEZWVjZQpibG9nOiBodHRwOi8vYWxhc3RhaXIuZC1zaWx2YS5vcmcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
