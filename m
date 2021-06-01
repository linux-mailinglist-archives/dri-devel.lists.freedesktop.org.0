Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12267397094
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 11:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8A96E049;
	Tue,  1 Jun 2021 09:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350186E049
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 09:50:33 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a4so18372639ljd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnmFt4XwQUKcx4IJmRCAthgHv5LUACn3U+Fwu25Js7c=;
 b=aPKd+bAHkTwTP01cYek7+Bdo+rXTayQz1zRB6eEALFMezelb7e82BExjAFOeeejzdq
 ws/A8bUZ2De8UzCq6fYw5D/PsJHGB6DTCBeh3IZoRNTFr7RgYmz+585Ray5hGzaI4B6W
 uX9o0kXBNJaru2FVmGcVZcyD6hIMA1RplHjCNbNs0LLsnxjaSGvvVRcrbRH2O3cEFBrl
 r95x6dtAoI3MhGJjtY9CZji46pYgi7sIoEq667MrsLPeHrMoThpNuSYAxvd904Qq5GZr
 sXK54t0z5xPm1FWZ7ZatzJ6scMjMoBxaANfcziAO70Wkbgj5NxfVAHdyYdKC+6xmuddW
 75KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnmFt4XwQUKcx4IJmRCAthgHv5LUACn3U+Fwu25Js7c=;
 b=A0LnXGjKSRcIjhef8oq3yBwdMnQWgGFykRspZw0Vcw/FghHzV9V7VdsdZtxfA2Ac6T
 3ueantLlhWlevCi52icg/3jFplPs+rP2rSNRRyDamyahchRBugcETkUJpKIUz/BJtMB6
 7kmZIfbS7HQfeHxpJJ7zW7JaBnRVQIDqJFX4p9mkcW28MllviyaRGe6UWQfS8udCb4Ue
 /4nmuZetGKiAzvxqqVEO1ovfCpI5cz1+2ttWye+nIxLRQuZIXClosnWBbp4kraMgrOYC
 6nSPgGCYSCULLoFBalEeCVZoQGKbyVapvBnMNrXgg2jU6k0hIHA77jqn1u0G1uTRGYn3
 8qiw==
X-Gm-Message-State: AOAM531eCCvAamD1hZ8NL6VoaR8OoKA6NZLmIX1zx5nivOnh6pFB35Gl
 l2tBffBeSBm0VQg8OaZp4ZRsc9MeX/jDfb5XAUehwQ==
X-Google-Smtp-Source: ABdhPJx8/Zj2BxR/sZ/EnlaXvY0EWyjfyiEWvjrTa3HdYrqnmgTykirwS+S5VIZPRFJYgIm1XkcOfHU/AoGUQqZAmjE=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr20402801ljt.200.1622541031576; 
 Tue, 01 Jun 2021 02:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210530194238.2172318-1-linus.walleij@linaro.org>
 <20210601083531.ed6d4h3fcikbqmnw@maple.lan>
In-Reply-To: <20210601083531.ed6d4h3fcikbqmnw@maple.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 11:50:20 +0200
Message-ID: <CACRpkdbWKkLLfnx4JrfLjRDVgNJ3f2oSTmAiLOr+FvZD1Gk+cg@mail.gmail.com>
Subject: Re: [PATCH] backlight: ktd253: Stabilize backlight
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, newbyte@disroot.org,
 Lee Jones <lee.jones@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 10:35 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

> IIUC if this code is prevented from progressing for 3ms or longer then
> we risk deactivating the backlight instead of setting it. Does there need
> to be a retrospective timeout check and recovery loop?

Hm, could be another patch if we run into it. Newbyte (CC) has tested
it and it works fine and stabilize his system without any problems in
practice with the backlight setting. I would say if users run into this
issue we can look into a timeout-and-restart loop.

You can add:
Tested-by: newbyte@disroot.org
after discussion on IRQ.
As this makes things not crash at least.

Yours,
Linus Walleij
