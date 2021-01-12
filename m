Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752332F3C84
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 00:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0789363;
	Tue, 12 Jan 2021 23:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1108E88549
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 23:09:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7742123135
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610492992;
 bh=0nyABi1I6IbH4taoMU8LdjyQhHLxaseiMU9/vMX1KR0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sbovZzbeFJgifUDQV6OfTlsFv8x0Syu8Dw9ldR+eHROYAH3KszT1DYse3BzCKeJsr
 qWwvJ4VIjMg8HUHrO0AAdrRf+FH9vjPcfdb4HZC46HRKpCMXwNdSlKBA31R6NI2RFo
 xebqqRHLQkJaOSKXIbCCutgSfCM+9vcHQ8KXdiwtpKYouZSImcEtubsYRR3ytFsRV/
 M2Hc3yd/tUMbmExxC4tUogz6aNe5nOlsscWpP4/gjsKnR3CwS0+W0RWcbEolWJt6/d
 2eokurBSDvsK/xWbxSnpSlaIEjym1JZxskxtgE9K7G2Qtmw3PH4F3PvLwwGlWQxQMt
 5raltDROxOfrg==
Received: by mail-ej1-f42.google.com with SMTP id d17so337582ejy.9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 15:09:52 -0800 (PST)
X-Gm-Message-State: AOAM533KU/5/AgwUSpa+K9kzX/5MFRbSBQ4RW7y2fY3JVK+LktOVJ9F4
 /GdDePKKgJVzTaCOYHTc6E+5L8puCySGDk9FoQ==
X-Google-Smtp-Source: ABdhPJwP64jmhjn4D+dF85A/6b6TbFHN8xXLISjTvjsyFKbBPrJtBOL7OecdSuy90tRVPSF9pUMEob05jWopgh4yEjg=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr791422ejb.194.1610492990879; 
 Tue, 12 Jan 2021 15:09:50 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-10-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-10-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 Jan 2021 07:09:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8qDAy=hmbuyxuJTqp3nG_ZqiYHpP0fp4C5Zvs4tKeoNA@mail.gmail.com>
Message-ID: <CAAOTY_8qDAy=hmbuyxuJTqp3nG_ZqiYHpP0fp4C5Zvs4tKeoNA@mail.gmail.com>
Subject: Re: [PATCH v3, 09/15] drm/mediatek: Add pm runtime support for gamma
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Yidi Lin <yidi.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgoKPgo+IGdh
bW1hIHBvd2VyIGRvbWFpbiBuZWVkIGNvbnRyb2xlZCBpbiB0aGUgZGV2aWNlLgoKSW4gdGhpcyBz
ZXJpZXMsIHdoeSBvbmx5IGdhbW1hIGFuZCBjb2xvciBhZGQgcG0gcnVudGltZSBzdXBwb3J0PyBJ
CnRoaW5rIGFsbCBkZHAgY29tcG9uZW50IG5lZWQgcG0gcnVudGltZSBzdXBwb3J0LiBBbmQgcG0g
cnVudGltZQpzdXBwb3J0IGlzIG5vdCByZWxhdGVkIHRvIG10ODE5Miwgc28gbW92ZSB0aGVzZSBw
YXRjaGVzIG91dCBvZiB0aGlzCnNlcmllcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogWWlkaSBMaW4gPHlpZGkubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgfCA1ICsrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9nYW1tYS5jCj4gaW5kZXggM2MxZWEwNy4uZGE5MzA3OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gQEAgLTEwLDYgKzEwLDcgQEAK
PiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfaXJx
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oPgo+Cj4gICNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIKPiBAQCAtMTU2LDYgKzE1Nyw4IEBA
IHN0YXRpYyBpbnQgbXRrX2Rpc3BfZ2FtbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPgo+ICAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7Cj4KPiAr
ICAgICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7Cj4gKwo+ICAgICAgICAgcmV0ID0gY29tcG9u
ZW50X2FkZChkZXYsICZtdGtfZGlzcF9nYW1tYV9jb21wb25lbnRfb3BzKTsKPiAgICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjb21w
b25lbnQ6ICVkXG4iLCByZXQpOwo+IEBAIC0xNjUsNiArMTY4LDggQEAgc3RhdGljIGludCBtdGtf
ZGlzcF9nYW1tYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Cj4gIHN0YXRp
YyBpbnQgbXRrX2Rpc3BfZ2FtbWFfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIHsKPiArICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPiArCj4gICAg
ICAgICBjb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZtdGtfZGlzcF9nYW1tYV9jb21wb25lbnRf
b3BzKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
