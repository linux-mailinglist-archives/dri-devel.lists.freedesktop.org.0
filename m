Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560019EA59
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 12:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDC26E1D3;
	Sun,  5 Apr 2020 10:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37746E1BA;
 Sun,  5 Apr 2020 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NlF5xnmtZ5nEuCpKZeMjXjzmWZbNe9ij1ocxn3MlkA4=; b=MJPNytkJ5itRWcwOSng38EcZYD
 bSrhyc7VpHTWpmgvc29d0YdjPU5icf3ZItBtdSEdKKgna2PCp81EmmKOCJZ6TdKdOzgJeyFJCGQq9
 lWNONOGuIgfLqburxmhwf6RPslCccz8TEPXOTkPZBvISnFxsW2SYxUqB3mXJ8A3b6HCYd56G9iQpV
 FZn6QmyYMiHvfHV3+os028IAfyoPZoV8wo6Au6DVrKAHypV+tFtarFJPnIZVLB8QVnFFAI5yi/cCK
 WbZ6z3Y9bEyaiY0KznCbqUvQEe4pN76DjHQjkYkfJ9XH5jdHpbuas40gOgSApVk2PPGek2I8Er+QM
 wvbbVO8A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51704
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jL2OM-00075y-Ss; Sun, 05 Apr 2020 12:20:38 +0200
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f6d86677-6dc7-23bf-fed6-ec2d94f7ea62@tronnes.org>
Date: Sun, 5 Apr 2020 12:20:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDMuMDQuMjAyMCAxNS41Nywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBUaGUga2VybmVs
ZG9jIGlzIG9ubHkgYWRkZWQgZm9yIHRoaXMgbmV3IGZ1bmN0aW9uLiBFeGlzdGluZyBrZXJuZWxk
b2MKPiBhbmQgZXhhbXBsZXMgd2lsbCBiZSB1ZGF0ZWQgYXQgdGhlIHZlcnkgZW5kLCBzaW5jZSBv
bmNlIGFsbCBkcml2ZXJzCj4gYXJlIGNvbnZlcnRlZCBvdmVyIHRvIGRldm1fZHJtX2Rldl9hbGxv
YyB3ZSBjYW4gdW5leHBvcnQgYSBsb3Qgb2YKPiBpbnRlcmltIGZ1bmN0aW9ucyBhbmQgbWFrZSB0
aGUgZG9jdW1lbnRhdGlvbiBmb3IgZHJpdmVyIGF1dGhvcnMgYSBsb3QKPiBjbGVhbmVyIGFuZCBs
ZXNzIGNvbmZ1c2luZy4gVGhlcmUgd2lsbCBiZSBvbmx5IG9uZSB0cnVlIHdheSB0bwo+IGluaXRp
YWxpemUgYSBkcm1fZGV2aWNlIGF0IHRoZSBlbmQgb2YgdGhpcywgd2hpY2ggaXMgZ29pbmcgdG8g
YmUKPiBkZXZtX2RybV9kZXZfYWxsb2MuCj4gCj4gQ2M6IFBhdWwgS29jaWFsa293c2tpIDxwYXVs
LmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQoKQWNrZWQtYnk6IE5vcmFsZiBUcsO4
bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
