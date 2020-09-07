Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A426070F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 00:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3C16E0B8;
	Mon,  7 Sep 2020 22:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAFE6E0B8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 22:56:51 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F61821941
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599519411;
 bh=NSfi6wd9qqZTJhGfu2dBWUH/ZuOy9FYmKPjqOXlrGdY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DYL874Ft8lJajzJzSkE08InkYufgly609Dly2f3AmCFg0kllg6SfudOSXe7qRMWqI
 xAJPQVXK02BLjsfoDOaCNPQJIOwBt85PQQ+6cOclK8lu1CxEiMMxAwcxMiDFBc1SXZ
 1Pahyg0bnLv9oV4C/+D8CSqc7CPBTzlO8tk79p0w=
Received: by mail-ed1-f41.google.com with SMTP id w1so14062888edr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 15:56:50 -0700 (PDT)
X-Gm-Message-State: AOAM530S4HpZgWVhnH5Om0eBS64KhKY+lZf4PqqWy7ohmMpA7w2vqL6R
 36tsN0M+1lIEhL+VSZpby4f5LrNID1HQnFPHuw==
X-Google-Smtp-Source: ABdhPJy5CZYbL8ciYgmudWTBCh6+c6fY0KeeVANf0EFcV7pTO+zprkngyGmaklVX6wbgwtJoJPgINeDzP7xumcmZZLw=
X-Received: by 2002:a05:6402:1451:: with SMTP id
 d17mr23241583edx.48.1599519409620; 
 Mon, 07 Sep 2020 15:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200905083058.1631726-1-yukuai3@huawei.com>
In-Reply-To: <20200905083058.1631726-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Sep 2020 06:56:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
Message-ID: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_ddp_comp_init()
To: Yu Kuai <yukuai3@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWXUgS3VhaToKCll1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4g5pa8IDIwMjDlubQ55pyI
NeaXpSDpgLHlha0g5LiL5Y2INDozMeWvq+mBk++8mgo+Cj4gaWYgb2ZfZmluZF9kZXZpY2VfYnlf
bm9kZSgpIHN1Y2NlZWQsIG10a19kZHBfY29tcF9pbml0KCkgZG9lc24ndCBoYXZlCj4gYSBjb3Jy
ZXNwb25kaW5nIHB1dF9kZXZpY2UoKS4gVGh1cyBhZGQgcHV0X2RldmljZSgpIHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4K
ClRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgYnV0IEkgZmluZCBhbm90aGVyIHRoaW5nIHJl
bGF0ZWQgdG8gdGhpcy4KbXRrX2RkcF9jb21wX2luaXQoKSBpcyBjYWxsZWQgaW4gYSBsb29wIGlu
IG10a19kcm1fcHJvYmUoKSwgd2hlbiB0aGlzCmNvbXBvbmVudCBpbml0IGZhaWwsIEkgdGhpbmsg
d2Ugc2hvdWxkIHVuaW5pdGlhbGl6ZSBwcmV2aW91cwpzdWNjZXNzaXZlIGluaXQgY29tcG9uZW50
IGFuZCBwdXQgdGhlaXIgZGV2aWNlLiBXb3VsZCB5b3UgbGlrZSB0byBtYWtlCnRoaXMgcGF0Y2gg
bW9yZSBjb21wbGV0ZT8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IEZpeGVzOiBkMGFmZTM3ZjUy
MDkgKCJkcm0vbWVkaWF0ZWs6IHN1cHBvcnQgQ01EUSBpbnRlcmZhY2UgaW4gZGRwIGNvbXBvbmVu
dCIpCj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggNTdjODhkZTlhMzI5Li41MjY2NDg4ODViOTcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBA
QCAtNDk2LDYgKzQ5Niw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdf
TVRLX0NNRFEpCj4gICAgICAgICBpZiAob2ZfYWRkcmVzc190b19yZXNvdXJjZShub2RlLCAwLCAm
cmVzKSAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiTWlzc2luZyByZWcg
aW4gJXMgbm9kZVxuIiwgbm9kZS0+ZnVsbF9uYW1lKTsKPiArICAgICAgICAgICAgICAgcHV0X2Rl
dmljZSgmbGFyYl9wZGV2LT5kZXYpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiAgICAgICAgIH0KPiAgICAgICAgIGNvbXAtPnJlZ3NfcGEgPSByZXMuc3RhcnQ7Cj4gLS0KPiAy
LjI1LjQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
