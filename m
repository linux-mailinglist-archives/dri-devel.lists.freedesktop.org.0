Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D456F465
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 19:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A6289A0E;
	Sun, 21 Jul 2019 17:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F11589A0E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 17:36:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 088E62007B;
 Sun, 21 Jul 2019 19:36:02 +0200 (CEST)
Date: Sun, 21 Jul 2019 19:36:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 1/1] drm/fb: remove unused function:
 drm_gem_fbdev_fb_create()
Message-ID: <20190721173601.GA27308@ravnborg.org>
References: <20190721140610.GA20842@ravnborg.org>
 <478b7a78-7469-037d-1376-749316cc060d@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <478b7a78-7469-037d-1376-749316cc060d@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=SJz97ENfAAAA:8 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8 a=TND8TyJD0e4vSTZSv7IA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=vFet0B0WnEQeilDPIY6i:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgMDY6NDg6NDZQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERlbiAyMS4wNy4yMDE5IDE2LjA2LCBza3JldiBT
YW0gUmF2bmJvcmc6Cj4gPiBBZnRlciBtaWdyYXRpbmcgc2V2ZXJhbCBkcml2ZXJzIHRvIHRoZSBn
ZW5lcmljIGZiZGV2IHRoZXJlIGFyZQo+ID4gbm8gdXNlcnMgbGVmdC4gIERlbGV0ZSB0aGUgZnVu
Y3Rpb24uCj4gPiAKPiA+IE5vdGljZWQgdGhhdCB0aGVyZSB3YXMgbm8gY2FsbGVycyB3aGlsZSBi
cm93c2luZwo+ID4gYXJvdW5kIGluIHRoZSBkcm1fZmIqIGNvZGUuCj4gPiAKPiA+IExhc3QgdXNl
ciB3YXMgcmVtb3ZlZCB3aXRoOgo+ID4gY29tbWl0IDEzYWZmMTg0ZWQ5ZiAoImRybS9xeGw6IHJl
bW92ZSBkZWFkIHF4bCBmYmRldiBlbXVsYXRpb24gY29kZSIpCj4gPiBjb21taXQgMjZkNDcwN2Q0
NDVkICgiZHJtL3F4bDogdXNlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIikKPiAKPiBMaXN0aW5n
IDIgY29tbWl0cyBmb3IgdGhlIHNhbWUgZHJpdmVyIHdhcyBjb25mdXNpbmcuIEkgdGhpbmsgeW91
IGNhbgo+IGRyb3AgdGhlIHNlY29uZCBvbmUgc2luY2UgaXQncyB0aGUgZmlyc3QgdGhhdCBjb250
YWluZWQgdGhlIGZ1bmN0aW9uIGNhbGwuCgpJIHVwZGF0ZWQgdGhlIGNoYW5nZWxvZyBsaWtlIHRo
aXMgYW5kIGFwcGxpZWQgYW5kIHB1c2hlZCBvdXQuCgpUaGFua3MsCglTYW0KCkNoYW5nZWxvZzoK
CkFmdGVyIG1pZ3JhdGluZyBzZXZlcmFsIGRyaXZlcnMgdG8gdGhlIGdlbmVyaWMgZmJkZXYgCmVt
dWxhdGlvbiB0aGVyZSBhcmUgbm8gdXNlcnMgbGVmdCBvZiBkcm1fZ2VtX2ZiZGV2X2ZiX2NyZWF0
ZS4gIApEZWxldGUgdGhlIGZ1bmN0aW9uLgoKTm90aWNlZCB0aGF0IHRoZXJlIHdhcyBubyBjYWxs
ZXJzIHdoaWxlIGJyb3dzaW5nCmFyb3VuZCBpbiB0aGUgZHJtX2ZiKiBjb2RlLgoKVGhlIGNvZGUg
dGhhdCByZWZlcmVuY2VkIHRoZSBmdW5jdGlvbiB3YXMgcmVtb3ZlZCBieToKY29tbWl0IDEzYWZm
MTg0ZWQ5ZiAoImRybS9xeGw6IHJlbW92ZSBkZWFkIHF4bCBmYmRldiBlbXVsYXRpb24gY29kZSIp
CgpUaGUgYWN0dWFsIHVzZSB3YXMgcmVtb3ZlZCBieToKY29tbWl0IDI2ZDQ3MDdkNDQ1ZCAoImRy
bS9xeGw6IHVzZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiIpCgp2MjoKLSBVcGRhdGVkIGNoYW5n
ZWxvZyBiYXNlZCBvbiBmZWVkYmFjayBmcm9tIE5vcmFsZgoKU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ckxpbms6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDcyMTE0MDYxMC5HQTIw
ODQyQHJhdm5ib3JnLm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
