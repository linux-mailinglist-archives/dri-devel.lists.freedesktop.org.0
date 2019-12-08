Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8411612D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2019 09:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D0B6E047;
	Sun,  8 Dec 2019 08:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9F6E047
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 08:41:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CBF5E80682;
 Sun,  8 Dec 2019 09:41:13 +0100 (CET)
Date: Sun, 8 Dec 2019 09:41:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: =?utf-8?B?TWljaGHFgsKgTWlyb3PFgmF3?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v2 01/25] drm/drm_panel: no error when no callback
Message-ID: <20191208084112.GA21056@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
 <20191207140353.23967-2-sam@ravnborg.org>
 <20191207190803.GA19924@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191207190803.GA19924@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=Edsm2jOOeKCTBX3btGcA:9 a=x_taNTUiT5vn5hvE:21 a=Rz0nudXiiK-ryiJa:21
 a=QEXdDO2ut3YA:10
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGHFggoKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gPiBpbmRleCBjZThkYTY0MDIyYjQuLmQ3MTY1NWIyNjM0
YyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gPiArKysgYi9pbmNs
dWRlL2RybS9kcm1fcGFuZWwuaGEKPiBbLi4uXQo+ID4gIAkvKioKPiA+ICAJICogQGdldF9tb2Rl
czoKPiA+ICAJICoKPiA+IC0JICogQWRkIG1vZGVzIHRvIHRoZSBjb25uZWN0b3IgdGhhdCB0aGUg
cGFuZWwgaXMgYXR0YWNoZWQgdG8gYW5kCj4gPiAtCSAqIHJldHVybiB0aGUgbnVtYmVyIG9mIG1v
ZGVzIGFkZGVkLgo+ID4gKwkgKiBBZGQgbW9kZXMgdG8gdGhlIGNvbm5lY3RvciB0aGF0IHRoZSBw
YW5lbCBpcyBhdHRhY2hlZCB0by4KPiA+ICsJICoKPiA+ICsJICogVGhpcyBmdW5jdGlvbiBpcyBt
YW5kYXRvcnkuCj4gPiArCSAqCj4gPiArCSAqIFJldHVybnMgdGhlIG51bWJlciBvZiBtb2RlcyBh
ZGRlZCwgLUVPUE5PVFNVUFAgaWYgY2FsbGJhY2sKPiA+ICsJICogaXMgbWlzc2luZywgLUVJTlZB
TCBpZiBwYW5lbCBpcyBOVUxMLgo+ID4gIAkgKi8KPiA+ICAJaW50ICgqZ2V0X21vZGVzKShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gPiAgCj4gCj4gSGkhCj4gCj4gSWYgLmdldF9tb2RlcyBp
cyBtYW5kYXRvcnksIHRoZW4gcGFuZWwtPmZ1bmMgIT0gTlVMTCBjaGVja3MgY2FuIGJlIHJlbW92
ZWQKPiBpZiBwYW5lbC0+ZnVuYyBhbmQgLmdldF9tb2RlcyBwcmVzZW5jZSBnZXRzIGNoZWNrZWQg
YXQgcGFuZWwgcHJvYmUgdGltZS4KCmRyaXZlcnMgYXJlIHN1cHBvc2VkIHRvIHVzZSBkcm1fcGFu
ZWxfaW5pdCgpIHRvIHNldCB1cCBwYW5lbC1mdW5jLApzbyB0aGF0IHdvdWxkIGJlIGEgZ29vZCB0
aW1lIHRvIHZlcmlmeSB0aGF0IHByZWNvbmRpdGlvbnMgYXJlIG1ldC4KQnV0IGFzIHdlIGhhdmUg
bm8gY29udHJvbCBpZiBhbnkgZHJpdmVycyBkb2VzIHdyb25nIHRoaW5ncyBsYXRlcgp0aGUgY2hl
Y2tzIGZvciBjb25zaXN0ZW5jeSBzdGlsbCBtYWtlcyBzZW5zZS4KSSBoYXZlIGEgZmV3IG90aGVy
IHNtYWxsIGNoYW5nZXMgcGVuZGluZyBhbmQgd2lsbCBpbmNsdWRlIGNoZWNrcwppbiBkcm1fcGFu
ZWxfaW5pdCgpLgoKVGhhbmtzLAoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
