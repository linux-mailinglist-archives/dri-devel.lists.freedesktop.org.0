Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F792D5E4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 09:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6F56E117;
	Wed, 29 May 2019 07:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8616E117
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 07:06:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4T76XlJ104973;
 Wed, 29 May 2019 02:06:33 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4T76Was037571
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 May 2019 02:06:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 29
 May 2019 02:06:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 29 May 2019 02:06:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4T76TGH091555;
 Wed, 29 May 2019 02:06:30 -0500
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
To: Tony Lindgren <tony@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
Date: Wed, 29 May 2019 10:06:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528101847.GN5447@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559113593;
 bh=SB026D3ajxFdRIc7n9qxk9u1vBZJWW0jZuTDSvXX7t4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tA5SEkJn+6HHVMgi/Z+ltEZKF4o4sH9ly30+SnU0y0h6Oa6gbczSq+B9hWXzqX8L7
 R+pIFBZerml9joHBI9VKUgA61hhSY1VdN1yGdPbMXI8XpAEtHHo+SmPfzPSGZfQC7B
 e270M0jtMkAU3U4y+MkpjUv/iOxhTg9KbGMJzOrs=
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDUvMjAxOSAxMzoxOCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4+IE15IGJvYXJkIGlz
IHgxNSByZXYgQTMsIGF0dGFjaGVkIHRvIEFNNSBFVk0uIEkndmUgYWxzbyBhdHRhY2hlZCBteSBr
ZXJuZWwKPj4gY29uZmlnLgo+IAo+IFN0cmFuZ2UgdGhhdCB0aGlzIGlzIG5vdCBhZmZlY3Rpbmcg
b3RoZXIgeDE1PyBJIHRoaW5rIHRpbWVyMTIgd291bGQKPiBiZSBibG9ja2VkIG9uIEhTIGRldmlj
ZXMgdGhvdWdoPwoKU2VlbXMgdGhhdCB0aGUga2VybmVsIGNvbmZpZyBhZmZlY3RzLiBvbWFwMnBs
dXNfZGVmY29uZmlnIGJvb3RzIG9rLgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
