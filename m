Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3FBF32C5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 21:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D0110E4C5;
	Mon, 20 Oct 2025 19:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b24E0Gw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EEA10E4C4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:19:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4901662121
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87A3C19421
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760987944;
 bh=J/Fg8bUxzsQ2IgZQRldX5NySPruVgzQRsbMNc0FNNa0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b24E0Gw/KCQi2Xgq3TSX7LDCEQLZChfXKQXBdqKaMonNg+zAaxec6vIQhu/tNTn9u
 OefnScfkAQg2mr2s6orenu180PFMli/U95d6F1v95zfX9Q6oHUz3WQNOcsrxA3uyuD
 nYs2BpjZ7VQQrtAZJINzy+9vMyDxwcHuleXkrZHUnuamRBC87+yBF8YltQKW1A/WG8
 DPx9lbMZz573XW95TNjfHG2bGr+65gvA98HAVP+liqNPdrr/BkqtARp8TQhd8rE2wR
 hNUy0RjvrjV8cNcI4SGio2rfH4Pn6UwOTfvLEuk3zq/euNkcfSeeNgW/zGyJoiS0dU
 3jfnEVUvSsM7Q==
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-443ac88ff96so793178b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 12:19:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgIh+0gtxw51ngoVptx9sDZHKjVVXSPbfqdtQBYBEjkgRG9whI3RnrZibo8FWvgiTqz7NSg4icF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNxC4+Q9btyF/PFzEG5o+3cw6txhVo+auxArf4Qfe82JxGXq6e
 Ct64TkWL9HH48I7EZy+y1NaE0WjcXbSSbtqWsHXs7eu2G24ydA/DE+iF0g6u9Gr2RF8gX32k6yX
 +mZzfe6scfFszRreDQA9qKQJHOAAY3/g=
X-Google-Smtp-Source: AGHT+IEM/IHVfesjnU7C1tyRsx/zEryDAAVIgQX2Cok/4ExdyrEXdnSNRKPKSxZcsGEKLSUnGe93koHhxhnKg2drHoY=
X-Received: by 2002:a05:6808:d46:b0:441:8f74:e84 with SMTP id
 5614622812f47-443a3099e92mr6321887b6e.62.1760987944138; Mon, 20 Oct 2025
 12:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
 <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
 <85c039ef-e189-48c1-8bf7-50ac0c2484e2@kernel.org>
 <CAJZ5v0gT9BG5QPcwg6jJ1Jghny2YxC9_HY542LTBy-aVc_2T_w@mail.gmail.com>
 <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
 <CAJZ5v0gMf-qMGa6iBL2NdRXd-Mt5cpsoVQ90y+rSyK5xoYEf8A@mail.gmail.com>
 <aa04dea5-d35b-46c9-9501-0a2e79ecbd79@kernel.org>
In-Reply-To: <aa04dea5-d35b-46c9-9501-0a2e79ecbd79@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 21:18:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j=sw9X3mV2ddOD_-qJwxveXQ1faD6HWtStLo9xOpwYKA@mail.gmail.com>
X-Gm-Features: AS18NWCIGD1552PBhOTdIYxOfP1sqnVlsDjWGNWVpcbA7we01MzHPxSZzmFLQoU
Message-ID: <CAJZ5v0j=sw9X3mV2ddOD_-qJwxveXQ1faD6HWtStLo9xOpwYKA@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, mario.limonciello@amd.com,
 airlied@gmail.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, dakr@kernel.org, 
 gregkh@linuxfoundation.org, lenb@kernel.org, pavel@kernel.org, 
 simona@ffwll.ch, Muhammad Usama Anjum <usama.anjum@collabora.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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

