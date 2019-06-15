Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A0470FF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 17:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7841D89292;
	Sat, 15 Jun 2019 15:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A3589292
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 15:43:08 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54329
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hcApe-0007lG-Kc; Sat, 15 Jun 2019 17:43:06 +0200
Subject: Re: [PATCH v4 12/12] drm/vc4: hdmi: Set default state margin at reset
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <a8f01d3653f3ed4166a4d88dcc5d6e905fa2e602.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d1436630-928c-aca0-a874-50cb500b2220@tronnes.org>
Date: Sat, 15 Jun 2019 17:43:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a8f01d3653f3ed4166a4d88dcc5d6e905fa2e602.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=vmQiT47B7iuP+pBGI4QPqK4T6SL+9D+i09dO0tJaMPw=; 
 b=StIRNfqA3b0HwhkyL03TQS1Szupe8RMVlatYuRK24jqfPBymODFtmz9bC1Q2JNxKfBx8EgfbVjiFi3ZGNnCbA+BGdnXu1XFMHMjGxKyx4hqQsbm9nf8SzRFlyYoW9pyuFDzhxr7P/xY3owl6XzWvqHxqhjxmvmEIZxeikAzD1wfkUj9dcJv2pKwwT5T36v03/QdhKjoaynM+iItnLdcvvnPbmB0EAoL9QSHS1f8ffq28LQllEEnKytIh3EZkKZZtoPwBsns5ZI34mY1YiXdbldXml02JBmwO62rybqSgr47U5PUQwrPb6uY6Tp3mtg2Gd9pQDQarqcPMjcSAdIIRsg==;
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

CgpEZW4gMTQuMDYuMjAxOSAxNC4xMywgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBOb3cgdGhhdCB0
aGUgVFYgbWFyZ2lucyBhcmUgcHJvcGVybHkgcGFyc2VkIGFuZCBmaWxsZWQgaW50bwo+IGRybV9j
bWRsaW5lX21vZGUsIHdlIGp1c3QgbmVlZCB0byBpbml0aWFsaXNlIHRoZSBmaXJzdCBzdGF0ZSBh
dCByZXNldCB0bwo+IGdldCB0aG9zZSB2YWx1ZXMgYW5kIHN0YXJ0IHVzaW5nIHRoZW0uCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
PiAtLS0KClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
