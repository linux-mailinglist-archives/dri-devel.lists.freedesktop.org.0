Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE53D4056
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 20:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240A6FC27;
	Fri, 23 Jul 2021 18:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2E16FC27;
 Fri, 23 Jul 2021 18:40:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D70C460F21;
 Fri, 23 Jul 2021 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627065637;
 bh=luXtGcA9XPkn2pKeuXVILcPOHo+qWZTOu992ZyXafQg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N83j4dx3rfgzlrRme4TcsorPA3CwCjlYZTPM33Jyuu5g1ZFvrbAHK2bAaJG+hdmG0
 hw4wiFRurvy5qLdIXD/jJMuUTRK55/Zyq1SHsITZ1PxD/nANq7uea7MJeEe4jJGklt
 RScFbpJrFaNHDHSC0ibEy3+SX+3454CDR5eai2/u+EzZIZKAUyRrt/FWB+HWCSjBWR
 3fNyj1im4apMuZSUXjAjCj0uGL3hPloYHnxqhVBBxc7UR21uRr9wy1tDCgeJAltvT0
 oVvrJo3YOpzgXI2lpBpYGicBY+ir8bpx/qrVBXlHs3/VacQ/0dOuS+AFXQX5oBVVco
 GdQN4tYxbg/0g==
Received: by mail-wr1-f48.google.com with SMTP id q3so3415553wrx.0;
 Fri, 23 Jul 2021 11:40:37 -0700 (PDT)
X-Gm-Message-State: AOAM532J2oUyXdvy6eL50E/6bvODxVKgN7fb3LNv40F1Fp+anVrisuRC
 2h6LDMmsusX3RoSu0Mf97ynw0a5Pnxl/1rhll0A=
X-Google-Smtp-Source: ABdhPJwMCndPGt5XAO6Dm7un4OXszpJWIOXjaITxEdSd5iU9hBRvRdKTCo042U0vc2Fd3fqthaHa2RFxAK6soz4ZCx0=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr6959840wrw.105.1627065636499; 
 Fri, 23 Jul 2021 11:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
 <CACO55tvQoCnjQWRJhrJ+8TzY5MuDDSUSnwd5AU8G1qsQYCSCBg@mail.gmail.com>
 <7ddd0c7c-9bdc-9ea3-c635-f1d141d1e870@infradead.org>
 <CACO55ttjQO5kUeEA7opvGLAwT+a1t0vAguncKDhB4bdy96K7LA@mail.gmail.com>
In-Reply-To: <CACO55ttjQO5kUeEA7opvGLAwT+a1t0vAguncKDhB4bdy96K7LA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 20:40:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YiAgTLptmPbK6vczkMi7F=tzE-Ae8GPFnBtbvQnoF0Q@mail.gmail.com>
Message-ID: <CAK8P3a0YiAgTLptmPbK6vczkMi7F=tzE-Ae8GPFnBtbvQnoF0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
To: Karol Herbst <kherbst@redhat.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 6:34 PM Karol Herbst <kherbst@redhat.com> wrote:
> On Fri, Jul 23, 2021 at 6:31 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 7/23/21 8:15 AM, Karol Herbst wrote:
> > > On Fri, Jul 23, 2021 at 5:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > what's actually the use case of compiling with
> > > CONFIG_DRM_NOUVEAU_BACKLIGHT=n anyway?
> >
> > Dunno. In this case it was just a randconfig. Still, it needs to be
> > handled in some way - such as the other suggestion in this thread.
> >
>
> sure, I was just curious if there was a specific use case or just
> something random as you mentioned.

I think this is purely done because of tradition. A long time ago, we had
tiny framebuffer drivers and most PCs did not have backlights, so it
made sense to leave this optional.

This was probably just always carried over.

         Arnd
