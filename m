Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48448633E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94216E4B2;
	Thu,  8 Aug 2019 13:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FFA6E4B2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 13:36:09 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hviaO-0005Pu-7n; Thu, 08 Aug 2019 15:36:08 +0200
Message-ID: <1565271368.3656.18.camel@pengutronix.de>
Subject: Re: [PATCH 15/21] drm/dp: Add helper to get post-cursor adjustments
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 08 Aug 2019 15:36:08 +0200
In-Reply-To: <20190805122350.8838-15-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
 <20190805122350.8838-15-thierry.reding@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA4LTA1IGF0IDE0OjIzICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IElmIHRoZSB0
cmFuc21pdHRlciBzdXBwb3J0cyBwcmUtZW1waGFzaXMgcG9zdCBjdXJzb3IyIHRoZSBzaW5rIHdp
bGwKPiByZXF1ZXN0IGFkanVzdG1lbnRzIGluIGEgc2ltaWxhciB3YXkgdG8gaG93IGl0IHJlcXVl
c3RzIGFkanVzdG1lbnRzIHRvCj4gdGhlIHZvbHRhZ2Ugc3dpbmcgYW5kIHByZS1lbXBoYXNpcyBz
ZXR0aW5ncy4KPiAKPiBBZGQgYSBoZWxwZXIgdG8gZXh0cmFjdCB0aGVzZSBhZGp1c3RtZW50cyBv
biBhIHBlci1sYW5lIGJhc2lzIGZyb20gdGhlCj4gRFBDRCBsaW5rIHN0YXR1cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgoKUmV2aWV3ZWQt
Ynk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxp
cHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
