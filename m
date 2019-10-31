Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED5EBF04
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418086F77A;
	Fri,  1 Nov 2019 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.cmpwn.com (mail.cmpwn.com [45.56.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9226F6E120;
 Thu, 31 Oct 2019 18:46:19 +0000 (UTC)
In-Reply-To: <BXXU6RTXMMH9.8688MZ3YJH7O@homura>
Date: Thu, 31 Oct 2019 14:46:17 -0400
To: "Drew DeVault" <sir@cmpwn.com>, "Daniel Vetter"
 <daniel.vetter@ffwll.ch>, "Pekka Paalanen" <ppaalanen@gmail.com>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
From: "Drew DeVault" <sir@cmpwn.com>
Message-Id: <BY3XLC2LXH2K.15NMIQNWQK9DG@homura>
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=cmpwn.com; s=cmpwn; 
 t=1572547578; bh=YZ7VcwVsCd2oV3ncPtSXsyW17YswhzTFwnQ/BxzV7pk=;
 h=In-Reply-To:Date:To:Cc:Subject:From;
 b=aJPR7ZwXiX7o8LNCx38xrb1HIuCnXDgzQlPuSbgsmfyrk8e96pGNQNk0cF558W8Dw
 uBXJwYAHwDJWFNewVtE9xf2maYjq5CJLCzJ//YiEivBL2MRe9ekldyzy4gLlQJAa2l
 0wpQTiN2TQfTsVJKYU3KwLc37XBMVneXJLbwwzOk=
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
Cc: Drew DeVault <sir@cmpwn.com>, Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IE9jdCAyNCwgMjAxOSBhdCAxMDo1MCBBTSBEcmV3IERlVmF1bHQgd3JvdGU6Cj4gU28s
IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBhY3Rpb24gaXRlbXMgYXJlIGhlcmUuIEl0IHNlZW1zIGxp
a2Ugd2UgbWlnaHQKPiBoYXZlIHVuY292ZXJlZCBhIHBvdGVudGlhbGx5IGlja3kgcmFjZSBjb25k
aXRpb24gaW4gTGludXgsIGJ1dCB0aGF0IHRoaXMKPiBwcm90b2NvbCBpcyBub3QgcmVhbGx5IGFm
ZmVjdGVkLgoKQnVtcC4gSGFwcHkgaGFsbG93ZWVuIQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
