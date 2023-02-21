Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4169DC44
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 09:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A27C10E318;
	Tue, 21 Feb 2023 08:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC8910E312;
 Tue, 21 Feb 2023 08:41:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m6so4761264lfq.5;
 Tue, 21 Feb 2023 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EGcJFiyVXpm1vB6ryTENvvZEzbtzOfX5J/M+CGlWf3c=;
 b=bFcp0nGW4q2R7nq3XgmABBvQRntiv3jq/Pq8FP01TT5KJHnppukZ1me252THxmFQ7R
 PUjNse2z7n+i5DaQPDwIy7wednx17JtxONMrUQ6rfa0MKPiqb5JxCP4IwSA9kvKZVaSe
 TQnCqdCGXue//+wA9ZbcahhVswstDUENZD61VPUNgeQUdpZsEhRO+lPP7i9WmUCjTaNh
 znWqXnAqArPR/dOeljgzAK0XF4SBwcJrNmpcPQDWroSYSieL6YT/OdAfjvUokvp4+0Jk
 UrespTozmBOkiyG5M+OtLGQ///qul7eyE4wLWr40gnbUGhuBAps4cr8Nr1XrISVHHF7I
 Vt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EGcJFiyVXpm1vB6ryTENvvZEzbtzOfX5J/M+CGlWf3c=;
 b=ChDIfTCR7mOoIBOaARQMoWXv739ky1NAtj78A3fVvFZp9zG9NHTPHTBbUTdQJdm/XX
 cYtuWZDb/bcegSRJ8MXuLlkkqdT5tE0GC06z5OlOdBgssB3Fvyc/9cDrEsh5tfAcrSEZ
 QqG8sNpUQd1cjeMv51bFcB+KPkLZpnjf2BqbMmtRSc1uOp6rdksMKskntr+fTAKXdQX5
 JrweJtzF9RTVYcSYdfuVdqHHIG5XHWnCFCigZo7Q6YMIZJnNQPGU+attjSbkKODaylyo
 wyQ6mTbEPr5uvKIjOQY9LVM3O868yRxdQ5gqA68bqDX4bRqg5w22bWQrU7w1FAvEVDgR
 fhiQ==
X-Gm-Message-State: AO0yUKVREv+erJiJhfT/8cPeGZQg/gx6tEalarqYscNWyhw7VkDxyidI
 C+sV+oGTVxMYeK5eyRtswDE=
X-Google-Smtp-Source: AK7set+tPpbI5dUy4JJsPFoQ29Zp15BUflOBWAcU57dVeyCZp5zYatadpNHDJkaCq3Jotmh1HNC0Kg==
X-Received: by 2002:a19:ad41:0:b0:4d5:c996:2940 with SMTP id
 s1-20020a19ad41000000b004d5c9962940mr1138770lfd.61.1676968881556; 
 Tue, 21 Feb 2023 00:41:21 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m28-20020a056512015c00b004d7d13387b5sm682030lfo.116.2023.02.21.00.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 00:41:21 -0800 (PST)
Date: Tue, 21 Feb 2023 10:41:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <20230221104117.05891eea@eldfell>
In-Reply-To: <CAF6AEGtAHXQ05tWoXdbx3_TK+11+XN6J9wuXssSh3PswUhvwgg@mail.gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-6-robdclark@gmail.com>
 <37ec0125-8d0b-7d87-321d-ed4c7c7b32a7@amd.com>
 <CAF6AEGtAHXQ05tWoXdbx3_TK+11+XN6J9wuXssSh3PswUhvwgg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RbrIELARXw_RRD9+waByAXN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "moderated
 list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RbrIELARXw_RRD9+waByAXN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Feb 2023 08:09:04 -0800
Rob Clark <robdclark@gmail.com> wrote:

