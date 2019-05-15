Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A31EAC3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 11:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EE989701;
	Wed, 15 May 2019 09:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6189700;
 Wed, 15 May 2019 09:14:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 455C880489;
 Wed, 15 May 2019 11:14:54 +0200 (CEST)
Date: Wed, 15 May 2019 11:14:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 09/11] drm/fb-helper: Prepare to move out modeset
 config code
Message-ID: <20190515091452.GD31712@ravnborg.org>
References: <20190506180139.6913-1-noralf@tronnes.org>
 <20190506180139.6913-10-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506180139.6913-10-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8
 a=P-IC7800AAAA:8 a=7gkXJVJtAAAA:8 a=9PepZnsdvBgvAIrIqNYA:9
 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmCgpPbiBNb24sIE1heSAwNiwgMjAxOSBhdCAwODowMTozN1BNICswMjAwLCBOb3Jh
bGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhpcyBwcmVwYXJlcyB0aGUgbW9kZXNldCBjb2RlIHNvIGl0
IGNhbiBiZSBtb3ZlZCBvdXQgYXMtaXMgaW4gdGhlIG5leHQKPiBwYXRjaC4KPiAKPiB2MzogUmVt
b3ZlIHN0cmF5IG5ld2xpbmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
