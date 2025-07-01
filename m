Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73774AEFF06
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFC710E2C6;
	Tue,  1 Jul 2025 16:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R5U0HOiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6D10E2C6;
 Tue,  1 Jul 2025 16:07:22 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-312efc384fcso753382a91.3; 
 Tue, 01 Jul 2025 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751386042; x=1751990842; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s5/kLm6bcjzmUmo8TOBM6JrD/Wu1K8ZqjA08OXVfrw=;
 b=R5U0HOizSNgfaI8lSkJbprm9z/tmzpnJ4xo76xuTSbecx3MlbkjeSLhV1AbbuJf3LB
 4NzUxdypUSawkHr/e9TTKghS+0kOZHSe1yohbMHi5CzvJEYPwEC/v+Q5IrSwZUyz1E+C
 0MWVFgxO6jetbQZELpsX7ONVMfDcjmdWJPNCeQpB5tPz/RXekRJyAmNlYuDGkHU68xXB
 iuUgn94MVyo16m8QB34T1pgx2scClr6l4R+05lhDo36GVkll57Y1VFUuGxKoqWD5wVAN
 4fYHIm8N4ZAm+mB2wvxYosXx44N3M5Cm08paj9xydJxtxA5HQIVQeg/pemXf9AS7NlVj
 nXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386042; x=1751990842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s5/kLm6bcjzmUmo8TOBM6JrD/Wu1K8ZqjA08OXVfrw=;
 b=HR69JH04iMyJeQpAFuD9aDD3bejmNFSXM3ILSTwnFbhj39Di8NFCzdgjIQKmOnVPu5
 2LmHotY13YkE5yC4B0hY8Ezk/4lSAbRSY1tA0VMPq3KKyRKSOW3Wr4xJenwqPLaZ8zhD
 RrPsYURGIp1e9UXCaGzfjGDE63XAF0iYNzJVihI3FhXewgQR/EBP39pB7SvHriLc8zEE
 TzF5LI++G4IJY3xVXD6GsnsuUgtrCfdD74OAPmwbSqYVEIepm4Q7a+xkpoVztRw0SAq6
 AKQTIba1QVKR2bFvcEyhn8PziiFJm7FP+7U6+u0SwDGxLv/MqpIFvchkH8V1orw/2N7+
 cZEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHFpxOjY8n/WDlaWTDmDkkVIVRHk8PaWSNoMj73y9En/Yb5e6lzILBELNJDIhCKel4+c2hwrxBE3Mr@lists.freedesktop.org,
 AJvYcCV7Y3k3WDmWFS80ctMzectxx3/OW/hgxPmj/Ae9CUBL891ZZeoBaRVtTgyIaoUFYxl6yP3U8vTs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7jShyudaVJmsWFZLbYIS6EoUuFyb7QNJ4ozI/IUM9fFhMdvAg
 rzIaikTP71EaF3zSeSZ9ehbs8IzZoecSMxn1/6lbqSm3KyThqFR5UnIaAp4d0HYdqvvoBnh0trQ
 DpPkotIoFDuTpN/qR1yA28h+tlqyZAlo=
X-Gm-Gg: ASbGncuHghFdMABsN1iH7CwdwKfGJ2eunBya3k12Y59dzfErEz/c3kf8iwhMHLnAKSr
 UvN+3ZS2GYO1tHfxGtI6T5lBjUkHKX37DKGFrldZ/DEWJr17dZ0k2HBgXZSFuNUaK0RBu+u7/h3
 xV4/2x2COFDKxgPiY8cQHbZAxji3/5V2AFO0368LNDWK6M
X-Google-Smtp-Source: AGHT+IFQJNo7HwID/TeXlAbTPbbNefXtXxAG2rRd8AEgaEOCEY9ozjNHRKWsTXfzbsIfuCVK/y+uC5IX0mQc9ZwS12g=
X-Received: by 2002:a17:90b:180e:b0:310:8d54:3209 with SMTP id
 98e67ed59e1d1-31a800bba6bmr1931961a91.2.1751386042181; Tue, 01 Jul 2025
 09:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
 <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
