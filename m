Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABE522BE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 07:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30A789F27;
	Tue, 25 Jun 2019 05:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0123.hostedemail.com
 [216.40.44.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53689F27;
 Tue, 25 Jun 2019 05:19:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 694D7100E86C1;
 Tue, 25 Jun 2019 05:19:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: crown72_8991fd23cb832
X-Filterd-Recvd-Size: 2612
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 05:19:05 +0000 (UTC)
Message-ID: <4ba3b835fb3675ea685390903a082bf8b7f9e955.camel@perches.com>
Subject: Re: [PATCH v4 4/7] lib/hexdump.c: Replace ascii bool in
 hex_dump_to_buffer with flags
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@d-silva.org>
Date: Mon, 24 Jun 2019 22:19:03 -0700
In-Reply-To: <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <20190625031726.12173-5-alastair@au1.ibm.com>
 <3340b520a57e00a483eae170be97316c8d18c22c.camel@perches.com>
 <746098160c4ff6527d573d2af23c403b6d4e5b80.camel@d-silva.org>
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

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDE1OjA2ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IFRoZSBjaGFuZ2UgYWN0aW9ucyBKYW5pJ3Mgc3VnZ2VzdGlvbjoKPiBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxOS82LzIwLzM0MwoKSSBzdWdnZXN0IG5vdCBjaGFuZ2luZyBhbnkgb2YgdGhl
IGV4aXN0aW5nIHVzZXMgb2YKaGV4X2R1bXBfdG9fYnVmZmVyIGFuZCBvbmx5IHVzZSBoZXhfZHVt
cF90b19idWZmZXJfZXh0CndoZW4gbmVjZXNzYXJ5IGZvciB5b3VyIGV4dGVuZGVkIHVzZSBjYXNl
cy4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
