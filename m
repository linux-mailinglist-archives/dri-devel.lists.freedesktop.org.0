Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133B6F343E
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 18:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5993310E13D;
	Mon,  1 May 2023 16:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738D10E03E;
 Mon,  1 May 2023 16:58:33 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1924a23ddb7so9479293fac.0; 
 Mon, 01 May 2023 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682960312; x=1685552312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/SEaAflvpetMi4+nxY06+P/T33MSQGH6sSrAaXI1BA=;
 b=r0nFRQ420je1KUNVV1fjvkaxY8mGnW4c0nNzaSdCTY96lsVdUrsIc9aP6a8nlDITeH
 iudvN3i23BRSdk5DRkQhVREKcFMshE1558fLxMjvWsaE8WMY/FA/DLa/UWH/n3In0ClD
 Ccz4QU/Gfg3xqrjHJrhzqH2athEIFp29haLGlIrxLBhrFhZtquZpkc/gyeeZksqAUJwp
 6xt65IWqWInuICIwc5XOdEfSjNyipsC5KAYuItr/781IUZZ6d6iBqzeHEm8VkCq/vKiy
 UUDEPfGVzYM57SjozYEamh1Lptd6/LckWWQYcSaoxgOnh/0n8uiLcRfJxtXE4GmDaUmx
 6Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682960312; x=1685552312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/SEaAflvpetMi4+nxY06+P/T33MSQGH6sSrAaXI1BA=;
 b=jG5+WfUD2xVB63Kzm9VkxGTsUnxZNNA91tRjf8BV7c/zqjNDbdGHZyZFxr6iT25Qr2
 dmpI4Yg7irFhEGH+FUVzSqO3rmlNoGECAEez0rrAAMOVaG4ziZtQ0Cbp0h5AC4gDJ42l
 rru0wpzG5+/Z/idxgYvfmACAYP9FEu4eNoax6zjwhCMk7/8Hul3BNoWV2G+9VxxswK7F
 fJgt+LTWyn2uGIY9JZKAfRYUEHM6hGPLX8Tbqb3PpcfVeHx/eMXWkO3IrkUkocACAovk
 JVp3xO9s1J5fH9qNAr1ankIi2DvfMRQhEbDc2mwVinJX0GbDcLe1whVQ9aLo+p3Af2uZ
 mlSA==
X-Gm-Message-State: AC+VfDwnjWq0+dIFTppeFeNe0PRJNzLLRLS8BkJJ+/F2fYed4B6A44qo
 lYKHhX19MPOHiy7ghqwpNGSH77NKkMqLEKbUCa0=
X-Google-Smtp-Source: ACHHUZ7Vsn3Anj6mP2QaI4Qq50jdI1PMMkNhHYR4SnlhoFhmDZ6byO7UP7PKxiZi4wAEDY66lRfjKnnrkTBGQ913Gs4=
X-Received: by 2002:a05:6808:116:b0:38d:ed4a:52f4 with SMTP id
 b22-20020a056808011600b0038ded4a52f4mr6442335oie.14.1682960311714; Mon, 01
 May 2023 09:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-9-robdclark@gmail.com>
 <135ff649-e50c-50f4-55ba-a1b615865e02@linux.intel.com>
In-Reply-To: <135ff649-e50c-50f4-55ba-a1b615865e02@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 May 2023 09:58:20 -0700
Message-ID: <CAF6AEGvKnPgtna4yjN56mMjCLqpjs8B8K152VWxmPs1NdY78vA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] drm/fdinfo: Add comm/cmdline override fields
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 4:05=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 27/04/2023 18:53, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > These are useful in particular for VM scenarios where the process which
> > has opened to drm device file is just a proxy for the real user in a VM
> > guest.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst | 18 ++++++++++++++++++
> >   drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
> >   include/drm/drm_file.h                | 19 +++++++++++++++++++
> >   3 files changed, 52 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > index 58dc0d3f8c58..e4877cf8089c 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -73,6 +73,24 @@ scope of each device, in which case `drm-pdev` shall=
 be present as well.
> >   Userspace should make sure to not double account any usage statistics=
 by using
> >   the above described criteria in order to associate data to individual=
 clients.
