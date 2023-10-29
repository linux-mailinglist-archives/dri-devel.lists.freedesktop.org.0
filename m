Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01A7DAEDC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072F110E065;
	Sun, 29 Oct 2023 22:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858F810E065
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:53:14 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-da041ffef81so3203132276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698619993; x=1699224793; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kh1Npdiagr0GsC7dWj3DYaf78y40AqHKeo0ZRGU7CBs=;
 b=kMBphz/Og16JAdiNaOcHlwOlnWu+SOm6F7xbHxok/mplZ2KUrtaPINM2i3wHj9JqZY
 ccy2z6fAR+DBiKiRJwU5F8Fg/4n+SiAvMhJGqH3X4BnkZsH66a4GIoke5gjFmc7HvK+x
 /FzJi6ZanOIwnjrlsYCn+mNXOVxRlbbNm0FDichJntF+g0F4oLZQGtfNg7elC/53Yrrh
 pBBtGFpSITI8yShine3mbspUUsx9MrlpFdQPjuDBV24VymHB2r9Nvtvwu7hZx6dY9OrY
 H8tjeyFSaCwYF2Meb64Z1wR5HpyoCUFEY+cwRHpoZuLp370ZWg7oX3jkivEQyxcNflPD
 Pkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698619993; x=1699224793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kh1Npdiagr0GsC7dWj3DYaf78y40AqHKeo0ZRGU7CBs=;
 b=oNL4zSW7o0W0VxhlmLiv/TAqXfTq+mcAp1A9uTi10ygc2BL7GjeSLlxDPnhM8AjfA0
 PkcOjjwsxdfS8tYUacW2iPYsustubx3tUkG/czaUXE/LmA3AF74VByIxHsoEL2DXeiCO
 lqgJ7uwoYJJ9/n8ku4FZNfhSB1yCXVGNmfSwSA/4kzXboBR28mQos26ihE2tF3hdBjwD
 g1K48sTLPfXQ+8osAkRCOnGC+nB1l/3ofJ/FtH15LBf1DT+IccDVJDJTB2PDiNZgLAwB
 3W6onL53spzHntM3Q6FsQK3oKOiC8JxDzoF5Z6cSgGszLjWCGMnm6XLS46lhnpU/drDf
 aqAg==
X-Gm-Message-State: AOJu0YxLHDsx8rbNj5XTy+qrbrGE04ZowLh8P8oeE9eCRQF+mC72cqbK
 qnSYgVb9kBkJnAjH6D4QJRVvX8nhxQC/WdRTp62Y2w==
X-Google-Smtp-Source: AGHT+IGBAn0VTDre1BNe31QlXIqIMrTmze5z1Qucpkj+uPYH0stMj4Dok73dgBpsfcxDJB9isHerVJybeWlqqdee2H0=
X-Received: by 2002:a25:824e:0:b0:da0:6179:95ac with SMTP id
 d14-20020a25824e000000b00da0617995acmr6813067ybn.48.1698619993219; Sun, 29
 Oct 2023 15:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
In-Reply-To: <20231029194607.379459-3-suijingfeng@loongson.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 00:53:01 +0200
Message-ID: <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>
> The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
> chip to support HDMI output. Thus add a drm bridge based driver for it.
> This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.

Please use the original bridge driver instead of adding a new one. If
it needs to be changed in any way, please help everyone else by
improving it instead of introducing new driver.

>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/loongson/Kconfig            |   1 +
>  drivers/gpu/drm/loongson/Makefile           |   2 +
>  drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
>  drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
>  drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
>  5 files changed, 1039 insertions(+)
>  create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
>  create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
>  create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h


-- 
With best wishes
Dmitry
