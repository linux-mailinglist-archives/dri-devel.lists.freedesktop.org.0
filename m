Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6CBD21E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 20:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E4B6EADB;
	Tue, 24 Sep 2019 18:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78F6EA94
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 18:53:41 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA113214AF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 18:53:40 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id j31so3441916qta.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 11:53:40 -0700 (PDT)
X-Gm-Message-State: APjAAAXOOGut82SjrVBwWKsz2/ZOxlHm5PkdMuNVtvTCh3F/xtomcPzw
 v5FnHFp1qTBZ0gQDJhnpliYPwbtemHinAhOUYw==
X-Google-Smtp-Source: APXvYqyJbcKGU/WuI+VqqQqNQyegr27nfbYT7yNSKP+o30RTEmhgidLW2fbwPtWzi4ErOmeKpHZ8UG6w5pH23aMZ87s=
X-Received: by 2002:a0c:fa49:: with SMTP id k9mr3911313qvo.72.1569351220051;
 Tue, 24 Sep 2019 11:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
 <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
In-Reply-To: <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 24 Sep 2019 13:53:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK1egTpkqsgVUMUiYzKvVJ=nWtJu+OeujJotRCD9ADsnw@mail.gmail.com>
Message-ID: <CAL_JsqK1egTpkqsgVUMUiYzKvVJ=nWtJu+OeujJotRCD9ADsnw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: display: imx: add bindings for DCSS
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569351221;
 bh=HMiXmV2aUG4Tvw658BNY0FPEirpb/JTORRKcPcXKIZk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=onjfFMrxzG2cEGnNFTjw8WdtVtC9c5fpOcii/eR04dtD+9f6tfWPbW6lYqo5hSuhf
 mYvoTzOPP/UtJZAgC2NnIzEmbkM7s9knHn+ZWJ5HNX7fL/a4rqc+Tn5fS+uR1SlmPQ
 BbI0yUrSbxlSy/wblyCrr0D9OKC5HurWaLvozdwE=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgOToxNCBBTSBMYXVyZW50aXUgUGFsY3UgPGxhdXJlbnRp
dS5wYWxjdUBueHAuY29tPiB3cm90ZToKPgo+IEFkZCBiaW5kaW5ncyBmb3IgaU1YOE1RIERpc3Bs
YXkgQ29udHJvbGxlciBTdWJzeXN0ZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50aXUgUGFs
Y3UgPGxhdXJlbnRpdS5wYWxjdUBueHAuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxh
eS9pbXgvbnhwLGlteDhtcS1kY3NzLnlhbWwgICAgICB8IDg2ICsrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lteC9ueHAsaW14
OG1xLWRjc3MueWFtbAoKRmFpbHMgdG8gYnVpbGQgd2l0aCAnbWFrZSBkdF9iaW5kaW5nX2NoZWNr
JzoKCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTE2NjA3My8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
