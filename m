Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830874A5BD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F313210E4AC;
	Thu,  6 Jul 2023 21:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360310E4AC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:12:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51d80d81d6eso1660436a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688677932; x=1691269932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR0sM2hjfRkNS+kcQpmfcfZeAyiRf9lyyLVHf0bxWKk=;
 b=fCRsEJ9y2USgZ5j7Lf6j1r8NLjt0SRZhHHg9LOjeMrRrdmm2YWNiJa4IDQ6Ct4YIl/
 /dya8xef2jpuf03uN1pv4+uYBtVZ+eWO50lB5FfyN+9V21JWrn4iqSi2xKfcZptsl2hp
 tlpkcugGapCAAGO6UofODBLUNuL4K/eWzxE4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677932; x=1691269932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR0sM2hjfRkNS+kcQpmfcfZeAyiRf9lyyLVHf0bxWKk=;
 b=ULDYJl2MRyAKo178T0hNhsEG1983kRDyVqrqjRGZMmipatDALbvGbrgdKvNQeW2DtD
 v8UH2YvXP1C0U2+NAY1FVHQcYnoVSVrKZN0VVeFa+e+3CHweEnWu07POoAnau94y3rep
 St2sYvrjJltMziORXRYQzxireTP7bqdwB7bQUOhsWDvt1pyDYe3mVtypcJLMNaoWQKqB
 nw77J/0rxPydAWVG+ElYBjPq1uikJD7mt5NHgwtLXlDea3vNs4E0D425bRcWxOc4vcxP
 OEQe0U50Tf5BQP6xSrFejOsQusx6IXLfu9EzxAXTG/om0j2wk3ezy334Lf0U2iUfMjjY
 YRbg==
X-Gm-Message-State: ABy/qLb/0tUHgCEwAbRdNU9TSLmxrpJlD4oX2b08xNgKWyGND6jU7j+l
 AEOU38W0pjxwmmZ2QgaVlYc+OE4A6HAA6ogfFEBmB2Z5
X-Google-Smtp-Source: APBJJlEpNYj7ha1kC16l2jXstV5TGHbLhOqIUisgCgQCCZmkSQo5qDI9+6g3k1V2P1vcr3FZfZYWIw==
X-Received: by 2002:a17:906:289:b0:96b:e93:3aa8 with SMTP id
 9-20020a170906028900b0096b0e933aa8mr2339205ejf.21.1688677931762; 
 Thu, 06 Jul 2023 14:12:11 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 i12-20020a1709063c4c00b00982a92a849asm1269075ejg.91.2023.07.06.14.12.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 14:12:11 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so1037a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:12:11 -0700 (PDT)
X-Received: by 2002:a50:bac6:0:b0:50b:c48c:8a25 with SMTP id
 x64-20020a50bac6000000b0050bc48c8a25mr26008ede.6.1688677930844; Thu, 06 Jul
 2023 14:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <20230703-fix-boe-tv101wum-nl6-v3-2-bd6e9432c755@linaro.org>
In-Reply-To: <20230703-fix-boe-tv101wum-nl6-v3-2-bd6e9432c755@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Jul 2023 14:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=f-AMrzoOseYFbYQjcwE9_m5SDeeAtg6JVmgw+c8ejA@mail.gmail.com>
Message-ID: <CAD=FV=V=f-AMrzoOseYFbYQjcwE9_m5SDeeAtg6JVmgw+c8ejA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/panel: boe-tv101wum-nl6: Drop surplus prepare
 tracking
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 3, 2023 at 6:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The DRM panel core already keeps track of if the panel is already
> prepared so do not reimplement this.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
>  1 file changed, 12 deletions(-)

It does? Can you please point to where/when the DRM panel core keeps
track of this? I know I've posted a patch for this at:

https://lore.kernel.org/r/20230607144931.v2.2.I59b417d4c29151cc2eff053369ec=
4822b606f375@changeid

...but I haven't landed it because I'm still trying to get consensus
on the rest of the series and a later patch in the series depends on
it.

If you have some evidence that my patch isn't needed, can you please
point at it in the commit message? I would say at least that someone
else seemed to agree that the core wasn't checking this [1], though I
guess it's possible that person was running old code or was just as
confused as I was.

[1] https://lore.kernel.org/r/646e391f.810a0220.214ce.d680@mx.google.com

-Doug
