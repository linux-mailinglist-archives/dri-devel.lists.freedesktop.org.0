Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4F470D7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 17:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891AB882A9;
	Sat, 15 Jun 2019 15:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDEF892BB
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 15:30:32 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54304
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hcAdS-00055W-Fp; Sat, 15 Jun 2019 17:30:30 +0200
Subject: Re: [PATCH v4 09/12] drm/atomic: Add a function to reset connector TV
 properties
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <da8097de4e52e677933707eddcf202ba89790876.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <bd088fee-ecca-fc7d-8f8a-766ac3e3ea7c@tronnes.org>
Date: Sat, 15 Jun 2019 17:30:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <da8097de4e52e677933707eddcf202ba89790876.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=3mO79wbTLM7Uk7ncpNncVYBV43dXaPlnMxaji8/9EsM=; 
 b=uun+0SHUmxVAzH5km2fpUoNYKDClZ7cOLvNRRhaSPZC8SBCBUSwJwSqfRB92fKihrK0V5jY6zy6k3v04Wgbm5UXkspUiUZ8jWbCznN5E2lv6LjuvQ7ZjlLqpYtXgMdsmoU5WEi/pip6NusoMgev29OiAuM+WeDKriY767jI8hSrmsQoWka3XMJVkAufgfkIQ7LoJL+1Gg264KmBAiSPZk3RSMvvYookH9icl+5KHaKrnssY+DEIIIEwUz6DioZkgX3JmsgKSS46/7mVs2Aer0jqMOFvpp7RoXrvvcV/xMChY1b54sO6FhYB+chHo+F7wZ8iE9ndguO7kb1INpDqDaQ==;
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDYuMjAxOSAxNC4xMywgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBEdXJpbmcgdGhl
IGNvbm5lY3RvciByZXNldCwgaWYgdGhhdCBjb25uZWN0b3IgaGFzIGEgVFYgcHJvcGVydHksIGl0
IG5lZWRzCj4gdG8gYmUgcmVzZXQgdG8gdGhlIHZhbHVlIHByb3ZpZGVkIG9uIHRoZSBjb21tYW5k
IGxpbmUuCj4gCj4gUHJvdmlkZSBhIGhlbHBlciB0byBkbyB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCgpUaGlz
IHBhdGNoIHVzZXMgZHJtX2NtZGxpbmVfbW9kZS0+dHZfbWFyZ2lucyBiZWZvcmUgaXQgaXMgYWRk
ZWQsIHNvIGl0Cm5lZWRzIHRvIGJlIG1vdmVkIGFmdGVyIHRoZSBwYXRjaCB0aGF0IGFkZHMgaXQu
CgpXaXRoIHRoYXQgZml4ZWQ6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZA
dHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
