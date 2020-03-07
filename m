Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB517CEAF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 15:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9FC6E21A;
	Sat,  7 Mar 2020 14:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975B6E21A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 14:29:34 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i10so4136546lfg.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2020 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0gth9WnIZKifidY8zRL9+Z6kQvOSg8SJ87cLGODnOlY=;
 b=ETCpnEQ66X85UPcwQDymDUWnxowB4eQ9XCHVSeL4X+M5rE28+uVc8/FD3ls4aLlTaJ
 eXUs9yPDz7CKA5az6dx3s82S7XNWyE21TurmsaI1zdYOjpG+hLuLdzXiQYEZkPw0fY7y
 kRHbvOqM/8CMNuXIwOJtDfcDynQOUpioQ5b6Pn9LgOtyjqjRfBhk5Y3m/m3gD8R69v+q
 KAEz3vc1j750gYHeBJ3Dj9YB36PXbWdhfdmKLNtNNa2HQska4OQPqDXMGhVtWTOrGyYg
 OAgXPmUnPLb7FTejCwdz/vUtGvRGkZiHD7aWKU96vo8mFZl3BoNPKC1SXBoS6q5T3Eze
 lwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gth9WnIZKifidY8zRL9+Z6kQvOSg8SJ87cLGODnOlY=;
 b=eF6uVz+mE4t5FbDMP3rt7GZBPjOMZMFJMCmoIYpXqXKGKHAVVQ8L9cPrHiuNkN3p2+
 tF9dQRWk3aZ8oFtLHs94AuwV8NbAer6SMRf5eZqE51NMarAe3q9D8K09k8Fdj9vkX4cv
 E9SWSJgjjgWAKHKUNqe7xr473Z07GMHn8yr9SFg6LKsk1P09rnMvvayg7dczBlmFxJtV
 WvcAedGr6ryiaiqG2ZLZTWdxsD8FqyRNiNNklHfoXCyS+O38Vi5qOWpwcJLaAMmBinvK
 4nKHny4AUN6tqrP/kZkcTCESeqNyEtlTVlw2Q+pf36YTzul0+gGenLqGXMESSdXbkXuP
 C5aA==
X-Gm-Message-State: ANhLgQ231OGOyxTlmGfKF4wd42x5UskTSqPvDE++M5CaXrmqn5/aHel7
 wNkiWd+HUAqnXf0WMEYGWLryMpNHRezgE8BiGtKSKw==
X-Google-Smtp-Source: ADFU+vvulJpzwW4dwPlwEGiBPD6/xgPPJ1JBjAsUxIfOYpCdBaXBPmiDGACq5QBnT15Pl8uUvWSnqTavTKtxpRzGpPY=
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr4663459lfz.194.1583591372477; 
 Sat, 07 Mar 2020 06:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-2-ville.syrjala@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 7 Mar 2020 15:29:20 +0100
Message-ID: <CACRpkdbwe7Q=8-SfS7Y34tCW=km0j3=5Q9zTFXXn3_A=7jBZOw@mail.gmail.com>
Subject: Re: [PATCH 01/33] drm/panel-novatek-nt35510: Fix dotclock
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On Mon, Mar 2, 2020 at 9:34 PM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:

>         .mode = {
>                 /* The internal pixel clock of the NT35510 is 20 MHz */
> -               .clock = 20000000,
> +               .clock = 23581,

I double checked this with the datasheet NT35510 Application Note V0.07 HYDIS
and all documentation is in line with the comment: the internal clock
frequency of
the dotclock is 20 MHz so this should be set to 20000 (kHz) sorry for putting
the three orders of magnitude too big number there :P

This clock isn't used by any drivers because this is a command mode DSI
panel with a DSI link clocked from the host. (hs_rate or lp_rate).

The internal formula shows how the actual vrefresh can be calculated for
the display in respone to setting of the internal registers, see page 34:
https://dflund.se/~triad/NT35510-appnote.pdf

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
