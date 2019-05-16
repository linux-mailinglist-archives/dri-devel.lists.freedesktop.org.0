Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23220335
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53CB89298;
	Thu, 16 May 2019 10:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD5289298
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:09:12 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56206
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hRDK2-0008Ux-MT; Thu, 16 May 2019 12:09:10 +0200
Subject: Re: [PATCH] drm/fb-helper: Fix drm_fb_helper_hotplug_event() NULL ptr
 argument
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190515132925.48867-1-noralf@tronnes.org>
 <20190515134014.GJ17751@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <73d3a3d8-517c-f7e1-b59c-09e6b0df7468@tronnes.org>
Date: Thu, 16 May 2019 12:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515134014.GJ17751@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=BasH/51FzLQeR/ScxPxHqEuhwLJCj0QZ3pUgTv32fIg=; 
 b=jfa1r6+ymDqYlhtPH01mGN1fhg0kQiDqpzRLYrxPboGnDRqJxbfas27+EKVJkMIIiP/opg3nNolezPWVCQ46yXCs5hY272225+xp3qI8N5Eu6lXwEgwWjtSATWY2DnHpGCds+mbUnlCP8rdiRopKRYqRcqp4a8/80zUr5KIH2z8CKmlxKupWeH5it7ya0Pqau+fVaJyk4WxIzCEpBD/WBV7AlNfUoYh3NATyZFWktXJrnfJWcmjOsh1M31YN849ZfWirkwtbYVzEzNODW4YBH/fJTBFkMfsRxf9BIwhyGby2/kEjyCMgPKKSNNxdixJaI0ZQ94o4yCnow+UWlzgGkQ==;
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMDUuMjAxOSAxNS40MCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBXZWQsIE1h
eSAxNSwgMjAxOSBhdCAwMzoyOToyNVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVudCgpIHNob3VsZCB0b2xlcmF0ZSB0aGUgZmJfaGVs
cGVyIGFyZ3VtZW50IGJlaW5nCj4+IE5VTEwuIENvbW1pdCAwM2E5NjA2ZTdmZWUgKCJkcm0vZmIt
aGVscGVyOiBBdm9pZCByYWNlIHdpdGggRFJNIHVzZXJzcGFjZSIpCj4+IGludHJvZHVjZWQgYSBm
Yl9oZWxwZXIgZGVyZWZlcmVuY2UgYmVmb3JlIHRoZSBOVUxMIGNoZWNrLgo+PiBGaXh1cCBieSBt
b3ZpbmcgdGhlIGRlcmVmZXJlbmNlIGFmdGVyIHRoZSBOVUxMIGNoZWNrLgo+Pgo+PiBGaXhlczog
MDNhOTYwNmU3ZmVlICgiZHJtL2ZiLWhlbHBlcjogQXZvaWQgcmFjZSB3aXRoIERSTSB1c2Vyc3Bh
Y2UiKQo+PiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+
IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKPiBS
ZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKClRo
YW5rcyBEYW4gYW5kIERhbmllbCwgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKTm9yYWxmLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
