Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57886ACF99
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 18:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684B789613;
	Sun,  8 Sep 2019 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D247D89613
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 16:04:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9642D80549;
 Sun,  8 Sep 2019 18:04:29 +0200 (CEST)
Date: Sun, 8 Sep 2019 18:04:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190908160428.GA20115@ravnborg.org>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904185507.GA3634@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8
 a=bOQf2eCPNiB_VLlhhUQA:9 a=CjuIK1q_8ugA:10
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuLgoKT24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDk6NTU6MDdQTSArMDMwMCwgRGFuIENh
cnBlbnRlciB3cm90ZToKPiBUaGUgImx2ZHMtPmJhY2tsaWdodCIgcG9pbnRlciBjb3VsZCBiZSBO
VUxMIGluIHNpdHVhdGlvbnMgd2VyZQo+IG9mX3BhcnNlX3BoYW5kbGUoKSByZXR1cm5zIE5VTEwu
ICBBbHNvIGl0J3Mgc2xpZ2h0bHkgY2xlYW5lciB0byB1c2UKPiBiYWNrbGlnaHRfcHV0KCkgd2hp
Y2ggYWxyZWFkeSBoYXMgYSBjaGVjayBmb3IgTlVMTCBidWlsdCBpbi4KPiAKPiBGaXhlczogN2M5
ZGZmNWJkNjQzICgiZHJtOiBwYW5lbHM6IEFkZCBMVkRTIHBhbmVsIGRyaXZlciIpCj4gU2lnbmVk
LW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKQSBtdWNo
IGJldHRlciBmaXggd291bGQgYmUgdG8gaW50cm9kdWNlIHVzZSBvZiBkZXZtX29mX2ZpbmRfYmFj
a2xpZ2h0KCkuClRoZW4geW91IGRvIG5vdCBoYXZlIHRvIHdvcnJ5IGFib3V0IHB1dCgpLgoKQ2Fy
ZSB0byByZXNwaW4gYSB2MyB0aGF0IGRvZXMgdGhpcz8KCglTYW0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
