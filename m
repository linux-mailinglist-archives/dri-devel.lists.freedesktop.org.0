Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF48671E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64FD10F03A;
	Mon, 26 Feb 2024 10:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xJ0fO5YK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF3510F03A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:49:54 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcc73148611so3027480276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708944593; x=1709549393; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6m7mLxb6EGB7+pibL2Lt1uVRcpXwzA1z72jxDuCA+g=;
 b=xJ0fO5YKsYfMsrTjPHdtRxR0zop64gi0EaB0z3V1HQmP6P5NKs1nrFAhZSZ/qywItA
 AIE+rHEWCLqiIhTHuU9OGW/JsKdTVJ0yMdMUD80C3EiO9m1ncnPfwbOKGj4/+1491l6c
 rPCy9q6dd4SfbdzxJN2jQvXHSP+H2EO89JtHjcph6kO2MdH4rtq/G5YFKZYHOS6FVDpi
 o1uLGTSI0KCN3rBdcc+cwAKtASLuyJtC4vImDDZSLXDZCs7qENIBK7M6QK06jLKxFADU
 YrUN/eR19C5j76oJY2dDZbIG+pWBd8ShAqvZtz5Bg/hmF4vvrqu4DdQpumT5iePiu2ob
 QkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708944593; x=1709549393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6m7mLxb6EGB7+pibL2Lt1uVRcpXwzA1z72jxDuCA+g=;
 b=g+UqR4pumv3BIQGjkkvn33Hitm9q2TKp7Bf3Wxgx5gk9uhNB6Gw8H9kHUwoxYfXRDY
 /wazrBQvgGOCxXVpXDtwh1U/jituGL3PoSeKro03TRkSBQjX3ZtKzOFXqmjD53cfHXwa
 m3IOeFve72zUd47lRH5ISp67bOsVznVtZypQjo2y5g5gZ1aloZzh7K23keiIafb/DIzR
 +VRPhBlHrfEjXhJO9Q9GvPjhB8Y00/4DEZaWMQX5XBBGDqDuTGukWKmksI0aj+fHbhXV
 3P4oOckgO/k3Yad/S0c+0254EKpSe3FGwWA+v1mifOYURtpxsl9edtNjAJ6/IPSkUj3A
 h4Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEZrDAAFGxbwGfHJZbeyK5pU7h0Q/Eq4ZFQsc0Qu9xVZsCY3LqzghTittZLcv/4w0LDF6fWUDpdEAKCp0nIiJuNCUGkFU+gu8xrZftdNta
X-Gm-Message-State: AOJu0Yz44/fzQT9khH9s6KMfxC0uymvl9Fa0VwcsQ0KLYmDB0RHluWai
 AuhO8FPlZ5d0OCNFcDFohGuzd3skrwNHOwjT5/kGlwxCWfmuqM7N9Y+KuKVi613qp6ipHHzRdpV
 LbFdZ6q2NdrqoL7F0OOSorjhJ4D3SNGJ5Tx1XZw==
X-Google-Smtp-Source: AGHT+IEH7MN2bT5ayIquRbnK+AzFjHN1amPatd61xUfPxQ5dOM6hX1JQ2XTgugFDNNK7tHBG9sw9Qo5tRbd05YV+6mg=
X-Received: by 2002:a25:eb01:0:b0:dcc:9f62:7520 with SMTP id
 d1-20020a25eb01000000b00dcc9f627520mr3858072ybs.59.1708944593332; Mon, 26 Feb
 2024 02:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <CAK7LNAQDhpAirfbb1zExH1auWkMPzncA9XpSrkv4odXOWZdQzA@mail.gmail.com>
