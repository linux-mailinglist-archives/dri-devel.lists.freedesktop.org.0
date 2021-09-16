Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A140D0AB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 02:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91F36EA3E;
	Thu, 16 Sep 2021 00:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F7F6EA3E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 00:11:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h17so9988930edj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 17:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x/p8Ukf+cVkbel6GjISKglKUFQGNiHOBH3QzOZMHS7k=;
 b=iDSfhyjY2CkJHRyDUezHx6WGtOc9WXv0bil3QZtIHW9ZOFgHcInxWEqcemhkV7h4qG
 s5VIHrLLwcXXWhnezKvaLFVqkweH4U6ptbJp8cZWcojUiM8bvFvWBof1CeGMTGkfwPQA
 u3D1Q6pvRHFkTuaCwrVufrqrL5VOVSfNslLDLaCCsG2LRJGWBpjoqjFHvrWhODQKlSIs
 jiCCvJ0l/P1TWsogcCRfQ+VFcpPWxuU2iBPvm9MFb619oCnfAQ4Fqs+C4rncgORCfljT
 /e1JquNKRxr87hb+a2/u5FQY2vfTdYM6VuD7mw5vKaeFb1Ka8U0smeHmLHkBwOJ7guuE
 30cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x/p8Ukf+cVkbel6GjISKglKUFQGNiHOBH3QzOZMHS7k=;
 b=mlsKIobo23g3XrLtTm91EVNV0U9LL82cE6xwwm6Eb7am0DTCgDwMTuRY2M6sCet77P
 yHW83mZ/LNkrr9KiekVl3QNr4jWXNdXw3qMH8yDdIOFQwMb2So4Ti5yOPZ+BKrTTskAh
 Y+TO1y8WbgElzYPgT0GP7Dl9zUJhggrjWMYjywrxM0h3Uh4YmR1SaBhtBU8L5tqvYrlZ
 thCy7IjQyRdH8ngHwXPGCzbzoIfKS9G4M7414UfpcBCam75W5V0ENFjhEhSOW/F0IfT+
 GvPlo3P1ZKbiCZK6cy0TbcpS/5WcS2PIQ8jEGxm1U5gYLFrfEPY59XjAR3quRpMcI6yE
 xXJQ==
X-Gm-Message-State: AOAM530z4ZcCMdf+f9xOlN6pHEe9RXWhS9OCIv0pssRx1VQcLdIkL6WU
 QVgjvBsp3OUm5FOscSggW0kJQgH0b4iqQcA4Ufs=
X-Google-Smtp-Source: ABdhPJyETfPoTUto7+7H1zkP8DDSFPgfima+M8/+fP+G0AoIZorgc0HVZnC50pLZhs/OeSw2r+EnTQzguS0jejtiJuA=
X-Received: by 2002:a50:af86:: with SMTP id h6mr3045556edd.283.1631751114834; 
 Wed, 15 Sep 2021 17:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-10-gurchetansingh@chromium.org>
 <CAPaKu7RB0hHTW9_WoOvp1X1Wz8L65ptSsJXKcPu22Rm9NKjAFQ@mail.gmail.com>
 <CAAfnVBmRKWgGQ2NXQSK9T4Hc95Yh_bpb=TGvyZgwMzDJdghrTQ@mail.gmail.com>
 <CAPaKu7SvzWPDAOKVSot9W4M880Hgdjm=RbKVrU=nthOaXh_hEg@mail.gmail.com>
 <CAAfnVB=+fpYhnjpbAzAgvYBnH9amRx8Nn0kkSR3PBcqPpjWLbw@mail.gmail.com>
 <CAPaKu7R8RBTE7Njm3HY9kUq-3GGMVWVKf9RHYU9M7UGcSBuPhw@mail.gmail.com>
 <CAAfnVBkF7rjbcCadiYXQcnYxZ6AW72=bA6tqu4EjjszeKeWEHQ@mail.gmail.com>
