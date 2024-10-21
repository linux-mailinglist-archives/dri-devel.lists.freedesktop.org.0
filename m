Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A99A6C7C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7E10E54B;
	Mon, 21 Oct 2024 14:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=criticallink.com header.i=@criticallink.com header.b="g3mJs8If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF1810E54E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:46:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e8586b53so4713596e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1729521985; x=1730126785;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdcnb8e+gAkVMVmccz9fiNE3PWRs3Kz7gMuReYmqkSU=;
 b=g3mJs8IfPs50nvrT7WZS9usx/pv1x5KI2MMUM9Ch2GGO+rHqREFB05JiukoeJKwQCM
 PjCbPGqNuyvcijedoQXf1KEm2ggOPxYWbUuS8pXnmVF+GkjQ2XLvKxPF4uhfVc7cYHhk
 f36PYwke+gqvPEw/A0i+tEhdeJTu4xH9FJss40K7lEt6wqVd62Qbo0UlukE4iAThqeN1
 D2m/fnMny5ynC2PfDjniKe2jsDGumPWZPMSdJ0nGMnIAofcIl+YApaV4WirSqDkid3lk
 4Wa0yKXM229AnI7VsTpzuwsH8xB8lmZUwmNlsbxWrrOT7dcPYcGBmEYW9V5MQ1mzCqQ1
 gKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729521985; x=1730126785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdcnb8e+gAkVMVmccz9fiNE3PWRs3Kz7gMuReYmqkSU=;
 b=ZDFjGG3PKDdJls7QEDUw1AlVs7NJ4JK+1p5+nS/8haZ61rSRI+UwFSpePaACEW7mFM
 HH/Ax4/fG1Hs8jZd66sTSCkaqzPyLVHAgBOHNIjsb5yAKF+HcQ6SFW6RkCfXwIGvnWiQ
 d2GFDUkE3O4BDZf4e6xkTCRWmwrMOqcmEfDTBm3SU5rYM7o6+jRn9FSgLtcq6XOF6aG1
 TwNag0OLENxNiIcmvtanpt2POOf/QJrbMFC8bq6XbyEsDCptRli/bVpmqHJftBzbRvue
 VxvM2q61qK4Ck0HAtRN1B6MOZ+r6lrw6ABWcGQUh3DhQw24LUGDZ+8q+PtHIDGRQXEvX
 IaBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRKL9QNTAPZQkHUb+x4w/d3W0ElS11KyyZCHnxSUzBJzC9cWLT646GGtWYzz+AoGRal2vQQbylaS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS4OsA5O6Aubz5VIxa+q56u8WcQZNMQATF4JtIUddGJ/KRPBb/
 jQMauWv0Ezepy25YufjC382Qr8fSIi/wn9H93iJTJFHZBKWwOetdYx5MS9lX++swoEHvQos3fxS
 ck1/jBa5TDY5f+Wemdb/0w32o2oZGeglfzANX
X-Google-Smtp-Source: AGHT+IHf+afc+3dWOGjqHiHk7wI602WMKF/U5GM48Chg/0UeTO2DN7TWOG/oDA2tQT92u65DlKFaHyV+8qxw8jlm9XY=
X-Received: by 2002:a05:6512:110f:b0:52f:27e:a82e with SMTP id
 2adb3069b0e04-53a15b8332fmr3505306e87.21.1729521985432; Mon, 21 Oct 2024
 07:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241012150710.261767-1-devarsht@ti.com>
 <20241012150710.261767-2-devarsht@ti.com>
 <3d85ac05-150b-4917-a374-5974d376e416@ideasonboard.com>
In-Reply-To: <3d85ac05-150b-4917-a374-5974d376e416@ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Oct 2024 10:46:12 -0400
Message-ID: <CADL8D3ZiGA+XnyvyFCQbcK_SCffrfbhMXFpWzxWVjhuOFeu-Yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/tidss: Clear the interrupt status for interrupts
 being disabled
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, jyri.sarha@iki.fi, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, 
 linux-kernel@vger.kernel.org, praneeth@ti.com, vigneshr@ti.com, 
 aradhya.bhatia@linux.dev, s-jain1@ti.com, r-donadkar@ti.com, sam@ravnborg.org, 
 bparrot@ti.com
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

Adding the e2e thread that has instigated this change.

https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1=
394222/am625-issue-about-tidss-rcu_preempt-self-detected-stall-on-cpu?pifra=
gment-323307=3D1#pifragment-323307=3D2

Summary of original problem: An AM62x device using the TIDSS driver,
can lock up after hours of running.  The lock ups are often detected
by the rcu_preempt system.  The lock ups turned out to be caused by an
infinite interrupt loop (irq storm?) in the TIDSS_DISPC driver.

The k3_clear_irqstatus function which is responsible for clearing the
interrupt bits, only clear the the level 1 interrupts if the level 2
ones are set.  This leaves a small window where if for whatever reason
the level 2 interrupts aren't set but the level 1's are, then we will
never clear the level 1 interrupt.

The change as submitted is not sufficient to prevent the irq storm.
I've tested these two patches for several weeks now and they reduce
the frequency of the irq storm from once a day to once every few days,
but don't prevent it.

I suggest that the k3_clear_irqstatus function needs to be updated
such that it's not possible for the level 1 DISPC_IRQSTATUS bit to
remain uncleared.