In-Reply-To: <CAK7LNAQDhpAirfbb1zExH1auWkMPzncA9XpSrkv4odXOWZdQzA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 12:49:42 +0200
Message-ID: <CAA8EJpotuep1MDmNvNAYAC98peK9GFUVeUJ8G-GBwunSPrsUGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] drm/msm: add support for regenerating shipped
 xml.h headers
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, 26 Feb 2024 at 08:24, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Currently display-related register headers are generated from XML files
> > shipped withing Mesa source tree. This is not fully optimal: it require=
s
> > multi-stage process of the changes first being landed to Mesa and only
> > then synced to the kernel tree.
> >
> > Move original XML files to the kernel tree and generate header files if
> > required.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
>
> Linus Torvalds is negative about version-controlling
> shipped copies.
>
>
> https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbOAi8ok=
+7-CQUN=3DfQ@mail.gmail.com/
>
>
>
>
> We are decreasing *_shipped files.
>
>
> This patch set will increase them.
>
>
> [Before]
>
> ./arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped
> ./arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped
> ./fs/unicode/utf8data.c_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_reg_print.c_shipped
> ./drivers/scsi/aic7xxx/aic79xx_seq.h_shipped
> ./drivers/scsi/aic7xxx/aic79xx_reg.h_shipped
> ./drivers/scsi/aic7xxx/aic79xx_reg_print.c_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_reg.h_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_seq.h_shipped
> ./drivers/scsi/53c700_d.h_shipped
> ./drivers/net/wan/wanxlfw.inc_shipped
> ./drivers/tty/vt/defkeymap.c_shipped
>
>
> [After]
>
> ./arch/powerpc/platforms/cell/spufs/spu_save_dump.h_shipped
> ./arch/powerpc/platforms/cell/spufs/spu_restore_dump.h_shipped
> ./fs/unicode/utf8data.c_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_reg_print.c_shipped
> ./drivers/scsi/aic7xxx/aic79xx_seq.h_shipped
> ./drivers/scsi/aic7xxx/aic79xx_reg.h_shipped
> ./drivers/scsi/aic7xxx/aic79xx_reg_print.c_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_reg.h_shipped
> ./drivers/scsi/aic7xxx/aic7xxx_seq.h_shipped
> ./drivers/scsi/53c700_d.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
> ./drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
> ./drivers/net/wan/wanxlfw.inc_shipped
> ./drivers/tty/vt/defkeymap.c_shipped
>
>
>
> Of course, this is because those generated headers were
> version-controlled without _shipped, but now they
> have been renamed to *_shipped
>
>
>
> Since you are adding the original XML files,
> how about generating those headers all the time?

This will add dependency on libxml to any kernel that has
CONFIG_DRM_MSM enabled. We have a WIP python reimplementation, maybe
we should finish it first, it doesn't have external dependencies.

> For example see
> 7c0303ff7e67b637c47d8afee533ca9e2a02359b
>
>
>
> If you hide the tool behind DRM_MSM_GENERATE_HEADERS,
> nobody would notice the fact that
> drivers/gpu/drm/msm/headergen2/ is low quality code
> that sprinkle warnings.
>
>
> I cannot compile this patch set in the first place
> irrespective of DRM_MSM_GENERATE_HEADERS
> (presumably for a different reason) though.

Could you please specify how you tried to compile the code? I can see
warnings from headrgen2, but I'm really puzzled by the errors from the
MSM driver itself.

