Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89198BADFA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B661121BB;
	Fri,  3 May 2024 13:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="roowW+R+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584681121BB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:46:16 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcc71031680so9108870276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714743975; x=1715348775; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VkO+KdbtUN9IqeShpgEcMEOobBVHfZYBUo6hb6ifhXo=;
 b=roowW+R+RP/LUP9oiECfd3EFnUvpJNPsUZ/xMirPf9e89oUWXUAVPwpXs/ScaDoDz+
 ek2QL8N5E1uCTq4I9Lm5bbuqehVyjXT3W2JX3+GXzltIxUaXMDe7d0f2tYGmEACm8Ndj
 Du64UtL2GcsoZTaD01C0lKBiaFgPptsbR8+s2hvcTUNPJ4j0Vfr39ArgkETqEZEuckCB
 V9gbFde6xnL3Oq13CNZ3LgNeRmTIHXwAaBayci3J4EXbVofTSDD0Sk8uKii+fYO5Om8Q
 E3Wiv/xh9zC4DNboNcVByYFwF5P+96P3Hpj88iRE3+m454uaxxJb6hPEcCzg3ez+wa0x
 9W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743975; x=1715348775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VkO+KdbtUN9IqeShpgEcMEOobBVHfZYBUo6hb6ifhXo=;
 b=m/R2TFSc0RDdlW3TKNf5xN/SRN33kfhp8Bjk3r1c5+v612J7q9XEzQLFVBQuSFDHGR
 fsNsll+79jMarc6YIMLakd4LgPTKsKyGyM3Z8KJJK++WC0Na9Z4xvpYOrSG6RregFWN6
 nw3RBx0LTHDFSbddeMmTeDvJ93WCq/vo6++3EuY1CRo37z6w992kPgJVDgzbTVTTfFtn
 1k4T4RHyuQKnqybnDzXHKoex9WPjRjzA4oUGqhk+MnLCjUu8u3VLY7tP4CeRwwZpJcIh
 fHN/QOGT+5vD7gYVIZtEPjzR8MzfxhSqTJMB5Fonkw75PHvQhz+5tX5ZnuBOF5iBh1R3
 wGvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZxVE/mtpCTK7AShKW6rsJdr1Xe83BCc9AAXH/KAXMFS++Hs+MDSiAoSaH7QSpkTrIw+7hnLjGuReZADOGLyV/nLzzPYb3YBe1jKiILdfC
X-Gm-Message-State: AOJu0YxN9/Un5O/VJEJwCjF+zVvzxj/YjzOycm6ZABPD6pM0U+VAODP8
 cL2Q6Dj2jT/wQoI1Mvx21eO5wdY4hfLcWWH0K7Fuq6ZcqhKEAVrbZvNAYAXSHihhsLFP4sYKeZ0
 vUEJh01AXjJUkamTFFiuiAshu4JxHAy3aSSHwbA==
X-Google-Smtp-Source: AGHT+IH/Xb1XcZDOaCvizhYyHNNZjGRIDjGUlZ+m+l5KoU1hpsPb+0dWkoH6eUByYXw6Znq4ecrpXd3LLQEK4dA3cKc=
X-Received: by 2002:a25:b04a:0:b0:de8:8cd9:c43d with SMTP id
 e10-20020a25b04a000000b00de88cd9c43dmr2564219ybj.12.1714743975056; Fri, 03
 May 2024 06:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-ti-sci-pd-v1-0-a0e56b8ad897@ideasonboard.com>
 <20240415-ti-sci-pd-v1-2-a0e56b8ad897@ideasonboard.com>
 <d4cd0323-4792-49b0-a4e2-0bc92068e7f0@ideasonboard.com>
In-Reply-To: <d4cd0323-4792-49b0-a4e2-0bc92068e7f0@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2024 15:45:38 +0200
Message-ID: <CAPDyKFqShuq98qV5nSPzSqwLLUZ7LxLvp1eihGRBkU4qUKdWwQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] pmdomain: ti-sci: Support retaining PD boot time
 state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Abel Vesa <abel.vesa@linaro.org>, 
 Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
 J Keerthy <j-keerthy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Devarsh Thakkar <devarsht@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Abel, Saravanna, Stephen

