Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D359372421
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 03:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A239A6E8CC;
	Tue,  4 May 2021 01:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647A56E8CC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 01:05:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b7so5300839ljr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r9D/Vv46NFUDS7eEuuQgoKUOv2tmGGOdBAwQyrDcRjQ=;
 b=UxDctmF7VvjRqvdlfyHMqNtpKHFRKap27sX97KfPpVoeIPDxGsVw1OYBYVdm/L46RI
 mA95gpLDg+C2PlFRKB3QTF9Tn0jMCV1C4GS2XiPGbANUTpFgeIHrTOQHP5aFycX5yzlw
 ZtikYubAOE1fjVTnkFss3IopJFRP6Rztzg0aelsRrR8Nd4c9j0itS4xQJFjJ/xxZoJeg
 G3an5vGGWDam5tgKt5NnI+GO4j7q4SprGw8beLUBt+6ejuOr2J8W3cjXabIye1x6NvyN
 6yyjNr+DKoPLNjFfOUErDqRdQFmp+ZLM+ZzKrsO0g1lzT8KUgC0Zi0JNgXzHBZ0+Ioy0
 ZvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r9D/Vv46NFUDS7eEuuQgoKUOv2tmGGOdBAwQyrDcRjQ=;
 b=OnkUqKZPy0zKWD/z8ahjtSgs8oiCeYjESCa9OPJB9H0ZjvoUMGv0H5gGCBBxqvMJff
 jStbKBPAl5XbhxblBaR116Cx3xijw/avOMXtR8IMltqhBId/X0dj6STuPyNiDrN9U3Vj
 1z/BYsIqRspxb5cgE70iYsLfOQ8eEVK9NmAvih4D82gIeEPrC63Dg1WZZeAcomXIpAt+
 H9eqIpoTuePNb/bDIhF0igP98glHSasWALQCuoo2Jp4G6xZMy0lFJpJuDq5JBLpJ7lT7
 raSluYvNBfnF32yZyps2bZkO8obSHKcreq5HCiPeKTrLUVCyKJH3O7Q1WXRBYqSCvulh
 LDoA==
X-Gm-Message-State: AOAM531L2i3g+BN88Wq8nbzKn0YyMdbFIrzpYcYnq3XPFyp+5xXUPEL9
 5KEUjiiypdxZL9DZA6XntEWg7uvI2rf3337qT5w=
X-Google-Smtp-Source: ABdhPJzAZ3RjpbIHD2cbAWNsd/YGWoRRNdDV4/3/bb7xfoEpcaVivxBQIxquPZHLE0/2FfsQfCnw0959+31Ihtfub2Y=
X-Received: by 2002:a2e:9656:: with SMTP id z22mr6658800ljh.168.1620090302762; 
 Mon, 03 May 2021 18:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-3-git-send-email-u0084500@gmail.com>
 <20210430201054.GA3805118@robh.at.kernel.org>
In-Reply-To: <20210430201054.GA3805118@robh.at.kernel.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 4 May 2021 09:04:51 +0800
Message-ID: <CADiBU3_Nvx99yhukNVgmyiZyAugiVF7OfMoqudUM5_gk8GpPRg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for
 Richtek RT4831
To: Rob Herring <robh@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 linux-fbdev@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEksCgpSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDXmnIgx5pelIOmA
seWFrSDkuIrljYg0OjEw5a+r6YGT77yaCj4KPiBPbiBNb24sIDI2IEFwciAyMDIxIDE1OjE4OjEw
ICswODAwLCBjeV9odWFuZyB3cm90ZToKPiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5n
QHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZHMgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgUmljaHRl
ayBSVDQ4MzEuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdA
cmljaHRlay5jb20+Cj4gPiAtLS0KPiA+IFJlc2VuZCB0aGlzIHY2IHBhdGNoIHNlcmllcyB0byBs
b29wIGRldmljZXRyZWUgcmV2aWV3ZXJzLgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3JpY2h0ZWsscnQ0ODMxLnlhbWwgICAgfCA5MCArKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yaWNodGVrLHJ0
NDgzMS55YW1sCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+CldpbGwgbWVyZ2UgaW4gbmV4dCB2Ny4gVGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
