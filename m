Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFB58037
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 12:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F6A6E136;
	Thu, 27 Jun 2019 10:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D65C6E136
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 10:27:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5RAQvPC015217;
 Thu, 27 Jun 2019 05:26:57 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5RAQv1A025865
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Jun 2019 05:26:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 27
 Jun 2019 05:26:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 27 Jun 2019 05:26:56 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5RAQs6p055909;
 Thu, 27 Jun 2019 05:26:54 -0500
Subject: Re: [PATCH v6 00/15] tc358767 driver improvements
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a3fdbb02-586b-66d3-1857-1ed6d90d2537@ti.com>
Date: Thu, 27 Jun 2019 13:26:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561631217;
 bh=QyQZ1LuzFa7iQdI9xKG1JGokv1FyrU+3emS36t/clzQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FNVHYVFA3B5uIOP3tqDJMRSvCsxt3XNUwKYHvFDkEdqNkdc919jOpf9i2Gafv+0d7
 DLH1tjlSxLJFEYZai8BxeGh5uZDzhsyEud5BYPFm9ACTocNbN/QaIM1eXnVXHisrpX
 JFMb7/+PPElFf1FM+UJuNNT0C4nhKTUF28hmGkhU=
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

T24gMTkvMDYvMjAxOSAwODoyNywgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gRXZlcnlvbmU6Cj4g
Cj4gVGhpcyBzZXJpZXMgY29udGFpbnMgdmFyaW91cyBpbXByb3ZlbWVudHMgKGF0IGxlYXN0IGlu
IG15IG1pbmQpIGFuZAo+IGZpeGVzIHRoYXQgSSBtYWRlIHRvIHRjMzU4NzY3IHdoaWxlIHdvcmtp
bmcgd2l0aCB0aGUgY29kZSBvZiB0aGUKPiBkcml2ZXIuIEhvcGVmdWx5IGVhY2ggcGF0Y2ggaXMg
c2VsZiBleHBsYW5hdG9yeS4KPiAKPiBGZWVkYmFjayBpcyB3ZWxjb21lIQoKSSB0aGluayB0aGlz
IGxvb2tzIGZpbmUsIHNvOgoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+CgpVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBteSBEUCBlcXVpcG1lbnQg
Zm9yIHRoZSB0aW1lIGJlaW5nLCBzbyBJJ20gCm5vdCBhYmxlIHRvIHRlc3QgdGhpcyBvbiBvdXIg
Ym9hcmQuIEknbSBmaW5lIHdpdGggbWVyZ2luZywgYXMgdGhlIApwcmV2aW91cyBzZXJpZXMgd29y
a2VkIG9rIGFmdGVyIHJldmVydGluZyB0aGUgc2luZ2xlIHJlZ3Jlc3Npb24gKHdoaWNoIAppcyBm
aXhlZCBpbiB0aGlzIHNlcmllcykuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
