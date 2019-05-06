Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C105B1494F
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB56E898BF;
	Mon,  6 May 2019 12:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA34898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:06:33 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59640
 helo=[192.168.10.178])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hNcO7-0003IR-Tj; Mon, 06 May 2019 14:06:31 +0200
Subject: Re: [PATCH 2/2] drm/edid: drmP.h include removal
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20190506095248.20874-1-jani.nikula@intel.com>
 <20190506095248.20874-2-jani.nikula@intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1d3e5936-4a09-4b4e-4c79-928052b511fa@tronnes.org>
Date: Mon, 6 May 2019 14:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506095248.20874-2-jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=BW6IrdvkWI2L7/MG0U4dcngZ3mKgndLbu3t8qOQZ4jc=; 
 b=loq9hm5NhGDfyl81Noc4thW9f8ER74nc2icD6is4l7k0rdRXiHhtMNYRQOlruX9HIk4KPqt1HAabTNyYA+e9xq4W8Z9rSVxo7zMEZML/oFBngRmIHP//xjv6cgWvDh9dnIRTnOnnF+3H/EWTYZ0yDO9xMQZssGuvNDTEUk6QUnSW9AvtZsTJZZO9LGIc1xM6u33IKsvKpggSsgXwRLQzDV874aZSafEP04Zi7FOwEIKQCm81PEGMVRaU9cpFyF20HJgMTsn12RBjHdu9EX065W1Ixk27KP/LyDBUNAOB97Zr0V8ylQzrUmHaae6pTkFy9OBk51eApfv6VSojt57AMg==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDYuMDUuMjAxOSAxMS41Miwgc2tyZXYgSmFuaSBOaWt1bGE6Cj4gQ29udGludWUgdG8g
Z2V0IHJpZCBvZiBkcm1QLmguIEFkZCBtaW5pbWFsIGluY2x1ZGVzIHRvIGJ1aWxkLiBTb3J0Cj4g
aW5jbHVkZXMgd2hpbGUgYXQgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
