Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191DA6EBF3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5E10E0BF;
	Tue, 25 Mar 2025 08:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bae3CfkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338A010E128
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:50:53 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2a01bcd0143so7098806fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742892647; x=1743497447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
 b=Bae3CfkHo0LeCT0CGLyMNupiranA4wbi/A9RKuc2TJSFUGZEsZncW96iSQ31a8e+E9
 HHbVxUnBctgBwm05gV07TBLF4np/a76X3hSjXri5PTN5YX5Kmtb1jFrDNioLnNWsFwlO
 v6WfHkJsM3ZAnn1L1BeM51nYMl8oGgXYH8ABoOdtydEs329/N0K0+lV1xK4Uqkd8ISaS
 J61ob1wATCuMrUY3czYo4qj8J8jBQ2ygmsJFCQ0PKTjOaaNeBNdbyUGRc3gLfIy9xeco
 YRxd1Hubzd6Idk9R4mod+MDZPyPs8HpOcLWY8RVfPHer1RwZ3ZqMMXhNQhzFRUpAi48r
 hSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742892647; x=1743497447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5eOMTRp7OLNI3VGicdgRH0lRnyRYz67Gt/EAnTu6nbQ=;
 b=IcGOCV3+3VHmTX5rnY29thrVLTzf4XrE/eJt8ebbBm5s+41HaKpo4bzqTJO+gexSEz
 NJ/IZvDziHq1uo4aI+xC4OOiUF2WQR/qYeNw+RyREhkt7DNTLyUkHYVpANMRnRIoBrao
 +5ziY8cjkZbA8uHn9vw+TXRbT833L6s5gHJnuH75tMo9e5zGvareKlRWkeFNU6KDFIC/
 NJ+JwKnh0+cFsd+xyxIXhe8qOjDy8WlxaZEgiqF0Oh9IgLmC/IxRwn42PGfVHGi3ZGBb
 Yvan5jbqk/oYBr34h5lLbAA6PzOIbLjQ/D8dglSN5RwTxH3zU4uuzJWVSSmeu7mGYC6u
 btZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUciFoHhfnSTxB6vu3M3z8aPa5Dhy/uFRz9MDj5cwN0d1dubxz15v65Z3q+UXztYz0G2itmRe5VWdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnPU6j2oYK252dW1faHj6c17HE9DFeyb377g3VZ9GVickpdpuI
 WRczZw7BDVvPW7P0Gpgt8D++t8MyOl5GJ0oE9KLsd9/4Syux9MoY0q3HgmYtZRcDr7H0oOeQacA
 81TvaocYBOhcl/Mi5MB783+vfSAuQKzYCC7cntPuU+hXrZzlnK5Y=
X-Gm-Gg: ASbGncsvyEuRN8BYeBzhB5hZ094liUQoQpurWaKVkqB26+8KMF6r2/sYmNECpMi/hLe
 F/W1AbK83mRuB/l6lErWDpxn3K7M+B+uzU8oM935jbz2ZV2nd7DO9SMHIa7VPlYcz5G6CenEs1Q
 ggH47MBi5jNQ0R/+4OcC4oySQcZ8M=
X-Google-Smtp-Source: AGHT+IE1lc0Le+Xn4IPuxfRnWH1Z92SoqlO8A5APVOUx7ahbqOTcRxJtSaNA/0G1hYCe0KPtkwaeflutY9Bv2ysJ0iU=
X-Received: by 2002:a05:6871:c714:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2c78054a998mr9647125fac.39.1742892647207; Tue, 25 Mar 2025
 01:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-4-jens.wiklander@linaro.org>
 <Z9K2RQYuXSJc8Y1E@sumit-X1>
 <CAHUa44H5Zc_POJ_RWaVd4iFVagRkFaN+8Ajs=19FKboZapbQHw@mail.gmail.com>
 <Z9vfD4UWSrqSTPnP@sumit-X1>
 <CAHUa44HY-jZCoDXKnx-f4gBoABRVdh1+6PA1AYHSva9aL=rDAA@mail.gmail.com>
 <Z-JFagmbZBQd0hoM@sumit-X1>
