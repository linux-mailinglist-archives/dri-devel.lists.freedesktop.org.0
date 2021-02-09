Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13804314494
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 01:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DCE6EA2E;
	Tue,  9 Feb 2021 00:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF636EA2E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:08:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF4C964DD4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829337;
 bh=BIx3eGSYs9bP+3OswyB3XhNzfUFRBY2kgxghItTuskE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opBunexJL58nGbpC8oGnOZvEL9CH7dTCEutJETDFyqqk8OqRVYhu33yw1KZEUz5cX
 KhDYoY2040yNEc0HU9kiCkCl6pD7nbK+Y1eZEEVcKgb247l/JesoZILG9qOD83FPOR
 ZYXEQyfsA/lX1sS09fsOniXXt/ksqBH/3QJQxosF45ncce1mgg3FcdoDvBHS5ZB/J/
 f6QCfLr+ywhCiwahmEA1elvZKxNlt/DD4CDe5Km9BcBXLyoEykuY+/nlWKjeY+60NM
 U8KcjKlY9oOb2C6noew90FZvJffP2yv2esgMZInXOcUiZeVoJ7LjGMBlHwYjmBU7Tg
 jCrOFvl3PHVXA==
Received: by mail-ej1-f50.google.com with SMTP id f14so28522676ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 16:08:56 -0800 (PST)
X-Gm-Message-State: AOAM530OMYkXDus3zyiIU7isD+q6m18l+aXiOdo16blxpyocujoMUe2T
 KLzmp/l++3fEldW2q6j51rzEKi6ir3o1EAnuaw==
X-Google-Smtp-Source: ABdhPJzpLqbujyvxL39zTOTeUscDS/tYzRbxuOzriw8VhEGNKVWX8nbXtvNGzdKFO2JaeBLgzu8Et0m/dH+2P6MVock=
X-Received: by 2002:a17:906:708f:: with SMTP id
 b15mr19813910ejk.267.1612829335422; 
 Mon, 08 Feb 2021 16:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-4-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-WZRUgSBNTe2-Xu1+pkK2RAEScacYZTcHkSUuqXDU5Mg@mail.gmail.com>
Message-ID: <CAAOTY_-WZRUgSBNTe2-Xu1+pkK2RAEScacYZTcHkSUuqXDU5Mg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek, dpi: add mt8192 to mediatek,
 dpi
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
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCj4KPiBBZGQgY29tcGF0aWJsZSAi
bWVkaWF0ZWssbXQ4MTkyLWRwaSIgZm9yIHRoZSBtdDgxOTIgZHBpLgo+CgpSZXZpZXdlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgICAgICB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
cGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRwaS55YW1sCj4gaW5kZXggNmNkYjczNGM5MWE5Li4yZjU2NmYxOWU2ZTAg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbAo+IEBAIC0yMiw2
ICsyMiw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLWRwaQo+ICAg
ICAgICAtIG1lZGlhdGVrLG10ODE3My1kcGkKPiAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZHBp
Cj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRwaQo+Cj4gICAgcmVnOgo+ICAgICAgbWF4SXRl
bXM6IDEKPiAtLQo+IDIuMjUuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
