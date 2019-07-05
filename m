Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3403A6054A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 13:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946886E482;
	Fri,  5 Jul 2019 11:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB26E482
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 11:34:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65BYpDq096314;
 Fri, 5 Jul 2019 06:34:51 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65BYo8j013814
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Jul 2019 06:34:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 06:34:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 06:34:50 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65BYmXQ070978;
 Fri, 5 Jul 2019 06:34:48 -0500
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
To: Pavel Machek <pavel@ucw.cz>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190705101434.fw5rpctnqt6dwg6e@devuan>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e8f24c10-1d88-139c-d0ee-500473ecbe53@ti.com>
Date: Fri, 5 Jul 2019 13:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705101434.fw5rpctnqt6dwg6e@devuan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562326491;
 bh=blnoL/MWFQnzkGsn5dq36BMBYhm1XiyMPpTo0t1/e6I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zR9tdtpeup1SDfhhyN5dDMB3l6l9mjNL7EW1niy+QvfOSHjDcQZoBbenpuod3nXpQ
 QMhM+CZPY/OzVCgZ/HV7E6kCPvBT3534sIbqKZy58BuGiFjnQvUV9oQsTbZKG4PMVj
 8Q2m67GBRcn5ljvu3knFGoQd8iwBa+tn9MFOSXYU=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA1LzA3LzIwMTkgMTI6MTQsIFBhdmVsIE1hY2hlayB3cm90ZToKPiBPbiBNb24gMjAxOS0w
Ny0wMSAxNzoxNDoxOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4KPj4gVGhpcyBzZXJp
ZXMgdGFrZXMgaXQgZnJvbSB0aGVyZSBhbmQgaW1wbGVtZW50cyB0aGUgYmluZGluZyB0aGF0IHdh
cwo+PiBkaXNjdXNzZWQgaW4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC83Mjkz
OTkxLy4gSW4gdGhpcyBuZXcKPj4gYmluZGluZyB0aGUgYmFja2xpZ2h0IGRldmljZSBpcyBhIGNo
aWxkIG9mIHRoZSBMRUQgY29udHJvbGxlciBpbnN0ZWFkIG9mCj4+IGJlaW5nIGFub3RoZXIgcGxh
dGZvcm0gZGV2aWNlIHRoYXQgdXNlcyBhIHBoYW5kbGUgdG8gcmVmZXJlbmNlIGEgTEVELgo+IE90
aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBoYXZlIGJhY2tsaWdodCB0cmlnZ2VyLiBXaGF0IGFyZQo+
IGFkdmFudGFnZXMvZGlzYWR2YW50YWdlcyByZWxhdGl2ZSB0byB0aGF0PwoKSSBkb24ndCBrbm93
IGhvdyB0aGlzIHdvdWxkIGZpdCBpbiB0aGUgbW9kZWwgd2hlcmUgbXVsdGlwbGUgcGFuZWxzIGFy
ZSAKdXNlZCwgZWFjaCB3aXRoIGl0cyBvd24gYmFja2xpZ2h0LgoKQWxzbyB0aGUgbm90aWZpY2F0
aW9uIGlzIG9ubHkgYWJvdXQgYmxhbmtpbmcuCgo+IAkJCQkJCQkJCVBhdmVsCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