In-Reply-To: <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jul 2025 12:07:10 -0400
X-Gm-Features: Ac12FXwdbdy8HjwfCgq96-OHQZyxxU6ldvjvewIOGImA43uESTZlF3tB4NQ9pb0
Message-ID: <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
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

On Tue, Jul 1, 2025 at 4:32=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
> >
> > thaw() is called before writing the hiberation image to swap disk. See
> > the doc here.
> > https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/p=
m/devices.rst?plain=3D1#L552 <https://github.com/torvalds/linux/blob/v6.14/=
Documentation/driver-api/pm/devices.rst?plain=3D1#L552>
> >
> > And amdgpu implemented thaw() callback by calling amdgpu_device_resume(=
).
> > https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu=
/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers/g=
pu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
> >
> > This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
> > hibernation. it is not skipped in restore() during resume from
> > hibernation when system boot again.
> >
> >
> > I just found the following kernel doc. Thaw() is intended to resume the
> > storage device for saving the hibernation image.
>
> Ah, that makes much more sense.
>
> > Our GPU is not involved
> > in it, it is not necessary to resume our GPU in thaw().
> > https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rs=
t?plain=3D1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentatio=
n/power/pci.rst?plain=3D1#L588>
> >
> > So another implementation is to remove the amdgpu_device_resume() call
> > in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
> > amdgpu_pci_shutdown()for hibernation.
> > Initial tests show it's working fine for hibernation successful case.
> > Should I switch to this implementation?
>
> No idea. Alex and the KFD guys need to take a look at that.
>
> > But thaw() is also called to restore the GPU when hibernation is aborte=
d
> > due to some error in hibernation image creation stage. In this case,
> > amdgpu_device_resume() is needed in thaw().
> >
> > So I need a method to check if hibernation is aborted or not to
> > conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
> > know how to do this.
>
> Yeah that approach here looks fishy to me, but I don't know how to proper=
ly fix it either.
>
> @Alex any idea?

Yeah, I'm not sure how to handle that.  I don't see a way to avoid
having all of the callbacks.  We could ideally skip some of the steps.
Maybe we could optimize the freeze and thaw routines if we had some
hint from the pm core about why we were getting called.  E.g., thaw
after a failed hibernation restore.

Alex

>
> Regards,
> Christian.
>
> >
> >
> > Regards
> > Sam
> >
> >
> > On 2025/6/30 19:58, Christian K=C3=B6nig wrote:
> >> On 30.06.25 12:41, Samuel Zhang wrote:
> >>> The hibernation successful workflow:
> >>> - prepare: evict VRAM and swapout GTT BOs
> >>> - freeze
> >>> - create the hibernation image in system memory
> >>> - thaw: swapin and restore BOs
> >> Why should a thaw happen here in between?
> >>
> >>> - complete
> >>> - write hibernation image to disk
> >>> - amdgpu_pci_shutdown
> >>> - goto S5, turn off the system.
> >>>
> >>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout=
 to
> >>> shmem. Then in thaw stage, all BOs will be swapin and restored.
> >> That's not correct. This is done by the application starting again and=
 not during thaw.
> >>
> >>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
> >>> the swapin and restore BOs takes too long (50 minutes) and it is not
> >>> necessary since the follow-up stages does not use GPU.
> >>>
> >>> This patch is to skip BOs restore during thaw to reduce the hibernati=
on
> >>> time.
> >> As far as I can see that doesn't make sense. The KFD processes need to=
 be resumed here and that can't be skipped.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
> >>>   2 files changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_device.c
> >>> index a8f4697deb1b..b550d07190a2 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev=
, bool notify_clients)
> >>>               amdgpu_virt_init_data_exchange(adev);
> >>>               amdgpu_virt_release_full_gpu(adev, true);
> >>>
> >>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
> >>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in=
_s4)
> >>>                       r =3D amdgpu_amdkfd_resume_process(adev);
> >>>       }
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
> >>> index 571b70da4562..23b76e8ac2fd 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device =
*dev)
> >>>   static int amdgpu_pmops_restore(struct device *dev)
> >>>   {
> >>>       struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> >>> +    struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> >>>
> >>> +    adev->in_s4 =3D false;
> >>>       return amdgpu_device_resume(drm_dev, true);
> >>>   }
> >>>
> >
>
