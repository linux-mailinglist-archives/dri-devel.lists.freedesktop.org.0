Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8513F184A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE7F6E23F;
	Wed,  6 Nov 2019 14:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E196E23F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:18:04 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51605
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iSM8I-0001A6-Hv; Wed, 06 Nov 2019 15:18:02 +0100
Subject: Re: [PATCH v2 1/2] drm/todo: Convert drivers to generic fbdev
 emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch
References: <20191106124727.11641-1-tzimmermann@suse.de>
 <20191106124727.11641-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <10517661-93dd-aa31-a02d-46a6c3bc6b73@tronnes.org>
Date: Wed, 6 Nov 2019 15:18:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106124727.11641-2-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4oAfRBUYr2//JO5DIMUdR/eCqwfD0kiBW8PMZa1ruJc=; b=arVM2lZR48maLU4P2FcEmXgkzV
 hGsc6l08Btb19oqpwci6cdCnZuXQgQAvm1G2i2nK0RXAL7scbYZI+zrG2Zxpf5bVjMdvtyQOwKOI0
 Ki+X8UF1s1WJwMV64d4lYYohNnHZjU2SrXH79O68MbbqjkAho4lraHWcfw0jNDWY6Vyw2fDLAw8nK
 Rdan38q6z9qDeIsKQ5xsb1AcnUKEyR6jU9HgJH8/DDmHpiFcBQ7OMh5oX8knkdk/bV53MJae99Osn
 HDde7Pd7ZnFN9U2J1csHc/FEh68PliYRLioSrUfsM31WHuKZ0zPL2qFhD7J5e9mUIGIVMIWwyJ/Ex
 QD5u/QWw==;
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDYuMTEuMjAxOSAxMy40Nywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhpcyBy
ZXBsYWNlcyB0aGUgb3JpZ2luYWwgVE9ETyBpdGVtIGZvciBkcm1fZmJfaGVscGVyX2ZiZGV2X3Nl
dHVwKCkKPiBhbmQgX3RlYXJkb3duKCksIHdoaWNoIGFyZSBkZXByZWNhdGVkLgo+IAo+IHYyOgo+
IAkqIHJlbW92ZSBkcml2ZXItc3BlY2lmaWMgY29tbWVudHMKPiAJKiBsaXN0IHNvbWUgYmFzaWMg
cmVxdWlyZW1lbnRzCj4gCSoga2VlcCBhIFRPRE8gaXRlbSBvbiBkcm1fZmJfaGVscGVyX2luaXQo
KQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMu
b3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
