Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47089E1969
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 11:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FF710E9D5;
	Tue,  3 Dec 2024 10:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pxEfRmHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC9D10E313
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 10:35:49 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4aef56c5cf9so1246717137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 02:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733222148; x=1733826948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mhcd8tztzrsmrTpDpmUC17ZGpaAP23msF4wpZXXLsYA=;
 b=pxEfRmHUXPKQVXhBh+XfxYddxb21yKBa2j49ymB6/gVj9olmj9+6Z6oYmILtQCvdY4
 /mIiHS28XnICAqz8zromEQYJMEudxMPlWk4Jvr/X9BnAmZzb0u/Wivf2eWn/3/87uObB
 6o5IO6vlMBwIiaSxAWkIJa0J0pSCpojbNh1kJmXiKtNGuUcTrySX5suZynF5RBDP4m5t
 chaFVxQJpmGrRIlEt8f7varNOUmhqmefq3xrtmcJmhqis+hzrwm3GvIi59NY17UnbJ+4
 jmTY8LNXL02kYA6du6jifL2/UP9hj6Xx3PzFMyftdV4kD3GwB1rYgw7/N+RmOkmRtHzx
 nyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733222148; x=1733826948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mhcd8tztzrsmrTpDpmUC17ZGpaAP23msF4wpZXXLsYA=;
 b=rTyoBBZPttkr+HnI4npZuKGA6DvaGl0ipdPSjxn+oCncGzExe9tZw9Yu1byV/mQGrb
 Tj+yN+rtolhxExjmT4s3nDz7EZwuswgfXleFHghi7e+4jDCQCt2k3wEhGq31/nAAapUe
 SeSwokeDDB94b2VblA3LLjc7fxpeIn9cQyHY+6f6LE50VJrlg6QfMwCqs65unFmhZfwv
 Jfmt6MrC0bJswac4J4Rfy3PzKyH+dZimNmgewWc6HbqiEUULUutcXGTR4fWJD+kGJ1sm
 x3fp+yIxA0LlwH9t5fF4NDnIR7LVbq/P29H2fOVHaxyXHaE+HGoiCzbLZobNCwEuyGQQ
 czsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikkuDz4UTMnhl0G5mdJLUN7NqcYbDmJMWQeCldskO4XfuLmtfxdm+fZqTZdALVKBg+e9rE5GG3V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8LuuX/EhgWBxhHV6eV44ToTPD7Lqy5TD0TMlWVntWveYNupQF
 Jah6SxfnfJ2hveILNC248zc+GBH/m4sUYKmmqik0ew9mf4XxNHpo+iRHnBMmrK9oWd9jljWOgId
 JsA2ZcaupzhwnvP0swguxSZTQ7yOU3hBMSLYong==
X-Gm-Gg: ASbGncsKQiYRUu8Asahf85Xd+xgbgIKnquwcclU2GSGs6IKdwZvcbMCMd8g/QFIGJxg
 +xoPUTX0MmPe/G/wlAhTcC7uTrJab/3S+9Q==
X-Google-Smtp-Source: AGHT+IGS5QRdKZKgvFetcUI6SJ/XQoEF4YoWpYvC25d7VilnMb7bCdwwJFJte6YnS2v3sC+E4tET6IdKyVvzSDI6XjE=
X-Received: by 2002:a05:6102:5111:b0:4af:4d78:4b61 with SMTP id
 ada2fe7eead31-4af971ad0bfmr2955304137.10.1733222148485; Tue, 03 Dec 2024
 02:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20241128150927.1377981-1-jens.wiklander@linaro.org>
 <20241128150927.1377981-3-jens.wiklander@linaro.org>
 <CAFA6WYPEqCWyvD=pCj6DEkZWN9SCfXMnq4tKbSx1-e8UmgXb=Q@mail.gmail.com>
 <CAHUa44H0go3fSMt_jreWz4EQgYvo8GOZ5woc-x5Cyi680oWZWw@mail.gmail.com>
