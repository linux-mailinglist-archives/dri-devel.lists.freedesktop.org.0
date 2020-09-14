Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690E2699C2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AF6E81B;
	Mon, 14 Sep 2020 23:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780DD6E81B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:37:42 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1611021BE5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126662;
 bh=g2lsFfYhlO0VEH/BabeBJeUV+CvFozoYV2u4w8DDEBQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Is2F32TUQz6dAc2CCZZJbm2PVGfeKFWGtc8X3UHHkFTabwzkYsfVtwx+Z5/4eYyZ6
 5p1HC3vfP/d9JAlvYrRjHyJJ3Tu6Glimmyv6DKj7IPBdaCQFMZrd4WQE3jVpCaU7W+
 9Z+5ch+Q60DGp6haUsuN+RdUQVqSNkckOwja6/6c=
Received: by mail-ej1-f49.google.com with SMTP id nw23so2378674ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:37:42 -0700 (PDT)
X-Gm-Message-State: AOAM531Hek/50LQ3N4/nTMfQOoh3ZyZtpzow8b8S/mLOGDuF4FC/R9sG
 ubPql4ZkYeBc4K848i4+JWGLxDg5M3boIBEGNQ==
X-Google-Smtp-Source: ABdhPJz3pRz8YQcV+pGBgT3eFAaWdp/Z0XMG/X4qOIDHhb5dqpyLXgI9VzxaDFsYQAz61P2dQ2J7GOroEgLbbm8g8bg=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr17632462ejd.7.1600126660682; 
 Mon, 14 Sep 2020 16:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200905083058.1631726-1-yukuai3@huawei.com>
In-Reply-To: <20200905083058.1631726-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:37:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9JA-+Rwiwnwp-tYEhmLKpHs-zkDD-FL31oYrYFeYe3xA@mail.gmail.com>
Message-ID: <CAAOTY_9JA-+Rwiwnwp-tYEhmLKpHs-zkDD-FL31oYrYFeYe3xA@mail.gmail.com>
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

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDXml6Ug6YCx5YWtIOS4i+WNiDQ6MzHlr6vpgZPvvJoKPgo+IGlmIG9mX2ZpbmRfZGV2aWNlX2J5
X25vZGUoKSBzdWNjZWVkLCBtdGtfZGRwX2NvbXBfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIHB1dF9kZXZpY2UoKSB0byBmaXggdGhl
IGV4Y2VwdGlvbgo+IGhhbmRsaW5nIGZvciB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgo+
CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+
IEZpeGVzOiBkMGFmZTM3ZjUyMDkgKCJkcm0vbWVkaWF0ZWs6IHN1cHBvcnQgQ01EUSBpbnRlcmZh
Y2UgaW4gZGRwIGNvbXBvbmVudCIpCj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0Bo
dWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggNTdjODhkZTlh
MzI5Li41MjY2NDg4ODViOTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMKPiBAQCAtNDk2LDYgKzQ5Niw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5p
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgI2lmIElT
X1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gICAgICAgICBpZiAob2ZfYWRkcmVzc190b19y
ZXNvdXJjZShub2RlLCAwLCAmcmVzKSAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiTWlzc2luZyByZWcgaW4gJXMgbm9kZVxuIiwgbm9kZS0+ZnVsbF9uYW1lKTsKPiArICAg
ICAgICAgICAgICAgcHV0X2RldmljZSgmbGFyYl9wZGV2LT5kZXYpOwo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICAgIH0KPiAgICAgICAgIGNvbXAtPnJlZ3NfcGEgPSBy
ZXMuc3RhcnQ7Cj4gLS0KPiAyLjI1LjQKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
