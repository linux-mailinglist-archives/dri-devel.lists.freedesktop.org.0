Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95A242610
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576696E8BF;
	Wed, 12 Aug 2020 07:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899AC6E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:30:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so629915lfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5FdXAIZx+ZP41PS8ejWt0zp2dMev1+Pg53fxOJb49go=;
 b=zdy95b1kTPcTbrYCuGrt2C7Mi8xpkU0SHcP3cHovIvD8Rf8PcG/9Y4VLbg39S9gweq
 FxEP/lmv6XHHGIgWcfar5m/IGWRMciwaw2f62Xezz5t/KZZ1tU9gOdsRk2p+FOQ+vKUb
 9P2pGawIOuIANgF0+HWyVLwfTgOpI31SsDgCWY0rjzD1XpQ6R2NmtxWpnDO3JGXpcUaw
 2MXLfuQl5U7csaDC7/5zEvjZX+YywjdEWnPa+z7gF5q4zFjRxTGoJM4huW5c6humymcO
 r4BbIxlPHUQOk9R+nJdV4AAUKhqpeiHazJbNaf+Atp+blNAiOqI2RwVZ8M47yqPt7YQy
 NT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FdXAIZx+ZP41PS8ejWt0zp2dMev1+Pg53fxOJb49go=;
 b=q039x4oUCmKyalKfcKowEy3DsRVvZ3E87d9aSSxRzr9WnHXqi6nC/o9GVFN8GLs1wd
 xv3huoHyL6Snyp9XGA1Z4Wc985uxJvYFh+NvsGDdjev6qzkjpyhSqAUL5g3JuXuNxVK3
 U6rviYqK+hhXp0XmHLiWxiqogxbm1YoPcU1BLTr6LHn21Sw36q+5vMWaiDnnl7WowIF2
 SudNhyVJ0amhK0RLJZ814KO0cJor26gkxS6W9jgF/Btbse6Xib3a50iaavj6tuyazra0
 YAl0NGxkdNfBt+a7p2Phk09/I1THzPubKktBosJiNLNYWtZp8cO1CFDkWNHi+Du2Ls6S
 dI0g==
X-Gm-Message-State: AOAM533F36OYpjuxJfoRlUSYYaPvJBiXzGXpJB23x478r+Mn/vCViU4o
 qieXOZe3IFQVPqB2fV1ik2Or4VpCgSvH0wlc95zn4Q==
X-Google-Smtp-Source: ABdhPJz4sufS9uL7t6Eocg+3nINh6YsIEewzxgjPWMWJmSeXpCf0IVIfT6TSWwDe2md+cFp4whCdIXttT1Jknix5buY=
X-Received: by 2002:a19:cb53:: with SMTP id b80mr5027209lfg.77.1597217428378; 
 Wed, 12 Aug 2020 00:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721112841.jxocq26yxhwy3gag@holly.lan>
In-Reply-To: <20200721112841.jxocq26yxhwy3gag@holly.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Aug 2020 09:30:17 +0200
Message-ID: <CACRpkdZF5i8e100UG5aM_WmMRXvfugjB8KOr+AzXVnMJxJhkvA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 1:28 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

> I'm a bit sceptical of having a max-brightness in the DT and a driver
> defined lookup table in the driver itself. That doesn't make a whole lot
> of sense to me since the maximum brightness here is basically relies on
> knowing what scale the Linux driver has opted to implement in its tables.

That's a good point.

> I think there are two options here.
>
> 1. Throw away the brightness table in the driver and expose the hardware
>    steps directly (maybe using allowing properties such as
>    max-brightness = 24 if the top 8 values cannot be distinguished
>    visually).

I think I will opt for this. It makes most sense given how we use the
device tree to restrict maximum brightness, and that is definitely
related to the hardware max brightness.

Thanks Daniel!
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
