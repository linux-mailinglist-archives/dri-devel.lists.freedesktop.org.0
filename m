Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3A75CCD1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8AC10E6B7;
	Fri, 21 Jul 2023 15:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178710E6B7;
 Fri, 21 Jul 2023 15:58:00 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1a1fa977667so1574900fac.1; 
 Fri, 21 Jul 2023 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689955079; x=1690559879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZeUxWgbZbQOOu9zXQEd/H5BFiiNhJpxf25MCPQVsN8=;
 b=MUMpaDMWH5he4qGhTVt7ozEMWcR7DMqcNO6xs7rfA48c7LYr9BpeQdWzSiscdSq/hc
 EvrPAIhe9fAewXoibGXavDXBGIDA2kU2VFfETITSld9Uc/iCHNUAvy9f1gXuv9TJoCuZ
 QaoWRLlfkycCNCA64SVz80bBILvNczGOxPSNA4gnKqoWrC3kiJAwPRRovB/200jupVrH
 ibtU3wwjszBsW7HymyuwDOW04KioZzANfyYSVpYN1aG4+06Dga+5UbQdJwDHLf38Uo8t
 kLySeB/lILj2pdpZmQlUNsQjOOuxJ/VSZU7iuAvV/HVpo08golw6nXTIwwjiRLkA9feM
 NrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689955079; x=1690559879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZeUxWgbZbQOOu9zXQEd/H5BFiiNhJpxf25MCPQVsN8=;
 b=f9ZW5rZ0c/+wjW74psbbkGmjsC6XuhWZeZqCWk5HFYBa8wqM2C0FeUYkJIG7t6nLIC
 /AWo16+r7FxWln6t2UOGWfE8aVCNlRyhIBF0CpuH9NCdchgHUuZ08KIIaOAjsy+RP7Qk
 qsw4s4bgYIX0/EfZXHAapISoAtO69mg89eZOZ1MaZaEZv0NnHDl0jArNCwbS4MQFDJMV
 jDByrsq3uI4/zQjuRfltzPuzdpIzPGZVC9wWx4f2W+of0NUP9K6z9IBDNfFIHcxZyYFh
 m2pMD4lZNsDT5BWCiLrLAoja70wS+scAz8SZRtGQDq3uV6W86sFwMO4TY+3gAVdljlJG
 Mb1A==
X-Gm-Message-State: ABy/qLZ0JibzzU33zlVw3CrRNGtYbkZH1CtYI0ewFjwmlBYvLKx8Tf7t
 QAlh9za/AqDrKrEqc1u5jZy/WzulRTCOoF+6DcmsD/us
X-Google-Smtp-Source: APBJJlH444C8IPtwpejKuE6GYLqPtYKQIDgpO4RYWXSo+9vxTzDLITTa4MyNdiFO8dR1GpO8+vWqmwKb/wVp0tgirGE=
X-Received: by 2002:a05:6870:eaa3:b0:1b0:b15:245 with SMTP id
 s35-20020a056870eaa300b001b00b150245mr2852819oap.16.1689955079677; Fri, 21
 Jul 2023 08:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230721033048.4840-1-xujianghui@cdjrlc.com>
 <d0906df99cdf6f76220e298bebaa5029@208suo.com>
In-Reply-To: <d0906df99cdf6f76220e298bebaa5029@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 11:57:48 -0400
Message-ID: <CADnq5_P0hQbv81OnSjp7_RS92yOMzuNQfJZf_DKY7K_viSz5Vw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: open brace '{' following struct go on the
 same line
To: sunran001@208suo.com
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jul 20, 2023 at 11:32=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
> b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
> index 52045ad59bed..eec816f0cbf9 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h
> @@ -24,8 +24,7 @@
>   #ifndef __AMDGPU_PM_H__
>   #define __AMDGPU_PM_H__
>
> -struct cg_flag_name
> -{
> +struct cg_flag_name {
>         u64 flag;
>         const char *name;
>   };