In-Reply-To: <Z-JFagmbZBQd0hoM@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 09:50:35 +0100
X-Gm-Features: AQ5f1JqCL9i7_V-pA06IP3-j62y0ZfeHI3kPwPORgKYNirOFYekFlp01JSrl9PM
Message-ID: <CAHUa44HXHwR1_LbjG6T5OqnafXiS4-kHeKjV9TurGORx3SsprQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] optee: account for direction while converting
 parameters
To: Sumit Garg <sumit.garg@kernel.org>
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
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

On Tue, Mar 25, 2025 at 6:56=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Mar 20, 2025 at 02:00:57PM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
> > On Thu, Mar 20, 2025 at 10:25=E2=80=AFAM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > Hi Jens,
> > >
> > > On Mon, Mar 17, 2025 at 08:42:01AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > > > On Thu, Mar 13, 2025 at 11:41=E2=80=AFAM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > Hi Jens,
> > > > >
> > > > > On Wed, Mar 05, 2025 at 02:04:09PM +0100, Jens Wiklander wrote:
> > > > > > The OP-TEE backend driver has two internal function pointers to=
 convert
> > > > > > between the subsystem type struct tee_param and the OP-TEE type=
 struct
> > > > > > optee_msg_param.
> > > > > >
> > > > > > The conversion is done from one of the types to the other, whic=
h is then
> > > > > > involved in some operation and finally converted back to the or=
iginal
> > > > > > type. When converting to prepare the parameters for the operati=
on, all
> > > > > > fields must be taken into account, but then converting back, it=
's enough
> > > > > > to update only out-values and out-sizes. So, an update_out para=
meter is
> > > > > > added to the conversion functions to tell if all or only some f=
ields
> > > > > > must be copied.
> > > > > >
> > > > > > This is needed in a later patch where it might get confusing wh=
en
> > > > > > converting back in from_msg_param() callback since an allocated
> > > > > > restricted SHM can be using the sec_world_id of the used restri=
cted
> > > > > > memory pool and that doesn't translate back well.
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/optee/call.c          | 10 ++--
> > > > > >  drivers/tee/optee/ffa_abi.c       | 43 +++++++++++++----
> > > > > >  drivers/tee/optee/optee_private.h | 42 +++++++++++------
> > > > > >  drivers/tee/optee/rpc.c           | 31 +++++++++----
> > > > > >  drivers/tee/optee/smc_abi.c       | 76 +++++++++++++++++++++++=
--------
> > > > > >  5 files changed, 144 insertions(+), 58 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.=
c
> > > > > > index 16eb953e14bb..f1533b894726 100644
> > > > > > --- a/drivers/tee/optee/call.c
> > > > > > +++ b/drivers/tee/optee/call.c
> > > > > > @@ -400,7 +400,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       export_uuid(msg_arg->params[1].u.octets, &client_uuid);
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params + =
2,
> > > > > > -                                   arg->num_params, param);
> > > > > > +                                   arg->num_params, param,
> > > > > > +                                   false /*!update_out*/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -427,7 +428,8 @@ int optee_open_session(struct tee_context *=
ctx,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params + 2)) {
> > > > > > +                                    msg_arg->params + 2,
> > > > > > +                                    true /*update_out*/)) {
> > > > > >               arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >               /* Close session again to avoid leakage */
> > > > > > @@ -541,7 +543,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       msg_arg->cancel_id =3D arg->cancel_id;
> > > > > >
> > > > > >       rc =3D optee->ops->to_msg_param(optee, msg_arg->params, a=
rg->num_params,
> > > > > > -                                   param);
> > > > > > +                                   param, false /*!update_out*=
/);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > >
> > > > > > @@ -551,7 +553,7 @@ int optee_invoke_func(struct tee_context *c=
tx, struct tee_ioctl_invoke_arg *arg,
> > > > > >       }
> > > > > >
> > > > > >       if (optee->ops->from_msg_param(optee, param, arg->num_par=
ams,
> > > > > > -                                    msg_arg->params)) {
> > > > > > +                                    msg_arg->params, true /*up=
date_out*/)) {
> > > > > >               msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
> > > > > >               msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
> > > > > >       }
> > > > > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ff=
a_abi.c
> > > > > > index 4ca1d5161b82..e4b08cd195f3 100644
> > > > > > --- a/drivers/tee/optee/ffa_abi.c
> > > > > > +++ b/drivers/tee/optee/ffa_abi.c
> > > > > > @@ -122,15 +122,21 @@ static int optee_shm_rem_ffa_handle(struc=
t optee *optee, u64 global_id)
> > > > > >   */
> > > > > >
> > > > > >  static void from_msg_param_ffa_mem(struct optee *optee, struct=
 tee_param *p,
> > > > > > -                                u32 attr, const struct optee_m=
sg_param *mp)
> > > > > > +                                u32 attr, const struct optee_m=
sg_param *mp,
> > > > > > +                                bool update_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D NULL;
> > > > > >       u64 offs_high =3D 0;
> > > > > >       u64 offs_low =3D 0;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (attr =3D=3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT)
> > > > > > +                     return;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
> > > > > >                 attr - OPTEE_MSG_ATTR_TYPE_FMEM_INPUT;
> > > > > > -     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >
> > > > > >       if (mp->u.fmem.global_id !=3D OPTEE_MSG_FMEM_INVALID_GLOB=
AL_ID)
> > > > > >               shm =3D optee_shm_from_ffa_handle(optee, mp->u.fm=
em.global_id);
> > > > > > @@ -141,6 +147,8 @@ static void from_msg_param_ffa_mem(struct o=
ptee *optee, struct tee_param *p,
> > > > > >               offs_high =3D mp->u.fmem.offs_high;
> > > > > >       }
> > > > > >       p->u.memref.shm_offs =3D offs_low | offs_high << 32;
> > > > > > +out:
> > > > > > +     p->u.memref.size =3D mp->u.fmem.size;
> > > > > >  }
> > > > > >
> > > > > >  /**
> > > > > > @@ -150,12 +158,14 @@ static void from_msg_param_ffa_mem(struct=
 optee *optee, struct tee_param *p,
> > > > > >   * @params:  subsystem internal parameter representation
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > > + * @update_out: update parameter for output only
> > > > > >   *
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_from_msg_param(struct optee *optee,
> > > > > >                                   struct tee_param *params, siz=
e_t num_params,
> > > > > > -                                 const struct optee_msg_param =
*msg_params)
> > > > > > +                                 const struct optee_msg_param =
*msg_params,
> > > > > > +                                 bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -166,18 +176,20 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >
> > > > > >               switch (attr) {
> > > > > >               case OPTEE_MSG_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NON=
E;
> > > > > >                       memset(&p->u, 0, sizeof(p->u));
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_from_msg_param_value(p, attr, mp);
> > > > > > +                     optee_from_msg_param_value(p, attr, mp, u=
pdate_out);
> > > > > >                       break;
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
> > > > > >               case OPTEE_MSG_ATTR_TYPE_FMEM_INOUT:
> > > > > > -                     from_msg_param_ffa_mem(optee, p, attr, mp=
);
> > > > > > +                     from_msg_param_ffa_mem(optee, p, attr, mp=
, update_out);
> > > > > >                       break;
> > > > > >               default:
> > > > > >                       return -EINVAL;
> > > > > > @@ -188,10 +200,16 @@ static int optee_ffa_from_msg_param(struc=
t optee *optee,
> > > > > >  }
> > > > > >
> > > > > >  static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> > > > > > -                             const struct tee_param *p)
> > > > > > +                             const struct tee_param *p, bool u=
pdate_out)
> > > > > >  {
> > > > > >       struct tee_shm *shm =3D p->u.memref.shm;
> > > > > >
> > > > > > +     if (update_out) {
> > > > > > +             if (p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMR=
EF_INPUT)
> > > > > > +                     return 0;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       mp->attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_INPUT + p->attr -
> > > > > >                  TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> > > > > >
> > > > > > @@ -211,6 +229,7 @@ static int to_msg_param_ffa_mem(struct opte=
e_msg_param *mp,
> > > > > >               memset(&mp->u, 0, sizeof(mp->u));
> > > > > >               mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_G=
LOBAL_ID;
> > > > > >       }
> > > > > > +out:
> > > > > >       mp->u.fmem.size =3D p->u.memref.size;
> > > > > >
> > > > > >       return 0;
> > > > > > @@ -222,13 +241,15 @@ static int to_msg_param_ffa_mem(struct op=
tee_msg_param *mp,
> > > > > >   * @optee:   main service struct
> > > > > >   * @msg_params:      OPTEE_MSG parameters
> > > > > >   * @num_params:      number of elements in the parameter array=
s
> > > > > > - * @params:  subsystem itnernal parameter representation
> > > > > > + * @params:  subsystem internal parameter representation
> > > > > > + * @update_out: update parameter for output only
> > > > > >   * Returns 0 on success or <0 on failure
> > > > > >   */
> > > > > >  static int optee_ffa_to_msg_param(struct optee *optee,
> > > > > >                                 struct optee_msg_param *msg_par=
ams,
> > > > > >                                 size_t num_params,
> > > > > > -                               const struct tee_param *params)
> > > > > > +                               const struct tee_param *params,
> > > > > > +                               bool update_out)
> > > > > >  {
> > > > > >       size_t n;
> > > > > >
> > > > > > @@ -238,18 +259,20 @@ static int optee_ffa_to_msg_param(struct =
optee *optee,
> > > > > >
> > > > > >               switch (p->attr) {
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > > > +                     if (update_out)
> > > > > > +                             break;
> > > > > >                       mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > > >                       memset(&mp->u, 0, sizeof(mp->u));
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > > > -                     optee_to_msg_param_value(mp, p);
> > > > > > +                     optee_to_msg_param_value(mp, p, update_ou=
t);
> > > > > >                       break;
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > > >               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > > > -                     if (to_msg_param_ffa_mem(mp, p))
> > > > > > +                     if (to_msg_param_ffa_mem(mp, p, update_ou=
t))
> > > > > >                               return -EINVAL;
> > > > > >                       break;
> > > > > >               default:
> > > > >
> > > > > Can we rather handle it as follows to improve code readability an=
d
> > > > > maintainence long term? Ditto for all other places.
> > > > >
> > > > > static int optee_ffa_to_msg_param(struct optee *optee,
> > > > >                                   struct optee_msg_param *msg_par=
ams,
> > > > >                                   size_t num_params,
> > > > >                                   const struct tee_param *params,
> > > > >                                   bool update_out)
> > > > > {
> > > > >         size_t n;
> > > > >
> > > > >         for (n =3D 0; n < num_params; n++) {
> > > > >                 const struct tee_param *p =3D params + n;
> > > > >                 struct optee_msg_param *mp =3D msg_params + n;
> > > > >
> > > > >                 if (update_out && (p->attr =3D=3D TEE_IOCTL_PARAM=
_ATTR_TYPE_NONE ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_VAL=
UE_INPUT ||
> > > > >                      p->attr =3D=3D TEE_IOCTL_PARAM_ATTR_TYPE_MEM=
REF_INPUT))
> > > > >                     continue;
> > > >
> > > > You're missing updating the length field for memrefs.
> > > >
> > >
> > > Do we need to update length field for input memrefs when update_out i=
s
> > > set? I don't see that happening in your existing patch too.
> >
> > I'm sorry, I was unclear. The update_out parameter means only the
> > output fields should be updated, not the attribute, offsets, ids, etc.
> > That is, the length field for memrefs, and the value fields a, b, c
> > for value params. Some of the memrefs aren't translated one-to-one
> > with SDP, but the length field can and must be updated.
>
> Isn't it rather better to add another attribute type to handled SDP
> special handling?

This isn't special handling, all parameters get the same treatment.
When updating a parameter after it has been used, this is all that
needs to be done, regardless of whether it's an SDP buffer. The
updates we did before this patch were redundant.

This patch was introduced in the v3 of this patch set, but I don't
think it's strictly needed any longer since SDP buffers are allocated
differently now. I think it's nice to only update what's needed when
translating back a parameter (just as in params_to_user() in
drivers/tee/tee_core.c), but if you don't like it, we can drop this
patch.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
> >
> > >
> > > -Sumit
> > >
> > > > Cheers,
> > > > Jens
> > > >
> > > > >
> > > > >                 switch (p->attr) {
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
> > > > >                         mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NO=
NE;
> > > > >                         memset(&mp->u, 0, sizeof(mp->u));
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
> > > > >                         optee_to_msg_param_value(mp, p);
> > > > >                         break;
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> > > > >                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> > > > >                         if (to_msg_param_ffa_mem(mp, p))
> > > > >                                 return -EINVAL;
> > > > >                         break;
> > > > >                 default:
> > > > >                         return -EINVAL;
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         return 0;
> > > > > }
> > > > >
> > > > > -Sumit
