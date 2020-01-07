Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B178132888
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 15:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB796E0BA;
	Tue,  7 Jan 2020 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786C6E0BA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:13:08 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t17so50471352eds.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 06:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzbQTQQ8YrGcCU1DHCvXvb8FijYzGpFW8q4kbWunqlw=;
 b=ufp3gUtOj/3teHXC58yTZGNzoFherd49i3ZMSiQzX0SaW+D46WN/dTIQW2Ka9TxPdR
 0Krpw8gzFsTFk1hxZJP8wZgmt8zo5OYzqwADnrfJU+MhEiYoblEmsF+1AS299kMhAco6
 KteSBmZ7G87mpLNZ2Ip3YgGRTDZ5ICbZdu3Tm9lXMEb/xhyrt0qEsqztrkxOA0ZOOYfa
 nQcHSXsmPojmUvBw46JNS0diyMaZ6ULJHszhptnW/IFeDLLQjiWLQ7hg4XzI5zogwuPV
 VFqT+4JJz+83+zkf4ckbFB+0w1Hh8w0+eGOkDPzCHZaGYn5s1vKAkef/zEX7ZOt5Aj//
 7KOQ==
X-Gm-Message-State: APjAAAVs+vCxnEI+jf7t2+DuU/vViZaYerK49DXzy8k9O0Fdoo807yOP
 LNOHFjCXSjml7DoH3ZRBCNya9yS2Sds=
X-Google-Smtp-Source: APXvYqycqZWg5SHUBUDGN+xpSCdXfXslTPf7w3yENtR1BdzkoF2VNkAij0f3FB8gSPgRjjRVVz0WRw==
X-Received: by 2002:a17:906:9603:: with SMTP id
 s3mr114154881ejx.116.1578406386249; 
 Tue, 07 Jan 2020 06:13:06 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id m5sm7435231ede.10.2020.01.07.06.13.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 06:13:06 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id t14so19549117wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 06:13:05 -0800 (PST)
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr37961855wmp.109.1578406385556; 
 Tue, 07 Jan 2020 06:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20191219092000.949052-1-maxime@cerno.tech>
 <20191219092000.949052-2-maxime@cerno.tech>
In-Reply-To: <20191219092000.949052-2-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 7 Jan 2020 22:12:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v654ZSVKsKD2ndcXmbmdc57YtSMMBF1EaxY4+TPV5=Mz_A@mail.gmail.com>
Message-ID: <CAGb2v654ZSVKsKD2ndcXmbmdc57YtSMMBF1EaxY4+TPV5=Mz_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 5:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The DRC needs to run at 300MHz to be functional. This was done so far
> using assigned-clocks in the device tree, but that is easy to forget, and
> dosen't provide any other guarantee than the rate is going to be roughly
> the one requested at probe time.
>
> Therefore it's pretty fragile, so let's just use the exclusive clock API to
> enforce it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun6i_drc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
> index f7ab72244796..ddb52da90103 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -57,6 +57,7 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>                 goto err_disable_bus_clk;
>         }
>         clk_prepare_enable(drc->mod_clk);
> +       clk_set_rate_exclusive(drc->mod_clk, 300000000);

I wonder what would happen if this fails...
>
>         return 0;
>
> @@ -72,6 +73,7 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>  {
>         struct sun6i_drc *drc = dev_get_drvdata(dev);
>
> +       clk_rate_exclusive_put(drc->mod_clk);

and we try to do the put regardless...

ChenYu

>         clk_disable_unprepare(drc->mod_clk);
>         clk_disable_unprepare(drc->bus_clk);
>         reset_control_assert(drc->reset);
> --
> 2.23.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
