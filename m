Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247004D30B5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081EB10EC13;
	Wed,  9 Mar 2022 14:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90B810EC18
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:01:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so5280057ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yYqFEN1FnQAgEb5YKr6THudCZpXbocugEl69QngwaUg=;
 b=ri+4tR2n4dpV+2HFgPopQbVC9FmEBqDxWAQU6BGef9TsqP9OUlw3pwhNfCK64G4Rqp
 6uamobVWxozeM/2Q86G734IWpE9HlU/DclovS6+qCbNQ4P11qx8zHZMWLnezfcfGzoie
 21s6dHrOspR87j0Jpgtd0Bnnv6tIlqlfq/BIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYqFEN1FnQAgEb5YKr6THudCZpXbocugEl69QngwaUg=;
 b=SIz4ypAHN+LWRcA/bmjBlzPqZtlQQu7O6oikRCze4qbVu9ufp2BVnUEy2xOrJNpGiq
 ffAEgdA2iEm0jZ/ok8wqymTzumd+ElrRoSrbCmh+Io/mBJCz9Ue7fJ1preZcSJ9UiNqJ
 VNs9I3yeAXQn+fCbPDa3vLMcjEy9Gb7hzLPr8vlSlrPVDFdWwg0VYma86ow2uRbDuWSw
 Y41rbqZKJm+D/vNF63fXewIQB67UWmXKqCpSQ9CVmfXZqXGfXuiMECFMXDjXr7LaemiX
 sWF+H+HQql1rmsPW4H8sWz6OixqRWQSRbFusnPKETy2oELWFU/ll7OGAoKP1wW9cVUen
 I2eg==
X-Gm-Message-State: AOAM530FBhuAunI3VPEg3XQe0TdD8f1Ui0bZQKRj28AGlygmqIO31iAi
 JGW/Svy4av0IWQ6GvXef3ydavXcnTwaxrCFsXhn/jg==
X-Google-Smtp-Source: ABdhPJyYNYmAKjFCUDPd9gUJhEZUGKwASkOvY43lea7OA2YWdt4BhY1IcdPPl6+rm7ciybHcbs2aBSvSKxvtJk/XMhw=
X-Received: by 2002:a17:906:1e91:b0:6ae:99d9:93b1 with SMTP id
 e17-20020a1709061e9100b006ae99d993b1mr17799826ejj.111.1646834505743; Wed, 09
 Mar 2022 06:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
In-Reply-To: <c13b6b1e-04b2-b013-7cdd-dbf960808ea5@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 9 Mar 2022 19:31:34 +0530
Message-ID: <CAMty3ZDwp=H2qasdPxLXNo6XcmbYGcMyf3+KeOus6NDrdth9_Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm: exynos: dsi: Convert drm bridge
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder,

On Wed, Mar 9, 2022 at 6:54 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Jagan,
>
> Am 03.03.22 um 17:36 schrieb Jagan Teki:
> > Updated series about drm bridge conversion of exynos dsi.
> >
> > Previous version can be accessible, here [1].
> >
> > Patch 1: tc358764 panel_bridge API
> >
> > Patch 2: connector reset
> >
> > Patch 3: bridge attach in MIC
> >
> > Patch 4: panel_bridge API
> >
> > Patch 5: bridge conversion
> >
> > Patch 6: atomic functions
> >
> > [1] https://patchwork.amarulasolutions.com/cover/1839
> >
> > Any inputs?
>
> Thanks for your efforts. I didn't follow the whole history, but I'm
> looking forward and hope to see upstream support for the i.MX8MM DSIM in
> the not too distant future.
>
> Can you give me a short update about the state of this patchset? Are
> there still any major obstacles?
>
> I can't help with testing on Exynos, but if you have the matching
> follow-up patches for i.MX8MM support somewhere around I could do some
> tests with those on i.MX8MM.

Unfortunately, it is getting slow due to existing exynos dsi drivers.
Idea is to push exynos and then move the bridge as per Mailing-list
discussion. I have initial series to support i.MX8MM on linux-next [1]
which is working on my setup. However I'm waiting for this series to
move further to send those on the mailing list. Indeed I'm solely
relaying on Marek testing to move further as I too don't have Exynos
hardware to validate.

[1] https://github.com/openedev/kernel/tree/imx8mm-dsi

Thanks,
Jagan.
