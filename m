Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9F322AB1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 13:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CF36E3F2;
	Tue, 23 Feb 2021 12:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC9A6E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=K9e9n1lS41ak4SdH8vLAL7tweNRTWdRcwlNxrAgtPAY=; 
 b=Dk3VBtAz65FOJ3tgKq7b8z2tv8NJqQnwu7z0OgDGalHdoFmHnikYTtYSnnA/Vk920/72wuDwP+b9c/i1EdLHsrEiQ8OEgvtByKc7I5IFJRCoUNxPHr6Duo5ECDMWauih+Q5tNnZ8ydG9jNfMOotwtIX3k7ArK9vXPDd4+Jrwg5TTmiOrNxFBCQaQIGB5nFEkBWc2VjflWnoLoBWhHXwDMroeSkGG39whlixFJN7fHXoX0GBq9Spiu91qAzlpIciytKNAqWgnCvoTaK6k0asVMM1AX61++ofkPNCzUO46u8d2ShaYnzX1GBktwKyoVdpUWg0yqux/R0WbwpFO46b+xQ==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=localhost) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lEX1L-0008Pg-9f; Tue, 23 Feb 2021 13:42:31 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
In-Reply-To: <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
Date: Tue, 23 Feb 2021 13:42:21 +0100
Message-ID: <87lfbfc5w2.fsf@yahoo.co.uk>
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cml0ZXM6Cgo+IFllYWggcGx1cyBDYzog
c3RhYmxlIGZvciBiYWNrcG9ydGluZyBhbmQgSSB0aGluayBhbiBpZ3Qgb3Igc2ltaWxhciBmb3IK
PiBwYW5mcm9zdCB0byBjaGVjayB0aGlzIHdvcmtzIGNvcnJlY3RseSB3b3VsZCBiZSBwcmV0dHkg
Z29vZCB0b28uIFNpbmNlCj4gaWYgaXQgdG9vayB1cyBvdmVyIDEgeWVhciB0byBub3RpY2UgdGhp
cyBidWcgaXQncyBwcmV0dHkgY2xlYXIgdGhhdAo+IG5vcm1hbCB0ZXN0aW5nIGRvZXNuJ3QgY2F0
Y2ggdGhpcy4gU28gdmVyeSBsaWtlbHkgd2UnbGwgYnJlYWsgdGhpcwo+IGFnYWluLgoKSSBtYWRl
IHRoZSBJR1QgdGVzdCBiZWxvdyB3aGljaCBzZWVtcyB0byByZXByb2R1Y2UgdGhlIGJ1Zy4gSG93
ZXZlciwgdGhlCmtlcm5lbCBwYXRjaCBkb2VzbuKAmXQgZml4IGl0LCBzbyBtYXliZSB0aGVyZSBp
cyBzb21ldGhpbmcgbW9yZSBzdWJ0bGUKZ29pbmcgb24uCgpodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvbnJvYmVydHMvaWd0LWdwdS10b29scy8tL2NvbW1pdHMvcGFuZnJvc3QtcHVyZ2Vt
YXAvCgpSZWdhcmRzLAotIE5laWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
