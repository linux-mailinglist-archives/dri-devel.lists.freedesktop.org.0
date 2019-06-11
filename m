Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2F3D206
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED5B88FCF;
	Tue, 11 Jun 2019 16:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D907E88FCF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:17:42 +0000 (UTC)
Received: from localhost (unknown [216.243.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D82321721;
 Tue, 11 Jun 2019 16:17:42 +0000 (UTC)
Date: Tue, 11 Jun 2019 12:17:42 -0400
From: Sasha Levin <sashal@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: 5.1 backport request
Message-ID: <20190611161742.GA1513@sasha-vm>
References: <CAKMK7uHXF-ZyVjz1UTOZvSn_TxXMFwjiDz8cYGmwzzpWHNcTyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHXF-ZyVjz1UTOZvSn_TxXMFwjiDz8cYGmwzzpWHNcTyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560269862;
 bh=SWVECJtPFEvqQO8yMuYNIoOw/mE4FzHyMzRH3Ntn/ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LqeMCTAtnX2fcO8tlSSDzvk3Q9Sctw9zZiq+k0n2Wg6dC03xvhxbWuulQ+3gCQwYS
 4qAVdxLAshS7kVPc1MrQPDdkJDJ5einybJhwwYxDGiRY4ooWJXHeu4xX8GrnvxbBl/
 PnyYVM6O4NnlioiIqF9qIVcfoj1GDzGB2k/RS5Go=
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
Cc: Dave Airlie <airlied@linux.ie>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTE6MDU6NTJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPkhpIHN0YWJsZSB0ZWFtLAo+Cj5QbGVhc2UgYmFja3BvcnQgZGJiOTI0NzE2NzRhICgi
UmV2ZXJ0ICJkcm06IGFsbG93IHJlbmRlciBjYXBhYmxlCj5tYXN0ZXIgd2l0aCBEUk1fQVVUSCBp
b2N0bHMiIikgdG8gNS4xLCB3ZSBhY2NpZGVudGFsbHkgZm9yZ290IHRoZSBDYzoKPnN0YWJsZSBh
bmQgRml4ZXM6IGxpbmUgZm9yIHRoYXQgcmV2ZXJ0LiBUaGFua3MgdG8gTWljaGVsIGZvciBzcG90
dGluZwo+dGhpcy4KPgo+RGF2ZSwgZm9yIG5leHQgdGltZSBhcm91bmQgdGhlcmUncyAkIGRpbSBm
aXhlcyAkYnJva2VuX3NoYTEKPgo+VGhhbmtzLCBEYW5pZWwKClF1ZXVlZCB1cCBmb3IgNS4xLCB0
aGFuayB5b3UhCgotLQpUaGFua3MsClNhc2hhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
