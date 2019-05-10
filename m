Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1BD1998D
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 10:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD91899E6;
	Fri, 10 May 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ushosting.nmnhosting.com (unknown [66.55.73.32])
 by gabe.freedesktop.org (Postfix) with ESMTP id F058389C68;
 Fri, 10 May 2019 00:17:23 +0000 (UTC)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id B6DC82DC0070;
 Thu,  9 May 2019 20:17:22 -0400 (EDT)
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
 [122.99.82.10] (may be forged)) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x4A0GhJ3030327
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 May 2019 10:17:01 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
Message-ID: <80e51facb280e96018a4220adf8efa6fac823a94.camel@d-silva.org>
Subject: Re: [PATCH v2 3/7] lib/hexdump.c: Optionally suppress lines of
 repeated bytes
From: "Alastair D'Silva" <alastair@d-silva.org>
To: Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 10 May 2019 10:16:42 +1000
In-Reply-To: <dc093079-43a0-0a45-f5dd-88b20702fd93@infradead.org>
References: <20190508070148.23130-1-alastair@au1.ibm.com>
 <20190508070148.23130-4-alastair@au1.ibm.com>
 <dc093079-43a0-0a45-f5dd-88b20702fd93@infradead.org>
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 10 May 2019 10:17:17 +1000 (AEST)
X-Mailman-Approved-At: Fri, 10 May 2019 08:23:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=d-silva.org; s=201810a; t=1557447443;
 bh=rJY0+D6TdRtTv0MtwykFJbYOSu46lpL7vkuRS2Zg75k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FgHPIPlYLmuLNtrMoQ1JdXOJBzIramXRU528FDdwgmUbYDUSurbrKOmk66MlGYzGl
 0ruDR9MsmWn6Wa1JGtiiUa7MDmH9NnRiXxafLrfVNihMUrJYoUiQlr9ZF1I4HIM0PV
 bZ9W5c9BAYVyzA9PfwGf5o+hGD2hYyBjKLixvrQ1vno4Whs2Nw5LmAFMtjJBE96JB5
 3A/TpZPKlUH/LZ9QviX5sPNxejvENaMBIYUal2Z2Hup4BijYTYYiF1F+eWLEYbhMu2
 YBrAElUv44shUa1aHwy6Pfl3sYtAppFsneNmta4kToubNSSN/EMWCAgt+GOmMNuiZU
 dScx2/r4DfVPHVsLyA/C0IlAGJW5xx1NFqr3GJcu3u2ljmH/j2VABFWX8mKiViOjya
 UMzCeSKOTZj7GhaZKQ4wNLMdnnGeX0xRzwZxBPPwQPpa98wFjqGa4P4+HDIkphprBS
 cLR2rNyVdb5sI8TuETSE/d/sK5ExHhfuWol5Jk5PXVNE/IO16n6e0dCf3bBoCa8bTw
 zs4jlO1owv47NzN5dYrbV7R3mEfn3Wk/R8zsonqePsZtnUOe/9EZUeGRp5ITrVsRIK
 bdLoMtcOXzpm23UAwIN2Fr4caFvxOuuMjHxqg9nDMraA52HHWsxcudXZEv+JQvxYxU
 WRl4Hh/Ieej3f+hWeieXK7mA=
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
 Tom Lendacky <thomas.lendacky@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Petr Mladek <pmladek@suse.com>, intel-gfx@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTA4IGF0IDE3OjU4IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4g
