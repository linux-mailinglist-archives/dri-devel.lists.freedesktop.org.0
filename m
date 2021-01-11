Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676142F2328
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 00:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DED98979F;
	Mon, 11 Jan 2021 23:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1361A8979F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:45:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68A0D22D2B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610408733;
 bh=y8VmMFX/CwJMC+FISkp4wyPeCZWTR2wk4gtw3cMWOuI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WMtQVsJHQtrQ2effqQyf1fLeyeLjCq1nK7PvIMKXYaQluEcq7X3sGbjVrp5vG7EaD
 9fpoV5B8h38pUpAFkvCaABVvO9jHkdqiN5RQPS7z63pu9JYHBdbOW70BxquKK11DIj
 7+QJFBw0fMJlbrRSBPf+O5CC4wHpWtkwpKUuGPVuJ/Ta1Ck/UxPZDVSO24iNLK2WP1
 taJR/FPmkFAVmMDjzhwgfTY0b5LwV+zvLZCfnl5DKIW/tqT09Bf03WLWNMjknWqouP
 U4z02X8naqdB5OEp5xuqHm4JB81jva5BLyPRUkV4xbVvT79cwkMovDGakQLbxvUQKR
 lPcBV7fe5eRHA==
Received: by mail-ej1-f50.google.com with SMTP id g20so917118ejb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:45:33 -0800 (PST)
X-Gm-Message-State: AOAM532iG5tgEhdn8vLCn5Dx37Gcz+G09FxC5ndwQpCp2YC5zcEmG0YR
 Qf7RnbKZocqZAXZsVyIoKjIQZo6RlawSyMgawg==
X-Google-Smtp-Source: ABdhPJxCQ7+JqQlCXU4rJnwOHfKTlzTErG573sDackMZHFooxXdVlewp+enT7XUtpEahPvCk4yRAUbKpSdQbplQxJyQ=
X-Received: by 2002:a17:907:d8b:: with SMTP id
 go11mr1213697ejc.303.1610408731872; 
 Mon, 11 Jan 2021 15:45:31 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:45:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9LkCs5qsCCBtekr2jqKovZVsC471a4DA_RQ3PRRn4U3w@mail.gmail.com>
Message-ID: <CAAOTY_9LkCs5qsCCBtekr2jqKovZVsC471a4DA_RQ3PRRn4U3w@mail.gmail.com>
Subject: Re: [PATCH v3, 04/15] drm/mediatek: add component OVL_2L2
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
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8yTDIKClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYwo+IGluZGV4IDgxZWQwNzYuLmE3MTUxMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtMzgzLDYgKzM4Myw3IEBAIHN0cnVjdCBt
dGtfZGRwX2NvbXBfbWF0Y2ggewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMV0gICAgPSB7
IE1US19ESVNQX09WTCwgICAgICAgMSwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRf
T1ZMXzJMMF0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0RE
UF9DT01QT05FTlRfT1ZMXzJMMV0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMSwgTlVMTCB9LAo+
ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMl0gPSB7IE1US19ESVNQX09WTF8yTCwgICAg
MiwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMF0gICAgPSB7IE1US19ESVNQ
X1BXTSwgICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMV0gICAg
PSB7IE1US19ESVNQX1BXTSwgICAgICAgMSwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05F
TlRfUFdNMl0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMiwgTlVMTCB9LAo+IC0tCj4gMS44
LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