> On Mon, Feb 20, 2023 at 12:27 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 18.02.23 um 22:15 schrieb Rob Clark: =20
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The initial purpose is for igt tests, but this would also be useful f=
or
> > > compositors that wait until close to vblank deadline to make decisions
> > > about which frame to show.
> > >
> > > The igt tests can be found at:
> > >
> > > https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence=
-deadline
> > >
> > > v2: Clarify the timebase, add link to igt tests
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> > >   include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
> > >   2 files changed, 41 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > index af57799c86ce..fb6ca1032885 100644
> > > --- a/drivers/dma-buf/sync_file.c
> > > +++ b/drivers/dma-buf/sync_file.c
> > > @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sy=
nc_file *sync_file,
> > >       return ret;
> > >   }
> > >
> > > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > > +                                     unsigned long arg)
> > > +{
> > > +     struct sync_set_deadline ts;
> > > +
> > > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > > +             return -EFAULT;
> > > +
> > > +     if (ts.pad)
> > > +             return -EINVAL;
> > > +
> > > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, t=
s.tv_nsec));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >   static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > >                           unsigned long arg)
> > >   {
> > > @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, un=
signed int cmd,
> > >       case SYNC_IOC_FILE_INFO:
> > >               return sync_file_ioctl_fence_info(sync_file, arg);
> > >
> > > +     case SYNC_IOC_SET_DEADLINE:
> > > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > > +
> > >       default:
> > >               return -ENOTTY;
> > >       }
> > > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync=
_file.h
> > > index ee2dcfb3d660..c8666580816f 100644
> > > --- a/include/uapi/linux/sync_file.h
> > > +++ b/include/uapi/linux/sync_file.h
> > > @@ -67,6 +67,20 @@ struct sync_file_info {
> > >       __u64   sync_fence_info;
> > >   };
> > >
> > > +/**
> > > + * struct sync_set_deadline - set a deadline on a fence
> > > + * @tv_sec:  seconds elapsed since epoch
> > > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > > + * @pad:     must be zero
> > > + *
> > > + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> > > + */
> > > +struct sync_set_deadline {
> > > +     __s64   tv_sec;
> > > +     __s32   tv_nsec;
> > > +     __u32   pad; =20
> >
> > IIRC struct timespec defined this as time_t/long (which is horrible for
> > an UAPI because of the sizeof(long) dependency), one possible
> > alternative is to use 64bit nanoseconds from CLOCK_MONOTONIC (which is
> > essentially ktime).
> >
> > Not 100% sure if there is any preferences documented, but I think the
> > later might be better. =20
>=20
> The original thought is that this maps directly to clock_gettime()
> without extra conversion needed, and is similar to other pre-ktime_t
> UAPI.  But OTOH if userspace wants to add an offset, it is maybe
> better to convert completely to ns in userspace and use a u64 (as that
> is what ns_to_ktime() uses).. (and OFC whatever decision here also
> applies to the syncobj wait ioctls)
>=20
> I'm leaning towards u64 CLOCK_MONOTONIC ns if no one has a good
> argument against that.

No, no good argument against that, it's just different from any other
UAPI so far, but a new style has to start somewhere. It's good for 584
years after the epoch.

Just make sure the documentation is explicit on how struct timespec is
converted to and from u64 (signedness issues, overflow and whatnot).


Thanks,
pq


>=20
> BR,
> -R
>=20
> > Either way the patch is Acked-by: Christian K=C3=B6nig
> > <christian.koenig@amd.com> for this patch.
> >
> > Regards,
> > Christian.
> > =20
> > > +};
> > > +
> > >   #define SYNC_IOC_MAGIC              '>'
> > >
> > >   /**
> > > @@ -95,4 +109,12 @@ struct sync_file_info {
> > >    */
> > >   #define SYNC_IOC_FILE_INFO  _IOWR(SYNC_IOC_MAGIC, 4, struct sync_fi=
le_info)
> > >
> > > +
> > > +/**
> > > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > > + *
> > > + * Allows userspace to set a deadline on a fence, see dma_fence_set_=
deadline()
> > > + */
> > > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct =
sync_set_deadline)
> > > +
> > >   #endif /* _UAPI_LINUX_SYNC_H */ =20
> > =20


--Sig_/RbrIELARXw_RRD9+waByAXN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP0g60ACgkQI1/ltBGq
qqfolA//Q9ocJY3bZjCBI4MmTk59scDnNCRUNlP1nLt+zXKyKWkKwfuWLpFRBVkp
TcxrwKaSXTVqWraDrRJFWB085/HdeTeO0k7NPRYMuZWtAPOZX3nK4v1LlVyG6Tvc
NgUvXSiwJof0P2FGnVvQ1Sun4luO8tduookNwoi19XmBXYU37FQPMdwJU1Skprhe
dUxkrJqnFsAX0BqLRq9sepoO9rTh8gbjSr/Fbx9R25IXzt+V2gifQAvkFYW+HaWg
2BPlBFFdfzuP131DiWW78l3pwAsZiu6edsUHwOEZfS6OoH2V3JfwotLflNtEoDtV
5fqJbhWfEESNhB9kHpMArrauaFGnzw3/KjKk3yvUTeEF751tUxbGjIXJSd4DRESX
MmN/pfZMPa1ipAjJTKv2aaZyNTPn/WQRUkhlIuxpt3Dwe5T5QyH12plE7nSgz8Du
/qz3K2hj/VhSnLOpj/uk81SkxEYywiuIumYhcRTYJiwuED4NDV5kXusaAfOhrkF5
8GIgZDWvEJ2ty3fXxA9VFaPy4xjqi3NBzC7D2uebKeTFnPiUHbMZ3TqREyYhrc+o
s6l0OC1yU/tbcdhckc1emI6OBb0LDGQNdxhCTwov4BYabsuSHbRhQBaLlMYD/F4s
52nNjDqIE9oQo13YNCCaAVb0yrt7CZ/6Iik9qj++/lfsvacSvpo=
=cQIs
-----END PGP SIGNATURE-----

--Sig_/RbrIELARXw_RRD9+waByAXN--
