Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2928D6DB209
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 19:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152F810E28B;
	Fri,  7 Apr 2023 17:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B138210E124
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 17:49:56 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a51d48b25fso684535ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680889796; x=1683481796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YOYR5yl6ypiXPPEsw9LGpTcARLtmR0joIO+5Gy/Ym7k=;
 b=gSjbHOfHvFZTwg2Y8sJqAABr4qbOs+k2r0fQ+0VSOZk6KDkWrDRTPyg4C52MCNHNE1
 mBU7V9D/2Md0WXYZkvllimMI1smpQ1C1kFfkReM4r8ktSoI3kxRfchhJRzDwgRFuoOlt
 vbOvICGQVOBv1Qn70leZLT6df/AwluazWABijBn2vcVMO1zE/lo9kQiJeI00WteSuQzO
 4E7JC3dixEOti4CtUDh751L3OUzUjfxsuq57/AW2RnR6Le3p9lCuvLXaMRlsFskWX/9J
 owh1Fitcsrv4fXxFYKplshFL978dzQ3D+fBn9bMuWz/gIKi76FWckOOCuAdt9sSYV7S2
 Fb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680889796; x=1683481796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YOYR5yl6ypiXPPEsw9LGpTcARLtmR0joIO+5Gy/Ym7k=;
 b=MsAYd10TzFByCJ8bOtvTQ4CO5Mz/pnZsmMXVo/nQwTzeHyQMMbiz8VBncB463YvOds
 a0keusOOXcybzus0LNo6c/t+tItASg0jpoHgHrSdU1tRw47FJDszSEZZCPpc1dT9D0H7
 QX4iniBTUesVjOI2H8L8efg/rLRdOGIbxGVMTsvZI5bN5IQus8o/7e6auV/MBpLvCJqG
 k73/OGLtvvEnYTXiQtX+/E26vSgLaE2YzJDUYweOGwM1hu7F5EDEIKU2zabepWSZKORH
 6GyXpi7/m/Zjs7KqUfwRwkwB5s0SH9MisoSKC6KAwAHPakzVVI/OTMcQq5A1N2/GNULj
 3vZw==
X-Gm-Message-State: AAQBX9esTUXXFjmKJoEyMmqAnw5j4OOFMhaqvM36SxQuCMDjDCspGGZ6
 suMMW3G6wEUHuRC23htSHg9FGXTbJWq0xwVrhk90Ag==
X-Google-Smtp-Source: AKy350YcyBmqWjxSDZIDUgohnwuC5OCKa+DcG7pxNN+qXdDBC9rHkNcGfLqqt8MDPERyF6go6jpkdZN6egNSE+y9cQE=
X-Received: by 2002:a05:6a00:2d88:b0:625:c832:6a10 with SMTP id
 fb8-20020a056a002d8800b00625c8326a10mr1535733pfb.4.1680889795599; Fri, 07 Apr
 2023 10:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230324195403.2655148-1-trix@redhat.com>
In-Reply-To: <20230324195403.2655148-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:49:44 -0700
Message-ID: <CAKwvOdndQiSbMK6a7nU01HiovY-Bdjt4m4gOO5m5A36y8qQ8=A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
To: Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 12:54=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:716:21: error: unused function
>   'mksstat_init_record' [-Werror,-Wunused-function]
> static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
>                     ^
> This function is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_msg.c
> index e76976a95a1e..ca1a3fe44fa5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -702,32 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
>  /* Header to the text description of mksGuestStat instance descriptor */
>  #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
>
> -/**
> - * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
> - * for the respective mksGuestStat index.
> - *
> - * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record=
.
> - * @pstat: Pointer to array of MKSGuestStatCounterTime.
> - * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
> - * @pstrs: Pointer to current end of the name/description sequence.
> - * Return: Pointer to the new end of the names/description sequence.
> - */
> -
> -static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
> -       MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, cha=
r *pstrs)
> -{
> -       char *const pstrd =3D pstrs + strlen(mksstat_kern_name_desc[stat_=
idx][0]) + 1;
> -       strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
> -       strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
> -
> -       pinfo[stat_idx].name.s =3D pstrs;
> -       pinfo[stat_idx].description.s =3D pstrd;
> -       pinfo[stat_idx].flags =3D MKS_GUEST_STAT_FLAG_NONE;

This was the last user of MKS_GUEST_STAT_FLAG_NONE, is there anything
else to clean up there?  Otherwise LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> -       pinfo[stat_idx].stat.counter =3D (MKSGuestStatCounter *)&pstat[st=
at_idx];
> -
> -       return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
> -}
> -
>  /**
>   * mksstat_init_record_time: Initializes an MKSGuestStatCounterTime-base=
d record
>   * for the respective mksGuestStat index.
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
