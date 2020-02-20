Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3216624D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B126EDDB;
	Thu, 20 Feb 2020 16:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEC86EDDA;
 Thu, 20 Feb 2020 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GOPmvuckOnVbES/G9qOKANm26ZaDTrMZ6UpkJ5dN+K8=; b=Xr2c1iJMZKymf6mWo3eL6dY2s4
 24HqQxMOe6feHZAlYQRWrSx/rPjmUR3LkygBvEAOAlcGgVoIwYgrOgyJuyRJZQ0Bf694oXTOeYSzm
 8KH3CpeaLUudSXrUhryHiBJwCztQ4pvgnO+Uja1GgHPZleNZTXHbi1CH+ooiPr9oBYniwezDcr05N
 guFHWwpYZmg1JGTyELoNMtqZEdMzE1EQABQFfUkNOm35FfCg3Q2uhFyFyfPro+kBL+8jAPmcNdi7f
 F+cLWG2qxRiNxcGt3t5uQ45Kb1sOg/xXIKC0ZMCM2PBpX6eFY9R6N1TpR4znC88HmiHGqcbDBHQdH
 B76CafTg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50613
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j4ob4-0002Ev-Bi; Thu, 20 Feb 2020 17:22:42 +0100
Subject: Re: [PATCH 49/52] drm/mipi-dbi: Drop explicit drm_mode_config_cleanup
 call
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-50-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <19431f69-460d-ba59-edb0-736bbec7803d@tronnes.org>
Date: Thu, 20 Feb 2020 17:22:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219102122.1607365-50-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkRlbiAxOS4wMi4yMDIwIDExLjIxLCBza3JldiBEYW5pZWwgVmV0dGVyOgo+IEFsbG93cyB1cyB0
byBkcm9wIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgY2FsbGJhY2sgZnJvbSBhbGwKPiBkcml2ZXJz
LCBhbmQgcmVtb3ZlIHRoZSBtaXBpX2RiaV9yZWxlYXNlKCkgZnVuY3Rpb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBFcmljIEFu
aG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9s
b2d5LmNvbT4KPiBDYzogS2FtbGVzaCBHdXJ1ZGFzYW5pIDxrYW1sZXNoLmd1cnVkYXNhbmlAZ21h
aWwuY29tPgo+IENjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+IENj
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTm9y
YWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
