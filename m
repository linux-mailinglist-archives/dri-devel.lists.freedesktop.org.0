Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA12AB4A2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFF88932D;
	Mon,  9 Nov 2020 10:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A97A8932D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEAE0ABCC;
 Mon,  9 Nov 2020 10:19:46 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org
References: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bb94260f-8713-6b12-dde5-f121117aac3d@suse.de>
Date: Mon, 9 Nov 2020 11:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
Content-Language: en-US
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
Cc: jenmin_yuan@aspeedtech.com, airlied@redhat.com, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com, eich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDA1LjExLjIwIHVtIDEwOjQ3IHNjaHJpZWIgS3VvSHNpYW5nIENob3U6Cj4gW0J1Z10g
Q2hhbmdlIHRoZSB2ZXJ0aWNhbCBzeW5jaHJvb3VzIHBvbGFyeSBvZiAxOTIweDEwODAgQDYwSHoK
PiAgICAgICBmcm9tICBOZWd0aXZlIHRvIFBvc2l0aXZlCj4gCj4gU2lnbmVkLW9mZi1ieTogS3Vv
SHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2guY29tPgoKSSd2ZSBtZXJnZWQg
dGhpcyBwYXRjaC4gVGhhbmtzIQoKQmVzdCByZWdhcmRzClRob21hcwoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfdGFibGVzLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfdGFibGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJsZXMu
aAo+IGluZGV4IDg0MTRlNTQzZjI2MC4uNTFlZmM1YjRhNTVjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X3RhYmxlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfdGFibGVzLmgKPiBAQCAtMjk1LDEwICsyOTUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
c3RfdmJpb3NfZW5odGFibGUgcmVzXzE2MDB4OTAwW10gPSB7Cj4gCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYXN0X3ZiaW9zX2VuaHRhYmxlIHJlc18xOTIweDEwODBbXSA9IHsKPiAgCXsyMjAwLCAx
OTIwLCA4OCwgNDQsIDExMjUsIDEwODAsIDQsIDUsIFZDTEsxNDhfNSwJLyogNjBIeiAqLwo+IC0J
IChTeW5jTlAgfCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwg
TmV3TW9kZUluZm8gfAo+ICsJIChTeW5jUFAgfCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8
IFdpZGVTY3JlZW5Nb2RlIHwgTmV3TW9kZUluZm8gfAo+ICAJICBBU1QyNTAwUHJlQ2F0Y2hDUlQp
LCA2MCwgMSwgMHgzOCB9LAo+ICAJezIyMDAsIDE5MjAsIDg4LCA0NCwgMTEyNSwgMTA4MCwgNCwg
NSwgVkNMSzE0OF81LAkvKiA2MEh6ICovCj4gLQkgKFN5bmNOUCB8IENoYXJ4OERvdCB8IExpbmVD
b21wYXJlT2ZmIHwgV2lkZVNjcmVlbk1vZGUgfCBOZXdNb2RlSW5mbyB8Cj4gKwkgKFN5bmNQUCB8
IENoYXJ4OERvdCB8IExpbmVDb21wYXJlT2ZmIHwgV2lkZVNjcmVlbk1vZGUgfCBOZXdNb2RlSW5m
byB8Cj4gIAkgIEFTVDI1MDBQcmVDYXRjaENSVCksIDB4RkYsIDEsIDB4MzggfSwKPiAgfTsKPiAK
PiAtLQo+IDIuMTguNAo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
