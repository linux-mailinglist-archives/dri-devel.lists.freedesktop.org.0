Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264F3B066F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 16:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621D6E09E;
	Tue, 22 Jun 2021 14:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8386E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 14:04:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id my49so34641149ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjxTJQlUQXHTVrRft7g2NIEuKJEf8XDgTzSeDcZLsYU=;
 b=kx4etFImxvrrpNFRftS2UzQEY2qTCbhdvguY/C9UMUSVeZOK3ceJyeDpD2boeYjpY4
 mFG/lkAjE/ESaLj+NbdKII0Yi3InOLlboHXwZlprheXwv+CBQTLzm9MKp9A+fWhxXzVo
 dFY6loXlyqTPBRLhwHoK7G01uuAJVDqDLxdPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjxTJQlUQXHTVrRft7g2NIEuKJEf8XDgTzSeDcZLsYU=;
 b=GQ1IIQuwV6Ll7R9jnqaRuwQcGLPIsHEw6shBiOUhiYBqmtSD66l6F6HHHkaTx4efcx
 oKwG2Lxx/pQECBEv9tgocSUVrfRhXWiyoVPQWf5KaSQhQ2SHqVufgYh92uWghWEhAjg8
 8HYAKNQjfNdr20OLhcpxmTVp5cSRCzNcqzBa55CnAdyWNJprwFiMiWKGPxv9sLGx6UdP
 YSJxKA/oXP2A+nJaS251M7MVJzNsh0ZGGZpqej1bUZ8CZ6AFsK7rwt2IAGwT6mb44FDN
 O4Rd73o1t0eMysYy3DC/ZGdtZb48LzUuvVh50EktUqFFBlTeNqpSFEJT2LZu7k7ZZhmz
 Omng==
X-Gm-Message-State: AOAM5319htofgnpamEja8BTmIJTLpenOQj/q9Yqn1XoQG/Z0jcOaaBjh
 ieMd4GeUZpxN/o7kXYuqEncgIbKmSFAky/s/ngSaVw==
X-Google-Smtp-Source: ABdhPJyhUS2i1wmE2pCIq4T4fMWj9T6QaOsRv52hO8ndwLjmS3TYH2ohRNiryZzy/uKjxzdDQEshxolpimdekuJ2r7M=
X-Received: by 2002:a17:906:b887:: with SMTP id
 hb7mr4263741ejb.252.1624370678014; 
 Tue, 22 Jun 2021 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210620224946.189524-1-marex@denx.de>
In-Reply-To: <20210620224946.189524-1-marex@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 22 Jun 2021 19:34:26 +0530
Message-ID: <CAMty3ZCkKd_Esx1BZ1daPE46F4XMFoLw0rtyRQa3tbc8HBr8ag@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: Clear FIFO_CLEAR bit
To: Marek Vasut <marex@denx.de>
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, Claudius Heine <ch@denx.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 4:19 AM Marek Vasut <marex@denx.de> wrote:
>
> Make sure the FIFO_CLEAR bit is latched in when configuring the
> controller, so that the FIFO is really cleared. And then clear
> the FIFO_CLEAR bit, since it is not self-clearing.
>
> Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Stefan Agner <stefan@agner.ch>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # i.Core MX8MM
