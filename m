Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C01FC73F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983AE6EAA0;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6486E8D8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 16:57:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GGv4c5039757;
 Tue, 16 Jun 2020 11:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592326624;
 bh=5SNJOnx/JOfRnrAoSOCyZsNKVPe0vOboLu2yYA8Qo+g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p7Di1GMM11digdmvF0BR+ZWyhf2oS8veOe9hLPwIC443TStcKogKOcDElHepmLxDs
 X80+pB0bLhqVfDFcgPlnHehgK2MOwQXu+aeb9HssxCD4mSb2uyp+eVTNt0w/W6z9bX
 4bsapM7NawXR5nmJoTuYU1Xv2smugOwMEg/P49oI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GGv44v029523;
 Tue, 16 Jun 2020 11:57:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 11:57:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 11:57:03 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GGuwQT087296;
 Tue, 16 Jun 2020 11:56:59 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To: Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
 <592501c9-2d94-b266-ae76-e383d3bffa29@ti.com>
 <20200616153042.GZ37466@atomide.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <3f2855cc-48b8-ecb8-5d92-beeabe344b26@ti.com>
Date: Tue, 16 Jun 2020 19:56:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616153042.GZ37466@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxNi8wNi8yMDIwIDE4OjMwLCBUb255IExpbmRncmVuIHdyb3RlOgo+ICogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gWzIwMDYxNiAxMzowMl06Cj4+IE9uIDExLzA2
LzIwMjAgMTc6MDAsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOgo+Pj4gSSB0aGluaywgc3VzcGVu
ZCBtaWdodCBiZSBmaXhlZCBpZiBhbGwgZGV2aWNlcywgd2hpY2ggYXJlIG5vdyBjaGlsZCBvZiB0
aS1zeXNjLCB3aWxsIGRvCj4+PiBwbV9ydW50aW1lX2ZvcmNlX3h4eCgpIGNhbGxzIGF0IG5vaXJx
IHN1c3BlbmQgc3RhZ2UgYnkgYWRkaW5nOgo+Pj4KPj4+ICAgwqDCoMKgwqBTRVRfTk9JUlFfU1lT
VEVNX1NMRUVQX1BNX09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQsCj4+PiAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbV9ydW50aW1lX2ZvcmNlX3Jlc3Vt
ZSkKPj4+Cj4+PiBBbSBJIG1pc3Npbmcgc210aD8KPj4KPj4gSXNuJ3QgdGhpcyBhbG1vc3QgZXhh
Y3RseSB0aGUgc2FtZSBteSBwYXRjaCBkb2VzPyBJIGp1c3QgdXNlZCBzdXNwZW5kX2xhdGUKPj4g
YW5kIHJlc3VtZV9lYXJseS4gSXMgbm9pcnEgcGhhc2UgYmV0dGVyIHRoYW4gbGF0ZSAmIGVhcmx5
Pwo+IAo+IFdlbGwgdXAgdG8geW91IGFzIGZhciBhcyBJJ20gY29uY2VybmVkLiBUaGUgbm9pcnEg
cGhhc2UgY29tZXMgd2l0aCBzZXJpb3VzCj4gbGltaXRhdGlvbnMsIGZvciBsZXQncyBzYXkgaTJj
IGJ1cyB1c2FnZSBpZiBuZWVkZWQuIFByb2JhYmx5IGFsc28gaGFyZGVyCj4gdG8gZGVidWcgZm9y
IHN1c3BlbmQgYW5kIHJlc3VtZS4KClVuZm9ydHVuYXRlbHksIHlvdSBjYW4ndCB1c2UgUE0gcnVu
dGltZSBmb3JjZSBBUEkgYXQgLnN1c3BlbmQoKSBzdGFnZSBhcyBwbV9ydW50aW1lX2dldCB3aWxs
IHN0aWxsIHdvcmsgYW5kCnRoZXJlIGlzIG5vIHN5bmMgYmV0d2VlbiBzdXNwZW5kIGFuZCBwbV9y
dW50aW1lLgpUaGUgUE0gcnVudGltZSBmb3JjZSBBUEkgY2FuIGJlIHVzZWQgb25seSBkdXJpbmcg
bGF0ZS9ub2lycSBhcyBhdCB0aGlzIHRpbWUgcG1fcnVudGltZSBpcyBkaXNhYmxlZC4KCi0tIApC
ZXN0IHJlZ2FyZHMsCmdyeWdvcmlpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
