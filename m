Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671345642B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3356E2F3;
	Wed, 26 Jun 2019 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id 947326E17F;
 Wed, 26 Jun 2019 01:02:58 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id E27A72DC0076;
 Tue, 25 Jun 2019 21:02:57 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x5Q12T29029544
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2019 11:02:45 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <e16caf5b98aafea4033bfc0e49845ef987c02678.camel@d-silva.org>
Subject: Re: [PATCH v4 0/7] Hexdump Enhancements
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Joe Perches <joe@perches.com>
Date: Wed, 26 Jun 2019 11:02:29 +1000
In-Reply-To: <3ae4c1a4a72f8ee6b75c45adfbe543fc0a7b5da1.camel@perches.com>
References: <20190625031726.12173-1-alastair@au1.ibm.com>
 <3ae4c1a4a72f8ee6b75c45adfbe543fc0a7b5da1.camel@perches.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 26 Jun 2019 11:02:53 +1000 (AEST)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1561510978;
 bh=alTGTolfSOaJib81/HV1xk13UMDoyRYklK/SpUrmd7w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=NoxHUcByzLTCusX5pVe1lsXlBMGElTVDnI/XfJAy1Nl2CPCT+1tOht6i2EK/ciNkm
 K9KG5Y432fz/6LApPs3O84qtWA9SlyMmA/wuAdUcSD4rSsw1vczNmq2IadH3d8Yjjj
 5s/aRpOn+J8LZ+0EdQegjtRsGUm+NIxhK/RJ9SV1bF1UePOw1rCMB/TgxdowIewNFZ
 Ra5cgiPNVLsA+gWt+IwCMHonGdcRTTyshPS7dwjlm4RdNgxtOKDy+eQbfRQfotbzjs
 B5QQnvu0X2cSsH+yxVwnjSR18+Dt0Tt9kbJq7vhB7kczzOGw3vGeE9Nsk1oow8i/1I
 3EN2KiSeiTlphcIF4jujWhyKJYRq8hKZqgXXkbYQ8cniR0sy1e4f3msouuG7u7FAGN
 4N62OPQDxWHpA6QCR2bkcmJBVH1Jb6OE2kFfBG7EgyAY7YE5RDCG3qHf3x06F/DOxs
 QIPziAUS4TwpT/g1pYu4AH2VTerslwlrRiUj0wkS6makKQ6LJI017iD3ClsF1dCjvw
 9OKcxJoGQDOPUyeiE1V2QvnozdCZZJ0tZIwv2ngVO0Y5g38kYMSlrgiQm08cGPPyV1
 1vTrS9K7ZJD22fxteol1WonkF1zHEWTT8Eu6rNYpH6cAVTxvZ5Uw16GXOQ+goHTzVz
 m6Ftvv6Q+FYsWPnR2eqrJFq0=
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
ID4gQXBvbG9naWVzIGZvciB0aGUgbGFyZ2UgQ0MgbGlzdCwgaXQncyBhIGhlYWRzIHVwIGZvciB0
aG9zZQo+ID4gcmVzcG9uc2libGUKPiA+IGZvciBzdWJzeXN0ZW1zIHdoZXJlIGEgcHJvdG90eXBl
IGNoYW5nZSBpbiBnZW5lcmljIGNvZGUgY2F1c2VzIGEKPiA+IGNoYW5nZQo+ID4gaW4gdGhvc2Ug
c3Vic3lzdGVtcy4KPiBbXQo+ID4gVGhlIGRlZmF1bHQgYmVoYXZpb3VyIG9mIGhleGR1bXAgaXMg
dW5jaGFuZ2VkLCBob3dldmVyLCB0aGUKPiA+IHByb3RvdHlwZQo+ID4gZm9yIGhleF9kdW1wX3Rv
X2J1ZmZlcigpIGhhcyBjaGFuZ2VkLCBhbmQgcHJpbnRfaGV4X2R1bXAoKSBoYXMgYmVlbgo+ID4g
cmVuYW1lZCB0byBwcmludF9oZXhfZHVtcF9leHQoKSwgd2l0aCBhIHdyYXBwZXIgcmVwbGFjaW5n
IGl0IGZvcgo+ID4gY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGNvZGUsIHdoaWNoIHdvdWxk
IGhhdmUgYmVlbiB0b28KPiA+IGludmFzaXZlIHRvCj4gPiBjaGFuZ2UuCj4gCj4gSSBiZWxpZXZl
IHRoaXMgY292ZXIgbGV0dGVyIGlzIG1pc2xlYWRpbmcuCj4gCj4gVGhlIHBvaW50IG9mIHRoZSB3
cmFwcGVyIGlzIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGNoYW5nZXMKPiBpbiBleGlzdGluZwo+IGNv
ZGUuCj4gCj4gCgpUaGUgd3JhcHBlciBpcyBmb3IgcHJpbnRfaGV4X2R1bXAoKSwgd2hpY2ggaGFz
IG1hbnkgY2FsbGVycy4KClRoZSBjaGFuZ2VzIHRvIGV4aXN0aW5nIGNvZGUgYXJlIGZvciBoZXhf
ZHVtcF90b19idWZmZXIoKSwgd2hpY2ggaXMKY2FsbGVkIGluIHJlbGF0aXZlbHkgZmV3IHBsYWNl
cy4KCi0tIApBbGFzdGFpciBEJ1NpbHZhICAgICAgICAgICBtb2I6IDA0MjMgNzYyIDgxOQpza3lw
ZTogYWxhc3RhaXJfZHNpbHZhICAgIApUd2l0dGVyOiBARXZpbERlZWNlCmJsb2c6IGh0dHA6Ly9h
bGFzdGFpci5kLXNpbHZhLm9yZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
