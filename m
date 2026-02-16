Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAD/K1Lbkmn3zAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:54:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15105141B6B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0177410E192;
	Mon, 16 Feb 2026 08:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7454710E192
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:54:37 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-56636dc53a6so1134393e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 00:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771232076; x=1771836876;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amIuxySa6dDUHXa+BAvlMLYYKh0V6dJe17/ltsM6dbs=;
 b=RdbVxJnc2m6ipXUCXGNBE29ilYUESK7eRsSSJxX3W6s9RlAM334leS3t1vYDIokRdg
 IDG8qAJiqx+Nku27BTGmjz5YBiw/j3QyL0WUeHaQbnlNNElvoCI3Db2AKjDBxLzWWSHI
 4EBEqg9sZQkEYzs2wLn7rNa82L9042iSAZyTf6Fkzw8DJkTXy9fNgmrB1Y/ybVH5BfJM
 1m6A0PVY44QlyP8Jub/EVvP+SRC7pzW/PCc2q8U64+umucSrS8y/EiTRO9CnXZIGDwhn
 Y/Ot52fl404jhICJDrQ4ZoDLdPLFYkqfn/9jSZinLQJjs4hHxEC1bTHeV+dh8VxcatzE
 1pmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqn1kqr+DSsgKp/ZL/WV3d6WAeuRnmlkPE/mJ/nKv/6JYfjl+jlkKgdLEtKEFkEaBfvUQEVO6qqac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8uK+AKySiqvu/Lqam/mzXFKMGB6c9Tr4G3HlKDV3t7uiu9poV
 UU3MFIXQZSkHsVF6yEG1csoM39fSVQ+6zHwMI09qkA57DAS3qHsoNH0exngA3uWB
X-Gm-Gg: AZuq6aLU7OHPNSdBuyhhDUWctMV3kc7W7m8BJqemkHmnRb823UW2uTxglFDeA5Pq2GO
 rvn3TSVwI+gKVxDZH7i0IwOpzm/M3urR3XRaLKnAkrTxJxNefAuqF003MQd7F818PL9L7KfAqBr
 KriVkb4EMcUifds5836T8sOUSr6Jz/4v4u7lvfXBysZatPjnJr5GrHruRxBoaIKrv8kI1WXmPi6
 nRZ6EukQqa2cq+g6emFt6Fpk2rrkn0Yv3D/d2VuQryZUnc78vLYypdXHFSRSXg0xmcB1t3jBGNU
 CCQ6sggCsPxNwQ9sDIbTKCMxnOOCY2PVrRmyypQMIrJtIDJ0HD0gfKetE6JpHu74i9q1uAbtTTx
 pqmo+OxFE6uoZehaedOetHXdeE+T9KVkvJbcBBJiuvwihnOBMZYMs4fhtZ7Un3gN86wyi53WMYw
 RiyGympdR+TIboJF8Yots0NhLic7drrd3PgsNLfrfSPdtHnaCz5y1f1iZhLWD19e1d8y/TDj0=
X-Received: by 2002:a05:6122:c9e:b0:566:36e7:8934 with SMTP id
 71dfb90a1353d-5676aa4d9damr2765594e0c.16.1771232076155; 
 Mon, 16 Feb 2026 00:54:36 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5674c247320sm7024321e0c.18.2026.02.16.00.54.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 00:54:35 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5fc456c3742so500686137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 00:54:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXETFSPeMRQBn2Tu0MMyYirjia6aICkgkirve1vEf5AQ8XG/Bd5oZ0kHVvpJ9SuxcyWBZzPU3Vh1CE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5110:b0:5ef:bd3a:ab1f with SMTP id
 ada2fe7eead31-5fe1afbda79mr3606828137.34.1771232075129; Mon, 16 Feb 2026
 00:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org>
 <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
In-Reply-To: <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 09:54:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-jRhW65cxeApFbCK+XgRazPOTABcbmBC3J38pwXfzJQ@mail.gmail.com>
X-Gm-Features: AaiRm53fj_d9e6w8NbwYy6InUSZHagi7WeBARKJlpME8J2ANfsii8ZwJtSbH60k
Message-ID: <CAMuHMdU-jRhW65cxeApFbCK+XgRazPOTABcbmBC3J38pwXfzJQ@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux PM list <linux-pm@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:ulf.hansson@linaro.org,m:rafael@kernel.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:marek.vasut@mailbox.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 15105141B6B
X-Rspamd-Action: no action

Hi Ulf, Rafael,