> >
> > +- drm-comm-override: <valstr>
> > +
> > +Returns the client executable override string.  Some drivers support l=
etting
> > +userspace override this in cases where the userspace is simply a "prox=
y".
> > +Such as is the case with virglrenderer drm native context, where the h=
ost
> > +process is just forwarding command submission, etc, from guest userspa=
ce.
> > +This allows the proxy to make visible the executable name of the actua=
l
> > +app in the VM guest.
> > +
> > +- drm-cmdline-override: <valstr>
> > +
> > +Returns the client cmdline override string.  Some drivers support lett=
ing
> > +userspace override this in cases where the userspace is simply a "prox=
y".
> > +Such as is the case with virglrenderer drm native context, where the h=
ost
> > +process is just forwarding command submission, etc, from guest userspa=
ce.
> > +This allows the proxy to make visible the cmdline of the actual app in=
 the
> > +VM guest.
>
> Perhaps it would be okay to save space here by not repeating the
> description, like:
>
> drm-comm-override: <valstr>
> drm-cmdline-override: <valstr>
>
> Long description blah blah...
> This allows the proxy to make visible the _executable name *and* command
> line_ blah blah..
>
> > +
> >   Utilization
> >   ^^^^^^^^^^^
> >
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 9321eb0bf020..d7514c313af1 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -178,6 +178,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *m=
inor)
> >       spin_lock_init(&file->master_lookup_lock);
> >       mutex_init(&file->event_read_lock);
> >
> > +     mutex_init(&file->override_lock);
> > +
> >       if (drm_core_check_feature(dev, DRIVER_GEM))
> >               drm_gem_open(dev, file);
> >
> > @@ -292,6 +294,8 @@ void drm_file_free(struct drm_file *file)
> >       WARN_ON(!list_empty(&file->event_list));
> >
> >       put_pid(file->pid);
> > +     kfree(file->override_comm);
> > +     kfree(file->override_cmdline);
> >       kfree(file);
> >   }
> >
> > @@ -995,6 +999,17 @@ void drm_show_fdinfo(struct seq_file *m, struct fi=
le *f)
> >                          PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
> >       }
> >
> > +     mutex_lock(&file->override_lock);
>
> You could add a fast unlocked check before taking the mutex for no risk
> apart a transient false negative. For 99.9999% of userspace it would
> mean no pointless lock/unlock cycle.

I'm not sure I get your point?  This needs to be serialized against
userspace setting the override values

>
> > +     if (file->override_comm) {
> > +             drm_printf(&p, "drm-comm-override:\t%s\n",
> > +                        file->override_comm);
> > +     }
> > +     if (file->override_cmdline) {
> > +             drm_printf(&p, "drm-cmdline-override:\t%s\n",
> > +                        file->override_cmdline);
> > +     }
> > +     mutex_unlock(&file->override_lock);
> > +
> >       if (dev->driver->show_fdinfo)
> >               dev->driver->show_fdinfo(&p, file);
> >   }
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 1339e925af52..604d05fa6f0c 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -370,6 +370,25 @@ struct drm_file {
> >        */
> >       struct drm_prime_file_private prime;
> >
> > +     /**
> > +      * @comm: Overridden task comm
> > +      *
> > +      * Accessed under override_lock
> > +      */
> > +     char *override_comm;
> > +
> > +     /**
> > +      * @cmdline: Overridden task cmdline
> > +      *
> > +      * Accessed under override_lock
> > +      */
> > +     char *override_cmdline;
> > +
> > +     /**
> > +      * @override_lock: Serialize access to override_comm and override=
_cmdline
> > +      */
> > +     struct mutex override_lock;
> > +
>
> I don't think this should go to drm just yet though. Only one driver can
> make use of it so I'd leave it for later and print from msm_show_fdinfo
> for now.

This was my original approach but danvet asked that it be moved into
drm for consistency across drivers.  (And really, I want the in-flight
amd and intel native-context stuff to motivate adding similar features
to amdgpu/i915/xe.)

BR,
-R

> Regards,
>
> Tvrtko
>
> >       /* private: */
> >   #if IS_ENABLED(CONFIG_DRM_LEGACY)
> >       unsigned long lock_count; /* DRI1 legacy lock count */