T24gNS84LzE5IDEyOjAxIEFNLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3RlOgo+ID4gRnJvbTogQWxh
c3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+Cj4gPiAKPiA+IFNvbWUgYnVmZmVy
cyBtYXkgb25seSBiZSBwYXJ0aWFsbHkgZmlsbGVkIHdpdGggdXNlZnVsIGRhdGEsIHdoaWxlCj4g
PiB0aGUgcmVzdAo+ID4gaXMgcGFkZGVkICh0eXBpY2FsbHkgd2l0aCAweDAwIG9yIDB4ZmYpLgo+
ID4gCj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBmbGFnIHRvIGFsbG93IHRoZSBzdXByZXNz
aW9uIG9mIGxpbmVzIG9mCj4gPiByZXBlYXRlZAo+ID4gYnl0ZXMsIHdoaWNoIGFyZSByZXBsYWNl
ZCB3aXRoICcqKiBTa2lwcGVkICV1IGJ5dGVzIG9mIHZhbHVlIDB4JXgKPiA+ICoqJwo+ID4gCj4g
PiBBbiBpbmxpbmUgd3JhcHBlciBmdW5jdGlvbiBpcyBwcm92aWRlZCBmb3IgYmFja3dhcmRzIGNv
bXBhdGliaWxpdHkKPiA+IHdpdGgKPiA+IGV4aXN0aW5nIGNvZGUsIHdoaWNoIG1haW50YWlucyB0
aGUgb3JpZ2luYWwgYmVoYXZpb3VyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGFzdGFpciBE
J1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgv
cHJpbnRrLmggfCAyNSArKysrKysrKystLS0KPiA+ICBsaWIvaGV4ZHVtcC5jICAgICAgICAgIHwg
OTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAtLS0tLS0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+ID4gCj4g
Cj4gSGksCj4gRGlkIHlvdSBkbyAibWFrZSBodG1sZG9jcyIgb3Igc29tZXRoaW5nIHNpbWlsYXIg
b24gdGhpcz8KPiAKPiA+IGRpZmYgLS1naXQgYS9saWIvaGV4ZHVtcC5jIGIvbGliL2hleGR1bXAu
Ywo+ID4gaW5kZXggMzk0MzUwN2JjMGU5Li5kNjFhMWU0ZjE5ZmEgMTAwNjQ0Cj4gPiAtLS0gYS9s
aWIvaGV4ZHVtcC5jCj4gPiArKysgYi9saWIvaGV4ZHVtcC5jCj4gPiBAQCAtMjEyLDggKzIxMiw0
NCBAQCBpbnQgaGV4X2R1bXBfdG9fYnVmZmVyKGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90Cj4gPiBs
ZW4sIGludCByb3dzaXplLCBpbnQgZ3JvdXBzaXplLAo+ID4gIEVYUE9SVF9TWU1CT0woaGV4X2R1
bXBfdG9fYnVmZmVyKTsKPiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX1BSSU5USwo+ID4gKwo+ID4g
Ky8qKgo+ID4gKyAqIENoZWNrIGlmIGEgYnVmZmVyIGNvbnRhaW5zIG9ubHkgYSBzaW5nbGUgYnl0
ZSB2YWx1ZQo+ID4gKyAqIEBidWY6IHBvaW50ZXIgdG8gdGhlIGJ1ZmZlcgo+ID4gKyAqIEBsZW46
IHRoZSBzaXplIG9mIHRoZSBidWZmZXIgaW4gYnl0ZXMKPiA+ICsgKiBAdmFsOiBvdXRwdXRzIHRo
ZSB2YWx1ZSBpZiBpZiB0aGUgYnl0ZXMgYXJlIGlkZW50aWNhbAo+IAo+IERvZXMgdGhpcyB3b3Jr
IHdpdGhvdXQgYSBmdW5jdGlvbiBuYW1lPwo+IERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5l
bC1kb2MucnN0IHNheXMgdGhlIGdlbmVyYWwgZm9ybWF0IGlzOgo+IAo+ICAgLyoqCj4gICAgKiBm
dW5jdGlvbl9uYW1lKCkgLSBCcmllZiBkZXNjcmlwdGlvbiBvZiBmdW5jdGlvbi4KPiAgICAqIEBh
cmcxOiBEZXNjcmliZSB0aGUgZmlyc3QgYXJndW1lbnQuCj4gICAgKiBAYXJnMjogRGVzY3JpYmUg
dGhlIHNlY29uZCBhcmd1bWVudC4KPiAgICAqICAgICAgICBPbmUgY2FuIHByb3ZpZGUgbXVsdGlw
bGUgbGluZSBkZXNjcmlwdGlvbnMKPiAgICAqICAgICAgICBmb3IgYXJndW1lbnRzLgo+ICAgICoK
PiAKPiA+ICsgKi8KPiA+ICAvKioKPiA+IC0gKiBwcmludF9oZXhfZHVtcCAtIHByaW50IGEgdGV4
dCBoZXggZHVtcCB0byBzeXNsb2cgZm9yIGEgYmluYXJ5Cj4gPiBibG9iIG9mIGRhdGEKPiA+ICsg
KiBwcmludF9oZXhfZHVtcF9leHQ6IGR1bXAgYSBiaW5hcnkgYmxvYiBvZiBkYXRhIHRvIHN5c2xv
ZyBpbgo+ID4gaGV4YWRlY2ltYWwKPiAKPiBBbHNvIG5vdCBpbiB0aGUgZ2VuZXJhbCBkb2N1bWVu
dGVkIGZvcm1hdC4KPiAKClRoYW5rcyBSYW5keSwgSSdsbCBhZGRyZXNzIHRoZXNlLgoKLS0gCkFs
YXN0YWlyIEQnU2lsdmEgICAgICAgICAgIG1vYjogMDQyMyA3NjIgODE5CnNreXBlOiBhbGFzdGFp
cl9kc2lsdmEgICAgClR3aXR0ZXI6IEBFdmlsRGVlY2UKYmxvZzogaHR0cDovL2FsYXN0YWlyLmQt
c2lsdmEub3JnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
