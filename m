Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2A4CDFF8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 22:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC72113B8B;
	Fri,  4 Mar 2022 21:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8903F113B79;
 Fri,  4 Mar 2022 21:57:22 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id l45so4118952uad.1;
 Fri, 04 Mar 2022 13:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=kzw6QuVm+EBqAnL95ABBmHf9VAnd3ZR56Wc0DpU/Pas=;
 b=hs1s6xg+8GLsUsdVH6mHfvxJO4HtzBUpJxpirMSpc8rKZvMv7z1sZZrNqha63u7aRI
 PnOlVbw4S1b5X5hUjpT4DeOEXyQDVz0OtWzRWc/CtgsHyyXC10hHBMygO8/ExkJPCguV
 LSsHFLavgcQ0re40RsGY+9uGLW/Z2aTDIDnunxDtx8YGnaSqV1n08Ko5Gr67vojWvzVJ
 p1p7MLaDPwnU8eQ2iSaCHAtr0dyNg0ZT9Pn6QG1+NaoFiuKzxAOGkgLYh8aRoEWofimd
 Yf6GqEGWS3a7bHRh2CvWcz4OxXMoAkHOuxcAV6X183oWWkcc6+W+hffEos/DYlLzNHE/
 BJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=kzw6QuVm+EBqAnL95ABBmHf9VAnd3ZR56Wc0DpU/Pas=;
 b=m5eAMVlJsBBAoEgYQLmDoXMV5HUvcHmjeXjtQx5+nFJC7NTcRnVW16hBe/Z/T6T7eI
 A20MvoXEz0AHS2wR3CqVEmcTWjC/QUOcJJPB1lQ86GM6q9s9NfG6S80XxElpcpr+p0u7
 P/iYm0thXtxEA3JbcDdykNprbiGNom6WlhfWJPi4vUoA4NXDpVRReuCJIn3Yts2IImCS
 BqL5m3jOefmbOGicx8AclFXMpCsfCZi4I/7BDfwAa4ePzqEkUrGMWVKLYyiQ0gFQ3Vmw
 WiH1P87jvsIriaVtjA2y6deBN3YIhagyKWcdZfrpSSrRPueDbuVcxKttAAXplAbPu3Rg
 AgCA==
X-Gm-Message-State: AOAM533G9AdpRDGBq0htMEkPyM6sDR3/XRSoIl4C7bVSuB/pscrX1fwW
 MjAbQfCXU7kI136ngsk/Rivs/lMQG+tUQJdhI15kh2MA
X-Google-Smtp-Source: ABdhPJwN7hcq6zhnUlTGWNm4JNy3Izxjiyu9zetu1tfresupJUcvFkAfT+Eu3dhZLYopdQCwLALi7+jGpgCAyXAlHPY=
X-Received: by 2002:a9f:2c4b:0:b0:341:3619:215 with SMTP id
 s11-20020a9f2c4b000000b0034136190215mr258805uaj.75.1646431041372; Fri, 04 Mar
 2022 13:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
 <164616821973.8601.9122442025972091120@emeril.freedesktop.org>
In-Reply-To: <164616821973.8601.9122442025972091120@emeril.freedesktop.org>
From: jim.cromie@gmail.com
Date: Fri, 4 Mar 2022 14:56:55 -0700
Message-ID: <CAJfuBxy_guKp0w49Fxg79Mu6KkohOhvE9taTQK110wxwsA-c7A@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_use_dynamic=2Dde?=
 =?UTF-8?Q?bug_under_drm=2Edebug_api_=28rev2=29?=
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Mar 1, 2022 at 1:57 PM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> =3D=3D Series Details =3D=3D
>
> Series: use dynamic-debug under drm.debug api (rev2)
> URL   : https://patchwork.freedesktop.org/series/100289/
> State : warning
>
> =3D=3D Summary =3D=3D
>
> $ dim checkpatch origin/drm-tip
> c2ed9cc02d9c dyndbg: fix static_branch manipulation
> a8f6c71f283e dyndbg: add class_id field and query support
> -:141: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-e=
ffects?
> #141: FILE: include/linux/dynamic_debug.h:142:
> +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {  \
> +       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
> +       if (DYNAMIC_DEBUG_BRANCH(id))                           \
> +               func(&id, ##__VA_ARGS__);                       \
>  } while (0)
>
> -:151: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id' - possible side-e=
ffects?
> #151: FILE: include/linux/dynamic_debug.h:148:
> +#define __dynamic_func_call_no_desc_cls(id, cls, fmt, func, ...) do {  \
> +       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);                \
> +       if (DYNAMIC_DEBUG_BRANCH(id))                                   \
> +               func(__VA_ARGS__);                                      \
>  } while (0)
>

Can I get a pass on this ?

the usual approach doesnt work:
+       typeof(id) id =3D (id);           \

it appears to be due to the outer / wrapping macro inserting the
__UNIQUE_ID(ddebug)
which gets expanded 2x, giving:

      |         ^~~~~~~~
/home/jimc/projects/lx/linux.git/include/linux/compiler-gcc.h:42:45:
note: previous definition of =E2=80=98__UNIQUE_ID_ddebug437=E2=80=99 with t=
ype =E2=80=98int=E2=80=99
   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_,
prefix), __COUNTER__)
      |                                             ^~~~~~~~~~~~
/home/jimc/projects/lx/linux.git/include/linux/dynamic_debug.h:230:20:
note: in definition of macro =E2=80=98__dynamic_func_call_cls=E2=80=99
  230 |         typeof(id) id =3D (id);           \


Moreover, these 2 macros imitate existing macros,
which would suffer the same WARNING.

My macro-fu is insufficient,
can anyone suggest a clean way to fix this warning ?

tia
Jim
