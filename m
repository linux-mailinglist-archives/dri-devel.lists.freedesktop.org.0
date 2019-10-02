Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C74C88CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C786E969;
	Wed,  2 Oct 2019 12:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266FD6E969
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:39:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92CchiH099511;
 Wed, 2 Oct 2019 07:38:43 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92CchI2115742
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Oct 2019 07:38:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:38:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:38:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92CceG7053910;
 Wed, 2 Oct 2019 07:38:40 -0500
Subject: Re: [PATCH 10/60] drm/bridge: Add bridge driver for display connectors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-7-laurent.pinchart@ideasonboard.com>
 <6024b178-f4e0-b54a-fcec-ace6ec256048@ti.com>
 <20191001200804.GG21064@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <575b5a36-2dc3-8649-03de-efb7d4713344@ti.com>
Date: Wed, 2 Oct 2019 15:38:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001200804.GG21064@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570019923;
 bh=srPxg2ga2MgKZfbvkWUlUTWTQNeORpw3AEWD66He76I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IrU09W1qZcMxSI/46FFA01ay3RdN0lsaLVi1voRk2zM9dM/gK3SmI1z547E+uXfyM
 DgMaBrcGgfgnGoDGjHxjrWn2xRFsmdcScIC+sv/oP9C520u91lZbJxRS/ExzOtk1jf
 VZEHH9A+t7pgY+psPOfnjyIBxezGmDofanUAq65s=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMTAvMjAxOSAyMzowOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKCj4gTWFueSBkcml2
ZXJzIHByaW50IGFuIGluZm8gbWVzc2FnZSBhdCBwcm9iZSB0aW1lIHdoZW4gZXZlcnl0aGluZyBn
b2VzCj4gZmluZSwgdG8gaW5mb3JtIGFib3V0IHRoZSBkZXZpY2UgdGhhdCBoYXMgYmVlbiBzdWNj
ZXNmdWxseSBwcm9iZWQuIERvCj4geW91IHRoaW5rIHRoaXMgaXMgb3ZlcmtpbGwgYW5kIGEgZGV2
X2RiZygpIHdvdWxkIGJlIGJldHRlciA/CgpBaCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzIGlzIGEg
InByb2JlZCIgbWVzc2FnZS4gWWVwLCB0aG9zZSBwcmludHMgCnNvbWV0aW1lcyBoZWxwLiBJIGRv
bid0IGhhdmUgc3Ryb25nIGZlZWxpbmdzIGhlcmUsIGJ1dCB1c3VhbGx5IEkgbGlrZSAKdGhlIGRy
aXZlcnMgdG8gYmUgcXVpZXQgaWYgZXZlcnl0aGluZyBpcyBvay4KCiAgVG9taQoKLS0gClRleGFz
IEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtp
LgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBI
ZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
