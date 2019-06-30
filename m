Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A7F5B1B7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 22:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8AC89DFB;
	Sun, 30 Jun 2019 20:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747BA89DFB
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 20:56:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8A2E9803B3;
 Sun, 30 Jun 2019 22:56:56 +0200 (CEST)
Date: Sun, 30 Jun 2019 22:56:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] DRM: ingenic: Use devm_platform_ioremap_resource
Message-ID: <20190630205655.GB17046@ravnborg.org>
References: <20190627182114.27299-1-paul@crapouillou.net>
 <20190630081833.GC5081@ravnborg.org>
 <1561892949.1773.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561892949.1773.0@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=w0JLnzDVMa1QFTO2tlAA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCj4gPiA+IAo+ID4gPiAgLQltZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRl
diwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ID4gPiAgLQliYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKGRldiwgbWVtKTsKPiA+ID4gICsJYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShwZGV2LCAwKTsKPiA+ID4gICAJaWYgKElTX0VSUihiYXNlKSkgewo+ID4gPiAgIAkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IG1lbW9yeSByZXNvdXJjZSIpOwo+ID4gQ29uc2lkZXIg
dG8gaW5jbHVkZSB0aGUgZXJyb3IgY29kZSBpbiB0aGUgZXJyb3IgbWVzc2FnZSBoZXJlLgo+IAo+
IEkgZG9uJ3QgdGhpbmsgaXQncyBuZWVkZWQ7IGEgbm9uLXplcm8gZXJyb3IgY29kZSBpbiB0aGUg
cHJvYmUgZnVuY3Rpb24gd2lsbAo+IGhhdmUgdGhlIGRyaXZlcnMgY29yZSBhdXRvbWF0aWNhbGx5
IHByaW50IGEgbWVzc2FnZSB3aXRoIHRoZSBuYW1lIG9mIHRoZQo+IGZhaWxpbmcgZHJpdmVyIGFu
ZCB0aGUgcmV0dXJuIGNvZGUuCgpZb3UgYXJlIHJpZ2h0LCBJIGNvbnRpbnVlIHRvIGZvcmdldCB0
aGlzLgpTbyB0aGUgYWJvdmUgaXMgZmluZS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
