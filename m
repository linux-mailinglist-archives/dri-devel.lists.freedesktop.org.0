Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21825150A9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 18:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A3810E9A4;
	Fri, 29 Apr 2022 16:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EF510E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:21:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gh6so16485602ejb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/i96WVpRgOiedaJPGvdPTgpbnsmRjq9OCgYpWZ3z/Tg=;
 b=EpTcT0njbF1gKIlcMS6t8ZZuyXjeSUeO22i8GJW9dw3H99A25xCRV4aPVEz6ann8Gj
 nKDuvRRsMR/hbBPXxXrbNsULZ8FMSZ0bGnIA/dQB6VYpzFqcGqWKr7UZjVEZiO5UXsQI
 aeZXdoH+DGhJVPfrqpxRktng8xk2SJx9FnGOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/i96WVpRgOiedaJPGvdPTgpbnsmRjq9OCgYpWZ3z/Tg=;
 b=MdZmSXzoWZjWvaTBwwY3JR8Ar2LIaFGnkkYoV6ipo8bi4MYfaGQoaE/aGm9NCCT97n
 DXXUw0TYgMn7rtOHv980Ye515VTCW3lq1kHuOf2TrL5emyfWcoiYmatHHKH7i5Y2yipq
 0howxEa8R0W4MfuAhZQaJjxsmkd1VC9++RXm6nWIhWweLlB7VBRPBzaXP0V6fdx90Iod
 hFugy78Ti0rMifwySwD707imVt4pCNT9MCE9it4S9AkmbiZCcLr2/enr6w9Joqr/QPyG
 4fe6yzAsNp35Hu3Bfz9NilHpTtOh5/vydsGgm12X/qOEgaUtq9nNGpP5oFHncRMgta4Y
 ny8Q==
X-Gm-Message-State: AOAM530lPLaRudbJgQHD//g22Zyjic3tPcLQio/SViTLtzNPNo35HwO3
 zrDdgxw51K/LaYxUEvpaQHsbrbrqEWYhE8Ej
X-Google-Smtp-Source: ABdhPJw2XLOEQ77G7M4DVRLJfAAc+zjRxq6jSiiV5yfXtciCki5oagFad3HOG7+9T9lmVlNDwpLLXg==
X-Received: by 2002:a17:906:1c12:b0:6f3:9eed:e0 with SMTP id
 k18-20020a1709061c1200b006f39eed00e0mr102905ejg.656.1651249291342; 
 Fri, 29 Apr 2022 09:21:31 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 n9-20020aa7c689000000b0042617ba639csm3133680edq.38.2022.04.29.09.21.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 09:21:30 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id q23so11454313wra.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:21:29 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id
 q13-20020adff50d000000b0020ae09600efmr17962780wro.679.1651249289469; 
 Fri, 29 Apr 2022 09:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220429055145.3852271-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220429055145.3852271-1-chi.minghao@zte.com.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Apr 2022 09:21:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo+1O=m_-Wf5z6fxcXAtRabQu3u7tc3pt8Q645b1n1VA@mail.gmail.com>
Message-ID: <CAD=FV=Vo+1O=m_-Wf5z6fxcXAtRabQu3u7tc3pt8Q645b1n1VA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: simplify the return expression of
 ps8640_bridge_host_attach
To: jing yangyang <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Zeal Robot <zealci@zte.com.cn>,
 LKML <linux-kernel@vger.kernel.org>, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 28, 2022 at 10:51 PM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
