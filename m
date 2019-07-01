Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F65B50D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 08:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD32B89F45;
	Mon,  1 Jul 2019 06:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711189F45
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 06:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4AFBD30842B5;
 Mon,  1 Jul 2019 06:32:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD14718773;
 Mon,  1 Jul 2019 06:32:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6E1117446; Mon,  1 Jul 2019 08:32:32 +0200 (CEST)
Date: Mon, 1 Jul 2019 08:32:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Set GEM object functions for PRIME
Message-ID: <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628122659.31887-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 06:32:35 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, zourongrong@gmail.com,
 airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDI6MjY6NTZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gUFJJTUUgZnVuY3Rpb25hbGl0eSBpcyBub3cgcHJvdmlkZWQgdmlhIHRoZSBj
YWxsYmFjayBmdW5jdGlvbnMgaW4KPiBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MuIFRoZSBk
cml2ZXItc3RydWN0dXJlIGZ1bmN0aW9ucyBhcmUgb2Jzb2xldGUuCj4gQXMgYSBzaWRlIGVmZmVj
dCBvZiB0aGlzIHBhdGNoLCBWUkFNLWJhc2VkIGRyaXZlcnMgZ2V0IGJhc2ljIFBSSU1FCj4gc3Vw
cG9ydCBhdXRvbWF0aWNhbGx5IHdpdGhvdXQgaGF2aW5nIHRvIHNldCBhbnkgZmxhZ3Mgb3IgYWRk
aXRpb25hbAo+IGZpZWxkcy4KCj4gK3N0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9vYmplY3RfZnJl
ZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiArc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0X2Z1bmNzX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiArc3RhdGljIHZv
aWQgZHJtX2dlbV92cmFtX29iamVjdF9mdW5jc191bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
KmdlbSkKPiArc3RhdGljIHZvaWQgKmRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3Nfdm1hcChzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiArc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX29iamVj
dF9mdW5jc192dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCj4gKwkJCQkJICAgICB2
b2lkICp2YWRkcikKCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3Mg
ZHJtX2dlbV92cmFtX29iamVjdF9mdW5jcyA9IHsKPiArCS5mcmVlCT0gZHJtX2dlbV92cmFtX29i
amVjdF9mcmVlLAo+ICsJLnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3NfcGluLAo+ICsJ
LnVucGluCT0gZHJtX2dlbV92cmFtX29iamVjdF9mdW5jc191bnBpbiwKPiArCS52bWFwCT0gZHJt
X2dlbV92cmFtX29iamVjdF9mdW5jc192bWFwLAo+ICsJLnZ1bm1hcAk9IGRybV9nZW1fdnJhbV9v
YmplY3RfZnVuY3NfdnVubWFwCj4gK307CgpXaHkgbmV3IGZ1bmN0aW9ucz8gIENhbid0IHlvdSBq
dXN0IGhvb2sgdXAgdGhlIGV4aXN0aW5nIHByaW1lIGZ1bmN0aW9ucz8KCmNoZWVycywKICBHZXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
