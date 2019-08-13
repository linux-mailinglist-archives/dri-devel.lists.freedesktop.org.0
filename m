Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29338B55A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 12:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D1E6E0F5;
	Tue, 13 Aug 2019 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C28B6E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 10:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id BA4B5FB03;
 Tue, 13 Aug 2019 12:23:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wcZcnLC9pE5; Tue, 13 Aug 2019 12:23:07 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 88682416CC; Tue, 13 Aug 2019 12:23:07 +0200 (CEST)
Date: Tue, 13 Aug 2019 12:23:07 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM driver
Message-ID: <20190813102307.GA22623@bogon.m.sigxcpu.org>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LApPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwNDozMjowOFBNICswMzAwLCBSb2Jl
cnQgQ2hpcmFzIHdyb3RlOgo+IFRoaXMgcGF0Y2gtc2V0IGltcHJvdmVzIHRoZSB1c2Ugb2YgZUxD
RElGIGJsb2NrIG9uIGlNWCA4IFNvQ3MgKGxpa2UgOE1RLCA4TU0KPiBhbmQgOFFYUCkuIEZvbGxv
d2luZywgYXJlIHRoZSBuZXcgZmVhdHVyZXMgYWRkZWQgYW5kIGZpeGVzIGZyb20gdGhpcwo+IHBh
dGNoLXNldDoKClRoZXJlIHdhcyBzb21lIGZlZWRiYWNrIG9uIHZhcmlvdXMgcGF0Y2hlcywgZG8g
eW91IGludGVuZCB0byBwaWNrIHRoYXQKdXAgYWdhaW4/IFRoYXQgd291bGQgYmUgY29vbCBzaW5j
ZSB0aGVyZSdzIHNvbWUgb3ZlcmxhcHBpbmcgd29yayBwb3BwaW5nCnVwIGFscmVhZHkgZS5nLiBp
bgoKICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjQ1OTUvCgpz
aG93aW5nIHVwIGFuZCBpdCdzIHRoZSBiYXNlIGZvciB0aGUgdGlueQoKICAgIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjQzMDAvICAgIAoKQ2hlZXJzLAogLS0gR3Vp
ZG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
