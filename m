Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C22B46F1E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 10:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1C89612;
	Sat, 15 Jun 2019 08:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74689612
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 08:52:15 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52445
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hc4Q1-0001jN-9H; Sat, 15 Jun 2019 10:52:13 +0200
Subject: Re: [PATCH v4 02/12] drm/client: Restrict the plane_state scope
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <304ac11f-766e-9140-2b5a-d1be9fd73e46@tronnes.org>
Date: Sat, 15 Jun 2019 10:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=9ksoxJcU3paxkChs1tqUSzvjMpIhGgaa2Xjsz02iul4=; 
 b=MqCrW/j5oqGKYRIG7R0ryROZHUyBwfSSEkv3wLRMyWTKE/3rrhsxGgTJH+SU2MjPj/kTrnNQtMikd3u9iJSgTNhbq/2wXBpPe0GKbtEHTEFKT14aoXEsx768A02BeZgex0FpkHKN/O6C4JMG0p8zv9Y/69qilQOzqQWOOlwjalPqP2cBXE7+VtBqXA8F78zTanvcjRx1hHSmr0dn6vqCnN3SBRQCNywJtorWB6LzDuSyfuGXvY0wsL5mjaEu0uQnqVFDoqz10Wpy+5XZGIzR2QUZZa7kANPaf3K0FsCizQByf6EuukplbZoDYYySfyDzH8326hE8ROLBmapA4eKjwA==;
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
aWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMgZnVuY3Rpb24gdXNlcyB0d28gdGltZXMgdGhlCj4g
cGxhbmVfc3RhdGUgdmFyaWFibGUgaW4gaW5uZXIgYmxvY2tzIG9mIGNvZGUsIGJ1dCB0aGUgdmFy
aWFibGUgaGFzIGEgc2NvcGUKPiBnbG9iYWwgdG8gdGhpcyBmdW5jdGlvbi4KPiAKPiBUaGlzIHdp
bGwgbGVhZCB0byBpbmFkdmVydGVudCBkZXZzIHRvIHJldXNlIHRoZSB2YXJpYWJsZSBpbiB0aGUg
c2Vjb25kCj4gYmxvY2sgd2l0aCB0aGUgdmFsdWUgbGVmdCBieSB0aGUgZmlyc3QsIHdpdGhvdXQg
YW55IHdhcm5pbmcgZnJvbSB0aGUKPiBjb21waWxlciBzaW5jZSB2YWx1ZSB3b3VsZCBoYXZlIGJl
ZW4gaW5pdGlhbGl6ZWQuCj4gCj4gRml4IHRoaXMgYnkgbW92aW5nIHRoZSB2YXJpYWJsZSBkZWNs
YXJhdGlvbiB0byB0aGUgcHJvcGVyIHNjb3BlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTm9y
YWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
