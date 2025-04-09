Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88467A81FBA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902F710E809;
	Wed,  9 Apr 2025 08:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FLGNOqam";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E984910E80A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:27:32 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2c7e5f7f0e3so1904224fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744187252; x=1744792052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
 b=FLGNOqamJIB3Kkg7w3LlcM1RndwVZz89D52BXiv/+230G3UVSSggfDJ5iMnlPSwdte
 RP/nJcbiQiArvPB6j+taFpMqcS8Au9EtLh1WTg9wsxX6QQlmSeugyRvP212zzAoqF7r5
 0iAAkbck2YRvkcMDwfIFt85eqo8mOnMQr+Y2XzAZHOYohO1zegVXJtvtBI/OLBX5HWy4
 87Hgp70xZU5xZj4qYVALxp7qAoVm9eqGpaJn69he8HFYpZzRqA8aDMqbhtkEggUXZujn
 XzI4ng971BZ6oAQFgQXodiCm9c2e+KiMc6mykrIGRE71ICDaBgY7w03YvgNUVXL5RXqx
 wQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744187252; x=1744792052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
 b=pSVisZ5q/G4drSX4+utZXTjk323Obwfyp6g5RFY4ws9TGF30TNqh3h92KBeytwlM07
 bi9wCzkdGEVQIJ7SrZBXJQutHR49usi4Jvghnn4CjeNcLMNw9mZmghLw1SompdKPhnGW
 9qc+y/+KAIzwNXvfeYr3cxofP9K68nq4PaKdcmIzWzqsGVHL7Y5wStseVR2amh55z2Tz
 /F2uXo7NuDmTInLqBOvXSLw5okOUP3di1Cm/TEyAyUGIwFLHz8wxYyPAJdGgQAJVoj4A
 Wl3mr/AeRnj6UG5uIds5t8caEUjKkK4yhBsHsAl9232RLgT6Y7djLjLCHdcQ3Fp/P3a/
 W96Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMIHJNXJGrxX5vGzWEg7QzX0taPRZVP0mHx+rHfVvvnnD5y2vhD5rjBKIHuJ1C/lGWSt+nwJs1Tg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdOQ9Mfx+jZFfOY5qvF7kghA3R10/W2m50jMyb+pun/PpFM5IG
 fXdG8qt7kKbvQEhr0mIXcKpdkDD4/fnO0WEd/eTu+cYBVoqYa9Yc3yyrlx0lRFXO4Gy6sv7ON8J
 cStr/h414neaZVaUR9/Sj1Zo8YYkPLhTA26ttyg==
X-Gm-Gg: ASbGncs2JrM6f5qugerrzQQj5k9jQA6Knurab7kJwGAExVo2aX3tlV8FWWMwBtZcVIE
 E3gqP5nDUuqL7I/K3D0sMLZVPBJIKt7CVlMyd6/K1qLailDqXVy3zW3mZdlmGhdXXp6c+mmYzPo
 BRRHQUhdCPY+IKwv2qpAkWMNw=
X-Google-Smtp-Source: AGHT+IEZeTFmVGTODWpd4xX+uFSSHfdEGipiWyYBCt8L1cARUIZAiR6ETmFp0kxz7VRwM4TyG8bHNU5bF8YWbLJbRHo=
X-Received: by 2002:a05:6870:7194:b0:2c6:72d3:fc93 with SMTP id
 586e51a60fabf-2d09176b3c9mr745417fac.12.1744187252078; Wed, 09 Apr 2025
 01:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
 <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
 <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
In-Reply-To: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 9 Apr 2025 10:27:20 +0200
X-Gm-Features: ATxdqUGMP5rCKKVvoNhq1SVNDfoVDLELnKd9DL_eKtgXdtc8jbz_99zAWdvG1vE
Message-ID: <CAHUa44G9NS-kyqEuuJrqijNttGANUJ_3W0uu+686fhA2C6pYDQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org
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

On Wed, Apr 9, 2025 at 9:20=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
>
>
> On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> > Hi Amirreza,
> >
> > On Wed, Apr 9, 2025 at 2:28=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Hi jens,
> >>
> >> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
> >>
> >> Hi Amirreza,
> >>
> >> On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
> >> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> For drivers that can transfer data to the TEE without using shared
> >> memory from client, it is necessary to receive the user address
> >> directly, bypassing any processing by the TEE subsystem. Introduce
> >> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> >> userspace buffers.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
> >>  include/linux/tee_drv.h  |  6 ++++++
> >>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
> >>  3 files changed, 55 insertions(+), 6 deletions(-)
> >>
> >> Is this patch needed now that the QCOMTEE driver supports shared
> >> memory? I prefer keeping changes to the ABI to a minimum.
> >>
> >> Cheers,
> >> Jens
> >>
> >> Unfortunately, this is still required. QTEE supports two types of data=
 transfer:
