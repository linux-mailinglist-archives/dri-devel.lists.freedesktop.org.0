Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D7177588
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 12:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FE76E819;
	Tue,  3 Mar 2020 11:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1466EA39
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 11:55:08 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j968f-0000I7-0k; Tue, 03 Mar 2020 12:55:05 +0100
Message-ID: <4c61fde86c5e0dced249221dbc0a8d4207d5bffa.camel@pengutronix.de>
Subject: Re: [PATCH 0/5] drm/etnaviv: Ignore MC bit when checking for
 runtime suspend
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Mar 2020 12:55:04 +0100
In-Reply-To: <cover.1583176306.git.agx@sigxcpu.org>
References: <cover.1583176306.git.agx@sigxcpu.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW8sIDIwMjAtMDMtMDIgYXQgMjA6MTMgKzAxMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+
IEF0IGxlYXN0IEdDNzAwMCBmYWlscyB0byBlbnRlciBydW50aW1lIHN1c3BlbmQgZm9yIGxvbmcg
cGVyaW9kcyBvZiB0aW1lIHNpbmNlCj4gdGhlIE1DIGJlY29tZXMgYnVzeSBhZ2FpbiBldmVuIHdo
ZW4gdGhlIEZFIGlzIGlkbGUuIFRoZSByZXN0IG9mIHRoZSBzZXJpZXMKPiBtYWtlcyBkZXRlY3Rp
bmcgc2ltaWxhciBpc3N1ZXMgZWFzaWVyIHRvIGRlYnVnIGluIHRoZSBmdXR1cmUgYnkgY2hlY2tp
bmcKPiBhbGwga25vd24gYml0cyBpbiBkZWJ1Z2ZzIGFuZCBhbHNvIHdhcm5pbmcgaW4gdGhlIEVC
VVNZIGNhc2UuCgpUaGFua3MsIHNlcmllcyBhcHBsaWVkIHRvIGV0bmF2aXYvbmV4dC4KCj4gVGVz
dGVkIG9uIEdDNzAwMCB3aXRoIGEgcmVkdWNlZCBydW50aW1lIGRlbGF5IG9mIDUwbXMuIFBhdGNo
ZXMgYXJlCj4gYWdhaW5zdCBuZXh0LTIwMjAwMjI2LgoKSSd2ZSBhbHJlYWR5IHdvbmRlcmVkIGlm
IDIwMG1zIGlzIHRvbyBsb25nLCA1MG1zIHNvdW5kcyBtb3JlCnJlYXNvbmFibGUuIERvIHlvdSBo
YXZlIGFueSBudW1iZXJzIG9uIHRoZSBwb3dlciBkcmF3IG9uIHRoZSBpLk1YOE0Kd2l0aCBpZGxl
IEdQVSwgdnMuIGJlaW5nIGZ1bGx5IHBvd2VyIGdhdGVkPyAKClJlZ2FyZHMsCkx1Y2FzCgo+IFRo
YW5rcyB0byBMdWNhcyBTdGFjaCBmb3IgcG9pbnRpbmcgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlv
bi4KPiAKPiBHdWlkbyBHw7xudGhlciAoNSk6Cj4gICBkcm0vZXRuYXZpdjogRml4IHR5cG8gaW4g
Y29tbWVudAo+ICAgZHJtL2V0bmF2aXY6IFVwZGF0ZSBpZGxlIGJpdHMKPiAgIGRybS9ldG5hdml2
OiBDb25zaWRlciBhbGwga3dub3duIGlkbGUgYml0cyBpbiBkZWJ1Z2ZzCj4gICBkcm0vZXRuYXZp
djogSWdub3JlIE1DIHdoZW4gY2hlY2tpbmcgcnVudGltZSBzdXNwZW5kIGlkbGVuZXNzCj4gICBk
cm0vZXRuYXZpdjogV2FybiB3aGVuIEdQVSBkb2Vzbid0IGlkbGUgZmFzdCBlbm91Z2gKPiAKPiAg
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyAgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9zdGF0ZV9oaS54bWwuaCB8
ICA3ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
