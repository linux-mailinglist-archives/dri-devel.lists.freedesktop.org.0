Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5770113F7E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 11:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25906F87D;
	Thu,  5 Dec 2019 10:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAC66F87D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 10:37:14 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1icoVT-0001Rs-6X; Thu, 05 Dec 2019 11:37:11 +0100
Message-ID: <475aa5cfd3d3ccac5b2c76ba031bf925db09a917.camel@pengutronix.de>
Subject: Re: baseline power consumtion kernel > 5.3.10
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido Riedel <guido.riedel@web.de>, linux-pm@vger.kernel.org
Date: Thu, 05 Dec 2019 11:37:10 +0100
In-Reply-To: <3ebca53c-b8fa-1e7f-6d4e-abdc93cbf2a6@web.de>
References: <3ebca53c-b8fa-1e7f-6d4e-abdc93cbf2a6@web.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRG8sIDIwMTktMTItMDUgYXQgMDg6NTIgKzAxMDAsIEd1aWRvIFJpZWRlbCB3cm90ZToKPiBI
aSwKPiAKPiBTaW5jZSBLZXJuZWwgNS4zLjExIEkgZ290IGEgc2lnbmlmaWNhbnQgaW5jcmVhc2Vk
IGJhc2VsaW5lIFBvd2VyIAo+IGNvbnN1bXB0aW9uLiBJIHRyaWVkIHVwIHRvIDUuNC4xIG9uIGFy
Y2ggbGludXguIFBvd2VydG9wIHNob3dzIGFuIAo+IGluY3JlYXNlIGZyb20gMy42VyBvbiA1LjMu
MTAgdG8gNS54IFcgb24gaGlnaGVyIEtlcm5lbHMuIE15IGxhcHRvcCBmYW4gCj4gc3BpbnMgYSBs
b3QgbW9yZS4KPiAKPiBJIHJlYWQgdGhhdCBhIGxvdCBvZiBJbnRlbCBzdHVmZiBoYXMgZW50ZXJl
ZCB0aGUgS2VybmVsIGluIDUuMy4xMSwgY291bGQgCj4gdGhpcyBjYXVzZSBpdD8gV2lsbCBpdCBz
dGF5IGxpa2UgdGhpcyBpbiB0aGUgbmV4dCBWZXJzaW9ucz8gQ2FuIEkgbWF5YmUgCj4gc3dpdGNo
IHNvbWV0aGluZyBvZmYgZXRjLiB0byBnZXQgYSBsb3dlciBiYXNlbGluZSBwb3dlcj8KPiAKPiBJ
IGhvcGUgSSB3cml0ZSB0byB0aGUgcmlnaHQgYWRkcmVzcywgb3RoZXJ3aXNlIHNvcnJ5LgoKN2Uz
NGY0ZTRhYWQzICgiZHJtL2k5MTUvZ2VuOCs6IEFkZCBSQzYgQ1RYIGNvcnJ1cHRpb24gV0EiKSwg
d2hpY2ggaGFzCmJlZW4gYmFja3BvcnRlZCB0byA1LjMuMTEgY2F1c2VzIGEgbWFqb3IgcG93ZXIg
cmVncmVzc2lvbiBkdWUgdG8gSW50ZWwKR1BVcyBub3QgYmVpbmcgYWJsZSB0byBlbnRlciByYzYg
YW55bW9yZS4KCkZpeGVzIGZvciB0aGlzIGFyZSAtbmV4dCwgYnV0IEkgZG9uJ3Qga25vdyB3aGF0
IHRoZSBwbGFucyBmb3IgbGFuZGluZwphbmQgbWF5YmUgYmFja3BvcnRpbmcgYXJlLgoKUmVnYXJk
cywKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
