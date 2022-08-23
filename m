Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722E59F440
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597F010FBEB;
	Wed, 24 Aug 2022 07:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CB9B05F5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:47:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c39so16953761edf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semihalf.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=BYIdG9zoxzlJrcwnEQC3uPCB8wf/8dgeUZMVUqHrFso=;
 b=r/ygoMH4PmOcKkRHWKGLm4IJsjvq7jQQvgR8f0yM8XfPlucwO7274qaI+UOtzXCcgi
 +Rn5qDcqdr53GXGjAwkE1WU0NGsaCc4fIe23izlDzWN/gJib6IHg5uP+Wgzu2uz4F8zM
 Qa+1JOclWTMrk6wFRCar84pDpAnUeCeBUHnnLzNkjm8kpBjpnUOu3r3jSrvpyUHlSWcH
 QdPTuvHjK7KkQd4nILuQ5mupXY4PR5hz/Lq9xe7WPwqqmpUGTbBX5Qo6Fe16FpsXUW/T
 AmH7Dv+xDbm8lPhe/wqpvTQbTflDAd9ceUHVm6HvNys/WAPxxIrseYdTTSuNUuseZvMn
 Y7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=BYIdG9zoxzlJrcwnEQC3uPCB8wf/8dgeUZMVUqHrFso=;
 b=Ro0DSn7UhMbolqM+WF/HlG1CcJyPQQ4HAae8/nXQHdqjF7O8TlSn8Z2C/3M9y7SN/f
 eYIAFT3iVd3KDFLrau38O3xXmMcSrT2mJpM2kPPnpxRUdZN1ODfz32Iaez0L2R/PXFJB
 tmE7b5eDfKMrHjavEe0YyRuuxu309gGswe20eAVXHTsEuaKeDVDw5PE6efa55gOgU2nZ
 tKCKifJPb8kT1JuX3pnq+ZCkNv+iJPeHTeSYFwDZDStS6IKOgil5I0R1gbMkjuGxXNlx
 c64UuUVxbdZamYcDGljYud5N9fqNqPpqkWHFR5t57G6rdpXnWuqX12DzVJTqLn65sVe4
 brrQ==
X-Gm-Message-State: ACgBeo03ftNH9R+5npJTRC3pgHTVQ/C0jYN/505T+jRI06rlq2o9QLOO
 1tFkZGX1SkT1Fh5hpibkNmkJ37smV5rWWGkJNjCW
X-Google-Smtp-Source: AA6agR5rF1UelnTaKi7EozwOAA/BkqIZaLPDGwyCS+1GcJkzZ/CKZXyYqgNOUU9xEwZ/jVzg1riK+C3nxR3AskhtSUI=
X-Received: by 2002:a05:6402:40cb:b0:446:fd02:f03b with SMTP id
 z11-20020a05640240cb00b00446fd02f03bmr2470245edb.405.1661240865088; Tue, 23
 Aug 2022 00:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220201153354.11971-1-lukasz.bartosik@semihalf.com>
 <YwPoCqvQ02kUl9tP@dev-arch.thelio-3990X>
