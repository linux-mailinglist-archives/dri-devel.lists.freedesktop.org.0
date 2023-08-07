Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59B772CC9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765B010E354;
	Mon,  7 Aug 2023 17:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184610E353;
 Mon,  7 Aug 2023 17:24:29 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-56c4c4e822eso3147791eaf.3; 
 Mon, 07 Aug 2023 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429069; x=1692033869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kk0YYbyx4I/Kc7B3FfXc0ayH25iR8p6gWIqgWH2jzaU=;
 b=IMFEz6z3YFbR7tfyTdeLiJC/61zlz3a64TqyyFz86IYDFtKhmMxx6zobDSrkEuDwwP
 Ij4S9CDbItFYO4w+G2+KVQmoaIFmzAMz169J6xJzn69hm98xDFKC87fgWAa3SVAG5pnP
 zr2qlxmdgdrvNShMFhCkaxb3FCuRYHMsc4LIt/Ep9VR9Ue+4XPQM7463VRoGpV0Yitk9
 v0z0/oZg5mTGRrbtVoyqBuSv9IVrIDdeeg2MOqUhLLnadkRGsWsI8R4AhchGxoYeQU/k
 eiC2iKuAU5sePRcP+QEGe1igBT6NM3JVQoGippB0sZiW4PVCSPz9ZsXOkGKpcErYMo7l
 svWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429069; x=1692033869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kk0YYbyx4I/Kc7B3FfXc0ayH25iR8p6gWIqgWH2jzaU=;
 b=D5XRX79FnDI+gU3zJAxumqZj4WT3QRat7fxqiMvvpkF05LQ6tTIKjS0WWFqdDbLrtJ
 AMI08jFC68ZSVayT+sHH/LK3J/fJpb07f1oVLTRgdzEZaXnnJdl9g5XnZ3AqDDON7NQ/
 KCo4WuGOsyTsuN7NAGlg8V9uR+MNGthOI4MVy1uxROmFE5HR5ZdXnePnpxi82qNa87OO
 6LHnX26xsueCyf8Z6dBKTM9kLzwMLe6/p7aC4cRo9I+oWNXcAy6Qxn1zpQFPsnnfNk3Y
 nHvqggiuojXOHR1VDLaWUcrsnjPhms+hdHjyYk2gM1/G5LzGwDxgBQ1FgKsoCh7qed0o
 M1vQ==
X-Gm-Message-State: AOJu0YxfN5/6OXqD5hJATkrNunBK2UQKiqayGdftD3cxZcWzadobFL7Z
 GxmcEsmdlDInanzW7rhj8DYHJok+5vSqEvGNnEI=
X-Google-Smtp-Source: AGHT+IHij9VSawOKKzWitWCyuAIbykzrq30l4F4sGTL1EkMxZFRlc8pSLkfzNh6bCO4VIzteBVAJ+l/hmFIN16heAKQ=
X-Received: by 2002:a4a:3803:0:b0:56d:2a98:a77b with SMTP id
 c3-20020a4a3803000000b0056d2a98a77bmr8612071ooa.3.1691429068958; Mon, 07 Aug
 2023 10:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230802070632.12626-1-sunran001@208suo.com>
In-Reply-To: <20230802070632.12626-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:24:18 -0400
Message-ID: <CADnq5_NqVzu4gxx9dM3ALQCi-SRfqG_BfrhcQqB3X=aj14aAGw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in mxgpu_nv.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:06=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: else should follow close brace '}'
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/=
amdgpu/mxgpu_nv.c
> index cae1aaa4ddb6..6a68ee946f1c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -183,12 +183,10 @@ static int xgpu_nv_send_access_requests(struct amdg=
pu_device *adev,
>                         if (req !=3D IDH_REQ_GPU_INIT_DATA) {
>                                 pr_err("Doesn't get msg:%d from pf, error=
=3D%d\n", event, r);
>                                 return r;
> -                       }
> -                       else /* host doesn't support REQ_GPU_INIT_DATA ha=
ndshake */
> +                       } else /* host doesn't support REQ_GPU_INIT_DATA =
handshake */
>                                 adev->virt.req_init_data_ver =3D 0;
>                 } else {
> -                       if (req =3D=3D IDH_REQ_GPU_INIT_DATA)
> -                       {
> +                       if (req =3D=3D IDH_REQ_GPU_INIT_DATA) {
>                                 adev->virt.req_init_data_ver =3D
>                                         RREG32_NO_KIQ(mmMAILBOX_MSGBUF_RC=
V_DW1);
>
> --
> 2.17.1
>
