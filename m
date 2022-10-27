Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470E610003
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 20:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3D810E6C4;
	Thu, 27 Oct 2022 18:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C6D10E6C0;
 Thu, 27 Oct 2022 18:15:52 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso3301656fac.0; 
 Thu, 27 Oct 2022 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+Wu+TPAjCZkDy5/YDkczMFpTvMVRYJJF5b2AjVvf4c=;
 b=UKED/P8RoCBwG7uMbqw+VJh4/5GQ41X17e8irn5D/U/qZQm2A9avme7jWirdsW1+el
 JdrUB2InoBB+hyMoh8hdvOsJ1gv50/8PwJBJn6Uvw7IuQCShCIxX0U2MHw2t8dqskLs/
 smeX1To1lSxeXiPXlRKb9sGggnxrvGEqqhJ+lRLjmm64IOKlzoenl4WQbaUqrT8GGUwp
 5kPo+7YScLYdHpB5/VvgyaaIVzJ0zEjDDIntbd4upPPc0J8R0Tzt8xzkVvy8NvbxE/0p
 NPTIJAT5wfDaxFdSjmQaMgx+aw9NxjovJQ7InSACvF5XAQTHDcLMTAEoRxIjLYz90qe1
 sgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+Wu+TPAjCZkDy5/YDkczMFpTvMVRYJJF5b2AjVvf4c=;
 b=WYV/JdyYJr1UiVKy/zajp/qGQZdTwAVNbeecCcn8JBYmanQ16T/dR5GGD997dlx6Ud
 r1n8cx7f6HLpS8E6qYi+JqHyIVBjUX6Xw8HGbhVUj1/mifgUrQCGIY8zMWzCkBr5XthB
 RqSBcXzcEySgjgFt0FVo1W4xlcmYIs/slW4XiGeKLBqpsfgtIb0joUbNoGeSAFpMwfDd
 0uwTeY4gRXkrMc19f5DLNEhwLKv6oKs3KdAyl8o664AbJkMq1rqAy31/YF/TbDQ1Cd/4
 Vs5oCar40DMY3mtqBIu6pYAeH971mVrkqha49J04LBcQdSWKBfoeovhkzHzQ3RbeuWK0
 qGFg==
X-Gm-Message-State: ACrzQf2K3lmOlhIvZc0sepvtJCdA5F6D3EL1oIOc8jyW7SfX4HGlHybf
 /boqY2HYR/rKYXP6hXbbV4PuS/PgEFn1joXT3Yq080sX
X-Google-Smtp-Source: AMsMyM4eFch0KYGpchKeHX6VRLFe4NFJC68PZOtxyZYC+uuMxa86Oo7IGaqq7DKpRaoXWxGm0dRkY0X6CBQqrRwiV0I=
X-Received: by 2002:a05:6870:a116:b0:13a:f9de:6fd0 with SMTP id
 m22-20020a056870a11600b0013af9de6fd0mr6449558oae.46.1666894551272; Thu, 27
 Oct 2022 11:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
 <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>
 <ede1abed-d45f-6fb6-cf40-edbffece5eac@suse.de>
In-Reply-To: <ede1abed-d45f-6fb6-cf40-edbffece5eac@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Oct 2022 14:15:39 -0400
Message-ID: <CADnq5_PNwJjizV816fKL4y69Mzp5sf3JyZ2caAuGPr-p61pP0w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 3:25 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 24.10.22 um 18:48 schrieb Alex Deucher:
> > On Mon, Oct 24, 2022 at 3:33 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Hi
> >>
> >> Am 24.10.22 um 08:20 schrieb Quan, Evan:
> >>> [AMD Official Use Only - General]
> >>>
> >>> Reviewed-by: Evan Quan <evan.quan@amd.com>
> >>>
> >>>> -----Original Message-----
> >>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of A=
lex
> >>>> Deucher
> >>>> Sent: Thursday, October 20, 2022 10:36 PM
> >>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> >>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Thomas
> >>>> Zimmermann <tzimmermann@suse.de>
> >>>> Subject: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
> >>>> lastclose()
> >>>>
> >>>> It's used to restore the fbdev console, but as amdgpu uses
> >>>> generic fbdev emulation, the console is being restored by the
> >>>> DRM client helpers already. See the call to drm_client_dev_restore()
> >>>> in drm_lastclose().
> >>>>
> >>>> Fixes: 087451f372bf76 ("drm/amdgpu: use generic fb helpers instead o=
f
> >>>> setting up AMD own's.")
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 1 -
> >>>>    1 file changed, 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>>> index fe23e09eec98..474b9f40f792 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >>>> @@ -1106,7 +1106,6 @@ int amdgpu_info_ioctl(struct drm_device *dev,
> >>>> void *data, struct drm_file *filp)
> >>>>     */
> >>>>    void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> >>>>    {
> >>>> -    drm_fb_helper_lastclose(dev);
> >>>>       vga_switcheroo_process_delayed_switch();
> >>>>    }
> >>
> >> Without the call to drm_fb_helper_lastclose(), the console emulation
> >> will be restored by drm_client_dev_restore() from drm_lastclose(). [1]
> >> It means that it's now changing order with the call to
> >> vga_switcheroo_process_delay_switch(). Can this become a problem?
> >>
> >> I looked at the other callers of that function. Most restore the conso=
le
> >> before doing the switcheroo. Nouveau doesn't seem to care about the
> >> console at all.
> >
> > I don't know off hand.  I suppose if the switch powered down the GPU
> > and then we tried to restore it's console state that would be a
> > problem, but it looks like vga_switchto_stage2() just powers down the
> > GPU without going through suspend so I'm not sure if this actually
> > worked correctly?  What are the potential problems with calling
> > drm_fb_helper_lastclose twice?
>
> It should do fbdev console modesetting twice; so no problem.
>
> AFAIU calling vga switcheroo does nothing for devices without support.
> So let's call vga_switcheroo_process_delayed_switch() at the very end of
> drm_lastclose() and remove the amdgpu callback entirely. [1]  This
> should not be a problem and if, we can refactor the whole function.

Sounds like a plan.  Thanks!

Alex

>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_file.c=
#L468
>
> >
> > Alex
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >> [1]
> >> https://elixir.bootlin.com/linux/v6.0.3/source/drivers/gpu/drm/drm_fil=
e.c#L467
> >>
> >>>>
> >>>> --
> >>>> 2.37.3
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
