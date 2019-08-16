Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB778FF85
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 11:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB726E2CA;
	Fri, 16 Aug 2019 09:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8D76E2C2;
 Fri, 16 Aug 2019 09:58:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE8AD2AF;
 Fri, 16 Aug 2019 11:58:49 +0200 (CEST)
Date: Fri, 16 Aug 2019 12:58:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Linux Kernel 5.2.8 (uvc or i915? <<<)
Message-ID: <20190816095845.GC5020@pendragon.ideasonboard.com>
References: <CAONH+Jm-O6=DQ+K2n5pNTNMg2Sq1KcVNFLuweVh6W82OPEFJoQ@mail.gmail.com>
 <abcae5c9-b3dc-7403-d628-5d7543d19702@infradead.org>
 <CAONH+JnZpbpdiwdajP7ke7X7wQGU7m4YoyZRDbLHKmRufkD6mQ@mail.gmail.com>
 <5d637638-12d1-6c39-8f76-824a0e875feb@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d637638-12d1-6c39-8f76-824a0e875feb@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565949530;
 bh=MdSDWBvW2MRlClWqWR9NNzBT2rTDlU0t5ijPFdChgoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfMz+uj7gqeE3hmQ0hFrUHz3X6evmaWEf4NBMKEvpkmkIi2hDxJAoJ4U6F/VLOkOM
 wlj19XR3xjKA3jdsMJisgBh+6QY8EdFd6X+3GK5d/T/5Ddqn5s+raXzisFg19ZGxot
 Zs1yz3cRbdLJK3LzTq+3Dv3bfYF2s44q8hQA7En4=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathaniel Russell <naterussell83@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmFuZHksCgpPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwODoxMDowM1BNIC0wNzAwLCBSYW5k
