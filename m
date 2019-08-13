Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6E8BABF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AFA6E146;
	Tue, 13 Aug 2019 13:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874346E146
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:50:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0C072B2;
 Tue, 13 Aug 2019 15:50:49 +0200 (CEST)
Date: Tue, 13 Aug 2019 16:50:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 26/60] drm/omap: Detach from panels at remove time
Message-ID: <20190813135047.GH5009@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-23-laurent.pinchart@ideasonboard.com>
 <8efa26e8-4438-96f0-1c2c-193912b979e1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8efa26e8-4438-96f0-1c2c-193912b979e1@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565704250;
 bh=HtcXXPUfbkpc18RhzKw7/6Q/+swDzCyTL5AEAXSp7YU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fAczoO+esIgegwM/ybowgN8tKdfeXW4APJrXu9dlltO+rK8QM0X3ygreXwzCMttBT
 3blfBqS4ypA+WjFfPLISNuXKVGKScZdtDyX3eADtRKWyAHygqiCyq+vsmOV+sPAX/4
 N8NASYKv7yVOYWl0dj7lh0uV75puj2pNX/DNjjDI=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEwOjI4OjUyQU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBUaGUgb21hcGRybSBkcml2ZXIgYXR0YWNoZXMgdG8gcGFuZWxzIHdpdGggZHJt
X3BhbmVsX2F0dGFjaCgpIGF0IHByb2JlCj4gPiB0aW1lIGJ1dCBuZXZlciBjYWxscyBkcm1fcGFu
ZWxfZGV0YWNoKCkuIEZpeCBpdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5j
aGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgfCAyNCArKysrKysrKysrKysrKysrKysr
LS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZHJtX3BhbmVsX2RldGFjaCgpIGlzIGNhbGxlZCBpbiBvbWFwX2Rpc2Nvbm5lY3Rf
cGlwZWxpbmVzKCkuCgpJIHdvbmRlciBob3cgSSBtaXNzZWQgdGhhdCA6LVMgSSdsbCBkcm9wIHRo
aXMgcGF0Y2guCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
