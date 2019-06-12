Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623F425EC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3204B892DC;
	Wed, 12 Jun 2019 12:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EF9892DC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:33:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CCXk6w089106;
 Wed, 12 Jun 2019 07:33:46 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CCXkAj094123
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 07:33:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 07:33:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 07:33:45 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CCXh29052198;
 Wed, 12 Jun 2019 07:33:43 -0500
Subject: Re: [PATCH v5 00/15] tc358767 driver improvements
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <91d5be5b-916a-905b-783f-9911424df45b@ti.com>
Date: Wed, 12 Jun 2019 15:33:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560342826;
 bh=C5ukbZB3W88dRDJsXql7AfOwN6+01AO8bczZY4+rJR0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hEp+lukknjcfoaeyLMSGrX1xyeeDiXTBsOTC4dwNU5Lky6NkFCDpgUA/E8A65ZplJ
 RqpSWejMKg0+KwqoqMns1hYn3LmUJRkEaHy6C/Xv5bZkNyTP2POTitfFlBecnvlYRa
 ao3izFpnGgRHDkR17aHxC5J6Jcj+QB2PTHFn/e1Y=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi8wNi8yMDE5IDExOjMyLCBBbmRyZXkgU21pcm5vdiB3cm90ZToKPiBFdmVyeW9u
ZToKPiAKPiBUaGlzIHNlcmllcyBjb250YWlucyB2YXJpb3VzIGltcHJvdmVtZW50cyAoYXQgbGVh
c3QgaW4gbXkgbWluZCkgYW5kCj4gZml4ZXMgdGhhdCBJIG1hZGUgdG8gdGMzNTg3Njcgd2hpbGUg
d29ya2luZyB3aXRoIHRoZSBjb2RlIG9mIHRoZQo+IGRyaXZlci4gSG9wZWZ1bHkgZWFjaCBwYXRj
aCBpcyBzZWxmIGV4cGxhbmF0b3J5LgoKSSBoYXZlbid0IGhhZCB0aW1lIHRvIGRlYnVnLCBidXQg
SSBkaWQgYSBxdWljayB0ZXN0IHdpdGggdGhlIHNlcmllcywgYW5kIApFRElEIHJlYWQgbm8gbG9u
Z2VyIHdvcmtzIG9uIG15IHNldHVwLiBkcm1fZ2V0X2VkaWQoKSByZXR1cm5zIDAuIEkgbmVlZCAK
dG8gZGlnIGluIGZ1cnRoZXIuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5k
IE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3Mg
SUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