In-Reply-To: <CAHUa44H0go3fSMt_jreWz4EQgYvo8GOZ5woc-x5Cyi680oWZWw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 3 Dec 2024 16:05:37 +0530
Message-ID: <CAFA6WYNJQEjs29AniqC7mdmo7Fe+fCmW1kFcJ1Z2HSjQQ36LBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] optee: account for direction while converting
 parameters
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com
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

On Tue, 3 Dec 2024 at 15:58, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
>
> Hi Sumit,
>
> On Tue, Dec 3, 2024 at 9:27=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org>=
 wrote:
> >
> > Hi Jens,
> >
> > On Thu, 28 Nov 2024 at 20:39, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > The OP-TEE backend driver has two internal function pointers to conve=
rt
> > > between the subsystem type struct tee_param and the OP-TEE type struc=
t
> > > optee_msg_param.
> > >
> > > The conversion is done from one of the types to the other, which is t=
hen
> > > involved in some operation and finally converted back to the original
> > > type. When converting to prepare the parameters for the operation, al=
l
> > > fields must be taken into account, but then converting back, it's eno=
ugh
> > > to update only out-values and out-sizes. So, an update_out parameter =
is
> > > added to the conversion functions to tell if all or only some fields
> > > must be copied.
> >
> > Is this patch just a refactoring of TEE params handling? Or are we
> > fixing a real ABI issue here? Also, is this required for restricted
> > shared memory support to work? Just asking if we want to consider it
> > as a fix for backporting or if we can handle this refactoring patch
> > independently of this series?
>
> This is needed in this series. Without this patch, it might get
> confusing when converting back in from_msg_param() callback since an
> allocated restricted SHM can be using the sec_world_id of the pool and
> that doesn't translate back well. params_to_user() in
> drivers/tee/tee_core.c already takes the direction into account so it
> wouldn't spread to user-space.

Thanks Jens for the clarification, if you can update the commit text
accordingly will help clarify the motivation for the change.

-Sumit