In-Reply-To: <CAAfnVBkF7rjbcCadiYXQcnYxZ6AW72=bA6tqu4EjjszeKeWEHQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 15 Sep 2021 17:11:43 -0700
Message-ID: <CAPaKu7TLeTAPNnKeF-XkY68VorHGBEDb2XbGAWi2JU89y10qig@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v1 09/12] drm/virtio: implement context init:
 allocate an array of fence contexts
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>
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

 i

On Tue, Sep 14, 2021 at 6:26 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Tue, Sep 14, 2021 at 10:53 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>>
>> ,On Mon, Sep 13, 2021 at 6:57 PM Gurchetan Singh
>> <gurchetansingh@chromium.org> wrote:
>> >
>> >
>> >
>> >
>> > On Mon, Sep 13, 2021 at 11:52 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>> >>
>> >> .
>> >>
>> >> On Mon, Sep 13, 2021 at 10:48 AM Gurchetan Singh
>> >> <gurchetansingh@chromium.org> wrote:
>> >> >
>> >> >
>> >> >
>> >> > On Fri, Sep 10, 2021 at 12:33 PM Chia-I Wu <olvaffe@gmail.com> wrot=
e:
>> >> >>
>> >> >> On Wed, Sep 8, 2021 at 6:37 PM Gurchetan Singh
>> >> >> <gurchetansingh@chromium.org> wrote:
>> >> >> >
>> >> >> > We don't want fences from different 3D contexts (virgl, gfxstrea=
m,
>> >> >> > venus) to be on the same timeline.  With explicit context creati=
on,
>> >> >> > we can specify the number of ring each context wants.
>> >> >> >
>> >> >> > Execbuffer can specify which ring to use.
>> >> >> >
>> >> >> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>> >> >> > Acked-by: Lingfeng Yang <lfy@google.com>
>> >> >> > ---
>> >> >> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
>> >> >> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 +++++++++++++++++++=
+++++--
>> >> >> >  2 files changed, 35 insertions(+), 2 deletions(-)
>> >> >> >
>> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/=
drm/virtio/virtgpu_drv.h
>> >> >> > index a5142d60c2fa..cca9ab505deb 100644
>> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> >> >> > @@ -56,6 +56,7 @@
>> >> >> >  #define STATE_ERR 2
>> >> >> >
>> >> >> >  #define MAX_CAPSET_ID 63
>> >> >> > +#define MAX_RINGS 64
>> >> >> >
>> >> >> >  struct virtio_gpu_object_params {
>> >> >> >         unsigned long size;
>> >> >> > @@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
>> >> >> >         uint32_t ctx_id;
>> >> >> >         uint32_t context_init;
>> >> >> >         bool context_created;
>> >> >> > +       uint32_t num_rings;
>> >> >> > +       uint64_t base_fence_ctx;
>> >> >> >         struct mutex context_lock;
>> >> >> >  };
>> >> >> >
>> >> >> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gp=
u/drm/virtio/virtgpu_ioctl.c
>> >> >> > index f51f3393a194..262f79210283 100644
>> >> >> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> >> >> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> >> >> > @@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct=
 drm_device *dev, void *data,
