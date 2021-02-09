Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A873144B8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 01:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820106EA3C;
	Tue,  9 Feb 2021 00:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535BD6EA3C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:14:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C527A64EB4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829689;
 bh=WoOjxOk8JYT5efEA7HSlP75glTYtvejfp2tn/9Mzzhs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uhvbNFS8wAXY/9NR9b9Mamz2DDgTkOxSf0m+sS3XnHkntYhctfd+Og/wgum0T3w89
 VBJ+jSBK0/8q0KCXLhXEj/nn68fTc4mCA5pUK4qmaMzgqpheVMuLuwdWZgr/JPPGM+
 ecHKZsDLK1GoK/i97a7Ln05r11oJrlIDTtMzLz9grN7/Qz2el8KugzIzV9r8qYGsMn
 B8cPY0Byq7D8EXnXdON5ZRzZPo9EdxGKaP16TZUNUA9qXGbUiKTagPJ5Wfv+rqizzg
 Wn1vYf0VDjE+HbR/n5pb/7nJjNqULTLjd2+qWyeQj/Uj8JUI8FWDTu0PGeD4xU60f8
 IET+D4ponC/uA==
Received: by mail-ed1-f50.google.com with SMTP id s5so21391762edw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 16:14:48 -0800 (PST)
X-Gm-Message-State: AOAM5300WhcvBn9QdbSk320yVhDUidK3NYKVfMQmC6JxWnBz2EVtVesz
 uzhhR6jjp8lxWcBgCOFaLZiPv4WSgSySt4Wggg==
X-Google-Smtp-Source: ABdhPJwZu/LT//WuvGKVPlXuTP7AnCe2WDHnPiD5yYbRvAimq56Exf9C2zmxxRxrJUSZmx3eYYMvY1jDe0iuuqPDiF4=
X-Received: by 2002:a05:6402:1711:: with SMTP id
 y17mr19613530edu.72.1612829687397; 
 Mon, 08 Feb 2021 16:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-3-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:14:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9i0yQ5eg-X_AKXd=sj=6qxbeB8QgaziN-Sw2146iHPKA@mail.gmail.com>
Message-ID: <CAAOTY_9i0yQ5eg-X_AKXd=sj=6qxbeB8QgaziN-Sw2146iHPKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/mediatek: mtk_dpi: Add dpi config for mt8192
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 shuijing.li@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCgpXaGVyZSBpcyB0aGUgZGVzY3Jp
cHRpb24/IFNheSBzb21ldGhpbmcgaGVyZS4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkg
PGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHBpLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBpbmRleCBmZmE0YTBmMTk4OWYu
LmY2ZjcxZWI2N2ZmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC03
MDMsNiArNzAzLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19j
b25mID0gewo+ICAgICAgICAgLm1heF9jbG9ja19raHogPSAxMDAwMDAsCj4gIH07Cj4KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7Cj4gKyAgICAgICAu
Y2FsX2ZhY3RvciA9IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yLAo+ICsgICAgICAgLnJlZ19oX2Zy
ZV9jb24gPSAweGUwLAo+ICsgICAgICAgLm1heF9jbG9ja19raHogPSAxNTAwMDAsCj4gK307Cj4g
Kwo+ICBzdGF0aWMgaW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgewo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiBAQCAt
ODM3LDYgKzg0Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcGlf
b2ZfaWRzW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
cGkiLAo+ICAgICAgICAgICAuZGF0YSA9ICZtdDgxODNfY29uZiwKPiAgICAgICAgIH0sCj4gKyAg
ICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1kcGkiLAo+ICsgICAgICAgICAu
ZGF0YSA9ICZtdDgxOTJfY29uZiwKPiArICAgICAgIH0sCj4gICAgICAgICB7IH0sCj4gIH07Cj4K
PiAtLQo+IDIuMjUuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
