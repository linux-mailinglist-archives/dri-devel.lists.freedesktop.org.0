Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8EB40E6B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 22:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444B10E05C;
	Tue,  2 Sep 2025 20:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D2Kv2E4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608510E05C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 20:15:45 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24b157ba91bso1996495ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756844145; x=1757448945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+TJreQ9c1ntb/ERBr/du1hi7ycAmwaHIYVOmj1mQOI=;
 b=D2Kv2E4q2u2SdoNeXHWx0ANhdOPlLCr+gR4voJ9dXINSzaTlJgJ5BYId4rcRUl6Gmd
 RF6l9QY5tSLY7vToM8Oehbt+j+mG7AWWteqXty+UN8kx+ORO7cI4vrSUO9bLk341ksYH
 8bAjJb5Wi7iGf2+Ho5L0rUnvM6TDpJuZ1uSD8Yb836JBKmPhWAZ2y/8Og5Ht45NKnxEp
 4Z5Ae3vp7nvdJkMriGMOiFCofenkcv9hKuhf7gAL1x8PGwt5lHQ/ucaADb7EgATj6Gna
 P8Qc8jPS85mtUfXnUH1hUg6dHNk6HH8ptwysSIYCkMgTHHFQq5Q3HSQ4a5AcdQ1KcD7f
 Ngow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756844145; x=1757448945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+TJreQ9c1ntb/ERBr/du1hi7ycAmwaHIYVOmj1mQOI=;
 b=fi+Bss+BY+/kiG1+3g7W3jafoW0QMMF6DaXnhPyjRmTXRw50BSC834aGuXXnK1N+m4
 qvKsp8IGSb+65jRyNBKVqmJOeJksU0NhCB/0NELmsP7RnOX/5MbP/8WOzmuqKGIwQ9+b
 +sK0NdQCj3esw3NqQO569bsQENB69hOCC0QgUND3oh7uzrfTw32CQ+8RW+zjUBixNQWn
 r5GdNMzdpbmOmYCMJXG1Jrcums04YWjQyOjHDJAglwRalFfc8j6PrLs9nxsvLk9CzvWQ
 rOygDzJGYBPReI5yySDi+H8/ItnSD2ukGkjOjtL/EzSOdlHEccGbKblerrJ/HEncJOOE
 qpHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/cFyeChP1eulWZJMz5+MXoa+KhH8l0lsmUBvbKAgmnJID6o2Vn7efCR6iHQUD4a/9DjuYRYOULt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOpBonzuHC7BX0cEGAvkiO1YjmxiucHjb5zEEkTM/NHeju0ghv
 IL6cHwbnbO9q2bKndHo2ZnYFYSM52gPeWWWO1oCGucVf6WMcc2w7WLUyCgs9Enavq7vcH+Lr3ER
 l8bW9PnAR4a9YOVYVTu8/duQMebBC9TA=
X-Gm-Gg: ASbGncs8SplncH66SNT13ZfOayoTvciUZ2h9U/A7HFNECF2KAyil6XePRYpNcnr0FEf
 ketDfvLw837fsvBZUK+h3lxm8Plo5bWEJj7Eav8oahBW0k4Bq93rhhbPJ8PeanBR5D/ow4CNPCR
 mbvm5Hdm8Ri5NnOWeag1eEhe6KahpV7aEmy28h5ibaq8CjqpgX9xVhEcH+CWLXApPZ63vr77tuk
 KkgGf8=
X-Google-Smtp-Source: AGHT+IE8+qVIg1fsk02fgebEvTE+8DsgRIZjSJxAQIyXaooi3lu5odPITUnpGSeBzre9dybnmrnCm3aU1vNG7/eJbPY=
X-Received: by 2002:a17:902:d488:b0:248:ff48:8779 with SMTP id
 d9443c01a7336-2491e1ed5d2mr100323795ad.2.1756844144618; Tue, 02 Sep 2025
 13:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250902175034.2056708-1-lizhi.hou@amd.com>
 <CADnq5_MvdU0v7uF8hvA=kkopGAEA=M4DDw8wAGSQMnihfSnKRw@mail.gmail.com>
 <1f4a1d11-e187-a73f-d876-f72a7f799eed@amd.com>
In-Reply-To: <1f4a1d11-e187-a73f-d876-f72a7f799eed@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Sep 2025 16:15:32 -0400
X-Gm-Features: Ac12FXwnLTMThop9qnPtP52A_wLxntzF8SGipo6chzURp5a9RsxyObFHTbMx6DE
Message-ID: <CADnq5_NH0yEBprBumF3rvdPJVtCXpR-XLgBkCVV7sOTqnu6GPw@mail.gmail.com>
Subject: Re: [PATCH V3] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
 jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com, 
 mario.limonciello@amd.com, maciej.falkowski@linux.intel.com
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

