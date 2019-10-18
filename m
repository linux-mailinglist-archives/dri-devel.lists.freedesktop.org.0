Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD12DCE3A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166206EBAD;
	Fri, 18 Oct 2019 18:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Fri, 18 Oct 2019 12:04:27 UTC
Received: from mail.cmpwn.com (mail.cmpwn.com [45.56.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645D6EB2E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 12:04:27 +0000 (UTC)
In-Reply-To: <20191018122130.0f880724@eldfell.localdomain>
Date: Fri, 18 Oct 2019 07:54:50 -0400
From: "Drew DeVault" <sir@cmpwn.com>
To: "Pekka Paalanen" <ppaalanen@gmail.com>, "Daniel Vetter"
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-Id: <BXSMP84X56T9.317VNFYFVMCWW@homura>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=cmpwn.com; s=cmpwn; 
 t=1571399691; bh=zDkd5g92iyPTDv/TGrDb6pZ/copZLVSP5YcvaOebQ8Y=;
 h=In-Reply-To:Date:From:To:Cc:Subject;
 b=W8u418gm6cOKRROvsoihfIOqQgS+zVpJKxPfC8yzzRorzMxcekno3cUrpR+QhyMJS
 1FjtrFpQfivIyxqK5km/YiASORJKK2yVekA6nwq7ZBRO1MIU5UwHJ1ntBGYO5t+BF6
 HLxUb07DSQwL0V/eGhwp0aUOCJUa3VPWs8CBHgDw=
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
Cc: Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpIE9jdCAxOCwgMjAxOSBhdCAxMjoyMSBQTSBQZWtrYSBQYWFsYW5lbiB3cm90ZToKPiBP
bmUgdGhpbmcgSSBkaWQgbm90IGtub3cgdGhlIGxhc3QgdGltZSB3YXMgdGhhdCBhcHBhcmVudGx5
Cj4gc3lzdGVtZC1sb2dpbmQgbWF5IG5vdCBsaWtlIHRvIGdpdmUgb3V0IG5vbi1tYXN0ZXIgRFJN
IGZkcy4gVGhhdCBtaWdodAo+IG5lZWQgZml4aW5nIGluIGxvZ2luZCBpbXBsZW1lbnRhdGlvbnMu
IEkgaG9wZSBzb21lb25lIHdvdWxkIHN0ZXAgdXAgdG8KPiBsb29rIGludG8gdGhhdC4KPgo+IFRo
aXMgcHJvdG9jb2wgYWltcyB0byBkZWxpdmVyIGEgaGFybWxlc3MgInJlYWQtb25seSIgRFJNIGRl
dmljZSBmaWxlCj4gZGVzY3JpcHRpb24gdG8gYSBjbGllbnQsIHNvIHRoYXQgdGhlIGNsaWVudCBj
YW4gZW51bWVyYXRlIGFsbCBEUk0KPiByZXNvdXJjZXMsIGZldGNoIEVESUQgYW5kIG90aGVyIHBy
b3BlcnRpZXMgdG8gYmUgYWJsZSB0byBkZWNpZGUgd2hpY2gKPiBjb25uZWN0b3IgaXQgd291bGQg
d2FudCB0byBsZWFzZS4gVGhlIGNsaWVudCBzaG91bGQgbm90IGJlIGFibGUgdG8KPiBjaGFuZ2Ug
YW55IEtNUyBzdGF0ZSB0aHJvdWdoIHRoaXMgZmQsIGFuZCBpdCBzaG91bGQgbm90IGJlIGFibGUg
dG8gZS5nLgo+IHNweSBvbiBkaXNwbGF5IGNvbnRlbnRzLiBUaGUgYXNzdW1wdGlvbiBpcyB0aGF0
IGEgbm9uLW1hc3RlciBEUk0gZmQKPiBmcm9tIGEgZnJlc2ggb3BlbigpIHdvdWxkIGJlIGZpbmUg
Zm9yIHRoaXMsIGJ1dCBpcyBpdD8KCldoYXQgSSBkbyBmb3Igd2xyb290cyBpcyBjYWxsIGRybUdl
dERldmljZU5hbWVGcm9tRmQyLCB3aGljaCByZXR1cm5zIHRoZQpwYXRoIHRvIHRoZSBkZXZpY2Ug
ZmlsZSwgYW5kIHRoZW4gSSBvcGVuKCkgaXQgYW5kIHVzZQpkcm1Jc01hc3Rlci9kcm1Ecm9wTWFz
dGVyIHRvIG1ha2Ugc3VyZSBpdCdzIG5vdCBhIG1hc3RlciBmZC4gVGhpcyBzZWVtcwp0byB3b3Jr
IGNvcnJlY3RseSBpbiBwcmFjdGljZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