eSBEdW5sYXAgd3JvdGU6Cj4gW2FkZGluZyBtYWlsaW5nIGxpc3RzIGV0Yy4gd2l0aCBOYXRoYW5p
ZWwncyB0ZXN0IGluZm9dCj4gCj4gT24gOC8xNS8xOSA3OjIxIFBNLCBOYXRoYW5pZWwgUnVzc2Vs
bCB3cm90ZToKPiA+IFdlbGwgaSBzdXJwcmVzc2VkIHRoZSB1dmN2aWRlbyBkcml2ZXIgYW5kIHlv
dSBhcmUgcmlnaHQgUmFuZHkgaXQKPiA+IGRlZmluaXRlbHkgaXMgbm90IHRoZSB1dmN2aWRlbyBk
cml2ZXIuIFRoZXJlIGlzIHNvbWV0aGluZyBnb2luZyBvbiBpbgo+ID4gdGhlIGk5MTUgZHJpdmVy
Lgo+ID4gCj4gPiBPbiA4LzE1LzE5LCBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz4gd3JvdGU6Cj4gPj4gT24gOC8xNS8xOSA2OjE1IFBNLCBOYXRoYW5pZWwgUnVzc2VsbCB3cm90
ZToKPiA+Pj4gSSB3b3VsZCByZWFsbHkgbGlrZSBoZWxwIHdpdGggdGhlIGtlcm5lbCBlcnJvciB3
aXRoIG15IHV2Y3ZpZGVvIGRyaXZlci4KPiA+Pgo+ID4+IEhpIGFnYWluLgo+ID4+Cj4gPj4gV2hh
dCBtYWtlcyB5b3UgdGhpbmsgdGhhdCB0aGUgcHJvYmxlbSBpcyByZWxhdGVkIHRvIHRoZSB1dmN2
aWRlbyBkcml2ZXI/Cj4gPj4gRG9lcyBzb21lIHByZXZpb3VzIGtlcm5lbCB2ZXJzaW9uIHdvcmsg
Y29ycmVjdGx5PyAgSWYgc28sIHdoYXQgdmVyc2lvbihzKT8KPiA+Pgo+ID4+Cj4gPj4gRG9lcyB0
aGlzIHdhcm5pbmcgbWVzc2FnZSBvbmx5IGhhcHBlbiB3aGVuIHRoZSB1dmN2aWRlbyBkcml2ZXIg
aXMgYmVpbmcKPiA+PiBsb2FkZWQ/Cj4gPj4gQ2FuIHlvdSBzdXBwcmVzcyBsb2FkaW5nIG9mIHRo
ZSB1dmN2aWRlbyBkcml2ZXIgdG8gZmluZCBvdXQ/Cj4gPj4KPiA+PiBNb3N0IG9mIHRoZSBwcm9i
bGVtcy9lcnJvcnMvd2FybmluZ3MgdGhhdCBJIHNlZSBhcmUgcmVsYXRlZCB0byB0aGUgaTkxNQo+
ID4+IGRyaXZlcjoKPiA+Pgo+ID4+IFsgICAxMy4wMzIzNDFdIHRpbWVkIG91dCB3YWl0aW5nIGZv
ciBwb3J0IEMgcmVhZHk6IGdvdCAweDIwLCBleHBlY3RlZCAweGUwCj4gPj4gWyAgIDEzLjAzMjg3
Ml0gV0FSTklORzogQ1BVOiAxIFBJRDogMjM5IGF0Cj4gPj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZGlzcGxheS5jOjE1OTcgdmx2X3dhaXRfcG9ydF9yZWFkeSsweDk5LzB4ZTAKPiA+PiBb
aTkxNV0KPiA+PiBbICAgMTMuMDMzNjMyXSBSSVA6IDAwMTA6dmx2X3dhaXRfcG9ydF9yZWFkeSsw
eDk5LzB4ZTAgW2k5MTVdCj4gPj4KPiA+PiBhbHRob3VnaCB0aGVyZSBhcmUgYSBmZXcgdXZjdmlk
ZW8gd2FybmluZ3M6Cj4gPj4gWyAgIDEzLjAzOTMwNV0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5
IHR5cGUgZm9yIGVudGl0eSBFeHRlbnNpb24gNCB3YXMgbm90Cj4gPj4gaW5pdGlhbGl6ZWQhCj4g
Pj4gWyAgIDEzLjAzOTMxOF0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5IHR5cGUgZm9yIGVudGl0
eSBFeHRlbnNpb24gMyB3YXMgbm90Cj4gPj4gaW5pdGlhbGl6ZWQhCj4gPj4gWyAgIDEzLjAzOTMz
MF0gdXZjdmlkZW8gMS01OjEuMDogRW50aXR5IHR5cGUgZm9yIGVudGl0eSBQcm9jZXNzaW5nIDIg
d2FzIG5vdAo+ID4+IGluaXRpYWxpemVkIQo+ID4+IFsgICAxMy4wMzkzMzldIHV2Y3ZpZGVvIDEt
NToxLjA6IEVudGl0eSB0eXBlIGZvciBlbnRpdHkgQ2FtZXJhIDEgd2FzIG5vdAo+ID4+IGluaXRp
YWxpemVkIQo+ID4+Cj4gPj4gTGF1cmVudCwgZG8geW91IHNlZSBhbnkgdXZjIGlzc3VlcyBoZXJl
PyAgQW55IGlkZWFzL3N1Z2dlc3Rpb25zPwoKTm8sIHV2Y3ZpZGVvIHNlZW1zIGNvbXBsZXRlbHkg
cmV1bmxhdGVkLgoKPiA+PiBAaW50ZWwtZ2Z4OiAgYW55IGlkZWFzIGFib3V0IHdoYXQgaXMgZ29p
bmcgb24gaGVyZSB3aXRoIHRoZSBpOTE1IGRyaXZlcj8KPiA+Pgo+ID4+IE9yaWdpbmFsIG1lc3Nh
Z2UgdG8gbGttbDoKPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBT05IK0ptLU82
PURRK0sybjVwTlROTWcyU3ExS2NWTkZMdXdlVmg2VzgyT1BFRkpvUUBtYWlsLmdtYWlsLmNvbS9U
LyN1Cj4gPj4KPiA+PiBQcmV2aW91cyBtZXNzYWdlIGZvciA1LjEuMjEga2VybmVsOgo+ID4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FPTkgrSmtURnVqWTl2RXlOTnVlbSs5ckoycUJL
a2YtUGJLazk9REJTVkVwNmtXPXl3QG1haWwuZ21haWwuY29tLwoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
