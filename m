Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A5866EB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 18:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC66E896;
	Thu,  8 Aug 2019 16:23:21 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3A6E896
 for <dri-devel@freedesktop.org>; Thu,  8 Aug 2019 16:23:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x19so85533475eda.12
 for <dri-devel@freedesktop.org>; Thu, 08 Aug 2019 09:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgugZ61bCxU6b/H1joSb5oFdYZ8VNfAk9mATlNOvQCE=;
 b=gko+q3pPRjfkYD60trwSkwCygly3QhoiEsbpTd7AXzCIQ75t3Yg4V2LK+rmwD37xkY
 HgBCVomnmVyZ4LYVkzGRJpY2thkBAdK3ZdOSyojfi+mSJZ3VYBi5EDK2wo9fcAg7HZbt
 0NGlwFIuaumtr2I01dQLy8PCjUW3nyHvz1TXzATdjQtjI9X/9PrW8T+NFPcg2a5pslJD
 LHCawF/Kpc3rVPWhCdhBovxaIaPbS4TPrrUk6cgLMeb8cHWUDNXmk6yO7cnOysPMYKk2
 Uth7Uj7CcSTLRDMrIu1a+Vp5JqKjxNBTOof7NBSuLwzhViW518cAluZwuRBFxfYVf6X8
 7pog==
X-Gm-Message-State: APjAAAU/aMyZsv+MwQDhbfujsJ56fFwUQc5h6A0cifNKRh0+yGW1QMh9
 7vmWd9cOacMfwCEYQC2mplG2SHDy9eyvr8KdGW7T6g==
X-Google-Smtp-Source: APXvYqwdFn8aOlX3ji713wCqESSi72qsK12BkwdeQL2nDsmup5Ufso8kiWVepkI7tutj9q4i6y2ie3CCSnB70jQPE8o=
X-Received: by 2002:a05:6402:1351:: with SMTP id
 y17mr16611090edw.18.1565281398121; 
 Thu, 08 Aug 2019 09:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131402.14519-1-lionel.g.landwerlin@intel.com>
 <20190808131402.14519-2-lionel.g.landwerlin@intel.com>
 <1df1b652-ee72-e5f8-7ed0-acbfa9f89f58@amd.com>
 <c44f567b-1745-8dd2-927b-e7d1d5f7d568@intel.com>
 <a2d7f184-294f-c339-9e2d-684dde24b265@amd.com>
 <3c50cb73-a795-a13e-219b-8ed549ae55b2@intel.com>
 <5072aa73-c4b8-e4bf-67ba-ce6d603c24f9@amd.com>
 <fcb1f4f2-2c96-b9f8-a95c-7b0178e0a66b@intel.com>
 <1e225329-3d10-1a80-cca8-fe6f4b57fdfb@amd.com>
 <001b9250-e62c-4eb3-38c4-1ebffc3ac6ca@intel.com>
 <jpj2hq-gc4rtpn2vzyj-4d9mg2-idv0dc-g9aoyh-tnn7jq-3ji9nb-u7bc16lcz1gx-m949odea8admiqio0k-dawo4sbud2lr-yyfxz9-we1fbj-nve980-vo8wox-dpxeok-1g0ghu-27hadecortp7-dx288y.1565277745885@email.android.com>
 <59a0dd5c-0048-4c70-3c8f-dc2e83b3261e@amd.com>
In-Reply-To: <59a0dd5c-0048-4c70-3c8f-dc2e83b3261e@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 8 Aug 2019 11:23:05 -0500
Message-ID: <CAOFGe95duM+626zzf0S=WcZ+wMFa=pyw=ohhecRi6a8_Rz_owg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mltQQVRDSCB2MyAxLzFdIGRybS9zeW5jb2JqOiBhZGQgc2lkZWJhbg==?=
 =?UTF-8?B?ZCBwYXlsb2Fk?=
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zgugZ61bCxU6b/H1joSb5oFdYZ8VNfAk9mATlNOvQCE=;
 b=AdGDRjUP8YCNXg8RxCn9ZeIoWiKU6eK4zpOGF5vjhUcouPQfYMtkaFBtY4tjp7wrDC
 7ELBLH9LEnv8wCMxrare9WnR3Cznbk1GUTHYFTuLAo6lRTjvfyg5krPHNcqHhNqP3t6w
 6Z5xLrXxFdFKiLixp8MYBs0060B84ZRsBfWbM59cBitXIpAak0TOcvMvic925SlzRUfo
 sdq/aUvPlBzGsTGWlSKI40j0luznS77aZkjfOp5hUciCZAolJjept10D+/li+l9ZB/il
 8oO5Ptnr7s6OZJFOw0w1+GsmDvD1kYmNg5wlU328eiIMmh+UrZpabDaaT+T9z5hbk3gz
 mBjA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@freedesktop.org" <dri-devel@freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0332585830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0332585830==
Content-Type: multipart/alternative; boundary="000000000000b57cd8058f9d79de"

--000000000000b57cd8058f9d79de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've got a couple questions that I think go along the lines of what
Christian wrote:

1. Should it really be called sideband?  It's a very generic term for what
is currently a very generic thing.  However, maybe we don't want it to be
so generic?

2. Do we really want get/set?  Or do we want get/increment?  We have to do
the get/increment during vkQueueSubmit on both the wait and the signal side
but get+add+set is a bit heavy.  I guess you could do one bit get of all
the binary semaphores and then a set for all the signaled ones which sets
them to the previous value + 1.

