Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16594EEB04
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF36B10E3B3;
	Fri,  1 Apr 2022 10:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A09A10E3B3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:10:31 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id p25so1672752qkj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsUIHTEkEX4dNPNs4mJuWVn9eB7wmeCMVszwS4PG+T0=;
 b=1i62CfN6puk2l/umbrv4rWIiIWOFMK1kgowUOpV9YloyhrzJbzKchSMGaVQeQpwhJo
 bTrRPHj2gqm3xKEoxQHeeJJ/NR652X7RaSAmmp85HFXNVA+7bbASMyqFCak653bJmLCN
 eaRibX0URdggtwqPtU1Zudy7JvR1gNMWQzqzMm+MxUMMNyieuSNdeg+2ivPJJq9onrHB
 Vp1biXpQ48VHyl1m9fKGggpu6tR86z+pxd4QALkKNSf19JZDCt6FQlvDgHTD/nvEeCzE
 O4Em5SgPT9YRx3fqHlmtsZh6IFGYj+4JQxRtK57grskA8lQAUlQn03yPsgNWGqRGvPfZ
 qNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsUIHTEkEX4dNPNs4mJuWVn9eB7wmeCMVszwS4PG+T0=;
 b=xd1ZYfNDjfB9U4qmxgaujo99u4Xy1WF6q6/pLDFoIGxNqKXeL4SOyRXj9QxE1MC8h5
 ZBnVtRtpI+rI8mb2yM/WFuWAhSznR7Gha4eLmk/pkK3wEasN1HaBFSAZgUfGItIad5mK
 qvg0dZoXnBX+HaYi74OXrBcX8coUYAeNEfBEnik1sPXm2E2OX2zueP4FblYGmW+X/HqJ
 f0gmmeHYEDr8NUq44AVEkuevk1zVaehcpCZ/7wrVxePc7CKlFsOvofOwrSxLmLHB1sqZ
 vfWKsgnkYDsTH3J1TH0X2A+l4RRESTUsH9MHnY1s6cs0t92nVuH8ZUD54IB0QU2Swsi5
 7TWw==
X-Gm-Message-State: AOAM5330bmn4cv3tvt4In4YoJemaan/9Tvmx7bmDBSQq24Xmogi+1Pgt
 0aV6GRwJIdW4Ttts8UbJdmI2/90hLuB5M8V+lETslA==
X-Google-Smtp-Source: ABdhPJxt/76dG0Y6LgNpzsQV9mOqe9cHsfLvhC1TBXpD/vUZKq0hL7o05A0RxPOjktM8zN0QsJ2TDdEIJz1/DwFpbfI=
X-Received: by 2002:a05:620a:6c4:b0:67d:3912:ea39 with SMTP id
 4-20020a05620a06c400b0067d3912ea39mr5960625qky.447.1648807830299; Fri, 01 Apr
 2022 03:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-5-wens@kernel.org>
In-Reply-To: <20220330190846.13997-5-wens@kernel.org>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Fri, 1 Apr 2022 12:10:19 +0200
Message-ID: <CABxcv=nLQdz9bVrfqw1MaKREh0uRBvc4wX14AORETaDJAin-Fw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: ssd130x: Add support for SINO WEALTH SH1106
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 9:09 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> The SINO WEALTH SH1106 is an OLED display driver that is somewhat
> compatible with the SSD1306. It supports a slightly wider display,
> at 132 instead of 128 pixels. The basic commands are the same, but
> the SH1106 doesn't support the horizontal or vertical address modes.
>
> Add support for this display driver. The default values for some of
> the hardware settings are taken from the datasheet.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/gpu/drm/solomon/ssd130x-i2c.c | 11 +++++++++++

Thanks a lot for this patch. It's very nice to see that another
variant of the OLED controller is being supported!

I wonder if we should also list SH1106 in the
drivers/gpu/drm/solomon/Kconfig file so people can find it ?

ah, one comment I forgot in 3/4 but that also applies to this patch, I
believe the convention in DRM is for the subject line to be
"drm/ssd130x:" instead of "drm: ssd130x:"

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier
