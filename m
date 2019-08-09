Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A18799D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA156EDF2;
	Fri,  9 Aug 2019 12:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8256EDF2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:16:36 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hw3ow-0007CA-ES; Fri, 09 Aug 2019 14:16:34 +0200
Message-ID: <1565352994.4864.4.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/8] drm/etnaviv: replace MMU flush marker with flush
 sequence
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Fri, 09 Aug 2019 14:16:34 +0200
In-Reply-To: <20190809120424.32679-4-l.stach@pengutronix.de>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
 <20190809120424.32679-4-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTA5IGF0IDE0OjA0ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBJ
ZiBhIE1NVSBpcyBzaGFyZWQgYmV0d2VlbiBtdWx0aXBsZSBHUFVzLCBhbGwgb2YgdGhlbSBuZWVk
IHRvIGZsdXNoIHRoZWlyCj4gVExCcywgc28gYSBzaW5nbGUgbWFya2VyIHRoYXQgZ2V0cyByZXNl
dCBvbiB0aGUgZmlyc3QgZmx1c2ggd29uJ3QgZG8uCj4gUmVwbGFjZSB0aGUgZmx1c2ggbWFya2Vy
IHdpdGggYSBzZXF1ZW5jZSBudW1iZXIsIHNvIHRoYXQgaXQncyBwb3NzaWJsZSB0bwo+IGNoZWNr
IGlmIHRoZSBUTEIgaXMgaW4gc3luYyB3aXRoIHRoZSBjdXJyZW50IHBhZ2UgdGFibGUgc3RhdGUg
Zm9yIGVhY2ggR1BVLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