On Tue, Sep 2, 2025 at 3:58=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
>
> On 9/2/25 12:48, Alex Deucher wrote:
> > On Tue, Sep 2, 2025 at 2:09=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wr=
ote:
> >> Add interface for applications to get information array. The applicati=
on
> >> provides a buffer pointer along with information type, maximum number =
of
> >> entries and maximum size of each entry. The buffer may also contain ma=
tch
> >> conditions based on the information type. After the ioctl completes, t=
he
> >> actual number of entries and entry size are returned.
> >>
> >> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> >> Link: https://lore.kernel.org/r/20250827203031.1512508-1-lizhi.hou@amd=
.com
> > Do you have a link to the proposed userspace which uses this new IOCTL?
>
> Yes. It is used by runtime library:
>
> https://github.com/amd/xdna-driver/blob/main/src/shim/host/platform_host.=
cpp#L337

You may want to throw that link in your commit message.

Alex

>
>
> Lizhi
>
> >
> > Alex
> >
> >> ---
> >>   drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++----=
--
> >>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
> >>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
> >>   include/uapi/drm/amdxdna_accel.h        | 111 ++++++++++++++++++++++=
+
> >>   4 files changed, 232 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/=
aie2_pci.c
> >> index 7a3449541107..87c425e3d2b9 100644
> >> --- a/drivers/accel/amdxdna/aie2_pci.c
> >> +++ b/drivers/accel/amdxdna/aie2_pci.c
> >> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct amdxdn=
a_client *client,
> >>
> >>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *a=
rg)
> >>   {
> >> -       struct amdxdna_drm_query_hwctx *tmp __free(kfree) =3D NULL;
> >> -       struct amdxdna_drm_get_info *get_info_args =3D arg;
> >> -       struct amdxdna_drm_query_hwctx __user *buf;
> >> +       struct amdxdna_drm_hwctx_entry *tmp __free(kfree) =3D NULL;
> >> +       struct amdxdna_drm_get_array *array_args =3D arg;
> >> +       struct amdxdna_drm_hwctx_entry __user *buf;
> >> +       u32 size;
> >>
> >> -       if (get_info_args->buffer_size < sizeof(*tmp))
> >> +       if (!array_args->num_element)
> >>                  return -EINVAL;
> >>
> >>          tmp =3D kzalloc(sizeof(*tmp), GFP_KERNEL);
> >> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_h=
wctx *hwctx, void *arg)
> >>          tmp->num_col =3D hwctx->num_col;
> >>          tmp->command_submissions =3D hwctx->priv->seq;
> >>          tmp->command_completions =3D hwctx->priv->completed;
> >> -
> >> -       buf =3D u64_to_user_ptr(get_info_args->buffer);
> >> -
> >> -       if (copy_to_user(buf, tmp, sizeof(*tmp)))
> >> +       tmp->pasid =3D hwctx->client->pasid;
> >> +       tmp->priority =3D hwctx->qos.priority;
> >> +       tmp->gops =3D hwctx->qos.gops;
> >> +       tmp->fps =3D hwctx->qos.fps;
> >> +       tmp->dma_bandwidth =3D hwctx->qos.dma_bandwidth;
> >> +       tmp->latency =3D hwctx->qos.latency;
> >> +       tmp->frame_exec_time =3D hwctx->qos.frame_exec_time;
> >> +       tmp->state =3D AMDXDNA_HWCTX_STATE_ACTIVE;
> >> +
> >> +       buf =3D u64_to_user_ptr(array_args->buffer);
> >> +       size =3D min(sizeof(*tmp), array_args->element_size);
> >> +
> >> +       if (copy_to_user(buf, tmp, size))
> >>                  return -EFAULT;
> >>
> >> -       get_info_args->buffer +=3D sizeof(*tmp);
> >> -       get_info_args->buffer_size -=3D sizeof(*tmp);
> >> +       array_args->buffer +=3D size;
> >> +       array_args->num_element--;
> >>
> >>          return 0;
> >>   }
> >> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_h=
wctx *hwctx, void *arg)
> >>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
> >>                                   struct amdxdna_drm_get_info *args)
> >>   {
> >> +       struct amdxdna_drm_get_array array_args;
> >>          struct amdxdna_dev *xdna =3D client->xdna;
> >> -       struct amdxdna_drm_get_info info_args;
> >>          struct amdxdna_client *tmp_client;
> >>          int ret;
> >>
> >>          drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> >>
> >> -       info_args.buffer =3D args->buffer;
> >> -       info_args.buffer_size =3D args->buffer_size;
> >> -
> >> +       array_args.element_size =3D sizeof(struct amdxdna_drm_query_hw=
ctx);
> >> +       array_args.buffer =3D args->buffer;
> >> +       array_args.num_element =3D args->buffer_size / array_args.elem=
ent_size;
> >>          list_for_each_entry(tmp_client, &xdna->client_list, node) {
> >> -               ret =3D amdxdna_hwctx_walk(tmp_client, &info_args, aie=
2_hwctx_status_cb);
> >> +               ret =3D amdxdna_hwctx_walk(tmp_client, &array_args,
> >> +                                        aie2_hwctx_status_cb);
> >>                  if (ret)
> >>                          break;
> >>          }
> >>
> >> -       args->buffer_size =3D (u32)(info_args.buffer - args->buffer);
> >> +       args->buffer_size -=3D (u32)(array_args.buffer - args->buffer)=
;
> >>          return ret;
> >>   }
> >>
> >> @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client *c=
lient, struct amdxdna_drm_get_i
> >>          return ret;
> >>   }
> >>
> >> +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
> >> +                                      struct amdxdna_drm_get_array *a=
rgs)
> >> +{
> >> +       struct amdxdna_drm_get_array array_args;
> >> +       struct amdxdna_dev *xdna =3D client->xdna;
> >> +       struct amdxdna_client *tmp_client;
> >> +       int ret;
> >> +
> >> +       drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> >> +
> >> +       array_args.element_size =3D min(args->element_size,
> >> +                                     sizeof(struct amdxdna_drm_hwctx_=
entry));
> >> +       array_args.buffer =3D args->buffer;
> >> +       array_args.num_element =3D args->num_element * args->element_s=
ize /
> >> +                               array_args.element_size;
> >> +       list_for_each_entry(tmp_client, &xdna->client_list, node) {
> >> +               ret =3D amdxdna_hwctx_walk(tmp_client, &array_args,
> >> +                                        aie2_hwctx_status_cb);
> >> +               if (ret)
> >> +                       break;
> >> +       }
> >> +
> >> +       args->element_size =3D array_args.element_size;
> >> +       args->num_element =3D (u32)((array_args.buffer - args->buffer)=
 /
> >> +                                 args->element_size);
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +static int aie2_get_array(struct amdxdna_client *client,
> >> +                         struct amdxdna_drm_get_array *args)
> >> +{
> >> +       struct amdxdna_dev *xdna =3D client->xdna;
> >> +       int ret, idx;
> >> +
> >> +       if (!drm_dev_enter(&xdna->ddev, &idx))
> >> +               return -ENODEV;
> >> +
> >> +       switch (args->param) {
> >> +       case DRM_AMDXDNA_HW_CONTEXT_ALL:
> >> +               ret =3D aie2_query_ctx_status_array(client, args);
> >> +               break;
> >> +       default:
> >> +               XDNA_ERR(xdna, "Not supported request parameter %u", a=
rgs->param);
> >> +               ret =3D -EOPNOTSUPP;
> >> +       }
> >> +       XDNA_DBG(xdna, "Got param %d", args->param);
> >> +
> >> +       drm_dev_exit(idx);
> >> +       return ret;
> >> +}
> >> +
> >>   static int aie2_set_power_mode(struct amdxdna_client *client,
> >>                                 struct amdxdna_drm_set_state *args)
> >>   {
> >> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client =
*client,
> >>   }
> >>
> >>   const struct amdxdna_dev_ops aie2_ops =3D {
> >> -       .init           =3D aie2_init,
> >> -       .fini           =3D aie2_fini,
> >> -       .resume         =3D aie2_hw_resume,
> >> -       .suspend        =3D aie2_hw_suspend,
> >> -       .get_aie_info   =3D aie2_get_info,
> >> -       .set_aie_state  =3D aie2_set_state,
> >> -       .hwctx_init     =3D aie2_hwctx_init,
> >> -       .hwctx_fini     =3D aie2_hwctx_fini,
> >> -       .hwctx_config   =3D aie2_hwctx_config,
> >> -       .cmd_submit     =3D aie2_cmd_submit,
> >> +       .init =3D aie2_init,
> >> +       .fini =3D aie2_fini,
> >> +       .resume =3D aie2_hw_resume,
> >> +       .suspend =3D aie2_hw_suspend,
> >> +       .get_aie_info =3D aie2_get_info,
> >> +       .set_aie_state =3D aie2_set_state,
> >> +       .hwctx_init =3D aie2_hwctx_init,
> >> +       .hwctx_fini =3D aie2_hwctx_fini,
> >> +       .hwctx_config =3D aie2_hwctx_config,
> >> +       .cmd_submit =3D aie2_cmd_submit,
> >>          .hmm_invalidate =3D aie2_hmm_invalidate,
> >> +       .get_array =3D aie2_get_array,
> >>   };
> >> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/a=
mdxdna/amdxdna_pci_drv.c
> >> index 8ef5e4f27f5e..0a1fd55e745e 100644
> >> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> >> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> >> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
> >>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
> >>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
> >>
> >> +/*
> >> + * 0.0: Initial version
> >> + * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GE=
T_ARRAY
> >> + */
> >> +#define AMDXDNA_DRIVER_MAJOR           0
> >> +#define AMDXDNA_DRIVER_MINOR           1
> >> +
> >>   /*
> >>    * Bind the driver base on (vendor_id, device_id) pair and later use=
 the
> >>    * (device_id, rev_id) pair as a key to select the devices. The devi=
ces with
> >> @@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_=
device *dev, void *data, struct
> >>          return ret;
> >>   }
> >>
> >> +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *=
data,
> >> +                                      struct drm_file *filp)
> >> +{
> >> +       struct amdxdna_client *client =3D filp->driver_priv;
> >> +       struct amdxdna_dev *xdna =3D to_xdna_dev(dev);
> >> +       struct amdxdna_drm_get_array *args =3D data;
> >> +       int ret;
> >> +
> >> +       if (!xdna->dev_info->ops->get_array)
> >> +               return -EOPNOTSUPP;
> >> +
> >> +       if (args->pad || !args->num_element || !args->element_size)
> >> +               return -EINVAL;
> >> +
> >> +       mutex_lock(&xdna->dev_lock);
> >> +       ret =3D xdna->dev_info->ops->get_array(client, args);
> >> +       mutex_unlock(&xdna->dev_lock);
> >> +       return ret;
> >> +}
> >> +
> >>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void =
*data, struct drm_file *filp)
> >>   {
> >>          struct amdxdna_client *client =3D filp->driver_priv;
> >> @@ -195,6 +222,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioc=
tls[] =3D {
> >>          DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_io=
ctl, 0),
> >>          /* AIE hardware */
> >>          DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioct=
l, 0),
> >> +       DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioc=
tl, 0),
> >>          DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_io=
ctl, DRM_ROOT_ONLY),
> >>   };
> >>
> >> @@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv =3D {
> >>          .fops =3D &amdxdna_fops,
> >>          .name =3D "amdxdna_accel_driver",
> >>          .desc =3D "AMD XDNA DRM implementation",
> >> +       .major =3D AMDXDNA_DRIVER_MAJOR,
> >> +       .minor =3D AMDXDNA_DRIVER_MINOR,
> >>          .open =3D amdxdna_drm_open,
> >>          .postclose =3D amdxdna_drm_close,
> >>          .ioctls =3D amdxdna_drm_ioctls,
> >> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/a=
mdxdna/amdxdna_pci_drv.h
> >> index b6b3b424d1d5..72d6696d49da 100644
> >> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> >> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> >> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
> >>          int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna=
_sched_job *job, u64 *seq);
> >>          int (*get_aie_info)(struct amdxdna_client *client, struct amd=
xdna_drm_get_info *args);
> >>          int (*set_aie_state)(struct amdxdna_client *client, struct am=
dxdna_drm_set_state *args);
> >> +       int (*get_array)(struct amdxdna_client *client, struct amdxdna=
_drm_get_array *args);
> >>   };
> >>
> >>   /*
> >> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxd=
na_accel.h
> >> index ce523e9ccc52..a1fb9785db77 100644
> >> --- a/include/uapi/drm/amdxdna_accel.h
> >> +++ b/include/uapi/drm/amdxdna_accel.h
> >> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
> >>          DRM_AMDXDNA_EXEC_CMD,
> >>          DRM_AMDXDNA_GET_INFO,
> >>          DRM_AMDXDNA_SET_STATE,
> >> +       DRM_AMDXDNA_GET_ARRAY =3D 10,
> >>   };
> >>
> >>   /**
> >> @@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
> >>          __u64 buffer; /* in/out */
> >>   };
> >>
> >> +#define AMDXDNA_HWCTX_STATE_IDLE       0
> >> +#define AMDXDNA_HWCTX_STATE_ACTIVE     1
> >> +
> >> +/**
> >> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
> >> + */
> >> +struct amdxdna_drm_hwctx_entry {
> >> +       /** @context_id: Context ID. */
> >> +       __u32 context_id;
> >> +       /** @start_col: Start AIE array column assigned to context. */
> >> +       __u32 start_col;
> >> +       /** @num_col: Number of AIE array columns assigned to context.=
 */
> >> +       __u32 num_col;
> >> +       /** @hwctx_id: The real hardware context id. */
> >> +       __u32 hwctx_id;
> >> +       /** @pid: ID of process which created this context. */
> >> +       __s64 pid;
> >> +       /** @command_submissions: Number of commands submitted. */
> >> +       __u64 command_submissions;
> >> +       /** @command_completions: Number of commands completed. */
> >> +       __u64 command_completions;
> >> +       /** @migrations: Number of times been migrated. */
> >> +       __u64 migrations;
> >> +       /** @preemptions: Number of times been preempted. */
> >> +       __u64 preemptions;
> >> +       /** @errors: Number of errors happened. */
> >> +       __u64 errors;
> >> +       /** @priority: Context priority. */
> >> +       __u64 priority;
> >> +       /** @heap_usage: Usage of device heap buffer. */
> >> +       __u64 heap_usage;
> >> +       /** @suspensions: Number of times been suspended. */
> >> +       __u64 suspensions;
> >> +       /**
> >> +        * @state: Context state.
> >> +        * %AMDXDNA_HWCTX_STATE_IDLE
> >> +        * %AMDXDNA_HWCTX_STATE_ACTIVE
> >> +        */
> >> +       __u32 state;
> >> +       /** @pasid: PASID been bound. */
> >> +       __u32 pasid;
> >> +       /** @gops: Giga operations per second. */
> >> +       __u32 gops;
> >> +       /** @fps: Frames per second. */
> >> +       __u32 fps;
> >> +       /** @dma_bandwidth: DMA bandwidth. */
> >> +       __u32 dma_bandwidth;
> >> +       /** @latency: Frame response latency. */
> >> +       __u32 latency;
> >> +       /** @frame_exec_time: Frame execution time. */
> >> +       __u32 frame_exec_time;
> >> +       /** @txn_op_idx: Index of last control code executed. */
> >> +       __u32 txn_op_idx;
> >> +       /** @ctx_pc: Program counter. */
> >> +       __u32 ctx_pc;
> >> +       /** @fatal_error_type: Fatal error type if context crashes. */
> >> +       __u32 fatal_error_type;
> >> +       /** @fatal_error_exception_type: Firmware exception type. */
> >> +       __u32 fatal_error_exception_type;
> >> +       /** @fatal_error_exception_pc: Firmware exception program coun=
ter. */
> >> +       __u32 fatal_error_exception_pc;
> >> +       /** @fatal_error_app_module: Exception module name. */
> >> +       __u32 fatal_error_app_module;
> >> +       /** @pad: Structure pad. */
> >> +       __u32 pad;
> >> +};
> >> +
> >> +#define DRM_AMDXDNA_HW_CONTEXT_ALL     0
> >> +
> >> +/**
> >> + * struct amdxdna_drm_get_array - Get information array.
> >> + */
> >> +struct amdxdna_drm_get_array {
> >> +       /**
> >> +        * @param:
> >> +        *
> >> +        * Supported params:
> >> +        *
> >> +        * %DRM_AMDXDNA_HW_CONTEXT_ALL:
> >> +        * Returns all created hardware contexts.
> >> +        */
> >> +       __u32 param;
> >> +       /**
> >> +        * @element_size:
> >> +        *
> >> +        * Specifies maximum element size and returns the actual eleme=
nt size.
> >> +        */
> >> +       __u32 element_size;
> >> +       /**
> >> +        * @num_element:
> >> +        *
> >> +        * Specifies maximum number of elements and returns the actual=
 number
> >> +        * of elements.
> >> +        */
> >> +       __u32 num_element; /* in/out */
> >> +       /** @pad: MBZ */
> >> +       __u32 pad;
> >> +       /**
> >> +        * @buffer:
> >> +        *
> >> +        * Specifies the match conditions and returns the matched info=
rmation
> >> +        * array.
> >> +        */
> >> +       __u64 buffer;
> >> +};
> >> +
> >>   enum amdxdna_drm_set_param {
> >>          DRM_AMDXDNA_SET_POWER_MODE,
> >>          DRM_AMDXDNA_WRITE_AIE_MEM,
> >> @@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
> >>          DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
> >>                   struct amdxdna_drm_set_state)
> >>
> >> +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
> >> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
> >> +                struct amdxdna_drm_get_array)
> >> +
> >>   #if defined(__cplusplus)
> >>   } /* extern c end */
> >>   #endif
> >> --
> >> 2.34.1
> >>
