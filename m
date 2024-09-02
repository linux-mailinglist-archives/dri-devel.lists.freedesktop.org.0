Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7619E9687A7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 14:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A85A10E1D4;
	Mon,  2 Sep 2024 12:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y0XAFTZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AB610E1D4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:39:24 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53345dcd377so5725459e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725280762; x=1725885562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaY7UHB4Cavc4mqMEywTAthZAqJc1/sEmZ2JH5qknFo=;
 b=y0XAFTZAQNUENvISB2FrReBgpL0eDdHhO8yb4N9v+TBQjSaaGuTJ2Ag4Nn9m9/Vdll
 guxOYeRk512fefusH/bMcauufrwNS+Mnfi6yS4EJIDn6Caq9pR0dDCIKcLEW0o6Ir/Yx
 p3COBAYbradfJ+hR6XPj8ftHPE0ux0PLIkneNCWX+xXdxoXWJSrKZ3JT5K9xOKtW1T2n
 myhBxa4CsHdrMfDEZMNChSF/79buadCkKbd25/CL0ZfuxieGd6R8jeRmdsSrLGGTVQoV
 JLOpByL4f7X7w/gfmvBnnA0monmtQRdylB4C5BdAYQ5aj6scyQ8P/74+FwLdiv6fTZUT
 Y9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725280762; x=1725885562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CaY7UHB4Cavc4mqMEywTAthZAqJc1/sEmZ2JH5qknFo=;
 b=tbhwJOoNzYkKc94pMxj9n90w4ykjoJqkyuzj4f2naNLQI7/tDCvBaeQSntlS88KRLs
 jg3bGpkh+/nWQwfMzinsnV/0ptnvw224wO8XLryUCAE3zoENXXM61KJtPsUuR4nf/lC9
 W/DXuVcjn3+7EEymwiWSIpQlhrtotC9ZKwTmrOpeFUgqKzu7Qe7PzgSEtm4Gg7h8g8Y+
 EqvcbJROmIE0UPzzLy/CkWYJspqShkR4y9+iIvqgZyLxz62861gyXRWchrgcc8veTnZh
 Z48eWJ07oQZIhhnM4w5kX32Rrj34Ar95P8DFTO6T7OvVVZ3B/jhFeOS0W7egnbT0gwib
 lTZg==
X-Gm-Message-State: AOJu0Yz7k+LnRnhwgXggeCOsPhwupWcxQNfpWuhenm8SooTPOF/MM0cR
 lIwphu2FyHHlDjKQv0yuOnNlAhLJLYopfLBbr7hQunCh35WK8FxraozJXmHKIDce5hWsR6Uyk2A
 iO06L8PEzrvE+RldY4ROKlHLR5DUapjf++tb2Tw==
X-Google-Smtp-Source: AGHT+IHPGAquvt6NrXMvKDP+0Bo8xxFeYiZ8iZqjJ/iDxU17TxwK/wUM0CTUKYZm8BBQv1/cZmm4LgYLP+zevIkbRH0=
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id
 2adb3069b0e04-53546af3fb5mr6665465e87.11.1725280761445; Mon, 02 Sep 2024
 05:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-4-liaochen4@huawei.com>
In-Reply-To: <20240902113320.903147-4-liaochen4@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 14:39:09 +0200
Message-ID: <CACRpkdY_jF-qeayDefTh1pzE3Yjxbkmrnx9nCxDm+V4tsrdatg@mail.gmail.com>
Subject: Re: [PATCH -next 3/3] drm/mcde: Enable module autoloading
To: Liao Chen <liaochen4@huawei.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, thierry.reding@gmail.com, 
 mperttunen@nvidia.com, jonathanh@nvidia.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 2, 2024 at 1:41=E2=80=AFPM Liao Chen <liaochen4@huawei.com> wro=
te:

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
>
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
