Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39CE4552
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFE6E8EC;
	Fri, 25 Oct 2019 08:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.cmpwn.com (mail.cmpwn.com [45.56.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B97D6E430;
 Thu, 24 Oct 2019 14:50:15 +0000 (UTC)
In-Reply-To: <CAKMK7uFx_QoSf6-VJCEdfSJutogd7MU7KRHfVrP0HoVfS4mkfA@mail.gmail.com>
Date: Thu, 24 Oct 2019 10:50:13 -0400
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
From: "Drew DeVault" <sir@cmpwn.com>
To: "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Pekka Paalanen"
 <ppaalanen@gmail.com>
Message-Id: <BXXU6RTXMMH9.8688MZ3YJH7O@homura>
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=cmpwn.com; s=cmpwn; 
 t=1571928614; bh=tykSBX+EMPQHrglljA5QnonoPFiVUWyZbf/oyES2pQs=;
 h=In-Reply-To:Date:Cc:Subject:From:To;
 b=Cwcg/l92Wauw0dfzA1zwkAvZYBWxXMtWLXIzCu/KS4jd7EMY/FeWQpBJfcA7KDQz6
 SGhTb0GBrgTgrYu3N8pmKXqL2WTsBALD7bXS2nip07pDbmjeaZukFh+kmK8OHfjtsc
 sG8laDRDA1OGBXwqvh9b65R2Qhp5FRV3iPchcELc=
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
Cc: wayland <wayland-devel@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Drew DeVault <sir@cmpwn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28sIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBhY3Rpb24gaXRlbXMgYXJlIGhlcmUuIEl0IHNlZW1z
IGxpa2Ugd2UgbWlnaHQKaGF2ZSB1bmNvdmVyZWQgYSBwb3RlbnRpYWxseSBpY2t5IHJhY2UgY29u
ZGl0aW9uIGluIExpbnV4LCBidXQgdGhhdCB0aGlzCnByb3RvY29sIGlzIG5vdCByZWFsbHkgYWZm
ZWN0ZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
