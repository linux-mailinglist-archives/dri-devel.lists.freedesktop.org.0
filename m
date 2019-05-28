Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E02C4F3
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95EA89FD9;
	Tue, 28 May 2019 10:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0DA6E125
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:58:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SAvsI3030112;
 Tue, 28 May 2019 05:57:54 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SAvs2E057534
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 05:57:54 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 05:57:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 05:57:53 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SAvq0P065502;
 Tue, 28 May 2019 05:57:52 -0500
Subject: Re: [PATCH next 06/25] drm/omap: Use dev_get_drvdata()
To: Kefeng Wang <wangkefeng.wang@huawei.com>, <linux-kernel@vger.kernel.org>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
 <20190423075020.173734-7-wangkefeng.wang@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9010b5b2-8a7c-5cf8-2a1d-2fbeb9f5b55b@ti.com>
Date: Tue, 28 May 2019 13:57:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423075020.173734-7-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559041074;
 bh=5nPt/cxqBGAOTV5zZu0P7LbT0gravsharvQbZ8UG4tU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qAj37Eg+W8vGlkzxCtgXm0Igin9JVmdRgnbhbTWE9iYDCeehWTggWVDmdsrwJgnY1
 Vsk3dVEy178kDDTOnrMptzb9ewZwUB8as0lDqhmCjOdMysuc55wuYpdCDlDpwsA1u1
 Is55Lry01g4GNyKoAKgjjX7wQmT8lXooXoADYvA4=
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
Cc: David Airlie <airlied@linux.ie>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDQvMjAxOSAxMDo1MCwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4gVXNpbmcgZGV2X2dldF9k
cnZkYXRhIGRpcmVjdGx5Lgo+IAo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5A
dGkuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KPiAtLS0KPiAgIC4uLi9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNp
LWNtLmMgICAgfCAxOCArKysrKystLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKVGhhbmtzISBJIGhhdmUgcGlja2VkIHRoaXMg
dXAuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5r
YXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
