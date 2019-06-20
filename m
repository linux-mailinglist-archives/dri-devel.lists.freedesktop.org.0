Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966FA4C52C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 04:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C45F6E4A2;
	Thu, 20 Jun 2019 02:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0066.hostedemail.com
 [216.40.44.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEE46E4A0;
 Thu, 20 Jun 2019 02:00:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 61216100E86C2;
 Thu, 20 Jun 2019 02:00:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 
X-HE-Tag: tent82_3890fedb2856
X-Filterd-Recvd-Size: 4880
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Thu, 20 Jun 2019 02:00:24 +0000 (UTC)
Message-ID: <fcf57339aea60fb1744cea2a2593656c728c4ec4.camel@perches.com>
Subject: Re: [PATCH v3 0/7] Hexdump Enhancements
From: Joe Perches <joe@perches.com>
To: Alastair D'Silva <alastair@d-silva.org>
Date: Wed, 19 Jun 2019 19:00:22 -0700
In-Reply-To: <9456ca2a4ae827635bb6d864e5095a9e51f2ac45.camel@d-silva.org>
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <9a000734375c0801fc16b71f4be1235f9b857772.camel@perches.com>
 <c68cb819257f251cbb66f8998a95c31cebe2d72e.camel@d-silva.org>
 <d8316be322f33ea67640ff83f2248fe433078407.camel@perches.com>
 <9456ca2a4ae827635bb6d864e5095a9e51f2ac45.camel@d-silva.org>
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

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDExOjE0ICsxMDAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+IE9uIFdlZCwgMjAxOS0wNi0xOSBhdCAxNzozNSAtMDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6
Cj4gPiBPbiBUaHUsIDIwMTktMDYtMjAgYXQgMDk6MTUgKzEwMDAsIEFsYXN0YWlyIEQnU2lsdmEg
d3JvdGU6Cj4gPiA+IE9uIFdlZCwgMjAxOS0wNi0xOSBhdCAwOTozMSAtMDcwMCwgSm9lIFBlcmNo
ZXMgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCAyMDE5LTA2LTE3IGF0IDEyOjA0ICsxMDAwLCBBbGFz
dGFpciBEJ1NpbHZhIHdyb3RlOgo+ID4gPiA+ID4gRnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxh
c3RhaXJAZC1zaWx2YS5vcmc+Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFwb2xvZ2llcyBmb3IgdGhl
IGxhcmdlIENDIGxpc3QsIGl0J3MgYSBoZWFkcyB1cCBmb3IgdGhvc2UKPiA+ID4gPiA+IHJlc3Bv
bnNpYmxlCj4gPiA+ID4gPiBmb3Igc3Vic3lzdGVtcyB3aGVyZSBhIHByb3RvdHlwZSBjaGFuZ2Ug
aW4gZ2VuZXJpYyBjb2RlIGNhdXNlcwo+ID4gPiA+ID4gYQo+ID4gPiA+ID4gY2hhbmdlCj4gPiA+
ID4gPiBpbiB0aG9zZSBzdWJzeXN0ZW1zLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIHNlcmll
cyBlbmhhbmNlcyBoZXhkdW1wLgo+ID4gPiA+IAo+ID4gPiA+IFN0aWxsIG5vdCBhIGZhbiBvZiB0
aGVzZSBwYXRjaGVzLgo+ID4gPiAKPiA+ID4gSSdtIGFmcmFpZCB0aGVyZSdzIG5vdCB0b28gbXVj
aCBhY3Rpb24gSSBjYW4gdGFrZSBvbiB0aGF0LCBJJ20KPiA+ID4gaGFwcHkgdG8KPiA+ID4gYWRk
cmVzcyBzcGVjaWZpYyBpc3N1ZXMgdGhvdWdoLgo+ID4gPiAKPiA+ID4gPiA+IFRoZXNlIGltcHJv
dmUgdGhlIHJlYWRhYmlsaXR5IG9mIHRoZSBkdW1wZWQgZGF0YSBpbiBjZXJ0YWluCj4gPiA+ID4g
PiBzaXR1YXRpb25zCj4gPiA+ID4gPiAoZWcuIHdpZGUgdGVybWluYWxzIGFyZSBhdmFpbGFibGUs
IG1hbnkgbGluZXMgb2YgZW1wdHkgYnl0ZXMKPiA+ID4gPiA+IGV4aXN0LAo+ID4gPiA+ID4gZXRj
KS4KPiA+IAo+ID4gSSB0aGluayBpdCdzIGdlbmVyYWxseSBvdmVya2lsbCBmb3IgdGhlIGRlc2ly
ZWQgdXNlcy4KPiAKPiBJIHVuZGVyc3RhbmQgd2hlcmUgeW91J3JlIGNvbWluZyBmcm9tLCBob3dl
dmVyLCB0aGVzZSBwYXRjaGVzIG1ha2UgaXQgYQo+IGxvdCBlYXNpZXIgdG8gd29yayB3aXRoIGxh
cmdlIGNodWNrcyBvZiBiaW5hcnkgZGF0YS4gSSB0aGluayBpdCBtYWtlcwo+IG1vcmUgc2Vuc2Ug
dG8gaGF2ZSB0aGVzZSBwYXRjaGVzIHVwc3RyZWFtLCBldmVuIHRob3VnaCBjb21taXR0ZWQgY29k
ZQo+IG1heSBub3QgbmVjZXNzYXJpbHkgaGF2ZSBhbGwgdGhlIGZlYXR1cmVzIGVuYWJsZWQsIGFz
IGl0IG1lYW5zIHRoYXQKPiBkZXZzIHdvbid0IGhhdmUgdG8gYXBwbHkgb3V0LW9mLXRyZWUgcGF0
Y2hlcyBkdXJpbmcgZGV2ZWxvcG1lbnQgdG8gbWFrZQo+IGxhcmdlciBkdW1wcyBtYW5hZ2VhYmxl
Lgo+IAo+ID4gPiA+IENoYW5naW5nIGhleGR1bXAncyBsYXN0IGFyZ3VtZW50IGZyb20gYm9vbCB0
byBpbnQgaXMgb2RkLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gVGhpbmsgb2YgaXQgYXMgcmVwbGFj
aW5nIGEgc2luZ2xlIGJvb2xlYW4gd2l0aCBtYW55IGJvb2xlYW5zLgo+ID4gCj4gPiBJIHVuZGVy
c3RhbmQgaXQuICBJdCdzIG9kZC4KPiA+IAo+ID4gSSB3b3VsZCByYXRoZXIgbm90IGhhdmUgYSBt
aXh0dXJlIG9mIHRydWUsIGZhbHNlLCBhbmQgYXBwYXJlbnRseQo+ID4gcmFuZG9tIGNvbGxlY3Rp
b25zIG9mIGJpdGZpZWxkcyBsaWtlIDB4ZCBvciAwYjEwMTEgb3IgdGhlaXIKPiA+IGVxdWl2YWxl
bnQgb3InZCBkZWZpbmVzLgo+ID4gCj4gCj4gV2hlcmUncyB0aGUgbWl4dHVyZT8gV2hhdCB3b3Vs
ZCB5b3UgcHJvcG9zZSBpbnN0ZWFkPwoKY3JlYXRlIGEgaGV4X2R1bXBfdG9fYnVmZmVyX2V4dCB3
aXRoIGEgbmV3IGFyZ3VtZW50CmFuZCBhIG5ldyBzdGF0aWMgaW5saW5lIGZvciB0aGUgb2xkIGhl
eF9kdW1wX3RvX2J1ZmZlcgp3aXRob3V0IG1vZGlmeWluZyB0aGUgYXJndW1lbnQgbGlzdCB0aGF0
IGNhbGxzCmhleF9kdW1wX3RvX2J1ZmZlciB3aXRoIHdoYXRldmVyIGFkZGVkIGFyZ3VtZW50IGNv
bnRlbnQKeW91IG5lZWQuCgpTb21ldGhpbmcgbGlrZToKCnN0YXRpYyBpbmxpbmUKaW50IGhleF9k
dW1wX3RvX2J1ZmZlcihjb25zdCB2b2lkICpidWYsIHNpemVfdCBsZW4sIGludCByb3dzaXplLAoJ
CSAgICAgICBpbnQgZ3JvdXBzaXplLCBjaGFyICpsaW5lYnVmLCBzaXplX3QgbGluZWJ1ZmxlbiwK
CQkgICAgICAgYm9vbCBhc2NpaSkKewoJcmV0dXJuIGhleF9kdW1wX3RvX2J1ZmZlcl9leHQoYnVm
LCBsZW4sIHJvd3NpemUsIGdyb3Vwc2l6ZSwKCQkJCSAgICAgIGxpbmVidWYsIGxpbmVidWZsZW4s
IGFzY2lpLCAwKTsKfQoKYW5kIHJlbW92ZSBFWFBPUlRfU1lNQk9MKGhleF9kdW1wX3RvX2J1ZmZl
cikKCQkJCSAgICAgIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