My concern with making it a super-generic thing is that it has an extremely
specific use and in order for cross-process sharing to work, all users have
to use it exactly the same way.  We could call it a "reserved value" or
something like that to make it more clear what the intention is.  In any
case, we should make sure that it's very clearly documented in the design
doc.

On Thu, Aug 8, 2019 at 10:26 AM Koenig, Christian <Christian.Koenig@amd.com=
>
wrote:

> Yeah, the idea is indeed rather clever. I'm just wondering if we don't
> need to optimize it even more.
>
> In other words could some IOCTL overhead be saved here if we directly tak=
e
> the value for binary semaphores waits and signals?
>
> Christian.
>
> Am 08.08.19 um 17:23 schrieb Zhou, David(ChunMing):
>
> Thank you, I got your mean.
> when you have sideband payload, you will go into timeline path. Clever!
>
> -David
>
> -------- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 --------
> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: [PATCH v3 1/1] drm/syncobj: add sideband p=
ayload
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9ALionel Landwerlin
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A"Zhou, David(ChunMing)" ,dri-devel@fr=
eedesktop.org
> =E6=8A=84=E9=80=81=EF=BC=9A"Koenig, Christian" ,Jason Ekstrand ,"Zhou, Da=
vid(ChunMing)"
>
> On 08/08/2019 17:48, Chunming Zhou wrote:
> > =E5=9C=A8 2019/8/8 22:34, Lionel Landwerlin =E5=86=99=E9=81=93:
> >> On 08/08/2019 17:16, Chunming Zhou wrote:
> >>> =E5=9C=A8 2019/8/8 22:01, Lionel Landwerlin =E5=86=99=E9=81=93:
> >>>> On 08/08/2019 16:42, Chunming Zhou wrote:
> >>>>> No, I just see your comment "The next vkQueueSubmit()
> >>>>> waiting on a the syncobj will read the sideband payload and wait fo=
r
> a
> >>>>> fence chain element with a seqno superior or equal to the sideband
> >>>>> payload value to be added into the fence chain and use that fence t=
o
> >>>>> trigger the submission on the kernel driver. ".
> >>>> That was meant to say wait on the chain fence to reach the sideband
> >>>> payload value.
> >>>>
> >>>> It a bit confusing but I can't see any other way to word it.
> >>>>
> >>>>
> >>>>> In that, you mentioned wait for sideband.
> >>>>> So I want to know we how to use that, maybe I miss something in
> >>>>> previous
> >>>>> discussing thread.
> >>>> In QueueSubmit(), we start by reading the sideband payloads :
> >>>>
> https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_=
semaphore_prep/src/intel/vulkan/anv_queue.c#L655
> >>>>
> >>>>
> >>>> Then build everything for the submission and hand it over to the
> >>>> submission thread.
> >>>>
> >>>> Instead of the just waiting on the timeline semaphore values, we als=
o
> >>>> wait on the binary semaphore sideband payload values.
> >>> Waiting on timeline values is when finding fence in kernel.
> >>
> >> Hmm aren't you waiting in a thread in userspace?
> > Yes, For timeline case, we can use waitForSyncobj()..., At begin of
> > QueueThread, I let it wait in cs_ioctl when drm_syncobj_find_fence.
> >
> > But I still didn't get how to wait on sideband for binary Syncobj.
> >
> > Ah, I see, you will compare it in your QueueThread, if sideband value i=
s
> >   >=3D expected, then do submission, otherwise, loop QueueThread, right=
?
>
>
> Just treat binary semaphores as timelines and waitForSyncobj on the
> sideband payload value.
>
> It should make the submission thread any busier than currently.
>
>
> -Lionel
>
>
> >
> > That sounds the QueueThread will be always busy.
> >
> > -David
> >
> >
> >>
> >>> But I don't see how to wait/block in kernel when finding fence for
> >>> binary sideband payload  values.
> >>
> >> Essentially our driver now handles timelines & binary semaphore using
> >> dma-fence-chain in both cases.
> >
> >
> >> Only with timelines we take the values submitted by the vulkan
> >> application.
> >
> >> The binary semaphore auto increment on vkQueueSubmit() and that is
> >> managed by the userspace driver.
> >>
> >>
> >> -Lionel
> >>
> >>
> >>>
> >>> -David
> >>>
> >>>> Finally before exiting the QueueSubmit() call, we bump the sideband
> >>>> payloads of all the binary semaphores have have been signaled :
> >>>>
> https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_=
semaphore_prep/src/intel/vulkan/anv_queue.c#L806
> >>>>
> >>>>
> >>>>
> >>>> Whoever calls QueueSubmit() after that will pickup the new sideband
> >>>> payload values to wait on.
> >>>>
> >>>>
> >>>> -Lionel
> >>>>
> >>>>
> >>>>
> >>>>> -DAvid
> >>>>>
> >>>>>
> >>>>> =E5=9C=A8 2019/8/8 21:38, Lionel Landwerlin =E5=86=99=E9=81=93:
> >>>>>> Interesting question :)
> >>>>>>
> >>>>>> I didn't see any usecase for that.
> >>>>>> This sideband payload value is used for a wait so waiting on the
> wait
> >>>>>> value for another wait is bit meta :)
> >>>>>>
> >>>>>> Do you have a use case for that?
> >>>>>>
> >>>>>> -Lionel
> >>>>>>
> >>>>>> On 08/08/2019 16:23, Chunming Zhou wrote:
> >>>>>>> The propursal is fine with me.
> >>>>>>>
> >>>>>>> one question:
> >>>>>>>
> >>>>>>> how to wait sideband payload? Following patch will show that?
> >>>>>>>
> >>>>>>> -David
> >>>>>>>
> >>>>>>> =E5=9C=A8 2019/8/8 21:14, Lionel Landwerlin =E5=86=99=E9=81=93:
> >>>>>>>> The Vulkan timeline semaphores allow signaling to happen on the
> >>>>>>>> point
> >>>>>>>> of the timeline without all of the its dependencies to be create=
d.
> >>>>>>>>
> >>>>>>>> The current 2 implementations (AMD/Intel) of the Vulkan spec on
> >>>>>>>> top of
> >>>>>>>> the Linux kernel are using a thread to wait on the dependencies
> >>>>>>>> of a
> >>>>>>>> given point to materialize and delay actual submission to the
> >>>>>>>> kernel
> >>>>>>>> driver until the wait completes.
> >>>>>>>>
> >>>>>>>> If a binary semaphore is submitted for signaling along the side
> >>>>>>>> of a
> >>>>>>>> timeline semaphore waiting for completion that means that the dr=
m
> >>>>>>>> syncobj associated with that binary semaphore will not have a DM=
A
> >>>>>>>> fence associated with it by the time vkQueueSubmit() returns. Th=
is
> >>>>>>>> and
> >>>>>>>> the fact that a binary semaphore can be signaled and unsignaled =
as
> >>>>>>>> before its DMA fences materialize mean that we cannot just rely =
on
> >>>>>>>> the
> >>>>>>>> fence within the syncobj but we also need a sideband payload
> >>>>>>>> verifying
> >>>>>>>> that the fence in the syncobj matches the last submission from t=
he
> >>>>>>>> Vulkan API point of view.
> >>>>>>>>
> >>>>>>>> This change adds a sideband payload that is incremented with
> >>>>>>>> signaled
> >>>>>>>> syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()
> >>>>>>>> waiting on a the syncobj will read the sideband payload and wait
> >>>>>>>> for a
> >>>>>>>> fence chain element with a seqno superior or equal to the sideba=
nd
> >>>>>>>> payload value to be added into the fence chain and use that
> >>>>>>>> fence to
> >>>>>>>> trigger the submission on the kernel driver.
> >>>>>>>>
> >>>>>>>> v2: Use a separate ioctl to get/set the sideband value (Christia=
n)
> >>>>>>>>
> >>>>>>>> v3: Use 2 ioctls for get/set (Christian)
> >>>>>>>>
> >>>>>>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> <lionel.g.landwerlin@intel.com>
> >>>>>>>> Cc: Christian Koenig <Christian.Koenig@amd.com>
> <Christian.Koenig@amd.com>
> >>>>>>>> Cc: Jason Ekstrand <jason@jlekstrand.net> <jason@jlekstrand.net>
> >>>>>>>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
> <David1.Zhou@amd.com>
> >>>>>>>> ---
> >>>>>>>>       drivers/gpu/drm/drm_internal.h |  4 ++
> >>>>>>>>       drivers/gpu/drm/drm_ioctl.c    |  5 +++
> >>>>>>>>       drivers/gpu/drm/drm_syncobj.c  | 79
> >>>>>>>> +++++++++++++++++++++++++++++++++-
> >>>>>>>>       include/drm/drm_syncobj.h      |  9 ++++
> >>>>>>>>       include/uapi/drm/drm.h         |  2 +
> >>>>>>>>       5 files changed, 98 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/drm_internal.h
> >>>>>>>> b/drivers/gpu/drm/drm_internal.h
> >>>>>>>> index 51a2055c8f18..0c9736199df0 100644
> >>>>>>>> --- a/drivers/gpu/drm/drm_internal.h
> >>>>>>>> +++ b/drivers/gpu/drm/drm_internal.h
> >>>>>>>> @@ -208,6 +208,10 @@ int drm_syncobj_timeline_signal_ioctl(struc=
t
> >>>>>>>> drm_device *dev, void *data,
> >>>>>>>>                             struct drm_file *file_private);
> >>>>>>>>       int drm_syncobj_query_ioctl(struct drm_device *dev, void
> >>>>>>>> *data,
> >>>>>>>>                       struct drm_file *file_private);
> >>>>>>>> +int drm_syncobj_get_sideband_ioctl(struct drm_device *dev, void
> >>>>>>>> *data,
> >>>>>>>> +                   struct drm_file *file_private);
> >>>>>>>> +int drm_syncobj_set_sideband_ioctl(struct drm_device *dev, void
> >>>>>>>> *data,
> >>>>>>>> +                   struct drm_file *file_private);
> >>>>>>>>          /* drm_framebuffer.c */
> >>>>>>>>       void drm_framebuffer_print_info(struct drm_printer *p,
> >>>>>>>> unsigned
> >>>>>>>> int indent,
> >>>>>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c
> >>>>>>>> b/drivers/gpu/drm/drm_ioctl.c
> >>>>>>>> index f675a3bb2c88..48500bf62801 100644
> >>>>>>>> --- a/drivers/gpu/drm/drm_ioctl.c
> >>>>>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
> >>>>>>>> @@ -703,6 +703,11 @@ static const struct drm_ioctl_desc
> >>>>>>>> drm_ioctls[]
> >>>>>>>> =3D {
> >>>>>>>>                     DRM_RENDER_ALLOW),
> >>>>>>>>           DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY,
> >>>>>>>> drm_syncobj_query_ioctl,
> >>>>>>>>                     DRM_RENDER_ALLOW),
> >>>>>>>> +    DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_GET_SIDEBAND,
> >>>>>>>> drm_syncobj_get_sideband_ioctl,
> >>>>>>>> +              DRM_RENDER_ALLOW),
> >>>>>>>> +    DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SET_SIDEBAND,
> >>>>>>>> drm_syncobj_set_sideband_ioctl,
> >>>>>>>> +              DRM_RENDER_ALLOW),
> >>>>>>>> +
> >>>>>>>>           DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,
> >>>>>>>> drm_crtc_get_sequence_ioctl, 0),
> >>>>>>>>           DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,
> >>>>>>>> drm_crtc_queue_sequence_ioctl, 0),
> >>>>>>>>           DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,
> >>>>>>>> drm_mode_create_lease_ioctl, DRM_MASTER),
> >>>>>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c
> >>>>>>>> b/drivers/gpu/drm/drm_syncobj.c
> >>>>>>>> index b927e482e554..c90ef20b9242 100644
> >>>>>>>> --- a/drivers/gpu/drm/drm_syncobj.c
> >>>>>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
> >>>>>>>> @@ -1150,8 +1150,10 @@ drm_syncobj_reset_ioctl(struct drm_device
> >>>>>>>> *dev, void *data,
> >>>>>>>>           if (ret < 0)
> >>>>>>>>               return ret;
> >>>>>>>>       -    for (i =3D 0; i < args->count_handles; i++)
> >>>>>>>> +    for (i =3D 0; i < args->count_handles; i++) {
> >>>>>>>>               drm_syncobj_replace_fence(syncobjs[i], NULL);
> >>>>>>>> +        syncobjs[i]->sideband_payload =3D 0;
> >>>>>>>> +    }
> >>>>>>>>              drm_syncobj_array_free(syncobjs,
> args->count_handles);
> >>>>>>>>       @@ -1321,6 +1323,81 @@ int drm_syncobj_query_ioctl(struct
> >>>>>>>> drm_device *dev, void *data,
> >>>>>>>>               if (ret)
> >>>>>>>>                   break;
> >>>>>>>>           }
> >>>>>>>> +
> >>>>>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles);
> >>>>>>>> +
> >>>>>>>> +    return ret;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +int drm_syncobj_get_sideband_ioctl(struct drm_device *dev, void
> >>>>>>>> *data,
> >>>>>>>> +                   struct drm_file *file_private)
> >>>>>>>> +{
> >>>>>>>> +    struct drm_syncobj_timeline_array *args =3D data;
> >>>>>>>> +    struct drm_syncobj **syncobjs;
> >>>>>>>> +    uint64_t __user *points =3D u64_to_user_ptr(args->points);
> >>>>>>>> +    uint32_t i;
> >>>>>>>> +    int ret;
> >>>>>>>> +
> >>>>>>>> +    if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> >>>>>>>> +        return -EOPNOTSUPP;
> >>>>>>>> +
> >>>>>>>> +    if (args->pad !=3D 0)
> >>>>>>>> +        return -EINVAL;
> >>>>>>>> +
> >>>>>>>> +    if (args->count_handles =3D=3D 0)
> >>>>>>>> +        return -EINVAL;
> >>>>>>>> +
> >>>>>>>> +    ret =3D drm_syncobj_array_find(file_private,
> >>>>>>>> + u64_to_user_ptr(args->handles),
> >>>>>>>> +                     args->count_handles,
> >>>>>>>> +                     &syncobjs);
> >>>>>>>> +    if (ret < 0)
> >>>>>>>> +        return ret;
> >>>>>>>> +
> >>>>>>>> +    for (i =3D 0; i < args->count_handles; i++) {
> >>>>>>>> +        copy_to_user(&points[i], &syncobjs[i]->sideband_payload=
,
> >>>>>>>> sizeof(uint64_t));
> >>>>>>>> +        ret =3D ret ? -EFAULT : 0;
> >>>>>>>> +        if (ret)
> >>>>>>>> +            break;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles);
> >>>>>>>> +
> >>>>>>>> +    return ret;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>> +int drm_syncobj_set_sideband_ioctl(struct drm_device *dev, void
> >>>>>>>> *data,
> >>>>>>>> +                   struct drm_file *file_private)
> >>>>>>>> +{
> >>>>>>>> +    struct drm_syncobj_timeline_array *args =3D data;
> >>>>>>>> +    struct drm_syncobj **syncobjs;
> >>>>>>>> +    uint64_t __user *points =3D u64_to_user_ptr(args->points);
> >>>>>>>> +    uint32_t i;
> >>>>>>>> +    int ret;
> >>>>>>>> +
> >>>>>>>> +    if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> >>>>>>>> +        return -EOPNOTSUPP;
> >>>>>>>> +
> >>>>>>>> +    if (args->pad !=3D 0)
> >>>>>>>> +        return -EINVAL;
> >>>>>>>> +
> >>>>>>>> +    if (args->count_handles =3D=3D 0)
> >>>>>>>> +        return -EINVAL;
> >>>>>>>> +
> >>>>>>>> +    ret =3D drm_syncobj_array_find(file_private,
> >>>>>>>> + u64_to_user_ptr(args->handles),
> >>>>>>>> +                     args->count_handles,
> >>>>>>>> +                     &syncobjs);
> >>>>>>>> +    if (ret < 0)
> >>>>>>>> +        return ret;
> >>>>>>>> +
> >>>>>>>> +    for (i =3D 0; i < args->count_handles; i++) {
> >>>>>>>> + copy_from_user(&syncobjs[i]->sideband_payload, &points[i],
> >>>>>>>> sizeof(uint64_t));
> >>>>>>>> +        ret =3D ret ? -EFAULT : 0;
> >>>>>>>> +        if (ret)
> >>>>>>>> +            break;
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>>           drm_syncobj_array_free(syncobjs, args->count_handles);
> >>>>>>>>              return ret;
> >>>>>>>> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj=
.h
> >>>>>>>> index 6cf7243a1dc5..b587b8e07547 100644
> >>>>>>>> --- a/include/drm/drm_syncobj.h
> >>>>>>>> +++ b/include/drm/drm_syncobj.h
> >>>>>>>> @@ -61,6 +61,15 @@ struct drm_syncobj {
> >>>>>>>>            * @file: A file backing for this syncobj.
> >>>>>>>>            */
> >>>>>>>>           struct file *file;
> >>>>>>>> +    /**
> >>>>>>>> +     * @sideband_payload: A 64bit side band payload.
> >>>>>>>> +     *
> >>>>>>>> +     * We use the sideband payload value to wait on binary
> syncobj
> >>>>>>>> fences
> >>>>>>>> +     * to materialize. It is a reservation mechanism for the
> >>>>>>>> signaler to
> >>>>>>>> +     * express that at some point in the future a dma fence wit=
h
> >>>>>>>> the same
> >>>>>>>> +     * seqno will be put into the syncobj.
> >>>>>>>> +     */
> >>>>>>>> +    u64 sideband_payload;
> >>>>>>>>       };
> >>>>>>>>          void drm_syncobj_free(struct kref *kref);
> >>>>>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> >>>>>>>> index 8a5b2f8f8eb9..cffdc6c9772c 100644
> >>>>>>>> --- a/include/uapi/drm/drm.h
> >>>>>>>> +++ b/include/uapi/drm/drm.h
> >>>>>>>> @@ -946,6 +946,8 @@ extern "C" {
> >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_QUERY DRM_IOWR(0xCB, struct
> >>>>>>>> drm_syncobj_timeline_array)
> >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_TRANSFER DRM_IOWR(0xCC, struct
> >>>>>>>> drm_syncobj_transfer)
> >>>>>>>>       #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL DRM_IOWR(0xCD,
> >>>>>>>> struct drm_syncobj_timeline_array)
> >>>>>>>> +#define DRM_IOCTL_SYNCOBJ_GET_SIDEBAND DRM_IOR(0xCE, struct
> >>>>>>>> drm_syncobj_timeline_array)
> >>>>>>>> +#define DRM_IOCTL_SYNCOBJ_SET_SIDEBAND DRM_IOWR(0xCF, struct
> >>>>>>>> drm_syncobj_timeline_array)
> >>>>>>>>          /**
> >>>>>>>>        * Device specific ioctls should only be in their respecti=
ve
> >>>>>>>> headers
> >>
>
>
>

--000000000000b57cd8058f9d79de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve got a couple questions that I think go along=
 the lines of what Christian wrote:</div><div><br></div><div>1. Should it r=
eally be called sideband?=C2=A0 It&#39;s a very generic term for what is cu=
rrently a very generic thing.=C2=A0 However, maybe we don&#39;t want it to =
be so generic?</div><div><br></div><div>2. Do we really want get/set?=C2=A0=
 Or do we want get/increment?=C2=A0 We have to do the get/increment during =
vkQueueSubmit on both the wait and the signal side but get+add+set is a bit=
 heavy.=C2=A0 I guess you could do one bit get of all the binary semaphores=
 and then a set for all the signaled ones which sets them to the previous v=
alue + 1.</div><div><br></div><div>My concern with making it a super-generi=
c thing is that it has an extremely specific use and in order for cross-pro=
cess sharing to work, all users have to use it exactly the same way.=C2=A0 =
We could call it a &quot;reserved value&quot; or something like that to mak=
e it more clear what the intention is.=C2=A0 In any case, we should make su=
re that it&#39;s very clearly documented in the design doc.<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug =
8, 2019 at 10:26 AM Koenig, Christian &lt;<a href=3D"mailto:Christian.Koeni=
g@amd.com">Christian.Koenig@amd.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">



<div bgcolor=3D"#FFFFFF">
<div class=3D"gmail-m_7409227408945320520moz-cite-prefix">Yeah, the idea is=
 indeed rather clever. I&#39;m just wondering if we don&#39;t need to optim=
ize it even more.<br>
<br>
In other words could some IOCTL overhead be saved here if we directly take =
the value for binary semaphores waits and signals?<br>
<br>
Christian.<br>
<br>
Am 08.08.19 um 17:23 schrieb Zhou, David(ChunMing):<br>
</div>
<blockquote type=3D"cite">


<div>Thank you, I got your mean.<br>
when you have sideband payload, you will go into timeline path. Clever!<br>
<br>
-David<br>
<br>
-------- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 --------<br>
=E4=B8=BB=E9=A2=98=EF=BC=9ARe: [PATCH v3 1/1] drm/syncobj: add sideband pay=
load<br>
=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9ALionel Landwerlin <br>
=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A&quot;Zhou, David(ChunMing)&quot; ,<a c=
lass=3D"gmail-m_7409227408945320520moz-txt-link-abbreviated" href=3D"mailto=
:dri-devel@freedesktop.org" target=3D"_blank">dri-devel@freedesktop.org</a>=
<br>
=E6=8A=84=E9=80=81=EF=BC=9A&quot;Koenig, Christian&quot; ,Jason Ekstrand ,&=
quot;Zhou, David(ChunMing)&quot; <br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"gmail-m_7409227408945320520PlainText">On 08/08/2019 17:48, Ch=
unming Zhou wrote:<br>
&gt; =E5=9C=A8 2019/8/8 22:34, Lionel Landwerlin =E5=86=99=E9=81=93:<br>
&gt;&gt; On 08/08/2019 17:16, Chunming Zhou wrote:<br>
&gt;&gt;&gt; =E5=9C=A8 2019/8/8 22:01, Lionel Landwerlin =E5=86=99=E9=81=93=
:<br>
&gt;&gt;&gt;&gt; On 08/08/2019 16:42, Chunming Zhou wrote:<br>
&gt;&gt;&gt;&gt;&gt; No, I just see your comment &quot;The next vkQueueSubm=
it()<br>
&gt;&gt;&gt;&gt;&gt; waiting on a the syncobj will read the sideband payloa=
d and wait for a<br>
&gt;&gt;&gt;&gt;&gt; fence chain element with a seqno superior or equal to =
the sideband<br>
&gt;&gt;&gt;&gt;&gt; payload value to be added into the fence chain and use=
 that fence to<br>
&gt;&gt;&gt;&gt;&gt; trigger the submission on the kernel driver. &quot;.<b=
r>
&gt;&gt;&gt;&gt; That was meant to say wait on the chain fence to reach the=
 sideband<br>
&gt;&gt;&gt;&gt; payload value.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It a bit confusing but I can&#39;t see any other way to wo=
rd it.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In that, you mentioned wait for sideband.<br>
&gt;&gt;&gt;&gt;&gt; So I want to know we how to use that, maybe I miss som=
ething in<br>
&gt;&gt;&gt;&gt;&gt; previous<br>
&gt;&gt;&gt;&gt;&gt; discussing thread.<br>
&gt;&gt;&gt;&gt; In QueueSubmit(), we start by reading the sideband payload=
s :<br>
&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.freedesktop.org/llandwerlin/mesa=
/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L655"=
 target=3D"_blank">
https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_se=
maphore_prep/src/intel/vulkan/anv_queue.c#L655</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Then build everything for the submission and hand it over =
to the<br>
&gt;&gt;&gt;&gt; submission thread.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Instead of the just waiting on the timeline semaphore valu=
es, we also<br>
&gt;&gt;&gt;&gt; wait on the binary semaphore sideband payload values.<br>
&gt;&gt;&gt; Waiting on timeline values is when finding fence in kernel.<br=
>
&gt;&gt;<br>
&gt;&gt; Hmm aren&#39;t you waiting in a thread in userspace?<br>
&gt; Yes, For timeline case, we can use waitForSyncobj()..., At begin of<br=
>
&gt; QueueThread, I let it wait in cs_ioctl when drm_syncobj_find_fence.<br=
>
&gt;<br>
&gt; But I still didn&#39;t get how to wait on sideband for binary Syncobj.=
<br>
&gt;<br>
&gt; Ah, I see, you will compare it in your QueueThread, if sideband value =
is<br>
&gt;=C2=A0=C2=A0 &gt;=3D expected, then do submission, otherwise, loop Queu=
eThread, right?<br>
<br>
<br>
Just treat binary semaphores as timelines and waitForSyncobj on the <br>
sideband payload value.<br>
<br>
It should make the submission thread any busier than currently.<br>
<br>
<br>
-Lionel<br>
<br>
<br>
&gt;<br>
&gt; That sounds the QueueThread will be always busy.<br>
&gt;<br>
&gt; -David<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; But I don&#39;t see how to wait/block in kernel when finding f=
ence for<br>
&gt;&gt;&gt; binary sideband payload=C2=A0 values.<br>
&gt;&gt;<br>
&gt;&gt; Essentially our driver now handles timelines &amp; binary semaphor=
e using<br>
&gt;&gt; dma-fence-chain in both cases.<br>
&gt;<br>
&gt;<br>
&gt;&gt; Only with timelines we take the values submitted by the vulkan<br>
&gt;&gt; application.<br>
&gt;<br>
&gt;&gt; The binary semaphore auto increment on vkQueueSubmit() and that is=
<br>
&gt;&gt; managed by the userspace driver.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -Lionel<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -David<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Finally before exiting the QueueSubmit() call, we bump the=
 sideband<br>
&gt;&gt;&gt;&gt; payloads of all the binary semaphores have have been signa=
led :<br>
&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.freedesktop.org/llandwerlin/mesa=
/blob/review/anv-timeline_semaphore_prep/src/intel/vulkan/anv_queue.c#L806"=
 target=3D"_blank">
https://gitlab.freedesktop.org/llandwerlin/mesa/blob/review/anv-timeline_se=
maphore_prep/src/intel/vulkan/anv_queue.c#L806</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Whoever calls QueueSubmit() after that will pickup the new=
 sideband<br>
&gt;&gt;&gt;&gt; payload values to wait on.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -Lionel<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -DAvid<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2019/8/8 21:38, Lionel Landwerlin =E5=86=99=
=E9=81=93:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Interesting question :)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I didn&#39;t see any usecase for that.<br>
&gt;&gt;&gt;&gt;&gt;&gt; This sideband payload value is used for a wait so =
waiting on the wait<br>
&gt;&gt;&gt;&gt;&gt;&gt; value for another wait is bit meta :)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Do you have a use case for that?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; -Lionel<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 08/08/2019 16:23, Chunming Zhou wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; The propursal is fine with me.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; one question:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; how to wait sideband payload? Following patch =
will show that?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -David<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =E5=9C=A8 2019/8/8 21:14, Lionel Landwerlin =
=E5=86=99=E9=81=93:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The Vulkan timeline semaphores allow signa=
ling to happen on the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; point<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of the timeline without all of the its dep=
endencies to be created.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The current 2 implementations (AMD/Intel) =
of the Vulkan spec on<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; top of<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the Linux kernel are using a thread to wai=
t on the dependencies<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; given point to materialize and delay actua=
l submission to the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; kernel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; driver until the wait completes.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; If a binary semaphore is submitted for sig=
naling along the side<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; of a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; timeline semaphore waiting for completion =
that means that the drm<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; syncobj associated with that binary semaph=
ore will not have a DMA<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence associated with it by the time vkQue=
ueSubmit() returns. This<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the fact that a binary semaphore can be si=
gnaled and unsignaled as<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; before its DMA fences materialize mean tha=
t we cannot just rely on<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence within the syncobj but we also need =
a sideband payload<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; verifying<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; that the fence in the syncobj matches the =
last submission from the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Vulkan API point of view.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; This change adds a sideband payload that i=
s incremented with<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; signaled<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; syncobj when vkQueueSubmit() is called. Th=
e next vkQueueSubmit()<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; waiting on a the syncobj will read the sid=
eband payload and wait<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence chain element with a seqno superior =
or equal to the sideband<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; payload value to be added into the fence c=
hain and use that<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fence to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; trigger the submission on the kernel drive=
r.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; v2: Use a separate ioctl to get/set the si=
deband value (Christian)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; v3: Use 2 ioctls for get/set (Christian)<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Lionel Landwerlin <a class=
=3D"gmail-m_7409227408945320520moz-txt-link-rfc2396E" href=3D"mailto:lionel=
.g.landwerlin@intel.com" target=3D"_blank">
&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: Christian Koenig <a class=3D"gmail-m_7=
409227408945320520moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@am=
d.com" target=3D"_blank">
&lt;Christian.Koenig@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: Jason Ekstrand <a class=3D"gmail-m_740=
9227408945320520moz-txt-link-rfc2396E" href=3D"mailto:jason@jlekstrand.net"=
 target=3D"_blank">
&lt;jason@jlekstrand.net&gt;</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: David(ChunMing) Zhou <a class=3D"gmail=
-m_7409227408945320520moz-txt-link-rfc2396E" href=3D"mailto:David1.Zhou@amd=
.com" target=3D"_blank">
&lt;David1.Zhou@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 drivers/gpu=
/drm/drm_internal.h |=C2=A0 4 ++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 drivers/gpu=
/drm/drm_ioctl.c=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 drivers/gpu=
/drm/drm_syncobj.c=C2=A0 | 79<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++++++++++++++++++++++++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 include/drm=
/drm_syncobj.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 include/uap=
i/drm/drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 5 files cha=
nged, 98 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/drm_internal.=
h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/drm_internal.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 51a2055c8f18..0c9736199df0 100644<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/drm_internal.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/drm_internal.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -208,6 +208,10 @@ int drm_syncobj_timel=
ine_signal_ioctl(struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_device *dev, void *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_private=
);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 int drm_syn=
cobj_query_ioctl(struct drm_device *dev, void<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_file *file_private);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int drm_syncobj_get_sideband_ioctl(struct=
 drm_device *dev, void<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t drm_file *file_private);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int drm_syncobj_set_sideband_ioctl(struct=
 drm_device *dev, void<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t drm_file *file_private);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0 /* drm_framebuffer.c */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 void drm_fr=
amebuffer_print_info(struct drm_printer *p,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; unsigned<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; int indent,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/drm_ioctl.c<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/drm_ioctl.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index f675a3bb2c88..48500bf62801 100644<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/drm_ioctl.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/drm_ioctl.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -703,6 +703,11 @@ static const struct d=
rm_ioctl_desc<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_ioctls[]<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =3D {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=
M_RENDER_ALLOW),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_query_ioctl,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=
M_RENDER_ALLOW),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCT=
L_SYNCOBJ_GET_SIDEBAND,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_get_sideband_ioctl,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_RENDER_ALLOW),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCT=
L_SYNCOBJ_SET_SIDEBAND,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_set_sideband_ioctl,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_RENDER_ALLOW),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_crtc_get_sequence_ioctl, 0),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_crtc_queue_sequence_ioctl, 0),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_mode_create_lease_ioctl, DRM_MASTER),<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/drm_syncobj.c=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index b927e482e554..c90ef20b9242 100644<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/drm_syncobj.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -1150,8 +1150,10 @@ drm_syncobj_reset_i=
octl(struct drm_device<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *dev, void *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (ret &lt; 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=
=A0=C2=A0 for (i =3D 0; i &lt; args-&gt;count_handles; i++)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; a=
rgs-&gt;count_handles; i++) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_syncobj_replace_fence(syncobjs[i],=
 NULL);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 syncobjs[i]-&gt;sideband_payload =3D 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_syncobj_array_free(syncobjs, args-&gt;count=
_handles);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 @@ -1321,6 =
+1323,81 @@ int drm_syncobj_query_ioctl(struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_device *dev, void *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 drm_syncobj_array_free=
(syncobjs, args-&gt;count_handles);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int drm_syncobj_get_sideband_ioctl(struct=
 drm_device *dev, void<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t drm_file *file_private)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct drm_syncobj_tim=
eline_array *args =3D data;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct drm_syncobj **s=
yncobjs;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t __user *point=
s =3D u64_to_user_ptr(args-&gt;points);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t i;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 int ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!drm_core_check_fe=
ature(dev, DRIVER_SYNCOBJ_TIMELINE))<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EOPNOTSUPP;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (args-&gt;pad !=3D =
0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (args-&gt;count_han=
dles =3D=3D 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 ret =3D drm_syncobj_ar=
ray_find(file_private,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + u64_to_user_ptr(args-&gt;handles),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args-&gt;count_handles,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &amp;syncobjs);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (ret &lt; 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; a=
rgs-&gt;count_handles; i++) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 copy_to_user(&amp;points[i], &amp;syncobjs[i]-&gt;sideband_payload,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; sizeof(uint64_t));<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D ret ? -EFAULT : 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 drm_syncobj_array_free=
(syncobjs, args-&gt;count_handles);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +int drm_syncobj_set_sideband_ioctl(struct=
 drm_device *dev, void<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; *data,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t drm_file *file_private)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct drm_syncobj_tim=
eline_array *args =3D data;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 struct drm_syncobj **s=
yncobjs;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint64_t __user *point=
s =3D u64_to_user_ptr(args-&gt;points);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t i;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 int ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!drm_core_check_fe=
ature(dev, DRIVER_SYNCOBJ_TIMELINE))<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EOPNOTSUPP;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (args-&gt;pad !=3D =
0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (args-&gt;count_han=
dles =3D=3D 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 ret =3D drm_syncobj_ar=
ray_find(file_private,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + u64_to_user_ptr(args-&gt;handles),<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args-&gt;count_handles,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &amp;syncobjs);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (ret &lt; 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; a=
rgs-&gt;count_handles; i++) {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + copy_from_user(&amp;syncobjs[i]-&gt;side=
band_payload, &amp;points[i],<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; sizeof(uint64_t));<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D ret ? -EFAULT : 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_syncobj_array_free(syncobjs, args-&gt;count_handles);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/include/drm/drm_syncobj.h b/i=
nclude/drm/drm_syncobj.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 6cf7243a1dc5..b587b8e07547 100644<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/include/drm/drm_syncobj.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/include/drm/drm_syncobj.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -61,6 +61,15 @@ struct drm_syncobj {<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * @file: A file backing for this syncobj.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct file *file;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 /**<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * @sideband_payl=
oad: A 64bit side band payload.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 *<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * We use the sid=
eband payload value to wait on binary syncobj<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; fences<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * to materialize=
. It is a reservation mechanism for the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; signaler to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * express that a=
t some point in the future a dma fence with<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the same<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * seqno will be =
put into the syncobj.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 u64 sideband_payload;<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0 void drm_syncobj_free(struct kref *kref);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/include/uapi/drm/drm.h b/incl=
ude/uapi/drm/drm.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 8a5b2f8f8eb9..cffdc6c9772c 100644<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/include/uapi/drm/drm.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/include/uapi/drm/drm.h<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -946,6 +946,8 @@ extern &quot;C&quot; {=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #define DRM=
_IOCTL_SYNCOBJ_QUERY DRM_IOWR(0xCB, struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_timeline_array)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #define DRM=
_IOCTL_SYNCOBJ_TRANSFER DRM_IOWR(0xCC, struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_transfer)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #define DRM=
_IOCTL_SYNCOBJ_TIMELINE_SIGNAL DRM_IOWR(0xCD,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; struct drm_syncobj_timeline_array)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define DRM_IOCTL_SYNCOBJ_GET_SIDEBAND DR=
M_IOR(0xCE, struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_timeline_array)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define DRM_IOCTL_SYNCOBJ_SET_SIDEBAND DR=
M_IOWR(0xCF, struct<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_syncobj_timeline_array)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0 /**<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Dev=
ice specific ioctls should only be in their respective<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; headers<br>
&gt;&gt;<br>
<br>
</div>
</span></font></blockquote>
<br>
</div>

</blockquote></div></div>

--000000000000b57cd8058f9d79de--

--===============0332585830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0332585830==--
