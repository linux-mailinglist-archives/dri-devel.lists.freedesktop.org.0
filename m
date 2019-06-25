Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEF522E1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 07:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFEC89F33;
	Tue, 25 Jun 2019 05:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0091.hostedemail.com
 [216.40.44.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFED89F01;
 Tue, 25 Jun 2019 05:37:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id B7673180A814F;
 Tue, 25 Jun 2019 05:37:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: toy89_3b5152c3463e
X-Filterd-Recvd-Size: 3596
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 05:37:05 +0000 (UTC)
Message-ID: <c364c36338d385eba60c523828ad8995c792ae4d.camel@perches.com>
Subject: Re: [PATCH v4 5/7] lib/hexdump.c: Allow multiple groups to be
 separated by lines '|'
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
Date: Mon, 24 Jun 2019 22:37:03 -0700
In-Reply-To: <20190625031726.12173-6-alastair@au1.ibm.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-6-alastair@au1.ibm.com>
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
Ogo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWlyQGQtc2lsdmEub3JnPgo+IAo+IFdp
dGggdGhlIHdpZGVyIGRpc3BsYXkgZm9ybWF0LCBpdCBjYW4gYmVjb21lIGhhcmQgdG8gaWRlbnRp
ZnkgaG93IG1hbnkKPiBieXRlcyBpbnRvIHRoZSBsaW5lIHlvdSBhcmUgbG9va2luZyBhdC4KPiAK
PiBUaGUgcGF0Y2ggYWRkcyBuZXcgZmxhZ3MgdG8gaGV4X2R1bXBfdG9fYnVmZmVyKCkgYW5kIHBy
aW50X2hleF9kdW1wKCkgdG8KPiBwcmludCB2ZXJ0aWNhbCBsaW5lcyB0byBzZXBhcmF0ZSBldmVy
eSBOIGdyb3VwcyBvZiBieXRlcy4KPiAKPiBlZy4KPiBidWY6MDAwMDAwMDA6IDQ1NGQ0MTRlIDQz
NDE1MDUzfDRlNDk1ZjQ1IDAwNTg0NTQ0ICBOQU1FU1BBQ3xFX0lOREVYLgo+IGJ1ZjowMDAwMDAx
MDogMDAwMDAwMDAgMDAwMDAwMDJ8MDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4uLi4ufC4uLi4uLi4u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5v
cmc+Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvcHJpbnRrLmggfCAgMyArKysKPiAgbGliL2hleGR1
bXAuYyAgICAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcHJpbnRrLmggYi9pbmNsdWRlL2xpbnV4
L3ByaW50ay5oCltdCj4gQEAgLTQ4NSw2ICs0ODUsOSBAQCBlbnVtIHsKPiAgCj4gICNkZWZpbmUg
SEVYRFVNUF9BU0NJSQkJCUJJVCgwKQo+ICAjZGVmaW5lIEhFWERVTVBfU1VQUFJFU1NfUkVQRUFU
RUQJQklUKDEpCj4gKyNkZWZpbmUgSEVYRFVNUF8yX0dSUF9MSU5FUwkJQklUKDIpCj4gKyNkZWZp
bmUgSEVYRFVNUF80X0dSUF9MSU5FUwkJQklUKDMpCj4gKyNkZWZpbmUgSEVYRFVNUF84X0dSUF9M
SU5FUwkJQklUKDQpCgpUaGVzZSBhcmVuJ3QgcmVhbGx5IGJpdHMgYXMgb25seSBvbmUgdmFsdWUg
c2hvdWxkIGJlIHNldAphcyA4IG92ZXJyaWRlcyA0IGFuZCA0IG92ZXJyaWRlcyAyLgoKSSB3b3Vs
ZCBhbHNvIGV4cGVjdCB0aGlzIHRvIGJlIGEgdmFsdWUgb2YgMiBpbiB5b3VyIGFib3ZlCmV4YW1w
bGUsIHJhdGhlciB0aGFuIDguICBJdCdzIGRlc2NyaWJlZCBhcyBncm91cHMgbm90IGJ5dGVzLgoK
VGhlIGV4YW1wbGUgaXMgc2hvd2luZyBhIHdoYXQgd291bGQgbm9ybWFsbHkgYmUgYSBzcGFjZSAn
ICcKc2VwYXJhdG9yIGFzIGEgdmVydGljYWwgYmFyICd8JyBldmVyeSAybmQgZ3JvdXBpbmcuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
