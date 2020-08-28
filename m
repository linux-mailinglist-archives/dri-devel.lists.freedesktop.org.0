Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC2255FF4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 19:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6D46E03E;
	Fri, 28 Aug 2020 17:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DEE6E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 17:46:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u18so14008wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wt5rjtBjiQXgsiZyccrqBuCchJi/28V2VtauT80eDG0=;
 b=WUV0KW2evFF4RrkIwdzw/atzBtpCx0Bb/Fq48JIv2No29U8b+B8ccBfp7w6DgBRFcW
 R0kj0dc51Ov33t56Z0lM55A5yekGZfTASbVHE5yJzr0QVQ5l2qAZtYlaEfJiuQuFHTQa
 ZPdEVxkHyfz06FKxIS00G1nbTIVP6zTO/i7vu84+X007oGv2upzyt9bqrokOTNq2ppN0
 FXrPuKy4dAjZ9o4ESEF0Dx+oNTHQFNEFR2TPNt86iv/dT3cHhXD4Obew2zGKX2aAz28Y
 G1HCcV9cVAW4H9mxlJydkrRMlFNCI/+9wUxj5h9KSX4xfRuIsLHtLLai7V9dD2XakUvj
 DPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wt5rjtBjiQXgsiZyccrqBuCchJi/28V2VtauT80eDG0=;
 b=S4CAOofrNLBL9BwU1qqE54i3twJX1TOrSZua14F1l9yYTX2oKCEbTB3UcDVFQg+8mP
 k+4eRU1gIpoQSJFBsWSuymmQ2iT/89XCQXyKa5a9o1OcUxPOAv6ruKN1JI0A91ORXAq0
 PlbK21UMToB5t1czlA4AxWoVaVBVotI8gLv54e5ut6/gJJyyYvyOLTV1QN8AGY6njCHl
 Q6Y/4K7niQJuBlZSeL0YAdS9u8kYHw3yf9Sv0WPmo0QI63KpRgRHfaJ/L7ToVVn2Ym9I
 aQrbH07Il60qrfYWLx7yxJS2Yr3MYL+/kBipOtWJpSs8KjJYblFd/WjWPQ+UK2osYwCD
 Sd0A==
X-Gm-Message-State: AOAM533a+2WbkeVl+iNCGPv+6iVOuVDDAfuXb30eVI4ixe+caxou6YB1
 4rSKAqAPnx90K0kc35h3XjI=
X-Google-Smtp-Source: ABdhPJxw6H5OJA+8lnePhRZO+ExFbEMYE/vZGK7hd2gMbDXj2PKzlQ4ucdnQp3HFtU69OXUrx/mNxg==
X-Received: by 2002:a1c:3285:: with SMTP id y127mr240362wmy.104.1598636760666; 
 Fri, 28 Aug 2020 10:46:00 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id f17sm309312wru.13.2020.08.28.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 10:45:59 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
 <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4c929eb9-23da-3797-12e7-ffd2a9a14048@gmail.com>
Date: Fri, 28 Aug 2020 19:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Content-Language: en-US
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
Cc: Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 chunhui dai <chunhui.dai@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyOC8wOC8yMDIwIDAxOjQ2LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBGcmFuazoK
PiAKPiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPiDmlrwgMjAyMOW5
tDjmnIgyN+aXpSDpgLHlm5sg5LiL5Y2IMTA6Mjjlr6vpgZPvvJoKPj4KPj4KPj4KPj4gT24gMjcv
MDgvMjAyMCAxNTo0MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4+IEhpIE1hdHRoaWFzLAo+
Pj4KPj4+IGFueSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4+Pgo+Pgo+PiB0aGV5
IGxvb2sgZ29vZCB0byBtZS4KPj4KPj4+IG1heWJlIHNlcmllcyBleGNlcHQgdGhlIHRtZHMtUGF0
Y2ggZ2V0IG1lcmdlZC4uLnNvIGkgYWRkIGl0IG9ubHkgdG8gbXkgb3duIHJlcG8gdGlsbCB3ZSBm
aW5kIGEgYmV0dGVyIHdheT8KPj4+IGN1cnJlbnRseSBtYWlubGluZSBkb2VzIG5vdCBzdXBwb3J0
IGhkbWkgYXQgYWxsIGZvciB0aGUgYm9hcmQuIHRoZSB0bWRzLXBhdGNoIGlzIG9ubHkgYSBmaXgg
Zm9yIHNwZWNpZmljIHJlc29sdXRpb25zIHdoaWNoIGhhdmUgYSAiZmxpY2tlcmluZyIgd2l0aG91
dCB0aGlzIFBhdGNoLgo+Pj4KPj4KPj4gV2VsbCBsZXQncyBzZWUgd2hhdCBDSydzIG9waW5pb24u
Cj4+Cj4gCj4gQmVjYXVzZSBubyBvbmUgaGFzIGNvbW1lbnQgb24gdGhpcyBwYXRjaCwgSSBjb3Vs
ZCBhcHBseSB0aGlzIHBhdGNoIGJ1dAo+IEkgbmVlZCB5b3UgdG8gYWRkIG1vcmUgZXhwZXJpbWVu
dCBpbmZvcm1hdGlvbiBzbyBpZiBzb21lb25lIG1lZXRzCj4gYW5vdGhlciBidWcsIGhlIGNvdWxk
IGZpeCBoaXMgYnVnIGFuZCBjb25zaWRlciB5b3VyIHByb2JsZW0uCj4gCgpJJ20gYWRkaW5nIENo
dW5odWkgRGFpIGFzIGhlIGdvdCBkcm9wcGVkIGluIHRoZSBkaXNjdXNzaW9uLgoKQ2h1bmh1aSBj
YW4geW91IGFzIHRoZSBmaXJzdCBwYXRjaCBhdXRob3IgcHJvdmlkZSBzb21lIG1vcmUgdGVjaG5p
Y2FsIGJhY2tncm91bmQgCndoeSB0aGUgZGlzdG9ydGlvbiBoYXBwZW5zIGFuZCB3aHkgdGhpcyBw
YXRjaCBmaXhlcyBpdD8KClRoYW5rcyBhIGxvdCwKTWF0dGhpYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
