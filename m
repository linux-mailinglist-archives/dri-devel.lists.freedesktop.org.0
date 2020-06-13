Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DD1F8386
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 15:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB396E178;
	Sat, 13 Jun 2020 13:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410C16E178
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tiv/Pyk1Sm9RxR0NgK3mjf/xUQuqNlaNa567Q0Xc2ns=; b=QyzUZhLh58kGNMazapW8ZPVXy6
 Yaj7kAarsmlBrO2zn8uXUxfzcvo9UBHEJ+kbJTecOCwElqrSuqNKUMBpA/ESYhhwya7Jig51VmHUV
 vkjnlia8DBBD3YnXEKhXy4bULgLpbw0W44epE15BKTNVLMT3EpNoXvPbxN1YUGxnLBj1QMhqDt1Tu
 tP51+7JWKSr88lRRjAAlBEjhO3ue6UzfrygWIMnWWckIcQNoKsl0GYlxn6lhK+BnVEAHYsWVdMRpT
 QUHe9Pmm5AAr3Atynhw/7uHFYoqZ4tWYzqNy6ntscenxp2eqaC9vGbIsaKcpt0PsjWIGK+egBmJps
 D6c/CDFw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52693
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jk6RQ-0004Xi-Fb; Sat, 13 Jun 2020 15:43:24 +0200
Subject: Re: [PATCH 8/8] drm/tiny/repaper: Drop edp->enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-8-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <bc85bee0-9edf-7e24-9a6f-0a9ce5153fd8@tronnes.org>
Date: Sat, 13 Jun 2020 15:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612160056.2082681-8-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTIuMDYuMjAyMCAxOC4wMCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBTYW1lIHBhdGNo
IGFzIHRoZSBtaXBpLWRiaSBvbmUsIGF0b21pYyB0cmFja3MgdGhpcyBmb3IgdXMgYWxyZWFkeSwg
d2UKPiBqdXN0IGhhdmUgdG8gY2hlY2sgdGhlIHJpZ2h0IHRoaW5nLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiAiTm9yYWxm
IFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFs
ZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