>
> Cheers,
> Jens
>
> >
> > -Sumit
> >
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/optee/call.c          | 10 ++--
> > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++------=
--
> > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > >
> > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
> > > index 16eb953e14bb..f1533b894726 100644
> > > --- a/drivers/tee/optee/call.c
> > > +++ b/drivers/tee/optee/call.c
> > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *ctx,
> > >         export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > >
> > >         rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
> > > -                                     arg->num_params, param);
> > > +                                     arg->num_params, param,
> > > +                                     false /*!update_out*/);
> > >         if (rc)
> > >                 goto out;
> > >
> > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *ctx,
> > >         }
> > >
> > >         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > -                                      msg_arg->params + 2)) {
> > > +                                      msg_arg->params + 2,
> > > +                                      true /*update_out*/)) {
> > >                 arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > >                 arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > >                 /* Close session again to avoid leakage */
> > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *ctx, st=
ruct tee_ioctl_invoke_arg *arg,
> > >         msg_arg->cancel_id =3D arg->cancel_id;
> > >
> > >         rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg->=
num_params,
> > > -                                     param);
> > > +                                     param, false /*!update_out*/);
> > >         if (rc)
> > >                 goto out;
> > >
> > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *ctx, st=
ruct tee_ioctl_invoke_arg *arg,
> > >         }
> > >
> > >         if (optee->ops->from_msg_param(optee, param, arg->num_params,
> > > -                                      msg_arg->params)) {
> > > +                                      msg_arg->params, true /*update=
_out*/)) {
> > >                 msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > >                 msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > >         }
> > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.=
c
> > > index f3af5666bb11..02e6175ac5f0 100644
> > > --- a/drivers/tee/optee/ffa_abi.c
> > > +++ b/drivers/tee/optee/ffa_abi.c
> > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struct opte=
e *optee, u64 global_id)
> > >   */
> > >
> > >  static void from_msg_param_ffa_mem(struct optee *optee, struct tee_p=
aram *p,
> > > -                                  u32 attr, const struct optee_msg_p=
aram *mp)
> > > +                                  u32 attr, const struct optee_msg_p=
aram *mp,
> > > +                                  bool update_out)
> > >  {
> > >         struct tee_shm *shm =3D NULL;
> > >         u64 offs_high =3D 0;
> > >         u64 offs_low =3D 0;
> > >
> > > +       if (update_out) {
> > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > +                       return;
> > > +               goto out;
> > > +       }
> > > +
> > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > >                   attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > -       p->u.memref.size =3D mp->u.fmem.size;
> > >
> > >         if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOBAL_I=
D)
> > >                 shm =3D optee_shm_from_ffa_handle(optee, mp->u.fmem.g=
lobal_id);
> > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct optee *=
optee, struct tee_param *p,
> > >                 offs_high =3D mp->u.fmem.offs_high;
> > >         }
> > >         p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > +out:
> > > +       p->u.memref.size =3D mp->u.fmem.size;
> > >  }
> > >
> > >  /**
> > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct optee=
 *optee, struct tee_param *p,
> > >   * @params:    subsystem internal parameter representation
> > >   * @num_params:        number of elements in the parameter arrays
> > >   * @msg_params:        OPTEE_MSG parameters
> > > + * @update_out: update parameter for output only
> > >   *
> > >   * Returns 0 on success or <0 on failure
> > >   */
> > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > >                                     struct tee_param *params, size_t =
num_params,
> > > -                                   const struct optee_msg_param *msg=
_params)
> > > +                                   const struct optee_msg_param *msg=
_params,
> > > +                                   bool update_out)
> > >  {
> > >         size_t n;
> > >
> > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struct opte=
e *optee,
> > >
> > >                 switch (attr) {
> > >                 case OPTEE_MSG_ATTR_TYPE_NONE:
> > > +                       if (update_out)
> > > +                               break;
> > >                         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > >                         memset(&p->u, 0, sizeof(p->u));
> > >                         break;
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > -                       optee_from_msg_param_value(p, attr, mp);
> > > +                       optee_from_msg_param_value(p, attr, mp, updat=
e_out);
> > >                         break;
> > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > -                       from_msg_param_ffa_mem(optee, p, attr, mp);
> > > +                       from_msg_param_ffa_mem(optee, p, attr, mp, up=
date_out);
> > >                         break;
> > >                 default:
> > >                         return -EINVAL;
> > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struct opte=
e *optee,
> > >  }
> > >
> > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > -                               const struct tee_param *p)
> > > +                               const struct tee_param *p, bool updat=
e_out)
> > >  {
> > >         struct tee_shm *shm =3D p->u.memref.shm;
> > >
> > > +       if (update_out) {
> > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_I=
NPUT)
> > > +                       return 0;
> > > +               goto out;
> > > +       }
> > > +
> > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > >
> > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct optee_msg_=
param *mp,
> > >                 memset(&mp->u, 0, sizeof(mp->u));
> > >                 mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLOBA=
L_ID;
> > >         }
> > > +out:
> > >         mp->u.fmem.size =3D p->u.memref.size;
> > >
> > >         return 0;
> > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct optee_ms=
g_param *mp,
> > >   * @optee:     main service struct
> > >   * @msg_params:        OPTEE_MSG parameters
> > >   * @num_params:        number of elements in the parameter arrays
> > > - * @params:    subsystem itnernal parameter representation
> > > + * @params:    subsystem internal parameter representation
> > > + * @update_out: update parameter for output only
> > >   * Returns 0 on success or <0 on failure
> > >   */
> > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > >                                   struct optee_msg_param *msg_params,
> > >                                   size_t num_params,
> > > -                                 const struct tee_param *params)
> > > +                                 const struct tee_param *params,
> > > +                                 bool update_out)
> > >  {
> > >         size_t n;
> > >
> > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct optee =
*optee,
> > >
> > >                 switch (p->attr) {
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > +                       if (update_out)
> > > +                               break;
> > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > >                         memset(&mp->u, 0, sizeof(mp->u));
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > -                       optee_to_msg_param_value(mp, p);
> > > +                       optee_to_msg_param_value(mp, p, update_out);
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > -                       if (to_msg_param_ffa_mem(mp, p))
> > > +                       if (to_msg_param_ffa_mem(mp, p, update_out))
> > >                                 return -EINVAL;
> > >                         break;
> > >                 default:
> > > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/op=
tee_private.h
> > > index dc0f355ef72a..20eda508dbac 100644
> > > --- a/drivers/tee/optee/optee_private.h
> > > +++ b/drivers/tee/optee/optee_private.h
> > > @@ -185,10 +185,12 @@ struct optee_ops {
> > >                                 bool system_thread);
> > >         int (*to_msg_param)(struct optee *optee,
> > >                             struct optee_msg_param *msg_params,
> > > -                           size_t num_params, const struct tee_param=
 *params);
> > > +                           size_t num_params, const struct tee_param=
 *params,
> > > +                           bool update_out);
> > >         int (*from_msg_param)(struct optee *optee, struct tee_param *=
params,
> > >                               size_t num_params,
> > > -                             const struct optee_msg_param *msg_param=
s);
> > > +                             const struct optee_msg_param *msg_param=
s,
> > > +                             bool update_out);
> > >  };
> > >
> > >  /**
> > > @@ -316,23 +318,35 @@ void optee_release(struct tee_context *ctx);
> > >  void optee_release_supp(struct tee_context *ctx);
> > >
> > >  static inline void optee_from_msg_param_value(struct tee_param *p, u=
32 attr,
> > > -                                             const struct optee_msg_=
param *mp)
> > > +                                             const struct optee_msg_=
param *mp,
> > > +                                             bool update_out)
> > >  {
> > > -       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> > > -                 attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > > -       p->u.value.a =3D mp->u.value.a;
> > > -       p->u.value.b =3D mp->u.value.b;
> > > -       p->u.value.c =3D mp->u.value.c;
> > > +       if (!update_out)
> > > +               p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
> > > +                         attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
> > > +
> > > +       if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT ||
> > > +           attr =3D=3D OPTEE_MSG_ATTR_TYPE_VALUE_INOUT || !update_ou=
t) {
> > > +               p->u.value.a =3D mp->u.value.a;
> > > +               p->u.value.b =3D mp->u.value.b;
> > > +               p->u.value.c =3D mp->u.value.c;
> > > +       }
> > >  }
> > >
> > >  static inline void optee_to_msg_param_value(struct optee_msg_param *=
mp,
> > > -                                           const struct tee_param *p=
)
> > > +                                           const struct tee_param *p=
,
> > > +                                           bool update_out)
> > >  {
> > > -       mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
> > > -                  TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> > > -       mp->u.value.a =3D p->u.value.a;
> > > -       mp->u.value.b =3D p->u.value.b;
> > > -       mp->u.value.c =3D p->u.value.c;
> > > +       if (!update_out)
> > > +               mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->att=
r -
> > > +                          TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> > > +
> > > +       if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT ||
> > > +           p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT || !=
update_out) {
> > > +               mp->u.value.a =3D p->u.value.a;
> > > +               mp->u.value.b =3D p->u.value.b;
> > > +               mp->u.value.c =3D p->u.value.c;
> > > +       }
> > >  }
> > >
> > >  void optee_cq_init(struct optee_call_queue *cq, int thread_count);
> > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > index ebbbd42b0e3e..580e6b9b0606 100644
> > > --- a/drivers/tee/optee/rpc.c
> > > +++ b/drivers/tee/optee/rpc.c
> > > @@ -63,7 +63,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct=
 tee_context *ctx,
> > >         }
> > >
> > >         if (optee->ops->from_msg_param(optee, params, arg->num_params=
,
> > > -                                      arg->params))
> > > +                                      arg->params, false /*!update_o=
ut*/))
> > >                 goto bad;
> > >
> > >         for (i =3D 0; i < arg->num_params; i++) {
> > > @@ -107,7 +107,8 @@ static void handle_rpc_func_cmd_i2c_transfer(stru=
ct tee_context *ctx,
> > >         } else {
> > >                 params[3].u.value.a =3D msg.len;
> > >                 if (optee->ops->to_msg_param(optee, arg->params,
> > > -                                            arg->num_params, params)=
)
> > > +                                            arg->num_params, params,
> > > +                                            true /*update_out*/))
> > >                         arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 else
> > >                         arg->ret =3D TEEC_SUCCESS;
> > > @@ -188,6 +189,7 @@ static void handle_rpc_func_cmd_wait(struct optee=
_msg_arg *arg)
> > >  static void handle_rpc_supp_cmd(struct tee_context *ctx, struct opte=
e *optee,
> > >                                 struct optee_msg_arg *arg)
> > >  {
> > > +       bool update_out =3D false;
> > >         struct tee_param *params;
> > >
> > >         arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > @@ -200,15 +202,21 @@ static void handle_rpc_supp_cmd(struct tee_cont=
ext *ctx, struct optee *optee,
> > >         }
> > >
> > >         if (optee->ops->from_msg_param(optee, params, arg->num_params=
,
> > > -                                      arg->params)) {
> > > +                                      arg->params, update_out)) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 goto out;
> > >         }
> > >
> > >         arg->ret =3D optee_supp_thrd_req(ctx, arg->cmd, arg->num_para=
ms, params);
> > >
> > > +       /*
> > > +        * Special treatment for OPTEE_RPC_CMD_SHM_ALLOC since input =
is a
> > > +        * value type, but the output is a memref type.
> > > +        */
> > > +       if (arg->cmd !=3D OPTEE_RPC_CMD_SHM_ALLOC)
> > > +               update_out =3D true;
> > >         if (optee->ops->to_msg_param(optee, arg->params, arg->num_par=
ams,
> > > -                                    params))
> > > +                                    params, update_out))
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >  out:
> > >         kfree(params);
> > > @@ -270,7 +278,7 @@ static void handle_rpc_func_rpmb_probe_reset(stru=
ct tee_context *ctx,
> > >
> > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > >             optee->ops->from_msg_param(optee, params, arg->num_params=
,
> > > -                                      arg->params) ||
> > > +                                      arg->params, false /*!update_o=
ut*/) ||
> > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPU=
T) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 return;
> > > @@ -280,7 +288,8 @@ static void handle_rpc_func_rpmb_probe_reset(stru=
ct tee_context *ctx,
> > >         params[0].u.value.b =3D 0;
> > >         params[0].u.value.c =3D 0;
> > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > -                                    arg->num_params, params)) {
> > > +                                    arg->num_params, params,
> > > +                                    true /*update_out*/)) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 return;
> > >         }
> > > @@ -324,7 +333,7 @@ static void handle_rpc_func_rpmb_probe_next(struc=
t tee_context *ctx,
> > >
> > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > >             optee->ops->from_msg_param(optee, params, arg->num_params=
,
> > > -                                      arg->params) ||
> > > +                                      arg->params, false /*!update_o=
ut*/) ||
> > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPU=
T ||
> > >             params[1].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTP=
UT) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > @@ -358,7 +367,8 @@ static void handle_rpc_func_rpmb_probe_next(struc=
t tee_context *ctx,
> > >         params[0].u.value.b =3D rdev->descr.capacity;
> > >         params[0].u.value.c =3D rdev->descr.reliable_wr_count;
> > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > -                                    arg->num_params, params)) {
> > > +                                    arg->num_params, params,
> > > +                                    true /*update_out*/)) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 return;
> > >         }
> > > @@ -384,7 +394,7 @@ static void handle_rpc_func_rpmb_frames(struct te=
e_context *ctx,
> > >
> > >         if (arg->num_params !=3D ARRAY_SIZE(params) ||
> > >             optee->ops->from_msg_param(optee, params, arg->num_params=
,
> > > -                                      arg->params) ||
> > > +                                      arg->params, false /*!update_o=
ut*/) ||
> > >             params[0].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPU=
T ||
> > >             params[1].attr !=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTP=
UT) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > @@ -401,7 +411,8 @@ static void handle_rpc_func_rpmb_frames(struct te=
e_context *ctx,
> > >                 goto out;
> > >         }
> > >         if (optee->ops->to_msg_param(optee, arg->params,
> > > -                                    arg->num_params, params)) {
> > > +                                    arg->num_params, params,
> > > +                                    true /*update_out*/)) {
> > >                 arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >                 goto out;
> > >         }
> > > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.=
c
> > > index e9456e3e74cc..d1f79947f58a 100644
> > > --- a/drivers/tee/optee/smc_abi.c
> > > +++ b/drivers/tee/optee/smc_abi.c
> > > @@ -81,20 +81,26 @@ static int optee_cpuhp_disable_pcpu_irq(unsigned =
int cpu)
> > >   */
> > >
> > >  static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
> > > -                                 const struct optee_msg_param *mp)
> > > +                                 const struct optee_msg_param *mp,
> > > +                                 bool update_out)
> > >  {
> > >         struct tee_shm *shm;
> > >         phys_addr_t pa;
> > >         int rc;
> > >
> > > +       if (update_out) {
> > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT)
> > > +                       return 0;
> > > +               goto out;
> > > +       }
> > > +
> > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > >                   attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
> > > -       p->u.memref.size =3D mp->u.tmem.size;
> > >         shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
> > >         if (!shm) {
> > >                 p->u.memref.shm_offs =3D 0;
> > >                 p->u.memref.shm =3D NULL;
> > > -               return 0;
> > > +               goto out;
> > >         }
> > >
> > >         rc =3D tee_shm_get_pa(shm, 0, &pa);
> > > @@ -103,18 +109,25 @@ static int from_msg_param_tmp_mem(struct tee_pa=
ram *p, u32 attr,
> > >
> > >         p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
> > >         p->u.memref.shm =3D shm;
> > > -
> > > +out:
> > > +       p->u.memref.size =3D mp->u.tmem.size;
> > >         return 0;
> > >  }
> > >
> > >  static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
> > > -                                  const struct optee_msg_param *mp)
> > > +                                  const struct optee_msg_param *mp,
> > > +                                  bool update_out)
> > >  {
> > >         struct tee_shm *shm;
> > >
> > > +       if (update_out) {
> > > +               if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT)
> > > +                       return;
> > > +               goto out;
> > > +       }
> > > +
> > >         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > >                   attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
> > > -       p->u.memref.size =3D mp->u.rmem.size;
> > >         shm =3D (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
> > >
> > >         if (shm) {
> > > @@ -124,6 +137,8 @@ static void from_msg_param_reg_mem(struct tee_par=
am *p, u32 attr,
> > >                 p->u.memref.shm_offs =3D 0;
> > >                 p->u.memref.shm =3D NULL;
> > >         }
> > > +out:
> > > +       p->u.memref.size =3D mp->u.rmem.size;
> > >  }
> > >
> > >  /**
> > > @@ -133,11 +148,13 @@ static void from_msg_param_reg_mem(struct tee_p=
aram *p, u32 attr,
> > >   * @params:    subsystem internal parameter representation
> > >   * @num_params:        number of elements in the parameter arrays
> > >   * @msg_params:        OPTEE_MSG parameters
> > > + * @update_out:        update parameter for output only
> > >   * Returns 0 on success or <0 on failure
> > >   */
> > >  static int optee_from_msg_param(struct optee *optee, struct tee_para=
m *params,
> > >                                 size_t num_params,
> > > -                               const struct optee_msg_param *msg_par=
ams)
> > > +                               const struct optee_msg_param *msg_par=
ams,
> > > +                               bool update_out)
> > >  {
> > >         int rc;
> > >         size_t n;
> > > @@ -149,25 +166,27 @@ static int optee_from_msg_param(struct optee *o=
ptee, struct tee_param *params,
> > >
> > >                 switch (attr) {
> > >                 case OPTEE_MSG_ATTR_TYPE_NONE:
> > > +                       if (update_out)
> > > +                               break;
> > >                         p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > >                         memset(&p->u, 0, sizeof(p->u));
> > >                         break;
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > -                       optee_from_msg_param_value(p, attr, mp);
> > > +                       optee_from_msg_param_value(p, attr, mp, updat=
e_out);
> > >                         break;
> > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
> > > -                       rc =3D from_msg_param_tmp_mem(p, attr, mp);
> > > +                       rc =3D from_msg_param_tmp_mem(p, attr, mp, up=
date_out);
> > >                         if (rc)
> > >                                 return rc;
> > >                         break;
> > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
> > >                 case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
> > > -                       from_msg_param_reg_mem(p, attr, mp);
> > > +                       from_msg_param_reg_mem(p, attr, mp, update_ou=
t);
> > >                         break;
> > >
> > >                 default:
> > > @@ -178,20 +197,25 @@ static int optee_from_msg_param(struct optee *o=
ptee, struct tee_param *params,
> > >  }
> > >
> > >  static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
> > > -                               const struct tee_param *p)
> > > +                               const struct tee_param *p, bool updat=
e_out)
> > >  {
> > >         int rc;
> > >         phys_addr_t pa;
> > >
> > > +       if (update_out) {
> > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_I=
NPUT)
> > > +                       return 0;
> > > +               goto out;
> > > +       }
> > > +
> > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
> > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > >
> > >         mp->u.tmem.shm_ref =3D (unsigned long)p->u.memref.shm;
> > > -       mp->u.tmem.size =3D p->u.memref.size;
> > >
> > >         if (!p->u.memref.shm) {
> > >                 mp->u.tmem.buf_ptr =3D 0;
> > > -               return 0;
> > > +               goto out;
> > >         }
> > >
> > >         rc =3D tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, =
&pa);
> > > @@ -201,19 +225,27 @@ static int to_msg_param_tmp_mem(struct optee_ms=
g_param *mp,
> > >         mp->u.tmem.buf_ptr =3D pa;
> > >         mp->attr |=3D OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
> > >                     OPTEE_MSG_ATTR_CACHE_SHIFT;
> > > -
> > > +out:
> > > +       mp->u.tmem.size =3D p->u.memref.size;
> > >         return 0;
> > >  }
> > >
> > >  static int to_msg_param_reg_mem(struct optee_msg_param *mp,
> > > -                               const struct tee_param *p)
> > > +                               const struct tee_param *p, bool updat=
e_out)
> > >  {
> > > +       if (update_out) {
> > > +               if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_I=
NPUT)
> > > +                       return 0;
> > > +               goto out;
> > > +       }
> > > +
> > >         mp->attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
> > >                    TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > >
> > >         mp->u.rmem.shm_ref =3D (unsigned long)p->u.memref.shm;
> > > -       mp->u.rmem.size =3D p->u.memref.size;
> > >         mp->u.rmem.offs =3D p->u.memref.shm_offs;
> > > +out:
> > > +       mp->u.rmem.size =3D p->u.memref.size;
> > >         return 0;
> > >  }
> > >
> > > @@ -223,11 +255,13 @@ static int to_msg_param_reg_mem(struct optee_ms=
g_param *mp,
> > >   * @msg_params:        OPTEE_MSG parameters
> > >   * @num_params:        number of elements in the parameter arrays
> > >   * @params:    subsystem itnernal parameter representation
> > > + * @update_out:        update parameter for output only
> > >   * Returns 0 on success or <0 on failure
> > >   */
> > >  static int optee_to_msg_param(struct optee *optee,
> > >                               struct optee_msg_param *msg_params,
> > > -                             size_t num_params, const struct tee_par=
am *params)
> > > +                             size_t num_params, const struct tee_par=
am *params,
> > > +                             bool update_out)
> > >  {
> > >         int rc;
> > >         size_t n;
> > > @@ -238,21 +272,23 @@ static int optee_to_msg_param(struct optee *opt=
ee,
> > >
> > >                 switch (p->attr) {
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > +                       if (update_out)
> > > +                               break;
> > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
> > >                         memset(&mp->u, 0, sizeof(mp->u));
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > -                       optee_to_msg_param_value(mp, p);
> > > +                       optee_to_msg_param_value(mp, p, update_out);
> > >                         break;
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > >                         if (tee_shm_is_dynamic(p->u.memref.shm))
> > > -                               rc =3D to_msg_param_reg_mem(mp, p);
> > > +                               rc =3D to_msg_param_reg_mem(mp, p, up=
date_out);
> > >                         else
> > > -                               rc =3D to_msg_param_tmp_mem(mp, p);
> > > +                               rc =3D to_msg_param_tmp_mem(mp, p, up=
date_out);
> > >                         if (rc)
> > >                                 return rc;
> > >                         break;
> > > --
> > > 2.43.0
> > >
