Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDB59FD1E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16616B6602;
	Wed, 24 Aug 2022 14:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE30CB6583
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 14:22:27 +0000 (UTC)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6A5903FB9A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1661350946;
 bh=J9dYKqPrhoe4u3rJH7QvuZNoAukmPv3+OODJJ1NRe+k=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=HiNpQc+/5qew4BuHdI4yI4vTq/7prExm9BYvVVupKOH9ZN5m/2wknDK8t+KA0c/3g
 ebDEyz7lcb/lYqmRSzGEBXpqgx/BOjfBuHbomiCmQJaRvezwfH39O9uT9OPvsDoVwa
 oc8kBk5bDZIR1bWvD9g4lvW6H+KQN2YE9LA/wfa7qkof9atrVeO3q0I+IgdoK+N/bu
 LuUuSO8IRcT8lTm7H5SDm+PgQm/WogCv0Y5N4XhDLUtntXdDEouCPMW6tQIiwnsAY6
 I+k1ZxTsBslyr0bvphQC5hirsK+WKrqlwaU3yo0ZABdo4p/myU4QPalh3gx0kwvax7
 ksC0p9pG6bcow==
Received: by mail-oo1-f72.google.com with SMTP id
 n6-20020a4a6106000000b0044b2434319eso4717596ooc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 07:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=J9dYKqPrhoe4u3rJH7QvuZNoAukmPv3+OODJJ1NRe+k=;
 b=K/Mh9VZhxAptBF47dpuVfzBDnIf+HZ30nwgMb5choujxbtfkPr6l/WXTyTL0S0ff+h
 XJgng6UM75X6E5yIyeAIR7hxgW6f4DmLVzjd4pTGKD40QsBjMKbbX5ugB9TU0eWqoGGb
 3C9RUdlJJTLe0y9iASsUuqUDV/PipM7AvdmiV6AaMucx45CA2nTZmVdaaUdGlNx6IzH9
 +7dtvbQMDX5ffHp1BRoza1Cpi0L2WuTmI/H56+RVzPU09qIRfq2ju8ZBRwHA56srllDo
 G8BBD8a2O9762GAHy1zIDOaw041SQ3cJx7t5cdylbvG9mkp1jknuv+acFGmrDMvAlIbx
 WPNQ==
X-Gm-Message-State: ACgBeo1XIQj5vzcPmD/oDZMngNqfseDBFYiTQe85lcCmGiLHWzKE/TxJ
 TWwDkvqNTCwgKbiGcJPjlNjG2adlEzAZPnhibZlMv/D7vL1SbYlvsGu/Yxg2K7cGbVDz4jaX+9c
 rw7oBb/LzaLVq27oWVOqyDqWpvMhqXEtVoSjd6IsQaiX5CpKteubhesbr3WHGMA==
X-Received: by 2002:a05:6830:56:b0:639:bbb:f0cf with SMTP id
 d22-20020a056830005600b006390bbbf0cfmr8559389otp.161.1661350942891; 
 Wed, 24 Aug 2022 07:22:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR63V8+8gFNrI7lVEFSJFV+xfOibANKda1JA+arSTbap2BtebjqmboH3jp1HI70ac7UiZj5OusMbJeeSZ333niQ=
X-Received: by 2002:a05:6830:56:b0:639:bbb:f0cf with SMTP id
 d22-20020a056830005600b006390bbbf0cfmr8559382otp.161.1661350942625; Wed, 24
 Aug 2022 07:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com> <20220818115338.GA26586@wunner.de>
 <CACO55ts1T9x++gjbvb-4gxOhLfKTeVVEjpm4L4uav-qRBsxmZg@mail.gmail.com>
In-Reply-To: <CACO55ts1T9x++gjbvb-4gxOhLfKTeVVEjpm4L4uav-qRBsxmZg@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 24 Aug 2022 22:22:10 +0800
Message-ID: <CAAd53p676POJxo4SGQwLWYVUwhqm3MB98zZkm9enh+uwQEu++g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 20, 2022 at 1:01 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Thu, Aug 18, 2022 at 2:09 PM Lukas Wunner <lukas@wunner.de> wrote:
> >
> > On Tue, Aug 16, 2022 at 11:06:18AM +0300, Jani Nikula wrote:
> > > On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > > > dGFX so external monitors are routed to dGFX, and more monitors can be
> > > > supported as result.
> > > >
> > > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > > > on intel_dsm_guid2. This method is described in Intel document 632107.
> > >
> > > Is this the policy decision that we want to unconditionally make,
> > > though?
> >
> > In general, we handle switching of outputs between GPUs in vga_switcheroo.c
> > upon a request from user space via sysfs (well, debugfs currently).
> > It's up to users to decide which policy suits their needs best.
> >
> > That said, we never grew support to allow different switching policies for
> > the built-in panel and external outputs.  Laptops supporting this are
> > rare.  Older MacBook Pros introduced between 2008 and 2010 are among them:
> > They have separate muxes for the panel and external DP port.  Our policy
> > is documented in a code comment in drivers/platform/x86/apple-gmux.c:
> >
> >  * The external DP port is only fully switchable on the first two unibody
> >  * MacBook Pro generations, MBP5 2008/09 and MBP6 2010. This is done by an
> >  * `NXP CBTL06141`_ which is controlled by gmux.
> >  [...]
> >  * Our switching policy for the external port is that on those generations
> >  * which are able to switch it fully, the port is switched together with the
> >  * panel when IGD / DIS commands are issued to vga_switcheroo. It is thus
> >  * possible to drive e.g. a beamer on battery power with the integrated GPU.
> >  * The user may manually switch to the discrete GPU if more performance is
> >  * needed.
> >  *
> >  * On all newer generations, the external port can only be driven by the
> >  * discrete GPU. If a display is plugged in while the panel is switched to
> >  * the integrated GPU, *both* GPUs will be in use for maximum performance.
> >  * To decrease power consumption, the user may manually switch to the
> >  * discrete GPU, thereby suspending the integrated GPU.
> >
> > In other words, on these older MacBook Pros, we switch the panel and
> > external DP port in unison, thus always allowing one of the two GPUs
> > to runtime suspend and save power.
> >
> > Thanks,
> >
> > Lukas
> >
>
> sure, but this is changing now. I do have a laptop with a muxable
> internal display. But this is considered to be a dynamic on demand
> switching thing not a boot time switch.
>
> Anyway, I am still not convinced that doing that unconditionally is
> what we want, especially as userspace has to support dynamic switching
> regardless.
>

According to the doc, there's no MUX in TGL-H DP-IN. The dGPU outputs
are routed through TGL-H TCSS directly.
That's probably the reason why it can't be dynamic.

Kai-Heng
