Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CE772B28
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B06B10E2DC;
	Mon,  7 Aug 2023 16:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D392610E2DB;
 Mon,  7 Aug 2023 16:38:01 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bceaed7abbso1806254a34.0; 
 Mon, 07 Aug 2023 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426281; x=1692031081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtzkyKDB15+3Mt70/7SpzjEUZ2ea1IYU12fbFIu9dOM=;
 b=H7ynB/gPElacr7v8xHKXcLr1yAlNCZdxr5nU8mrd8AMeaV8YijEoQ117HBPKbJR2kz
 S7wLd51gynS2JAIY6OMoZuoRC7yVkIB0j0dDdzQ3U0CkRBnwCHAv7lxQcQ/BIjukvFkf
 SmHVyZHfpCInLwBwCRcGuPC0MLWBGXMvSqFq+/khGupKkMCwSX7VT69iEMAcwMVnZh93
 /xkuFbqgGaEvNkEpjr8GHQiADEvZTeOBfSA10oWNUJ8VZGzlO6R+ABN729bkPAk14/gj
 keYGGb4XNW6d6HoUj+IYFnTIOrR/h31l1veYQYJG3T8ExGtK4CKcGjC6ytcmlTwPYLP8
 xFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426281; x=1692031081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtzkyKDB15+3Mt70/7SpzjEUZ2ea1IYU12fbFIu9dOM=;
 b=OTt+LSJ1owW+XLnJXQO4v7BoD0lKLED8TzMzbbwI8zI2l1GyWFSw8/GorycyPGl1de
 PiF4hlphCYq99chC+gu0Ya6WmcEwVQuIJ75S6eLe10Mphv4FunweZBsSvTUxJ6Ls9yMr
 MiXZBSIto+AESpcMgg+Wqfhj8OhOpbL4wef5+CErawk38l2cTz7ubny58Yb4XNP/PWvT
 1golIR+8HVMTCz2CrXoGYd8piQrVml6xaNGtIC4PuPJuQTNl/ofIvUGSbHkOop3Bjesd
 lTZr32lArVx8PEIdug8CzIK2lnbIEDKDio4TdHEaCzJKlgO1WpkuaqqukbSCHL7sHQVY
 +z+A==
X-Gm-Message-State: AOJu0YztSleAImfSvrhuT4gW0IpQ0FdD5ccnZBwul5Av1iTs5Ex2NnEN
 DcfjwRzPg8D5Q6JTPtMqcfpVQJak5e5HuoHMtgk=
X-Google-Smtp-Source: AGHT+IE8ONW21pbbjXSZYEQ4gzJQbgPMlPYnptto6HsDJxOhmFEM3i4JpJxz2crBEhwO2JR3T51qw1YZPj5lwnogFAw=
X-Received: by 2002:a05:6871:89e:b0:1b3:eec8:fa90 with SMTP id
 r30-20020a056871089e00b001b3eec8fa90mr12937916oaq.6.1691426281110; Mon, 07
 Aug 2023 09:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230801083710.6738-1-sunran001@208suo.com>
In-Reply-To: <20230801083710.6738-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:37:50 -0400
Message-ID: <CADnq5_M7j0McrtPf6Zj=f_sxMLUOXgfWUmc-12NOjQ-+gFs14A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in ppatomctrl.h
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 4:37=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> index b3103bd4be42..1f987e846628 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
> @@ -278,16 +278,14 @@ struct pp_atom_ctrl__avfs_parameters {
>         uint8_t  ucReserved;
>  };
>
> -struct _AtomCtrl_HiLoLeakageOffsetTable
> -{
> +struct _AtomCtrl_HiLoLeakageOffsetTable {
>      USHORT usHiLoLeakageThreshold;
>      USHORT usEdcDidtLoDpm7TableOffset;
>      USHORT usEdcDidtHiDpm7TableOffset;
>  };
>  typedef struct _AtomCtrl_HiLoLeakageOffsetTable AtomCtrl_HiLoLeakageOffs=
etTable;
>
> -struct _AtomCtrl_EDCLeakgeTable
> -{
> +struct _AtomCtrl_EDCLeakgeTable {
>      ULONG DIDT_REG[24];
>  };
>  typedef struct _AtomCtrl_EDCLeakgeTable AtomCtrl_EDCLeakgeTable;
> --
> 2.17.1
>
