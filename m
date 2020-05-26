Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB921E1C7C
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193F76E112;
	Tue, 26 May 2020 07:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E426E112
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 07:46:45 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r10so9602167pgv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9hP2gJKDW99uKK2ci16iXnlfh+TatIfa89bbfH5MoI4=;
 b=IhzaWHQ1IZn6kk5fS4iMMRliwb3dMakoIny3kYQoKhPJfWBCrUDuqY1zF35nu+X3uM
 IIMZHSik2wI24wf1Rbv55Zfau50NYOZqwT5E3HJ44qFUyMAbvbwjtiMrX7FzQXecd9kx
 lGIyMAkM6o6NpxpWeGv6qArvRioOMHh8MYr9HAxc+AY0J3ndgjB/AAgwouQuApmwW/2x
 0i5kA8i2KdLS9Cry6afAJIVKO38W+8pxUNG0/aCJmn9FuhIrJGeaz0t9TNXu05wmWp60
 LvOyWZwuhdmVr8GBpjVVjopbyWV+x35/HsE+p0t5/nrUupNP/bELGe190S/g6BN5d+FF
 rd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hP2gJKDW99uKK2ci16iXnlfh+TatIfa89bbfH5MoI4=;
 b=b4PKjKOFosTHXwyreC3g6owIpK/EleaLEef2vEjKcg2hPe5WERU8O8yk0i/HlH1JEE
 F/3BOjNMsG2Lsa4sQrfSwHzAse3wHtuX/McaK0S2J2XxDPU4uMGeFImYvkEodTIiCb1F
 ey2et/32FD9CQSBkwCOLLgM4rKI0Pz3wY+JM3C6I5p0fsbVxaRPzw+amrnC+BoG3mmXN
 L6SOn94GAaOM0vpsPwDHIYj/nQ+0iuWTtTgECG/joXwH9ZqlCvWi938rH4kTg14ojr1v
 V4Pl5XqGviYqB4f6rdVUdze08mFE3Z61ca3/miyaydu4rzbThYhdt+yaxBudG/08No6f
 lZRw==
X-Gm-Message-State: AOAM533HOxbZOep6yoynagMVf2sGQq6EwBHakXY0OGp53vSROwJQEghH
 zfmdW/Vimc/v7eCuJDEgA8XUe+rplryxPhJcTPI=
X-Google-Smtp-Source: ABdhPJyxzAObFo2fGXgOG0DTaZEGiMDEiM/XhPzUWJLhBUpA9j5+1D9nbFN8JF/guHMeGKz5o2jOHBt1rP1W7jAGnnM=
X-Received: by 2002:aa7:99c8:: with SMTP id v8mr17942364pfi.36.1590479205218; 
 Tue, 26 May 2020 00:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-7-git-send-email-dillon.minfei@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 May 2020 10:46:33 +0300
Message-ID: <CAHp75VebSZa6mwAETnM0t42RQCp4iM6_SNjmy3TB48ixsGKV8g@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] drm/panel: Add ilitek ili9341 panel driver
To: dillon.minfei@gmail.com,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 6:46 AM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
>     This driver combine tiny/ili9341.c mipi_dbi_interface driver
>     with mipi_dpi_interface driver, can support ili9341 with serial
>     mode or parallel rgb interface mode by register configuration.

Noralf told once that this driver should be unified with mi0283qt.c.

So, what should we do here?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
