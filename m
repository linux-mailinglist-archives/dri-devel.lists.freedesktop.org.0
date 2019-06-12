Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1842660
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9D6893B8;
	Wed, 12 Jun 2019 12:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B910893B8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:48:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CCmKOd062918;
 Wed, 12 Jun 2019 07:48:20 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CCmKfd063889
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 07:48:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 07:48:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 07:48:19 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CCmHB8038159;
 Wed, 12 Jun 2019 07:48:17 -0500
Subject: Re: [PATCH v5 10/15] drm/bridge: tc358767: Add support for
 address-only I2C transfers
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
 <20190612083252.15321-11-andrew.smirnov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a1c125d2-1c7a-c190-8b7e-845a2ec1d2ea@ti.com>
Date: Wed, 12 Jun 2019 15:48:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612083252.15321-11-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560343700;
 bh=VNAzdfRr5Fo8LME/5hfg26/21196dpOni0yCTYzdhNs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=cUYNm5ogyS/hT31gT74CvW3Ygh9wmCj6iK9TLIUIzKS9nCEbFhnQ1Cojp0L1D/i/w
 e7+FAC+GtQCqSjeKMpeysHvxll9o9VvQhjA3CO5eRgUOWC3da+fofx/+/X79fSI8q4
 bGS4CbzH3aCiXntpQE636tUOsuf14QCg7wjbkV3o=
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

SGksCgpPbiAxMi8wNi8yMDE5IDExOjMyLCBBbmRyZXkgU21pcm5vdiB3cm90ZToKPiBUcmFuc2Zl
ciBzaXplIG9mIHplcm8gbWVhbnMgYSByZXF1ZXN0IHRvIGRvIGFuIGFkZHJlc3Mtb25seQo+IHRy
YW5zZmVyLiBTaW5jZSB0aGUgSFcgc3VwcG9ydCB0aGlzLCB3ZSBwcm9iYWJseSBzaG91bGRuJ3Qg
YmUganVzdAo+IGlnbm9yaW5nIHN1Y2ggcmVxdWVzdHMuIFdoaWxlIGF0IGl0IGFsbG93IERQX0FV
WF9JMkNfTU9UIGZsYWcgdG8gcGFzcwo+IHRocm91Z2gsIHNpbmNlIGl0IGlzIHN1cHBvcnRlZCBi
eSB0aGUgSFcgYXMgd2VsbC4KCkkgYmlzZWN0ZWQgdGhlIEVESUQgcmVhZCBpc3N1ZSB0byB0aGlz
IHBhdGNoLi4uCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jr
a2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1
MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
