Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA26752FC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 17:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FED26E773;
	Thu, 25 Jul 2019 15:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534496E6B8;
 Thu, 25 Jul 2019 15:39:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1FED62015B;
 Thu, 25 Jul 2019 17:39:52 +0200 (CEST)
Date: Thu, 25 Jul 2019 17:39:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v4 0/4] drm/via: drop use of deprecated headers drmP.h +
 drm_os_linux.h
Message-ID: <20190725153950.GA23958@ravnborg.org>
References: <20190723200944.17285-1-sam@ravnborg.org>
 <20190724161821.GD24644@arch-x1c3>
 <20190724185555.GD22640@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724185555.GD22640@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=5ykLImnRztd_BHCO2MIA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDg6NTU6NTVQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIEVtaWwuCj4gCj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDU6MTg6MjFQTSAr
MDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gT24gMjAxOS8wNy8yMywgU2FtIFJhdm5ib3Jn
IHdyb3RlOgo+ID4gPiBUaGlzIGlzIHNvbWUgamFuaXRvcmlhbCB1cGRhdGVzIHRvIHRoZSB2aWEg
ZHJpdmVyCj4gPiA+IHRoYXQgaXMgcmVxdWlyZWQgdG8gZ2V0IHJpZCBvZiBkZXByZWNhdGVkIGhl
YWRlcnMKPiA+ID4gaW4gdGhlIGRybSBzdWJzeXN0ZW0uCj4gPiA+IAo+ID4gPiBUaGUgZmlyc3Qg
dGhyZWUgcGF0Y2hlcyBwcmVwYXJlIGZvciB0aGUgcmVtb3ZhbCBvZiBkcm1QLmguCj4gPiA+IFRo
ZSBsYXN0IHBhdGNoIHJlbW92ZSB1c2Ugb2YgZHJtUC5oIGFuZCByZXBsYWNlIHdpdGggbmVjZXNz
YXJ5Cj4gPiA+IGluY2x1ZGUgZmlsZXMgdG8gZml4IGJ1aWxkLgo+ID4gPiAKPiA+ID4gQnVpbGQg
dGVzdGVkIHdpdGggdmFyaW91cyBjb25maWdzIGFuZCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCj4g
PiA+IAo+ID4gPiBJIGhhZCBwcmVmZXJyZWQgdGhhdCB0aGUgdmlhIGRyaXZlciB3YXMgcmVwbGFj
ZWQgYnkgdGhlCj4gPiA+IG9wZW5jaHJvbWUgZHJpdmVyLCBidXQgdW50aWwgd2UgaGF2ZSBpdCB0
aGVuIHdlIG5lZWQKPiA+ID4gdG8gZGVhbCB3aXRoIHRoZSBsZWdhY3kgdmlhIGRyaXZlciB3aGVu
IHJlbW92aW5nIG9sZCBjcnVmdAo+ID4gPiBpbiB0aGUgZHJtIHN1YnN5c3RlbS4KPiA+ID4gCj4g
PiA+IHY0Ogo+ID4gPiAtIFVzZSBhIG1vcmUgc3RhbmRhcmQgdmFyaWFudCBmb3IgdmlhX3dyaXRl
OF9tYXNrKCkgKEVtaWwpCj4gPiA+IAo+ID4gVGhhbmsgeW91LiBUaGUgc2VyaWVzIGlzOgo+ID4g
UmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIHdpdGggbWUhCj4gSSB3aWxsIGFwcGx5IHdoZW4g
SSBhbSBiYWNrIGhvbWUgdG9tb3Jyb3cuCgpQYXRjaGVzIGFwcGxpZWQgYW5kIHB1c2hlZCBvdXQg
dG8gZHJtLW1pc2MtbmV4dC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
