Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62600CCF51
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 10:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D9E895B9;
	Sun,  6 Oct 2019 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D308919A;
 Sun,  6 Oct 2019 08:05:18 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9139E2084D;
 Sun,  6 Oct 2019 08:04:55 +0000 (UTC)
Date: Sun, 6 Oct 2019 16:04:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
Message-ID: <20191006080442.GW7150@dragon>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
 <caf166f465465c61b70ad69d88f0634f1ca2ae64.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <caf166f465465c61b70ad69d88f0634f1ca2ae64.camel@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570349117;
 bh=D/wd/mWjmPW54gsl+QbV0f4qahPhKTVJuxLON5hP40Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aH/RzuIGYc/dOl4IhP5y4h85I95r/bQ5J8zN0qKVhvuw7vDiQ6SDlIuWnFY8pvyDj
 6BPXid09AqnfgTnrScg6vt3UZrK1DLPUjn9POE22o09cLjLqadWcW+lG8EYTqsK45w
 BwrEomQXQBzWyS7VxqucwOTBQsbzUkuSsV9R6a7c=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Abel Vesa <abel.vesa@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMDQ6MzI6NTVQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gT24gTWksIDIwMTktMDktMTEgYXQgMTk6NDAgLTA3MDAsIEd1aWRvIEfDvG50aGVyIHdy
b3RlOgo+ID4gQWRkICNjb29saW5nLWNlbGxzIGZvciB3aGVuIHRoZSBncHUgYWN0cyBhcyBhIGNv
b2xpbmcgZGV2aWNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4
QHNpZ3hjcHUub3JnPgo+IAo+IFJldmlld2VkLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4KCkx1Y2FzLAoKSSBhc3N1bWUgeW91IHdpbGwgcGljayBpdCB1cC4KClNoYXdu
Cgo+IAo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2
L2V0bmF2aXYtZHJtLnR4dCAgICAgICAgICB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dAo+ID4g
aW5kZXggOGRlZjExYjE2YTI0Li42NDA1OTJlOGFiMmUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4
dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZXRu
YXZpdi9ldG5hdml2LWRybS50eHQKPiA+IEBAIC0yMSw2ICsyMSw3IEBAIFJlcXVpcmVkIHByb3Bl
cnRpZXM6Cj4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICAtIHBvd2VyLWRvbWFpbnM6IGEg
cG93ZXIgZG9tYWluIGNvbnN1bWVyIHNwZWNpZmllciBhY2NvcmRpbmcgdG8KPiA+ICAgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0Cj4gPiAr
LSAjY29vbGluZy1jZWxsczogOiBJZiB1c2VkIGFzIGEgY29vbGluZyBkZXZpY2UsIG11c3QgYmUg
PDI+Cj4gPiAgCj4gPiAgZXhhbXBsZToKPiA+ICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
