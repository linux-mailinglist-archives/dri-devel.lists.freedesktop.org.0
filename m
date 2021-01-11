Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65B2F2286
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30989D66;
	Mon, 11 Jan 2021 22:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EFF89D66
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:16:23 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id s85so402037vsc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KyLRjZOKEDwg/3Ws9dqUbFHnBABZovsYQrri/mlp6Zs=;
 b=kAqEuroXHB0WDHNMJWCLnQhDNGWUcZBfGp0aYeQuUlsLS9ASli+UYbt/SuO72rPP5z
 J/InB4MKhxzWgAK4S2dYgJ0xFZFX+5rMJ5UUVOBLIP+oUug62GDMyZ9e9vDfBwUavckt
 LDZTGsXwwHiM4/CByE//TrAyCqlht4aUO8pMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KyLRjZOKEDwg/3Ws9dqUbFHnBABZovsYQrri/mlp6Zs=;
 b=hAFxnUh8ZanzixT+vchqwOBZb5IO+xdBv/rkgaX3B/Ff3We382tqOzfIiyCvKyaaaV
 Iqf5obRldNrnD345Ng+YVG+n1UbR11d12gSqL+aNDHKs46GF6HOaKN1Gz4Qr5ScysS80
 OcMNqlYLucQ3RYjJlehRCn1lRJiKW4SLu9Jpmy1g79rwQ9gB5F7sAFFUt088esT5dNCK
 JkWbJnu2dl6HDa7nTui5upcKpzZahkPXJyXG2CoURmf/U/Ga3RERRoAouhdTvP4OuTUL
 T8N4xTj9LQmeiKDsB1xDpVbrKoNlsF+2+/UDdiMRjfR5TkRXe606PmIEEkmexRwNSCWu
 HfkA==
X-Gm-Message-State: AOAM5313mEoyPwcN53+2+9v9J4+HIwAq1PSP1dqJuladRi2Qt33hhxp/
 IBlvEO0VQfVon8mRkTjycIhXyHUGtYJi7Q==
X-Google-Smtp-Source: ABdhPJxd3ZdR4t/Pjzdo9kQv+qLS2ugQs1Z3CDncU30kts8LFAVgBlkHxcm90tHaz1EuYL7LRMjzqA==
X-Received: by 2002:a67:f7c5:: with SMTP id a5mr1675701vsp.16.1610403382260;
 Mon, 11 Jan 2021 14:16:22 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id s4sm132545vsp.10.2021.01.11.14.16.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 14:16:21 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id t43so26356uad.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:16:21 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr1522789uaa.104.1610403381056; 
 Mon, 11 Jan 2021 14:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20201210081853.17060-1-shawnguo@kernel.org>
In-Reply-To: <20201210081853.17060-1-shawnguo@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jan 2021 14:16:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZQAaF1SXSP-co_O8=pYepzMHz5FjUfnbRJY_VH0AFpA@mail.gmail.com>
Message-ID: <CAD=FV=WZQAaF1SXSP-co_O8=pYepzMHz5FjUfnbRJY_VH0AFpA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: rename GPIO register bits
To: Shawn Guo <shawnguo@kernel.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 10, 2020 at 12:19 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> From: Shawn Guo <shawn.guo@linaro.org>
>
> It renames GPIO register bits to drop 'SN_' prefix, so that they are
> consistent to other definitions - prefixing register name with 'SN_' but
> not for bit fields.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Sorry for taking so long to get back to this.  I think it came into my
inbox at the same time as a pile of other things and then got lost.
Your change looks good to me.  Sorry for being inconsistent when
adding those defines and thanks for fixing them!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