On Mon, 15 Apr 2024 at 19:17, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 15/04/2024 19:00, Tomi Valkeinen wrote:
> > Add a new flag, TI_SCI_PD_KEEP_BOOT_STATE, which can be set in the dts
> > when referring to power domains. When this flag is set, the ti-sci
> > driver will check if the PD is currently enabled in the HW, and if so,
> > set the GENPD_FLAG_ALWAYS_ON flag so that the PD will stay enabled.
> >
> > The main issue I'm trying to solve here is this:
> >
> > If the Display Subsystem (DSS) has been enabled by the bootloader, the
> > related PD has also been enabled in the HW. When the tidss driver
> > probes, the driver framework will automatically enable the PD. While
> > executing the probe function it is very common for the probe to return
> > EPROBE_DEFER, and, in rarer cases, an actual error. When this happens
> > (probe() returns an error), the driver framework will automatically
> > disable the related PD.
> >
> > Powering off the PD while the DSS is enabled and displaying a picture
> > will cause the DSS HW to enter a bad state, from which (afaik) it can't
> > be woken up except with full power-cycle. Trying to access the DSS in
> > this state (e.g. when retrying the probe) will usually cause the board
> > to hang sooner or later.
> >
> > Even if we wouldn't have this board-hangs issue, it's nice to be able to
> > keep the DSS PD enabled: we want to keep the DSS enabled when the
> > bootloader has enabled the screen. If, instead, we disable the PD at the
> > first EPROBE_DEFER, the screen will (probably) go black.
>
> A few things occurred to me. The driver is supposed to clear the
> GENPD_FLAG_ALWAYS_ON when the driver has probed successfully. There are
> two possible issues with that:
>
> - Afaics, there's no API to do that, and currently I just clear the bit
> in genpd->flags. There's a clear race there, so some locking would be
> required.
>
> - This uses the GENPD_FLAG_ALWAYS_ON flag to say "PD is always on, until
> the driver has started". If the PD would have GENPD_FLAG_ALWAYS_ON set
> for other reasons, the driver would still go and clear the flag, which
> might break things.
>
> Also, unrelated to the above and not a problem in practice at the very
> moment, but I think clocks should also be dealt with somehow. Something,
> at early-ish boot stage, should mark the relevant clocks as in use, so
> that there's no chance they would be turned off when the main kernel has
> started (the main display driver is often a module).
>
> It would be nice to deal with all the above in a single place. I wonder
> if the tidss driver itself could somehow be split into two parts, an
> early part that would probe with minimal dependencies, mainly to reserve
> the core resources without doing any kind of DRM init. And a main part
> which would (somehow) finish the initialization at a later point, when
> we have the filesystem (for firmware) and the other bridge/panel drivers
> have probed.
>
> That can be somewhat achieved with simplefb or simpledrm, though, but we
> can't do any TI DSS specific things there, and it also creates a
> requirement to have either of those drivers built-in, and the related DT
> nodes to be added.

Without going into too much detail, this and similar problems have
been discussed in the past. With the fw_devlink and the ->sync_state()
callback we are getting closer to a solution, but for genpd a solution
is still pending.

If you want to read up on earlier discussions and join us moving
forward, that would be great. The last attempt for genpd to move this
forward was posted by Abel Vesa:
https://lore.kernel.org/linux-pm/20230621144019.3219858-1-abel.vesa@linaro.org/

Beyond that, we have also discussed various solutions at the last LPC
in Richmond. I think the consensus at that point was that Saravana
targeted to post something for clocks - and when that was done, we
should do the similar thing for genpd. Anyway, I have looped them into
this thread, so they can share any updates on their side of the
matter.

>
>   Tomi

Kind regards
Uffe

