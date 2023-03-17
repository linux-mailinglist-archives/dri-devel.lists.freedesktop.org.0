Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09446C0356
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DCE10E038;
	Sun, 19 Mar 2023 16:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0E10E251
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 19:08:53 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r11so24232394edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20210112.gappssmtp.com; s=20210112; t=1679080131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zAmqKkkhKDfsMSLAtz6NpfSRtoOEAIaHSI5wA/XvDcM=;
 b=c2P3WuNIJBRyFI8bAo28fWhv5bXZQm9f9w2lvyBACsQ7RhzyG24AaCG4r0ub0ziT4x
 zKI1DIRjst+55LeHqnkESdgh6IXVKFiZwLil5zhqf3HBrT23etgYONEzW/FvG5O1pOvi
 fV+KTJaNOeZhKcXfvrduxQ2YN5kLfaVl7uEgfA0KneysWCD3lnq6di2617mADTXTmZ+K
 OQmzV3MennLFf0eASbHfWWkKCbR4u7vYya+yahXTd4zvabo3he7Rt4DrGXgiZ4H+fukv
 JuMSTyU9IeY8ZH3WoAtEHY5OJLVo1bzsvpTtj3HTQhJUXviuRIQb0J6MVSpQe6GdJS5i
 UuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679080131;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zAmqKkkhKDfsMSLAtz6NpfSRtoOEAIaHSI5wA/XvDcM=;
 b=vGejijcNwdR+52kV7LuQTxyYQ+IQP4eE2/fVDDRPKjJurJfNe0Iaj1u6X7rU6+rWP1
 ZjDY65XkqfAgzl65Vp93zOSFO0/Vll6I6wNhStuu+AYElT4ZiMqo8j5JDf6AoMm90LFn
 CilCIAsnWH65THHgqmUpSTjOwRdi+Tad7oB3cpuc0s4wjA4OsvHqb6c8hUKyX7i+SAbR
 qsa0qxV1/RYZ+6G3f8i2DpV6ksueOiUrhl1S56KtEngi53FCt3U1KZePYirmlOBkrP17
 l4nSJbJOyhY0tZobp5qJrWuqlA3I+sSUqkMwpURIMsVd7uT6NLgHl9ijax/jNtGchfEb
 Esxw==
X-Gm-Message-State: AO0yUKWDTKPBQIJ8JVO25h23jYc92o80PrhrP2TfN89BbuFdmv7EPEEc
 gaubo88Y8ZiTj1ZZzNbg6yGJ19+NvLP0WOdmK6aHXw==
X-Google-Smtp-Source: AK7set/vpiOP5buQMb+cQhrW/MMJHTQdQWnIdlrcXVWau9BTn2UD2Iefj7cGhCeJvsiXCPSM/TTsKfN/ciXh6Infj/s=
X-Received: by 2002:a50:c3cd:0:b0:4fc:fc86:5f76 with SMTP id
 i13-20020a50c3cd000000b004fcfc865f76mr2362937edf.6.1679080131565; Fri, 17 Mar
 2023 12:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-10-robdclark@gmail.com>
In-Reply-To: <20230308155322.344664-10-robdclark@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 17 Mar 2023 14:08:39 -0500
Message-ID: <CAOFGe944_xJOJ3a-uJDVyca_1_+aYTqat4=Qc3CC1wUubxw3XQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v10 09/15] drm/syncobj: Add deadline support
 for syncobj waits
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000caae6905f71d4e06"
X-Mailman-Approved-At: Sun, 19 Mar 2023 16:55:58 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Matt Turner <mattst88@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000caae6905f71d4e06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 9:54=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:

