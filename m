Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9A361ACF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC456E197;
	Fri, 16 Apr 2021 07:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55F96E197
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:51:00 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id b3so12240761oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tkf19eO+Io33QpEZ9OrMFNNm5052NTcThj0KVfGt26E=;
 b=adlH1/Y2CVaKl1vH5IxrVfUZMgz2Dm6ie2X3uyje5e5//jKV370i8WP3AQHuW3vbUw
 ZR+LGSk9BXwPk7APtR6eguUQm/xqSCu6FWvyCoADVL/xkJa9yJ0to6Ep5QNQsQUa8OQi
 dKJ7CEAM2gi0LExzHs8e0DLKB9jJui5rWFXtjCuEbf9WdkrtbP9PkUpS+dlFuUCBV0m2
 EuCig2dFJc46pPzm4gaUo0QzEWnojq0BumD/utqFClI6ktM2LVk7cPjd52irMEQgbHmH
 0+bNxavCXzaXXZ3IstK/v5s17t7Zui2goTK8NqTOBRQII4pkj6oF9XOxN1JU2z5T0nRn
 Wdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tkf19eO+Io33QpEZ9OrMFNNm5052NTcThj0KVfGt26E=;
 b=XDG81joedu2GXh0JEDVwUatgyenZGenDZysCohuUHl3rbUiktbICrAtoGOHoaVl8S4
 bHjxaeMNU2204humhPywu+mQcDnu99ecGPUi6/4MAGDqXB+q6Sf+nQEygAblJyXN3/eZ
 fHTl6tq0BdCK17DTC5FAUIE+04HCcoh3NiPCYCInTpvRp52gJ++xY1Xtw+iffk7qvvJO
 086+PG5BQkvhA4dS4rgCk3ZlqxIBc8jP3Flnhy9x6KJW4MlYdz7t1LhCQn8+Hx7Skusy
 XR7PJKVncwpDYhw6sx7oiDgHBqJM2Vrhetr7v5PBMSzjAtGMC5B5QdqdOiqniG8tjdRd
 ZuqA==
X-Gm-Message-State: AOAM531e8otPyilvg8zgcdzXN/LoAcO44LMmgQsm5OVSj0kUO3aXuMFe
 7oN/ALOxn2KRITvDqJ/DLA8siqMBRhQzWyInRHE=
X-Google-Smtp-Source: ABdhPJz8CjIrb9secSmN82+8dgT65mEJoVfALDHzcnEalMEMeagCfEVWO/3pFoH/4IMU2ZnA4XlvzlP7/zSe0eH/qzY=
X-Received: by 2002:aca:b408:: with SMTP id d8mr5584941oif.47.1618559460006;
 Fri, 16 Apr 2021 00:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1618236288-1617-2-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 16 Apr 2021 09:50:50 +0200
Message-ID: <CAFqH_50wSBVHnkzr1+Jh=1pppM7rKwZLjkVwhZnBnO=zEo46CA@mail.gmail.com>
Subject: Re: [PATCH v5, 1/4] soc: mediatek: mmsys: add component OVL_2L2
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWW9uZ3FpYW5nLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgoKTWlzc2F0Z2UgZGUgWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IGRlbCBkaWEgZGwuLCAxMgpk
4oCZYWJyLiAyMDIxIGEgbGVzIDE2OjA0Ogo+Cj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9W
TF8yTDIKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KClJldmlld2VkLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxs
ZXRib0Bjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggYi9pbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4IDIyMjhiZjYuLmY2YjU4
ZjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IEBAIC0yOSw2
ICsyOSw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsKPiAgICAgICAgIEREUF9DT01QT05FTlRf
T1ZMMCwKPiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMCwKPiAgICAgICAgIEREUF9DT01Q
T05FTlRfT1ZMXzJMMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMXzJMMiwKPiAgICAgICAg
IEREUF9DT01QT05FTlRfT1ZMMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUFdNMCwKPiAgICAg
ICAgIEREUF9DT01QT05FTlRfUFdNMSwKPiAtLQo+IDEuOC4xLjEuZGlydHkKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
