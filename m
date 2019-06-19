Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB704C800
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5256E50B;
	Thu, 20 Jun 2019 07:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85A9D6E48F;
 Wed, 19 Jun 2019 23:16:29 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 5F37E2DC005B;
 Wed, 19 Jun 2019 19:16:28 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5JNFxcT078663
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 20 Jun 2019 09:16:14 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
Subject: Re: [PATCH v3 0/7] Hexdump Enhancements
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Thu, 20 Jun 2019 09:15:58 +1000
In-Reply-To: <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Thu, 20 Jun 2019 09:16:24 +1000 (AEST)
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1560986188;
 bh=P+nFrCYIAy9nbAT3inDjyh5Nu1AGlpkuYDjYYSTo8SU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UMKHysbwL4zdfy50KqutmgBEIg3sB7A1AG+8ItwZQtNEjbw3/kefwvZoa3HJ/qPue
 FtHy3iQpmn+NaSFA3Mu2gOfCMETJuOCnHShThOrTrRi0524godGZCgjbLwEXdIrujV
 xDt+bXPG551xLU30DowKCzCX4sh2ZLCYlpwKny3nSfu6TdTO04XxEEAerz4PtGaObB
 mK5WkSsuK3ES4PAPxgZb+pSYtoFroMpH18T3PLybvLGSjfjyn/CtIMs+blM8XYmdPJ
 TvkZW6Ca8pzYT9RsBfJRAJWjf4qfNG6J0j+xJvEaD7SP/MIMGo1VZ5d/zw4b3FdeYt
 JetXAd65Zd6yavahdde3VtkKoryPECl8+glQZ+N2eRG9ycQ1RafCdpTqdv72F0hGkL
 4apz6zp0SeF0J1KA9qT4u68PJKa7dlMEnKXEomd5VE+2hLj+H2XT6HltLJdB5+pK9G
 cMe1+bLK+ayAWxIXuyZ1/r/oJ5pzAFraInvomTVKBkCfLFy8CdlSIihUmPfej/4psJ
 72/lVeYRJl+IifxxJ9hEA9A+QWlY8W986ROsAQ5xOTxmaRzXMnnZRdFLVPZt5axFGD
 EQ+IOd3b5ZUWjk3U7T3wAvcchJQaqLNw/Njxg2yMVkYsKSYnAMuX4DYn+A7LJX3oLF
 sv3nSS3HZsRxp6mS1j36fWkI=
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

T24gV2VkLCAyMDE5LTA2LTE5IGF0IDA5OjMxIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBNb24sIDIwMTktMDYtMTcgYXQgMTI6MDQgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEgd3JvdGU6
Cj4gPiBGcm9tOiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KPiA+IAo+
ID4gQXBvbG9naWVzIGZvciB0aGUgbGFyZ2UgQ0MgbGlzdCwgaXQncyBhIGhlYWRzIHVwIGZvciB0
aG9zZQo+ID4gcmVzcG9uc2libGUKPiA+IGZvciBzdWJzeXN0ZW1zIHdoZXJlIGEgcHJvdG90eXBl
IGNoYW5nZSBpbiBnZW5lcmljIGNvZGUgY2F1c2VzIGEKPiA+IGNoYW5nZQo+ID4gaW4gdGhvc2Ug
c3Vic3lzdGVtcy4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgZW5oYW5jZXMgaGV4ZHVtcC4KPiAKPiBT
dGlsbCBub3QgYSBmYW4gb2YgdGhlc2UgcGF0Y2hlcy4KCkknbSBhZnJhaWQgdGhlcmUncyBub3Qg
dG9vIG11Y2ggYWN0aW9uIEkgY2FuIHRha2Ugb24gdGhhdCwgSSdtIGhhcHB5IHRvCmFkZHJlc3Mg
c3BlY2lmaWMgaXNzdWVzIHRob3VnaC4KCj4gCj4gPiBUaGVzZSBpbXByb3ZlIHRoZSByZWFkYWJp
bGl0eSBvZiB0aGUgZHVtcGVkIGRhdGEgaW4gY2VydGFpbgo+ID4gc2l0dWF0aW9ucwo+ID4gKGVn
LiB3aWRlIHRlcm1pbmFscyBhcmUgYXZhaWxhYmxlLCBtYW55IGxpbmVzIG9mIGVtcHR5IGJ5dGVz
IGV4aXN0LAo+ID4gZXRjKS4KPiAKPiBDaGFuZ2luZyBoZXhkdW1wJ3MgbGFzdCBhcmd1bWVudCBm
cm9tIGJvb2wgdG8gaW50IGlzIG9kZC4KPiAKClRoaW5rIG9mIGl0IGFzIHJlcGxhY2luZyBhIHNp
bmdsZSBib29sZWFuIHdpdGggbWFueSBib29sZWFucy4KCj4gUGVyaGFwcyBhIG5ldyBmdW5jdGlv
biBzaG91bGQgYmUgYWRkZWQgaW5zdGVhZCBvZiBjaGFuZ2luZwo+IHRoZSBleGlzdGluZyBoZXhk
dW1wLgo+IAoKVGhlcmUncyBvbmx5IGEgaGFuZGZ1bCBvZiBjb25zdW1lcnMsIEkgZG9uJ3QgdGhp
bmsgdGhlcmUgaXMgYSB2YWx1ZS1hZGQgCmluIGNyZWF0aW5nIG1vcmUgd3JhcHBlcnMgdnMgdXBk
YXRpbmcgdGhlIGV4aXN0aW5nIGNhbGxlcnMuCgotLSAKQWxhc3RhaXIgRCdTaWx2YSAgICAgICAg
ICAgbW9iOiAwNDIzIDc2MiA4MTkKc2t5cGU6IGFsYXN0YWlyX2RzaWx2YSAgICAKVHdpdHRlcjog
QEV2aWxEZWVjZQpibG9nOiBodHRwOi8vYWxhc3RhaXIuZC1zaWx2YS5vcmcKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
