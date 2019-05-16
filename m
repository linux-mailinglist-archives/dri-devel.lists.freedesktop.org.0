Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653220B5E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248C689722;
	Thu, 16 May 2019 15:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCC589623;
 Thu, 16 May 2019 15:36:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8B1D68055A;
 Thu, 16 May 2019 17:36:01 +0200 (CEST)
Date: Thu, 16 May 2019 17:36:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 08/11] drm/fb-helper: Remove drm_fb_helper_connector
Message-ID: <20190516153600.GA14036@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-9-noralf@tronnes.org>
 <20190516130732.GA12435@ravnborg.org>
 <8701457d-7240-cc5f-2370-ca4aea5efd1c@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8701457d-7240-cc5f-2370-ca4aea5efd1c@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=f4o5EpSCUUDjHMmqGN0A:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDM6NTM6MDdQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERlbiAxNi4wNS4yMDE5IDE1LjA3LCBza3JldiBT
YW0gUmF2bmJvcmc6Cj4gPiBIaSBOb3JhbGYuCj4gPiAKPiA+IFNlZSBmZXcgY29tbWVudHMgaW4g
dGhlIGZvbGxvd2luZy4KPiA+IAo+ID4gCVNhbQo+ID4gCj4gPiBPbiBNb24sIE1heSAwNiwgMjAx
OSBhdCAwODowMTozNlBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPj4gQWxsIGRy
aXZlcnMgYWRkIGFsbCB0aGVpciBjb25uZWN0b3JzIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBrZWVw
IGFyb3VuZCBhbgo+ID4+IGFycmF5IG9mIGF2YWlsYWJsZSBjb25uZWN0b3JzLgo+IAo+IEkgY291
bGQgZXhwYW5kIG9uIHRoaXMgdGV4dCBhIGxpdHRsZToKPiAKPiBBbGwgZHJpdmVycyBhZGQgYWxs
IHRoZWlyIGNvbm5lY3RvcnMgc28gdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgYXJvdW5kIGFuCj4g
YXJyYXkgb2YgYXZhaWxhYmxlIGNvbm5lY3RvcnMuIEluc3RlYWQgd2UganVzdCBwdXQgdGhlIHVz
ZWFibGUgKG5vdAo+IHdyaXRlYmFjaykgY29ubmVjdG9ycyBpbiBhIHRlbXBvcmFyeSBhcnJheSB1
c2luZwo+IGRybV9jbGllbnRfZm9yX2VhY2hfY29ubmVjdG9yX2l0ZXIoKSBldmVyeXRpbWUgd2Ug
cHJvYmUgdGhlIG91dHB1dHMuCj4gT3RoZXIgcGxhY2VzIHdoZXJlIGl0J3MgbmVjZXNzYXJ5IHRv
IGxvb2sgYXQgdGhlIGNvbm5lY3RvcnMsIHdlIGp1c3QKPiBpdGVyYXRlIG92ZXIgdGhlbSB1c2lu
ZyB0aGUgc2FtZSBpdGVyYXRvciBmdW5jdGlvbi4KQmV0dGVyLCB0aGFua3MuCkFmdGVyIHlvdSBj
bGFyaWZpZWQgdGhpbmdzIGxvb2tzIGdvb2QgdG8gbWUgYW5kIHlvdSBjYW4gYWRkIG15OgpSZXZp
ZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
