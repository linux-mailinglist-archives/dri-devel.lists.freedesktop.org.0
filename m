Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14950AF5A3C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C235910E242;
	Wed,  2 Jul 2025 13:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kBhp3TQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F410E242;
 Wed,  2 Jul 2025 13:54:53 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-313290ea247so1106939a91.3; 
 Wed, 02 Jul 2025 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751464493; x=1752069293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guEO+X2TlstsCPyD5rnbkNBVqzNfH7Sc2OBJNfyq+ZM=;
 b=kBhp3TQsMhWmhVhsDMlXMwuYPx9T0YGefFTufKVsCS1VDHjGO2OlOk95A90T9Uc7/7
 LxGdJIDkPa+1mYjtHM8ur4AZ6zrCGpu7wEfa6B/ob/eG2k2AIw8qCP28DGSTVNjeg8Az
 /EBB0Sm1/uQKd+rC7//pHCJ2ObQ+IwNEq8pzucpv9ZfEg/l/ksoCY7fKwE+zpn/kylcn
 qIJBzcyj+X2U6J+FFkylUIHZ/w3x86NmiWYzIQX2F+A3rTH6gz+YGvTlaDX+vuD3eSfI
 x4GNBXWWPfbo4/I1iazNBl5UkbJ8F6lEJxEnFY3ETDz/wUSYywDh529j3qEWwPko4BZO
 +v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751464493; x=1752069293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=guEO+X2TlstsCPyD5rnbkNBVqzNfH7Sc2OBJNfyq+ZM=;
 b=uAFUq0NmOKeVEu6IFKkH9wZk4gEAmez6KHc8+p0fBqDiM3qOKGL1xn76AMnHnJv3Aj
 /RaZ4vrNRvuJq9ufr+ZEp8eKafQsGUIhycpJBtR36PKu4nhn1ykyaGTixKJd8uzlfXW1
 9/EDoo4ph53DpiLm4DzMJWOZWpV5R3clH4zzeEkmxN4Y37N9ixw02oUSTdg/tMaoxWb/
 BFQUMIOBCZ02UIfA6pSkGOKJ8WMhuuhenhkv+SwQfg3wejg6Tn24Os7oOjErp8bVIbZx
 jtSI6aMEt6IVumukbDPCxoxLXPqeu4MnLHZ9AXuZSMwFN/Qj0dYSQOVOXTrhAxkNiLiL
 tYTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4C7NXLMg+6rPxaGh2oL3FuYRDGsvevC06N/gWmAYkjFPqYCwPN6l4wqRtjD/b0JZfnD5bl/8flg1E@lists.freedesktop.org,
 AJvYcCVlanN2o6uYo1V/IQQpUKCh+7eot9Iru3/vu7tBBp0rTvzWZ0dOJmKH9MXITtc4gOgVaNGnAKU0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzev0k5Y2hamPKUB+GOm1YjG7gryaYU01fwt9UaUM1/HkiZz/Y9
 AqyQEfcx0jbNWDFf4QrHEJKJ9x5qkVJ/qBVq/b9Eqd5fYF4lzVyuGIkVX8gUNcLEo5sFfIb+vD6
 h70akFSJIC8GDKrfjGNU68HDjSjNOLI0=
X-Gm-Gg: ASbGncsh/DAR3WijvFjR4n1bGP/b9l0apcJOcPqUhCh7jux7j+ThXPvOjWq1i7fwxmB
 DVlMirBeK0NCdmVvz8ODRWhbBzGnzD3/laIHnUPVX24vXhHuweHYN8cnxKyV7vZiRULPHdRuGLz
 MjV94jB+izlI3JS4uaWbAINA4i4qSsimFLVzxe9ktf8qAU
X-Google-Smtp-Source: AGHT+IGz9xeZKYvy5a2NukWtiE7Le0rFEBMYvJw3zExK04u12YuSeV52WPllxSnaAX6EzjHaGyjLIxgzJ53817LFsk4=
X-Received: by 2002:a17:90b:35c5:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-31a90bdc410mr1767000a91.3.1751464493199; Wed, 02 Jul 2025
 06:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
 <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
 <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
 <1e82f0af-daf6-4dd6-bc43-2969ac970589@amd.com>
In-Reply-To: <1e82f0af-daf6-4dd6-bc43-2969ac970589@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Jul 2025 09:54:39 -0400
X-Gm-Features: Ac12FXyRsLYdypBJymECkaaNjTssfLfSQkcuc1lxngJzDfTT75YxJid0fH1rcK4
Message-ID: <CADnq5_M_NWSbqJUrBcDy_bARrPcQDDhSvHCKCqEoTWijBWHxGg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: Sam <guoqzhan@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
 "rafael@kernel.org" <rafael@kernel.org>, 
 "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, 
 "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun" <HaiJun.Chang@amd.com>, 
 "Ma, Qing (Mark)" <Qing.Ma@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Wed, Jul 2, 2025 at 3:24=E2=80=AFAM Sam <guoqzhan@amd.com> wrote:
>
>
> On 2025/7/2 00:07, Alex Deucher wrote:
> > On Tue, Jul 1, 2025 at 4:32=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >> On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
> >>> thaw() is called before writing the hiberation image to swap disk. Se=
e
> >>> the doc here.
> >>> https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api=
/pm/devices.rst?plain=3D1#L552 <https://github.com/torvalds/linux/blob/v6.1=
4/Documentation/driver-api/pm/devices.rst?plain=3D1#L552>
> >>>
> >>> And amdgpu implemented thaw() callback by calling amdgpu_device_resum=
e().
> >>> https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdg=
pu/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers=
/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
> >>>
> >>> This patch is skip amdgpu_amdkfd_resume_process() call in thaw() duri=
ng
> >>> hibernation. it is not skipped in restore() during resume from
> >>> hibernation when system boot again.
> >>>
> >>>
> >>> I just found the following kernel doc. Thaw() is intended to resume t=
he
> >>> storage device for saving the hibernation image.
> >> Ah, that makes much more sense.
> >>
> >>> Our GPU is not involved
> >>> in it, it is not necessary to resume our GPU in thaw().
> >>> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.=
rst?plain=3D1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentat=
ion/power/pci.rst?plain=3D1#L588>
> >>>
> >>> So another implementation is to remove the amdgpu_device_resume() cal=
l
> >>> in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
> >>> amdgpu_pci_shutdown()for hibernation.
> >>> Initial tests show it's working fine for hibernation successful case.
> >>> Should I switch to this implementation?
> >> No idea. Alex and the KFD guys need to take a look at that.
> >>
> >>> But thaw() is also called to restore the GPU when hibernation is abor=
ted
> >>> due to some error in hibernation image creation stage. In this case,
> >>> amdgpu_device_resume() is needed in thaw().
> >>>
> >>> So I need a method to check if hibernation is aborted or not to
> >>> conditionally skip amdgpu_device_resume() in thaw(). Currently I don'=
t
> >>> know how to do this.
> >> Yeah that approach here looks fishy to me, but I don't know how to pro=
perly fix it either.
> >>
> >> @Alex any idea?
> > Yeah, I'm not sure how to handle that.  I don't see a way to avoid
> > having all of the callbacks.  We could ideally skip some of the steps.
> > Maybe we could optimize the freeze and thaw routines if we had some
> > hint from the pm core about why we were getting called.  E.g., thaw
> > after a failed hibernation restore.
> >
> > Alex
>
>
> I just found pm_transition variable can be used to check if hibernation
> is cancelled (PM_EVENT_RECOVER) or not(PM_EVENT_THAW) in thaw(). I just
> need to export this variable in kernel.
> https://github.com/torvalds/linux/blob/master/drivers/base/power/main.c#L=
64
>
> Provided pm_transition is available, should we skip
> amdgpu_amdkfd_resume_process() only, or skip amdgpu_device_resume()
> completely?

Hmmm.  Still not sure how best to handle this.  For entering
hibernation, all we really need is freeze().  Once we are done with
that we don't need thaw() or poweroff() for hibernation as we've
already suspended in freeze() so there is nothing else to do.  For
exiting hibernation, we need freeze() to suspend and then either
thaw() (if the hibernation image is bad) or restore() (if the
hibernation image is good) to resume.

Alex

>
> Regards
> Sam
>
>
> >
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Regards
> >>> Sam
> >>>
> >>>
> >>> On 2025/6/30 19:58, Christian K=C3=B6nig wrote:
> >>>> On 30.06.25 12:41, Samuel Zhang wrote:
> >>>>> The hibernation successful workflow:
> >>>>> - prepare: evict VRAM and swapout GTT BOs
> >>>>> - freeze
> >>>>> - create the hibernation image in system memory
> >>>>> - thaw: swapin and restore BOs
> >>>> Why should a thaw happen here in between?
> >>>>
> >>>>> - complete
> >>>>> - write hibernation image to disk
> >>>>> - amdgpu_pci_shutdown
> >>>>> - goto S5, turn off the system.
> >>>>>
> >>>>> During prepare stage of hibernation, VRAM and GTT BOs will be swapo=
ut to
> >>>>> shmem. Then in thaw stage, all BOs will be swapin and restored.
> >>>> That's not correct. This is done by the application starting again a=
nd not during thaw.
> >>>>
> >>>>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
> >>>>> the swapin and restore BOs takes too long (50 minutes) and it is no=
t
> >>>>> necessary since the follow-up stages does not use GPU.
> >>>>>
> >>>>> This patch is to skip BOs restore during thaw to reduce the hiberna=
tion
> >>>>> time.
> >>>> As far as I can see that doesn't make sense. The KFD processes need =
to be resumed here and that can't be skipped.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
> >>>>>    2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_device.c
> >>>>> index a8f4697deb1b..b550d07190a2 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *d=
ev, bool notify_clients)
> >>>>>                amdgpu_virt_init_data_exchange(adev);
> >>>>>                amdgpu_virt_release_full_gpu(adev, true);
> >>>>>
> >>>>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
> >>>>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->=
in_s4)
> >>>>>                        r =3D amdgpu_amdkfd_resume_process(adev);
> >>>>>        }
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_drv.c
> >>>>> index 571b70da4562..23b76e8ac2fd 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct devic=
e *dev)
> >>>>>    static int amdgpu_pmops_restore(struct device *dev)
> >>>>>    {
> >>>>>        struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> >>>>> +    struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> >>>>>
> >>>>> +    adev->in_s4 =3D false;
> >>>>>        return amdgpu_device_resume(drm_dev, true);
> >>>>>    }
> >>>>>
