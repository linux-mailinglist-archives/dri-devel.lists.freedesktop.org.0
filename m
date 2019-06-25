Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF0559E5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83476E24B;
	Tue, 25 Jun 2019 21:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED716E24B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 21:24:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D67C980335;
 Tue, 25 Jun 2019 23:24:55 +0200 (CEST)
Date: Tue, 25 Jun 2019 23:24:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 2/4] drm/panel: jh057n0090: Don't use magic constant
Message-ID: <20190625212454.GC20625@ravnborg.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <ec1993368dba4e6ec1c72faa9c7bb25cf8ca95d3.1561482165.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec1993368dba4e6ec1c72faa9c7bb25cf8ca95d3.1561482165.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8
 a=7gkXJVJtAAAA:8 a=L8TcbOcJO7bzHK2hVygA:9 a=wPNLvfGTeEIA:10
 a=iBZjaW-pnkserzjvUTHh:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDc6MDU6MTdQTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gMHhCRiBpc24ndCBpbiBhbnkgU1Q3NzAzIGRhdGEgc2hlZXQgc28gbWFyayBpdCBh
cyB1bmtub3duLiBUaGlzIGF2b2lkcwo+IGNvbmZ1c2lvbiBvbiB3aGV0aGVyIHRoZXJlIGlzIGEg
bWlzc2luZyBjb21tYW5kIGluIHRoYXQKPiBkc2lfZ2VuZXJpY193cml0ZV9zZXEoKSBjYWxsLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+ClJldmll
d2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jIHwgMyArKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gaW5k
ZXggNmRjYjY5MmM0NzAxLi5iOGEwNjkwNTVmYmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+IEBAIC0zMyw2ICszMyw3
IEBACj4gICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRFWFRDCSAweEI5Cj4gICNkZWZpbmUgU1Q3NzAz
X0NNRF9TRVRNSVBJCSAweEJBCj4gICNkZWZpbmUgU1Q3NzAzX0NNRF9TRVRWREMJIDB4QkMKPiAr
I2RlZmluZSBTVDc3MDNfQ01EX1VOS05PV04wCSAweEJGCj4gICNkZWZpbmUgU1Q3NzAzX0NNRF9T
RVRTQ1IJIDB4QzAKPiAgI2RlZmluZSBTVDc3MDNfQ01EX1NFVFBPV0VSCSAweEMxCj4gICNkZWZp
bmUgU1Q3NzAzX0NNRF9TRVRQQU5FTAkgMHhDQwo+IEBAIC05NCw3ICs5NSw3IEBAIHN0YXRpYyBp
bnQgamgwNTduX2luaXRfc2VxdWVuY2Uoc3RydWN0IGpoMDU3biAqY3R4KQo+ICAJbXNsZWVwKDIw
KTsKPiAgCj4gIAlkc2lfZ2VuZXJpY193cml0ZV9zZXEoZHNpLCBTVDc3MDNfQ01EX1NFVFZDT00s
IDB4M0YsIDB4M0YpOwo+IC0JZHNpX2dlbmVyaWNfd3JpdGVfc2VxKGRzaSwgMHhCRiwgMHgwMiwg
MHgxMSwgMHgwMCk7Cj4gKwlkc2lfZ2VuZXJpY193cml0ZV9zZXEoZHNpLCBTVDc3MDNfQ01EX1VO
S05PV04wLCAweDAyLCAweDExLCAweDAwKTsKPiAgCWRzaV9nZW5lcmljX3dyaXRlX3NlcShkc2ks
IFNUNzcwM19DTURfU0VUR0lQMSwKPiAgCQkJICAgICAgMHg4MiwgMHgxMCwgMHgwNiwgMHgwNSwg
MHg5RSwgMHgwQSwgMHhBNSwgMHgxMiwKPiAgCQkJICAgICAgMHgzMSwgMHgyMywgMHgzNywgMHg4
MywgMHgwNCwgMHhCQywgMHgyNywgMHgzOCwKPiAtLSAKPiAyLjIwLjEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
