Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5D9BDB56
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 02:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44D10E61C;
	Wed,  6 Nov 2024 01:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iuWhsnH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5D10E61C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 01:43:53 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5ebc22e6362so2890866eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 17:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730857432; x=1731462232; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yG8jv53AK8R/U67YhXnDA52uUNbJU2dyWkTr6UcdFfc=;
 b=iuWhsnH9jQrqV9IA2Z/dX2tsyLqRJZuFmzPzamNvqTzKx2s+7L/BjFYmziGpZxBjG/
 v+E9JzM+lChYVwSz6iGo5QvlgOiw5RbX6E2Uir3/b2FkAfGIuN/u0QdBzPHozeJMTaCv
 k7LHUiO4mkfP2edwoOT6V6ZuKl85AWmH5nuhtJgi3jqmGaYrb1mUbC0eByz/TYV/BH7N
 QvLBtaPDmW1Hen8BtrWMkmQGhk7TUBiY10lPOQQBTXUALnE9L2qakGwg+wAO+4xlfHNQ
 MMmRDunoK8vs9yocWusP5HhPVJHmlWouTU6eJ3V5TTDfZbbCJN0e4RXSWwV3uVNVM2pB
 VmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730857432; x=1731462232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yG8jv53AK8R/U67YhXnDA52uUNbJU2dyWkTr6UcdFfc=;
 b=sOdBOQqz8b6rWHOnI4EjDQmkqIluX7UDoYVmUmQ/yOijp/H+XFUVEqGPihxS2Bo3M5
 vRK+YV7zM+zeVACV+YC3OROsskYsejls06UfyTnaCIbQazeQLzvPIt/nW2NHVLDLySle
 QTUQdBrCutsqa59enGPr8WKno1vlwVIdX23oAClVUOfvGbstEa6823soKsWFaU6J03oZ
 p80ELIJ7OeTfOkDMNwOXCu5WcGKlp7MnqUPCzBrBWkK0Isww2JRO7lNoN8bT1/am0z7w
 nAti9cggKy1IIHwy1QQ1pTULJ2/4OjRNWjD2mmKZcUKMqiT2yrEGgj/1NDpIIH8zS8zr
 zNzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO7g1o8dK4haaEOwnUqxdpxA+L64AatOHeZwOgGoJ8x4+CRaohLJ0Chk/beW4J7+r8KsDDaux+Zso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4e2Ulmk3eBYr7CtMWpwVoLgh5NnIgsciUENF/jVUP8nOInNbq
 Gvn7Cn8C1OTvFMrvsaXOQDHPCRdwdKmh56w7DUbhZJJ+3cbFDxrlpgMOJua9vmEdjmQt51hGeaz
 ThQKiTHm+AULrjA2ctCNy3ds1Fzg=
X-Google-Smtp-Source: AGHT+IGBX3Qy0gHZbnfJ0dlUVj0oxLkQ5CnPrtCzD5a9SjWi3pAZZoeCgbcmbNYrXWtedzQhhj/81NXNGq119DaHhqs=
X-Received: by 2002:a05:6820:2018:b0:5ee:74:4d35 with SMTP id
 006d021491bc7-5ee007458d2mr8109318eaf.2.1730857432411; Tue, 05 Nov 2024
 17:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com>
In-Reply-To: <20241105-coverity1511468wrongoperator-v1-1-06c7513c3efc@gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Nov 2024 09:43:16 +0800
Message-ID: <CAAfSe-tDhxVQuEpxvCWy7sh122CujdQT_Kq5O6VQ3wFNRn40_w@mail.gmail.com>
Subject: Re: [PATCH] drm:sprd: Correct left shift operator evaluating constant
 expression
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karan,

On Wed, 6 Nov 2024 at 02:19, Karan Sanghavi <karansanghvi98@gmail.com> wrote:
>
> The left shift operation followed by a mask with 0xf will
> always result in 0. To correctly evaluate the expression for
> the bitwise OR operation, use a right shift instead.
>
> Reported by Coverity Scan CID: 1511468

Should we add a fixes tag, so that the patch can be backported to the
stable branches.

Apart from that, the patch looks good to me, so,

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

>
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> ---
> Coverity Scan Message:
> CID 1511468: (#1 of 1): Wrong operator used (CONSTANT_EXPRESSION_RESULT)
> operator_confusion: (pll->kint << 4) & 15 is always 0 regardless of the
> values of its operands. This occurs as the bitwise second operand of "|"
> ---
>  drivers/gpu/drm/sprd/megacores_pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sprd/megacores_pll.c b/drivers/gpu/drm/sprd/megacores_pll.c
> index 3091dfdc11e3..43c10a5fc441 100644
> --- a/drivers/gpu/drm/sprd/megacores_pll.c
> +++ b/drivers/gpu/drm/sprd/megacores_pll.c
> @@ -94,7 +94,7 @@ static void dphy_set_pll_reg(struct dphy_pll *pll, struct regmap *regmap)
>         reg_val[3] = pll->vco_band | (pll->sdm_en << 1) | (pll->refin << 2);
>         reg_val[4] = pll->kint >> 12;
>         reg_val[5] = pll->kint >> 4;
> -       reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
> +       reg_val[6] = pll->out_sel | ((pll->kint >> 4) & 0xf);
>         reg_val[7] = 1 << 4;
>         reg_val[8] = pll->det_delay;
>
>
> ---
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> change-id: 20241105-coverity1511468wrongoperator-20130bcd4240
>
> Best regards,
> --
> Karan Sanghavi <karansanghvi98@gmail.com>
>