> From: Rob Clark <robdclark@chromium.org>
>
> Add a new flag to let userspace provide a deadline as a hint for syncobj
> and timeline waits.  This gives a hint to the driver signaling the
> backing fences about how soon userspace needs it to compete work, so it
> can addjust GPU frequency accordingly.  An immediate deadline can be
> given to provide something equivalent to i915 "wait boost".
>
> v2: Use absolute u64 ns value for deadline hint, drop cap and driver
>     feature flag in favor of allowing count_handles=3D=3D0 as a way for
>     userspace to probe kernel for support of new flag
> v3: More verbose comments about UAPI
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 64 ++++++++++++++++++++++++++++-------
>  include/uapi/drm/drm.h        | 17 ++++++++++
>  2 files changed, 68 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 0c2be8360525..a85e9464f07b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -126,6 +126,11 @@
>   * synchronize between the two.
>   * This requirement is inherited from the Vulkan fence API.
>   *
> + * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE is set, the ioctl will also
> set
> + * a fence deadline hint on the backing fences before waiting, to provid=
e
> the
> + * fence signaler with an appropriate sense of urgency.  The deadline is
> + * specified as an absolute &CLOCK_MONOTONIC value in units of ns.
> + *
>   * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
>   * handles as well as an array of u64 points and does a host-side wait o=
n
> all
>   * of syncobj fences at the given points simultaneously.
> @@ -973,7 +978,8 @@ static signed long
> drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>                                                   uint32_t count,
>                                                   uint32_t flags,
>                                                   signed long timeout,
> -                                                 uint32_t *idx)
> +                                                 uint32_t *idx,
> +                                                 ktime_t *deadline)
>  {
>         struct syncobj_wait_entry *entries;
>         struct dma_fence *fence;
> @@ -1053,6 +1059,15 @@ static signed long
> drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>                         drm_syncobj_fence_add_wait(syncobjs[i],
> &entries[i]);
>         }
>
> +       if (deadline) {
> +               for (i =3D 0; i < count; ++i) {
> +                       fence =3D entries[i].fence;
> +                       if (!fence)
> +                               continue;
> +                       dma_fence_set_deadline(fence, *deadline);
> +               }
> +       }
> +
>         do {
>                 set_current_state(TASK_INTERRUPTIBLE);
>
> @@ -1151,7 +1166,8 @@ static int drm_syncobj_array_wait(struct drm_device
> *dev,
>                                   struct drm_file *file_private,
>                                   struct drm_syncobj_wait *wait,
>                                   struct drm_syncobj_timeline_wait
> *timeline_wait,
> -                                 struct drm_syncobj **syncobjs, bool
> timeline)
> +                                 struct drm_syncobj **syncobjs, bool
> timeline,
> +                                 ktime_t *deadline)
>  {
>         signed long timeout =3D 0;
>         uint32_t first =3D ~0;
> @@ -1162,7 +1178,8 @@ static int drm_syncobj_array_wait(struct drm_device
> *dev,
>                                                          NULL,
>
>  wait->count_handles,
>                                                          wait->flags,
> -                                                        timeout, &first)=
;
> +                                                        timeout, &first,
> +                                                        deadline);
>                 if (timeout < 0)
>                         return timeout;
>                 wait->first_signaled =3D first;
> @@ -1172,7 +1189,8 @@ static int drm_syncobj_array_wait(struct drm_device
> *dev,
>
>  u64_to_user_ptr(timeline_wait->points),
>
>  timeline_wait->count_handles,
>
>  timeline_wait->flags,
> -                                                        timeout, &first)=
;
> +                                                        timeout, &first,
> +                                                        deadline);
>                 if (timeout < 0)
>                         return timeout;
>                 timeline_wait->first_signaled =3D first;
> @@ -1243,17 +1261,22 @@ drm_syncobj_wait_ioctl(struct drm_device *dev,
> void *data,
>  {
>         struct drm_syncobj_wait *args =3D data;
>         struct drm_syncobj **syncobjs;
> +       unsigned possible_flags;
> +       ktime_t t, *tp =3D NULL;
>         int ret =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>                 return -EOPNOTSUPP;
>
> -       if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
> +       possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +       if (args->flags & ~possible_flags)
>                 return -EINVAL;
>
>         if (args->count_handles =3D=3D 0)
> -               return -EINVAL;
> +               return 0;
>

Did you intend this change? If so, why? What does waiting with no handles
gain us? I mean, it's probably fine but it seems unrelated to this change.

        ret =3D drm_syncobj_array_find(file_private,
>                                      u64_to_user_ptr(args->handles),
> @@ -1262,8 +1285,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, voi=
d
> *data,
>         if (ret < 0)
>                 return ret;
>
> +       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +               t =3D ns_to_ktime(args->deadline_ns);
> +               tp =3D &t;
> +       }
> +
>         ret =3D drm_syncobj_array_wait(dev, file_private,
> -                                    args, NULL, syncobjs, false);
> +                                    args, NULL, syncobjs, false, tp);
>
>         drm_syncobj_array_free(syncobjs, args->count_handles);
>
> @@ -1276,18 +1304,23 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device
> *dev, void *data,
>  {
>         struct drm_syncobj_timeline_wait *args =3D data;
>         struct drm_syncobj **syncobjs;
> +       unsigned possible_flags;
> +       ktime_t t, *tp =3D NULL;
>         int ret =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>                 return -EOPNOTSUPP;
>
> -       if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> -                           DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
> +       possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
> +                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +       if (args->flags & ~possible_flags)
>                 return -EINVAL;
>
>         if (args->count_handles =3D=3D 0)
> -               return -EINVAL;
> +               return -0;
>

Did you intend this change? -0 is a pretty weird integer.


>         ret =3D drm_syncobj_array_find(file_private,
>                                      u64_to_user_ptr(args->handles),
> @@ -1296,8 +1329,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device
> *dev, void *data,
>         if (ret < 0)
>                 return ret;
>
> +       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +               t =3D ns_to_ktime(args->deadline_ns);
> +               tp =3D &t;
> +       }
> +
>         ret =3D drm_syncobj_array_wait(dev, file_private,
> -                                    NULL, args, syncobjs, true);
> +                                    NULL, args, syncobjs, true, tp);
>
>         drm_syncobj_array_free(syncobjs, args->count_handles);
>
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..bff0509ac8b6 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time
> point to become available */
> +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence
> deadline based to deadline_ns */
>  struct drm_syncobj_wait {
>         __u64 handles;
>         /* absolute timeout */
> @@ -895,6 +896,14 @@ struct drm_syncobj_wait {
>         __u32 flags;
>         __u32 first_signaled; /* only valid when not waiting all */
>         __u32 pad;
> +       /**
> +        * @deadline_ns - fence deadline hint
> +        *
> +        * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
> +        * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
> +        * set.
> +        */
> +       __u64 deadline_ns;
>  };
>
>  struct drm_syncobj_timeline_wait {
> @@ -907,6 +916,14 @@ struct drm_syncobj_timeline_wait {
>         __u32 flags;
>         __u32 first_signaled; /* only valid when not waiting all */
>         __u32 pad;
> +       /**
> +        * @deadline_ns - fence deadline hint
> +        *
> +        * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
> +        * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
> +        * set.
> +        */
> +       __u64 deadline_ns;
>  };
>
>
> --
> 2.39.2
>
>

--000000000000caae6905f71d4e06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBNYXIgOCwg
MjAyMyBhdCA5OjU04oCvQU0gUm9iIENsYXJrICZsdDs8YSBocmVmPSJtYWlsdG86cm9iZGNsYXJr
QGdtYWlsLmNvbSI+cm9iZGNsYXJrQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+RnJvbTogUm9iIENsYXJrICZsdDs8YSBocmVmPSJtYWlsdG86cm9iZGNsYXJrQGNocm9t
aXVtLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnJvYmRjbGFya0BjaHJvbWl1bS5vcmc8L2E+Jmd0Ozxi
cj4NCjxicj4NCkFkZCBhIG5ldyBmbGFnIHRvIGxldCB1c2Vyc3BhY2UgcHJvdmlkZSBhIGRlYWRs
aW5lIGFzIGEgaGludCBmb3Igc3luY29iajxicj4NCmFuZCB0aW1lbGluZSB3YWl0cy7CoCBUaGlz
IGdpdmVzIGEgaGludCB0byB0aGUgZHJpdmVyIHNpZ25hbGluZyB0aGU8YnI+DQpiYWNraW5nIGZl
bmNlcyBhYm91dCBob3cgc29vbiB1c2Vyc3BhY2UgbmVlZHMgaXQgdG8gY29tcGV0ZSB3b3JrLCBz
byBpdDxicj4NCmNhbiBhZGRqdXN0IEdQVSBmcmVxdWVuY3kgYWNjb3JkaW5nbHkuwqAgQW4gaW1t
ZWRpYXRlIGRlYWRsaW5lIGNhbiBiZTxicj4NCmdpdmVuIHRvIHByb3ZpZGUgc29tZXRoaW5nIGVx
dWl2YWxlbnQgdG8gaTkxNSAmcXVvdDt3YWl0IGJvb3N0JnF1b3Q7Ljxicj4NCjxicj4NCnYyOiBV
c2UgYWJzb2x1dGUgdTY0IG5zIHZhbHVlIGZvciBkZWFkbGluZSBoaW50LCBkcm9wIGNhcCBhbmQg
ZHJpdmVyPGJyPg0KwqAgwqAgZmVhdHVyZSBmbGFnIGluIGZhdm9yIG9mIGFsbG93aW5nIGNvdW50
X2hhbmRsZXM9PTAgYXMgYSB3YXkgZm9yPGJyPg0KwqAgwqAgdXNlcnNwYWNlIHRvIHByb2JlIGtl
cm5lbCBmb3Igc3VwcG9ydCBvZiBuZXcgZmxhZzxicj4NCnYzOiBNb3JlIHZlcmJvc2UgY29tbWVu
dHMgYWJvdXQgVUFQSTxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJvYmRjbGFya0BjaHJvbWl1bS5vcmciIHRhcmdldD0iX2JsYW5rIj5yb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3luY29iai5jIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS08
YnI+DQrCoGluY2x1ZGUvdWFwaS9kcm0vZHJtLmjCoCDCoCDCoCDCoCB8IDE3ICsrKysrKysrKys8
YnI+DQrCoDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
PGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmM8YnI+DQppbmRleCAwYzJiZTgzNjA1MjUuLmE4
NWU5NDY0ZjA3YiAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmou
Yzxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jPGJyPg0KQEAgLTEyNiw2
ICsxMjYsMTEgQEA8YnI+DQrCoCAqIHN5bmNocm9uaXplIGJldHdlZW4gdGhlIHR3by48YnI+DQrC
oCAqIFRoaXMgcmVxdWlyZW1lbnQgaXMgaW5oZXJpdGVkIGZyb20gdGhlIFZ1bGthbiBmZW5jZSBB
UEkuPGJyPg0KwqAgKjxicj4NCisgKiBJZiAmYW1wO0RSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJ
VF9ERUFETElORSBpcyBzZXQsIHRoZSBpb2N0bCB3aWxsIGFsc28gc2V0PGJyPg0KKyAqIGEgZmVu
Y2UgZGVhZGxpbmUgaGludCBvbiB0aGUgYmFja2luZyBmZW5jZXMgYmVmb3JlIHdhaXRpbmcsIHRv
IHByb3ZpZGUgdGhlPGJyPg0KKyAqIGZlbmNlIHNpZ25hbGVyIHdpdGggYW4gYXBwcm9wcmlhdGUg
c2Vuc2Ugb2YgdXJnZW5jeS7CoCBUaGUgZGVhZGxpbmUgaXM8YnI+DQorICogc3BlY2lmaWVkIGFz
IGFuIGFic29sdXRlICZhbXA7Q0xPQ0tfTU9OT1RPTklDIHZhbHVlIGluIHVuaXRzIG9mIG5zLjxi
cj4NCisgKjxicj4NCsKgICogU2ltaWxhcmx5LCAmYW1wO0RSTV9JT0NUTF9TWU5DT0JKX1RJTUVM
SU5FX1dBSVQgdGFrZXMgYW4gYXJyYXkgb2Ygc3luY29iajxicj4NCsKgICogaGFuZGxlcyBhcyB3
ZWxsIGFzIGFuIGFycmF5IG9mIHU2NCBwb2ludHMgYW5kIGRvZXMgYSBob3N0LXNpZGUgd2FpdCBv
biBhbGw8YnI+DQrCoCAqIG9mIHN5bmNvYmogZmVuY2VzIGF0IHRoZSBnaXZlbiBwb2ludHMgc2lt
dWx0YW5lb3VzbHkuPGJyPg0KQEAgLTk3Myw3ICs5NzgsOCBAQCBzdGF0aWMgc2lnbmVkIGxvbmcg
ZHJtX3N5bmNvYmpfYXJyYXlfd2FpdF90aW1lb3V0KHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNv
YmpzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVpbnQzMl90IGNvdW50LDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHVpbnQzMl90IGZsYWdzLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNpZ25lZCBs
b25nIHRpbWVvdXQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWludDMyX3QgKmlkeCk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB1aW50MzJfdCAqaWR4LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGt0
aW1lX3QgKmRlYWRsaW5lKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIHN0cnVjdCBzeW5jb2Jq
X3dhaXRfZW50cnkgKmVudHJpZXM7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2U7PGJyPg0KQEAgLTEwNTMsNiArMTA1OSwxNSBAQCBzdGF0aWMgc2lnbmVkIGxvbmcgZHJt
X3N5bmNvYmpfYXJyYXlfd2FpdF90aW1lb3V0KHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNvYmpz
LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRybV9zeW5jb2JqX2Zl
bmNlX2FkZF93YWl0KHN5bmNvYmpzW2ldLCAmYW1wO2VudHJpZXNbaV0pOzxicj4NCsKgIMKgIMKg
IMKgIH08YnI+DQo8YnI+DQorwqAgwqAgwqAgwqBpZiAoZGVhZGxpbmUpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgY291bnQ7ICsraSkgezxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZlbmNlID0gZW50cmllc1tpXS5mZW5j
ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIWZlbmNlKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbnRp
bnVlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYV9mZW5jZV9z
ZXRfZGVhZGxpbmUoZmVuY2UsICpkZWFkbGluZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgZG8gezxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNldF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBU
SUJMRSk7PGJyPg0KPGJyPg0KQEAgLTExNTEsNyArMTE2Niw4IEBAIHN0YXRpYyBpbnQgZHJtX3N5
bmNvYmpfYXJyYXlfd2FpdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZV9wcml2YXRlLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHN0cnVjdCBkcm1fc3luY29ial93YWl0ICp3YWl0LDxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBkcm1fc3lu
Y29ial90aW1lbGluZV93YWl0ICp0aW1lbGluZV93YWl0LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fc3luY29iaiAqKnN5
bmNvYmpzLCBib29sIHRpbWVsaW5lKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0cnVjdCBkcm1fc3luY29iaiAqKnN5bmNvYmpzLCBib29s
IHRpbWVsaW5lLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGt0aW1lX3QgKmRlYWRsaW5lKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIHNp
Z25lZCBsb25nIHRpbWVvdXQgPSAwOzxicj4NCsKgIMKgIMKgIMKgIHVpbnQzMl90IGZpcnN0ID0g
fjA7PGJyPg0KQEAgLTExNjIsNyArMTE3OCw4IEBAIHN0YXRpYyBpbnQgZHJtX3N5bmNvYmpfYXJy
YXlfd2FpdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgTlVMTCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdhaXQtJmd0
O2NvdW50X2hhbmRsZXMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWl0LSZn
dDtmbGFncyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGltZW91dCwgJmFtcDtm
aXJzdCk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRpbWVvdXQsICZhbXA7Zmly
c3QsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlYWRsaW5lKTs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAodGltZW91dCAmbHQ7IDApPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIHRpbWVvdXQ7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgd2FpdC0mZ3Q7Zmlyc3Rfc2lnbmFsZWQgPSBmaXJzdDs8YnI+DQpAQCAtMTE3
Miw3ICsxMTg5LDggQEAgc3RhdGljIGludCBkcm1fc3luY29ial9hcnJheV93YWl0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjRfdG9f
dXNlcl9wdHIodGltZWxpbmVfd2FpdC0mZ3Q7cG9pbnRzKSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHRpbWVsaW5lX3dhaXQtJmd0O2NvdW50X2hhbmRsZXMsPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aW1lbGluZV93YWl0LSZndDtmbGFncyw8YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGltZW91dCwgJmFtcDtmaXJzdCk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRpbWVvdXQsICZhbXA7Zmlyc3QsPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGRlYWRsaW5lKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpZiAodGltZW91dCAmbHQ7IDApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmV0dXJuIHRpbWVvdXQ7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGltZWxp
bmVfd2FpdC0mZ3Q7Zmlyc3Rfc2lnbmFsZWQgPSBmaXJzdDs8YnI+DQpAQCAtMTI0MywxNyArMTI2
MSwyMiBAQCBkcm1fc3luY29ial93YWl0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsPGJyPg0KwqB7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IGRybV9zeW5jb2JqX3dh
aXQgKmFyZ3MgPSBkYXRhOzxicj4NCsKgIMKgIMKgIMKgIHN0cnVjdCBkcm1fc3luY29iaiAqKnN5
bmNvYmpzOzxicj4NCivCoCDCoCDCoCDCoHVuc2lnbmVkIHBvc3NpYmxlX2ZsYWdzOzxicj4NCivC
oCDCoCDCoCDCoGt0aW1lX3QgdCwgKnRwID0gTlVMTDs8YnI+DQrCoCDCoCDCoCDCoCBpbnQgcmV0
ID0gMDs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfU1lOQ09CSikpPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJu
IC1FT1BOT1RTVVBQOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoGlmIChhcmdzLSZndDtmbGFncyAm
YW1wOyB+KERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9BTEwgfDxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJ
VF9GT1JfU1VCTUlUKSk8YnI+DQorwqAgwqAgwqAgwqBwb3NzaWJsZV9mbGFncyA9IERSTV9TWU5D
T0JKX1dBSVRfRkxBR1NfV0FJVF9BTEwgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NVQk1JVCB8PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIERSTV9TWU5DT0JKX1dBSVRfRkxB
R1NfV0FJVF9ERUFETElORTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKGFyZ3MtJmd0O2Zs
YWdzICZhbXA7IH5wb3NzaWJsZV9mbGFncyk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBy
ZXR1cm4gLUVJTlZBTDs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBpZiAoYXJncy0mZ3Q7Y291bnRf
aGFuZGxlcyA9PSAwKTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFM
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOzxicj48L2Jsb2NrcXVvdGU+
PGRpdj7CoDwvZGl2PjxkaXY+RGlkIHlvdSBpbnRlbmQgdGhpcyBjaGFuZ2U/IElmIHNvLCB3aHk/
IFdoYXQgZG9lcyB3YWl0aW5nIHdpdGggbm8gaGFuZGxlcyBnYWluIHVzPyBJIG1lYW4sIGl0JiMz
OTtzIHByb2JhYmx5IGZpbmUgYnV0IGl0IHNlZW1zIHVucmVsYXRlZCB0byB0aGlzIGNoYW5nZS48
YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KwqAgwqAgwqAgwqAgcmV0ID0gZHJtX3N5
bmNvYmpfYXJyYXlfZmluZChmaWxlX3ByaXZhdGUsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1NjRfdG9fdXNlcl9wdHIoYXJncy0m
Z3Q7aGFuZGxlcyksPGJyPg0KQEAgLTEyNjIsOCArMTI4NSwxMyBAQCBkcm1fc3luY29ial93YWl0
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsPGJyPg0KwqAgwqAgwqAg
wqAgaWYgKHJldCAmbHQ7IDApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIHJl
dDs8YnI+DQo8YnI+DQorwqAgwqAgwqAgwqBpZiAoYXJncy0mZ3Q7ZmxhZ3MgJmFtcDsgRFJNX1NZ
TkNPQkpfV0FJVF9GTEFHU19XQUlUX0RFQURMSU5FKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdCA9IG5zX3RvX2t0aW1lKGFyZ3MtJmd0O2RlYWRsaW5lX25zKTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0cCA9ICZhbXA7dDs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxi
cj4NCsKgIMKgIMKgIMKgIHJldCA9IGRybV9zeW5jb2JqX2FycmF5X3dhaXQoZGV2LCBmaWxlX3By
aXZhdGUsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGFyZ3MsIE5VTEwsIHN5bmNvYmpzLCBmYWxzZSk7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZ3MsIE5VTEwsIHN5
bmNvYmpzLCBmYWxzZSwgdHApOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGRybV9zeW5jb2JqX2Fy
cmF5X2ZyZWUoc3luY29ianMsIGFyZ3MtJmd0O2NvdW50X2hhbmRsZXMpOzxicj4NCjxicj4NCkBA
IC0xMjc2LDE4ICsxMzA0LDIzIEBAIGRybV9zeW5jb2JqX3RpbWVsaW5lX3dhaXRfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSw8YnI+DQrCoHs8YnI+DQrCoCDCoCDCoCDC
oCBzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfd2FpdCAqYXJncyA9IGRhdGE7PGJyPg0KwqAg
wqAgwqAgwqAgc3RydWN0IGRybV9zeW5jb2JqICoqc3luY29ianM7PGJyPg0KK8KgIMKgIMKgIMKg
dW5zaWduZWQgcG9zc2libGVfZmxhZ3M7PGJyPg0KK8KgIMKgIMKgIMKga3RpbWVfdCB0LCAqdHAg
PSBOVUxMOzxicj4NCsKgIMKgIMKgIMKgIGludCByZXQgPSAwOzxicj4NCjxicj4NCsKgIMKgIMKg
IMKgIGlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5DT0JKX1RJTUVM
SU5FKSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVPUE5PVFNVUFA7PGJy
Pg0KPGJyPg0KLcKgIMKgIMKgIMKgaWYgKGFyZ3MtJmd0O2ZsYWdzICZhbXA7IH4oRFJNX1NZTkNP
QkpfV0FJVF9GTEFHU19XQUlUX0FMTCB8PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQgfDxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERSTV9TWU5DT0JK
X1dBSVRfRkxBR1NfV0FJVF9BVkFJTEFCTEUpKTxicj4NCivCoCDCoCDCoCDCoHBvc3NpYmxlX2Zs
YWdzID0gRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0FMTCB8PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9GT1Jf
U1VCTUlUIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgRFJNX1NZ
TkNPQkpfV0FJVF9GTEFHU19XQUlUX0FWQUlMQUJMRSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9ERUFETElORTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKGFyZ3MtJmd0O2ZsYWdzICZhbXA7IH5wb3NzaWJs
ZV9mbGFncyk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDs8YnI+
DQo8YnI+DQrCoCDCoCDCoCDCoCBpZiAoYXJncy0mZ3Q7Y291bnRfaGFuZGxlcyA9PSAwKTxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAtRUlOVkFMOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldHVybiAtMDs8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pjxk
aXY+RGlkIHlvdSBpbnRlbmQgdGhpcyBjaGFuZ2U/IC0wIGlzIGEgcHJldHR5IHdlaXJkIGludGVn
ZXIuPGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJn
YigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQrCoCDCoCDCoCDCoCByZXQgPSBkcm1f
c3luY29ial9hcnJheV9maW5kKGZpbGVfcHJpdmF0ZSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHU2NF90b191c2VyX3B0cihhcmdz
LSZndDtoYW5kbGVzKSw8YnI+DQpAQCAtMTI5Niw4ICsxMzI5LDEzIEBAIGRybV9zeW5jb2JqX3Rp
bWVsaW5lX3dhaXRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSw8YnI+
DQrCoCDCoCDCoCDCoCBpZiAocmV0ICZsdDsgMCk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZXR1cm4gcmV0Ozxicj4NCjxicj4NCivCoCDCoCDCoCDCoGlmIChhcmdzLSZndDtmbGFncyAm
YW1wOyBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfREVBRExJTkUpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0ID0gbnNfdG9fa3RpbWUoYXJncy0mZ3Q7ZGVhZGxpbmVfbnMpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRwID0gJmFtcDt0Ozxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorPGJyPg0KwqAgwqAgwqAgwqAgcmV0ID0gZHJtX3N5bmNvYmpfYXJyYXlfd2FpdChk
ZXYsIGZpbGVfcHJpdmF0ZSw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgTlVMTCwgYXJncywgc3luY29ianMsIHRydWUpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOVUxM
LCBhcmdzLCBzeW5jb2JqcywgdHJ1ZSwgdHApOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGRybV9z
eW5jb2JqX2FycmF5X2ZyZWUoc3luY29ianMsIGFyZ3MtJmd0O2NvdW50X2hhbmRsZXMpOzxicj4N
Cjxicj4NCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS9kcm0uaDxicj4NCmluZGV4IDY0MjgwODUyMGQ5Mi4uYmZmMDUwOWFjOGI2IDEwMDY0NDxi
cj4NCi0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmg8YnI+DQorKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL2RybS5oPGJyPg0KQEAgLTg4Nyw2ICs4ODcsNyBAQCBzdHJ1Y3QgZHJtX3N5bmNvYmpfdHJh
bnNmZXIgezxicj4NCsKgI2RlZmluZSBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfQUxMICgx
ICZsdDsmbHQ7IDApPGJyPg0KwqAjZGVmaW5lIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9G
T1JfU1VCTUlUICgxICZsdDsmbHQ7IDEpPGJyPg0KwqAjZGVmaW5lIERSTV9TWU5DT0JKX1dBSVRf
RkxBR1NfV0FJVF9BVkFJTEFCTEUgKDEgJmx0OyZsdDsgMikgLyogd2FpdCBmb3IgdGltZSBwb2lu
dCB0byBiZWNvbWUgYXZhaWxhYmxlICovPGJyPg0KKyNkZWZpbmUgRFJNX1NZTkNPQkpfV0FJVF9G
TEFHU19XQUlUX0RFQURMSU5FICgxICZsdDsmbHQ7IDMpIC8qIHNldCBmZW5jZSBkZWFkbGluZSBi
YXNlZCB0byBkZWFkbGluZV9ucyAqLzxicj4NCsKgc3RydWN0IGRybV9zeW5jb2JqX3dhaXQgezxi
cj4NCsKgIMKgIMKgIMKgIF9fdTY0IGhhbmRsZXM7PGJyPg0KwqAgwqAgwqAgwqAgLyogYWJzb2x1
dGUgdGltZW91dCAqLzxicj4NCkBAIC04OTUsNiArODk2LDE0IEBAIHN0cnVjdCBkcm1fc3luY29i
al93YWl0IHs8YnI+DQrCoCDCoCDCoCDCoCBfX3UzMiBmbGFnczs8YnI+DQrCoCDCoCDCoCDCoCBf
X3UzMiBmaXJzdF9zaWduYWxlZDsgLyogb25seSB2YWxpZCB3aGVuIG5vdCB3YWl0aW5nIGFsbCAq
Lzxicj4NCsKgIMKgIMKgIMKgIF9fdTMyIHBhZDs8YnI+DQorwqAgwqAgwqAgwqAvKio8YnI+DQor
wqAgwqAgwqAgwqAgKiBAZGVhZGxpbmVfbnMgLSBmZW5jZSBkZWFkbGluZSBoaW50PGJyPg0KK8Kg
IMKgIMKgIMKgICo8YnI+DQorwqAgwqAgwqAgwqAgKiBEZWFkbGluZSBoaW50LCBpbiBhYnNvbHV0
ZSBDTE9DS19NT05PVE9OSUMsIHRvIHNldCBvbiBiYWNraW5nPGJyPg0KK8KgIMKgIMKgIMKgICog
ZmVuY2UocykgaWYgdGhlIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9ERUFETElORSBmbGFn
IGlzPGJyPg0KK8KgIMKgIMKgIMKgICogc2V0Ljxicj4NCivCoCDCoCDCoCDCoCAqLzxicj4NCivC
oCDCoCDCoCDCoF9fdTY0IGRlYWRsaW5lX25zOzxicj4NCsKgfTs8YnI+DQo8YnI+DQrCoHN0cnVj
dCBkcm1fc3luY29ial90aW1lbGluZV93YWl0IHs8YnI+DQpAQCAtOTA3LDYgKzkxNiwxNCBAQCBz
dHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfd2FpdCB7PGJyPg0KwqAgwqAgwqAgwqAgX191MzIg
ZmxhZ3M7PGJyPg0KwqAgwqAgwqAgwqAgX191MzIgZmlyc3Rfc2lnbmFsZWQ7IC8qIG9ubHkgdmFs
aWQgd2hlbiBub3Qgd2FpdGluZyBhbGwgKi88YnI+DQrCoCDCoCDCoCDCoCBfX3UzMiBwYWQ7PGJy
Pg0KK8KgIMKgIMKgIMKgLyoqPGJyPg0KK8KgIMKgIMKgIMKgICogQGRlYWRsaW5lX25zIC0gZmVu
Y2UgZGVhZGxpbmUgaGludDxicj4NCivCoCDCoCDCoCDCoCAqPGJyPg0KK8KgIMKgIMKgIMKgICog
RGVhZGxpbmUgaGludCwgaW4gYWJzb2x1dGUgQ0xPQ0tfTU9OT1RPTklDLCB0byBzZXQgb24gYmFj
a2luZzxicj4NCivCoCDCoCDCoCDCoCAqIGZlbmNlKHMpIGlmIHRoZSBEUk1fU1lOQ09CSl9XQUlU
X0ZMQUdTX1dBSVRfREVBRExJTkUgZmxhZyBpczxicj4NCivCoCDCoCDCoCDCoCAqIHNldC48YnI+
DQorwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqBfX3U2NCBkZWFkbGluZV9uczs8YnI+
DQrCoH07PGJyPg0KPGJyPg0KPGJyPg0KLS0gPGJyPg0KMi4zOS4yPGJyPg0KPGJyPg0KPC9ibG9j
a3F1b3RlPjwvZGl2PjwvZGl2Pg0K
--000000000000caae6905f71d4e06--
