Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF54637599
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FEF10E078;
	Thu, 24 Nov 2022 09:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966CB10E6BC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:54:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s5so1704077wru.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLBDPUP9FGkKDGO1g0btIJtnmTUhoMJwrJJH5s4jVyk=;
 b=fRiEi4MXYM5dZgMBZbMA0YrY792sGlXxn0DfGEpZMRX6+cPgbulCtsGeFdsIFXqbjp
 8HAAWrZGtb3qVQa9vPNGkPrJU7xpa66WzlAUHCyq0Mih6V/JcaJTWGL8ztJXmUQqDrMb
 CBpp6pHtqaa+CWFQxvJfFcmrHcVqL/qgOYEDpSjJWftQVOBihPIeVkgBRPbCBHRuqn9T
 rdOv0/OSvRAg7zpCBsvnH5SIMv2N59IsMwpC1CsN078+9OYx6C6s8c4m3H5nuuTClPn4
 zblfiQNk/L7HyI2L+mVbP0dQL1FvYJzNtHTSO5YB1uX8kCIFOc2oatll1UPzEnHhhNmt
 lNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLBDPUP9FGkKDGO1g0btIJtnmTUhoMJwrJJH5s4jVyk=;
 b=hc7dUCH9OV8ny+kjt2HJZGNkWGWl7IQtQmjCZ876esR/itCqq2crUb4cQXZhApTL9u
 pNH/x7EwSN7/akJ2w8ldnkBQQGeuPFdpWMqC9CitgnrBHSGObr2Y62sgfNfYpXW1a8VP
 AByXWvfrHoUxSWokeAwtbwQhejOTmAowN/KlJu17Czz/xRvueBjsHsIXA1Pk8i0+R9M7
 ZfovyAuYSvR+wZ8qD6+dwPBz2E9zOZ9Jz9yZBtmw3okEObgiabXsQDeqqf2hT8cvfXsn
 Lgg0ZUwrp7KCe95vuroLR0Dhw601O8GEwBzEMEni1rrVH1rv4qMG4nvD+pUnwyjlsa8U
 CMSQ==
X-Gm-Message-State: ANoB5pnMLGDCtDSqb56rVT/MeXdat5YXcNtilhMnIzDRw5fki8zOpjsn
 80DKYCZ5x4cbBgBCriHsb9AUQfZoH9TKzrQiFfnC4g==
X-Google-Smtp-Source: AA0mqf416D+WFJos8wQzMUQ33QM0jwoO1N4c0LIU9fiyYurrcYArWa7LcxtXjjJUcBHysRUqQqaEC7UbWnu5r3cNOnE=
X-Received: by 2002:adf:e28b:0:b0:241:c2c3:26c8 with SMTP id
 v11-20020adfe28b000000b00241c2c326c8mr16582659wri.278.1669283653936; Thu, 24
 Nov 2022 01:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
 <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
 <d051f427516fb7e5f7161e60d7e0033740a2aeb4.camel@mediatek.com>
In-Reply-To: <d051f427516fb7e5f7161e60d7e0033740a2aeb4.camel@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 24 Nov 2022 17:54:03 +0800
Message-ID: <CA+Px+wWGGjTMydcyw=jT=T+w96A=GTO_qsgmvZTQiyQ1R2tAoA@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "cychiang@google.com" <cychiang@google.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>,
 "broonie@kernel.org" <broonie@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "dgreid@google.com" <dgreid@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 1:52 PM Allen-KH Cheng (=E7=A8=8B=E5=86=A0=E5=8B=B3=
)
<Allen-KH.Cheng@mediatek.com> wrote:
> We would want to confirm with you as we work on the hdmi-codec for the
> mt8186.
>
> Do you have any plan to continue working on this series? We may take
> over as well.

No (from testing's perspective).  Please take over it as you require.
