Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC21251DE4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 19:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE576E3A4;
	Tue, 25 Aug 2020 17:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C226E3A4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 17:13:48 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v12so6640151lfo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmhx6cpGhVp1WIBIIHMKuQkXRK3VAnYujMnNnykTaps=;
 b=CKrAEEZrHc/JAqMwcZM/5GaMNrlZzXodUQOXN19nyD5f9AT2LlWuwA54RyCvxsaciC
 j99hbNWg4vzZLvyQ9nhsxKcaULjvaIyPwK2m5TMXbElQmfKHB1HXGzlucUcGnjuhUSmb
 9oYmIBElFMhRRn+z6qVqRnCijt/DM7N50pQD8iEoPEOwtMjKtgDpUuEJjW0vInnhbFbg
 k5pVB4gKjPfZarJK6S4S50myQE3to8G/mZbT4czZcvx2tM9bK+4s7kCeehSX/18q2lLf
 aSEdvVuA7Dp4xNN1AJz7gjq97fLOLsJvvSqMQCfp1S/nLBW5WDC6osrOcNL7BS9v0Gaq
 jRJw==
X-Gm-Message-State: AOAM532/DlXl8LfNmi32/aujfYXuc873qTxVXSmCqwT40J/de+ChOF9c
 fqZOIvL3B5FoHlFaJyNfm5iMKWNYYox8WQ==
X-Google-Smtp-Source: ABdhPJwNx4Z5uIsT9Rbz7A2XQYlsYXlKR9qJVvTrPodnlevDXKGLr3JCjU3OQx4/lsw50OL5tqi0/w==
X-Received: by 2002:a19:6e0f:: with SMTP id j15mr5303270lfc.112.1598375627098; 
 Tue, 25 Aug 2020 10:13:47 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m15sm2949164ljh.62.2020.08.25.10.13.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 10:13:46 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id m22so14698642ljj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:13:46 -0700 (PDT)
X-Received: by 2002:a2e:b8d6:: with SMTP id s22mr5567351ljp.273.1598375626405; 
 Tue, 25 Aug 2020 10:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200704133803.37330-1-maxime@cerno.tech>
In-Reply-To: <20200704133803.37330-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 26 Aug 2020 01:13:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v65aFX4jEdrJY==GGQxvB0qzKmNNEi0a1m_3H7uYF5F1uA@mail.gmail.com>
Message-ID: <CAGb2v65aFX4jEdrJY==GGQxvB0qzKmNNEi0a1m_3H7uYF5F1uA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: lvds: Invert the LVDS polarity
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
Cc: Ondrej Jirman <megous@megous.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 4, 2020 at 9:38 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The LVDS controller can invert the polarity / lanes of the LVDS output.
> The default polarity causes some issues on some panels.
>
> However, U-Boot has always used the opposite polarity without any reported
> issue, and the only currently supported LVDS panel in-tree (the TBS A711)
> seems to be able to work with both settings.
>
> Let's just use the same polarity than U-Boot to be more consistent and
> hopefully support all the panels.
>
> Cc: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
