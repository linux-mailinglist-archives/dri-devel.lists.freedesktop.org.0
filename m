Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA7674069
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 18:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987C10E9CF;
	Thu, 19 Jan 2023 17:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8A10E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 17:59:11 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id e130so3553085yba.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FOB72L75kaXcfttasRM4isMQGOgu0vhdc6xDEfltXi4=;
 b=UcZGizbHQPhN5XlWcZLIoend9g0Pd/2lt3awrzLsp/3tWRFHIIT80h1mn1JZWltiBR
 r+LpABSbs0p0J0nSev2xzxqf6/Kdov6cR5Tw7yBjsEYEsS2fhsq55lVhnIROce8xFRNa
 kb2vzkTRSTLZe04GJ03bFPELvLdss6ByDjW6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FOB72L75kaXcfttasRM4isMQGOgu0vhdc6xDEfltXi4=;
 b=GbyL+dfk/G3kwjQQkhb1QNVmu1cryQKyL3SayoB+M9EoQNLhdRXvGoqjYXVh7ZIHTb
 1JCVbuOqUfd4EuM4/Hdj+xMY2A7WQJ1h5rOPCJLQQy7v6sQ1FTAyvgC0ksDCBtekDMjJ
 XdfCtCSi1qiM0s96WQZxw+ITagqEB/AgZWKWmy1JiU84UvbvDpYO/mv5kdfK4vQFtWY7
 fCSnJpD1j05JDnfjQm4UIOz8+WQIZplPs7uPS6pSo4KnrEMLu15i3badiWpzup2E31AE
 PGbmLdp+9h/uUC+jvANYWrmowUatG9VMtSUiQ/ejEWJHkbN8SFwdAqAL9KXJosqrAjr1
 wDsw==
X-Gm-Message-State: AFqh2komyHHip16YCsCXmiqDBo3W4ppeG1qVFNuBBBeNCjDvlosJCzTH
 8u5f3OHQD4cN07M8TN+YaaYKHht6m4B5wxk7rTY6mA==
X-Google-Smtp-Source: AMrXdXuF9zrLNubB1uj9LLnW9ShFQMDII+h2HV7IuRhlB+d1jfu3knfPe6TAk54PczHt/7M4DvphFWwgzpVPmg8OY6M=
X-Received: by 2002:a25:b6c2:0:b0:6fc:c36a:1d06 with SMTP id
 f2-20020a25b6c2000000b006fcc36a1d06mr1044577ybm.462.1674151150523; Thu, 19
 Jan 2023 09:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
In-Reply-To: <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 19 Jan 2023 23:28:58 +0530
Message-ID: <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To: Fabio Estevam <festevam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Thu, Jan 19, 2023 at 10:57 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jan 5, 2023 at 7:24 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > Does anyone have any other comments on this? I would like to send v11
> > with a few nits on v10. Please let me know.
>
> What is blocking this series to be applied?

There are two patch series prior to this need to apply.

https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

Regarding this series, the patch 09/18 commit message has "FIXME" this
need to remove.
https://patchwork.kernel.org/project/dri-devel/patch/20221214125907.376148-10-jagan@amarulasolutions.com/

I think it is possible to remove it while applying otherwise I will
resend this patch alone or in series again.

Jagan.
