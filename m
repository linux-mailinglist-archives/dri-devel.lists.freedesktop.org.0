Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C37168DF2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 10:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF3E6E506;
	Sat, 22 Feb 2020 09:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D17A6E506
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:03:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3A7133E;
 Sat, 22 Feb 2020 10:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582362195;
 bh=CLvqNcz2JhfoTwRAt4mYET0ULLiv2hrtWNr2/dCgKrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpx9Fsh2MrG8yN/SIzPtqK3s2XKfjE1i1XdQpLd9h8Pdd4szxurGXT4aCy/tAQKIJ
 0o3H0RhWrYURQ+aM8lzXLLvrm50tQXIv+B2tMw3UsMTcuCdvurG6UKPWp77eozxeLX
 Xzf1IEpXm3VMKLdRrdGCvSvkcWkNHA/3+bmMWUGo=
Date: Sat, 22 Feb 2020 11:02:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 04/51] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20200222090254.GA4846@pendragon.ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-5-laurent.pinchart@ideasonboard.com>
 <20200217095308.GK2363188@phenom.ffwll.local>
 <20200218012127.GR4830@pendragon.ideasonboard.com>
 <CAKMK7uHsrNQCOO7kPQXkCjCtLyB8A1x80Y63XzV2VizSxhMptg@mail.gmail.com>
 <20200221142324.GG4955@pendragon.ideasonboard.com>
 <20200221171830.GA24845@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221171830.GA24845@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDY6MTg6MzBQTSArMDEwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gPiBXaHkgw7Qgd2h5IGRpZCBJIGhhdmUg
dG8gc3RhcnQgdGhlIERSTS9LTVMgZG9jdW1lbnRhdGlvbiBlZmZvcnQgeWVhcnMKPiA+IGFnbywg
dG8gc2VlIGl0IGJpdGluZyBtZSBiYWNrIG5vdyA/IDotKQo+Cj4gVGhhdHMgb2J2aW91c2x5IGJl
Y2F1c2UgeW91IGFuZCBjb3VudGxlc3Mgb3RoZXJzIGFyZSBzb21lIHdlcmUgbmljZQo+IHBlb3Bs
ZSB0aGF0IGxpa2UgdGhlIG5pY2UgY291c3kgZmVlbGluZyB3aGVuIHlvdSBrbm93IHlvdSBhcmUg
ZG9pbmcKPiBzb21ldGhpbmcgdG8gaGVscCBvdGhlcnMuCj4gSXQgaXMgbm8geW91ciBmYXVsdCB0
aGF0IHNvbWUgb2YgdGhlc2Ugb3RoZXJzIGFyZSBhIGxpdHRsZSBjbHVlbGVzcwo+IGRlc3BpdGUg
dGhlIGRvY3VtZW50YXRpb24gZWZmb3J0Lgo+IFdoZW4gSSBzb21ldGltZXMgd2FuZGVyIGFyb3Vu
ZCBpbiB0aGUga2VybmVsIGFuZCB0aGVuIHRyeSB0byByZWFkIHRoZQo+IGRvY3VtZW50YXRpb24g
b2Ygb3RoZXIgc3Vic3lzdGVtcyBhbmQgZmFpbHMgdG8gZmluZCBpdCBvciB0aGUgcXVhbGl0eQo+
IGlzIG5vdCBqdXN0IHRoZXJlLiBUaGVuIEkgcmVhbGx5IGFwcHJlY2lhdGUgYWxsIHRoZSBoYXJk
Cj4gZWZmb3J0IGRvbmUgaW4gdGhlIERSTSBzdWJzeXN0ZW0uCj4gU28gdGh1bWJzIHVwLCBwbGVh
c2Uga2VlcCB1cCB0aGUgZ29vZCB3b3JrIGFsbCBvZiB5b3UuCgpUaGFuayB5b3UgZm9yIHRoZSBj
b21wbGltZW50LiBJJ2xsIGRvIG15IGJlc3QgOi0pCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
