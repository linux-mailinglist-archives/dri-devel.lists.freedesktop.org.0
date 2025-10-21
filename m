Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9ABF6C1A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46910E5EB;
	Tue, 21 Oct 2025 13:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BnxfrFB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F5310E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:26:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B9D543BFE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2EFC4CEF1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761053165;
 bh=l5B0Si4dV1mn1P7dRpJ0SyzIK7iXnYqSyWh7PIk+0Xs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BnxfrFB4VVKzK/Bhk3PsuYXUhUmDIy5xjVWKPOxfa7kmY7HpIEACXGZzv2KYRuWI+
 +LBPO8lowIelydB8sMSpIttqv5Wywk5b22NVyJHTuWxGtLVGtBEh2tu8m3KNjhygPo
 GzrOfXPVF1Ku+4q0Uo+tL77xQSdSzbKr6/dhjJviQRnLMpEKO9cWJS+Dh0da64RF/g
 f3C2JuS+kt7cpYjJayrwpcqyC0ek67O4veaQrSUmF5UXY7fV3tOkVg1Y1bITJoDQeC
 heih+sOJCPQRu2Reu90je8HxJOpJfaZ/N6senclm9u1F3xyU+eC5NREbtj3rzYB4pF
 WCHgQZtHV47BA==
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-64a760e5281so1612241eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 06:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUetNPhdm5lfcaMyDUKhgRnzAOIiiJgtUhyPsD9/aKABve7YNtiLbxjT174tm1VfBaIbUBa3kfYAfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvmDkdDrpAXY7PgL0fHkN+RFo6UDTxx82LlMwdzL+4wC8q111m
 97nywNtWKmDfVwrg5Q+sfSM+Gclc8v96+J5y04c2gAKXfD/pVQjqHEDYSuGo6laNI+mXk9iyzeA
 vvA/AyQsqEpDNNjHJJQgmmvQVNbahHOw=
X-Google-Smtp-Source: AGHT+IGw+JI5D3znF3WuBey1LUB0tjcaTtWFEccFr77KYqoQfofh/SJJ5CXHENuA7OivDO/ts5GKHcWLVn8pLdIaFSU=
X-Received: by 2002:a05:6808:a606:10b0:444:1450:c1 with SMTP id
 5614622812f47-444145018b1mr4046386b6e.64.1761053164231; Tue, 21 Oct 2025
 06:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
 <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
 <85c039ef-e189-48c1-8bf7-50ac0c2484e2@kernel.org>
 <CAJZ5v0gT9BG5QPcwg6jJ1Jghny2YxC9_HY542LTBy-aVc_2T_w@mail.gmail.com>
 <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
 <CAJZ5v0gMf-qMGa6iBL2NdRXd-Mt5cpsoVQ90y+rSyK5xoYEf8A@mail.gmail.com>
 <aa04dea5-d35b-46c9-9501-0a2e79ecbd79@kernel.org>
 <CAJZ5v0j=sw9X3mV2ddOD_-qJwxveXQ1faD6HWtStLo9xOpwYKA@mail.gmail.com>
 <57f073e8-f600-4bdf-b3b9-a34df882cbdb@kernel.org>
 <CAJZ5v0jWou0vxNZhe-pU-wQyWxhikaDkF+ZO0rsUieXs_nYjjQ@mail.gmail.com>
 <1b86e583-1f3a-4192-8864-d2a60a8787e1@kernel.org>
In-Reply-To: <1b86e583-1f3a-4192-8864-d2a60a8787e1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 21 Oct 2025 15:25:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jrMqUj8mJi7iNfkgeaz--MMuDYbVEzA9myr_UgHPFo+Q@mail.gmail.com>
X-Gm-Features: AS18NWDwxj5rkN_SVQh0C-ka6NsLf6vdaG-aEDwXcKWg9HJROLfq4U3ypMcJmoA
Message-ID: <CAJZ5v0jrMqUj8mJi7iNfkgeaz--MMuDYbVEzA9myr_UgHPFo+Q@mail.gmail.com>
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

