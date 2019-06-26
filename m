Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258305643B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C9B6E30D;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0F1A6E17F;
 Wed, 26 Jun 2019 01:28:29 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 1D8A72DC731F;
 Tue, 25 Jun 2019 21:28:28 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5Q1S75T029659
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2019 11:28:23 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <e1b3d172f07f681fed9c311dec67cfb695408f5c.camel@d-silva.org>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Wed, 26 Jun 2019 11:27:53 +1000
In-Reply-To: <4ba3b835fb3675ea685390903a082bf8b7f9e955.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
 <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
 <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
 <4ba3b835fb3675ea685390903a082bf8b7f9e955.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 26 Jun 2019 11:28:23 +1000 (AEST)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1561512509;
 bh=53CwIRf7Bgu2C3nB/E/dYkm1SUmyHI16H7Vrw6tYZw0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XYXgZQwV/JVmjvrmmpsEfrzhsSdzQz90TZ3u4A5LuvxvOBf47Fp2ZRE6sw/yQxU8X
 TpjMqn9q/O2CpE5gTKB+jX8JuW3ZvjWwRjKNgYyQtDeLqC3AOTxGIo14uCtoknu1Ie
 FG22iYtvXLRXXqfNrSrJa+rVjda1vgisi7GOJbC+jBgTu/RViRQay4OWXhgCn3Nczb
 R37TlMkpZX8Y+mP/etyzy+OqhHUjAKgompFg31JlAIqUoS4aI+1LPHijcYXXJoVYTq
 Ygr7XlPyBBKYZb2Gi7aXZQsO2+StG1sjXOx+KdwCdKzCFyEWfWEKY/tQLkurs+ph9A
 MUUYKoT1SLivN87ZIKD5usJUxI6X9VbGAq0Giu0wTPvBE4irR3Jbh5NIjNdxwD4tWj
 TuNlZSN8qLv9Snh5uGeZMKYFnfUm7WdcPupOF8k4TJ+2MhVD7L9GTL2CGk9Qoaw7Tt
 MaiNteFekcRUw59fQrYPbrAIf7xqCZ3+cibIiO+j7YlstTAk+6ESZJ9WDAtwep+vAH
 niADVBPNIHpavAj51iob25f8WoSUtiKoWtXOYdL4L28EGQ9w2ayhlYobW1Jykne0xY
 8hbzBb2ugqf6wp6vG7XdsVpanY8BP7CyvaQOvuPAyHTsyukMlhVI18R5nWD5Fmf0gP
 U/5V+IOscL3fg+gbEE7NrBI8=
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

T24gTW9uLCAyMDE5LTA2LTI0IGF0IDIyOjE5IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBUdWUsIDIwMTktMDYtMjUgYXQgMTU6MDYgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEgd3JvdGU6
Cj4gPiBUaGUgY2hhbmdlIGFjdGlvbnMgSmFuaSdzIHN1Z2dlc3Rpb246Cj4gPiBodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxOS82LzIwLzM0Mwo+IAo+IEkgc3VnZ2VzdCBub3QgY2hhbmdpbmcgYW55
IG9mIHRoZSBleGlzdGluZyB1c2VzIG9mCj4gaGV4X2R1bXBfdG9fYnVmZmVyIGFuZCBvbmx5IHVz
ZSBoZXhfZHVtcF90b19idWZmZXJfZXh0Cj4gd2hlbiBuZWNlc3NhcnkgZm9yIHlvdXIgZXh0ZW5k
ZWQgdXNlIGNhc2VzLgo+IAo+IAoKSSBkaXNhZ3JlZSwgYWRkaW5nIGEgd3JhcHBlciBmb3IgdGhl
IGJlbmVmaXQgb2YgYXZvaWRpbmcgdG91Y2hpbmcgYQpoYW5kZnVsIG9mIGNhbGwgc2l0ZXMgdGhh
dCBhcmUgZWFzaWx5IGFtZW5kZWQgd291bGQgYmUgYWRkaW5nIHRlY2huaWNhbApkZWJ0LgoKLS0g
CkFsYXN0YWlyIEQnU2lsdmEgICAgICAgICAgIG1vYjogMDQyMyA3NjIgODE5CnNreXBlOiBhbGFz
dGFpcl9kc2lsdmEgICAgClR3aXR0ZXI6IEBFdmlsRGVlY2UKYmxvZzogaHR0cDovL2FsYXN0YWly
LmQtc2lsdmEub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
