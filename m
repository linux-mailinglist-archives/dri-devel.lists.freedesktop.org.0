Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ACA6CB2AA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ED010E7D1;
	Mon, 27 Mar 2023 23:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC68310E7D1;
 Mon, 27 Mar 2023 23:53:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id f17so7706588oiw.10;
 Mon, 27 Mar 2023 16:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679961228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEINlP1HTf0KiWQiW/MMP3STi+t5LIT7u9Uiqkj5UJc=;
 b=K2dxzzZsJDLZD3ld0NfxIEYLnm3YZT2Su7+tRCOuZnSZt3j5r6RFHXIy1P3ksfrLma
 oxL9uvMxqRbsLL098604bLhslDNARwyyii/RCDP2lbUAo5+/phe2w2zTSP0nNuha6XRa
 dVfbfGkNM5CL/bFJoxRcGGf3eoj5oPRsoWUIC95N9wVloK2an/UXxh7lqZX6fNIDUja6
 lC4+c1+vfT4reBg2GEDww8nbWIFjDT8CXSXKjeUOrgmxjv5gj/kW7LzQoiXkBFaKQ5WA
 an9tiQUDxD2YDKY3RMq65R6G/n0d2eYuJA+gHTWgvfx2v2/y1/Wtaz/4iXJY75cREBsy
 FPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679961228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEINlP1HTf0KiWQiW/MMP3STi+t5LIT7u9Uiqkj5UJc=;
 b=dQIBHSNom9FzszgSnA92w6PFc+Gm3eIkZNQaR630L/ywCaVE1yGY+M16ZNTmL2lTOk
 rOz8gYUn1sAaKeHhOglppi+DqRUnoHc2+Wl2jZsS44TI5oQTRgajWY4CNJ9d749h3NHk
 Txv2oh6lunuTbq0hd5rNa6k8mF00QaFyvGcVh9eyunZFHcbWamo8PSifHdirfDMdIr3M
 zKw88hfm1287tF5dxVEL/bC7K2FTjOwCBsucd4d8ORLkw1LyuzeN6Dyw64a5D5UWn4t+
 xE/21m50Tn7I9BuMQiU5iiUPzPKrhfHNkoX5bwryVNz774TxUugEBvjPFlr+ZwsjsDCC
 Eu2g==
X-Gm-Message-State: AO0yUKWPeuBDV9FbZQV1/yBLFuDpDSf82FFNgj8ndRX1yM4cMAxzumR+
 eondRPEjiBrUyZ8Jq8gCby1njk/SlbKN9oclCylRMPwTzW4=
X-Google-Smtp-Source: AK7set+cJLjB4dodyoIFBIGpuwJOmm7mzIuCepZJkUX6S9tscdI91Q4BhI0XnNzIOc/CJ51lIZrOaxuDtk6NQxBmoO8=
X-Received: by 2002:a05:6808:1981:b0:384:253:642d with SMTP id
 bj1-20020a056808198100b003840253642dmr3959709oib.3.1679961227991; Mon, 27 Mar
 2023 16:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230327233353.64081-1-caionovais@usp.br>
 <20230327233353.64081-13-caionovais@usp.br>
In-Reply-To: <20230327233353.64081-13-caionovais@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Mar 2023 19:53:36 -0400
Message-ID: <CADnq5_OG8pDyYruc4VCpd_eG8MxZUDf+nPr4zTy+u-7-a5L6uw@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/amd/display: Remove two unused variables
 'result_write_min_hblank' and 'hblank_size'
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

On Mon, Mar 27, 2023 at 7:36=E2=80=AFPM Caio Novais <caionovais@usp.br> wro=
te:
>
> Compiling AMD GPU drivers displays a warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabilit=
y.c: In function =E2=80=98dpcd_set_source_specific_data=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capabilit=
y.c:1290:32: warning: variable =E2=80=98result_write_min_hblank=E2=80=99 se=
t but not used [-Wunused-but-set-variable]
>
> Get rid of it by removing the variable 'result_write_min_hblank' and 'hbl=
ank_size'.
>
> Signed-off-by: Caio Novais <caionovais@usp.br>
> ---
>  .../drm/amd/display/dc/link/protocols/link_dp_capability.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index d4370856f164..7392fcf17653 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1287,7 +1287,6 @@ void dc_link_overwrite_extended_receiver_cap(
>  void dpcd_set_source_specific_data(struct dc_link *link)
>  {
>         if (!link->dc->vendor_signature.is_valid) {
> -               enum dc_status result_write_min_hblank =3D DC_NOT_SUPPORT=
ED;
>                 struct dpcd_amd_signature amd_signature =3D {0};
>                 struct dpcd_amd_device_id amd_device_id =3D {0};
>
> @@ -1324,16 +1323,10 @@ void dpcd_set_source_specific_data(struct dc_link=
 *link)
>                 if (link->ctx->dce_version >=3D DCN_VERSION_2_0 &&
>                         link->dc->caps.min_horizontal_blanking_period !=
=3D 0) {
>
> -                       uint8_t hblank_size =3D (uint8_t)link->dc->caps.m=
in_horizontal_blanking_period;
> -
> -                       result_write_min_hblank =3D core_link_write_dpcd(=
link,
> -                               DP_SOURCE_MINIMUM_HBLANK_SUPPORTED, (uint=
8_t *)(&hblank_size),
> -                               sizeof(hblank_size));

This writes to the monitor.  We shouldn't remove this.

>                 }
>                 DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_INFORMATION,
>                                                         WPP_BIT_FLAG_DC_D=
ETECTION_DP_CAPS,
>                                                         "result=3D%u link=
_index=3D%u enum dce_version=3D%d DPCD=3D0x%04X min_hblank=3D%u branch_dev_=
id=3D0x%x branch_dev_name=3D'%c%c%c%c%c%c'",
> -                                                       result_write_min_=
hblank,

You are dropping information from the debug logging.  Maybe it would
be better to just flag this as maybe unused.  Also, I'd suggest
rebasing on the latest amdgpu -next branch, as I think a lot of these
were already fixed last week or the week before.

Alex

>                                                         link->link_index,
>                                                         link->ctx->dce_ve=
rsion,
>                                                         DP_SOURCE_MINIMUM=
_HBLANK_SUPPORTED,
> --
> 2.40.0
>
