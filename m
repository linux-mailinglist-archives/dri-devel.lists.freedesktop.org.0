Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D843914A36C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 13:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9026EB36;
	Mon, 27 Jan 2020 12:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE296EB36
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 12:00:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b15so6005470lfc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fg+ZRG4UDcUl955L+qfom4e3enQhSeu80Xr+GB2+jl8=;
 b=idsVaVrWHCI/N959xPhy5K75Q4EpEU4JDWdGc7aSGSsOVrheJbzfP1l6OZYSEC0brI
 K0AICIfkNP+joX44Sld7kGO21YUPAPCu+eVEU5NKgmDLfEorIUy3IYj3gcJg1DBHeYAj
 wry6GeKlTM0zOHet30BboyZxWwBvvOZqiT+b2gikAPPCS7QaLH71EcCLfdIWVctWOjbV
 1XpIz37MdFrfaUPpweSjs3DosafP6jdEa0ogAjb3u9L81f2tr+5tf4YjzWYdQGs4rS3p
 j/Jz72YtVZqOUsoklXhoe6AwRGewkYaFgCnW3m1LAKLw2QyfNaIUgIKwTotNzv3rmBXV
 BZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fg+ZRG4UDcUl955L+qfom4e3enQhSeu80Xr+GB2+jl8=;
 b=OqUCpyUNenJ8VEUerqUPm4emgE5yYoQ5n7047PO7wB8rAQRgJM4xGhQgeCxh4gKYqB
 IPbuzn8Bx2pobsb4M+JTo46yOPkzVmIex775ldeb3jKfNJORMCEyvRTK62JPALrwDIiN
 4ua5QDKYdoBxQuEPRG6nd3mw8ZnBV7xTMWaBmIUeXTORJ3U4jez6363rLJfYgHq96Aoe
 KAr0RzxyqnC4/wGwXj17qrMa4yG4FCeacUQExz4AMLs/A4fppcXeILD9ks/zghkgHwiS
 39Dz/uJH7dWbwtjS6H1a8BtqyALIfTD/Ih2fC6ozMF1wK036qGQ4BhB0JhCZY0VruWIS
 9Lfw==
X-Gm-Message-State: APjAAAVIwDDYVjbASeSOKTWANyvBSCV9BKmg9nJKWcMoesMJ8+0NTd0a
 GJzIkXQT7RUbgHVS7T5u5Xel9smeBuvck6PavsM=
X-Google-Smtp-Source: APXvYqzJ4J+LmzMMcqAOV9jHnouPfNQLLJpb1KeHzSlwNHNWcGsFXbBl4bu3N9XH6MO/MywzlVfqSgrwzo53zFb8scA=
X-Received: by 2002:ac2:51de:: with SMTP id u30mr7633150lfm.69.1580126455527; 
 Mon, 27 Jan 2020 04:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20200127022057.379140-1-marex@denx.de>
In-Reply-To: <20200127022057.379140-1-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Jan 2020 09:00:44 -0300
Message-ID: <CAOMZO5BL+g0a-SThX8Lb+iFUFy5Myj+AaiwyMTDEfKxVyM3X+A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add Innolux N133HSE panel support
To: Marek Vasut <marex@denx.de>
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Sean Cross <xobs@kosagi.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Jan 27, 2020 at 5:16 AM Marek Vasut <marex@denx.de> wrote:
>
> From: Sean Cross <xobs@kosagi.com>
>
> The Innolux N133HSE panel is a 13.3" 1920x1080 panel that contains an
> integrated backlight, and connects via eDP.
>
> It is used in the Kosagi Novena.
>
> Signed-off-by: Sean Cross <xobs@kosagi.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@freescale.com>

The freescale.com domain is gone for quite some time.

Please use nxp.com instead or festevam@gmail.com.

Otherwise the patch looks good.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
