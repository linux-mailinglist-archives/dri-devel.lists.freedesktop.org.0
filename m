Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D51D0C6E
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E006E9E7;
	Wed, 13 May 2020 09:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEE76E9E7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:38:31 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id w188so4104248vkf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBsI8/q9tCGEEr55DJmDyAoQAE0dfC+ZmLFYnoZKRCY=;
 b=MxYtgadZIuiNwe154KOVvjuls/0cwiolNG2D9UH9scIN/ePCk8mhg33byFHHVmf9Lo
 5791+hCe5kOsHfd6lXsklQ29x9dARBVEQbQw0YFuNxd33xvKOHa7gJwNSPy1Jy5EejHS
 ZFIIXzSsh2EXBM3S0HNPbUxKCntLv0s6rn7+oNVTxCKOSl96yrhvm95FdSMfJbQOLQor
 byRRgFAILKpv4Xpms63nR0Qs7sL2syoxP3R1+VdzWUUFzS6aWc/2yC06x0YO3WPLlEQk
 PVfLyEBljZ/VHiiSZw9omyHNLvAjGok1IICKKgT2A6KdNWPEmxXBJHlr/n85hlcTuzbv
 vlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBsI8/q9tCGEEr55DJmDyAoQAE0dfC+ZmLFYnoZKRCY=;
 b=QaKmdwDLY31FWAkWWQEjm5+BkFD76eDTrCkWvRigwmqV3ai4PlU3Oi4twaugmFBwDQ
 XL0S8v3LKeQmciZOLL+hIU2IheqdC23rHgeoPGuoEwiArFpJB95jqNj4bGrtGsyaqtpC
 NI0pyEWHwhu53oaRFZImzQkkUzaDHTW1eEO8y5WhrB93uh+lxhgoo3CaRclNWTIf4OcF
 ncc/MIUTc8rB2okE0talLd1R2sp5PmjwILt/xIImN5D+vbeU7ZUeH0R+6tcSTKE4oVpJ
 hjx0kKuaWBs1uZvPoeVSV541UJ5a9FCHM+ytGnNqkNoHUFLEkU1lYv1GQEAAWZ0b8KiZ
 k+ZQ==
X-Gm-Message-State: AGi0PuYjBozt1r4Nxhfn3TQXW8sUv3JgFGXjfQFa8A9dn8thohOdd2ws
 2jDeroGwXeUgQ2kk2KpKCGVpvSy9JQIJlr0UkiE=
X-Google-Smtp-Source: APiQypKmaaAa47QovnAzyFDTLeQNTPb9fvrKbCBsSUUUr20M3otbNDJLYwk5l9cb4/1Lsw0VMkkPYL0pPw04l6brm5E=
X-Received: by 2002:a1f:a454:: with SMTP id n81mr20221401vke.6.1589362710294; 
 Wed, 13 May 2020 02:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
 <20200512162837.GJ13516@ninjato>
In-Reply-To: <20200512162837.GJ13516@ninjato>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 10:35:49 +0100
Message-ID: <CACvgo526Ut+rpi9TXP4jZKPZmRUbnh8U-ETj7VTAz9ykut5Uig@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: encoder_slave: some updates
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: linux-renesas-soc@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wolfram,

On Wed, 13 May 2020 at 10:10, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Mar 16, 2020 at 05:39:05PM +0100, Wolfram Sang wrote:
> > While converting I2C users to new APIs, I found a refcounting problem in
> > the encoder_slave implementation. This series fixes it and converts to
> > the new API.
> >
> > Based on linux-next and only build tested.
> >
> > Wolfram Sang (2):
> >   drm: encoder_slave: fix refcouting error for modules
> >   drm: encoder_slave: use new I2C API
> >
> >  drivers/gpu/drm/drm_encoder_slave.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
>
> Is there someone I should add to the CC list maybe?
>
The series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Unless someone beats me to it, I'll commit them to drm-misc later today.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
