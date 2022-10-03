Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF75F36AF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A3D10E4C1;
	Mon,  3 Oct 2022 19:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EA510E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 19:50:27 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a26so24458478ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=DxHyVVJ1bay9R1kwXoTY+0VvTRl9HFlxLnFsOK5Z3nY=;
 b=nqHwAMbc4gmp5TRt8VBwP5XpC1i/UyZNmTlYcFHcEgK6YgpJbUQ8HZYlXPb1rW5+dk
 hKLDz2SUh9oVFCsEEj7UiU3VoEGox+6+BL6uVop6731O5LjoAZAgygtnwKeK3UuD7A8P
 VaCh7FbiySIAU5sTw+CpVtnIaf1DnuxoLwxBaxkOsOL22RKGcMLL/seCMLQjhnH9a4JW
 lpDdFgRk/0ZjfSRYzwqpVdziZtn8ByNSsWUKKLslnuod1Om8ANvvTlv1KHuwIzWaCwzp
 zgUr/RN741sw4NQtzbz94x0gqSnmoCKUpAvZgvKyQAO19xSgCeuNEKTQJNgEVnDS0yid
 W59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DxHyVVJ1bay9R1kwXoTY+0VvTRl9HFlxLnFsOK5Z3nY=;
 b=CvRFjCPUgFyU71g1nW/kv/0KP9UcWViZOSgnAPNlPsaIDC7sKFnF4Y+i0HzNzAzGP/
 he9DU4r3I6oE+oNdf1rr04VVzqRdKXrp6Skk3r4TefgKsi4SimDyu0F76Ti0u+E/jH4d
 4YJJjj+IhlPde6rRDq/yozq93jEychYKHTH0I2emg6y+vhXzmw1Z4PJH4fzxt1ht1a8r
 DLm0e1TsEe4LoCD7YRnoDpa95Re2D27OVQFCbt24edgwbtbEGKYFfMhGvZ0Y4tg3sCeD
 v8eVjHhZxLCoh9pi7pX+kEX2ploGOq4SYnGMnknlU7KspFQEyy15wVWzjGksglC8sjdv
 zYkg==
X-Gm-Message-State: ACrzQf3w56Hv+TASdJNL+I9M22kcyWIdQ0r4MvtHVck8E1abNh2SkA7G
 oxtpCHpsDwzWqitj7xvqHvoX26aGv5SRsxMKeqxwEA==
X-Google-Smtp-Source: AMsMyM4iOP8gI2YZU0fI99Wnptgh/JPKnjl/3lsyXSJJIVq77LkDb/aopWA12ZLDiFg2FHAniglMd7PzZwSehH6qcjE=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr16584586ejc.500.1664826625776; Mon, 03
 Oct 2022 12:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220915163431.2519736-1-weiyongjun@huaweicloud.com>
In-Reply-To: <20220915163431.2519736-1-weiyongjun@huaweicloud.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 21:50:15 +0200
Message-ID: <CACRpkdYV3RuctaJGefHsnyzLDAST7+KV3Sk051yrUh63sQZgDg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: tpg110: Silent no spi_device_id warning
To: Wei Yongjun <weiyongjun@huaweicloud.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 6:17 PM Wei Yongjun <weiyongjun@huaweicloud.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Add spi_device_id entries to silent following SPI warning:
>
> SPI driver tpo-tpg110-panel has no spi_device_id for tpo,tpg110
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