> >> (1) using UBUF and (2) memory objects. Even with memory object support=
, some APIs still
> >> expect to receive data using UBUF. For instance, to load a TA, QTEE of=
fers two interfaces:
> >> one where the TA binary is in UBUF and another where the TA binary is =
in a memory object.
> >
> > Is this a limitation in the QTEE backend driver or on the secure side?
> > Can it be fixed? I don't ask for changes in the ABI to the secure
> > world since I assume you haven't made such changes while this patch
> > set has evolved.
> >
> > Cheers,
> > Jens
>
> The secure-side ABI supports passing data using memcpy to the same
> buffer that contains the message for QTEE, rather than using a memory
> object. Some services tend to use this approach for small data instead
> of allocating a memory object. I have no choice but to expose this suppor=
t.

Got it, thanks! It's needed.

>
> Throughout the patchset, I have not made any change to the ABI but
> tried to provide support for the memory object in a separate,
> independent commit, distinct from the UBUF.

OK

Cheers,
Jens

>
> Best regards,
> Amir
>
> >
> >>
> >> Best Regards,
> >> Amir
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 22cc7d624b0c..bc862a11d437 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *c=
tx, struct tee_param *params,
> >>                         params[n].u.value.b =3D ip.b;
> >>                         params[n].u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       params[n].u.ubuf.uaddr =3D u64_to_user_ptr(ip.=
a);
> >> +                       params[n].u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param =
__user *uparams,
> >>                             put_user(p->u.value.c, &up->c))
> >>                                 return -EFAULT;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> >> +                               return -EFAULT;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         if (put_user((u64)p->u.memref.size, &up->b))
> >> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx=
,
> >>                         ip.b =3D p->u.value.b;
> >>                         ip.c =3D p->u.value.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       ip.a =3D (u64)p->u.ubuf.uaddr;
> >> +                       ip.b =3D p->u.ubuf.size;
> >> +                       ip.c =3D 0;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *par=
ams, size_t num_params,
> >>                         p->u.value.b =3D ip.b;
> >>                         p->u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       p->u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> >> +                       p->u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         /*
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index ce23fd42c5d4..d773f91c6bdd 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -82,6 +82,11 @@ struct tee_param_memref {
> >>         struct tee_shm *shm;
> >>  };
> >>
> >> +struct tee_param_ubuf {
> >> +       void * __user uaddr;
> >> +       size_t size;
> >> +};
> >> +
> >>  struct tee_param_value {
> >>         u64 a;
> >>         u64 b;
> >> @@ -92,6 +97,7 @@ struct tee_param {
> >>         u64 attr;
> >>         union {
> >>                 struct tee_param_memref memref;
> >> +               struct tee_param_ubuf ubuf;
> >>                 struct tee_param_value value;
> >>         } u;
> >>  };
> >> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> >> index d0430bee8292..3e9b1ec5dfde 100644
> >> --- a/include/uapi/linux/tee.h
> >> +++ b/include/uapi/linux/tee.h
> >> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and o=
utput */
> >>
> >> +/*
> >> + * These defines userspace buffer parameters.
> >> + */
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and o=
utput */
> >> +
> >>  /*
> >>   * Mask for the type part of the attribute, leaves room for more type=
s
> >>   */
> >> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
> >>  /**
> >>   * struct tee_ioctl_param - parameter
> >>   * @attr: attributes
> >> - * @a: if a memref, offset into the shared memory object, else a valu=
e parameter
> >> - * @b: if a memref, size of the buffer, else a value parameter
> >> + * @a: if a memref, offset into the shared memory object,
> >> + *     else if a ubuf, address of the user buffer,
> >> + *     else a value parameter
> >> + * @b: if a memref or ubuf, size of the buffer, else a value paramete=
r
> >>   * @c: if a memref, shared memory identifier, else a value parameter
> >>   *
> >> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is u=
sed in
> >> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> >> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE=
_NONE
> >> - * indicates that none of the members are used.
> >> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or val=
ue is
> >> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> >> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_=
TYPE_UBUF_*
> >> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of th=
e members
> >> + * are used.
> >>   *
> >>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
> >>   * identifier representing the shared memory object. A memref can ref=
erence
> >>
> >> --
> >> 2.34.1
> >>
>
