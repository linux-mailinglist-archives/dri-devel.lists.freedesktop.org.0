Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF56CB2A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C343910E7D8;
	Mon, 27 Mar 2023 23:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DAD10E7D8;
 Mon, 27 Mar 2023 23:48:17 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d22-20020a9d5e16000000b0069b5252ced7so5467878oti.13; 
 Mon, 27 Mar 2023 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679960897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uOJzLF5++wuNkGYdTRIM5Imo+cCIkOUu91mcxK3VoM=;
 b=BEXIiX+2N7jyn0zT6SrIbqb3pyq9kKoUg0pavRgLNSD2dNuJP0SnsvDojBtp9m4nga
 n7buh4tfRiFKpjX3AUMrJMlPdV5kTiTXG+WT1XYIDbls/IPVeZhYgyoa5h6iCSlSDFxo
 jenQcOfc/sHV1+0oTgeK6lHYkvyvmb30b0vlwXYOtBybKY+NluOMxPG9WAOYtzqAVy7W
 u1JM0nhEng/1nn1y1MyVcl1gqXBPCVkZQYJlqSdVzzMREJiWNdItKvmW/Ljw06fdzUH4
 vD1rgzKaRyDYElynqN41T1Bhebs9x8qUTJIfpiD1D9bW4VVIIzjmFuAxtar2qOoFHdhZ
 m62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6uOJzLF5++wuNkGYdTRIM5Imo+cCIkOUu91mcxK3VoM=;
 b=dPJbahOmAFMaagqXECFTlXFiAErjOjHgwcU/CjWY3ukk0c+B1PqudSe/sQmvI3/if2
 TmH8OE/BKdwZ965XVotpX3Mb8qOQQ2dillzdNB8LP2M+/SyHNe8FSHO6qm7/SbFE/r9/
 uJuN9D/mub01etrCjzaZxcoiqTiWQ3D/VBeltYdqWZH8CkxQ2TBIUB8f0V24ePD5ACWw
 o3SZFimC3y1K/KfnloaikMf719NdKLMXf0YvYSqOkT/6BcNAG1wdmjig02soztClOFSK
 4H6EyxhkKdo39NVM3rKRRWqYP6KDDBOJB9OpXyNAxjjiDLJGUcPkWPyjzxgi2W/Jo5dl
 N/7g==
X-Gm-Message-State: AO0yUKXfzkZ+M/FgpY4l+ZCgf7nMUF3yHDOsD6bF3lZ7G5aEqmyajoac
 Qagno+NaDaeIGtOkfZ+M9EbZoXIVk6yutt6NYNo=
X-Google-Smtp-Source: AKy350adTHg4TU7FBkltvQF9jydEMHuQrJG7Gz7uoTUxJXaHA05ZgeroITIoceYc0rQL7sJ/+wsdu/CJOHU3MzjOMMU=
X-Received: by 2002:a05:6830:1bed:b0:69f:882:cdb2 with SMTP id
 k13-20020a0568301bed00b0069f0882cdb2mr4519086otb.3.1679960897109; Mon, 27 Mar
 2023 16:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230327233353.64081-1-caionovais@usp.br>
 <20230327233353.64081-3-caionovais@usp.br>
In-Reply-To: <20230327233353.64081-3-caionovais@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Mar 2023 19:48:06 -0400
Message-ID: <CADnq5_MpPB-V2ZUr7AQDyczuSyJ4=sMCnRSdqEFG9sfBdn1eLQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] drm/amd: Remove unused variable 'value0'
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
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.c: In f=
unction =E2=80=98dcn10_link_encoder_update_mst_stream_allocation_table=E2=
=80=99:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.c:1222:=
18: warning: variable =E2=80=98value0=E2=80=99 set but not used [-Wunused-b=
ut-set-variable]
>
> Get rid of it by removing the variable.
>
> Signed-off-by: Caio Novais <caionovais@usp.br>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/=
drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> index c4287147b853..81aa1631945a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> @@ -1219,7 +1219,6 @@ void dcn10_link_encoder_update_mst_stream_allocatio=
n_table(
>         const struct link_mst_stream_allocation_table *table)
>  {
>         struct dcn10_link_encoder *enc10 =3D TO_DCN10_LINK_ENC(enc);
> -       uint32_t value0 =3D 0;
>         uint32_t value1 =3D 0;
>         uint32_t value2 =3D 0;
>         uint32_t slots =3D 0;
> @@ -1321,8 +1320,6 @@ void dcn10_link_encoder_update_mst_stream_allocatio=
n_table(
>         do {
>                 udelay(10);
>
> -               value0 =3D REG_READ(DP_MSE_SAT_UPDATE);

This reads a register.  Removing it may adversely affect the
programming sequence.  If you want to avoid the set but unused
warning, just drop the assignment, but leave the REG_READ.

Alex

> -
>                 REG_GET(DP_MSE_SAT_UPDATE,
>                                 DP_MSE_SAT_UPDATE, &value1);
>
> --
> 2.40.0
>
