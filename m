Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A738830B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85C16E0E8;
	Tue, 18 May 2021 23:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727BC6E0EA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 23:19:38 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k10so17131859ejj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuVpLsxM280zZSnAA5Hvc9cE/iB1yMtLUjXcw9RfDjQ=;
 b=L+UFlyZI9Wl26LpcqfyQ4EiAStBc5EjLBmKHBdr9qhit/rZOPkcrN+E05BcXnKy8jy
 RNLqM6FoJzWsSTPoLytzRHGulxh0ioEJExN5U3p3vOqHLSmYjbHbGNBVC/0DX/2r3k3j
 j6zp/tlFqE2GnLTTsJKI9s4whzUZ9jI4HEk8383WVd2QxTGkBQ+AM/Y5qpjxz/+kg5Qa
 FCnP50amQCQdqbsc18zplgNqZvzcQ9VHKdp+P6zDgqIKQwXVypgl0wqILz56Jrrc5SX3
 pmApvaO83DeERRAxdPhg26SfkEubKAC50G4mPrPiygHLNbg7fShKiB14akqNDNwUr6DC
 SV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuVpLsxM280zZSnAA5Hvc9cE/iB1yMtLUjXcw9RfDjQ=;
 b=ONzlOz2ncrWxoFE14s+R0eJDDgW5vQVV/kFNauRdgyQCS8sg/KPH0UDHJpytKD4qgh
 I5bUC5z1WL5scAVXQ0PPjFm94O4wP2EDIIgcfs+2IWaEEkuSIKY6ZZPE1vGrCAbT/SpV
 Z/auxHr1leAm1dq9GcWkX2cbl/X8nfzrXAyEvwOd9VtnOpVRS0e7WOllsADp7B+oRZ50
 0yBSoFtprLAuFrJoTzCPu2PfUJDyZNOjWQiax4Qzah7uh1mcKsJ7/NQZ72W/3LAYSmIc
 3yxmGqFIH4p+KBGxbNx5ra7S4FI7SdMnF1YXozKlE2HlYv4xVehgfhY0yritgMV5zPia
 Kq0w==
X-Gm-Message-State: AOAM533PR+Insga59+/cc7rjaLkQruO/I1BYbzA9f5QVK6M67rFJJz3t
 TwB+cTlElVhaEXq85lZ+9o4vkDR0c36I9KPIhS0=
X-Google-Smtp-Source: ABdhPJxgao2O/RaCyb5ahpCbplEJoNxMH8qU81G2yqjAnbqwtBvFOYPq2Ib+vmEXIJxofuzgU8v1obpOHTcfxX+KBRk=
X-Received: by 2002:a17:906:1496:: with SMTP id
 x22mr8606481ejc.419.1621379977066; 
 Tue, 18 May 2021 16:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <858310d193e10fc17221418dee6172af367eb046.camel@pengutronix.de>
In-Reply-To: <858310d193e10fc17221418dee6172af367eb046.camel@pengutronix.de>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 May 2021 09:19:25 +1000
Message-ID: <CAPM=9tzQM1E9sdPugNhAdiu75bkFvUDqY9zLX9tAF3szNcdmzg@mail.gmail.com>
Subject: Re: [GIT PULL] drm/imx: fixes, dma-fence annotation, and color
 encoding/range plane properties
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 May 2021 at 23:33, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Dave, Daniel,
>
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
>
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>
> are available in the Git repository at:
>
>   git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2021-05-12

Is this for 5.14 or 5.13-rc3?

Dave.
