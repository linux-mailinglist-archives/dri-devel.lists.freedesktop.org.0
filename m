Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5351BE07D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4981A6EEA3;
	Wed, 29 Apr 2020 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3CB6EEA3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:16:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81EC921BE5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588169772;
 bh=RTEeKjUF1paJxifL2yr5+8cCDLpxaByH64rNDTnk/74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k2JQJ8fpMdmxLGcpMg47+0e4J+hktbo4FqU0UFKJ4IbHu6TLTZ9vHZMac3cIZyjBS
 bqTFMJrMFH/92PkZFdiLNCU5Ck/JVhKH2Bls7kkThGiWwWTG18q1neQ95aatEkGcVZ
 ETk250WB2U1zIwmtoNRomh7rVskItnXAz4fJCy+8=
Received: by mail-ed1-f48.google.com with SMTP id l3so1626001edq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:16:12 -0700 (PDT)
X-Gm-Message-State: AGi0Pua1cNmpcVY+d6r57LxMrnkfyMiJu9Ez8n9wMZJQVDZQSmJtSsP1
 RDC6qHkPc4vZZsu2Hm/I9c9O2qxar5s9kVnL6A==
X-Google-Smtp-Source: APiQypItwtCq5f4ckv/WzvZKMkryr9MF+5+w+xUswDZzzQpddnaUOnlv7PJd7bxb8Txbi68jXzKqiS8LDs7q6NzaYYQ=
X-Received: by 2002:aa7:dd95:: with SMTP id g21mr2635984edv.148.1588169770819; 
 Wed, 29 Apr 2020 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200420135045.27984-1-yuehaibing@huawei.com>
 <20200429071337.49528-1-yuehaibing@huawei.com>
In-Reply-To: <20200429071337.49528-1-yuehaibing@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 22:15:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
Message-ID: <CAAOTY__5rwRQhuy4vT8OiAKMM2bQtCb7w5AW9B5rqL+UVdVpsg@mail.gmail.com>
Subject: Re: [PATCH v3 -next] drm/mediatek: Fix Kconfig warning
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.orc, linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1ZUhhaWJpbmc6CgpZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IOaWvCAy
MDIw5bm0NOaciDI55pelIOmAseS4iSDkuIvljYgzOjE05a+r6YGT77yaCj4KPiBXQVJOSU5HOiB1
bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBNVEtfTU1TWVMKPiAgIERlcGVu
ZHMgb24gW25dOiAoQVJDSF9NRURJQVRFSyBbPXldIHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiBD
T01NT05fQ0xLX01UODE3M19NTVNZUyBbPW5dCj4gICBTZWxlY3RlZCBieSBbeV06Cj4gICAtIERS
TV9NRURJQVRFSyBbPXldICYmIEhBU19JT01FTSBbPXldICYmIERSTSBbPXldICYmIChBUkNIX01F
RElBVEVLIFs9eV0gfHwgQVJNICYmIENPTVBJTEVfVEVTVCBbPW5dKSAmJiBDT01NT05fQ0xLIFs9
eV0gJiYgSEFWRV9BUk1fU01DQ0MgWz15XSAmJiBPRiBbPXldCj4KPiBNYWtlIERSTV9NRURJQVRF
SyBkZXBlbmQgb24gTVRLX01NU1lTIHRvIGZpeCB0aGlzLgoKUmV2aWV3ZWQtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiAyYzc1OGUzMDFlZDkg
KCJzb2MgLyBkcm06IG1lZGlhdGVrOiBNb3ZlIHJvdXRpbmcgY29udHJvbCB0byBtbXN5cyBkZXZp
Y2UiKQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4K
PiAtLS0KPiB2MzogbWFrZSBEUk1fTUVESUFURUsgZGVwZW5kcyBvbiBNVEtfTU1TWVMKPiB2Mjog
c2VsZWN0IENPTU1PTl9DTEtfTVQ4MTczX01NU1lTIGluc3RlYWQgb2YgYWRkaW5nIERSTV9NRURJ
QVRFSyBkZXBlbmRlbmN5Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCj4gaW5kZXggYzQyMGY1YTNkMzNiLi5hYTc0YWFj
M2NiY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZwo+IEBAIC02LDEyICs2LDEyIEBA
IGNvbmZpZyBEUk1fTUVESUFURUsKPiAgICAgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ICAg
ICAgICAgZGVwZW5kcyBvbiBIQVZFX0FSTV9TTUNDQwo+ICAgICAgICAgZGVwZW5kcyBvbiBPRgo+
ICsgICAgICAgZGVwZW5kcyBvbiBNVEtfTU1TWVMKPiAgICAgICAgIHNlbGVjdCBEUk1fR0VNX0NN
QV9IRUxQRVIKPiAgICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ICAgICAgICAgc2VsZWN0
IERSTV9NSVBJX0RTSQo+ICAgICAgICAgc2VsZWN0IERSTV9QQU5FTAo+ICAgICAgICAgc2VsZWN0
IE1FTU9SWQo+IC0gICAgICAgc2VsZWN0IE1US19NTVNZUwo+ICAgICAgICAgc2VsZWN0IE1US19T
TUkKPiAgICAgICAgIHNlbGVjdCBWSURFT01PREVfSEVMUEVSUwo+ICAgICAgICAgaGVscAo+IC0t
Cj4gMi4xNy4xCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