The following hack proposed by Bin and team removes the possibility of
the irq storm happening, while introducing a small chance of clearing
interrupts that weren't intended.  Though I would assume that if the
level 2 interrupts aren't cleared, they would reassert the level 1
DISPC_IRQSTATUS so maybe that's not much of a risk.  Most other
drivers when clearing interrupts do a read and then write to clear
interrupts so there is precedence.

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c
b/drivers/gpu/drm/tidss/tidss_dispc.c
index 60f69be36692..0b8a3d999c54 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -900,27 +900,27 @@ static
 void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t
clearmask)
 {
     unsigned int i;
-    u32 top_clear =3D 0;

     for (i =3D 0; i < dispc->feat->num_vps; ++i) {
         if (clearmask & DSS_IRQ_VP_MASK(i)) {
             dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
-            top_clear |=3D BIT(i);
         }
     }
+
     for (i =3D 0; i < dispc->feat->num_planes; ++i) {
         if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
             dispc_k3_vid_write_irqstatus(dispc, i, clearmask);
-            top_clear |=3D BIT(4 + i);
         }
     }
+
     if (dispc->feat->subrev =3D=3D DISPC_K2G)
         return;

-    dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
-
-    /* Flush posted writes */
-    dispc_read(dispc, DISPC_IRQSTATUS);
+    /* Always clear the level 1 irqstatus (DISPC_IRQSTATUS) unconditionall=
y
Note I'm not sure we are confident in the reasoning outlined in this commen=
t
+     * due to an IP bug where level 1 irq status (DISPC_IRQSTATUS)
would get set delayed even
+     * after level 2 interrupt (DISPC_VID_IRQSTATUS,
DISPC_VP_IRQSTATUS) is cleared.
+     */
+    dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(dispc, DISPC_IRQSTATUS)=
);

I had proposed a more complete version of this patch but there hasn't
been much discussion about it and I've mostly tested Bins version.

 }


On Mon, Oct 21, 2024 at 7:15=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 12/10/2024 18:07, Devarsh Thakkar wrote:
> > It is possible that dispc_{k2g/k3}_set_irqenable can be called for
> > disabling some interrupt events which were previously enabled. However
> > instead of clearing any pending events for the interrupt events that ar=
e
> > required to be disabled, it was instead clearing the new interrupt even=
ts
> > which were not even enabled.
>
> That's on purpose. When we enable a new interrupt, we want to first
> clear the irqstatus for that interrupt to make sure there's no old
> status left lying around. If I'm not mistaken, enabling an interrupt
> with an irqstatus bit set will immediately trigger the interrupt.
>
> > For e.g. While disabling the vsync events, dispc_k3_set_irqenable tries=
 to
> > clear DSS_IRQ_DEVICE_OCP_ERR which was not enabled per the old_mask at =
all
> > as shown below :
> >
> > "dispc_k3_set_irqenable : irqenabled - mask =3D 91, old =3D f0, clr =3D=
 1" where
> > clr =3D (mask ^ old_mask) & old_mask
>
> That's a bit odd... Why was the DSS_IRQ_DEVICE_OCP_ERR not already
> enabled? It is enabled in the tidss_irq_install().
>
> Or maybe it had been enabled by the driver, but as the HW doesn't
> support that bit, it reads always as 0. I have an unsent patch to drop
> DSS_IRQ_DEVICE_OCP_ERR.
>
> > This corrects the bit mask to make sure that it always clears any pendi=
ng
> > interrupt events that are requested to be disabled before disabling the=
m
> > actually.
>
> I think the point here makes sense: if we disable interrupts with
> dispc_set_irqenable(), we don't want to see interrupt handling for the
> disabled interrupts after the call.
>
> However, if you clear the irqstatus for an interrupt that will be
> disabled, but clear it _before_ disabling the interrupt, the interrupt
> might trigger right after clearing the irqstatus but before disabling it.
>
>   Tomi
>
> > Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Di=
splay SubSystem")
> > Reported-by: Jonathan Cormier <jcormier@criticallink.com>
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > ---
> >   drivers/gpu/drm/tidss/tidss_dispc.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tids=
s/tidss_dispc.c
> > index 1ad711f8d2a8..b04419b24863 100644
> > --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> > @@ -700,8 +700,8 @@ void dispc_k2g_set_irqenable(struct dispc_device *d=
ispc, dispc_irq_t mask)
> >   {
> >       dispc_irq_t old_mask =3D dispc_k2g_read_irqenable(dispc);
> >
> > -     /* clear the irqstatus for newly enabled irqs */
> > -     dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & mask);
> > +     /* clear the irqstatus for irqs that are being disabled now */
> > +     dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & old_mask);
> >
> >       dispc_k2g_vp_set_irqenable(dispc, 0, mask);
> >       dispc_k2g_vid_set_irqenable(dispc, 0, mask);
> > @@ -843,8 +843,8 @@ static void dispc_k3_set_irqenable(struct dispc_dev=
ice *dispc,
> >
> >       old_mask =3D dispc_k3_read_irqenable(dispc);
> >
> > -     /* clear the irqstatus for newly enabled irqs */
> > -     dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & mask);
> > +     /* clear the irqstatus for irqs that are being disabled now */
> > +     dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & old_mask);
> >
> >       for (i =3D 0; i < dispc->feat->num_vps; ++i) {
> >               dispc_k3_vp_set_irqenable(dispc, i, mask);
>


--
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
