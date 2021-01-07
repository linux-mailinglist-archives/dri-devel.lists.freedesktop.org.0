Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EA2ECD5C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB896E40B;
	Thu,  7 Jan 2021 09:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CC36E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:54:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C4323356
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610013271;
 bh=9pBng+AVEqLNZFQoFpUKzynC7ullL0lxTHI0rs1FDo4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b0kXrzJiWBzfthx6ighlPCQeNzGK0Pjy47IRrfuWCSaFdvt/ETQWsIzFhfsXP/V8S
 JncbvQ0z5n/yWSgDWiq8AEsqDuNc2TXiySr14pHtRqhHdCictbQzGcUNXlp3Rfm/nq
 nOlKbli2L0u0KTePIWH2+645lgunZZVMGLuNXopE5Z46p5usG0WWaY/8V/kHeKK8f7
 s84kWEt2r3xxQhVudPfVBQuszn0+QzOdM0iO6m/LPUfHdTr1U7i0QMJTMk93DpW95u
 bJmUp66tpgHr/guasp8OfTGLavYtFuGm77fmr5utx0+a/HCUnsdEzucf3qNM7CvZB6
 aQx4LSR5JNNhQ==
Received: by mail-ej1-f47.google.com with SMTP id n26so8862657eju.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:54:30 -0800 (PST)
X-Gm-Message-State: AOAM530D/q7BieXcHUZFHE8WXnfWjlSGOPO9uNwww9e0Hiko3M5XmYxB
 Sm0aEot99wHKt2dXfI+HAUy5E5F0pEVRtZEcmA==
X-Google-Smtp-Source: ABdhPJwb3idVQRWQCrmNfDclIJoa1CSuPbDunAFSX4HX9CXgW142tjcm1t3p9B86xQsdcyQdWANVKIAM8+nvB3sqyHY=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr5714887ejb.194.1610013269189; 
 Thu, 07 Jan 2021 01:54:29 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 17:54:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9FdLrZyKpgAsuJQxORh7uHhjYBn8Acu_1B0vQ0Uv_Nzw@mail.gmail.com>
Message-ID: <CAAOTY_9FdLrZyKpgAsuJQxORh7uHhjYBn8Acu_1B0vQ0Uv_Nzw@mail.gmail.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
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
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMeWvq+mBk++8mgo+Cj4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
IHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
cWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICAgICB8
IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggMzM5NzdlMS4uYjA3ODgx
ZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gQEAgLTY2
LDYgKzY2LDE0IEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOgo+
ICAgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L21lZGlhdGVrLGlvbW11LnR4dAo+ICAgIGZvciBkZXRhaWxzLgo+Cj4gK09wdGlvbmFsIHByb3Bl
cnRpZXMgKFJETUEgZnVuY3Rpb24gYmxvY2tzKToKPiArLSBtZWRpYXRlayxyZG1hLWZpZm8tc2l6
ZTogcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQg
dGhpcwo+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPiArICB0aGUgdmFs
dWUgaXMgdGhlIE1heCB2YWx1ZSB3aGljaCBkZWZpbmVkIGluIGhhcmR3YXJlIGRhdGEgc2hlZXQu
Cj4gKyAgbWVkaWF0ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTczLXJkbWEwIGlzIDhLCj4gKyAg
bWVkaWF0ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTgzLXJkbWEwIGlzIDVLCj4gKyAgbWVkaWF0
ZWsscmRtYS1maWZvLXNpemUgb2YgbXQ4MTgzLXJkbWExIGlzIDJLCj4gKwo+ICBFeGFtcGxlczoK
Pgo+ICBtbXN5czogY2xvY2stY29udHJvbGxlckAxNDAwMDAwMCB7Cj4gQEAgLTEwMyw2ICsxMTEs
NyBAQCByZG1hMDogcmRtYUAxNDAwZTAwMCB7Cj4gICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENM
S19NTV9ESVNQX1JETUEwPjsKPiAgICAgICAgIGlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfRElT
UF9SRE1BMD47Cj4gICAgICAgICBtZWRpYXRlayxsYXJiID0gPCZsYXJiMD47Cj4gKyAgICAgICBt
ZWRpYXRlayxyZG1hLWZpZm9zaXplID0gPDgxOTI+Owo+ICB9Owo+Cj4gIHJkbWExOiByZG1hQDE0
MDBmMDAwIHsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