On Mon, Oct 20, 2025 at 9:14=E2=80=AFPM Mario Limonciello (AMD) (kernel.org=
)
<superm1@kernel.org> wrote:
>
>
>
> On 10/20/2025 1:50 PM, Rafael J. Wysocki wrote:
> > On Mon, Oct 20, 2025 at 8:32=E2=80=AFPM Mario Limonciello (AMD) (kernel=
.org)
> > <superm1@kernel.org> wrote:
> >>
> >>
> >>
> >> On 10/20/2025 12:39 PM, Rafael J. Wysocki wrote:
> >>> On Mon, Oct 20, 2025 at 7:28=E2=80=AFPM Mario Limonciello (AMD) (kern=
el.org)
> >>> <superm1@kernel.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 10/20/2025 12:21 PM, Rafael J. Wysocki wrote:
> >>>>> On Mon, Oct 20, 2025 at 6:53=E2=80=AFPM Mario Limonciello (AMD)
> >>>>> <superm1@kernel.org> wrote:
> >>>>>>
> >>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>
> >>>>>> The PM core should be notified that thaw was skipped for the devic=
e
> >>>>>> so that if it's tried to be resumed (such as an aborted hibernate)
> >>>>>> that it gets another chance to resume.
> >>>>>>
> >>>>>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> >>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
> >>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> index 61268aa82df4d..d40af069f24dd 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *=
dev)
> >>>>>>
> >>>>>>            /* do not resume device if it's normal hibernation */
> >>>>>>            if (!pm_hibernate_is_recovering() && !pm_hibernation_mo=
de_is_suspend())
> >>>>>> -               return 0;
> >>>>>> +               return -EBUSY;
> >>>>>
> >>>>> So that's why you need the special handling of -EBUSY in the previo=
us patch.
> >>>>
> >>>> Yup.
> >>>>
> >>>>>
> >>>>> I think that you need to save some state in this driver and then us=
e
> >>>>> it in subsequent callbacks instead of hacking the core to do what y=
ou
> >>>>> want.
> >>>>>
> >>>>
> >>>> The problem is the core decides "what" to call and more importantly
> >>>> "when" to call it.
> >>>>
> >>>> IE if the core thinks that something is thawed it will never call
> >>>> resume, and that's why you end up in a bad place with Muhammad's
> >>>> cancellation series and why I proposed this one to discuss.
> >>>>
> >>>> We could obviously go back to dropping this case entirely:
> >>>>
> >>>> if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend=
())
> >>>>
> >>>> But then the display turns on at thaw(), you do an unnecessary resou=
rce
> >>>> eviction, it takes a lot longer if you have a ton of VRAM etc.
> >>>
> >>> The cancellation series is at odds with this code path AFAICS because
> >>> what if hibernation is canceled after the entire thaw transition?
> >>
> >> Muhammad - did you test that specific timing of cancelling the hiberna=
te?
> >>>
> >>> Some cleanup would need to be done before thawing user space I suppos=
e.
> >>
> >> I agree; I think that series would need changes for it.
> >>
> >> But if you put that series aside, I think this one still has some meri=
t
> >> on it's own.  If another driver aborted the hibernate, I think the sam=
e
> >> thing could happen if it happened to run before amdgpu's device thaw()=
.
> >>
> >> That series just exposed a very "easy" way to reproduce this issue.
> >
> > Device thaw errors don't abort anything AFAICS.
> >
>
> You're right; it doesn't abort, it just is saved to the logs.
> The state is also not maintained.
> > What can happen though is that another device may abort the final
> > "power off" transition, which is one of the reasons why I think that
> > rolling it back is generally hard.
>
> That's exactly the reason for the first patch in this series.  The state
> of whether it succeeded isn't recorded.  So if thaw non-fatally fails
> and you've saved state to indicate this then any of the other calls that
> run can try again.

So long as they are called.

But as I said before, I would save the state in the driver thaw
callback and then clear it in the driver poweroff callback and look at
it in the driver restore callback.  If it is there at that point,
poweroff has not run and hibernation is rolling back, so you need to
do a "thaw".