On Thu, 22 Jan 2026 at 16:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 3 Jan 2026 at 19:25, Marek Vasut <marek.vasut@mailbox.org> wrote:
> > On 10/29/25 3:08 PM, Geert Uytterhoeven wrote:
> > >       default_suspend_ok+0xb4/0x20c (P)
> > >       genpd_runtime_suspend+0x11c/0x4e0
> > >       __rpm_callback+0x44/0x1cc
> > >       rpm_callback+0x6c/0x78
> > >       rpm_suspend+0x108/0x564
> > >       pm_runtime_work+0xb8/0xbc
> > >       process_one_work+0x144/0x280
> > >       worker_thread+0x2c8/0x3d0
> > >       kthread+0x128/0x1e0
> > >       ret_from_fork+0x10/0x20
> > >      Code: aa1303e0 52800863 b0005661 912dc021 (f9402095)
> > >      ---[ end trace 0000000000000000 ]---
> > >
> > > This driver uses manual PM Domain handling for multiple PM Domains.  In
> > > my case, pvr_power_domains_fini() calls dev_pm_domain_detach() (twice),
> > > which calls dev_pm_put_subsys_data(), and sets dev->power.subsys_data to
> > > NULL when psd->refcount reaches zero.
> > >
> > > Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> > >
> > >      static inline struct generic_pm_domain_data *dev_gpd_data(struct
> > > device *dev)
> > >      {
> > >              return to_gpd_data(dev->power.subsys_data->domain_data);
> > >      }
> > >
> > > triggering the NULL pointer dereference.  Depending on timing, it may
> > > crash earlier or later in genpd_runtime_suspend(), or not crash at all
> > > (initially, I saw it only with extra debug prints in the genpd subsystem).
> >
> > I came to the same conclusion when revisiting it yesterday and today.
> >
> > The power 3dg-{a,b} domains are in RPM_SUSPENDING state, the
> > __rpm_callback() is running and it unlocks dev->power.lock spinlock for
> > just long enough, that the pvr_power_domains_fini() can issue
> > dev_pm_domain_detach() and then dev_pm_put_subsys_data() , which unsets
> > subsys_data, which are later still used by the __rpm_callback() (really
> > the genpd_runtime_suspend() -> suspend_ok() it calls for this domain).
> >
> > But, I wonder if the problem is actually in the CPG MSSR clock domain
> > driver. The pvr_power_domains_fini() dev_pm_domain_detach() really calls
> > cpg_mssr_detach_dev() which calls pm_clk_destroy() and that invokes the
> > dev_pm_domain_detach() which unsets the subsys_data . The
> > pm_clk_destroy() documentation is explicit about it unsetting the
> > subsys_data .
> >
> > I wonder if what we need to do instead, is patch the CPG MSSR clock
> > domain driver such, that it would surely NOT call pm_clk_destroy()
> > before the domain transitioned from RPM_SUSPENDING -> RPM_SUSPENDED
> > state and surely is done with all its __rpm_callback() invocations ?
> >
> > Can you please test this change and see if it fixes the problem ?
> >
> > The barrier should guarantee that the domain is settled and no more
> > callbacks are still running.
>
> Thank you, that indeed fixes the issue!
>
> However, I am not so sure this barrier belongs in the .detach_dev()
> callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
> functions states:
>
>      * Callers must ensure proper synchronization of this function with power
>      * management callbacks.
>
> However, I couldn't find any user that calls pm_runtime_barrier() first.
>
> In case of multiple PM domains, it is even more complicated, as
> dev_pm_domain_attach_list() (and pvr_power_domains_init(), which is
> basically an open-coded variant of the former) creates a list of virtual
> devices, which all need synchronization.  For the devres-enabled version
> (devm_pm_domain_attach_list()), the caller cannot take care of calling
> pm_runtime_barrier() anyway, so it has to be handled by the PM core?

Any guidance from the PM people?
Thanks!

> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -24,6 +24,7 @@
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_clock.h>
> >   #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/psci.h>
> >   #include <linux/reset-controller.h>
> >   #include <linux/slab.h>
> > @@ -656,8 +657,10 @@ int cpg_mssr_attach_dev(struct generic_pm_domain
> > *unused, struct device *dev)
> >
> >   void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct
> > device *dev)
> >   {
> > -       if (!pm_clk_no_clocks(dev))
> > +       if (!pm_clk_no_clocks(dev)) {
> > +               pm_runtime_barrier(dev);
> >                 pm_clk_destroy(dev);
> > +       }
> >   }
> >
> >   static void cpg_mssr_genpd_remove(void *data)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