On Mon, Oct 20, 2025 at 11:09=E2=80=AFPM Mario Limonciello (AMD) (kernel.or=
g)
<superm1@kernel.org> wrote:
>
>
>
> On 10/20/2025 2:55 PM, Rafael J. Wysocki wrote:
> > On Mon, Oct 20, 2025 at 9:34=E2=80=AFPM Mario Limonciello (AMD) (kernel=
.org)
> > <superm1@kernel.org> wrote:
> >>
> >>
> >>
> >> On 10/20/2025 2:18 PM, Rafael J. Wysocki wrote:
> >>> On Mon, Oct 20, 2025 at 9:14=E2=80=AFPM Mario Limonciello (AMD) (kern=
el.org)
> >>> <superm1@kernel.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 10/20/2025 1:50 PM, Rafael J. Wysocki wrote:
> >>>>> On Mon, Oct 20, 2025 at 8:32=E2=80=AFPM Mario Limonciello (AMD) (ke=
rnel.org)
> >>>>> <superm1@kernel.org> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 10/20/2025 12:39 PM, Rafael J. Wysocki wrote:
> >>>>>>> On Mon, Oct 20, 2025 at 7:28=E2=80=AFPM Mario Limonciello (AMD) (=
kernel.org)
> >>>>>>> <superm1@kernel.org> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 10/20/2025 12:21 PM, Rafael J. Wysocki wrote:
> >>>>>>>>> On Mon, Oct 20, 2025 at 6:53=E2=80=AFPM Mario Limonciello (AMD)
> >>>>>>>>> <superm1@kernel.org> wrote:
> >>>>>>>>>>
> >>>>>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>>>>>
> >>>>>>>>>> The PM core should be notified that thaw was skipped for the d=
evice
> >>>>>>>>>> so that if it's tried to be resumed (such as an aborted hibern=
ate)
> >>>>>>>>>> that it gets another chance to resume.
> >>>>>>>>>>
> >>>>>>>>>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> >>>>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>>>>> ---
> >>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
> >>>>>>>>>>       1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>>>> index 61268aa82df4d..d40af069f24dd 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>>>> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct devi=
ce *dev)
> >>>>>>>>>>
> >>>>>>>>>>              /* do not resume device if it's normal hibernatio=
n */
> >>>>>>>>>>              if (!pm_hibernate_is_recovering() && !pm_hibernat=
ion_mode_is_suspend())
> >>>>>>>>>> -               return 0;
> >>>>>>>>>> +               return -EBUSY;
> >>>>>>>>>
> >>>>>>>>> So that's why you need the special handling of -EBUSY in the pr=
evious patch.
> >>>>>>>>
> >>>>>>>> Yup.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> I think that you need to save some state in this driver and the=
n use
> >>>>>>>>> it in subsequent callbacks instead of hacking the core to do wh=
at you
> >>>>>>>>> want.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> The problem is the core decides "what" to call and more importan=
tly
> >>>>>>>> "when" to call it.
> >>>>>>>>
> >>>>>>>> IE if the core thinks that something is thawed it will never cal=
l
> >>>>>>>> resume, and that's why you end up in a bad place with Muhammad's
> >>>>>>>> cancellation series and why I proposed this one to discuss.
> >>>>>>>>
> >>>>>>>> We could obviously go back to dropping this case entirely:
> >>>>>>>>
> >>>>>>>> if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_sus=
pend())
> >>>>>>>>
> >>>>>>>> But then the display turns on at thaw(), you do an unnecessary r=
esource
> >>>>>>>> eviction, it takes a lot longer if you have a ton of VRAM etc.
> >>>>>>>
> >>>>>>> The cancellation series is at odds with this code path AFAICS bec=
ause
> >>>>>>> what if hibernation is canceled after the entire thaw transition?
> >>>>>>
> >>>>>> Muhammad - did you test that specific timing of cancelling the hib=
ernate?
> >>>>>>>
> >>>>>>> Some cleanup would need to be done before thawing user space I su=
ppose.
> >>>>>>
> >>>>>> I agree; I think that series would need changes for it.
> >>>>>>
> >>>>>> But if you put that series aside, I think this one still has some =
merit
> >>>>>> on it's own.  If another driver aborted the hibernate, I think the=
 same
> >>>>>> thing could happen if it happened to run before amdgpu's device th=
aw().
> >>>>>>
> >>>>>> That series just exposed a very "easy" way to reproduce this issue=
.
> >>>>>
> >>>>> Device thaw errors don't abort anything AFAICS.
> >>>>>
> >>>>
> >>>> You're right; it doesn't abort, it just is saved to the logs.
> >>>> The state is also not maintained.
> >>>>> What can happen though is that another device may abort the final
> >>>>> "power off" transition, which is one of the reasons why I think tha=
t
> >>>>> rolling it back is generally hard.
> >>>>
> >>>> That's exactly the reason for the first patch in this series.  The s=
tate
> >>>> of whether it succeeded isn't recorded.  So if thaw non-fatally fail=
s
> >>>> and you've saved state to indicate this then any of the other calls =
that
> >>>> run can try again.
> >>>
> >>> So long as they are called.
> >>>
> >>> But as I said before, I would save the state in the driver thaw
> >>> callback and then clear it in the driver poweroff callback and look a=
t
> >>> it in the driver restore callback.  If it is there at that point,
> >>> poweroff has not run and hibernation is rolling back, so you need to
> >>> do a "thaw".
> >>
> >> Are you suggesting that the device driver should directly manipulate
> >> dev->power.is_suspended?
> >
> > No, it needs to have its own state for that.  power.is_suspended
> > should not be manipulated by drivers (or anything other than the core
> > for that matter).
>
> That's what I originally thought which is why this series looks like it
> does.
>
> >
> >> I'll do some testing but; I suppose that would work as well without
> >> needing to make core changes if you don't see a need for other devices
> >> to do this.
> >
> > So long as they don't try to skip the "thaw" actions, I don't.
> >
> > If there are more drivers wanting to do it, I guess it would be good
> > to have a common approach although at this point I'm not sure how much
> > in common there would be.
>
> But so if the state is maintained in the driver dev->power.is_suspended
> will be FALSE at the end of thaw().  That means that restore() is never
> called for a cancellation/abort.

OK, I see what you mean.

The failing scenario is when "thaw" leaves the devices in "freeze" and
then "poweroff" is not called because the final transition is aborted
and so "restore" is not called either and the device remains "frozen".

> So I think the only place to do the cleanup would be in the complete()
> callback.  Do you think that's the best place for this based upon that
> internal driver state variable?

It would be if nothing else depended on the device in question, but I
somehow suspect that it is not the case.

I think that you need to trigger a "restore" for the "frozen" device
in the right order with respect to the rest of dpm_list.  I guess you
could add a special power.frozen flag that will be set by drivers
leaving their devices in a "frozen" state in their "thaw" callback.
Then, it could be converted to power.is_suspended in the error path of
dpm_suspend() for "poweroff" transitions.
