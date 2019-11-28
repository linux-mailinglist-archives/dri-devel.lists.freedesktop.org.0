Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1D10C42B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 08:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99306E1A3;
	Thu, 28 Nov 2019 07:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0348C6E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:03:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAS73WRI056601;
 Thu, 28 Nov 2019 01:03:32 -0600
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAS73WiX084039
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Nov 2019 01:03:32 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 01:03:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 01:03:31 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAS73TtG107070;
 Thu, 28 Nov 2019 01:03:30 -0600
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
To: Tony Lindgren <tony@atomide.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
 <20191127154556.GI43123@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <777ac96f-1d27-9a2e-f11a-ab453340b9bd@ti.com>
Date: Thu, 28 Nov 2019 09:03:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127154556.GI43123@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574924612;
 bh=RQ0zcmpZWcxSL7j9Y78G5ZOBLq3EnnLJQ/BVgcwqkS0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eI6hxl3PQ+Bi5Afqw/k9sCt+yXZxAEG0tkkMA1RGF3yhS+UJ/msJ4FLvxVwDZohY4
 raGlds/j7rNgaGYyq4L+A95TDbdOPHw7m5hY/ekfpA6Lh5VMQcSf4UCEWBTBrNSnNO
 qYPXToc5R3oSr5Y1s7FaueEaleyzX20zl5Qs+TPA=
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9ueSwKCk9uIDI3LzExLzIwMTkgMTc6NDUsIFRvbnkgTGluZGdyZW4gd3JvdGU6Cgo+Pj4g
SW50ZXJlc3RpbmdseSwgdGhlIGFjdHVhbCBwYW5lbCBhdCBsZWFzdCBvbiBteSBFVk1zIGFuZCBl
UE9TZXMgaXMgbm90Cj4+PiBvc2QwNTdUMDU1OS0zNHRzLCBidXQgb3NkMDcwdDE3MTgtMTl0cy4g
QWxzbywgSSB3YXMgdW5hYmxlIHRvIGZpbmQgYW55Cj4+PiBpbmZvcm1hdGlvbiBhYm91dCBvc2Qw
NTdUMDU1OS0zNHRzLiBJIGRvbid0IGtub3cgdGhlIGhpc3Rvcnkgd2l0aCB0aGlzLAo+Pj4gc28g
aXQgaXMgcG9zc2libGUgdGhhdCB0aGUgZWFybHkgdmVyc2lvbnMgb2YgdGhlIGJvYXJkcyBkaWQg
aGF2ZQo+Pj4gb3NkMDU3VDA1NTktMzR0cywgYnV0IHdhcyBsYXRlciBjaGFuZ2VkIHRvIG9zZDA3
MHQxNzE4LTE5dHMuCj4gCj4gSSBndWVzcyB5b3UgY291bGQga2VlcCB0aGUgb2xkIGNvbXBhdGli
bGUgdGhlcmUgdG9vIGlmIHJlYWxseSBuZWVkZWQuCj4gQnV0IHRoZW4gYWdhaW4gaWYgdGhlIG9s
ZCBjb21wYXRpYmxlIGlzIGtub3duIHRvIGJlIGluY29ycmVjdCwgaXQKPiBzaG91bGQgYmUganVz
dCB1cGRhdGVkLgo+IAo+IFNvIGl0IGxvb2tzIGdvb2QgdG8gbWUgZm9yIHRoZSBkdHMgY2hhbmdl
cy4gRG8geW91IHdhbnQgbWUgdG8gcGljawo+IHRoZW0gaW50byBmaXhlcyBhcyBpdCBzZWVtcyB0
aGF0IHRoZSBwYW5lbCBkcml2ZXIgZml4IGlzIGEgc2VwYXJhdGUKPiBpc3N1ZT8KClllcywgdGhl
IHRoaXJkIHBhdGNoIGNhbiBiZSBoYW5kbGVkIHNlcGFyYXRlbHksIHNvIHBsZWFzZSBwaWNrIHRo
ZSBmaXJzdCB0d28gb25lcy4KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJ
RDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
