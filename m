Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF7B9B3C03
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 21:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3B510E575;
	Mon, 28 Oct 2024 20:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jZqtQuhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7400910E575
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 20:39:51 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71e4c2e36daso3878076b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730147991; x=1730752791;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lwka7nWBpShrLfKIhEzGloS4yLOaYMcHWs9aKJ7OeSI=;
 b=jZqtQuhVpw67P4s31rXFGdgXwYt9XMlWCLMz2vgvQbEmgvENKJn3B8Y+cobguFZQZD
 QEFv4jk1TDQDDj2yjwHf+lGq4uVbbUJ7kSAtE4FT0rVvxbTNykCeoYvxfIzevUxDXkAJ
 KKoW3cpZyk8cN6u3nfAsKlJq8uUz+w47zVSq7VY7DsKPNBaCDmLhg9IjK2r9mxg+GTnE
 TlfUm4YLhMP1sPtwOWDqEjDR/P54UpsP8Ae1Xfo1GZUhYmpOfZ2AHf7as6P1qK215Lcj
 UUyhzbY4gUBLkONiF373rLF8O8QZdDnwyZGVXyRAAIyy9onHyzIauWpj7A5xpAs+reEA
 BUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730147991; x=1730752791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lwka7nWBpShrLfKIhEzGloS4yLOaYMcHWs9aKJ7OeSI=;
 b=uBun9d31q6g9L+A9Lc6S6T2O7InkFPBqZvjf3ftXtssjb96s3SDXOgW3JE4qjeQ9Lm
 YCVCwvjoBCuCqoAmjaM4XPzOAY1njAJpQSwpxZ3zZ9pQH82SyRktPLEFocLsN6gqAu8m
 83WUgvHnf2LAc5n5F56VW1/+tIlBl+Y46NpkoCZhKD3PuSHS9hKWLnwmwonkJ4cACwuC
 wLZubfOnZQu+RJP4c66emjt3RJdx8m6cQkCqrhhHOjbfAi/M+RGF9EfD2/fTRJkd/MLC
 aAxMn/9vfV28AEObbEzRHilzkIS34vqJwk6XI+kjBzwzosnIkvfXhFEr0O3Ui1ZEJdRO
 8y9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMS5bM2CQokceYeZLMxgXQQ8bpAL9izViehbsAHkvYdgkDqEZu5dQpgyO3fzoOV4kuq6473SL2+HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8wse4SMyIYGGFIi9hboLQ9G070MejSHJVoxFnMm+QOzZpwk2T
 0DFYE49nTlazsUNyOIm0uuwzPkW+22K1VHyd246JF7fX8soYh79+1tsvPOEs49OtZaTqbyAI3zi
 qV1IpijfMoP5K/BGsvJ8csFb0qGn+2ae4ee7Y0CpLAKz5u6EXU23n4iQ=
X-Google-Smtp-Source: AGHT+IFT968ZFsNalOTLMoES95nu0Q0U86Gq/eB0MvTBZExGZWuvR1c1bnfKYcUeBHAQ/WoFBp8LjHL+Tsg9flH/VBU=
X-Received: by 2002:a05:6a20:ce44:b0:1d9:13da:db15 with SMTP id
 adf61e73a8af0-1d9dca671ecmr1364831637.24.1730147990427; Mon, 28 Oct 2024
 13:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241026045243.452957-1-saravanak@google.com>
 <76eb4a60-e192-4018-9770-4b973075a3cb@ideasonboard.com>