In-Reply-To: <YwPoCqvQ02kUl9tP@dev-arch.thelio-3990X>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date: Tue, 23 Aug 2022 09:47:33 +0200
Message-ID: <CAK8ByeL=1EtgBRGh9hhHofgpRqB--CQgih+tAJwFv_MchDhcSw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v1] drm/i915: fix null pointer dereference
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nathan Chancellor <nathan@kernel.org>, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 upstream@semihalf.com, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> Hi all,
>
> Apologies in advance if you see this twice. I did not see the original
> make it to either lore.kernel.org or the freedesktop.org archives so I
> figured it might have been sent into the void.
>
> On Tue, Feb 01, 2022 at 04:33:54PM +0100, Lukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <lb@semihalf.com>
> >
> > Asus chromebook CX550 crashes during boot on v5.17-rc1 kernel.
> > The root cause is null pointer defeference of bi_next
> > in tgl_get_bw_info() in drivers/gpu/drm/i915/display/intel_bw.c.
> >
> > BUG: kernel NULL pointer dereference, address: 000000000000002e
> > PGD 0 P4D 0
> > Oops: 0002 [#1] PREEMPT SMP NOPTI
> > CPU: 0 PID: 1 Comm: swapper/0 Tainted: G     U            5.17.0-rc1
> > Hardware name: Google Delbin/Delbin, BIOS Google_Delbin.13672.156.3 05/=
14/2021
> > RIP: 0010:tgl_get_bw_info+0x2de/0x510
> > ...
> > [    2.554467] Call Trace:
> > [    2.554467]  <TASK>
> > [    2.554467]  intel_bw_init_hw+0x14a/0x434
> > [    2.554467]  ? _printk+0x59/0x73
> > [    2.554467]  ? _dev_err+0x77/0x91
> > [    2.554467]  i915_driver_hw_probe+0x329/0x33e
> > [    2.554467]  i915_driver_probe+0x4c8/0x638
> > [    2.554467]  i915_pci_probe+0xf8/0x14e
> > [    2.554467]  ? _raw_spin_unlock_irqrestore+0x12/0x2c
> > [    2.554467]  pci_device_probe+0xaa/0x142
> > [    2.554467]  really_probe+0x13f/0x2f4
> > [    2.554467]  __driver_probe_device+0x9e/0xd3
> > [    2.554467]  driver_probe_device+0x24/0x7c
> > [    2.554467]  __driver_attach+0xba/0xcf
> > [    2.554467]  ? driver_attach+0x1f/0x1f
> > [    2.554467]  bus_for_each_dev+0x8c/0xc0
> > [    2.554467]  bus_add_driver+0x11b/0x1f7
> > [    2.554467]  driver_register+0x60/0xea
> > [    2.554467]  ? mipi_dsi_bus_init+0x16/0x16
> > [    2.554467]  i915_init+0x2c/0xb9
> > [    2.554467]  ? mipi_dsi_bus_init+0x16/0x16
> > [    2.554467]  do_one_initcall+0x12e/0x2b3
> > [    2.554467]  do_initcall_level+0xd6/0xf3
> > [    2.554467]  do_initcalls+0x4e/0x79
> > [    2.554467]  kernel_init_freeable+0xed/0x14d
> > [    2.554467]  ? rest_init+0xc1/0xc1
> > [    2.554467]  kernel_init+0x1a/0x120
> > [    2.554467]  ret_from_fork+0x1f/0x30
> > [    2.554467]  </TASK>
> > ...
> > Kernel panic - not syncing: Fatal exception
> >
> > Fixes: c64a9a7c05be ("drm/i915: Update memory bandwidth formulae")
> > Signed-off-by: =C5=81ukasz Bartosik <lb@semihalf.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_bw.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/=
i915/display/intel_bw.c
> > index 2da4aacc956b..bd0ed68b7faa 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bw.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> > @@ -404,15 +404,17 @@ static int tgl_get_bw_info(struct drm_i915_privat=
e *dev_priv, const struct intel
> >               int clpchgroup;
> >               int j;
> >
> > -             if (i < num_groups - 1)
> > -                     bi_next =3D &dev_priv->max_bw[i + 1];
> > -
> >               clpchgroup =3D (sa->deburst * qi.deinterleave / num_chann=
els) << i;
> >
> > -             if (i < num_groups - 1 && clpchgroup < clperchgroup)
> > -                     bi_next->num_planes =3D (ipqdepth - clpchgroup) /=
 clpchgroup + 1;
> > -             else
> > -                     bi_next->num_planes =3D 0;
> > +             if (i < num_groups - 1) {
> > +                     bi_next =3D &dev_priv->max_bw[i + 1];
> > +
> > +                     if (clpchgroup < clperchgroup)
> > +                             bi_next->num_planes =3D (ipqdepth - clpch=
group) /
> > +                                                    clpchgroup + 1;
> > +                     else
> > +                             bi_next->num_planes =3D 0;
> > +             }
> >
> >               bi->num_qgv_points =3D qi.num_points;
> >               bi->num_psf_gv_points =3D qi.num_psf_points;
> > --
> > 2.35.0.rc2.247.g8bbb082509-goog
> >
> >
>
> Was this patch ever applied or was the issue fixed in a different way?
> If CONFIG_INIT_STACK_ALL_ZERO is enabled (it is on by default when the
> compiler supports it), bi_next will be deterministically initialized to
> NULL, which means 'bi_next->num_planes =3D 0' will crash when the first i=
f
> statement is not taken (i.e. 'i > num_groups - 1'). This was reported to
> us at [1] so it impacts real users (and I have been applying this change
> locally for six months). I see some discussion in this thread, was it
> ever resolved?
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/1626
>
> Cheers,
> Nathan

The patch was not accepted by upstream. I gave up after sending two reminde=
rs
that the issue is still present which resulted in no upstream reaction.
I have been also applying that patch locally for a few months.
Thanks for bringing it up to upstream attention again.
