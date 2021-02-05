Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D09310378
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 04:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7716E15C;
	Fri,  5 Feb 2021 03:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B83A6E15C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 03:22:57 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b2so7892522lfq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYGMAdaRz8G1QUdS9+LomG6wtHz0qQi99/eTTuMLV+0=;
 b=PVxXtXQm1aaPj2waPcQs4ix9Bk5HSRPL2f1MRdvQEN+DLrNMyquKHETL7oLnXuqaWN
 roKK48mu1GGBOXGm8z4xWdkYrbaRYKbg4xIvSxE7hLXF8EFVmoM7lqN5w61uA/8nT8W4
 g2EIO7G6pUlDcN1cFUCs0DjMuuyozCl0vnwtXkKMJo2gmkqfDj9m2nXwSEGFmOo7vB/Z
 XPK4g6IR7UedjCT5GuZDHzKAK5mkrS/iyqPcNwdncYF+Bsn22yJl3L9FhcaoIyx/JN+c
 USX5su+tObyja9jTQwQ4pBo7KQ3uj+gxN5OH2JhYNz/UfDObsMP6/ecE8tiQ8dx+VpVd
 gzYg==
X-Gm-Message-State: AOAM531puqo3Yr1vC5VYbz2utHGtBZJlIXcUs4giUFhsIDmi9Nk7UR8w
 dYlN63Rj3lhYY6ha/UglUwHG4u7MZ4zI2g==
X-Google-Smtp-Source: ABdhPJwNUBAYumKkd6cSTkq0GxTc67te5NtOwUfmhjJeS/rwIM1tESRDljbkIW8Me/OZscOpe0NaAw==
X-Received: by 2002:a05:6512:39c9:: with SMTP id
 k9mr1327511lfu.432.1612495375579; 
 Thu, 04 Feb 2021 19:22:55 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id 76sm843802lfe.50.2021.02.04.19.22.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 19:22:55 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id v24so7831809lfr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:22:55 -0800 (PST)
X-Received: by 2002:ac2:5f56:: with SMTP id 22mr1458557lfz.296.1612495374946; 
 Thu, 04 Feb 2021 19:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-4-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-4-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2021 11:22:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v6524xO6dLnW4mKBjgfFkqbydPDmxJopqkZ53=uXdo3rCw@mail.gmail.com>
Message-ID: <CAGb2v6524xO6dLnW4mKBjgfFkqbydPDmxJopqkZ53=uXdo3rCw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/sun4i: dw-hdmi: always set clock rate
To: Jernej Skrabec <jernej.skrabec@siol.net>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> As expected, HDMI controller clock should always match pixel clock. In
> the past, changing HDMI controller rate would seemingly worsen
> situation. However, that was the result of other bugs which are now
> fixed.
>
> Fix that by removing set_rate quirk and always set clock rate.
>
> Fixes: 40bb9d3147b2 ("drm/sun4i: Add support for H6 DW HDMI controller")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
