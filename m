Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AD6BF2C5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5D110EF91;
	Fri, 17 Mar 2023 20:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A5010E421;
 Fri, 17 Mar 2023 20:38:16 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bg11so4720037oib.5;
 Fri, 17 Mar 2023 13:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SiRvHTQSgz2sGcSTSQDgv3aXyZNisuXYRa3sxKRv48Y=;
 b=noYwnuOKwWFBEAWH0wq1AdvXvo0lxwy+yu1fQsV7rQIPzMSyaxnzBDlyQxhC4v52Ct
 yXtAe5qHKmzlFVyMg2MvEFUZ/in5sNDuzVPjvobe2cQE62L/zUXtgdG9/5dE98golwAz
 Ed6z4X5fJrzBPJ92tZUmfPGZpMxFkxdUQn3yJLtTRhXkKIZI73bNql15Ard1aygScgz2
 hkyTxS5hYGkMVbyo34mOVMwqwZXxoQZn1uAlYtJA8C4RMswGdbBrsnvGqU2wuoxXbDhG
 oZuh9h0n4hPXDMqiJ6BIgFFltwVOeD84pfIPmMRcaNmpuio5cimIqvhzvcT6GeJgdDUp
 NBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SiRvHTQSgz2sGcSTSQDgv3aXyZNisuXYRa3sxKRv48Y=;
 b=qH3dnWepKykK8fbHL3u11svOxunsG4DkxwpHlEMi2+B4cIfIhTbHxdhwmrSLEnya+V
 MI6sGP75Rixk59H73fi/s+py8BoncQtEvVSs02nxgs8H6th2L3+zMK1OmK6X7u8uk5CX
 DqHBiXlAIPFGYgKsMiWoCqNcGTrsUENvZceB2y9RNudrY3QDgkv9XVxwmSX70CChpln/
 CCWGMIHPjzj2RZZ1EFG+7n4SKjvw5B7YnvtYcYGC5sIvdEgXW1K+Pbl+7hkTJ1MNCfNC
 vhqvcmV4kpBmQRS67nUK7C59Ve1eM47aT1ik3NwZcZSiwak4J+XwVgFgzptKzXWege7I
 Fuqg==
X-Gm-Message-State: AO0yUKVlUIyuMbVtB/1zkmjlelbXi85ZFPYKRhNro63MhHAVLK6LFvcr
 Ub0YvED+Ly8i0J9MOcD8qH5tNiBjiQe5q3VYWXQ=
X-Google-Smtp-Source: AK7set8f+RPp3l5ctUFTldzEQWJ2g1WSss80boStaRHFLdQ+ziQfn8ZgMwEGBd9VJfl8grT2a0sf3hJhAwAYLhNr0Zs=
X-Received: by 2002:a05:6808:6384:b0:386:9c6c:ebc with SMTP id
 ec4-20020a056808638400b003869c6c0ebcmr3725311oib.3.1679085495886; Fri, 17 Mar
 2023 13:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-30-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-30-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:38:04 -0400
Message-ID: <CADnq5_PR+VHHELVqbVYjOoJA-u_2V=kZmbyk2E0LJ==QOwPnbw@mail.gmail.com>
Subject: Re: [PATCH 29/37] drm/amd/display/dc/link/link_detection: Remove
 unused variable 'status'
To: Lee Jones <lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c: In funct=
ion =E2=80=98query_hdcp_capability=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:501:42: w=
arning: variable =E2=80=98status=E2=80=99 set but not used [-Wunused-but-se=
t-variable]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Wenjing Liu <wenjing.liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drive=
rs/gpu/drm/amd/display/dc/link/link_detection.c
> index 9177b146a80a8..9a4cfa777622e 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -498,8 +498,6 @@ static void query_hdcp_capability(enum signal_type si=
gnal, struct dc_link *link)
>         dc_process_hdcp_msg(signal, link, &msg22);
>
>         if (signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT || signal =3D=3D SIGNA=
L_TYPE_DISPLAY_PORT_MST) {
> -               enum hdcp_message_status status =3D HDCP_MESSAGE_UNSUPPOR=
TED;
> -
>                 msg14.data =3D &link->hdcp_caps.bcaps.raw;
>                 msg14.length =3D sizeof(link->hdcp_caps.bcaps.raw);
>                 msg14.msg_id =3D HDCP_MESSAGE_ID_READ_BCAPS;
> @@ -507,7 +505,7 @@ static void query_hdcp_capability(enum signal_type si=
gnal, struct dc_link *link)
>                 msg14.link =3D HDCP_LINK_PRIMARY;
>                 msg14.max_retries =3D 5;
>
> -               status =3D dc_process_hdcp_msg(signal, link, &msg14);
> +               dc_process_hdcp_msg(signal, link, &msg14);
>         }
>
>  }
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
