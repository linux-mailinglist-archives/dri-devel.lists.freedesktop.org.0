Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9C36DFA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915FC8982C;
	Thu,  6 Jun 2019 08:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD08984D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:00:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CF6133B;
 Thu,  6 Jun 2019 10:00:11 +0200 (CEST)
Date: Thu, 6 Jun 2019 10:59:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190606075957.GF4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603114045.jusjfo3tswro4xbm@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559808011;
 bh=F7s+czjjssKdq0j9S305nnXbFC6eahvLe2kWI7qn58M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2vzXnDOWOs+F7GYY4umRs/UwsEYsatVI3Qb8nBY29EsOfSL6HSpPd/jKWi2TQMk6
 2f0+sOxD826OizAmTtQq2bqiZauiZEMTlA+MvhfSE/QNTs4wN4CuXR1emXVxj+vFiF
 19Ui5liSBK0SfvM5i3REhpZyQdmInw02j3hRKazw=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ltb24sCgpPbiBNb24sIEp1biAwMywgMjAxOSBhdCAwMTo0MDo0NVBNICswMjAwLCBTaW1v
biBIb3JtYW4gd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDU6MTI6MzJQTSArMDMw
MCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IEFkZCB0aGUgbmV3IHJlbmVzYXMsY29tcGFu
aW9uIHByb3BlcnR5IHRvIHRoZSBMVkRTMCBub2RlIHRvIHBvaW50IHRvIHRoZQo+ID4gY29tcGFu
aW9uIExWRFMgZW5jb2RlciBMVkRTMS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4g
VGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gCj4g
SGkgTGF1cmVudCwKPiAKPiBpcyB0aGlzIHBhdGNoIHJlYWR5IHRvIGJlIG1lcmdlZD8KCkkgd2Fz
IGhvcGluZyBmb3IgYW4gYWNrIGZyb20gdGhlIERUIGJpbmRpbmdzIG1haW50YWluZXJzIGZvciB0
aGUKY29ycmVzcG9uZGluZyBiaW5kaW5ncyBjaGFuZ2VzLCBidXQgSSB3YW50IHRvIGdldCB0aGlz
IG1lcmdlZCBmb3IgdGhlCm5leHQga2VybmVsIHJlbGVhc2UsIHNvIEkgbWF5IG5vdCBnZXQgaXQu
IEknbGwgcGluZyB5b3Ugd2hlbiBJIHNlbmQgdGhlCnB1bGwgcmVxdWVzdCBmb3IgdGhlIERUIGJp
bmRpbmdzIGFuZCBkcml2ZXJzIGNoYW5nZXMsIGF0IHRoYXQgcG9pbnQgdGhpcwpwYXRjaCBzaG91
bGQgYmUgcGlja2VkIHVwLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
