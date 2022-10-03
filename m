Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19A5F36B4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 21:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961AF10E4C3;
	Mon,  3 Oct 2022 19:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C0F10E4C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 19:51:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hy2so24431972ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=BRuZyIIg5CLCpvrxlItV1foyO3zMRph+hQFYoNabdPg=;
 b=TKMJ2BsiRr0P44l0KXZIPUPTkjKdojbcIla1eEyKEfw7Pm4znsYWKgnb6X0sS7a0Cl
 SEXCD6zK8SDjPc8DV7nyr6jkH4agbtWTcKYn5FbnO4/07Y/v88TLVm4XU6p7RocY2Ch6
 NGQk5tAOTDM/JqDpnXcPSJTV/w8qLYXmjjDVPTFZBTzDtCPpG+hn46cEsMBgVfyfJ6wO
 SH6ArNONOcKJkBTsYEjFovYsTv3qYHw6AGf0Ku/ryYunlZunpKiw/eOXpXR8IAm6XvVU
 SEsXoWDL/JiNBiwoGrCFHHz674x11mWFJ0rHSS2xPsPBqr9KgNlUSZjDSMo5LoDcjeDn
 OceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=BRuZyIIg5CLCpvrxlItV1foyO3zMRph+hQFYoNabdPg=;
 b=tzDmGrtxPvTlpI6lkBvb4AdBMplnShXhPVWfroMfhzAI3fF2EYoStIq/0I+x5Lhz2B
 PKwcG+D0GCnrj89E/wAc5FFNuMKGllrWqJnIyhZ3/8z9wsJJhEBfxTzPSyUKKYTE12dq
 /BU+zDeR/KW8JuebAKhX32AoUckAq81mtgzwNUkr7YuEV2DZ1aOdmnCTGBbGOZp9l9qQ
 63Rysi4w3N6xliGozmtQqIbq6QSW2PDSbaPCq0ZzfzWOMop4BGkOANzlUwzm6c3BhptD
 2M/hZosOg/D7lb9hgaKHlo1HhT3PWKl3nvGTw67iZCBtSKwW/aXc/7iOuVaDXuphBRvD
 beIg==
X-Gm-Message-State: ACrzQf0xdsxLyeQVlckBMq+w1mntIP5pdKU79RYQ/K1wieHNsBXybAJw
 ygV/WkyPHI/s50qLCUSOMODV47uL1LeTskQhSS5U5Q==
X-Google-Smtp-Source: AMsMyM50y3W8LCrEpagsUmQpIeHc3uay72nsOyhb6GKl92eqwdTEBReqxJcYvfD3VHtM3Mj1FwF9sRygRANxF+2f9p4=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr16561518ejs.190.1664826687764; Mon, 03
 Oct 2022 12:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220915163437.2519754-1-weiyongjun@huaweicloud.com>
In-Reply-To: <20220915163437.2519754-1-weiyongjun@huaweicloud.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Oct 2022 21:51:16 +0200
Message-ID: <CACRpkdZn=Xpaa129M4i=zG-bF0fhGU8oUtpAi+3M6-560p0FjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Silent no spi_device_id warning
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
> SPI driver ws2401-panel has no spi_device_id for samsung,lms380kf01
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.

Yours,
Linus Walleij
