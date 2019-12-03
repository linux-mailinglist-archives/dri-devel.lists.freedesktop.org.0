Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538D1101F2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CA76E0CE;
	Tue,  3 Dec 2019 16:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1603 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 16:17:42 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29226E0CE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:17:42 +0000 (UTC)
Received: from [2600:1700:4830:165f::fb2] (port=38088)
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1icAS0-0005u7-Px; Tue, 03 Dec 2019 10:50:56 -0500
Subject: Re: [PATCH] drm/tilcdc: Switch to using GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
References: <20191203130916.155779-1-linus.walleij@linaro.org>
From: David Lechner <david@lechnology.com>
Message-ID: <06a3071b-7a2d-d5f6-1b17-e66a1c03fb0d@lechnology.com>
Date: Tue, 3 Dec 2019 09:50:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203130916.155779-1-linus.walleij@linaro.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4ubicwl4xi4YAB8T5V3DHddTb4XYl0UzCbYytMk0o8=; b=X0wdBF1ejD/ar1wSbog59xa8Qy
 lk/jijFI8dtisoC3rdjRWGcGPx75cm/NuLPqNGZ4f2ixoU8R/d2W5X5OoCN11JaVWe6ls7aB2ZaMx
 O+6vr0VmZWKg89Ayc1U833YpwpwhcQ+jXJU2EDGjA1rBW1xHzBxN+dB094O2an2jqbC2or6FBlsr3
 O2gJnoB7wXRqIzNt5Ht72GasPEa2n2eOl4sJCDc0exDi555lN77z7QDKur/A7p/5UblDw3sAdl8UN
 Eb1tsEWGQCimu10X3dhhRLDP23K7uHcc/NXprS5H3do91GWaDaER3+2lAxLU+iCX6SmTj1HmYopES
 m6PFTpxg==;
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMy8xOSA3OjA5IEFNLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IFRoZSBUSSBMQ0RDIHBp
Y2tzIGEgR1BJTyBsaW5lIGZyb20gdGhlIGRldmljZSB0cmVlIHRvIHVzZQo+IGZvciBEUE1TIHBv
d2VyIG9uL29mZi4gV2UgY2FuIHN3aXRjaCB0aGlzIHRvIHVzZSBhIEdQSU8KPiBkZXNjcmlwdG9y
IHByZXR0eSBlYXNpbHkuIE1ha2Ugc3VyZSB0byByZXF1ZXN0IHRoZSBHUElPCj4gImFzIGlzIiBz
byB0aGF0IHRoZSBEUE1TIHN0YXRlIHRoYXQgd2Ugc3RhcnQgKGJvb3QpIGluIGlzCj4gcHJlc2Vy
dmVkLgo+IAo+IENjOiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgo+IENjOiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBs
ZWNobm9sb2d5LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRGF2aWQgTGVjaG5lciA8ZGF2aWRA
bGVjaG5vbG9neS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
