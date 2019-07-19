Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBCC6E0DD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 08:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0A36E589;
	Fri, 19 Jul 2019 06:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F66E584;
 Fri, 19 Jul 2019 06:07:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6B0308036E;
 Fri, 19 Jul 2019 08:07:13 +0200 (CEST)
Date: Fri, 19 Jul 2019 08:07:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, openchrome-devel@lists.freedesktop.org
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers
 drmP.h and drm_os_linux.h
Message-ID: <20190719060712.GA26070@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718153737.28657-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=L0dlAvTH0gnfZNRc9H8A:9 a=CjuIK1q_8ugA:10
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDU6Mzc6MzFQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFRoaXMgaXMgc29tZSBqYW5pdG9yaWFsIHVwZGF0ZXMgdG8gdGhlIHZpYSBkcml2ZXIK
PiB0aGF0IGlzIHJlcXVpcmVkIHRvIGdldCByaWQgb2YgZGVwcmVjYXRlZCBoZWFkZXJzCj4gaW4g
dGhlIGRybSBzdWJzeXN0ZW0uCj4gCj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYXJlIHRyaXZp
YWwsIHdoZXJlCj4gdGhlIGRlcGVuZGVuY2llcyBvbiBkcm1QLmggYW5kIGRybV9vc19saW51eCBh
cmUgZHJvcHBlZC4KPiAKPiBUaGUgcmVtYWluaW5nIHRocmVlIHBhdGNoZXMgZHJvcCB1c2Ugb2Yg
RFJNX1dBSVRfT04oKS4KPiBUaGV5IGFyZSByZXBsYWNlZCBieSB3YWl0X2V2ZW50X2ludGVycnVw
dGlibGVfdGltZW91dCgpLgo+IFRoZXNlIHBhdGNoZXMgY291bGQgdXNlIGEgbW9yZSBjcml0aWNh
bCByZXZpZXcuCgpUaGUgZGlmZmVyZW5jZXMgYmV0d2VlbiBEUk1fV0FJVF9PTigpIGFuZAp3YWl0
X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgpIGFyZSBiaWdnZXIgdGhhbiBhbnRpY2lwYXRl
ZC4KClRoZSBjb252ZXJzaW9uIEkgZGlkIGZvciBkcm1fdmJsYW5rLmMgaXMgYm9ndXMgdGh1cyBJ
IGV4cGVjdAp0aGUgY29udmVyc2lvbiBkb25lIGZvciB2aWEgaXMgYWxzbyBib2d1cy4KSSB3aWxs
IHBvc3QgYSB2Mi4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
