Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C991574803
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B76E635;
	Thu, 25 Jul 2019 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06076E635
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 07:21:35 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4ACDE21734;
 Thu, 25 Jul 2019 07:21:35 +0000 (UTC)
Date: Thu, 25 Jul 2019 09:21:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Subject: Re: [PATCH v2] Staging: fbtft: Fix GPIO handling
Message-ID: <20190725072132.GA18714@kroah.com>
References: <20190715143003.12819-1-nsaenzjulienne@suse.de>
 <7b8242ab-cc0c-d90b-60af-ff1c53789e44@opensynergy.com>
 <5a77c18f-7338-888f-2379-12171b6a545e@jaseg.net>
 <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75ada52f-afa1-08bc-d0ce-966fc1110e70@jaseg.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564039295;
 bh=koldjvoUr4frV/SN/rliziUGZJdzC8i5yEDGFavMyKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3GkVwGN7MzdTpN8WKWen3Ox7EBsfjyv6qPIoakxutGNF5HC07TNvxy2MoYsob5ld
 ehtMtSldlH1PZH2HQ79/NiPEPGiWZY3tMwP+3dPlfk7wD384Oty5tD60P0XCzwqKFV
 w0ySB482LvT5v28iOs8Sg/57nVsCac+eoYAO3W1g=
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
Cc: devel@driverdev.osuosl.org, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, nishadkamdar@gmail.com,
 dri-devel@lists.freedesktop.org, bhanusreemahesh@gmail.com,
 Phil Reid <preid@electromag.com.au>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTE6NDE6MzdQTSArMDkwMCwgSmFuIFNlYmFzdGlhbiBH
w7Z0dGUgd3JvdGU6Cj4gQ29tbWl0IGM0NDBlZWUxYTdhMSAoIlN0YWdpbmc6IGZidGZ0OiBTd2l0
Y2ggdG8gdGhlIGdwaW8gZGVzY3JpcHRvcgo+IGludGVyZmFjZSIpIGJyZWFrcyBHUElPIGhhbmRs
aW5nLiBJbiBzZXZlcmFsIHBsYWNlcywgY2hlY2tzIHRvIG9ubHkgc2V0Cj4gYSBHUElPIGlmIGl0
IHdhcyBjb25maWd1cmVkIGVuZGVkIHVwIGJhY2t3YXJkcy4KPiBJIGhhdmUgdGVzdGVkIHRoaXMg
Zml4LiBUaGUgZml4ZWQgZHJpdmVyIHdvcmtzIHdpdGggYSBpbGk5NDg2Cj4gZGlzcGxheSBjb25u
ZWN0ZWQgdG8gYSByYXNwYmVycnkgcGkgdmlhIFNQSS4KPiAKPiBGaXhlczogY29tbWl0IGM0NDBl
ZWUxYTdhMWQgKCJTdGFnaW5nOiBmYnRmdDogU3dpdGNoIHRvIHRoZSBncGlvIGRlc2NyaXB0b3Ig
aW50ZXJmYWNlIikKPiBUZXN0ZWQtYnk6IEphbiBTZWJhc3RpYW4gR8O2dHRlIDxsaW51eEBqYXNl
Zy5uZXQ+Cj4gUmV2aWV3ZWQtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGll
bm5lQHN1c2UuZGU+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIFNlYmFzdGlhbiBHw7Z0dGUgPGxpbnV4
QGphc2VnLm5ldD4KPiAtLS0KCkNhbiB0aGlzIGdvIG9uIHRvcCBvZiBQaGlsJ3MgcGF0Y2hlcz8g
IE9yIGRvZXMgaXQgcmVwbGFjZSBpdD8KCkkgY2FuJ3QgZmlndXJlIG91dCB3aGF0IHRvIGRvIGhl
cmUsIHNvcnJ5LgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