> drivers/gpu/drm/msm/headergen2/rnndec.c: In function =E2=80=98rnndec_deco=
deval=E2=80=99:
> drivers/gpu/drm/msm/headergen2/rnndec.c:187:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   187 |                                 asprintf (&res, "%s%s%s",
> ctx->colors->eval, ctmp, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/adreno/a5xx_preempt.c:5:10: fatal error:
> msm_gem.h: No such file or directory
>     5 | #include "msm_gem.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> drivers/gpu/drm/msm/headergen2/rnndec.c:216:57: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   216 |
> asprintf (&res, "%s%s%s", color, bitfields[i]->name,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:218:57: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   218 |
> asprintf (&tmp, "%s | %s%s%s", res, color, bitfields[i]->name,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:230:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   230 |                                         asprintf (&subval,
> "%s%#"PRIx64"%s", ctx->colors->err, field_val, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:235:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   235 |                                         asprintf (&res,
> "%s%s%s =3D %s", ctx->colors->rname, bitfields[i]->name,
> ctx->colors->reset, subval);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:237:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   237 |                                         asprintf (&tmp, "%s |
> %s%s%s =3D %s", res, ctx->colors->rname, bitfields[i]->name,
> ctx->colors->reset, subval);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:245:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   245 |                                         asprintf (&res,
> "%s%#"PRIx64"%s", ctx->colors->err, value & ~mask,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:247:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   247 |                                         asprintf (&tmp, "%s |
> %s%#"PRIx64"%s", res, ctx->colors->err, value & ~mask,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:253:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   253 |                                 asprintf (&res, "%s0%s",
> ctx->colors->num, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:254:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   254 |                         asprintf (&tmp, "{ %s }", res);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:260:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   260 |                         asprintf (&res, "%s%#"PRIx64"%s",
> ctx->colors->num, value, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:264:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   264 |                                 asprintf (&res, "%s-%lf%s",
> ctx->colors->num,
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   265 |
> ((double)((UINT64_C(1) << width) - value)) / ((double)(1 <<
> ti->radix)),
>       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   266 |                                                 ctx->colors->rese=
t);
>       |                                                 ~~~~~~~~~~~~~~~~~=
~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:271:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   271 |                         asprintf (&res, "%s%lf%s", ctx->colors->n=
um,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>   272 |                                         ((double)value) /
> ((double)(1LL << ti->radix)),
>       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   273 |                                         ctx->colors->reset);
>       |                                         ~~~~~~~~~~~~~~~~~~~
>   CC [M]  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.o
> drivers/gpu/drm/msm/headergen2/rnndec.c:276:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   276 |                         asprintf (&res, "%sr%"PRIu64".%c%s",
> ctx->colors->num, (value >> 2), "xyzw"[value & 0x3],
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:279:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   279 |                         asprintf (&res, "%s%"PRIu64"%s",
> ctx->colors->num, value, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:283:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   283 |                                 asprintf (&res,
> "%s-%"PRIi64"%s", ctx->colors->num, (UINT64_C(1) << width) - value,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:285:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   285 |                                 asprintf (&res,
> "%s%"PRIi64"%s", ctx->colors->num, value, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:289:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   289 |                                 asprintf (&res, "%sFALSE%s",
> ctx->colors->eval, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:291:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   291 |                                 asprintf (&res, "%sTRUE%s",
> ctx->colors->eval, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:298:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   298 |                                 asprintf(&res, "%s%f%s",
> ctx->colors->num,
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   299 |                                         val.d, ctx->colors->reset=
);
>       |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> drivers/gpu/drm/msm/headergen2/rnndec.c:301:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   301 |                                 asprintf(&res, "%s%f%s",
> ctx->colors->num,
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   302 |                                         val.f, ctx->colors->reset=
);
>       |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a5xx_preempt.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> drivers/gpu/drm/msm/headergen2/rnndec.c:304:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   304 |                                 asprintf(&res, "%s%f%s",
> ctx->colors->num,
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   305 |                                         float16(value),
> ctx->colors->reset);
>       |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:313:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   313 |                         asprintf (&res, "%s%#"PRIx64"%s",
> ctx->colors->num, value, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:317:17: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   317 |                 asprintf (&tmp, "%s | %s%#"PRIx64"%s", res,
> ctx->colors->err, value_orig & ~typeinfo_mask(ti),
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:5:10: fatal error: msm_gem.h: No
> such file or directory
>     5 | #include "msm_gem.h"
>       |          ^~~~~~~~~~~
>   CC [M]  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.o
> compilation terminated.
> drivers/gpu/drm/msm/headergen2/rnndec.c: In function =E2=80=98trymatch=E2=
=80=99:
> drivers/gpu/drm/msm/headergen2/rnndec.c:394:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   394 |                                 asprintf (&res->name,
> "%s%s%s", ctx->colors->rname, elems[i]->name, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:400:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   400 |                                         asprintf (&tmp,
> "%s+%s%#"PRIx64"%s", res->name, ctx->colors->err, offset,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:424:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   424 |                                         asprintf (&name,
> "%s%s%s", ctx->colors->rname, elems[i]->name, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:429:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   429 |                                         asprintf (&tmp,
> "%s.%s", name, res->name);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:439:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   439 |                                 asprintf (&name, "%s%s%s",
> ctx->colors->rname, elems[i]->name, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:445:41: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   445 |                                         asprintf (&tmp,
> "%s.%s", name, res->name);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c:452:33: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   452 |                                 asprintf (&tmp,
> "%s+%s%#"PRIx64"%s", name, ctx->colors->err, offset,
> ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c: In function =E2=80=98appendidx=
=E2=80=99:
> drivers/gpu/drm/msm/headergen2/rnndec.c:332:17: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   332 |                 asprintf (&res, "%s[%s%s%s]", name,
> ctx->colors->eval, index_name, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a6xx_gpu.o] Error 1
> drivers/gpu/drm/msm/headergen2/rnndec.c:334:17: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   334 |                 asprintf (&res, "%s[%s%#"PRIx64"%s]", name,
> ctx->colors->num, idx, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/rnndec.c: In function =E2=80=98rnndec_deco=
deaddr=E2=80=99:
> drivers/gpu/drm/msm/headergen2/rnndec.c:477:9: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   477 |         asprintf (&res->name, "%s%#"PRIx64"%s",
> ctx->colors->err, addr, ctx->colors->reset);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/headergen2.c: In function =E2=80=98printty=
peinfo=E2=80=99:
> drivers/gpu/drm/msm/headergen2/headergen2.c:159:25: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   159 |                         asprintf(&typename, "enum %s", ti->name);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/headergen2.c: In function =E2=80=98printde=
lem=E2=80=99:
> drivers/gpu/drm/msm/headergen2/headergen2.c:245:17: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   245 |                 asprintf(&offsetfn, "__offset_%s", elem->name);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/headergen2/headergen2.c:254:17: warning: ignoring
> return value of =E2=80=98asprintf=E2=80=99 declared with attribute
> =E2=80=98warn_unused_result=E2=80=99 [-Wunused-result]
>   254 |                 asprintf(&regname, "REG_%s", elem->fullname);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/msm/adreno/a4xx_gpu.h:7,
>                  from drivers/gpu/drm/msm/adreno/a4xx_gpu.c:4:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a4xx_gpu.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/adreno_device.o] Error 1
> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:12:10: fatal error: msm_gem.h:
> No such file or directory
>    12 | #include "msm_gem.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a5xx_gpu.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/a3xx_gpu.h:10,
>                  from drivers/gpu/drm/msm/adreno/a3xx_gpu.c:9:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a3xx_gpu.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/a6xx_hfi.c:10:
> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:12:10: fatal error: msm_drv.h:
> No such file or directory
>    12 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a6xx_hfi.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/a2xx_gpu.h:7,
>                  from drivers/gpu/drm/msm/adreno/a2xx_gpu.c:4:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> In file included from drivers/gpu/drm/msm/adreno/adreno_gpu.c:19:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a2xx_gpu.o] Error 1
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/adreno_gpu.o] Error 1
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:13=
,
>                  from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.=
c:8:
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:15:10: fatal error: msm_drv.h:
> No such file or directory
>    15 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:26:
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:15:10: fatal error: msm_drv.h:
> No such file or directory
>    15 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.o] Error 1
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/a5xx_gpu.h:7,
>                  from drivers/gpu/drm/msm/adreno/a5xx_power.c:6:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/adreno/a5xx_power.o] Error 1
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:15:
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:15:10: fatal error: msm_drv.h:
> No such file or directory
>    15 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.o] Error 1
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:21:10: fatal error:
> msm_drv.h: No such file or directory
>    21 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.o] Error 1
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h:13=
,
>                  from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.=
c:6:
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:15:10: fatal error: msm_drv.h:
> No such file or directory
>    15 | #include "msm_drv.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[6]: *** [scripts/Makefile.build:243:
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.o] Error 1
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu.h:8,
>                  from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:14:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:10: fatal error: msm_gpu.h:
> No such file or directory
>    15 | #include "msm_gpu.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
>
>
>
>
> > ---
> > Dmitry Baryshkov (12):
> >       kbuild: create destination directory for _shipped handling
> >       drm/msm/mdp5: add writeback block bases
> >       drm/msm/hdmi: drop qfprom.xml.h
> >       drm/msm/dsi: drop mmss_cc.xml.h
> >       drm/msm: use _shipped suffix for all xml.h files
> >       drm/msm/headergen: import source files from freedreno/envytools
> >       drm/msm/headergen: use asprintf instead of custom aprintf
> >       drm/msm/headergen: don't output full file paths
> >       drm/msm/headergen: generate _shipped files
> >       drm/msm: import XML registers database
> >       drm/msm: tie regeneration of shipped headers
> >       drm/msm: sync shipped headers database
> >
> >  drivers/gpu/drm/msm/Makefile                       |   80 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |   11 +
> >  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |  111 --
> >  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |  131 --
> >  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   70 -
> >  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   61 -
> >  drivers/gpu/drm/msm/headergen2/colors.c            |   61 +
> >  drivers/gpu/drm/msm/headergen2/colors.h            |   49 +
> >  drivers/gpu/drm/msm/headergen2/headergen2.c        |  514 ++++++++
> >  drivers/gpu/drm/msm/headergen2/path.c              |   64 +
> >  drivers/gpu/drm/msm/headergen2/rnn.c               | 1363 ++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/headergen2/rnn.h               |  243 ++++
> >  drivers/gpu/drm/msm/headergen2/rnndec.c            |  550 ++++++++
> >  drivers/gpu/drm/msm/headergen2/rnndec.h            |   59 +
> >  drivers/gpu/drm/msm/headergen2/util.h              |  113 ++
> >  drivers/gpu/drm/msm/headergen2/util/u_debug.h      |   12 +
> >  drivers/gpu/drm/msm/registers/.gitignore           |    5 +
> >  .../{dsi/dsi.xml.h =3D> registers/dsi.xml.h_shipped} |   38 +-
> >  .../dsi_phy_10nm.xml.h_shipped}                    |   37 +-
> >  .../dsi_phy_14nm.xml.h_shipped}                    |   37 +-
> >  .../dsi_phy_20nm.xml.h_shipped}                    |   37 +-
> >  .../dsi_phy_28nm.xml.h_shipped}                    |   37 +-
> >  .../dsi_phy_28nm_8960.xml.h_shipped}               |   37 +-
> >  .../dsi_phy_7nm.xml.h_shipped}                     |   37 +-
> >  .../hdmi.xml.h =3D> registers/hdmi.xml.h_shipped}    |  111 +-
> >  .../mdp4.xml.h =3D> registers/mdp4.xml.h_shipped}    |   37 +-
> >  .../mdp5.xml.h =3D> registers/mdp5.xml.h_shipped}    |   39 +-
> >  .../gpu/drm/msm/registers/mdp_common.xml.h_shipped |  114 ++
> >  drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped   |   67 +
> >  drivers/gpu/drm/msm/registers/xml/dsi.xml          |  390 ++++++
> >  drivers/gpu/drm/msm/registers/xml/dsi_phy_10nm.xml |  102 ++
> >  drivers/gpu/drm/msm/registers/xml/dsi_phy_14nm.xml |  135 ++
> >  drivers/gpu/drm/msm/registers/xml/dsi_phy_20nm.xml |  100 ++
> >  drivers/gpu/drm/msm/registers/xml/dsi_phy_28nm.xml |  180 +++
> >  .../drm/msm/registers/xml/dsi_phy_28nm_8960.xml    |  134 ++
> >  drivers/gpu/drm/msm/registers/xml/dsi_phy_7nm.xml  |  230 ++++
> >  drivers/gpu/drm/msm/registers/xml/edp.xml          |  239 ++++
> >  .../drm/msm/registers/xml/freedreno_copyright.xml  |   40 +
> >  drivers/gpu/drm/msm/registers/xml/hdmi.xml         | 1015 ++++++++++++=
+++
> >  drivers/gpu/drm/msm/registers/xml/mdp4.xml         |  480 +++++++
> >  drivers/gpu/drm/msm/registers/xml/mdp5.xml         |  806 ++++++++++++
> >  drivers/gpu/drm/msm/registers/xml/mdp_common.xml   |   89 ++
> >  drivers/gpu/drm/msm/registers/xml/mmss_cc.xml      |   48 +
> >  drivers/gpu/drm/msm/registers/xml/msm.xml          |   32 +
> >  drivers/gpu/drm/msm/registers/xml/rules-ng.xsd     |  457 +++++++
> >  drivers/gpu/drm/msm/registers/xml/sfpb.xml         |   17 +
> >  scripts/Makefile.lib                               |    2 +-
> >  47 files changed, 8034 insertions(+), 587 deletions(-)
> > ---
> > base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
> > change-id: 20240225-fd-xml-shipped-ba9a321cdedf
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--=20
With best wishes
Dmitry
