Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B511E6CB29C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BD210E41C;
	Mon, 27 Mar 2023 23:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F0C10E41C;
 Mon, 27 Mar 2023 23:46:37 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17aaa51a911so11063518fac.5; 
 Mon, 27 Mar 2023 16:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679960797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HHSCdFOMcHm/qTnYSefeJOCZD07oxZlsWhVPH8z90I=;
 b=XkhgxyTZd9kUR7Mla+hglqBL+D9/RgpyDpo01akjHC4VAuLumOJrjNLjak/QXPcNrc
 oRYEgpTBzmdQzsXmFXudNZDRN9xrMJ7ZUVOEt3QpMP1FF1owquMp/AEIobLlDc/dM8k1
 2YWN/qLuTmP4VZMnIcAbRydw5hR6BxqRGi+009qYQTkX9Y59f4DfxlSWD4rng7LpLXhD
 lbF/ujVpRDWHyIrh8a8IoNHZxzuflZmFVejEjezfku+2NDz8HvcrkYHXuPgvYaqE5B1N
 f/ctHuRye3Y3ZVa9sdtg+pMuAHkV+HlyGGOIH6H91wlrnVahQEYrXOD1wO4WgefG4zNy
 uSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HHSCdFOMcHm/qTnYSefeJOCZD07oxZlsWhVPH8z90I=;
 b=Dh2OKqQmaNR1RUOpWafu6FRu19sAWLD785kCp1jY+UTAo3+taUcPymYrYvUaf8JZZ8
 Sr48AacdfU0CaXFJ43g33jGV509F0yvMDW4JTWvdSuys9LVtrhjuqFbY22DEQqpPW5ne
 63eWm5QWwRlWltEU8zduTpIrrfaaWbS8KpYHk8vt+7GVcfihz8DO0O8A8SYbwNwS548H
 C+7xQjPHrMsd/TO8S6aSj0puXblp6b+1kA3aelUisctrpwo6Zq1I61U3mws675dRKD1w
 nubnFIQFFd/GxFDI30t0NLKm98wPu5ED4ULTZiPj3RKcj5U+BGcNEphnSj4vqsf+LmeP
 3pew==
X-Gm-Message-State: AAQBX9eys8kYqveFYIsvKGeXHvBz3erO0ob+fcRwHE1d+9CnEnSZBjHG
 QhR0vk+nRstuMeU1yTfv4flxLXwBbdyz3a8LztQ=
X-Google-Smtp-Source: AKy350ajECs9vlAxp9Zc/RgZFmI0my5+POzp/1L6Jpd0DTDvqtD1z4/8o71AriXo3dXx3BrhelIhPxq8nhB7VZYcmwo=
X-Received: by 2002:a05:6870:7f84:b0:177:b05f:c5f with SMTP id
 aw4-20020a0568707f8400b00177b05f0c5fmr2712997oac.3.1679960796796; Mon, 27 Mar
 2023 16:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230327233353.64081-1-caionovais@usp.br>
 <20230327233353.64081-2-caionovais@usp.br>
In-Reply-To: <20230327233353.64081-2-caionovais@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Mar 2023 19:46:25 -0400
Message-ID: <CADnq5_M6LEBPVfAXPcVyR-C2qKYrTk=Nyb1cOjGz_Zo6LX9rxA@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/amd: Remove unused variable 'r'
To: Caio Novais <caionovais@usp.br>
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
Cc: Felipe Clark <felipe.clark@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Roman Li <Roman.Li@amd.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 George Shen <George.Shen@amd.com>, Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Alan Liu <HaoPing.Liu@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Jingwen Zhu <Jingwen.Zhu@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Leo Li <sunpeng.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Le Ma <le.ma@amd.com>,
 Martin Leung <Martin.Leung@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Brian Chang <Brian.Chang@amd.com>, Sung Joon Kim <sungjoon.kim@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, linux-kernel@vger.kernel.org,
 Gabe Teeger <gabe.teeger@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ethan Wellenreiter <Ethan.Wellenreiter@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Joshua Ashton <joshua@froggi.es>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 7:34=E2=80=AFPM Caio Novais <caionovais@usp.br> wro=
te:
>
> Compiling AMD GPU drivers displays a warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function =E2=80=98amdgpu_mes_=
ctx_alloc_meta_data=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable =E2=80=
=98r=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Get rid of it by removing the variable.
>
> Signed-off-by: Caio Novais <caionovais@usp.br>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.c
> index 82e27bd4f038..e0130536f778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1096,14 +1096,6 @@ uint32_t amdgpu_mes_get_aggregated_doorbell_index(=
struct amdgpu_device *adev,
>  int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
>                                    struct amdgpu_mes_ctx_data *ctx_data)
>  {
> -       int r;
> -
> -       r =3D amdgpu_bo_create_kernel(adev,
> -                           sizeof(struct amdgpu_mes_ctx_meta_data),
> -                           PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> -                           &ctx_data->meta_data_obj,
> -                           &ctx_data->meta_data_mc_addr,
> -                           &ctx_data->meta_data_ptr);

You can't just remove the buffer allocation here.  If you want to fix
this then do something like
if (r)
    return r;

Alex

>         if (!ctx_data->meta_data_obj)
>                 return -ENOMEM;
>
> --
> 2.40.0
>
