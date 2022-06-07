Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0053F91A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F72112C41;
	Tue,  7 Jun 2022 09:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1314A112C29
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:08:54 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x4so6415042pfj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lR+Lkj6XjHE1x2fwkB2vF13mxslArr3EM16syM3Iu1A=;
 b=EWtXo2Fjj0BOGPabxv/tBXQB5Q4yn5qnQvwJnn9Avib0aQT/SAXkGBUjnw1RHDCKoW
 hILXY7iF5seuS7gBkcJnwVhF8T6pGXcTqzz5AtnSP1AoPppYjTOLMLzpaI3BRL/eDiwl
 4J+q++h1N0yl10tgGbAZKhBQ29D+k/BpXRGG7Zqa3zabt2EX4sJu8hSEU6Ej83flXuvE
 Efth+3magMyVxOZwUquM+QxFu5Z0UsWSlRdTlH02pcvKeqUZkdStZyhwYx+y4ErpvZpd
 YGzJOednPFNRa4CsF77/pyXBWEjYcnus5kHyKIrsvUdMgZN1TOPmD0rNUpdjr+pbObic
 OjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lR+Lkj6XjHE1x2fwkB2vF13mxslArr3EM16syM3Iu1A=;
 b=P8O7JTSVbO9D2SECdjA8k0ulaJN0VXtGxQ70QBDVHnLPEnnfMHDkbKjoS1EsBYfWEz
 /wsqe6Ok3GMpJjxoBSdFp3eHyn4pr8+8xNkAuZx/C0NlseaL4qubkIAahn5TktGYuOSU
 E1ZFluPtUZCdOr1k/yDd6ni/jCcEMv1CMqbZxG8L67uy9MuXVwD3Y1n5FquF8PluUCJP
 WQ52jA7k9PsPrHA+px9V1d0hnmiVxIrDlLUZnxSCeA5oeG+wqlcZLkCyyeRQATRKxXzP
 5bCui3c5zS34qh7wyppSqza5h3Dpuipd59ZNb4txYlubG4ehJjgLtWUL9+tV5Vi6SFA7
 +QfQ==
X-Gm-Message-State: AOAM532eVKZIt0pmkD6WBqnkoXZH3eCSrXvh9YE4vxmPTyKSfbCmTdBb
 aSm4dGgrFjClhTbMTArX1VWbbK1XEgXin7sfmmA=
X-Google-Smtp-Source: ABdhPJypztbeHoU5zH59ENRsnq5VlAVs81wMrnCatPvGWLntbyG0SJFtZGHRlTBnIqdCn7f8MbktNud78Wt8elDZ5t8=
X-Received: by 2002:aa7:82ca:0:b0:51b:cf43:d00a with SMTP id
 f10-20020aa782ca000000b0051bcf43d00amr25760309pfn.58.1654592933568; Tue, 07
 Jun 2022 02:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-3-tzimmermann@suse.de>
 <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>
 <9a6c51a1-6634-fd1b-3451-9d0cd0a68e47@suse.de>
In-Reply-To: <9a6c51a1-6634-fd1b-3451-9d0cd0a68e47@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 7 Jun 2022 11:08:42 +0200
Message-ID: <CAMeQTsbgVwyL76++MMpmSf+Phf3K0nW+-5zRCETzYx71y_dABQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/ast: Fix updating the connector's EDID property
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 10:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 02.06.22 um 09:24 schrieb Patrik Jakobsson:
> > On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Read the display modes from the connectors DDC helper, which also
> >> updates the connector's EDID property. The code for the connector's
> >> .get_modes helper is now shared between VGA and SIL164.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/gpu/drm/ast/ast_mode.c | 57 ++--------------------------------
> >>   1 file changed, 2 insertions(+), 55 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> >> index e19dd2f9b3ce..4ff8ec1c8931 100644
> >> --- a/drivers/gpu/drm/ast/ast_mode.c
> >> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >> @@ -1302,37 +1302,19 @@ static int ast_crtc_init(struct drm_device *dev)
> >>
> >>   static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
> >
> > Since this function is now generic you could consider removing _vga
> > from the name.
>
> It's not fully generic. There are DisplayPort functions that do their
> own thing.
>
>  From how I understand the driver's source code, there's a hardware
> setting to switch between either analog VGA or SIL164-based DVI. Both
> use the same registers. So the get_modes function can be shared.

What I meant is that there's no VGA specific code left so you could
just name it ast_connector_helper_get_modes()

But feel free to name it as you like.

>
> Best regards
> Thomas