In-Reply-To: <76eb4a60-e192-4018-9770-4b973075a3cb@ideasonboard.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 28 Oct 2024 13:39:10 -0700
Message-ID: <CAGETcx99+EA=t6KaWCWbHk=Xjj32UAKepktZkmLuap=K5G9h3w@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: fw_devlink: Stop trying to optimize cycle
 detection logic
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 28, 2024 at 1:06=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 26/10/2024 07:52, Saravana Kannan wrote:
> > In attempting to optimize fw_devlink runtime, I introduced numerous cyc=
le
> > detection bugs by foregoing cycle detection logic under specific
> > conditions. Each fix has further narrowed the conditions for optimizati=
on.
> >
> > It's time to give up on these optimization attempts and just run the cy=
cle
> > detection logic every time fw_devlink tries to create a device link.
> >
> > The specific bug report that triggered this fix involved a supplier fwn=
ode
> > that never gets a device created for it. Instead, the supplier fwnode i=
s
> > represented by the device that corresponds to an ancestor fwnode.
> >
> > In this case, fw_devlink didn't do any cycle detection because the cycl=
e
> > detection logic is only run when a device link is created between the
> > devices that correspond to the actual consumer and supplier fwnodes.
> >
> > With this change, fw_devlink will run cycle detection logic even when
> > creating SYNC_STATE_ONLY proxy device links from a device that is an
> > ancestor of a consumer fwnode.
> >
> > Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Closes: https://lore.kernel.org/all/1a1ab663-d068-40fb-8c94-f0715403d27=
6@ideasonboard.com/
> > Fixes: 6442d79d880c ("driver core: fw_devlink: Improve detection of ove=
rlapping cycles")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> > Greg,
> >
> > I've tested this on my end and it looks ok and nothing fishy is going
> > on. You can pick this up once Tomi gives a Tested-by.
>
> I tested this on TI AM62 SK board. It has an LVDS (OLDI) display and a
> HDMI output, and both displays are connected to the same display
> subsystem. I tested with OLDI single and dual link cases, with and
> without HDMI, and in all cases probing works fine.
>
> Looks good on that front, so:
>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Great! Thanks!

> You also asked for a diff of the devlinks. That part doesn't look so
> good to me, but probably you can tell if it's normal or not.

TL;DR: All device links in a cycle get marked as
DL_FLAG_SYNC_STATE_ONLY and DL_FLAG_CYCLE (in addition to other
flags). All DL_FLAG_SYNC_STATE_ONLY (not all of them are cycles) will
get deleted after the consumer probes (since they are no longer needed
after that). My guess on what's going on is that with the patch,
fw_devlink found and marked more device links as cycles. Ones that in
the past weren't detected as being part of a cycle but coincidentally
the "post-init" dependency was the one that was getting ignored/not
enforced. So the actual links in a cycle getting deleted after all the
devices have probed is not a problem.

You can enable the "cycle" logs in drivers/base/core.c so it's easier
to follow the cycles fw_devlink detected. But the logs are a bit
cryptic because it tries to print all the multiple cycles that were
detected using a recursive search.

The non-cycle use for DL_FLAG_SYNC_STATE_ONLY is for parent devices to
put a "proxy-vote" (Hey supplier, you still have a consumer that
hasn't bound to a driver yet) for descendant (children, grand
children) devices that haven't been created yet. So, without the fix
it's possible some descendant child never got to probe and the
DL_FLAG_SYNC_STATE_ONLY device link stuck around.

If you can confirm all the deleted device links fall into one of these
two categories, then there's no issue here. If you find cases that
aren't clear, then let me know which one and point to specific nodes
in an upstream DTS file and I can take a look.

Every device link folder has a "sync_state_only" file that says if it
has the DL_FLAG_SYNC_STATE_ONLY set. But to check for the cycle flag,
you'll have to extend the debug log in device_link_add() that goes:
"Linked as a sync state only consumer to......" and print the "flags" param=
.

>
> $ diff devlink-single-broken.txt devlink-single-fixed.txt

I was hoping you'd give me some line count diff too to get a sense of
if it's wreaking havoc or not. But based on my local testing on
different hardware, I'm expecting a very small number of device links
are getting affected.

> 2d1
> < i2c:1-0022--i2c:1-003b
> 11d9
> <
> platform:44043000.system-controller:clock-controller--platform:20010000.i=
2c
> 27d24
> < platform:44043000.system-controller:clock-controller--platform:601000.g=
pio
> 42d38
> <
> platform:44043000.system-controller:power-controller--platform:20010000.i=
2c
> 58d53
> < platform:44043000.system-controller:power-controller--platform:601000.g=
pio
> 74d68
> < platform:4d000000.mailbox--platform:44043000.system-controller

I took a quick look at this one in
arch/arm64/boot/dts/ti/k3-am62-main.dtsi which I assume is part of the
device you are testing on and I couldn't find a cycle. But with dtsi
and dts files, it's hard to find these manually. Let me know if
fw_devlink is thinking there's a cycle where there is none.

> 76d69
> < platform:601000.gpio--i2c:1-0022
> 80d72
> < platform:bus@f0000:interrupt-controller@a00000--platform:601000.gpio
> 82d73
> < platform:f4000.pinctrl--i2c:1-0022
> 84d74
> < platform:f4000.pinctrl--platform:20010000.i2c
>
> "i2c:1-003b" is the hdmi bridge, "i2c:1-0022" is a gpio expander. So,
> for example, we lose the devlink between the gpio expander and the hdmi
> bridge. The expander is used for interrupts. There's an interrupt line
> from the HDMI bridge to the expander, and from there there's an
> interrupt line going to the SoC.
>
> Also, I noticed the devlinks change if I load the display drivers. The
> above is before loading. Comparing the loaded/not-loaded:

Yeah, DL_FLAG_SYNC_STATE_ONLY device links vanishing as more devices
probe is not a problem. That's working as intended.

Thanks,
Saravana

>
> $ diff devlink-dual-fixed.txt devlink-dual-fixed-loaded.txt
> 3d2
> < i2c:1-003b--platform:30200000.dss
> 23d21
> <
> platform:44043000.system-controller:clock-controller--platform:30200000.d=
ss
> 52d49
> <
> platform:44043000.system-controller:power-controller--platform:30200000.d=
ss
> 73d69
> < platform:display--platform:30200000.dss
> 78d73
> < platform:f4000.pinctrl--platform:30200000.dss
> 97a93
>  > regulator:regulator.0--platform:display
>
>   Tomi
>
>
> > Thanks,
> > Saravana
> >
> > v1 -> v2:
> > - Removed the RFC tag
> > - Remaned the subject. v1 is https://lore.kernel.org/all/20241025223721=
.184998-1-saravanak@google.com/T/#u
> > - Added a NULL check to avoid NULL pointer deref
> >
> >   drivers/base/core.c | 46 ++++++++++++++++++++------------------------=
-
> >   1 file changed, 20 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 3b13fed1c3e3..f96f2e4c76b4 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1990,10 +1990,10 @@ static struct device *fwnode_get_next_parent_de=
v(const struct fwnode_handle *fwn
> >    *
> >    * Return true if one or more cycles were found. Otherwise, return fa=
lse.
> >    */
> > -static bool __fw_devlink_relax_cycles(struct device *con,
> > +static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle=
,
> >                                struct fwnode_handle *sup_handle)
> >   {
> > -     struct device *sup_dev =3D NULL, *par_dev =3D NULL;
> > +     struct device *sup_dev =3D NULL, *par_dev =3D NULL, *con_dev =3D =
NULL;
> >       struct fwnode_link *link;
> >       struct device_link *dev_link;
> >       bool ret =3D false;
> > @@ -2010,22 +2010,22 @@ static bool __fw_devlink_relax_cycles(struct de=
vice *con,
> >
> >       sup_handle->flags |=3D FWNODE_FLAG_VISITED;
> >
> > -     sup_dev =3D get_dev_from_fwnode(sup_handle);
> > -
> >       /* Termination condition. */
> > -     if (sup_dev =3D=3D con) {
> > +     if (sup_handle =3D=3D con_handle) {
> >               pr_debug("----- cycle: start -----\n");
> >               ret =3D true;
> >               goto out;
> >       }
> >
> > +     sup_dev =3D get_dev_from_fwnode(sup_handle);
> > +     con_dev =3D get_dev_from_fwnode(con_handle);
> >       /*
> >        * If sup_dev is bound to a driver and @con hasn't started bindin=
g to a
> >        * driver, sup_dev can't be a consumer of @con. So, no need to ch=
eck
> >        * further.
> >        */
> >       if (sup_dev && sup_dev->links.status =3D=3D  DL_DEV_DRIVER_BOUND =
&&
> > -         con->links.status =3D=3D DL_DEV_NO_DRIVER) {
> > +         con_dev && con_dev->links.status =3D=3D DL_DEV_NO_DRIVER) {
> >               ret =3D false;
> >               goto out;
> >       }
> > @@ -2034,7 +2034,7 @@ static bool __fw_devlink_relax_cycles(struct devi=
ce *con,
> >               if (link->flags & FWLINK_FLAG_IGNORE)
> >                       continue;
> >
> > -             if (__fw_devlink_relax_cycles(con, link->supplier)) {
> > +             if (__fw_devlink_relax_cycles(con_handle, link->supplier)=
) {
> >                       __fwnode_link_cycle(link);
> >                       ret =3D true;
> >               }
> > @@ -2049,7 +2049,7 @@ static bool __fw_devlink_relax_cycles(struct devi=
ce *con,
> >       else
> >               par_dev =3D fwnode_get_next_parent_dev(sup_handle);
> >
> > -     if (par_dev && __fw_devlink_relax_cycles(con, par_dev->fwnode)) {
> > +     if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwn=
ode)) {
> >               pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
> >                        par_dev->fwnode);
> >               ret =3D true;
> > @@ -2067,7 +2067,7 @@ static bool __fw_devlink_relax_cycles(struct devi=
ce *con,
> >                   !(dev_link->flags & DL_FLAG_CYCLE))
> >                       continue;
> >
> > -             if (__fw_devlink_relax_cycles(con,
> > +             if (__fw_devlink_relax_cycles(con_handle,
> >                                             dev_link->supplier->fwnode)=
) {
> >                       pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_=
handle,
> >                                dev_link->supplier->fwnode);
> > @@ -2140,25 +2140,19 @@ static int fw_devlink_create_devlink(struct dev=
ice *con,
> >               return -EINVAL;
> >
> >       /*
> > -      * SYNC_STATE_ONLY device links don't block probing and supports =
cycles.
> > -      * So, one might expect that cycle detection isn't necessary for =
them.
> > -      * However, if the device link was marked as SYNC_STATE_ONLY beca=
use
> > -      * it's part of a cycle, then we still need to do cycle detection=
. This
> > -      * is because the consumer and supplier might be part of multiple=
 cycles
> > -      * and we need to detect all those cycles.
> > +      * Don't try to optimize by not calling the cycle detection logic=
 under
> > +      * certain conditions. There's always some corner case that won't=
 get
> > +      * detected.
> >        */
> > -     if (!device_link_flag_is_sync_state_only(flags) ||
> > -         flags & DL_FLAG_CYCLE) {
> > -             device_links_write_lock();
> > -             if (__fw_devlink_relax_cycles(con, sup_handle)) {
> > -                     __fwnode_link_cycle(link);
> > -                     flags =3D fw_devlink_get_flags(link->flags);
> > -                     pr_debug("----- cycle: end -----\n");
> > -                     dev_info(con, "Fixed dependency cycle(s) with %pf=
wf\n",
> > -                              sup_handle);
> > -             }
> > -             device_links_write_unlock();
> > +     device_links_write_lock();
> > +     if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
> > +             __fwnode_link_cycle(link);
> > +             flags =3D fw_devlink_get_flags(link->flags);
> > +             pr_debug("----- cycle: end -----\n");
> > +             pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> > +                     link->consumer, sup_handle);
> >       }
> > +     device_links_write_unlock();
> >
> >       if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
> >               sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
>
