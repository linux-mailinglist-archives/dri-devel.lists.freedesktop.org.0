Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F226BF2A1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FE10E3FB;
	Fri, 17 Mar 2023 20:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD77510E3FB;
 Fri, 17 Mar 2023 20:33:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so3513833otm.11; 
 Fri, 17 Mar 2023 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679085223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wke3FPs7Ksv6rdzTGLQOkGDYUGmajxnF7vbyk/QEY5M=;
 b=d2K5saJxtag/+i3+VeoPKXiNDCahExg8ilgXIYP14klahMootWNVks/mtmw/SAt9we
 dM2fd88rxNN55ZVnAfU+nYcFq3NYemlyDsgC/T3CiC765J026M/3Ulbl+8aLZCN5c2yo
 bcgl1ylGyBLUJhq0o3bu7QjKdmjlFbmUIVS7CU9AQo0UInUuGAMKL7dBw9RmQfFcoOpy
 nZ155XRJw9gsaCQoyodEMg/BGSVN067wTsOYxm/8jFtaSIA9T+8jq249qJhhjfNQ2UCq
 749nWIIh4uNdG1he5P8ZgeM8H+KtN5QEv/LLeWE1h5NVpL1yEcFsu1yxd0xcQlhVdWWi
 ikSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679085223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wke3FPs7Ksv6rdzTGLQOkGDYUGmajxnF7vbyk/QEY5M=;
 b=jdELbFik2kfH3fR/WprELBEItFMFbrMrA8ILgriG45Xi2hlQf5FQVO6kYnivNfve3x
 ciyv5kRzmGxICe5CV7XMDNM9VvkMne+ttVAGPLSfc/cvtXUs4BI7WllKMnx6XDkdCmDq
 Y8mHK97RR19CaYKZTYSfbYs5o2yJF8sEQhZvCYNlUWFy4D+k6PNU+/JMRwVuelcWGUHp
 Fh8YFyQj4N9R7tWWmHnBwSX3ddb4+nqH/jgCouvLq1SYF/GT4UoK1VSuSJ4CeuHUqlJC
 Pnmbvsl7Ml17DZJGqb0qcX7RZityR2TNlBOkiXad9v2UwEYZOn0BI0gH875+xlpgSt+J
 abkw==
X-Gm-Message-State: AO0yUKURqDwbN6qgZlDTbNnuemXpr1+gtZF432Tob1b6BpvfMXLqydp5
 Z/llcs1CHgl/fcc1Zl8yaSJu5Y5kq6nqrKaA0kY=
X-Google-Smtp-Source: AK7set/YuBkzP6WyMGzlC9nZEPEbnnDJ9dqg2061edUzcDXG7f3D3edvz316vDzNRmw/On8Ilp4z5tSaeQqfvaVv+ag=
X-Received: by 2002:a9d:5d04:0:b0:69f:882:cdb2 with SMTP id
 b4-20020a9d5d04000000b0069f0882cdb2mr6297oti.3.1679085223009; Fri, 17 Mar
 2023 13:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-28-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-28-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:33:31 -0400
Message-ID: <CADnq5_M5Q+MJvd6RJjeYNMmf3WgnGkUBKhp3v8BU67CaaKokrA@mail.gmail.com>
Subject: Re: [PATCH 27/37] drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc
 abuse
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
Cc: David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
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
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:257: warning: Th=
is comment starts with '/**', but isn't a kernel-doc comment. Refer Documen=
tation/doc-guide/kernel-doc.rst
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Zhang <dingchen.zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/=
drm/amd/display/dc/dce/dmub_psr.c
> index 27b8f3435d86f..9705d8f883825 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -253,7 +253,7 @@ static void dmub_psr_set_level(struct dmub_psr *dmub,=
 uint16_t psr_level, uint8_
>         dc_dmub_srv_wait_idle(dc->dmub_srv);
>  }
>
> -/**
> +/*
>   * Set PSR vtotal requirement for FreeSync PSR.
>   */
>  static void dmub_psr_set_sink_vtotal_in_psr_active(struct dmub_psr *dmub=
,
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
