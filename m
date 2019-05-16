Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930620B73
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 17:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6E689760;
	Thu, 16 May 2019 15:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BC989722;
 Thu, 16 May 2019 15:44:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7E1C5803EB;
 Thu, 16 May 2019 17:44:37 +0200 (CEST)
Date: Thu, 16 May 2019 17:44:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 00/11] drm/fb-helper: Move modesetting code to
 drm_client
Message-ID: <20190516154436.GC14036@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <fb656ffe-ae1e-104a-4e25-40e9832dcd70@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb656ffe-ae1e-104a-4e25-40e9832dcd70@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=7T5oX-H5E5PA4E-HdEQA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKPiA+ICAgZHJtL2ZiLWhlbHBlcjogUmVtb3ZlIGRybV9mYl9oZWxwZXJfY3J0
Ywo+ID4gICBkcm0vZmItaGVscGVyOiBQcmVwYXJlIHRvIG1vdmUgb3V0IGNvbW1pdCBjb2RlCj4g
PiAgIGRybS9mYi1oZWxwZXI6IE1vdmUgb3V0IGNvbW1pdCBjb2RlCj4gPiAgIGRybS9mYi1oZWxw
ZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX2Nvbm5lY3Rvcgo+IAo+IFBhdGNoZXMgNS04IGFyZSBz
dGlsbCBpbiBuZWVkIG9mIHJldmlldy4uLgpXaXRoIHRoZSBpbXByb3ZlZCBjaGFuZ2Vsb2dzIHRo
ZSByZW1haW5pbmcgcGF0Y2hlcyBhcmUgYWxsIGdvb2QgdG8gZ28KYXMgZmFyIGFzIEkgYW0gY29u
Y2VybmVkLgooTm90IHRoZSBib290c3BsYXNoIGhhY2sgLSBidXQgdGhhdHMga2luZCBvZiBvYnZp
b3VzKQoKTmljZSBzZXJpZXMhCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
