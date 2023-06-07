Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA4725474
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12010E433;
	Wed,  7 Jun 2023 06:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094D10E433
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:39:47 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-565bdae581eso86248287b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119986; x=1688711986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9L06aF4LwKWj5hfdOMd+MrYkDeMA9aJC8eR6IR8Wfw=;
 b=n7UlghKU7iVC4sUgtzuRUGh5Sqy5kuvOGWOJXgUYkxlT5OJU9e7g6csIyCdV5S7Dl0
 RcVzhuTakyeOs9AiNq5QE8rMSiABCJio9m9renL0jgB1/Ivt2muwRWvRbyoyw5917TB6
 xbQrA+15xwUOYelw/jj0xua3r6VrOH/7+eZ98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119986; x=1688711986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9L06aF4LwKWj5hfdOMd+MrYkDeMA9aJC8eR6IR8Wfw=;
 b=hD6HuagmsnCU0uGzKL/gGiyuhoVK4xhV95m/YZHCxCqTq6xZWhOg9nE/2o/OaloF0H
 h3Dd44v6HtKRL/nT0qIAWJlJlR5ynr4QhUsnkQIzLiuAc+a/RLZDAz1tzmBktJ+k42jd
 rmkY3ke0PBCom/rP60yMqM0MiyGBaoscOXi2DGFvxzK2Yp8T9SxzZK5S0kbKmeOYyP5k
 xNLQuSSujC2yHsh/2UczQfEj48UZlK1b/ynfhfq2c2ri1N4C/6evdUbLUR1MAYy/woxH
 /ki0orWAkIY62At2ZdSN0ET0/rTNn6oyuqALYpTXByzd8n/f8z2rPsldHwF8dSXg30Q1
 +fPQ==
X-Gm-Message-State: AC+VfDxuOdBt5ZAxH1thq3jpTYCGeD/RYhkk3F36EaHqCfV/LS25h6NN
 cnh/4oeY9m5hv9+JMt9mZzwGYNfgkr+9iFXI88M3Iw==
X-Google-Smtp-Source: ACHHUZ5MLUcNr10jCCVCPftKZqMlEQzEGS+hleq7z3iUEO2rU3lYS++w6zXNkmIERoJeKf8bE2U2hR1toHG8B8bERJQ=
X-Received: by 2002:a0d:cb01:0:b0:569:16a4:392f with SMTP id
 n1-20020a0dcb01000000b0056916a4392fmr5177520ywd.41.1686119986439; Tue, 06 Jun
 2023 23:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-6-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:09:34 +0530
Message-ID: <CAMty3ZB7Xnd3kp+1Cdxy0GzPCyZKEOz_jj5b8wBzRCtLSXha+Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 5/6] drm/panel: simple: add support for Rocktech
 RK043FN48H panel
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 kernel test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 7, 2023 at 12:01=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Add support for Rocktech RK043FN48H 4.3" (480x272) LCD-TFT panel.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306020343.jNTWeM0P-lkp@i=
ntel.com/
>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
