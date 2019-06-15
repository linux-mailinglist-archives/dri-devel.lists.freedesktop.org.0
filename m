Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910446F24
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 11:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F194489256;
	Sat, 15 Jun 2019 09:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D4889256
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 09:01:25 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52492
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hc4Yt-0003sY-AH; Sat, 15 Jun 2019 11:01:23 +0200
Subject: Re: [PATCH v4 04/12] drm/client: Change drm_client_panel_rotation name
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <9a75b69460e0b365499562492d012824b4d341f2.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5988eed4-6490-39a1-75f2-2b9366d27d60@tronnes.org>
Date: Sat, 15 Jun 2019 11:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9a75b69460e0b365499562492d012824b4d341f2.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=QOdSVFJZzki1SiePQMOfV+xigT7y6gnQGS4ypEUEtWw=; 
 b=SFlQ8iYV5Rf6XrKHZzT4NB4SyfNEyvN0+tQF3weAtZrE1KiF6V5AzA67rdILUa7B1ktFiaWrb8tPezlLV5qmDzsYj5tkU311CTqt4yVPX/O458LmkLZv+sgmLGb2JpqCGBRH7b0fwysiyFtGJczwUMEFWgrIXYLRTjH1++sd/6uRiKp3eIT9EG5fq6piEpXWUjF4i3T33PYqXFw55WbDpFtRJCHXAvjj7NKdcl6kMG/v7QPS8P3/GUr/n3vB6J37a1Bpjek9a6Lg/g8B+gPAleruDd50WLk95lmK3MSy7x/bcLlLaVTFfdj3q7Ky47EkzsSJ5BmuxhVQWp0aIhL5fA==;
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

CgpEZW4gMTQuMDYuMjAxOSAxNC4xMywgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBUaGUgZHJtX2Ns
aWVudF9wYW5lbF9yb3RhdGlvbiBmdW5jdGlvbiBoYXMgYmVlbiB1c2VkIHNvIGZhciB0byBzZXQg
dGhlCj4gZGVmYXVsdCByb3RhdGlvbiBiYXNlZCBvbiB0aGUgcGFuZWwgb3JpZW50YXRpb24uCj4g
Cj4gSG93ZXZlciwgd2UgY2FuIGhhdmUgbW9yZSBzb3VyY2VzIG9mIGluZm9ybWF0aW9uIHRvIG1h
a2UgdGhhdCBkZWNpc2lvbiwKPiBzdGFydGluZyB3aXRoIHRoZSBjb21tYW5kIGxpbmUgdGhhdCB3
ZSB3aWxsIGludHJvZHVjZSBsYXRlciBpbiB0aGlzIHNlcmllcy4KPiAKPiBDaGFuZ2UgdGhlIG5h
bWUgdG8gcmVtb3ZlIHRoZSBwYW5lbCBtZW50aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
