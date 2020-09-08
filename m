Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB1260BA9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9658C6E17E;
	Tue,  8 Sep 2020 07:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF696E584
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 01:05:28 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B5548295C3B4781B870;
 Tue,  8 Sep 2020 09:05:24 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.103) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 8 Sep 2020 09:05:15 +0800
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_ddp_comp_init()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200905083058.1631726-1-yukuai3@huawei.com>
 <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <e10c0375-8ef3-a2ba-b23f-f80d082e1ba7@huawei.com>
Date: Tue, 8 Sep 2020 09:05:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
X-Originating-IP: [10.174.179.103]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: yi.zhang@huawei.com, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, DRI
 Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC8wOS8wOCA2OjU2LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpIFl1IEt1YWk6Cj4g
Cj4gWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPiDmlrwgMjAyMOW5tDnmnIg15pelIOmAseWF
rSDkuIvljYg0OjMx5a+r6YGT77yaCj4+Cj4+IGlmIG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUoKSBz
dWNjZWVkLCBtdGtfZGRwX2NvbXBfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+PiBhIGNvcnJlc3BvbmRp
bmcgcHV0X2RldmljZSgpLiBUaHVzIGFkZCBwdXRfZGV2aWNlKCkgdG8gZml4IHRoZSBleGNlcHRp
b24KPj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4+Cj4gCj4g
VGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLCBidXQgSSBmaW5kIGFub3RoZXIgdGhpbmcgcmVs
YXRlZCB0byB0aGlzLgo+IG10a19kZHBfY29tcF9pbml0KCkgaXMgY2FsbGVkIGluIGEgbG9vcCBp
biBtdGtfZHJtX3Byb2JlKCksIHdoZW4gdGhpcwo+IGNvbXBvbmVudCBpbml0IGZhaWwsIEkgdGhp
bmsgd2Ugc2hvdWxkIHVuaW5pdGlhbGl6ZSBwcmV2aW91cwo+IHN1Y2Nlc3NpdmUgaW5pdCBjb21w
b25lbnQgYW5kIHB1dCB0aGVpciBkZXZpY2UuIFdvdWxkIHlvdSBsaWtlIHRvIG1ha2UKPiB0aGlz
IHBhdGNoIG1vcmUgY29tcGxldGU/CgpIaSwKCk9mIGNvdXJzZSwgdGhhbmsgeW91IGZvciB5b3Vy
IHJldmlldy4KCkJlc3QgcmVnYXJkcywKWXUgS3VhaQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
