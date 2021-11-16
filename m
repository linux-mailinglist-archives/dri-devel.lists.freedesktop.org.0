Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DE9452C9C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56866EB21;
	Tue, 16 Nov 2021 08:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CFC6EC4E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:34:04 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id a2so17547426qtx.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
 b=Rv9D8UmXSnZm8Bh1GoID8bVVWxDSBCNC4THC6v2fMK/Xjd292jrTfr7HPA60SNEtwN
 ZgsT0rxJwlV6MOX9Mg6pvUENSnqSy2PQ2g8jSGe+VqlgUmaWXSUfhPUZeSN4Fjajej12
 5XGHxJR8dHzi+y/D5OyS1PY3DAsZpFVkKp3/v6f/uQCqYI1Qr3yD9AkpuaeXc9VqfW+V
 M1x6wN6oOWmV11GcQr/YkSBk23I2+wU1hI/jCjuvcU38zE/cs/R7fEQsdfdOc5KnoW9r
 Rm7LflRIaRzZ6opJytsFOdWfMdhhaI2YGLSFevIBziJS5jOjAAh8T2jiE5v+PuwtXZTT
 AZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
 b=voIEBUmqyBTrA8ME5Uw7jfC6rkZSd1mxt8PNwnW7DBpcwDtdC2OsZV+RURVwanhFCq
 qVP6VT/+TW16sbWl29t5mrBm4eu6DFtIoYyoOvUQlYSFTt2XOLuobSALJKUJu9ir/mIc
 653c66d6cu2h0RKjk7cSUfkVfoJ6tT652dmrY7YNH7aw4J8u/poH18NtBnDLLn1+dF+B
 6zQkZ2N06T9swJ+ZadjXL9HjP8Y+CVdpF8Qlpc8LIX1YLT48PvOt8sxWHjU4wBZeV8gc
 Nn16NXQnbMVeIrWKfQVQt1GwiRsY3MMkuszXYNl3pjsR2JHCH16yBq4vuqosTEfMdKWt
 x6sw==
X-Gm-Message-State: AOAM531aGQ/nBNqpg/okQO+D0nmD9jryryFUVMllRB+GLILYmIy2sYl+
 cyPl/5+XkW0d4Wb3shaFH4uImStxO9+qJXaa8pc=
X-Google-Smtp-Source: ABdhPJxy3/yvIoE1Sby1RB+LrFWAG186ca20J3KfKBtNLU6iYwGxwglI0cKh7RVW16SHtAlV0ZDpZK2743We/bDxwtI=
X-Received: by 2002:ac8:5991:: with SMTP id e17mr3975451qte.344.1637030043682; 
 Mon, 15 Nov 2021 18:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-7-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-7-arnd@kernel.org>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Tue, 16 Nov 2021 10:34:39 +0800
Message-ID: <CADBw62oYab_d+uS_8kfC9JqhUxVhK79G4wbWyZy7+RL6P9tVvA@mail.gmail.com>
Subject: Re: [PATCH 06/11] dmaengine: sprd: stop referencing config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Nov 2021 08:22:24 +0000
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
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, dmaengine@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Nov 15, 2021 at 4:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> It appears that the code that reads the slave_id from the channel config
> was copied incorrectly from other drivers. Nothing ever sets this field
> on platforms that use this driver, so remove the reference.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. LGTM.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

--
Baolin Wang
