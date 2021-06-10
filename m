Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832C3A28E1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45B36ECB0;
	Thu, 10 Jun 2021 10:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775A6ECB0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:00:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a11so1548802wrt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsnCvdcEe3Eaqj5A/OQKBak574eTL4eh+FWunGYgn5w=;
 b=ooT0aC+2ValcdKw94R8aLE6u1X6MO8in5Pq199LNpA35Lq3j/PJ48QWR290ovj5avj
 gaP53isUxKbdXg+XckNI8zU6ZuT2y1dzqoAzFKKeBFCMXmE64bBi1hCtJc6WhUnfpiY5
 uuxsXTnlB5yLKsnGWBxU0FbNFNG9G8z/vfdSyCWwO6uOcW5JEd5pSpCxrzkcIoTfx1Jx
 4/sGU037EM+nufvaH+TQpaSOEuuy8joDzR88lECNff6+1aLEjXiWB+BIyWHM1PbwAcls
 KuEUkFzLNNCyVq5J7Cv+pKYymkJ73gt9M5NZD4lYtXk7WSXFhIeqyjAorciTGYNhZsWS
 5cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsnCvdcEe3Eaqj5A/OQKBak574eTL4eh+FWunGYgn5w=;
 b=ipvUZ4O/F6PBaakDGCKVpBIQwq49SlS5c9L42vJ2oJreIwVx+8aEqNE+Nxuw7NkTsH
 MjV4yDxjt+IGnOc9yjuZkXfBQCj72hxNsrYkELoxu8kwydtIE7lT9DMduMp9S7fI2QBB
 e9v+f2CuQYAR8KtJ4Rxlw9E3InOxI56ZWj1zW3krnnwFGdo1/VQbt6Ku6DcKdl0J+tLO
 QVD3onnp7MyTxAl1weHqWycEwUPFTTy1QJZf6kZeI2xFdCXor3tDKzuLrnUxO+Hw4RD3
 +DJQd4JkPcw9c2Jg1ndum3Fy84LCyuREAHpoW+M6bufc6xCVI//WZ+pB35/8EX8jrB/H
 f8uQ==
X-Gm-Message-State: AOAM533Sh6xzvDJWfuTvqbaJgiiDMnZUlocvP+z10CTIIs8VyrizgaNZ
 vDLcMPSyh5kfnW6ltBvdZHTWBR5ewPXsMjcpcDdKtQ==
X-Google-Smtp-Source: ABdhPJxrB9VdrDrJI55oxjFjWbRrbLoJeHq9aQ/Sp1gnWuQF1hXZENK49ouPY18lZSq5mqbnaL7zmLE3JyGrmeUOOiA=
X-Received: by 2002:adf:c392:: with SMTP id p18mr4400433wrf.373.1623319228275; 
 Thu, 10 Jun 2021 03:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box>
 <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
 <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
 <YMHUHGS94zXLshU5@orome.fritz.box>
In-Reply-To: <YMHUHGS94zXLshU5@orome.fritz.box>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 10 Jun 2021 11:00:16 +0100
Message-ID: <CAPj87rOyUvKHpoiBSgTmTn=K_O9JZ+XifDx1MuH6sBxkb--w3Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier
 vendor
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Jun 2021 at 09:56, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Jun 09, 2021 at 05:28:50PM +0100, Daniel Stone wrote:
> > On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> > > On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com> wrote:
> > >> I do have commit access for drm-misc-next, but I was thinking that I
> > >> could take this through the drm/tegra tree along with the subsequent
> > >> patches because of the dependency.
> > >>
> > >> Anyone willing to provide an Acked-by for that?
> > >
> > > Yep, no harm if that makes your life easier, so for both the patch itself and merging through tegra:
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> >
> > Is this still in your queue somewhere?
>
> I reverted to an open-coded version at the time because the -rc6 cut-off
> was coming up quickly and I wasn't getting a response. But I do have a
> set of follow-up patches in a branch somewhere that convert the existing
> users to the new helpers.
>
> Let me dig those out and send them out again.

OK, I didn't realise this had been dropped from your queue. That
sounds reasonable, and we'll just open-code as well in libdrm for the
moment, since we want to have the modifier-name API in without having
to wait another few months ...

Cheers,
Daniel
