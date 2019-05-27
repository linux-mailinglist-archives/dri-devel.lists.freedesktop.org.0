Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08E2CD51
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5143F89F41;
	Tue, 28 May 2019 17:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs25.siol.net [185.57.226.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC7189B03
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 15:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id AB104520C06;
 Mon, 27 May 2019 17:29:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id D9ETVfFkE8JX; Mon, 27 May 2019 17:29:36 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 5733A5217BC;
 Mon, 27 May 2019 17:29:36 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 9F19C520C06;
 Mon, 27 May 2019 17:29:33 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/5] drm/bridge: add encoder support to specify bridge
 input format
Date: Mon, 27 May 2019 17:29:33 +0200
Message-ID: <2679412.W4MLjRXsPJ@jernej-laptop>
In-Reply-To: <20190520133753.23871-3-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <20190520133753.23871-3-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 May 2019 17:13:51 +0000
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
Cc: jonas@kwiboo.se, maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyEKCkRuZSBwb25lZGVsamVrLCAyMC4gbWFq
IDIwMTkgb2IgMTU6Mzc6NTAgQ0VTVCBqZSBOZWlsIEFybXN0cm9uZyBuYXBpc2FsKGEpOgo+IFRo
aXMgcGF0Y2ggYWRkcyBhIG5ldyBmb3JtYXRfc2V0KCkgY2FsbGJhY2sgdG8gdGhlIGJyaWRnZSBv
cHMgcGVybWl0dGluZwo+IHRoZSBlbmNvZGVyIHRvIHNwZWNpZnkgdGhlIG5ldyBpbnB1dCBmb3Jt
YXQgYW5kIGVuY29kaW5nLgo+IAo+IFRoaXMgYWxsb3dzIHN1cHBvcnRpbmcgdGhlIHZlcnkgc3Bl
Y2lmaWMgSERNSTIuMCBZVVY0MjAgb3V0cHV0IG1vZGUKPiB3aGVuIHRoZSBicmlkZ2UgY2Fubm90
IGNvbnZlcnQgZnJvbSBSR0Igb3IgWVVWNDQ0IHRvIFlVVjQyMC4KPiAKPiBJbiB0aGlzIGNhc2Us
IHRoZSBlbmNvZGUgbXVzdCBkb3duc2FtcGxlIGJlZm9yZSB0aGUgYnJpZGdlIGFuZCBtdXN0Cj4g
c3BlY2lmeSB0aGUgYnJpZGdlIHRoZSBuZXcgaW5wdXQgYnVzIGZvcm1hdCBkaWZmZXJzLgo+IAo+
IFRoaXMgd2lsbCBhbHNvIGhlbHAgc3VwcG9ydGluZyB0aGUgWVVWNDIwIG1vZGUgd2hlcmUgdGhl
IGJyaWRnZSBjYW5ub3QKPiBkb3duc2FtcGxlLCBhbmQgYWxzbyBzdXBwb3J0IDEwYml0LCAxMmJp
dCBhbmQgMTZiaXQgb3V0cHV0IG1vZGVzCj4gd2hlbiB0aGUgYnJpZGdlIGNhbm5vdCBjb252ZXJ0
IGJldHdlZW4gZGlmZmVyZW50IGJpdCBkZXB0aHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEpl
cm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KCkJlc3QgcmVnYXJkcywKSmVy
bmVqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
