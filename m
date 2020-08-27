Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B52551B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 01:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0596E0AD;
	Thu, 27 Aug 2020 23:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CD66E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:46:21 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A2C2207F7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598571981;
 bh=WuN9B34LzV+WTdN5AAx7tMjnWGBPJVTM+zsy0W61vqI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBi+YX5JtPQczBiO05W9F5ZP739Ts1GRyM8mvOvl/GR8Cm7ZQmsuGKUPaSTzAdU05
 wSGs1hpiFVtz1EpSoDjhL5S6gs1D3esyPeMTuMdkbpn1Dmjg60I3T79rJmgGVRtAJz
 un3M6jy9tqRSbFPbQJasWRxguUndBWATe52iDdts=
Received: by mail-ej1-f42.google.com with SMTP id a21so10009012ejp.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:46:20 -0700 (PDT)
X-Gm-Message-State: AOAM530klYcEoXaBFSGV+HrQiqyP7nI6vnscNbCI+X32PsEo3yMlTC/i
 E8X5gkSVcCcTcSkXNYmOA38nXZxXe0EqWOAkig==
X-Google-Smtp-Source: ABdhPJwOl/tRuPJoLPgbirz4Djn6rAAeOTWUMMwHZS2nr/HOlGX4LL/IA2S6rKrQkxqp557HPNIsWsEIZg6W73JHyf8=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr24340249ejd.7.1598571979711; 
 Thu, 27 Aug 2020 16:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
In-Reply-To: <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Aug 2020 07:46:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Message-ID: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8
IDIwMjDlubQ45pyIMjfml6Ug6YCx5ZubIOS4i+WNiDEwOjI45a+r6YGT77yaCj4KPgo+Cj4gT24g
MjcvMDgvMjAyMCAxNTo0MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiA+IEhpIE1hdHRoaWFz
LAo+ID4KPiA+IGFueSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4gPgo+Cj4gdGhl
eSBsb29rIGdvb2QgdG8gbWUuCj4KPiA+IG1heWJlIHNlcmllcyBleGNlcHQgdGhlIHRtZHMtUGF0
Y2ggZ2V0IG1lcmdlZC4uLnNvIGkgYWRkIGl0IG9ubHkgdG8gbXkgb3duIHJlcG8gdGlsbCB3ZSBm
aW5kIGEgYmV0dGVyIHdheT8KPiA+IGN1cnJlbnRseSBtYWlubGluZSBkb2VzIG5vdCBzdXBwb3J0
IGhkbWkgYXQgYWxsIGZvciB0aGUgYm9hcmQuIHRoZSB0bWRzLXBhdGNoIGlzIG9ubHkgYSBmaXgg
Zm9yIHNwZWNpZmljIHJlc29sdXRpb25zIHdoaWNoIGhhdmUgYSAiZmxpY2tlcmluZyIgd2l0aG91
dCB0aGlzIFBhdGNoLgo+ID4KPgo+IFdlbGwgbGV0J3Mgc2VlIHdoYXQgQ0sncyBvcGluaW9uLgo+
CgpCZWNhdXNlIG5vIG9uZSBoYXMgY29tbWVudCBvbiB0aGlzIHBhdGNoLCBJIGNvdWxkIGFwcGx5
IHRoaXMgcGF0Y2ggYnV0CkkgbmVlZCB5b3UgdG8gYWRkIG1vcmUgZXhwZXJpbWVudCBpbmZvcm1h
dGlvbiBzbyBpZiBzb21lb25lIG1lZXRzCmFub3RoZXIgYnVnLCBoZSBjb3VsZCBmaXggaGlzIGJ1
ZyBhbmQgY29uc2lkZXIgeW91ciBwcm9ibGVtLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gUmVn
YXJkcywKPiBNYXR0aGlhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