>
> > Another option here would perhaps be to change the driver framework
> > (drivers/base/platform.c) which attaches and detaches the PD, and make
> > it somehow optional, allowing the driver the manage the PD. That option
> > has two downsides: 1) the driver _has_ to manage the PD, which would
> > rule out the use of simplefb and simpledrm, and 2) it would leave the PD
> > in off state from Linux's perspective until a driver enables the PD, and
> > that might mean that the PD gets actually disabled as part of normal
> > system wide power management (disabling unused resources).
> >
> > Yet another option would be to do this outside the ti_sci_pm_domains
> > driver: a piece of code that would somehow be ran after the
> > ti_sci_pm_domains driver has probed (so that we have the PDs), but
> > before tidss/simplefb/simpledrm probes. The problem here is the
> > "somehow" part. Also, this would partly have the same issue 2) as
> > mentioned above.
> >
> > TODO: If this approach is ok, sci-pm-domain.yaml needs to be extended.
> > Also, it sounds a bit like the cell value is not a bit-mask, so maybe
> > adding TI_SCI_PD_KEEP_BOOT_STATE flag this way is not fine.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >   drivers/pmdomain/ti/ti_sci_pm_domains.c    | 27 +++++++++++++++++++++++++--
> >   include/dt-bindings/soc/ti,sci_pm_domain.h |  1 +
> >   2 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> > index 1510d5ddae3d..b71b390aaa39 100644
> > --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> > +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> > @@ -103,7 +103,7 @@ static struct generic_pm_domain *ti_sci_pd_xlate(
> >               return ERR_PTR(-ENOENT);
> >
> >       genpd_to_ti_sci_pd(genpd_data->domains[idx])->exclusive =
> > -             genpdspec->args[1];
> > +             genpdspec->args[1] & TI_SCI_PD_EXCLUSIVE;
> >
> >       return genpd_data->domains[idx];
> >   }
> > @@ -161,6 +161,8 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
> >                               break;
> >
> >                       if (args.args_count >= 1 && args.np == dev->of_node) {
> > +                             bool is_on = false;
> > +
> >                               if (args.args[0] > max_id) {
> >                                       max_id = args.args[0];
> >                               } else {
> > @@ -189,7 +191,28 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
> >                               pd->idx = args.args[0];
> >                               pd->parent = pd_provider;
> >
> > -                             pm_genpd_init(&pd->pd, NULL, true);
> > +                             /*
> > +                              * If TI_SCI_PD_KEEP_BOOT_STATE is set and the
> > +                              * PD has been enabled by the bootloader, set
> > +                              * the PD to GENPD_FLAG_ALWAYS_ON. This will
> > +                              * make sure the PD stays enabled until a driver
> > +                              * takes over and clears the GENPD_FLAG_ALWAYS_ON
> > +                              * flag.
> > +                              */
> > +                             if (args.args_count > 1 &&
> > +                                 args.args[1] & TI_SCI_PD_KEEP_BOOT_STATE) {
> > +                                     /*
> > +                                      * We ignore any error here, and in case
> > +                                      * of error just assume the PD is off.
> > +                                      */
> > +                                     pd_provider->ti_sci->ops.dev_ops.is_on(pd_provider->ti_sci,
> > +                                             pd->idx, NULL, &is_on);
> > +
> > +                                     if (is_on)
> > +                                             pd->pd.flags |= GENPD_FLAG_ALWAYS_ON;
> > +                             }
> > +
> > +                             pm_genpd_init(&pd->pd, NULL, !is_on);
> >
> >                               list_add(&pd->node, &pd_provider->pd_list);
> >                       }
> > diff --git a/include/dt-bindings/soc/ti,sci_pm_domain.h b/include/dt-bindings/soc/ti,sci_pm_domain.h
> > index 8f2a7360b65e..af610208e3a3 100644
> > --- a/include/dt-bindings/soc/ti,sci_pm_domain.h
> > +++ b/include/dt-bindings/soc/ti,sci_pm_domain.h
> > @@ -3,6 +3,7 @@
> >   #ifndef __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
> >   #define __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
> >
> > +#define TI_SCI_PD_KEEP_BOOT_STATE 2
> >   #define TI_SCI_PD_EXCLUSIVE 1
> >   #define TI_SCI_PD_SHARED    0
> >
> >
>