>> >> >> >         int in_fence_fd =3D exbuf->fence_fd;
>> >> >> >         int out_fence_fd =3D -1;
>> >> >> >         void *buf;
>> >> >> > +       uint64_t fence_ctx;
>> >> >> > +       uint32_t ring_idx;
>> >> >> > +
>> >> >> > +       fence_ctx =3D vgdev->fence_drv.context;
>> >> >> > +       ring_idx =3D 0;
>> >> >> >
>> >> >> >         if (vgdev->has_virgl_3d =3D=3D false)
>> >> >> >                 return -ENOSYS;
>> >> >> > @@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(stru=
ct drm_device *dev, void *data,
>> >> >> >         if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
>> >> >> >                 return -EINVAL;
>> >> >> >
>> >> >> > +       if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
>> >> >> > +               if (exbuf->ring_idx >=3D vfpriv->num_rings)
>> >> >> > +                       return -EINVAL;
>> >> >> > +
>> >> >> > +               if (!vfpriv->base_fence_ctx)
>> >> >> > +                       return -EINVAL;
>> >> >> > +
>> >> >> > +               fence_ctx =3D vfpriv->base_fence_ctx;
>> >> >> > +               ring_idx =3D exbuf->ring_idx;
>> >> >> > +       }
>> >> >> > +
>> >> >> >         exbuf->fence_fd =3D -1;
>> >> >> >
>> >> >> >         virtio_gpu_create_context(dev, file);
>> >> >> > @@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struc=
t drm_device *dev, void *data,
>> >> >> >                         goto out_memdup;
>> >> >> >         }
>> >> >> >
>> >> >> > -       out_fence =3D virtio_gpu_fence_alloc(vgdev, vgdev->fence=
_drv.context, 0);
>> >> >> > +       out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, r=
ing_idx);
>> >> >> >         if(!out_fence) {
>> >> >> >                 ret =3D -ENOMEM;
>> >> >> >                 goto out_unresv;
>> >> >> > @@ -691,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(str=
uct drm_device *dev,
>> >> >> >                 return -EINVAL;
>> >> >> >
>> >> >> >         /* Number of unique parameters supported at this time. *=
/
>> >> >> > -       if (num_params > 1)
>> >> >> > +       if (num_params > 2)
>> >> >> >                 return -EINVAL;
>> >> >> >
>> >> >> >         ctx_set_params =3D memdup_user(u64_to_user_ptr(args->ctx=
_set_params),
>> >> >> > @@ -731,6 +747,20 @@ static int virtio_gpu_context_init_ioctl(st=
ruct drm_device *dev,
>> >> >> >
>> >> >> >                         vfpriv->context_init |=3D value;
>> >> >> >                         break;
>> >> >> > +               case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
>> >> >> > +                       if (vfpriv->base_fence_ctx) {
>> >> >> > +                               ret =3D -EINVAL;
>> >> >> > +                               goto out_unlock;
>> >> >> > +                       }
>> >> >> > +
>> >> >> > +                       if (value > MAX_RINGS) {
>> >> >> > +                               ret =3D -EINVAL;
>> >> >> > +                               goto out_unlock;
>> >> >> > +                       }
>> >> >> > +
>> >> >> > +                       vfpriv->base_fence_ctx =3D dma_fence_con=
text_alloc(value);
>> >> >> With multiple fence contexts, we should do something about implici=
t fencing.
>> >> >>
>> >> >> The classic example is Mesa and X server.  When both use virgl and=
 the
>> >> >> global fence context, no dma_fence_wait is fine.  But when Mesa us=
es
>> >> >> venus and the ring fence context, dma_fence_wait should be inserte=
d.
>> >> >
>> >> >
>> >> >  If I read your comment correctly, the use case is:
>> >> >
>> >> > context A (venus)
>> >> >
>> >> > sharing a render target with
>> >> >
>> >> > context B (Xserver backed virgl)
>> >> >
>> >> > ?
>> >> >
>> >> > Which function do you envisage dma_fence_wait(...) to be inserted? =
 Doesn't implicit synchronization mean there's no fence to share between co=
ntexts (only buffer objects)?
>> >>
>> >> Fences can be implicitly shared via reservation objects associated
>> >> with buffer objects.
>> >>
>> >> > It may be possible to wait on the reservation object associated wit=
h a buffer object from a different context (userspace can also do DRM_IOCTL=
_VIRTGPU_WAIT), but not sure if that's what you're looking for.
>> >>
>> >> Right, that's what I am looking for.  Userspace expects implicit
>> >> fencing to work.  While there are works to move the userspace to do
>> >> explicit fencing, it is not there yet in general and we can't require
>> >> the userspace to do explicit fencing or DRM_IOCTL_VIRTGPU_WAIT.
>> >
>> >
>> > Another option would be to use the upcoming DMA_BUF_IOCTL_EXPORT_SYNC_=
FILE + VIRTGPU_EXECBUF_FENCE_FD_IN (which checks the dma_fence context).
>> That requires the X server / compositors to be modified.  For example,
>> venus works under Android (where there is explicit fencing) or under a
>> modified compositor (which does DMA_BUF_IOCTL_EXPORT_SYNC_FILE or
>> DRM_IOCTL_VIRTGPU_WAIT).  But it does not work too well with an
>> unmodified X server.
>
>
> Some semi-recent virgl modifications will be needed regardless for intero=
p, such as VIRGL_CAP_V2_UNTYPED_RESOURCE (?).
>
> Not sure aren't too many virgl users (most developers)
>
> Does Xserver just pick up the latest Mesa release (including virgl/venus)=
?  Suppose context types land in 5.16, the userspace changes land (both Ven=
us/Virgl) in 21.2 stable releases.
>
> https://docs.mesa3d.org/release-calendar.html
>
>>
>> >
>> > Generally, if it only requires virgl changes, userspace changes are fi=
ne since OpenGL drivers implement implicit sync in many ways.  Waiting on t=
he reservation object in the kernel is fine too though.
>> I don't think we want to assume virgl to be the only consumer of
>> dma-bufs, despite that it is the most common use case.
>>
>>
>> >
>> > Though venus doesn't use the NUM_RINGS param yet.  Getting all permuta=
tions of context type + display integration working would take some time (p=
atchset mostly tested with wayland + gfxstream/Android [no implicit sync]).
>> >
>> > WDYT of someone figuring out virgl/venus interop later, independently =
of this patchset?
>>
>> I think we should understand the implications of multiple fence
>> contexts better, even if some changes are not included in this
>> patchset.
>>
>> From my view, we don't need implicit fencing in most cases and
>> implicit fencing should be considered a legacy path.  But X server /
>> compositors today happen to require it.  Other drivers seem to use a
>> flag to control whether implicit fences are set up or waited (e.g.,
>> AMDGPU_GEM_CREATE_EXPLICIT_SYNC, MSM_SUBMIT_NO_IMPLICIT, or
>> EXEC_OBJECT_WRITE).  It seems to be the least surprising thing to do.
>
>
> IMO, the easiest way is just to limit the change to userspace if possible=
 since implicit sync is legacy/something we want to deprecate over time.
>
> Another option is to add something like VIRTGPU_EXECBUF_EXPLICIT_SYNC (si=
milar to MSM_SUBMIT_NO_IMPLICIT), where the reservation objects are waited =
on / added to without that flag.  Since explicit sync will need new hyperca=
lls/params and is a major, that feature is expected to be independent of co=
ntext types.
>
> With that option, waiting on the reservation object would just be another=
 bug fix + addition to 5.16 (perhaps by you) so we can proceed in parallel =
faster.  VIRTGPU_EXECBUF_EXPLICIT_SYNC (or an equivalent) would be added la=
ter.

It is fine to add it later, but VIRTGPU_EXECBUF_EXPLICIT_SYNC sounds
better to me than a userspace solution.  I don't think we need a new
hypercall as the wait can be a guest-side wait, similar to how
VIRTGPU_EXECBUF_FENCE_FD_IN is a guest-side wait.  The flag can also
suppress VIRTIO_GPU_FLAG_FENCE and make the SUBMIT_3D hypercall
cheaper.

Even before this patchset, unless I miss something, it seems the fact
that we have a global fence context and assume all host GL contexts
are on the same timeline is not exactly correct.  When glFlush is
called on two host GL contexts, the flush order is not exactly the
same as the execution order.  But that is a different issue that can
be solved in virglrenderer.


>
>>
>>
>> >
>> >>
>> >>
>> >>
>> >>
>> >> >
>> >> >>
>> >> >>
>> >> >> > +                       vfpriv->num_rings =3D value;
>> >> >> > +                       break;
>> >> >> >                 default:
>> >> >> >                         ret =3D -EINVAL;
>> >> >> >                         goto out_unlock;
>> >> >> > --
>> >> >> > 2.33.0.153.gba50c8fa24-goog
>> >> >> >
>> >> >> >
>> >> >> > ----------------------------------------------------------------=
-----
>> >> >> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.=
org
>> >> >> > For additional commands, e-mail: virtio-dev-help@lists.oasis-ope=
n.org
>> >> >> >
