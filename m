Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F61D1A97
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 18:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE036EA71;
	Wed, 13 May 2020 16:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9B96EA71;
 Wed, 13 May 2020 16:05:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 8so11380465lfp.4;
 Wed, 13 May 2020 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/yS65XV/YtISiDaptac0FJiXD3Tn4ArFGdgQXRHd/aM=;
 b=PLKqSYSNicC0BUQNdjEBXIczUU2Ubmi9uxrakyohfeKedUu5pEjNXH3weTM/WNFlZM
 J0X0KiO9Umy3eAbZ6TSsOuO7vFxuUSITJmODaZj5uHx1byuQUI1JEpqZPhSadkgdJarR
 G82gO3AHOnSB1JJqvwQCpqXLG0u2HJHiRbmKYZ4qIqOmuO5YD4fM7cbjOKZifuhJ6kgB
 hBNPxWc05yFQjfYr36j97EXsX3A/3qHd/kwTB0qw4RjH/x09QeLmHlexCET4l5UZ3Hdq
 t9P2Ttw4nmH7TsI/0i0jzkM7qHcffz0O8Xh8NoHN8f9eamzTWS80bAo82wIrvz2gcFJm
 rhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/yS65XV/YtISiDaptac0FJiXD3Tn4ArFGdgQXRHd/aM=;
 b=f9KpAnjmHxsP9FFyqzonLna9FCYH6+S9WOzHa+R0rmvEAxed3I7tZ03dACDIQvi6HF
 b4MgfItA3YWRMYB1Ho7Qr4jmZtDEN0MTbff+iyETfixqnxNMzCHNyMODBKZO/cQzf9Z0
 /aQvGM1O7HQ4YH8U9u+YTFzvasmrbRM4lDGNQlf/gEMTZyyu/Rezr9x09XriT+WJ+PC8
 yRqtAJ2tYrrbvfd/MDD6cxW0loCT+vcGisTpFbgjlqkSrpRqN4Uof/tfUfSGNSyEKLAW
 kx78KCidoax9LGINJCyvJn68hDG1MwashqU/LonPZLNAB6SV3bMYqImBWrXiEHqhqXUD
 pjMA==
X-Gm-Message-State: AOAM530dQpPeMSfiRl/358zvUrU0n1czzCJHIalmi93eviaeCdkH78bt
 fGkePNCnhhhjcLlNYdmeaIvmxB3jeCzEZApD7gk=
X-Google-Smtp-Source: ABdhPJy16wWQDPJNS54OlcDRfVMpoO17uW3oqhASyCtXCLRYCkdn+EsWQCegAtv+YMXArpzHEQO/EEfoyLKS/V25tiw=
X-Received: by 2002:a19:4a97:: with SMTP id x145mr169435lfa.66.1589385952502; 
 Wed, 13 May 2020 09:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
In-Reply-To: <20200513150007.1315395-3-lkundrak@v3.sk>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 May 2020 13:07:06 -0300
Message-ID: <CAOMZO5CfPC_awoo4RRgOabWYk8WaAKJUypG8A=XeuThuCZHqDQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
To: Lubomir Rintel <lkundrak@v3.sk>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lubomir,

On Wed, May 13, 2020 at 12:08 PM Lubomir Rintel <lkundrak@v3.sk> wrote:

>         /* Get Clocks: */
> -       gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
> +       gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
>         DBG("clk_reg: %p", gpu->clk_reg);
>         if (IS_ERR(gpu->clk_reg))
> -               gpu->clk_reg = NULL;
> +               return err;

You should return PTR_ERR(gpu->clk_reg) instead.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
