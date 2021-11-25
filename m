Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53745D622
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 09:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352E56EC34;
	Thu, 25 Nov 2021 08:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBCB6EC34
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:26:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08F4561163
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637828762;
 bh=u4vZvOVOvJSCMC746/RK7I5lvy59gOAI6OaKWr4pPEo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YxUdPKHuWPnWu5BUFtJ8tRPLFtYj7VzYVbl2eAKK6rpVUKBVJUYRrzant07c47iXy
 1Th0ENuToBGAdIzyyGOeLp2GFjzirj+J7nhnjZVQeY3Ovlfx+w62ZAuP7+oRmhNc8z
 c21O420BuxGBEKzWlQM0lo/UA0CIaRZXCp/L5+HC4PO8OtHQlym4kSKATHhQ7ZdO9u
 BkDOIx7fwjyxXRGj9E/cHkBl+IAWxzr2RMFvJ1cl3yxKEZT/Yyoz/WY6hacZXwDuqx
 tPpt0JLsiCnN3YWjwo0tlRVzeEZEEdxgsnOXzTcTEjaeKwcUTti9i/GQeb6mBy3L0i
 oU5G/bkya001w==
Received: by mail-wm1-f48.google.com with SMTP id o29so4820113wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 00:26:01 -0800 (PST)
X-Gm-Message-State: AOAM530fyrz30l0HobL+GfPPjgaAWeBpfCcwmWfT3PIaJ1xPZC4pHG20
 SX82Bc2QgDMPjz73ii6KKSU4AOyKZJpyrEI4bRs=
X-Google-Smtp-Source: ABdhPJy6foEBtvTrMw2IiNDwnqT6LrlvOZ5dh+nV+5ANTzOv/KSjYNBzI3JdqYrvuqNPFDqYXIA6Rrm24+G/p6n3bl0=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr4817606wmi.173.1637828760332; 
 Thu, 25 Nov 2021 00:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-8-arnd@kernel.org>
 <202111251538.x6sJNCka-lkp@intel.com>
In-Reply-To: <202111251538.x6sJNCka-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Nov 2021 09:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
To: kernel test robot <lkp@intel.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, llvm@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>                     ^
>    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>    ^
>    static
>    1 warning generated.

I noticed this mistake slipped into v2 as well, the function needs to
be marked 'static'.

Vinod, let me know how you want me to address this. Should I just fold
the fix (see below)
and the final Acks into the patch and send an updated pull request, or
do a complete v3
submission?

      Arnd

8<---
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index bb338b303af6..65697bee4db0 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
*adev, struct adm_chan *achan,
  *
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
-struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
-                              struct of_dma *ofdma)
+static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
+                                     struct of_dma *ofdma)
 {
        struct dma_device *dev = ofdma->of_dma_data;
        struct dma_chan *chan, *candidate = NULL;
